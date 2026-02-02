class PagesController < ApplicationController
  def home
    set_meta_tags(
      title: "디자인 구독 서비스 (구독형 / 무제한)",
      site: "디자인케어",
      description: "채용보다 효율적인 디자인 구독 서비스, 필요한 디자인을 무제한 요청하세요. 구독형으로 비용 절감과 퀄리티를 함께 높여드립니다.",
      og: {
        title: "디자인케어 | 디자인 구독 서비스 (구독형 / 무제한)",
        description: "채용보다 효율적인 디자인 구독 서비스, 필요한 디자인을 무제한 요청하세요. 구독형으로 비용 절감과 퀄리티를 함께 높여드립니다.",
        type: "website",
        url: "https://www.designcare.io/",
        site_name: "디자인케어"
      },
      twitter: {
        card: "summary_large_image",
        title: "디자인케어 | 디자인 구독 서비스 (구독형 / 무제한)",
        description: "채용보다 효율적인 디자인 구독 서비스, 필요한 디자인을 무제한 요청하세요. 구독형으로 비용 절감과 퀄리티를 함께 높여드립니다."
      }
    )
  end
end
