Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701AE7E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 08:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693816693; x=1725352693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKNX9goHoPzKgKbqx4eYd3xo/cSTqAIxbQ33umwet3E=;
  b=i49n/YQulmc2F3alBZwW7lusgiEodBbee/sV/ifG8fI4tdDjz58f5K99
   6wYMN/Qy4JB7htuPunbrItWRW2EevvfvpaEdiKaL4aqdbGyyzqoTL67co
   dJwzk4QsHr9t6xexAZzfBp1tj2+Rs91kafcZznVc/15M7SmhSMMmCFA/1
   gQ1tgaKAg87w0vU9meRND/Nt6gMtliK1wFlxQJvvBpqwdDGzn022UHJxp
   j3pqhHbZ1PmFqylch2xeTGpPfrp59rmaL6PSn8YiADc78NiqmJaTD2uEZ
   qrSw/+C1hIZrr7l/qphCGCx+adzdVtFJPO2Np8UFFsvZUghMSHJYW2t8r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="462917152"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="462917152"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 01:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="717473406"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="717473406"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Sep 2023 01:38:10 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd55z-0000Hb-36;
	Mon, 04 Sep 2023 08:38:07 +0000
Date: Mon, 4 Sep 2023 16:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
	"Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Subject: [intel-lts:6.1/linux 2282/2351]
 drivers/gpu/drm/i915/display/intel_color.c:2736:6: warning: variable 'index'
 set but not used
Message-ID: <202309041618.nAejrnsX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   18d00276e43669d12070546d738df98b52a0fbbf
commit: 39aeda76272f7019031c141962575f459e680b91 [2282/2351] drm/i915/xelpd: Add support for Logarithmic gamma mode
config: i386-randconfig-r022-20230904 (https://download.01.org/0day-ci/archive/20230904/202309041618.nAejrnsX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041618.nAejrnsX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041618.nAejrnsX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_color.c:2736:6: warning: variable 'index' set but not used [-Wunused-but-set-variable]
           u32 index = 0;
               ^
   1 warning generated.


vim +/index +2736 drivers/gpu/drm/i915/display/intel_color.c

  2729	
  2730	static int icl_color_check(struct intel_crtc_state *crtc_state)
  2731	{
  2732		struct drm_device *dev = crtc_state->uapi.crtc->dev;
  2733		struct drm_i915_private *dev_priv = to_i915(dev);
  2734		struct drm_property *property = crtc_state->uapi.crtc->gamma_mode_property;
  2735		struct drm_property_enum *prop_enum;
> 2736		u32 index = 0;
  2737		int ret;
  2738	
  2739		ret = check_luts(crtc_state);
  2740		if (ret)
  2741			return ret;
  2742	
  2743		if (DISPLAY_VER(dev_priv) >= 13) {
  2744			list_for_each_entry(prop_enum, &property->enum_list, head) {
  2745				if (prop_enum->value == crtc_state->uapi.gamma_mode) {
  2746					if (!strcmp(prop_enum->name,
  2747						    "logarithmic gamma")) {
  2748						crtc_state->uapi.gamma_mode_type =
  2749							GAMMA_MODE_LOGARITHMIC_12BIT;
  2750						drm_dbg_kms(dev,
  2751							    "logarithmic gamma enabled\n");
  2752					}
  2753					break;
  2754				}
  2755				index++;
  2756			}
  2757		}
  2758	
  2759		crtc_state->gamma_mode = icl_gamma_mode(crtc_state);
  2760	
  2761		crtc_state->csc_mode = icl_csc_mode(crtc_state);
  2762	
  2763		intel_assign_luts(crtc_state);
  2764	
  2765		icl_assign_csc(crtc_state);
  2766	
  2767		crtc_state->preload_luts = intel_can_preload_luts(crtc_state);
  2768	
  2769		return 0;
  2770	}
  2771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
