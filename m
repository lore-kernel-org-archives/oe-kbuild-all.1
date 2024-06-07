Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A9BDDD9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717754138; cv=none; b=lZ6/MIoHkswJ+oOcB7MomaSr4wxWXJVi1f+VbDxWkVQyutGoh7CvoXQVUVQcjmvRGqDnHPFAdT80HkVCASMWiAhmkwmvPFE0/uN1GBa0wtzgUWkIGJAfsckjVe30rxA+Avb+mPzTgH1oga0ZCx23l5IOEfjEv+1u+gzfNtJU5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717754138; c=relaxed/simple;
	bh=0QJqjzqlGGJLqFyZ5Yezy17udAsndyPEm0u6FAzfXPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ3+DX8bKLebYb7JZE22RmjcwffVlZzmXfGdHxp7zXWPf5cegBW8D5lrkIFSzWe0QxXSoxGi4O/DcRXBhDCVTpIiNjhqxIVVPd1ak30OdlKXxx8d4SdNITdDG/A14frUeJCe/71WCqEE9e308XxdLk9xhAIX5qtTea6VOj4GqnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLezRAy3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLezRAy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717754136; x=1749290136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0QJqjzqlGGJLqFyZ5Yezy17udAsndyPEm0u6FAzfXPw=;
  b=XLezRAy3s4bM9xpnBE2OyhMet+HFRZW5pzPEn6boI+6s1AJF8B1KnApH
   IngkixZk4bKlN2r8gpNJF7zAl+NRLLxjw33tbItD2Yn9NTwxxDp4J6BUi
   VievwxgtWQLaDF3FHyAPGakP7eVWx2YLQTTJmx34xZCLSMgTHC/DtbvUK
   fnmVp49Is2Ln/W1MnQQSW+Oaxyi4BlmOCEdNIUUHkyqAqQq+eDkwXCiTo
   0VrJHy+NKDBAMO4T81ULefZ2QXUc9nvRh2hVmPrKlrRXo1xlFyJM6p3HN
   TjmnULBvpuC8yLo1MHcldFT9FCpf82Z2Sk8gOmB4WsOeHEhLcpi1v7jDC
   g==;
X-CSE-ConnectionGUID: JQbfs+F6Sq64xfDP8dxIcg==
X-CSE-MsgGUID: 2VBd6VmmTP6Ve1I4A/Nm/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="36995066"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="36995066"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 02:55:35 -0700
X-CSE-ConnectionGUID: ZDV0j4qaQ9aMaRZqBmPG8A==
X-CSE-MsgGUID: TAzF2s+eTDyjgv2h9BpGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38266756"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jun 2024 02:55:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFWJj-0004b4-0q;
	Fri, 07 Jun 2024 09:55:28 +0000
Date: Fri, 7 Jun 2024 17:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 9/9] drm/i915: Compute CMRR and calculate vtotal
Message-ID: <202406071749.cjO2itUi-lkp@intel.com>
References: <20240605170111.494784-10-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605170111.494784-10-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240606]
[cannot apply to drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.10-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/gpu-drm-i915-Update-indentation-for-VRR-registers-and-bits/20240606-011504
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240605170111.494784-10-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v13 9/9] drm/i915: Compute CMRR and calculate vtotal
config: i386-randconfig-016-20240606 (https://download.01.org/0day-ci/archive/20240607/202406071749.cjO2itUi-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071749.cjO2itUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071749.cjO2itUi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `cmrr_get_vtotal':
>> drivers/gpu/drm/i915/display/intel_vrr.c:152:(.text+0x507): undefined reference to `__udivdi3'


vim +152 drivers/gpu/drm/i915/display/intel_vrr.c

   135	
   136	static unsigned int
   137	cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
   138	{
   139		int multiplier_m = 1, multiplier_n = 1, vtotal, desired_refresh_rate;
   140		long long adjusted_pixel_rate;
   141		struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
   142	
   143		desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
   144	
   145		if (video_mode_required) {
   146			multiplier_m = 1001;
   147			multiplier_n = 1000;
   148		}
   149	
   150		crtc_state->cmrr.cmrr_n =
   151			desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
 > 152		vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
   153		adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
   154		crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
   155	
   156		return vtotal;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
