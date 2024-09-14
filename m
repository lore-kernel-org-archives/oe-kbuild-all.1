Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD31FDA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 01:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726277679; cv=none; b=bJ6SmgQ5OvkCJWhJ7mzU5n3UpCfP8DXhx/Snz7I/+O/mDQVJ1y4q3wGDFHh5XlXnxFFrfzCri8cFlZf3r0jxLrO/LjLtJZPwLQIh2mo8Nqdh3XQg2Es6ik5oh7+bPLsqcZEF4I8pKOdWip6iVj8gLMiVKXQ8sWVPQfgwRDOoF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726277679; c=relaxed/simple;
	bh=ytAothRdZM6PpfnKZZUz6/oyAY+iqWHATF/SQJmf4mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/R8W/BrZhXAMRWILnNZhOLLdy6Cwr5OAviOSZnm4ORGNOgACSUet4sWRbtuwmua7+vqiGUJEoOsNp1LWc5Ilc76sXzigBaOYP+JUJ6BkopjdDhNt4Rb7qqYnDpd0Lx3A7q/VfvVoEb5G50pXYR3bmVgYjoQSQMx3OZhJcGc05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP+vgNux; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP+vgNux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726277678; x=1757813678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ytAothRdZM6PpfnKZZUz6/oyAY+iqWHATF/SQJmf4mk=;
  b=GP+vgNuxI1U71JJAsGboUrKwuf1ou/7mRnyVB/osBdf418OQfDBx1JfA
   dqohDfQFAcwbqCGAm5rnXYvWMGFwAWRZQopLFOVIkMeaDWeHKNoEU1KqM
   TxsAt6MEjPbhpKLtFEA9obCjcuEtoyh4hAh2WF0C0ZnfE2cxRptgjhlAP
   LdsVxrMN5SNjBVeW7dfqddUP3SlQs1dPAjZr4AocZVUTQHSscGYyhctoj
   2pjdCWmYPZL5zDZ/2Ilv161IvqGmcQzUfTHG/mFLpUAfl0Zs+pFMWi+fe
   xV1cnOgEKFmKRFwRPHMoy3Id7B+gYzZpjccDg97RxQKZT93u1+v72Oral
   w==;
X-CSE-ConnectionGUID: 84ACGUtAQXq33dVsFI0bRQ==
X-CSE-MsgGUID: S8+PnB/6T8SsMNo2LB/nkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35767076"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35767076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 18:34:37 -0700
X-CSE-ConnectionGUID: SqIqu4poSOe7sdF0RR6aJA==
X-CSE-MsgGUID: KcpgYUarQeixqVRBBQ/V2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="99119408"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Sep 2024 18:34:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spHgG-0007EE-1E;
	Sat, 14 Sep 2024 01:34:32 +0000
Date: Sat, 14 Sep 2024 09:33:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, ville.syrjala@linux.intel.com,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/display: Add block_dc6_needed variable into
 intel_crtc
Message-ID: <202409140953.0izbdQ9U-lkp@intel.com>
References: <20240913073347.3273589-2-jouni.hogander@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913073347.3273589-2-jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240912]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc7 v6.11-rc6 v6.11-rc5 v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-i915-display-Add-block_dc6_needed-variable-into-intel_crtc/20240913-153658
base:   next-20240912
patch link:    https://lore.kernel.org/r/20240913073347.3273589-2-jouni.hogander%40intel.com
patch subject: [PATCH 1/2] drm/i915/display: Add block_dc6_needed variable into intel_crtc
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240914/202409140953.0izbdQ9U-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140953.0izbdQ9U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140953.0izbdQ9U-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_psr.c: In function 'dg2_activate_panel_replay':
>> drivers/gpu/drm/i915/display/intel_psr.c:973:62: error: passing argument 1 of 'intel_crtc_for_pipe' from incompatible pointer type [-Werror=incompatible-pointer-types]
     973 |                 block_dc6_on_vblank_get(&intel_crtc_for_pipe(display, intel_dp->psr.pipe)->base);
         |                                                              ^~~~~~~
         |                                                              |
         |                                                              struct intel_display *
   In file included from drivers/gpu/drm/i915/display/intel_psr.c:32:
   drivers/gpu/drm/i915/display/intel_crtc.h:46:65: note: expected 'struct drm_i915_private *' but argument is of type 'struct intel_display *'
      46 | struct intel_crtc *intel_crtc_for_pipe(struct drm_i915_private *i915,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/intel_crtc_for_pipe +973 drivers/gpu/drm/i915/display/intel_psr.c

   954	
   955	static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
   956	{
   957		struct intel_display *display = to_intel_display(intel_dp);
   958		struct intel_psr *psr = &intel_dp->psr;
   959		enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
   960	
   961		if (intel_dp_is_edp(intel_dp) && psr->sel_update_enabled) {
   962			u32 val = psr->su_region_et_enabled ?
   963				LNL_EDP_PSR2_SU_REGION_ET_ENABLE : 0;
   964	
   965			if (intel_dp->psr.req_psr2_sdp_prior_scanline)
   966				val |= EDP_PSR2_SU_SDP_SCANLINE;
   967	
   968			intel_de_write(display, EDP_PSR2_CTL(display, cpu_transcoder),
   969				       val);
   970		}
   971	
   972		if (intel_dp_is_edp(intel_dp))
 > 973			block_dc6_on_vblank_get(&intel_crtc_for_pipe(display, intel_dp->psr.pipe)->base);
   974	
   975		intel_de_rmw(display,
   976			     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
   977			     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
   978	
   979		intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), 0,
   980			     TRANS_DP2_PANEL_REPLAY_ENABLE);
   981	}
   982	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
