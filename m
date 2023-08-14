Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B503CBE6B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692035984; x=1723571984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PCqC2DpKBTu4L4O6psX4ABw+VzrS1vdoqSfl7O/CGEs=;
  b=mzB/6SWl5G6jDhs22Up+XEDQIC4fAGqCOWdzuBErDElmmBL3JIjS5Q/e
   aqg8luUdkEH3QH9wXuQKsZ82cSRi71adoQdNXXme0lEeAWE/8G0+gnqkb
   ePcVwlzmAWqBNHEHY8s4H0Zpqi4DPo9RCtcjn6lRp/v1CzyutJSrUZrrN
   Tr5KR9QF8oyE7OhOrdhZOnSHrXPOH6oVHUGrN+R0k/5QaT8vNHK+2mJLf
   sLr1VaGWuFNRuKGIAKsVkVaL9mPqQVLlGzgTTi+w6mgDF2rw1g232MUF0
   jvHA8SpV6BK4GwvfIfamucfS5RHTufZfnlqLrmR0g5wMTvuzhblQ01XI9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438436155"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="438436155"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 10:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877054949"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 10:59:43 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVbqr-0000Kh-34;
	Mon, 14 Aug 2023 17:59:37 +0000
Date: Tue, 15 Aug 2023 01:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 13/13] drm/vc4: hdmi: Switch to HDMI connector
Message-ID: <202308150135.rb2s8Wrp-lkp@intel.com>
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
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230815/202308150135.rb2s8Wrp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150135.rb2s8Wrp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150135.rb2s8Wrp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_mode_needs_scrambling':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:133:85: warning: implicit conversion from 'enum vc4_hdmi_output_format' to 'enum hdmi_colorspace' [-Wenum-conversion]
     133 |         unsigned long long clock = drm_hdmi_connector_compute_mode_clock(mode, bpc, fmt);
         |                                                                                     ^~~
   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_encoder_atomic_mode_set':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1660:33: warning: implicit conversion from 'enum hdmi_colorspace' to 'enum vc4_hdmi_output_format' [-Wenum-conversion]
    1660 |         vc4_hdmi->output_format = hdmi_state->output_format;
         |                                 ^


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
