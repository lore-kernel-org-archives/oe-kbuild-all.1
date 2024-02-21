Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580780606
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529049; cv=none; b=oeNA7UBna7KTTYwlnU4XfOgHJTegsmmfwnJqfVEHvZsGziz78Vgbv59hPsa2j0euMWF6Wa44F4Q9ORjC7/m2t8BrHLNxqgYrTm/Y5tweY18FoQIlTyOyiBbxxg8L94qTQc0hEkck4Pk+7hErICGQTUKTMksEQs8RW1EB/vKFRQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529049; c=relaxed/simple;
	bh=Z6LQWYXcOg5IUgr80ddNzP3W1fOAmvAOVyRaa+PPa6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P1FiWTAby2mx0fuPgNSlprVwxjEA4jPAN25V8623gJ+8UofxszRt5j+f5+ao5gAiSJ7373HZN5+jsSuyW5mhb4z10wVE8pPoyP87jXo7TxCQJxq3+dqJ1EnDinysgUCuQWFP6TaZbNgc8S4d34KMwCfVJeF/Yf25igVrQAF201Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YykxxoTj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YykxxoTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529046; x=1740065046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6LQWYXcOg5IUgr80ddNzP3W1fOAmvAOVyRaa+PPa6o=;
  b=YykxxoTjjaiN+ZAVCJ/KdvWT1f2ikjGeCFIRQJxC/RLkwKV66PbDfXNw
   W1SGxixWTsWyDsBiSbrxxYq0NM7n5KOpOSaXCoO3gFhh3T0N3mUUFDlDi
   yPbU9YW9vRGsmwCMg1gyIwlL+oGxwHd3gbiokFqOjKPbqh9GtNwFRuLpK
   Q9lYPustgfFBugzm7xJzvd7sYf5+oPZNhEqik4jT/xNo0ShMWw4328dl5
   ylKIKJQy5cYywxGc82NiiG3uQQlYBmsVjv0MHBf28TAOlOLKPIwLpaft1
   gIgW6TuKeDulH8F5iawNQJzY0x92sOSDKSB5ru/amqE0BB60O/cV89sfu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25156516"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="25156516"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936658857"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="936658857"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 07:24:02 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcoRt-0005Qw-13;
	Wed, 21 Feb 2024 15:23:57 +0000
Date: Wed, 21 Feb 2024 23:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/arm64/mm/fault.c:1338:12: warning: 'fixup_alignment' defined
 but not used
Message-ID: <202402212353.AkQIu6FW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: e55f6ef6b718005b3cac70670420798aaf0174c3 ampere/arm64: Add a fixup handler for alignment faults in aarch64 code
date:   2 years, 7 months ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240221/202402212353.AkQIu6FW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402212353.AkQIu6FW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402212353.AkQIu6FW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/mm/fault.c:1485:29: warning: no previous prototype for 'do_mem_abort' [-Wmissing-prototypes]
    1485 | asmlinkage void __exception do_mem_abort(unsigned long addr, unsigned int esr,
         |                             ^~~~~~~~~~~~
   arch/arm64/mm/fault.c:1503:29: warning: no previous prototype for 'do_el0_irq_bp_hardening' [-Wmissing-prototypes]
    1503 | asmlinkage void __exception do_el0_irq_bp_hardening(void)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/fault.c:1509:29: warning: no previous prototype for 'do_el0_ia_bp_hardening' [-Wmissing-prototypes]
    1509 | asmlinkage void __exception do_el0_ia_bp_hardening(unsigned long addr,
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/fault.c:1526:29: warning: no previous prototype for 'do_sp_pc_abort' [-Wmissing-prototypes]
    1526 | asmlinkage void __exception do_sp_pc_abort(unsigned long addr,
         |                             ^~~~~~~~~~~~~~
   arch/arm64/mm/fault.c:1648:29: warning: no previous prototype for 'do_debug_exception' [-Wmissing-prototypes]
    1648 | asmlinkage void __exception do_debug_exception(unsigned long addr_if_watchpoint,
         |                             ^~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/fault.c:1338:12: warning: 'fixup_alignment' defined but not used [-Wunused-function]
    1338 | static int fixup_alignment(unsigned long addr, unsigned int esr,
         |            ^~~~~~~~~~~~~~~


vim +/fixup_alignment +1338 arch/arm64/mm/fault.c

  1337	
> 1338	static int fixup_alignment(unsigned long addr, unsigned int esr,
  1339				   struct pt_regs *regs)
  1340	{
  1341		u32 insn;
  1342		int res;
  1343	
  1344		if (user_mode(regs)) {
  1345			__le32 insn_le;
  1346	
  1347			if (!is_ttbr0_addr(addr))
  1348				return 1;
  1349	
  1350			if (get_user(insn_le,
  1351				     (__le32 __user *)instruction_pointer(regs)))
  1352				return 1;
  1353			insn = le32_to_cpu(insn_le);
  1354		} else {
  1355			if (aarch64_insn_read((void *)instruction_pointer(regs), &insn))
  1356				return 1;
  1357		}
  1358	
  1359		switch (aarch64_get_insn_class(insn)) {
  1360		case AARCH64_INSN_CLS_BR_SYS:
  1361			if (aarch64_insn_is_dc_zva(insn))
  1362				res = align_dc_zva(addr, regs);
  1363			else
  1364				res = 1;
  1365			break;
  1366		case AARCH64_INSN_CLS_LDST:
  1367			res = align_ldst(insn, regs);
  1368			break;
  1369		default:
  1370			res = 1;
  1371		}
  1372		if (!res) {
  1373			instruction_pointer_set(regs, instruction_pointer(regs) + 4);
  1374		}
  1375		return res;
  1376	}
  1377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
