Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF1142E9D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724448901; cv=none; b=ASEep/c3451J/9zuezSl263eSLBgCQ3YxgjHKDn2bRfQhCY/C9O23J8TX0h6w5cvTOjbrPC8sHKgbbLZxvXsSY3Q4WwGtK7w3Q3fCD4bTfiDSIaIgyGMFnR/OI+7HvyzD8nESa/OnXDZLTyQ0lmmBxWGnMqKD3UfGNSvOQ1v+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724448901; c=relaxed/simple;
	bh=j69+vpFJiquPfKH5AGbxdOeI9DarReUi5xP1MqiAcOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SB2gmT8oXCWOBLp9jhq7xxCS+7KOKlkNnSMUfUsjvgAuca3BKHbEpoE0eMGJNg+TXJ3GUdnWa+So2uo9DLSmLFldU8r/viPHsdAJARHIwtSeqxZrEWMqAlQkYz3FiD2z8XLj8uv1Kno9y0y8LWzGGwWMyGqyNyKr2phFap8TOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFo0hJ7k; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFo0hJ7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724448900; x=1755984900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j69+vpFJiquPfKH5AGbxdOeI9DarReUi5xP1MqiAcOo=;
  b=jFo0hJ7kem9QuVUIC6Ub67cREy9VqluWCb4mtAuCDeL05snRaMXYPPST
   2bTAWMR0SX4FdBmP8zJzj4NHIEppMqLNk5d6K9jkqzFKonX3nsO93+01I
   RHbp5PP34WwQGdcNO8m35+r1x2+gUl/TwklhXpKV2N7ik38ByUPb2zT6n
   FCbPdRTMx/omirUlWpudtqVeegOSXDfjKXdmA1XC+w9C2QRudyHIBp6AS
   s/S1saZllO5mkEqF87TkbJTAlznfLIZcIUbyWizmsuu5VRAG91ZpKZ7A9
   LvbusK+62ynbot+M13F21aJzehVgjW39ltNHA0bvUmQHtzHw0IxsZkbj0
   w==;
X-CSE-ConnectionGUID: BpkRNJSIT6CPgeLnMnZdag==
X-CSE-MsgGUID: QyAZw7LKT2ucllpX2x/pyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25833603"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="25833603"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 14:34:52 -0700
X-CSE-ConnectionGUID: mYAN3GUOTKitqYUiXvTUXw==
X-CSE-MsgGUID: k5AA0QfRT+2w7weFO9O7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; 
   d="scan'208";a="99425181"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2024 14:34:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shbvb-000E2a-1Q;
	Fri, 23 Aug 2024 21:34:39 +0000
Date: Sat, 24 Aug 2024 05:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2 1/5] drm/i915/display: Add support for histogram
Message-ID: <202408240526.YSkfPeiV-lkp@intel.com>
References: <20240821102349.3961986-2-arun.r.murthy@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821102349.3961986-2-arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-xe/drm-xe-next linus/master v6.11-rc4 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-i915-display-Add-support-for-histogram/20240821-183453
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240821102349.3961986-2-arun.r.murthy%40intel.com
patch subject: [PATCHv2 1/5] drm/i915/display: Add support for histogram
config: i386-randconfig-051-20240823 (https://download.01.org/0day-ci/archive/20240824/202408240526.YSkfPeiV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408240526.YSkfPeiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408240526.YSkfPeiV-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_histogram.o: in function `intel_histogram_enable':
>> drivers/gpu/drm/i915/display/intel_histogram.c:83: undefined reference to `__udivdi3'


vim +83 drivers/gpu/drm/i915/display/intel_histogram.c

    44	
    45	static int intel_histogram_enable(struct intel_crtc *intel_crtc)
    46	{
    47		struct drm_i915_private *i915 = to_i915(intel_crtc->base.dev);
    48		struct intel_histogram *histogram = intel_crtc->histogram;
    49		int pipe = intel_crtc->pipe;
    50		u64 res;
    51		u32 gbandthreshold;
    52	
    53		if (!histogram)
    54			return -EINVAL;
    55	
    56		if (!histogram->can_enable) {
    57			return -EINVAL;
    58		}
    59	
    60		if (histogram->enable)
    61			return 0;
    62	
    63		/* Pipe Dithering should be enabled with GLOBAL_HIST */
    64		intel_histogram_enable_dithering(i915, pipe);
    65	
    66		/*
    67		 * enable DPST_CTL Histogram mode
    68		 * Clear DPST_CTL Bin Reg function select to TC
    69		 */
    70		intel_de_rmw(i915, DPST_CTL(pipe),
    71			     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
    72			     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT,
    73			     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
    74			     DPST_CTL_HIST_MODE_HSV |
    75			     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC);
    76	
    77		/* Re-Visit: check if wait for one vblank is required */
    78		drm_crtc_wait_one_vblank(&intel_crtc->base);
    79	
    80		/* TODO: one time programming: Program GuardBand Threshold */
    81		res = (intel_crtc->config->hw.adjusted_mode.vtotal *
    82					intel_crtc->config->hw.adjusted_mode.htotal);
  > 83		gbandthreshold = (res *	HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT) /
    84					HISTOGRAM_GUARDBAND_PRECISION_FACTOR;
    85	
    86		/* Enable histogram interrupt mode */
    87		intel_de_rmw(i915, DPST_GUARD(pipe),
    88			     DPST_GUARD_THRESHOLD_GB_MASK |
    89			     DPST_GUARD_INTERRUPT_DELAY_MASK | DPST_GUARD_HIST_INT_EN,
    90			     DPST_GUARD_THRESHOLD_GB(gbandthreshold) |
    91			     DPST_GUARD_INTERRUPT_DELAY(HISTOGRAM_DEFAULT_GUARDBAND_DELAY) |
    92			     DPST_GUARD_HIST_INT_EN);
    93	
    94		/* Clear pending interrupts has to be done on separate write */
    95		intel_de_rmw(i915, DPST_GUARD(pipe),
    96			     DPST_GUARD_HIST_EVENT_STATUS, 1);
    97	
    98		histogram->enable = true;
    99	
   100		return 0;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
