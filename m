Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10C6125
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 06:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741156987; cv=none; b=jsP3sjZ7pVspqg923WHfzam/f3nwUR/y6cYDzaU9yzNr83CrXGv/F+5lcPsozEMCNpwj5hQJB5VJ50eIL/kxli+ZDYwLu+UI4Uh6Iqo0ibzbLThNVa/w+wmsMBNv7aRJJyTGXgXl7NxwXGzxWR0Cewxdvegt+Q3WilOLricCxoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741156987; c=relaxed/simple;
	bh=RUi0YY5SNKgColMjEybX4rQSEu6T46YMIGcnvthi4ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI6r7bYa0pMe/hnxf6qvQ76XG+HGy+iJ+JNa6BY0wgfCDFLcdDY17pq3G8289QLF3D9pPyUGqE8XPW9t4nFU9pzZO95pn1bzhLasrfOGKTs19V3iz1MQJrzY/8itco5GvLkZwttlJsx83G/lix9RiaiZWAp+7cdGdKtrv2J4WdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxbrI5Y+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxbrI5Y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741156985; x=1772692985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RUi0YY5SNKgColMjEybX4rQSEu6T46YMIGcnvthi4ao=;
  b=mxbrI5Y+RBYUtg0+TxPP7Tc28it7TnIdm9KUdf1d/rlMcuTVSjIiTGZ9
   pmLBElIu3W+ktDCfTvjIuBsp64tOXUnQCFu+960o8Qr/6zoYP+jcacseY
   4tBHl3kl+fLPNu3KA1ltIE8295Aw2wUjRVnlQGXUl/a+TJMm5dvaJoP2Z
   SPlb48QN6FrQocrD75FRovD353Toa2tL57vVRGTo/0XI6w15R3fSHTeeV
   lmyfIvLRLeJad714qR7il8swiQfLLxt6/pAeyY6m7byG/qxsIptv/JRDL
   8E24w4amXicIctozjQJ1o+DFqL9qK9PHSKaRKCOMXtQT/9tv6NnyPH7j6
   Q==;
X-CSE-ConnectionGUID: gGklLJtbRcaiTwO2PDN5ZA==
X-CSE-MsgGUID: vokqHQzsS0e6jUzGewlaEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29687564"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="29687564"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 22:43:05 -0800
X-CSE-ConnectionGUID: r/iwspq3QC6DxkJPw4EhDw==
X-CSE-MsgGUID: EnBViSllSYarwWA6b6yP4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="118422428"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2025 22:43:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpiT7-000KgQ-2K;
	Wed, 05 Mar 2025 06:43:01 +0000
Date: Wed, 5 Mar 2025 14:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-03-04 52/264]
 arch/arm/mm/pmsa-v7.c:473:25: error: implicit declaration of function
 'str_yes_no'
Message-ID: <202503051441.GFa52zO3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-03-04
head:   dc1f35422c705e8df42322c71936bd12213d0a46
commit: 02c2077b2f4be41510bc150cc157d523b63020d4 [52/264] arm: mm: pmsa-v7: use string choices helper
config: arm-randconfig-003-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051441.GFa52zO3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051441.GFa52zO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051441.GFa52zO3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/memblock.h:12,
                    from arch/arm/mm/pmsa-v7.c:8:
   arch/arm/mm/pmsa-v7.c: In function 'pmsav7_setup':
>> arch/arm/mm/pmsa-v7.c:473:25: error: implicit declaration of function 'str_yes_no' [-Wimplicit-function-declaration]
     473 |                         str_yes_no(mpu_iside_independent()),
         |                         ^~~~~~~~~~
   include/linux/printk.h:501:26: note: in expansion of macro 'printk_index_wrap'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/arm/mm/pmsa-v7.c:471:17: note: in expansion of macro 'pr_info'
     471 |                 pr_info("Using ARMv7 PMSA Compliant MPU. "
         |                 ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:574:9: note: in expansion of macro 'printk'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:574:16: note: in expansion of macro 'KERN_INFO'
     574 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   arch/arm/mm/pmsa-v7.c:471:17: note: in expansion of macro 'pr_info'
     471 |                 pr_info("Using ARMv7 PMSA Compliant MPU. "
         |                 ^~~~~~~


vim +/str_yes_no +473 arch/arm/mm/pmsa-v7.c

   451	
   452		/* RAM */
   453		for (i = 0; i < ARRAY_SIZE(mem); i++) {
   454			if (!mem[i].size)
   455				continue;
   456	
   457			err |= mpu_setup_region(region++, mem[i].base, ilog2(mem[i].size),
   458						PMSAv7_AP_PL1RW_PL0RW | PMSAv7_RGN_NORMAL,
   459						mem[i].subreg, false);
   460		}
   461	
   462		/* Vectors */
   463	#ifndef CONFIG_CPU_V7M
   464		err |= mpu_setup_region(region++, vectors_base, ilog2(2 * PAGE_SIZE),
   465					PMSAv7_AP_PL1RW_PL0NA | PMSAv7_RGN_NORMAL,
   466					0, false);
   467	#endif
   468		if (err) {
   469			panic("MPU region initialization failure! %d", err);
   470		} else {
   471			pr_info("Using ARMv7 PMSA Compliant MPU. "
   472				 "Region independence: %s, Used %d of %d regions\n",
 > 473				str_yes_no(mpu_iside_independent()),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
