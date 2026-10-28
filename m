Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193179;
	b=BlaD3figfpjuEoF56A1ngFg3NGoh0w3yar9vDAqjGe+AX83fSHkafXB0a61ALQItVBxs
	 9VlSENlxBqf7INxmJP4Af+vJ2G5T74AIG1LmKrlqWx8bXdK5RlbSzNGUhxWomvFuDO5y7
	 puwHV1HCDnbYcTDSD6GzxzDl/acsYYBq/U1RDHQF6ZJDV2GIvtJSI+3dtraC1vmHW72wU
	 oa3ORkY84gWZzP8da2YMrmiXYtc/qMTJ2WBQKyc68mT7/R7RjGmJw77qOYt1BYtIB2Hx8
	 PPpMZFRYePHrXd4/CDlrRBDuQ5sEuV1P/CKR3CxODsCJwZoSyKHIvnNtNPzaCDlAVPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193179;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZAbWz1AWBBIiQmOHF4kAdde1XLMpXbi9V3JEZ+bKG8E=;
	b=JwjMJsEFa4zbD4Rxdj6atjhqdKwh/BbzUItH2rgTOAvNuxOqcjj2cgJk4Y4DNw6YsucM
	 3ikw1cK0qS4VuGjDJ3BBamwfFPzIuH+TcQ0SGLMerGAKAJ558Cbmjw7bnM6NDJF0cWEVM
	 HfZ/AasYaJatn0PoFKeds/ri46pvsWFs3P5gUqvWaLTT8/gj/i9GQ5N3xzPkzNgZbSdD/
	 RD+lLFs0JA8c3PoenJplvFUWhmUpTbpjZ8UQIjNBRayzHJ52u1cv+ea4gpAFsHA8dduOj
	 tvs7AxcckSdSJEMrLuHl4SgHjVXFwnMjUnDaGyTPqsJJSjclaPTSNryCbugdl3whNRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="a/rPn/Vz";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2222606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 13:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2222606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a/rPn/Vz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793193176; x=1824729176;
  h=date:from:to:cc:subject:message-id;
  bh=xtnrYOC3zMZ2aMXsaB3HmwHLlhCyb04geY9ehGLcbII=;
  b=a/rPn/VzdX8oIRtLBVfWj8DgsVZk/HgWQFNh0vyFcYX7cKu5HeuxtlWs
   BpJjHcU9RfHrtq/Hp9Rx9RnAkCIy+/nbKL5YwirtwGs2R9JH3RZ18CY6K
   Y7DhUIbjnYx6LgFecoBrbRIph0+yTAkrttPAb4jU/TmHaFigbzrVeErSR
   wUcmaZAbLqm9rOzt3kpYE5i2yB/5lUvRWBonk4NVbakcj7Gx9Ack2CumT
   vGfOlhRtwREDGNKyXyH53TlXJxKD3vA4Uc+V2fMt+7v3BPgWL++fEfT/a
   4eGgj6ryp4xPnBi/fWw39HTN/vXuTw75wrIooercUOo33l/GHfKqzFdbn
   A==;
X-CSE-ConnectionGUID: QVGezBvATriU+/9Lzlj8+w==
X-CSE-MsgGUID: gBzz0cD4Sx+CMUfWPkVWVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1915879"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1915879"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:12:56 -0700
X-CSE-ConnectionGUID: E6q4ZmgVTbiEWp7v1hnTEA==
X-CSE-MsgGUID: fqa3W+ZoTTyDDhGmATnHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6680906"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 28 Oct 2026 06:12:55 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM3SX-000000004sL-0QRn;
	Wed, 28 Oct 2026 13:12:53 +0000
Date: Wed, 28 Oct 2026 14:12:39 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-lazy-pte 2/6]
 arch/m68k/include/asm/sun3_pgtable.h:113:33: error: lvalue required as unary
 '&' operand
Message-ID: <202610281448.OI62nS7E-lkp@intel.com>
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
config: m68k-randconfig-r2111-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281448.OI62nS7E-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281448.OI62nS7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281448.OI62nS7E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/pgtable_mm.h:134,
                    from arch/m68k/include/asm/pgtable.h:10,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from mm/memory.c:43:
   include/linux/pgalloc.h: In function 'pmdp_try_populate_kernel':
>> arch/m68k/include/asm/sun3_pgtable.h:113:33: error: lvalue required as unary '&' operand
     113 | #define pmd_none(pmd) pmd_none2(&(pmd))
         |                                 ^
   include/linux/pgalloc.h:53:14: note: in expansion of macro 'pmd_none'
      53 |         if (!pmd_none(pmdp_get(pmdp)))
         |              ^~~~~~~~


vim +113 arch/m68k/include/asm/sun3_pgtable.h

^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  110  
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  111  
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  112  static inline int pmd_none2 (pmd_t *pmd) { return !pmd_val (*pmd); }
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16 @113  #define pmd_none(pmd) pmd_none2(&(pmd))
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  114  //static inline int pmd_bad (pmd_t pmd) { return (pmd_val (pmd) & SUN3_PMD_MASK) != SUN3_PMD_MAGIC; }
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  115  static inline int pmd_bad2 (pmd_t *pmd) { return 0; }
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  116  #define pmd_bad(pmd) pmd_bad2(&(pmd))
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  117  static inline int pmd_present2 (pmd_t *pmd) { return pmd_val (*pmd) & SUN3_PMD_VALID; }
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  118  /* #define pmd_present(pmd) pmd_present2(&(pmd)) */
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  119  #define pmd_present(pmd) (!pmd_none2(&(pmd)))
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  120  static inline void pmd_clear (pmd_t *pmdp) { pmd_val (*pmdp) = 0; }
^1da177e4c3f41 include/asm-m68k/sun3_pgtable.h Linus Torvalds 2005-04-16  121  

:::::: The code at line 113 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
