Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C04B04B1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 04:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786076500; cv=none; b=Cq2kPlzSQ8GSaAGIZUq9OjhlmhDal7VflHGwtbcrkxXHe6ra4ZQqpwlrSC845uRHjd2T33hDDuL6hllvfbhvVriQ81s23zWcZwGgidD2mJ69qPueV10STMYae5/FIMmeRNeGLWPvVG+0gWiXtcSKIhp/OpoNjkGl9f4QTItkBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786076500; c=relaxed/simple;
	bh=9tPJ6yoKr1KXBI5X9EBq2u9DlmLUjnL28ycxh3FzCxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JbeGfEI/qUuLAktWXehWdNjQiq6mnvqENQbXsT2Iz7oOE3f7DFfKFpTrbCcNjng/um1hF39F8EE/ovQVz80rxojfMt/2j5c6wm5skXdsbd6vZgqZSH0xgioGxj7ItGHRfj45IX5+87lNJdSjXrteYpyRjkZxh/cc3zy4vLsWHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjVKZP/7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjVKZP/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786076498; x=1817612498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9tPJ6yoKr1KXBI5X9EBq2u9DlmLUjnL28ycxh3FzCxI=;
  b=fjVKZP/7duJ5yfD9lH5yAKFvlDE/lCxNe/W1buFiSuxFYPDgr31+JxHh
   qp/2GClPnEnFDglwqzETAs6Fw646i9pn3hTiXDvs4lNYZDGi4OrebHvtN
   sXGWIZS0IYqW4/3Ab0h/FdcSNKtXZWI6OIJ3Bed6x21Nz0NLuKn1mhuMf
   kWCNi3HS0ZjOcC8rbLek7thLdrz0xGxWt+FB2s4Me1eVZKBUALexxIcXk
   S5cHop+2tzWboQYlDoBFV29j6J+zsomp9AbF40p+9AtxWXHeJh51J5cyQ
   HzeAd/s7ffNrk++A3D5vFD6a5YRVAYHF+3xpDVTkTMunmSZrESaX3vv5p
   w==;
X-CSE-ConnectionGUID: OzB1eHC9QNKLO/0Xt0Gf4g==
X-CSE-MsgGUID: xW48oDAuTymCIOHO6GmNJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86888331"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86888331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 21:21:37 -0700
X-CSE-ConnectionGUID: aHauOoN4SP+qheKEENLg/Q==
X-CSE-MsgGUID: 5GwkxLpqQKCONrqRGOQr1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="259675991"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2026 21:21:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsC5M-00000000H97-42dn;
	Fri, 07 Aug 2026 04:21:32 +0000
Date: Fri, 7 Aug 2026 12:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, animesh.manna@intel.com,
	uma.shankar@intel.com
Subject: Re: [PATCH 1/1] drm/i915/display/psr: Block DC3CO entry during
 active frame
Message-ID: <202608071251.Vu1OuiIn-lkp@intel.com>
References: <20260630085928.1317279-2-dibin.moolakadan.subrahmanian@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630085928.1317279-2-dibin.moolakadan.subrahmanian@intel.com>

Hi Dibin,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next-fixes]
[also build test ERROR on linus/master v7.2-rc6]
[cannot apply to drm-i915/for-linux-next drm-tip/drm-tip next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dibin-Moolakadan-Subrahmanian/drm-i915-display-psr-Block-DC3CO-entry-during-active-frame/20260807-084438
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20260630085928.1317279-2-dibin.moolakadan.subrahmanian%40intel.com
patch subject: [PATCH 1/1] drm/i915/display/psr: Block DC3CO entry during active frame
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608071251.Vu1OuiIn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071251.Vu1OuiIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071251.Vu1OuiIn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_psr.c: In function 'intel_psr_enable_source':
>> drivers/gpu/drm/i915/display/intel_psr.c:2201:21: error: implicit declaration of function 'HAS_DC3CO'; did you mean 'HAS_DSC'? [-Wimplicit-function-declaration]
    2201 |                 if (HAS_DC3CO(display) &&
         |                     ^~~~~~~~~
         |                     HAS_DSC


vim +2201 drivers/gpu/drm/i915/display/intel_psr.c

  2081	
  2082	static void intel_psr_enable_source(struct intel_dp *intel_dp,
  2083					    const struct intel_crtc_state *crtc_state)
  2084	{
  2085		struct intel_display *display = to_intel_display(intel_dp);
  2086		enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
  2087		u32 mask = 0;
  2088	
  2089		/*
  2090		 * Only HSW and BDW have PSR AUX registers that need to be setup.
  2091		 * SKL+ use hardcoded values PSR AUX transactions
  2092		 */
  2093		if (DISPLAY_VER(display) < 9)
  2094			hsw_psr_setup_aux(intel_dp);
  2095	
  2096		/*
  2097		 * Per Spec: Avoid continuous PSR exit by masking MEMUP and HPD also
  2098		 * mask LPSP to avoid dependency on other drivers that might block
  2099		 * runtime_pm besides preventing  other hw tracking issues now we
  2100		 * can rely on frontbuffer tracking.
  2101		 *
  2102		 * From bspec prior LunarLake:
  2103		 * Only PSR_MASK[Mask FBC modify] and PSR_MASK[Mask Hotplug] are used in
  2104		 * panel replay mode.
  2105		 *
  2106		 * From bspec beyod LunarLake:
  2107		 * Panel Replay on DP: No bits are applicable
  2108		 * Panel Replay on eDP: All bits are applicable
  2109		 */
  2110		if (DISPLAY_VER(display) < 20 || intel_dp_is_edp(intel_dp))
  2111			mask = EDP_PSR_DEBUG_MASK_HPD;
  2112	
  2113		if (intel_dp_is_edp(intel_dp)) {
  2114			mask |= EDP_PSR_DEBUG_MASK_MEMUP;
  2115	
  2116			/*
  2117			 * For some unknown reason on HSW non-ULT (or at least on
  2118			 * Dell Latitude E6540) external displays start to flicker
  2119			 * when PSR is enabled on the eDP. SR/PC6 residency is much
  2120			 * higher than should be possible with an external display.
  2121			 * As a workaround leave LPSP unmasked to prevent PSR entry
  2122			 * when external displays are active.
  2123			 */
  2124			if (DISPLAY_VER(display) >= 8 || display->platform.haswell_ult)
  2125				mask |= EDP_PSR_DEBUG_MASK_LPSP;
  2126	
  2127			if (DISPLAY_VER(display) < 20)
  2128				mask |= EDP_PSR_DEBUG_MASK_MAX_SLEEP;
  2129	
  2130			/*
  2131			 * No separate pipe reg write mask on hsw/bdw, so have to unmask all
  2132			 * registers in order to keep the CURSURFLIVE tricks working :(
  2133			 */
  2134			if (IS_DISPLAY_VER(display, 9, 10))
  2135				mask |= EDP_PSR_DEBUG_MASK_DISP_REG_WRITE;
  2136	
  2137			/* allow PSR with sprite enabled */
  2138			if (display->platform.haswell)
  2139				mask |= EDP_PSR_DEBUG_MASK_SPRITE_ENABLE;
  2140		}
  2141	
  2142		intel_de_write(display, psr_debug_reg(display, cpu_transcoder), mask);
  2143	
  2144		psr_irq_control(intel_dp);
  2145	
  2146		/*
  2147		 * TODO: if future platforms supports DC3CO in more than one
  2148		 * transcoder, EXITLINE will need to be unset when disabling PSR
  2149		 */
  2150		if (intel_dp->psr.dc3co_exitline)
  2151			intel_de_rmw(display,
  2152				     TRANS_EXITLINE(display, cpu_transcoder),
  2153				     EXITLINE_MASK,
  2154				     intel_dp->psr.dc3co_exitline << EXITLINE_SHIFT | EXITLINE_ENABLE);
  2155	
  2156		if (HAS_PSR_HW_TRACKING(display) && HAS_PSR2_SEL_FETCH(display))
  2157			intel_de_rmw(display, CHICKEN_PAR1_1, IGNORE_PSR2_HW_TRACKING,
  2158				     intel_dp->psr.psr2_sel_fetch_enabled ?
  2159				     IGNORE_PSR2_HW_TRACKING : 0);
  2160	
  2161		/*
  2162		 * Wa_16013835468
  2163		 * Wa_14015648006
  2164		 */
  2165		wm_optimization_wa(intel_dp, crtc_state);
  2166	
  2167		if (intel_dp->psr.sel_update_enabled) {
  2168			if (DISPLAY_VER(display) == 9)
  2169				intel_de_rmw(display, CHICKEN_TRANS(display, cpu_transcoder), 0,
  2170					     PSR2_VSC_ENABLE_PROG_HEADER |
  2171					     PSR2_ADD_VERTICAL_LINE_COUNT);
  2172	
  2173			/*
  2174			 * Wa_16014451276:adlp,mtl[a0,b0]
  2175			 * All supported adlp panels have 1-based X granularity, this may
  2176			 * cause issues if non-supported panels are used.
  2177			 */
  2178			if (!intel_dp->psr.panel_replay_enabled &&
  2179			    (IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_B0) ||
  2180			     display->platform.alderlake_p))
  2181				intel_de_rmw(display, CHICKEN_TRANS(display, cpu_transcoder),
  2182					     0, ADLP_1_BASED_X_GRANULARITY);
  2183	
  2184			/* Wa_16012604467:adlp,mtl[a0,b0] */
  2185			if (!intel_dp->psr.panel_replay_enabled &&
  2186			    IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_B0))
  2187				intel_de_rmw(display,
  2188					     MTL_CLKGATE_DIS_TRANS(display, cpu_transcoder),
  2189					     0,
  2190					     MTL_CLKGATE_DIS_TRANS_DMASC_GATING_DIS);
  2191			else if (display->platform.alderlake_p)
  2192				intel_de_rmw(display, CLKGATE_DIS_MISC, 0,
  2193					     CLKGATE_DIS_MISC_DMASC_GATING_DIS);
  2194	
  2195			/*
  2196			 * HSD: 14026643300
  2197			 * On Xe3P+, restrict DC3CO entry during active frame when PSR2 is
  2198			 * enabled without panel Early Transport; required to avoid pipe bad state.
  2199			 * DMC honours CHICKEN_DCPR_4 bit 24 to block DC3CO entry during active frame.
  2200			 */
> 2201			if (HAS_DC3CO(display) &&
  2202			    !intel_dp->psr.panel_replay_enabled &&
  2203			    !intel_dp->psr.su_region_et_enabled)
  2204				intel_de_rmw(display, XE3LPD_CHICKEN_DCPR_4,
  2205					     0, DCPR4_BLOCK_DC3CO_ACTIVE_FRAME);
  2206		}
  2207	
  2208		/* Wa_16025596647 */
  2209		if ((DISPLAY_VER(display) == 20 ||
  2210		     IS_DISPLAY_VERx100_STEP(display, 3000, STEP_A0, STEP_B0)) &&
  2211		    !intel_dp->psr.panel_replay_enabled)
  2212			intel_dmc_block_pkgc(display, intel_dp->psr.pipe, true);
  2213	
  2214		intel_alpm_configure(intel_dp, crtc_state);
  2215	
  2216		if (HAS_PSR_TRANS_PUSH_FRAME_CHANGE(display))
  2217			intel_vrr_psr_frame_change_enable(crtc_state);
  2218	}
  2219	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
