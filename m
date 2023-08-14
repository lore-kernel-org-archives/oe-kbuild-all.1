Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7ABC8D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692033511; x=1723569511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sO3WX8wlJahUoRZaVdcgsisUv68Chd4vwB0UvXsgsAI=;
  b=WYohomme/xuY2c4rjnQTcMha5gcez9aen/zLqZOxR45zK2R6tDhzPHC2
   3EqOp9WzFcmMaIn3cDrxIhqqUvPNOYWBY0yGOEYoy+rIJL5yswAUFJxq+
   ShFl5DP6AqXO2jLGnBPs5HduaIKPpx3XriZcP364ARlHVqpHs4VZMuFro
   Yw4n98GPPYgCvwh/jYI3/EJKCucan7UFQLNQkyH26sJ4PIjKrvx+jXrG1
   gQwCqnjHnsKPDiI9BvRuatqfoZA5TwZmqadMObG0Z3sLZYqNYGYe4Nwe8
   Sb0/OoB7QIrsbW+EtCVv0kYKCgjGBSRGk9ZURzg22h8I3kF4/tVz53Glk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403077458"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="403077458"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 10:18:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="857149750"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="857149750"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Aug 2023 10:18:29 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVbD2-0000JD-10;
	Mon, 14 Aug 2023 17:18:28 +0000
Date: Tue, 15 Aug 2023 01:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 06/13] drm/connector: hdmi: Add support for output
 format
Message-ID: <202308150157.wnJQ3VHE-lkp@intel.com>
References: <20230814-kms-hdmi-connector-state-v1-6-048054df3654@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-6-048054df3654@kernel.org>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-Introduce-an-HDMI-connector/20230814-215852
base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
patch link:    https://lore.kernel.org/r/20230814-kms-hdmi-connector-state-v1-6-048054df3654%40kernel.org
patch subject: [PATCH RFC 06/13] drm/connector: hdmi: Add support for output format
config: csky-randconfig-r002-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150157.wnJQ3VHE-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150157.wnJQ3VHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150157.wnJQ3VHE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_hdmi_connector.c:242:1: warning: no previous prototype for 'drm_hdmi_connector_get_output_format_name' [-Wmissing-prototypes]
     242 | drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_hdmi_connector_get_output_format_name +242 drivers/gpu/drm/drm_hdmi_connector.c

   233	
   234	/*
   235	 * drm_hdmi_connector_get_output_format_name() - Return a string for HDMI connector output format
   236	 * @fmt: Output format to compute name of
   237	 *
   238	 * Returns: the name of the output format, or NULL if the type is not
   239	 * valid.
   240	 */
   241	const char *
 > 242	drm_hdmi_connector_get_output_format_name(enum hdmi_colorspace fmt)
   243	{
   244		if (fmt >= ARRAY_SIZE(output_format_str))
   245			return NULL;
   246	
   247		return output_format_str[fmt];
   248	}
   249	EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
