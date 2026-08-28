Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F1282F13
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902130; cv=none; b=J2mIuTaq+B3mCFJKO9RqsGP6JbNfvsmNMe2ofoo3HHl9IkDkRUYXFa/S4bZwr10TxrgjHZ0uAP7DlFah9N9zHZ0cuRFAfTlG+dJbWpTerbNLkAZ6EazVNIQCPnMsEGY29jowTsNmKjK8jWbmnRvXHAwNgLTVTbYnC5qE/PIEzvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902130; c=relaxed/simple;
	bh=abFSqu7kpt59coYGKlQO8vF0M8x0xZLmkHS3yEsD7s0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KOcqJiKCuvZmbdq1qlynY6420dyz/iErx8GLLZEz44XY9ZoaL/L6RBlHW2R2d1ZB2s1IHxrRtdNNKswTxvudYwmZi0Klpxcjsm7A4l5aq8j3NCIPYWF9ekcPiW9PAsVW1TgCYxV1gbSuP5Aa5/SyVOoehTnLK0AS33j16U23+4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4ECNKnY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4ECNKnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787902128; x=1819438128;
  h=date:from:to:cc:subject:message-id;
  bh=abFSqu7kpt59coYGKlQO8vF0M8x0xZLmkHS3yEsD7s0=;
  b=O4ECNKnYBDbE7whwcdcGbH8HGiC1GYBowGWU22NX6Ns+qYZS+KsAuBFI
   URj7oNOA7nZJ+koiwDc5taIt4usPWO1+w9AKsWaGsqMhdOXuUfanOMj2I
   9itzsSUZbmFL2d/H1x0Np8NdsW7eyzYb21NtCn44qDHbWBVT+9as9drew
   n6cRig7/GgNKgezwOrgG/12387rCrLtZsymLC8+uE51zf785Ty55KRLdR
   lyiyRDPGmuuCS6Qzu8RBahiznyQSOaMdSuYZhP+um5JS0R7gAxmutyQGy
   6+dyxb4u/BTPM6CCqLZ+Kd9FanLZW6OAmDF9LhXFkmVxNNIfXtXoWc+3A
   Q==;
X-CSE-ConnectionGUID: GKXY0nlFQsKKvht9AstVoA==
X-CSE-MsgGUID: rv5S2VO/TZKkcIzd7sUZpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105781588"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105781588"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 00:28:48 -0700
X-CSE-ConnectionGUID: IcclU7mER5SlPvJ9nJNRvw==
X-CSE-MsgGUID: gAKFHag/Rd+smsT9O2o9tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="261938821"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2026 00:28:47 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzr12-00000000AZj-1oAJ;
	Fri, 28 Aug 2026 07:28:44 +0000
Date: Fri, 28 Aug 2026 15:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-mm-ro-pmds-puds 2/2]
 arch/arm64/include/asm/pgtable.h:901:44: error: 'pud_t' has no member named
 'pud'; did you mean 'p4d'?
Message-ID: <202608281506.p0E8dFW9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-mm-ro-pmds-puds
head:   94ed97bda114e544f5563b31ac9babc7508ac535
commit: 94ed97bda114e544f5563b31ac9babc7508ac535 [2/2] WIP
config: arm64-randconfig-001 (https://download.01.org/0day-ci/archive/20260828/202608281506.p0E8dFW9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608281506.p0E8dFW9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281506.p0E8dFW9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:38,
                    from include/linux/slab.h:276,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   arch/arm64/include/asm/pgtable.h: In function 'set_pud':
>> arch/arm64/include/asm/pgtable.h:901:44: error: 'pud_t' has no member named 'pud'; did you mean 'p4d'?
     901 |                 set_readonly_ptval(pa, pud.pud);
         |                                            ^~~
         |                                            p4d
   make[3]: *** [scripts/Makefile.build:185: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=2277844341
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1414: prepare0] Error 2 shuffle=2277844341
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2277844341
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2277844341
   make: Target 'prepare' not remade because of errors.


vim +901 arch/arm64/include/asm/pgtable.h

   895	
   896	static inline void set_pud(pud_t *pudp, pud_t pud)
   897	{
   898		u64 pa;
   899	
   900		if (in_kernel_rodata_lmalias(pudp, &pa)) {
 > 901			set_readonly_ptval(pa, pud.pud);
   902			return;
   903		}
   904	
   905		WRITE_ONCE(*pudp, pud);
   906	
   907		if (pud_valid(pud))
   908			queue_pte_barriers();
   909	}
   910	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
