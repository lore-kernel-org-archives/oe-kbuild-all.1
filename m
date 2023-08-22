Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570661FA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692700044; x=1724236044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ee11cwqX4W0+Q3KhWD524GYeUzlL3nCSHfdPaa8wh3g=;
  b=nkUiKXTgh71iy9oN746uVM3Tj7jfSWXKnL4jpevVPw6toAVEzx+mk306
   X2c8HwM0VELWkx4EIoLPvas0j20D/ctRW+iJlO2icZt0Vp02k6lfHFuEK
   Wvp8fhoj/sa7oSKEsbCiEKuU6+/buty4orsnKWHefoSnVL7E3IaZNLsBy
   S3TEMyxvuhPK0kSrQUsmWs8EC/zJVu2GuxKy6iKSdN6FOp2KXD0bwXxTx
   TAIexcJ0rqqRTNJ2B25ctLaYdPRFEwNwX+jWAkhFw5GDcXpChiB80RrMx
   QbZPZT5HrGt6RR+clsO+I3pL6UtzCP4HZWuaPy6nOuSTU9mimtdLaY30W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372735960"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="372735960"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 03:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982826028"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="982826028"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 03:23:12 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYOXU-00006f-1U;
	Tue, 22 Aug 2023 10:23:09 +0000
Date: Tue, 22 Aug 2023 18:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 13/13] drm/vc4: hdmi: Switch to HDMI connector
Message-ID: <202308221845.y1d76tt9-lkp@intel.com>
References: <20230814-kms-hdmi-connector-state-v1-13-048054df3654@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-13-048054df3654@kernel.org>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-Introduce-an-HDMI-connector/20230814-215852
base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
patch link:    https://lore.kernel.org/r/20230814-kms-hdmi-connector-state-v1-13-048054df3654%40kernel.org
patch subject: [PATCH RFC 13/13] drm/vc4: hdmi: Switch to HDMI connector
config: arc-randconfig-r083-20230818 (https://download.01.org/0day-ci/archive/20230822/202308221845.y1d76tt9-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221845.y1d76tt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221845.y1d76tt9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vc4/vc4_hdmi.c:133:85: sparse: sparse: mixing different enum types:
>> drivers/gpu/drm/vc4/vc4_hdmi.c:133:85: sparse:    unsigned int enum vc4_hdmi_output_format
>> drivers/gpu/drm/vc4/vc4_hdmi.c:133:85: sparse:    unsigned int enum hdmi_colorspace
   drivers/gpu/drm/vc4/vc4_hdmi.c:1660:45: sparse: sparse: mixing different enum types:
   drivers/gpu/drm/vc4/vc4_hdmi.c:1660:45: sparse:    unsigned int enum hdmi_colorspace
   drivers/gpu/drm/vc4/vc4_hdmi.c:1660:45: sparse:    unsigned int enum vc4_hdmi_output_format

vim +133 drivers/gpu/drm/vc4/vc4_hdmi.c

   128	
   129	static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
   130						   unsigned int bpc,
   131						   enum vc4_hdmi_output_format fmt)
   132	{
 > 133		unsigned long long clock = drm_hdmi_connector_compute_mode_clock(mode, bpc, fmt);
   134	
   135		return clock > HDMI_14_MAX_TMDS_CLK;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
