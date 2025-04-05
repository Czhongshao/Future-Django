# population/api/gdpAPI.py
from django.http import JsonResponse
from population.models import GDPData, Provinces

def gdpAPI(request):
    # 获取请求参数
    year = request.GET.get('year')
    province_name = request.GET.get('province')

    # 查询数据
    queryset = GDPData.objects.all()

    if year:
        queryset = queryset.filter(year=year)
    if province_name:
        try:
            province = Provinces.objects.get(province_name=province_name)
            queryset = queryset.filter(province=province)
        except Provinces.DoesNotExist:
            return JsonResponse({"error": "Province not found"}, status=404)

    # 构造返回数据
    data = [
        {
            "province": item.province.province_name,
            "year": item.year,
            "gdp": item.gdp,
        }
        for item in queryset
    ]

    return JsonResponse({"data": data})