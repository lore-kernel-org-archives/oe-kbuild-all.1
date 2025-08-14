Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3A10FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 00:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755130474; cv=none; b=NOh8ILzZdWmW9SyiRj7LVCnbFHYoA/aBNxC70jCWOeNaKV3HUu9gnGTV4CdvV/Uq1+J/kVvuKnUqm3WonPJCmZ5Oj/aRuClKAIVOeIvwscethkygqgQevhestpMVpSQLf03OnLMoOZRTjfkQfCJ+GPE3Tn3nIfYTrJyrPCmsQ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755130474; c=relaxed/simple;
	bh=dFye3eXkNFwX18Ip02j0aN4HYAiROn4yjEUuNhvazP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFMrvRoq424cY8GySOVQtlDqfMijOxUImiM1th/O7C2sAxaUdsZfvSNXOKobDOA7Hsa0sweneYvg0ceqKqN09mbM5vhPvsdSxmqsvxR3whDKbp5mi6bNmltL87lXY0NppaNuzVC/MF+B9u5P0w0chyX5ttPfmG3cD+hKkbO5xJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsDDD2rW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsDDD2rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755130473; x=1786666473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFye3eXkNFwX18Ip02j0aN4HYAiROn4yjEUuNhvazP4=;
  b=LsDDD2rWh+jeZ3ZfV8I8eyUOIfOw4sNJMAsSkhMlibVpbrPWVtwUB98l
   IH775OH6naK+WZGkdRz66SdHv6MPitV4GQ0pODm4K77MWp3QQpVYatjEt
   pmesmGmvaFjijbFDnQB4MnGzF/70teGF0tpjB8cao/R7WceFhgwrDP9hw
   pzOId82z6PqV7m5KH4gMBoKJ1NB8UpXXxeZb7OGvJai03DNM8R2fQ/5dN
   cOAyyfSVfUtANuZSsAbByhRvv2qcNn4ZqPonfVllqO7du9+CvMY8wK8Gh
   XjjqTqT74+qioUr/OtpL4KYlDDSFnLLrI4Sg8ojhmO3xJaXEz1ex0kKEt
   w==;
X-CSE-ConnectionGUID: jRAiVaoUTSyGkzBe/vrepg==
X-CSE-MsgGUID: 6Vz6aw4VTK+yWdHZ3dhi5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74892507"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="74892507"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 17:14:31 -0700
X-CSE-ConnectionGUID: SFwuRi8MTiy95JqSMSYcKw==
X-CSE-MsgGUID: cl6dP0YfRZG4jx1+Q39TtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165794789"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2025 17:14:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umLbu-000ARM-2c;
	Thu, 14 Aug 2025 00:14:27 +0000
Date: Thu, 14 Aug 2025 08:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)'
 and 'vmlinux.a(security.o at 766562)'
Message-ID: <202508140806.Q4rNoCdr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dfc0f6373094dd88e1eaf76c44f2ff01b65db851
commit: 890ba5be6335dbbbc99af14ea007befb5f83f174 Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
date:   7 weeks ago
config: riscv-randconfig-r064-20250813 (https://download.01.org/0day-ci/archive/20250814/202508140806.Q4rNoCdr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140806.Q4rNoCdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508140806.Q4rNoCdr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(security.o at 766562)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(memory.o at 741302)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(volumes.o at 760982)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(vmscan.o at 740102)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(segment.o at 764222)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(btf.o at 737882)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(binder.o at 900542)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(inode.o at 760442)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(send.o at 762122)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(testmgr.o at 770042)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(file.o at 763622)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(page_alloc.o at 742262)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(hugetlb.o at 742922)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(ctree.o at 759902)'
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(namespace.o at 746582)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(pci.o at 807122)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(data.o at 764102)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(syscall.o at 736262)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(blk-mq.o at 775442)'
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values in 'vmlinux.a(init.o at 726002)' and 'vmlinux.a(node.o at 764162)'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
