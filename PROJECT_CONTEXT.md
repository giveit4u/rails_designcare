# 디자인케어 SEO 보존 및 순위 유지 데이터 맵

# 마지막 업데이트: 2026-01-31

# [핵심 키워드] 검색 순위 방어 대상

target_keywords:

- "구독형 디자인", "구독형 디자인 서비스", "구독형 디자인 구독" # 현재 1위 (최우선 방어)
- "디자인 구독" # 현재 15위 (상승 목표)
- "디자인 구독 서비스" # 현재 12위 (상승 목표)
- "구독 디자인" # 현재 15위 (상승 목표)

# [페이지별 상세 태그] Webflow 설정값 완벽 이식

critical_tags:
home_page: # 1번/3번 스크린샷 기준
title: "디자인케어 | 디자인 구독 서비스 (구독형 / 무제한)"
meta_description: "채용보다 효율적인 디자인 구독 서비스, 필요한 디자인을 무제한 요청하세요. 구독형으로 비용 절감과 퀄리티를 함께 높여드립니다."

    # 2번 스크린샷 히어로 섹션 기준 (시맨틱 구조)
    h1: "구독형 | 채용보다 효율적인 디자인 구독 서비스"
    hero_subtext: "채용 부담 없이 월 구독형으로 전담 디자인팀을 고용하세요. 무제한 디자인 요청으로 비용 절감과 브랜드 경쟁력을 동시에 높여드립니다."

    # 캐노니컬 및 오픈그래프 설정
    canonical_url: "https://www.designcare.io/"
    og_tags:
      site_name: "디자인케어"
      title: "디자인케어 | 디자인 구독 서비스 (구독형 / 무제한)"
      description: "채용보다 효율적인 디자인 구독 서비스, 필요한 디자인을 무제한 요청하세요. 구독형으로 비용 절감과 퀄리티를 함께 높여드립니다."
      type: "website"
      url: "https://www.designcare.io/"
      # 이미지 경로 안내 (에이전트가 레일즈 에셋 경로로 변환 필요)
      image_source: "webflow_export/images/og_image.jpg"

# [기술적 헤드 스크립트] 폰트 품질 및 구조화 데이터

head_custom_codes:
font_smoothing_css: | \* {
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
-o-font-smoothing: antialiased;
-webkit-appearance: none;
}

# 구글 검색 결과 풍부한 스니펫 노출용

json_ld_schema:
context: "https://schema.org"
type: "WebSite"
name: "디자인케어"
alternateName: ["designcare", "designcare.io", "Design Care"]
url: "https://www.designcare.io/"

# [안티그래비티 작업 지침]

transformation_rules:

- "모든 <img> 태그는 alt 속성을 필수 포함하며, 위 키워드 중 하나를 문맥에 맞게 삽입할 것."
- "웹플로우의 클래스 네이밍을 유지하여 기존 CSS의 폰트 렌더링 스타일을 보존할 것."
- "레일즈의 meta-tags 젬 적용 시 위 데이터를 기본값으로 설정할 것."
