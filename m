Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE94CDF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717137341; cv=none; b=kOV53M4WhmMq1/MmVO8F08mxem8xdA04YiY4+qmISrPfP6HTwyywlrtBGwbWKwJgTpWwrW8OsMroKZ1+orBSk16VJh1TeW87XUmO2uOJmSVtH3DAZL5ptrXU6EEdMO+pVeQOYzh0vOD3sZhqtcOEjlV5AiGJ5+YvtK7dI3iaHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717137341; c=relaxed/simple;
	bh=i3obZBSZupFhpN6dVl5Tmq79PnHNjSIzqP/cVXq1S7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCBmEgo475d2ASQN1MDKd5iZtjQFSdcmhv+Uu4naMX4jre9A4NZEFYObRAp6dLaqCjB7pbLusiw7nD00MzVwhbwT+5rrcIILjOMwx4iU5a45B/DaoGUhSdxbJarhPpI1ndhq0pV+V1WQHdC3AKKErVWVHKFZnE2PwRWS/mv/pGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0SF60zd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0SF60zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717137339; x=1748673339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i3obZBSZupFhpN6dVl5Tmq79PnHNjSIzqP/cVXq1S7k=;
  b=n0SF60zdCcVrVh457nlK76L3v/iWvuZfgwet1zlm7WOwMpPpKp1UztqD
   mVIICFX7TQB3IM8EHnqHVDmLWmUoPcALX4sjo2mf83LjyvdYZBbpmrg5p
   VyDi6vo0F8yTh2X5cmo2gjjEVqOjvcQSGiXLp3phVAJw2k9aJD4kq3Wm3
   329E1KyzqZL/7Rsn73VxCSkF0J9aRl6dxoU/zl8vcGl388dXFXKwIh7Up
   2s89gJM9xf3SrkWh6VGYolaxzjfQ01nTxnqaSLvZH5xztxI7G/28fNXFV
   mqUbzFwU5tkZ82CRivAOx5Ap9owcbhOYlkf6Oyo/gkczC0/CRdiv/yXq7
   w==;
X-CSE-ConnectionGUID: mpXSuc6fQ8KYVdVXe84tSw==
X-CSE-MsgGUID: 9wBBHCrGR8il9HSN9L6Fbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31162028"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="31162028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 23:35:39 -0700
X-CSE-ConnectionGUID: b2+QAcw6SHe+x9j3ABqGRw==
X-CSE-MsgGUID: 80ozr//0Qcy8ZIwIXj1FWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="73547592"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 May 2024 23:35:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCvoo-000GcP-3D;
	Fri, 31 May 2024 06:34:02 +0000
Date: Fri, 31 May 2024 14:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 4/8] drm/i915: Compute CMRR and calculate vtotal
Message-ID: <202405311432.WEtCTIPF-lkp@intel.com>
References: <20240530060408.67027-5-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530060408.67027-5-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip next-20240529]
[cannot apply to drm-intel/for-linux-next-fixes drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.10-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Separate-VRR-related-register-definitions/20240530-141702
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240530060408.67027-5-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [PATCH v10 4/8] drm/i915: Compute CMRR and calculate vtotal
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240531/202405311432.WEtCTIPF-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311432.WEtCTIPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311432.WEtCTIPF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/drm/drm_device.h:5,
                    from include/drm/drm_drv.h:35,
                    from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:13,
                    from drivers/gpu/drm/i915/display/intel_vrr.c:7:
   drivers/gpu/drm/i915/display/intel_vrr.c: In function 'cmrr_get_vtotal':
>> include/asm-generic/div64.h:222:35: error: comparison of distinct pointer types lacks a cast [-Werror]
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/gpu/drm/i915/display/intel_vrr.c:154:35: note: in expansion of macro 'do_div'
     154 |         crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
         |                                   ^~~~~~
   cc1: all warnings being treated as errors


vim +222 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
