Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FA93845BE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527137; cv=none; b=KLk7OH2eezvRxphTCB33tQ8sGZjOMmpTJzrq/Ic8cJyJQOHCMDaTFGGydz5u3gscSznyl+OvtT4YpodQmRmZKtpHns1Sw47s5RcNNC+34TAL449wAvADDzbbCHNJvgSMk56vypPbHYeI/KTr7Bon1K1uB+70CG9izWpiIQfVEhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527137; c=relaxed/simple;
	bh=Z3TjDeoAaDmtw48YqzucD4ucOTZlfZPtM6mAHxt2vhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BuWgFUTRcqZf7IVyUgXHRDYyep+se8hA+ZG7uqJOtGRWul4EDNsACRVrYGFp7xUkV5pcjrXkC39x/Pzwit9EVuMBCi+jzdp1zvMT6t1JGMAKR5iMgYZiqraboATMiVv6vgrdko/0wGgmLn6FFe8NUjVxkJykyd2W10vFpRxuDeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQqx6m3R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQqx6m3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772527135; x=1804063135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z3TjDeoAaDmtw48YqzucD4ucOTZlfZPtM6mAHxt2vhQ=;
  b=DQqx6m3Rixv2dq81621iHQFlrgE3f9zR2rPPUShKYevZZOdv1Uk8Z+zP
   3ggL7iqSl69IX/hX3KjV/z/ku0DT+CKYgkkKdLIXc23sfHCzx3JlF2P1G
   re3eUGsgO7b74L8L3OQRbZZt/ykQOis8NzaIZ3aX6NmEhl+gCNngCy1yS
   P5kDVHJSPoZ1/Kz5CDLSlkN6Y4GH1wPEEswG8rWb1eMSKk+Z1TZT10Wsa
   SYmhJDVnYhSr6nbz7hMzFLehyDE5efFdpWluMeZM1nCWrKDpn/ny58rmu
   I61f0Y4ZqyTYN7H35U3aZg5LuHHlMxQxLTL3Vgu3ufquF4+dzw9wemN/l
   A==;
X-CSE-ConnectionGUID: JyIS203ESQy0gFVOw/HPqw==
X-CSE-MsgGUID: 6s7gaXe7QbiwWeWarD2hIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="99029011"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="99029011"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:38:54 -0800
X-CSE-ConnectionGUID: lzjjhaEqRD2Pmgv/Ni4JMw==
X-CSE-MsgGUID: WcIhv7hlRfyW1K1WRVdiqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="244827798"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2026 00:38:53 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxLHG-000000001tj-2XWo;
	Tue, 03 Mar 2026 08:38:50 +0000
Date: Tue, 03 Mar 2026 16:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-reloc 12/29]
 arch/parisc/kernel/module.c:193:30: error: 'R_PARISC_PCREL17F' undeclared
Message-ID: <202603031634.BVQ6IRcT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-reloc
head:   33f42a1893f9a3bf636eca78853700f3e57e9e36
commit: c7ea73cd189832801b6293176679b7514d82df2e [12/29] ARM: elf: Move relocation constants to the UAPI
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260303/202603031634.BVQ6IRcT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031634.BVQ6IRcT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031634.BVQ6IRcT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/parisc/kernel/module.c: In function 'count_stubs':
>> arch/parisc/kernel/module.c:193:30: error: 'R_PARISC_PCREL17F' undeclared (first use in this function)
     193 |                         case R_PARISC_PCREL17F:
         |                              ^~~~~~~~~~~~~~~~~
   arch/parisc/kernel/module.c:193:30: note: each undeclared identifier is reported only once for each function it appears in
>> arch/parisc/kernel/module.c:194:30: error: 'R_PARISC_PCREL22F' undeclared (first use in this function)
     194 |                         case R_PARISC_PCREL22F:
         |                              ^~~~~~~~~~~~~~~~~
   arch/parisc/kernel/module.c: In function 'apply_relocate_add':
>> arch/parisc/kernel/module.c:548:22: error: 'R_PARISC_PLABEL32' undeclared (first use in this function); did you mean 'R_PPC_PLTREL32'?
     548 |                 case R_PARISC_PLABEL32:
         |                      ^~~~~~~~~~~~~~~~~
         |                      R_PPC_PLTREL32
>> arch/parisc/kernel/module.c:553:22: error: 'R_PARISC_DIR32' undeclared (first use in this function)
     553 |                 case R_PARISC_DIR32:
         |                      ^~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:557:22: error: 'R_PARISC_DIR21L' undeclared (first use in this function)
     557 |                 case R_PARISC_DIR21L:
         |                      ^~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:562:22: error: 'R_PARISC_DIR14R' undeclared (first use in this function)
     562 |                 case R_PARISC_DIR14R:
         |                      ^~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:567:22: error: 'R_PARISC_SEGREL32' undeclared (first use in this function)
     567 |                 case R_PARISC_SEGREL32:
         |                      ^~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:574:22: error: 'R_PARISC_SECREL32' undeclared (first use in this function)
     574 |                 case R_PARISC_SECREL32:
         |                      ^~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:578:22: error: 'R_PARISC_DPREL21L' undeclared (first use in this function)
     578 |                 case R_PARISC_DPREL21L:
         |                      ^~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:583:22: error: 'R_PARISC_DPREL14R' undeclared (first use in this function)
     583 |                 case R_PARISC_DPREL14R:
         |                      ^~~~~~~~~~~~~~~~~
   arch/parisc/kernel/module.c:588:22: error: 'R_PARISC_PCREL17F' undeclared (first use in this function)
     588 |                 case R_PARISC_PCREL17F:
         |                      ^~~~~~~~~~~~~~~~~
   arch/parisc/kernel/module.c:603:22: error: 'R_PARISC_PCREL22F' undeclared (first use in this function)
     603 |                 case R_PARISC_PCREL22F:
         |                      ^~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/module.c:618:22: error: 'R_PARISC_PCREL32' undeclared (first use in this function)
     618 |                 case R_PARISC_PCREL32:
         |                      ^~~~~~~~~~~~~~~~


vim +/R_PARISC_PCREL17F +193 arch/parisc/kernel/module.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  185  
^1da177e4c3f41 Linus Torvalds 2005-04-16  186  static inline unsigned long count_stubs(const Elf_Rela *rela, unsigned long n)
^1da177e4c3f41 Linus Torvalds 2005-04-16  187  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  188  	unsigned long cnt = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  189  
^1da177e4c3f41 Linus Torvalds 2005-04-16  190  	for (; n > 0; n--, rela++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  191  	{
^1da177e4c3f41 Linus Torvalds 2005-04-16  192  		switch (ELF32_R_TYPE(rela->r_info)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @193  			case R_PARISC_PCREL17F:
^1da177e4c3f41 Linus Torvalds 2005-04-16 @194  			case R_PARISC_PCREL22F:
^1da177e4c3f41 Linus Torvalds 2005-04-16  195  				cnt++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  196  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  197  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  198  
^1da177e4c3f41 Linus Torvalds 2005-04-16  199  	return cnt;
^1da177e4c3f41 Linus Torvalds 2005-04-16  200  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  201  #else
^1da177e4c3f41 Linus Torvalds 2005-04-16  202  static inline unsigned long count_gots(const Elf_Rela *rela, unsigned long n)
^1da177e4c3f41 Linus Torvalds 2005-04-16  203  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  204  	unsigned long cnt = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  205  
^1da177e4c3f41 Linus Torvalds 2005-04-16  206  	for (; n > 0; n--, rela++)
^1da177e4c3f41 Linus Torvalds 2005-04-16  207  	{
^1da177e4c3f41 Linus Torvalds 2005-04-16  208  		switch (ELF64_R_TYPE(rela->r_info)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  209  			case R_PARISC_LTOFF21L:
^1da177e4c3f41 Linus Torvalds 2005-04-16  210  			case R_PARISC_LTOFF14R:
^1da177e4c3f41 Linus Torvalds 2005-04-16  211  			case R_PARISC_PCREL22F:
^1da177e4c3f41 Linus Torvalds 2005-04-16  212  				cnt++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  213  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  214  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  215  
^1da177e4c3f41 Linus Torvalds 2005-04-16  216  	return cnt;
^1da177e4c3f41 Linus Torvalds 2005-04-16  217  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  218  

:::::: The code at line 193 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
