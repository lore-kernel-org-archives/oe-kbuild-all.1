Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C67A2C0F8C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 02:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783908148; cv=none; b=uHGpsMLS//ng67FzpoCDuoAsQRBdhTK/mUMgwqbi9Pr8bRC13j24UH3E+LfIGUAkDay7G3K7U596EsIRXH+AznF030yRkULmGvn5l5/c7obXChRtBuFOXxkAi8000Gg0X3aVbLr+1cYSaRvENre98n4ALh+xDnRk4+BO2UfiURk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783908148; c=relaxed/simple;
	bh=HwsJLO026WUccT01XknYDxwCnbY7+yb4vrlqVNM45lo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iw13GIzK/9JDb2ebCWg6QXYQS3BkcNqxR/OKPxM1PpVyW2GDNIDJ0tk73vBo9unnsxZw3i0k5UpB6RSCIOdK6cNA2kwRsRRsMq5gNUjBhncD9s2yhqr4YflZAj7ZPSIU/whoLqX7VRmkX2iJWQmh85Lff2ympie/vQjBBh7y+uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leu6gVDb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leu6gVDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783908146; x=1815444146;
  h=date:from:to:cc:subject:message-id;
  bh=HwsJLO026WUccT01XknYDxwCnbY7+yb4vrlqVNM45lo=;
  b=leu6gVDbUgLH6ShTYQUGmFCf+bHtKqrAQLtHWUyVvyyCBspTWO9gLCPK
   PdFOPOllR3MtNQWL/g3YVqINkXufA3kc6QirImA51X2O2tpYx5SPYNHCL
   pStdPAbdYvADdAmgjHbXGFTFZl9sdpW/sYMP7VFHt0RSJcR5aFe/fDz6S
   H+inygiHOTMyMBU6eubhkuHHJWVMQREk9G8CscbLonY5WOinhCjiB0wX2
   +IDMQLiBUiaP2eeXTaSX0kdTvffT+nB9SsgAAqNCChMYkNOZiFxcrvLxs
   QGihoV0rWf4CQvxgF9U+J1Q61nl7BXQHo6YrT2y+SRqIoYbYJf0rSJBiu
   w==;
X-CSE-ConnectionGUID: NLYN4/yNTvyDR8/+dI8MeQ==
X-CSE-MsgGUID: an4vIz9VTKaP0wNvZE/TQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84480185"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84480185"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 19:02:10 -0700
X-CSE-ConnectionGUID: 2hRglUt+RGSoPGC7zWDCnQ==
X-CSE-MsgGUID: SkKadC7rQ4OwSpZ9thD+Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256048627"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Jul 2026 19:02:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj5zi-00000000LHU-1foX;
	Mon, 13 Jul 2026 02:02:06 +0000
Date: Mon, 13 Jul 2026 10:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 49/59]
 arch/mips/bcm63xx/cpu.c:303:10: error: call to undeclared function
 'current_cpu_type'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607130847.2rL2I7BS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: dc057dc5f95cb914748472aedcb49ebc5953debf [49/59] mips: Select ARCH_HAS_RANDOM_ENTROPY
config: mips-randconfig-r071-20260713 (https://download.01.org/0day-ci/archive/20260713/202607130847.2rL2I7BS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130847.2rL2I7BS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130847.2rL2I7BS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/mips/bcm63xx/cpu.c:303:10: error: call to undeclared function 'current_cpu_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     303 |         switch (current_cpu_type()) {
         |                 ^
   1 error generated.


vim +/current_cpu_type +303 arch/mips/bcm63xx/cpu.c

e7300d04bd0809 Maxime Bizon     2009-08-18  293  
e7300d04bd0809 Maxime Bizon     2009-08-18  294  void __init bcm63xx_cpu_init(void)
e7300d04bd0809 Maxime Bizon     2009-08-18  295  {
13be798c57ebe5 Jonas Gorski     2013-03-21  296  	unsigned int tmp;
2b5b9b786c177f Florian Fainelli 2009-10-14  297  	unsigned int cpu = smp_processor_id();
13be798c57ebe5 Jonas Gorski     2013-03-21  298  	u32 chipid_reg;
e7300d04bd0809 Maxime Bizon     2009-08-18  299  
e7300d04bd0809 Maxime Bizon     2009-08-18  300  	/* soc registers location depends on cpu type */
13be798c57ebe5 Jonas Gorski     2013-03-21  301  	chipid_reg = 0;
e7300d04bd0809 Maxime Bizon     2009-08-18  302  
d7b12056bc9cbd Wu Zhangjin      2010-12-26 @303  	switch (current_cpu_type()) {

:::::: The code at line 303 was first introduced by commit
:::::: d7b12056bc9cbd7f0c0ae5bc52f2b049d48c4314 MIPS: Use current_cpu_type() instead of c->cputype

:::::: TO: Wu Zhangjin <wuzhangjin@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
