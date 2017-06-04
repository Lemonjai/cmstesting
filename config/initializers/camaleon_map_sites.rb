Rails.application.config.to_prepare do
  CamaleonCms::SiteHelper.module_eval do
    def cama_current_site_helper(args)
      if !args[:site].present? && request.present?
        args[:site] =
            case request.original_url.to_s.parse_domain
              when 'localhost:3000'
                CamaleonCms::Site.find_by_slug('localhost:3000').decorate
              when 'https://aqueous-caverns-26982.herokuapp.com/'
                CamaleonCms::Site.find_by_slug('https://aqueous-caverns-26982.herokuapp.com/').decorate
            end
      end
    end
  end
end