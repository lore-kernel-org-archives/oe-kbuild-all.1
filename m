Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F652FFFAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761419202; cv=none; b=BW3HyaQNW3Uat3/ZN6uvrGBhukJVYRfof7Be9rHK5x3K2eAkZSN+ZEMbK5t+EmAzvgxdDzlLsweMppeWWjjl7Bnx2rXormr6iZC5YsGjc6HHBx8gZYzIOA4RRy/sznsR5GdGbKI5cHVWYO6OCGPMc3aDWPGAN18Ipnd+mEcEJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761419202; c=relaxed/simple;
	bh=LAi9gAtVy5auiOBUDkyPmcLPULn3X3e6veZF2YNr0qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IP+cF8Yc1aSaSi352VbwJ7lqQhzuAP45znCXk4IsBMhSnYY+zbBnk3EztJPtE/dR6ZvOcSL/i/QFy2bvo/0u1Imf0v2a1j3Z/r9zmQYs/+nyN2eueHtOfrqFwEadn4F5S06L3JAQ4c3Vsm3j1uOxBMcTPDIgzNkNV6sn1bhfL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTNlJ2bI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTNlJ2bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761419200; x=1792955200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LAi9gAtVy5auiOBUDkyPmcLPULn3X3e6veZF2YNr0qA=;
  b=PTNlJ2bIsbyWka2KVblMiN18QIotaAupZC3bWBdWHLeuu6AYrYE7N0UB
   u0rA91XuJ7BJ+duZA9ehIWw2JdTp5Gt7DNT1KuRNoZ2J3FJ9TyvS2xsto
   8t1AJmj01rhBqe9gfQHmwLN1uJTdcFsRX3dHozTr+mafYbvYm6wKekDQ+
   W4CyLkVgOt42GU64jN6sDI1lV2gPIQXdTBD664dQf9vTZ0EL6PK26ucFz
   6m4YyGbjEqE9pmlqUJq83dEl+rTwYedL7YMiO38X1y/WAGmlM0gOfQy1P
   D77M9uKdlszpX+eyURzakYZEELyEmrrjqCJ2bRdQxGq/kRXoAxGVwesX8
   w==;
X-CSE-ConnectionGUID: KDJsF49cTRiP3oaM+283Bg==
X-CSE-MsgGUID: yZ/aJyLoSiGcqTOUlV8ntQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74238061"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="74238061"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 12:06:39 -0700
X-CSE-ConnectionGUID: 6ImZjXhNSCuN4Mp70tQCmA==
X-CSE-MsgGUID: XUo9Z2TzTB+loh27NJNb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184298940"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Oct 2025 12:06:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCja7-000FWj-1W;
	Sat, 25 Oct 2025 19:06:19 +0000
Date: Sun, 26 Oct 2025 03:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 09/11] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <202510260233.dr87FI0R-lkp@intel.com>
References: <20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf@collabora.com>

Hi Louis-Alexis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a92c761bcac3d5042559107fa7679470727a4bcb]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Alexis-Eyraud/drm-mediatek-mtk_hdmi-Drop-redundant-clock-retrieval-in-mtk_hdmi_get_cec_dev/20251023-183509
base:   a92c761bcac3d5042559107fa7679470727a4bcb
patch link:    https://lore.kernel.org/r/20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf%40collabora.com
patch subject: [PATCH v11 09/11] drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20251026/202510260233.dr87FI0R-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260233.dr87FI0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260233.dr87FI0R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/microblaze/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:12:
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c: In function 'mtk_ddcm_read_hdmi':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:128:23: note: in expansion of macro 'do_div'
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:11:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:128:23: note: in expansion of macro 'do_div'
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u16 * {aka short unsigned int *}
   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c:128:23: note: in expansion of macro 'do_div'
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u16 *' {aka 'short unsigned int *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
--
   In file included from arch/microblaze/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/clk.h:13,
                    from mtk_hdmi_ddc_v2.c:12:
   mtk_hdmi_ddc_v2.c: In function 'mtk_ddcm_read_hdmi':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   mtk_hdmi_ddc_v2.c:128:23: note: in expansion of macro 'do_div'
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from mtk_hdmi_ddc_v2.c:11:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   mtk_hdmi_ddc_v2.c:128:23: note: in expansion of macro 'do_div'
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u16 * {aka short unsigned int *}
   mtk_hdmi_ddc_v2.c:128:23: note: in expansion of macro 'do_div'
     128 |                 rem = do_div(loop_counter, temp_length);
         |                       ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u16 *' {aka 'short unsigned int *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~


vim +195 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  176  
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  179   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  187  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02 @195  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  198  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  199  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  200  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  202   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
