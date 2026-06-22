Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3C3B6340
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138553; cv=none; b=bC8okvz074/ZwNiFCXZECi1iNajfEQ/eDb0Nq6xEO2i/WmkUqpPQ6mtZA+V/p8j6hqjOD7O9X6sHidBXe+MR5WOTfNvS6P17NnfMcKWOmi2c3c0aVcx3Ed/syfIQ/DwUCAMwJynIW6RbQAxVnYBAXCwXjbseLvLEtlqVcJF4dNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138553; c=relaxed/simple;
	bh=MRR4m3xqyu06Q8W5na572NxOU0wWBZ/xSIM1EmaZ4e0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QrnER2I/hpmYbrBAxBTTyn+6W2ac8Ew2edoqyAi0nsQmAQ8dg+8QW10H6tAIoMYJsRMwjSFuk/YOBLeHdKU4FQlmy8c1IjR0xDBmGqpFQSkGSNISv0qvY7okrRx7VB6I5I2JQMDJxdN8J+na1xMMdqKpvuvLREB1O0O6vycFlF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GN6TR2Qa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GN6TR2Qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782138551; x=1813674551;
  h=date:from:to:cc:subject:message-id;
  bh=MRR4m3xqyu06Q8W5na572NxOU0wWBZ/xSIM1EmaZ4e0=;
  b=GN6TR2QaDtaxIK+Ferqfk499e6G5cvj1auz9IZRIa3lfHCBmhgea0zRu
   FCtF6U0MZTaYFWgWlEvro+jSINKEPsAp9nJ199qCE65k4vvVbJyenzgiX
   30a/843dBW9m2p58Mf28V4lO9KUBh+TudfF0KmhFX6uDrirFLxijmmq9g
   lmoeHuhvCSSAP7ibh3uhlpXL2lVsLxFLGfOeHwtd3okeeY0v1hiwuCNZF
   nK7L2yOZdUD+iIk0enshAslj6Sn+th5Q62AT+31IJo5P2ca0qRHKud7n0
   APfMHx8mr9Vwt+Dy29caJJj/E6vIcRJeH3/HQWqi3YQwV+yaWvF67djcb
   Q==;
X-CSE-ConnectionGUID: NzvTlCrJRpWimehiIRpmFg==
X-CSE-MsgGUID: k20hljbAT3W+yPcDRZXHTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="100298214"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="100298214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 07:29:10 -0700
X-CSE-ConnectionGUID: 6honud4iSxu3KxPc5oDsgQ==
X-CSE-MsgGUID: cJPgTv5BRsO9dlV08xzigQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="279424953"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2026 07:29:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbfe6-000000001Jp-0y1t;
	Mon, 22 Jun 2026 14:29:06 +0000
Date: Mon, 22 Jun 2026 22:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 2/18]
 include/linux/irqflags.h:44:22: error: unknown type name 'hardirqs_enabled'
Message-ID: <202606222257.mDS6KTXi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   0085d6fa714d415fe4a35a84223f0542d2b6aede
commit: e8738f15a4cb67db74b2cd642327423ef336bb26 [2/18] LoongArch: Add THREAD_INFO_IN_TASK implementation
config: loongarch-randconfig-r123-20260622 (https://download.01.org/0day-ci/archive/20260622/202606222257.mDS6KTXi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222257.mDS6KTXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606222257.mDS6KTXi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/cmpxchg-local.h:6,
                    from arch/loongarch/include/asm/cmpxchg.h:299,
                    from arch/loongarch/include/asm/percpu.h:8,
                    from arch/loongarch/include/asm/current.h:9,
                    from include/linux/sched.h:12,
                    from arch/loongarch/kernel/asm-offsets.c:10:
>> include/linux/irqflags.h:44:22: error: unknown type name 'hardirqs_enabled'
      44 | DECLARE_PER_CPU(int, hardirqs_enabled);
         |                      ^~~~~~~~~~~~~~~~
>> include/linux/irqflags.h:45:22: error: unknown type name 'hardirq_context'
      45 | DECLARE_PER_CPU(int, hardirq_context);
         |                      ^~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1376: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/hardirqs_enabled +44 include/linux/irqflags.h

a21ee6055c30ce6 Peter Zijlstra 2020-05-25  43  
a21ee6055c30ce6 Peter Zijlstra 2020-05-25 @44  DECLARE_PER_CPU(int, hardirqs_enabled);
a21ee6055c30ce6 Peter Zijlstra 2020-05-25 @45  DECLARE_PER_CPU(int, hardirq_context);
a21ee6055c30ce6 Peter Zijlstra 2020-05-25  46  

:::::: The code at line 44 was first introduced by commit
:::::: a21ee6055c30ce68c4e201c6496f0ed2a1936230 lockdep: Change hardirq{s_enabled,_context} to per-cpu variables

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
