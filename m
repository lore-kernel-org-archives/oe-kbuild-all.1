Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D015C1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689729069; x=1721265069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eM8QaRu5gKMrbg7e/7I6XvsZzNWOiK2I+vKAE+nGzsI=;
  b=bY1Q821HMj3cig73najMxFVc+SypAx+qpjgpdOQcQe9UMHjn3cv7n+PX
   r9Q3muZzhO8oZIS658nJ0dMc5IlrmWF93MkW0ErdayjU4aS3Fl8VGSRn9
   qUeUmzWOWKshouf+iD8OLYec8ATuyFtiynLx+ht2H+pkMEUalOpOPVF/O
   IrmUS+KJnoRJMvc71EaoJ7Oyf2/j7c9WRn+GDCZVKhl5G/jkK7A/SDu/5
   NMoAQSWCEN9M58xRrx7beGn3HncGtv6nhKBJQhYtLm2XySBqilRJer/Z6
   s315zJYqhijKyBvSfyHK2zhFBc6MCkH+4eB/d4XEooUF5Y6SLaCk5gIal
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="368994225"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="368994225"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 18:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="727144180"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="727144180"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2023 18:10:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLviM-00040j-0p;
	Wed, 19 Jul 2023 01:10:53 +0000
Date: Wed, 19 Jul 2023 09:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, neil.armstrong@linaro.org,
	conor+dt@kernel.org, rfoss@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
	shawnguo@kernel.org, s.hauer@pengutronix.de,
	jernej.skrabec@gmail.com, robh+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
	kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Message-ID: <202307190811.jOcroxF5-lkp@intel.com>
References: <20230717061831.1826878-10-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717061831.1826878-10-victor.liu@nxp.com>

Hi Liu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc2 next-20230718]
[cannot apply to drm-misc/drm-misc-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Ying/drm-bridge-synopsys-dw-mipi-dsi-Add-dw_mipi_dsi_get_bridge-helper/20230718-172247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20230717061831.1826878-10-victor.liu%40nxp.com
patch subject: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230719/202307190811.jOcroxF5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190811.jOcroxF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190811.jOcroxF5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:26,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:9:
   drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c: In function 'dphy_pll_get_configure_from_opts':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:272:17: note: in expansion of macro 'do_div'
     272 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:7:
>> include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:272:17: note: in expansion of macro 'do_div'
     272 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    long unsigned int *
   drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c:272:17: note: in expansion of macro 'do_div'
     272 |                 do_div(tmp, n * fvco_div);
         |                 ^~~~~~
   arch/arm/include/asm/div64.h:24:45: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'long unsigned int *'
      24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
         |                                   ~~~~~~~~~~^
   cc1: some warnings being treated as errors


vim +/__div64_32 +238 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
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
911918aa7ef6f8 Nicolas Pitre      2015-11-02 @234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
