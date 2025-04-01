from django.http import JsonResponse
from django.core.paginator import Paginator
from population.models import PopulationData, Provinces
import json

def populationAPI(request):
    # 获取请求参数
    year = request.GET.get('year')
    province_name = request.GET.get('province')
    page = request.GET.get('page', 1)  # 默认第一页
    page_size = request.GET.get('page_size', 10)  # 默认每页10条

    # 查询数据
    queryset = PopulationData.objects.all()

    if year:
        queryset = queryset.filter(year=year)
    if province_name:
        try:
            province = Provinces.objects.get(province_name=province_name)
            queryset = queryset.filter(province=province)
        except Provinces.DoesNotExist:
            return JsonResponse({"error": "Province not found"}, status=404)

    # 分页
    paginator = Paginator(queryset, page_size)
    try:
        page_obj = paginator.page(page)
    except Exception as e:
        return JsonResponse({"error": "Invalid page number"}, status=400)

    # 构造返回数据
    data = {
        "total_pages": paginator.num_pages,
        "current_page": page_obj.number,
        "data": [
            {
                "province": item.province.province_name,
                "year": item.year,
                "total_population": item.total,
                "birth_rate": item.birth_rate,
                "death_rate": item.death_rate,
                "natural_growth_rate": item.nature_growth_rate,
                "male_population": item.man,
                "female_population": item.woman,
            }
            for item in page_obj.object_list
        ]
    }

    return JsonResponse(data)