Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE679381CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYSvdqtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700079624; x=1731615624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lFEXMaI2St69VCwW+bbiDm/b/f0tYb/SBvc5Z2s6mH8=;
  b=JYSvdqtSTgrrCTQOTDIUdnJkbiCGoqxnL7dFBssWOo+JNuB2pl8r/ol/
   nRt50oUSIUszfNTIAdBsODLorjUlxQQ0eKQ/QkXkxt0oA7WAXo94GarQx
   i/VNKVZx+DVTsOkAvLzy36yBoaLbzBphaSIHdFopHPx5AxKfmunLv38YL
   q1ITL3uio+HQciaOgfgGN3TXuz9UA/z+xjqskLROUlV7iA5zIHCBS4stM
   9hSacC0iS+oQYYgLUfCFBC0b1PpAlrrSPEOQCIQyUz7t0+yLUb8MnZukA
   I6+N2KQXtknN36Ir1cgVXEl5h9mRrhAbZn5K+UrVgeYa+jqLI37lCAZj6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="375988898"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="375988898"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 12:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741532516"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="741532516"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2023 12:20:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3MN2-0000n4-1Q;
	Wed, 15 Nov 2023 20:20:20 +0000
Date: Thu, 16 Nov 2023 04:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [RFC 3/3] drm/i915: Compute CMRR and calculate vtotal
Message-ID: <202311160454.ni1YkCWj-lkp@intel.com>
References: <20231115154943.3801663-4-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115154943.3801663-4-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Define-and-compute-Transcoder-CMRR-registers/20231115-235840
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231115154943.3801663-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [Intel-gfx] [RFC 3/3] drm/i915: Compute CMRR and calculate vtotal
config: i386-randconfig-001-20231116 (https://download.01.org/0day-ci/archive/20231116/202311160454.ni1YkCWj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160454.ni1YkCWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160454.ni1YkCWj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `cmrr_get_vtotal':
>> drivers/gpu/drm/i915/display/intel_vrr.c:138: undefined reference to `__divdi3'
   ld: drivers/gpu/drm/i915/display/intel_vrr.c:147: undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +138 drivers/gpu/drm/i915/display/intel_vrr.c

   124	
   125	static unsigned int
   126	cmrr_get_vtotal(struct intel_crtc_state *crtc_state)
   127	{
   128		int multiplier_m = 1, multiplier_n = 1, vtotal;
   129		int actual_refresh_rate, desired_refresh_rate;
   130		long long actual_pixel_rate, adjusted_pixel_rate;
   131		struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
   132	
   133		actual_refresh_rate = DIV_ROUND_UP(adjusted_mode->crtc_clock * 1000,
   134						   adjusted_mode->crtc_htotal) * 1000;
   135		actual_refresh_rate /= adjusted_mode->crtc_vtotal;
   136		desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
   137		actual_pixel_rate = actual_refresh_rate * adjusted_mode->crtc_vtotal;
 > 138		actual_pixel_rate = (actual_pixel_rate * adjusted_mode->crtc_htotal) / 1000;
   139	
   140		if (is_cmrr_frac_required(crtc_state)) {
   141			multiplier_m = 1001;
   142			multiplier_n = 1000;
   143		}
   144	
   145		crtc_state->cmrr.cmrr_n = DIV_ROUND_UP(desired_refresh_rate *
   146				adjusted_mode->crtc_htotal * multiplier_n, multiplier_m) * multiplier_n;
   147		vtotal = DIV_ROUND_UP(actual_pixel_rate * multiplier_n, crtc_state->cmrr.cmrr_n);
   148		adjusted_pixel_rate = actual_pixel_rate * multiplier_m;
   149		crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
   150	
   151		return vtotal;
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
