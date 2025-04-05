from django.http import JsonResponse
from population.models import Provinces, PopulationData, GDPData

def populationAPI(request):
    # 获取请求参数
    year = request.GET.get('year')
    province_name = request.GET.get('province')

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

    # 构造返回数据（不进行分页）
    data = {
        "data": [
            {
                "province": item.province.province_name,
                "year": item.year,
                "total_population": item.total,
                "birth_rate": item.birth_rate,
                "death_rate": item.death_rate,
                "natural_growth_rate": item.nature_growth_rate,
                'city_population': item.city,
                'country_population': item.country,
                "male_population": item.man,
                "female_population": item.woman,
            }
            for item in queryset  # 返回全部数据
        ]
    }

    return JsonResponse(data)


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

    # 构造返回数据（不进行分页）
    data = {
        "data": [
            {
                "province": item.province.province_name,
                "year": item.year,
                "gdp": item.gdp,
            }
            for item in queryset  # 返回全部数据
        ]
    }

    return JsonResponse(data)