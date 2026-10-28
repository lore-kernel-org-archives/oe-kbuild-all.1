Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166026;
	b=KJOyfFGnTqdGwqGIKFR1NoejRMkFbw1Rf6n1jAcW/a2EkAgvQN9JTrHNolsYWVG27vUl
	 saGQx5V2oaPVML4H0D6DKkc6m42VumvB6cK/PDioPtn6HfmGEEAoPgeEYmG2i4G0l2lUN
	 w4QXpbMl/wGMwbQ0lyOtObpi/coKV/P1LccbLuBvDbNs3H16q+A0jshvslyEu3aqSqwRY
	 ak41yS95WFp/q9rzo2Ye5LR/NNOGohT9D3rvmTZCH6r9tYaLcm2gv4Ghx6UldgqoOynfB
	 VLM+AkL4MF8R5fKTCVmDJPT+2DPguy5g+Igg4iOY2Mdpd+UrsM1WV/mTecIk99+vddw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166026;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UMbfrnTVxBRddQ4FXjN6c6CnNQ+Ka8aYU6wt0jjzJ0g=;
	b=vnlvBcCS6BIyB845BUt82fJnBCJmTzZXuV3MNB6ov7TS5chUay6vRf41CjYbRuHqx9r7
	 nTidmopFZrsKbvU6YiGUBT3WCC+3j5ZD+Lc/wZGXPKfbPc4J7n04ZtX2kirLgd+Vytuiw
	 xaQdHJQC5+TdaPvYQiyPqBMH+hXLlks/kc6/f/F8x8SM783J3qsyjiq5fAXoza9avxENT
	 L1RFR9Lxw2c1DJBeB/Izq5gErn2XQ5iooOq4qx3Pz2UaWs88/S3oEjRfVwAKZnjl2WItm
	 VWwPdn+zAGze7uGG7IrGG3P5v1UINw/k2ZA/quFAlPrrZknS/5vWiwPpDltmAB2pNFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNZ13yT8;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69924606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 05:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69924606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNZ13yT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793166023; x=1824702023;
  h=date:from:to:cc:subject:message-id;
  bh=WCqW+UAoYBFYv6f3CPMYjZRvp6Uk2dwEXEvOeIMIecU=;
  b=RNZ13yT8E5y2MfPjz35FH3tSPWMnsdgZMMBgQg5aQj+FcohKqDpLT4AZ
   4Fm8+WESJEBf0QR34lPIOcTWkiFDgJBn7iTVBJc/k9qppAeq4klbL6gZC
   23WpK/h91YOeQKCYGMp/7YUduYE0RF9NzRXv6Feap6aDBtbBiUEk4FfjF
   AiScsIhGnoSKMdEkavcdPhWVf5KZpZwboVOH+VbaMwsx04MtYbrDRX6Hg
   wVarxWwylAmOiXsSGMymjr7ONTkyj09GKtbBJofOsSVU16zbcNs0yiJda
   ry+fWzYOGW0/IRe1x93Kxg87feC995nTMroeUoNFfzS3GkjlajCDN0PI2
   A==;
X-CSE-ConnectionGUID: G6lQtZrnRcq/wXdD0UTNWA==
X-CSE-MsgGUID: gR4u3C3fS9i/DSGmkE7Fow==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1891246"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1891246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:40:23 -0700
X-CSE-ConnectionGUID: DUm5ZFNnSZOqpH8WJxOnLA==
X-CSE-MsgGUID: PHd8sooQT86DKMa5uhCFBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4789442"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2026 22:40:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLwOZ-000000004ln-1vBD;
	Wed, 28 Oct 2026 05:40:19 +0000
Date: Wed, 28 Oct 2026 06:39:34 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 2/6]
 arch/m68k/include/asm/page.h:20:22: error: lvalue required as unary '&'
 operand
Message-ID: <202610280608.Ih8U8FnH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux arena-lazy-pte
head:   ce19d941e895a85d7dc1e7d49e6b90b1262f7e79
commit: 0ec7dbb5a7536124b8723d262ad2f6e11244767d [2/6] mm: Add lockless kernel PMD populate, clear and range-flush helpers
config: m68k-randconfig-r2109-20261028 (https://download.01.org/0day-ci/archive/20261028/202610280608.Ih8U8FnH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610280608.Ih8U8FnH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610280608.Ih8U8FnH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:243,
                    from include/linux/once.h:6,
                    from include/linux/prandom.h:12,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/pgtable.h: In function 'pmdp_try_clear':
>> arch/m68k/include/asm/page.h:20:22: error: lvalue required as unary '&' operand
    #define pmd_val(x) ((&x)->pmd)
                         ^
   include/linux/pgtable.h:1119:6: note: in expansion of macro 'pmd_val'
     if (pmd_val(pmdp_get(pmdp)) != pmd_val(old))
         ^~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1 shuffle=2209011291
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1436: prepare0] Error 2 shuffle=2209011291
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2209011291
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2209011291
   make: Target 'prepare' not remade because of errors.


vim +20 arch/m68k/include/asm/page.h

138ff3462f53a7 Greg Ungerer   2010-09-07  14  
138ff3462f53a7 Greg Ungerer   2010-09-07  15  /*
138ff3462f53a7 Greg Ungerer   2010-09-07  16   * These are used to make use of C type-checking..
138ff3462f53a7 Greg Ungerer   2010-09-07  17   */
60e50f34b13e9e Mike Rapoport  2019-12-04  18  #if !defined(CONFIG_MMU) || CONFIG_PGTABLE_LEVELS == 3
ef22d8abd876e8 Peter Zijlstra 2020-01-31  19  typedef struct { unsigned long pmd; } pmd_t;
ef22d8abd876e8 Peter Zijlstra 2020-01-31 @20  #define pmd_val(x)	((&x)->pmd)
ef22d8abd876e8 Peter Zijlstra 2020-01-31  21  #define __pmd(x)	((pmd_t) { (x) } )
60e50f34b13e9e Mike Rapoport  2019-12-04  22  #endif
60e50f34b13e9e Mike Rapoport  2019-12-04  23  

:::::: The code at line 20 was first introduced by commit
:::::: ef22d8abd876e805b604e8f655127de2beee2869 m68k: mm: Restructure Motorola MMU page-table layout

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
