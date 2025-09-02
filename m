Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD52F7454
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808589; cv=none; b=Cs9EPmc1bWfmQa/Z3zoCf8mB/MpynDjJ3GY3Ir1pH5VclAZ2u2ITGxxR/tQqfNLmApQvz0OoSISxbWXwqC2b/B/pqUfKopyEygw1eO9BJu2AWfDCEYO3o/a0GbHIEmm6Ys9qwgqrzKdIlvkHlAsUS2WrkQ2cGopTd8Wnn9epsZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808589; c=relaxed/simple;
	bh=JSxPYtu/+9A5Qv7APTyHx6FYnr8rExU2l5wsOMBIQNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqJLoqSRvp74bSUB7QHR9DqoA3YUMV22zdI1o/G4VWzCTVyoEboUNUiTodgls4Bww4lD0/tYQJqp3qH4p1ZC9VGo4lvHSGp/qBLJJu/Xo2lynSJ6hWysKUNJHLNxixtkYqIcPOCTfuHk3EMux5MrnPy2VF7R0x9sCQ+/yoXyXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EryQZcd2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EryQZcd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756808588; x=1788344588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JSxPYtu/+9A5Qv7APTyHx6FYnr8rExU2l5wsOMBIQNk=;
  b=EryQZcd2pEYPRehSBDWLKQzpbwdsofEiAJcuxtKIrdl/mVlwqk+JZLBf
   PbOHqyOoMGx1oM8+qR2JMO7zkHUbkaLOAONZSUtGoL6DRC38FTY9RIJL4
   IoybT40qvZ8EyR4YDaqIEUDnI15LRg3LpNMCrScyPiHcOnMwqqqrG7/5+
   9IOxchd5JGMv0fOFNhhQyIHusKsCyrlHcQkRSrcp4kiE00d0wEWW+b0Uk
   nWC8kBo5g+8sDnD4yFn0rFCTcsnWueI4jLkFRS1nkF2z0hu/3n7vM0LqI
   T95pSKASNsTpINkci6r+IYmTMak5s2oymjSWjIEBUcp4eLztmdruamGnJ
   g==;
X-CSE-ConnectionGUID: Ox+SXDmnQY2TCoICUWCNNQ==
X-CSE-MsgGUID: p7VQfobhSDiMZFPpo1x4Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59025295"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59025295"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:23:08 -0700
X-CSE-ConnectionGUID: qr3Hd1BVTuOS+1Ar8/0GsA==
X-CSE-MsgGUID: lzGSRa4aQJ+nVCoSLlOfZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171682119"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2025 03:23:06 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utOAK-0001pJ-0K;
	Tue, 02 Sep 2025 10:23:04 +0000
Date: Tue, 2 Sep 2025 18:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2835/2835]
 arch/loongarch/kernel/legacy_boot.c:106:34: error: call to undeclared
 function 'nid_to_addrbase'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202509021841.nRo3YUph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0ee8b2a47575cd8786900505a657c833b2dd4c2f
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [2835/2835] LoongArch: Old BPI compatibility
config: loongarch-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021841.nRo3YUph-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021841.nRo3YUph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021841.nRo3YUph-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/legacy_boot.c:11:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/loongarch/kernel/legacy_boot.c:106:34: error: call to undeclared function 'nid_to_addrbase'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     106 |                 pchpic_default[idx].address |= nid_to_addrbase(id) | HT1LO_OFFSET;
         |                                                ^
   arch/loongarch/kernel/legacy_boot.c:94:6: warning: no previous prototype for function 'register_default_pic' [-Wmissing-prototypes]
      94 | void register_default_pic(int id, u32 address, u32 irq_base)
         |      ^
   arch/loongarch/kernel/legacy_boot.c:94:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      94 | void register_default_pic(int id, u32 address, u32 irq_base)
         | ^
         | static 
   arch/loongarch/kernel/legacy_boot.c:242:13: warning: no previous prototype for function 'fw_init_cmdline' [-Wmissing-prototypes]
     242 | __init void fw_init_cmdline(unsigned long argc, unsigned long cmdp)
         |             ^
   arch/loongarch/kernel/legacy_boot.c:242:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     242 | __init void fw_init_cmdline(unsigned long argc, unsigned long cmdp)
         |        ^
         |        static 
   arch/loongarch/kernel/legacy_boot.c:341:14: warning: no previous prototype for function 'bpi_init' [-Wmissing-prototypes]
     341 | unsigned int bpi_init(void)
         |              ^
   arch/loongarch/kernel/legacy_boot.c:341:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     341 | unsigned int bpi_init(void)
         | ^
         | static 
   4 warnings and 1 error generated.


vim +/nid_to_addrbase +106 arch/loongarch/kernel/legacy_boot.c

    93	
    94	void register_default_pic(int id, u32 address, u32 irq_base)
    95	{
    96		int idx, entries;
    97		unsigned long addr;
    98	
    99		if (bad_pch_pic(address))
   100			return;
   101	
   102		idx = nr_io_pics;
   103	
   104		pchpic_default[idx].address = address;
   105		if (idx)
 > 106			pchpic_default[idx].address |= nid_to_addrbase(id) | HT1LO_OFFSET;
   107		pchpic_default[idx].id = id;
   108		pchpic_default[idx].version = 0;
   109		pchpic_default[idx].size = 0x1000;
   110		pchpic_default[idx].gsi_base = irq_base;
   111	
   112		msi_group[nr_io_pics].pci_segment = nr_io_pics;
   113		pch_group[nr_io_pics].node = msi_group[nr_io_pics].node = id;
   114	
   115		addr = pchpic_default[idx].address;
   116		/* Read INT_ID.int_num */
   117		entries = (((unsigned long)ls7a_readq(addr) >> 48) & 0xff) + 1;
   118		pchmsi_default[idx].msg_address = MSI_MSG_ADDRESS;
   119		pchmsi_default[idx].start = entries;
   120		pchmsi_default[idx].count = MSI_MSG_DEFAULT_COUNT;
   121	
   122		eiointc_default[idx].cascade = 3;
   123		eiointc_default[idx].node = id;
   124		eiointc_default[idx].node_map = 1;
   125	
   126		if (idx) {
   127			eiointc_default[idx].cascade = 0x4;
   128			eiointc_default[0].node_map = 0x1DF;
   129			eiointc_default[idx].node_map = 0xFE20;
   130		}
   131	
   132		acpi_pchpic[idx] = &pchpic_default[idx];
   133		acpi_pchmsi[idx] = &pchmsi_default[idx];
   134		acpi_eiointc[idx] = &eiointc_default[idx];
   135	
   136		nr_io_pics++;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
