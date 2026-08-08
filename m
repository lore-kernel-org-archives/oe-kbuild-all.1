Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50C34B697
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786208029; cv=none; b=qSF/J5C3pUnIOeXVC6n+TEhuPXCq6WPBwtvUSA5iiZGr1XEUE/x/ryYVljcbHnWdE5bn0L5RwlcXAPHmEas9nQZBGvSdKHsmeAFtxSsSC65jfXoXebr9NfsU6jqyZY1iYBG50fej/f1a+n5ehbVoh52x3fGptpUZ07tLiE8AMsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786208029; c=relaxed/simple;
	bh=TkO3dJYVc1h0rJMBjmcAc4bOqYZhfdodJ0kEMancqlI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FDq0tVffsOhGH5s9eWuBMgNuWAHwQ+vQvoJM5tjJsKfY0o6IiOgv8OsKl6wwgjhPxur9P2sfPvqFjUaaarawFR2PgZxyZ3UeYriOkDEAe74w2iXtQKDbHn+g9yfudcrvm2fQrhywbHyYkeRN2F6YRXhWweVH4Kz7SSWzZljILyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQ4afeM4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQ4afeM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786208028; x=1817744028;
  h=date:from:to:cc:subject:message-id;
  bh=TkO3dJYVc1h0rJMBjmcAc4bOqYZhfdodJ0kEMancqlI=;
  b=WQ4afeM4RoRJFFsRAmvb29AocTKbdWdmxoKYja67NmPPqxAfmyRJs+o1
   mQncYC2ZcueIOipUNb+dYmrsPwBv7Nt/TUAQE+fFoaU7YiTYgG74Fe+gz
   9ZfOxAw3uiFDDkzYnoqRFMet53KIjNuCeu1XBxXdVYksXBpfJ2szGFmct
   VIRTeWyY3cGtyvO/sixnIlhEL/rXfRyXOpXyrNQEGi7LwMg65ZlNYGnC7
   aKlWZ58ahKSn3dyaS5+JeavCRq0j3GzniXJAvkM7GgNUHTlVUG9b4iKJv
   AVwvyo76sD7q8+gH2KojZ/Bf5xmETyeiqBz6MbhAryb7PwDWsn6f6sUXV
   Q==;
X-CSE-ConnectionGUID: ozmmtqM6S+isz+LjMsCSFg==
X-CSE-MsgGUID: vGliQOvyRR+ZxMmOv8ga1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="97138099"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="97138099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 09:53:40 -0700
X-CSE-ConnectionGUID: mHAqmGlYQraqToCw7llreA==
X-CSE-MsgGUID: fw9fODsTT4O3irGa1LEYbQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Aug 2026 09:53:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wskIi-00000000KRX-0eKw;
	Sat, 08 Aug 2026 16:53:36 +0000
Date: Sun, 09 Aug 2026 00:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 11012/13846]
 arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202608090010.mAJg7B6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 8ae6e79ee0ce7a533c005d12c9a230b273f32ef1 [11012/13846] mips: econet: add multi-vpe capability to EN751221
config: mips-randconfig-r122-20260808 (https://download.01.org/0day-ci/archive/20260809/202608090010.mAJg7B6l-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608090010.mAJg7B6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608090010.mAJg7B6l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/mips/kernel/smp.c: note: in included file (through arch/mips/include/asm/mips-cps.h):
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void *
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void *
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void *
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void *
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void [noderef] __iomem *
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void [noderef] __iomem *
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void [noderef] __iomem *
>> arch/mips/include/asm/mips-cpc.h:109:1: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     expected void *
   arch/mips/include/asm/mips-cpc.h:109:1: sparse:     got void [noderef] __iomem *

vim +109 arch/mips/include/asm/mips-cpc.h

23cb600e3fd406 Paul Burton 2017-08-12  107  
829ca2be9c55c7 Paul Burton 2017-08-12  108  /* CPC_Cx_CMD - Instruct the CPC to take action on a core */
2c981e325f0c18 Paul Burton 2017-08-12 @109  CPC_CX_ACCESSOR_RW(32, 0x000, cmd)
829ca2be9c55c7 Paul Burton 2017-08-12  110  #define CPC_Cx_CMD				GENMASK(3, 0)
829ca2be9c55c7 Paul Burton 2017-08-12  111  #define  CPC_Cx_CMD_CLOCKOFF			0x1
829ca2be9c55c7 Paul Burton 2017-08-12  112  #define  CPC_Cx_CMD_PWRDOWN			0x2
829ca2be9c55c7 Paul Burton 2017-08-12  113  #define  CPC_Cx_CMD_PWRUP			0x3
829ca2be9c55c7 Paul Burton 2017-08-12  114  #define  CPC_Cx_CMD_RESET			0x4
829ca2be9c55c7 Paul Burton 2017-08-12  115  

:::::: The code at line 109 was first introduced by commit
:::::: 2c981e325f0c18e24ce252f16f5018b9ee805212 MIPS: CPC: Use common CPS accessor generation macros

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
