Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AC46D551
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338985; cv=none; b=BXc6UlfxO/XTTqRhTCKoj7/JrpYD0skll5UsCTQ3r+0aq458hUxr4itv1fQKVYkKI7Xf6ISiQm3qAns64VimPE3WiCiqMOqp00rC26Nsivgt+qYiCb4vxXLGSo97awAtBsN2Qq6FlKsyZAD7h0ZXu3zl9p1bnjtREDDnLl+T89Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338985; c=relaxed/simple;
	bh=VcTQLGqh44nVnoT7oo/6myimNiJ56dFV98l0+emWbFk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P61vupWr9ThQutANbtmVunwwBhSSUnf4/iuddSIToQS0Oj22/Pes2qa1ZXqLpFv68yBYdAW6EsJ2DtzFoGjtDKIwnvVN0oeZh9UzlOPo48sQqc0I+nX+qrGOGWP7y3chhRfMoIQGTlBh7hsfnsUmO7I26ox0bN9BgSP+PBMd780=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9QT4EGJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9QT4EGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790338983; x=1821874983;
  h=date:from:to:cc:subject:message-id;
  bh=VcTQLGqh44nVnoT7oo/6myimNiJ56dFV98l0+emWbFk=;
  b=m9QT4EGJdLTN4FWw8MQ8C3Xb8bolWHV1LWebRQx5UB1umEWcTJiqDz8E
   uUdBcivVjnIZteLNqSEqGLmjajcFmImo9/EeAmZJ7uO0j4sYN13AQF+YU
   UZ5gqvIflulbGwOQ0XjZFA+JBCgwrKH7nAEcnqTme8gq9yBuT1GxqJKgc
   DOHTvlyoZEU+uwzCNtb3hYhel3kdCe/iVLStBU6PINi8DAi5KXzgqQGhN
   yiv4fAx/2zZvk6dMDaJZYsI07xLJpRvVHGhcPQFNXtnzUqebvMDXuhdTT
   FhaeyY9Rn3lGAETxpLIPkbCBcA7INhoMlHojwhXwj9YenNjR1LyvOVSTw
   Q==;
X-CSE-ConnectionGUID: N3wrtiWRSveoZFune3fvuA==
X-CSE-MsgGUID: rA66nOs1QJiPRGK0nWhCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90341949"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90341949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 05:23:02 -0700
X-CSE-ConnectionGUID: hnN5A+MaS/SIaNsHrrUS9A==
X-CSE-MsgGUID: bGT1CByyTXSDKJV7/kl5xg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2026 05:23:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA4x7-00000000Kaq-3i6r;
	Fri, 25 Sep 2026 12:22:57 +0000
Date: Fri, 25 Sep 2026 20:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 609/673]
 include/asm-generic/io.h:1099:16: error: implicit declaration of function
 '__pa'
Message-ID: <202609252034.msEqqqSo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 5820acdc34867db3abad330764e2069a3fb15216 [609/673] Revert "asm/io.h: move virt_to_phys/phys_to_virt"
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609252034.msEqqqSo-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252034.msEqqqSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252034.msEqqqSo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/io_32.h:21,
                    from arch/sparc/include/asm/io.h:7,
                    from include/linux/io.h:12,
                    from lib/iomem_copy.c:8:
   include/asm-generic/io.h: In function 'virt_to_phys':
>> include/asm-generic/io.h:1099:16: error: implicit declaration of function '__pa' [-Wimplicit-function-declaration]
    1099 |         return __pa((unsigned long)address);
         |                ^~~~
   include/asm-generic/io.h: In function 'phys_to_virt':
>> include/asm-generic/io.h:1107:16: error: implicit declaration of function '__va' [-Wimplicit-function-declaration]
    1107 |         return __va(address);
         |                ^~~~
>> include/asm-generic/io.h:1107:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
    1107 |         return __va(address);
         |                ^~~~~~~~~~~~~
   include/linux/io.h: At top level:
   include/linux/io.h:28:47: error: unknown type name 'pgprot_t'
      28 |                        phys_addr_t phys_addr, pgprot_t prot);
         |                                               ^~~~~~~~
   include/linux/io.h:30:44: error: unknown type name 'pgprot_t'
      30 |                     phys_addr_t phys_addr, pgprot_t prot);
         |                                            ^~~~~~~~
   include/linux/io.h:80:1: warning: data definition has no type or storage class
      80 | pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phys_addr,
         | ^~~~~~~~
   include/linux/io.h:80:1: error: type defaults to 'int' in declaration of 'pgprot_t' [-Wimplicit-int]
   include/linux/io.h:80:1: warning: 'cold' attribute ignored [-Wattributes]
   include/linux/io.h:80:17: error: expected ',' or ';' before 'early_memremap_pgprot_adjust'
      80 | pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phys_addr,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__pa +1099 include/asm-generic/io.h

  1090	
  1091	/*
  1092	 * Change virtual addresses to physical addresses and vv.
  1093	 * These are pretty trivial
  1094	 */
  1095	#ifndef virt_to_phys
  1096	#define virt_to_phys virt_to_phys
  1097	static inline unsigned long virt_to_phys(volatile void *address)
  1098	{
> 1099		return __pa((unsigned long)address);
  1100	}
  1101	#endif
  1102	
  1103	#ifndef phys_to_virt
  1104	#define phys_to_virt phys_to_virt
  1105	static inline void *phys_to_virt(unsigned long address)
  1106	{
> 1107		return __va(address);
  1108	}
  1109	#endif
  1110	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
