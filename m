Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A48323410
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758111520; cv=none; b=b1VgjvgaY3hdER6ypk7QFzu/AL2yzDePgdSnOGvM1E3yi5fyitgdIOSTmhLP/ZaZpI2jv6X9DPeNU4w33lhZ1T8XKvG5UCP8gS4yajxnjWXOK7ssXxBlGbsWJDRhc/pvWH/Je8mSQMn/Rh9fYWuYimB+LRl+GRZ8v6i0l2ifBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758111520; c=relaxed/simple;
	bh=fq7KMfU0/gp784ImGV+Ke57s6H3Ew93v8QMcHpfXi2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJUAytf3ayK6MKip9VA1O1oR7XBaEsnH6G1BdrDp+kZ+QdOok5DVPQjn+Ci+9Bg+S4tP7Ano9Hjaty7UNP38yUsoIBss/LMul4XdLJe2Xej6sva9fDfpaoC0LPfcx/1gAN1eIgyNzOXF7yF6oYmXWAnGPh2lDJV5oQVgOziAJEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C43eufts; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C43eufts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758111518; x=1789647518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fq7KMfU0/gp784ImGV+Ke57s6H3Ew93v8QMcHpfXi2M=;
  b=C43euftsLqlBpcY73XaTS1LGvhPXZ5sM3/SBcsKFjAMM/nuC1I738NgQ
   IWb/1SmKf9aOHj5+DhUOYT6BYshIsalqhuGcsO57gHhTXnPSuPlAr6jOQ
   MeWi9OlK4xgb/Yf6zM5GEhUvDabBkvnBMdNE1R4aVJMfKlebjDm/yTu7Q
   ioGAS3II7OopVRJbU1VNajGoVmjrU5Av4z0lawkmuqSQlMUE8h53k/P2P
   pJDMzPrktbfMRLQ2jj1w5UxuYoDqsVdoCeTaMKrKapLO+1M1y0GsQKpQX
   GkVXQ1rmP+a6HLpu8c0uv67rfMiUceFxLnzlbUx7iRl4kAggSiLV90O1D
   w==;
X-CSE-ConnectionGUID: iOlkFZfURRie5eeiztH10w==
X-CSE-MsgGUID: dgIFPyDVS3SZL8dtDz4hbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71098460"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="71098460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 05:18:38 -0700
X-CSE-ConnectionGUID: STM+b74EQxWvXGg2tIcQJw==
X-CSE-MsgGUID: 92ZV2dz5Qsudqx7bkoRtXw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 05:18:37 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyr7K-0001Sn-3A;
	Wed, 17 Sep 2025 12:18:34 +0000
Date: Wed, 17 Sep 2025 20:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gicv5-fixes 7/14] include/linux/bits.h:47:9:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '72057594037927935' to '4294967295'
Message-ID: <202509172033.e2rLdaqW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-fixes
head:   999deda18864b78a3e92ef55423326b48cb9954a
commit: 726ca5fa3314df426fa086ab4077f2579f7532dd [7/14] clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver
config: arm-randconfig-002-20250917 (https://download.01.org/0day-ci/archive/20250917/202509172033.e2rLdaqW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509172033.e2rLdaqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509172033.e2rLdaqW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:114,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/uapi/linux/timex.h:56,
                    from include/linux/timex.h:56,
                    from include/linux/clocksource.h:13,
                    from include/linux/clockchips.h:14,
                    from drivers/clocksource/arm_arch_timer_mmio.c:13:
   drivers/clocksource/arm_arch_timer_mmio.c: In function 'arch_timer_mmio_setup':
>> include/linux/bits.h:47:9: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '72057594037927935' to '4294967295' [-Woverflow]
      47 |         ((t)(GENMASK_INPUT_CHECK(h, l) +                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |              (type_max(t) << (l) &                              \
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:52:33: note: in expansion of macro 'GENMASK_TYPE'
      52 | #define GENMASK_ULL(h, l)       GENMASK_TYPE(unsigned long long, h, l)
         |                                 ^~~~~~~~~~~~
   include/linux/clocksource.h:153:32: note: in expansion of macro 'GENMASK_ULL'
     153 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
         |                                ^~~~~~~~~~~
   drivers/clocksource/arm_arch_timer_mmio.c:255:66: note: in expansion of macro 'CLOCKSOURCE_MASK'
     255 |         clockevents_config_and_register(&at->evt, at->rate, 0xf, CLOCKSOURCE_MASK(56));
         |                                                                  ^~~~~~~~~~~~~~~~


vim +47 include/linux/bits.h

31299a5e021124 Vincent Mailhol 2025-03-26  35  
19408200c09485 Vincent Mailhol 2025-03-26  36  /*
19408200c09485 Vincent Mailhol 2025-03-26  37   * Generate a mask for the specified type @t. Additional checks are made to
19408200c09485 Vincent Mailhol 2025-03-26  38   * guarantee the value returned fits in that type, relying on
19408200c09485 Vincent Mailhol 2025-03-26  39   * -Wshift-count-overflow compiler check to detect incompatible arguments.
19408200c09485 Vincent Mailhol 2025-03-26  40   * For example, all these create build errors or warnings:
19408200c09485 Vincent Mailhol 2025-03-26  41   *
19408200c09485 Vincent Mailhol 2025-03-26  42   * - GENMASK(15, 20): wrong argument order
19408200c09485 Vincent Mailhol 2025-03-26  43   * - GENMASK(72, 15): doesn't fit unsigned long
19408200c09485 Vincent Mailhol 2025-03-26  44   * - GENMASK_U32(33, 15): doesn't fit in a u32
19408200c09485 Vincent Mailhol 2025-03-26  45   */
19408200c09485 Vincent Mailhol 2025-03-26  46  #define GENMASK_TYPE(t, h, l)					\
19408200c09485 Vincent Mailhol 2025-03-26 @47  	((t)(GENMASK_INPUT_CHECK(h, l) +			\
19408200c09485 Vincent Mailhol 2025-03-26  48  	     (type_max(t) << (l) &				\
19408200c09485 Vincent Mailhol 2025-03-26  49  	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
19408200c09485 Vincent Mailhol 2025-03-26  50  

:::::: The code at line 47 was first introduced by commit
:::::: 19408200c094858d952a90bf4977733dc89a4df5 bits: introduce fixed-type GENMASK_U*()

:::::: TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
