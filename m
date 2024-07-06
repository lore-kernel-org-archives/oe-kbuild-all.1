Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0751C68C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720249835; cv=none; b=r02wZrD/iH+1x6N1BXW5YWDFDGim0VxyND+woHO8femUHnG88jcmHXtKdAPNfMeQxe++yy5QqxIj8lItFzPONoDRa1oitWVGhpLBUazk9OeA1xsWP7DTMMNK/uaNrQqmjZHGiU0+I5mpr4CsVuPkBU6+AfJG5q/I6HFwDqTUB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720249835; c=relaxed/simple;
	bh=GZiMsQoWg0jInrBypqhADPdee/1zOI8fy/U8Y4wOzFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrIlFJnmZmdB0A7QHuovYhT8WLpMyPuNB3LCtICqlnZYOCtsyiCpb+ghs90TTthi9YBDqXuvRS9rsfC19S0djS9paqroWfcEqad2Y61ILCY1/Na7zQR+eOfDXmxktX6i9HTX6SpqpLwLfKtc+17vlrp+jCmkAoB28sT6BdDwCVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1gvvI/L; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1gvvI/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720249833; x=1751785833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZiMsQoWg0jInrBypqhADPdee/1zOI8fy/U8Y4wOzFw=;
  b=N1gvvI/LrjvHtIKHp1xZYDLbROutf42WPhjgUfX1QCkHqfQyjlNA3k26
   eBJU5ihOaYWmfjxLMTlBSTQGh+OeRtU7mv8lKQ1vjxV/S/uFZFTtWg8dU
   zx/4DRMCrDmnTMtWgENbNgz5/XLlkNVtpjvWzWKltaJ+m/2P9woKl0Q4C
   gdXr+0il1KdzWZV1+CqzTX47t5pYjNA1mDIPqDdSsmPDzx/vINnWgmpOi
   Du+Z8l7+CG8hqqhVO1ZlepmCPlsI2afMJ2NvDNt92zyZHLWeKak7U2wir
   BetO1qoQzJbWWLA26dYeW09Y3mN+cUXjeyTiCzdEarjphlY82pSAf2PKr
   w==;
X-CSE-ConnectionGUID: H4aEKwebTyWr9tohLa+fwA==
X-CSE-MsgGUID: DZIVsqTkTgGqHt8R3fw99w==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21336218"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="21336218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 00:10:32 -0700
X-CSE-ConnectionGUID: mw9hc/ZRTEK5Kz/9pI/oyA==
X-CSE-MsgGUID: IOzVoZspQzqGaxgt8xzWSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="51643227"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jul 2024 00:10:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPzYy-000TRV-2z;
	Sat, 06 Jul 2024 07:10:28 +0000
Date: Sat, 6 Jul 2024 15:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/5] drm/i915/display: Add support for histogram
Message-ID: <202407061424.nDa9VYJe-lkp@intel.com>
References: <20240705095551.1244154-2-arun.r.murthy@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705095551.1244154-2-arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-xe/drm-xe-next linus/master v6.10-rc6 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-i915-display-Add-support-for-histogram/20240705-233245
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240705095551.1244154-2-arun.r.murthy%40intel.com
patch subject: [PATCH 1/5] drm/i915/display: Add support for histogram
config: i386-randconfig-061-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061424.nDa9VYJe-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061424.nDa9VYJe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061424.nDa9VYJe-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_histogram.o: in function `intel_histogram_enable':
>> drivers/gpu/drm/i915/display/intel_histogram.c:68:(.text+0x2b6): undefined reference to `__udivdi3'


vim +68 drivers/gpu/drm/i915/display/intel_histogram.c

    30	
    31	static int intel_histogram_enable(struct intel_crtc *intel_crtc)
    32	{
    33		struct drm_i915_private *i915 = to_i915(intel_crtc->base.dev);
    34		struct intel_histogram *histogram = intel_crtc->histogram;
    35		int pipe = intel_crtc->pipe;
    36		u64 res;
    37		u32 gbandthreshold;
    38	
    39		if (!histogram->can_enable) {
    40			drm_err(&i915->drm,
    41				"Histogram not supported, compute config failed\n");
    42			return -EINVAL;
    43		}
    44	
    45		if (histogram->enable)
    46			return 0;
    47	
    48		/* Pipe Dithering should be enabled with GLOBAL_HIST */
    49		intel_histogram_enable_dithering(i915, pipe);
    50	
    51		/*
    52		 * enable DPST_CTL Histogram mode
    53		 * Clear DPST_CTL Bin Reg function select to TC
    54		 */
    55		intel_de_rmw(i915, DPST_CTL(pipe),
    56			     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
    57			     DPST_CTL_HIST_MODE | DPST_CTL_IE_TABLE_VALUE_FORMAT,
    58			     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
    59			     DPST_CTL_HIST_MODE_HSV |
    60			     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC);
    61	
    62		/* Re-Visit: check if wait for one vblank is required */
    63		drm_crtc_wait_one_vblank(&intel_crtc->base);
    64	
    65		/* TODO: one time programming: Program GuardBand Threshold */
    66		res = (intel_crtc->config->hw.adjusted_mode.vtotal *
    67					intel_crtc->config->hw.adjusted_mode.htotal);
  > 68		gbandthreshold = (res *	HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT) /
    69					HISTOGRAM_GUARDBAND_PRECISION_FACTOR;
    70	
    71		/* Enable histogram interrupt mode */
    72		intel_de_rmw(i915, DPST_GUARD(pipe),
    73			     DPST_GUARD_THRESHOLD_GB_MASK |
    74			     DPST_GUARD_INTERRUPT_DELAY_MASK | DPST_GUARD_HIST_INT_EN,
    75			     DPST_GUARD_THRESHOLD_GB(gbandthreshold) |
    76			     DPST_GUARD_INTERRUPT_DELAY(HISTOGRAM_DEFAULT_GUARDBAND_DELAY) |
    77			     DPST_GUARD_HIST_INT_EN);
    78	
    79		/* Clear pending interrupts has to be done on separate write */
    80		intel_de_rmw(i915, DPST_GUARD(pipe),
    81			     DPST_GUARD_HIST_EVENT_STATUS, 1);
    82	
    83		histogram->enable = true;
    84	
    85		return 0;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
