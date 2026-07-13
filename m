Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7BD314A60
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 03:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783913026; cv=none; b=lhXkRPFlq4UpjjvWLbGZh8TpGz2+8zjj0ZRr2Xv1LL/C8U7sPiss5SjcJT/yrut9SKVUqEL5mP3Fb13VSRvhVFSvdRY2epOH4E1c0wqeTTF5+Aesrvm083wKPSl3Rt1+Q0YlxB+/TEy6TR/CV6wP/geyvl6l5TqryFNRFHxRH/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783913026; c=relaxed/simple;
	bh=peevcvnobOHT7FQF4e50Wu1B0iJr4H3lzY1rmlbqVFk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XDcJxeyyfKP/tm6z8d+TDW+Wn5fPgnam6tpnJTMsufB00OHvibLz+Fu8jITLePa9SdJrKq48aN1TRSsrXdg89DxLe0HZsklEEyNiQRYDAhD+NyCa8EXjNFhErixhJAuvePQhj8Q1NqgAqa2mSDKxWD7BeD4HgUDTyhoF1hHneBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Edm5KG68; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Edm5KG68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783913024; x=1815449024;
  h=date:from:to:cc:subject:message-id;
  bh=peevcvnobOHT7FQF4e50Wu1B0iJr4H3lzY1rmlbqVFk=;
  b=Edm5KG681CGagd+uuJXLoanvmUPFYgr7hojfTdxJ3wNBDrFtCz4jtSP/
   Ctr35I5pd53M9afvPCW2PoFKnzUvYhK+jTkAWaIov9R/nMeCiUEW/8XhV
   W8/rr3H4oDYW75OhQ7mO6TH8BqJ3b/ahafq5Q0NGHvLRXQeppjE1tS7J3
   3oDQ689anmRtUbBi4Jsd6YfmTw14p0IE6hSHRCKgM+Vh7tNZeaOKtb2WN
   MYX9oPOTMVYOKbqE+Pr+cDkAr/tLXr6MIUPLv5NB2HBXbQOYjSwElv3tk
   dIHqQ8h6+S9dU3dtxfdhU7+owlN0cXMhCTNL4cKBd0DHzVYts050sCX2x
   g==;
X-CSE-ConnectionGUID: 8Fd82NKxQ6qomZfEanvRtw==
X-CSE-MsgGUID: 3HAVRxvwRLqNGQDxP4sVYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107316856"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107316856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 20:23:42 -0700
X-CSE-ConnectionGUID: YutKNZzyTl+LrMmoxMyIXg==
X-CSE-MsgGUID: BRFABmiVTfGTz8nH9RPe2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259292282"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2026 20:23:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj7GX-00000000LKc-1Ov2;
	Mon, 13 Jul 2026 03:23:33 +0000
Date: Mon, 13 Jul 2026 11:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 49/59]
 arch/mips/bcm63xx/cpu.c:303:10: error: implicit declaration of function
 'current_cpu_type'; did you mean 'current_cpu_data'?
Message-ID: <202607131002.CFOusS91-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: dc057dc5f95cb914748472aedcb49ebc5953debf [49/59] mips: Select ARCH_HAS_RANDOM_ENTROPY
config: mips-randconfig-r073-20260713 (https://download.01.org/0day-ci/archive/20260713/202607131002.CFOusS91-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131002.CFOusS91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131002.CFOusS91-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/bcm63xx/cpu.c: In function 'bcm63xx_cpu_init':
>> arch/mips/bcm63xx/cpu.c:303:10: error: implicit declaration of function 'current_cpu_type'; did you mean 'current_cpu_data'? [-Werror=implicit-function-declaration]
     switch (current_cpu_type()) {
             ^~~~~~~~~~~~~~~~
             current_cpu_data
   cc1: some warnings being treated as errors


vim +303 arch/mips/bcm63xx/cpu.c

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
