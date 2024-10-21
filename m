Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8142E62C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 02:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729476591; cv=none; b=DOH/xg2HwgI2Bi0atpYzymLMAtbkpUWkBrY44JrWxPGE0eZoJQvAyVHMch5CxIA5dAHoLkpzb2lb2/LdNHF8trWOKijS+Tz1/dpTCx7NsoH6QLfA3d93j4lYbTmpp8Ok9OzogBFCMs2sKUQ6zdIHetl9ocglSayO5ZnTDbRhWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729476591; c=relaxed/simple;
	bh=H26QCQd7/9dqd2J6EQ3pISuakVTJ9Ek7X8Oendw/y6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ly4jNCfEB84AyDcT6olRKteIbhs5AyvjaqfqF1aem3WgdDmAlCCstvXdpDGCEEX8QsiGX1CTkx7XSC1DdWtOXJjKSO/m0T2P5XVof5y3pF29N/y/1hXIBTvgPwBpWn4cuL9ceCh6p6lSyNo07D3xPsVLdDGd0pB/3EqxVI/QslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NB935zKj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NB935zKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729476590; x=1761012590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H26QCQd7/9dqd2J6EQ3pISuakVTJ9Ek7X8Oendw/y6E=;
  b=NB935zKjJfT5isxV82BBkXIjsN1b0k3VuFTYQZJMmBko3v7MHgCy6vdm
   2t/70/8XSAZcDw+au+4C/oSDU4Y7JAoLqGqgHJRIHixUR+fo3/zC/lS0g
   om5dAFqRSSxnkCyxBm4IYuXcqJQaNWjPwJowP6pg8SaPdFw0iiZ8SEK38
   p0gOm+EKBaQJMLLNVLy4wGk/BJrgCcnXEwIC67W5+XH6WLz5EQ2+C4Omb
   nvjfD5Q4no6mxZfu+Vgk7cBrg9ysy+E58ZMyc/4Nrx27Riu0Mymyx6T1J
   8UO3MgKT8DEFxxmqxZG0YQe2UaF8BVxERl0ogHmJi5xPt3YDo8VxPmqPC
   w==;
X-CSE-ConnectionGUID: NLKwiVy4TFGB0abGTJ9B7g==
X-CSE-MsgGUID: lg01q8zASQWMhH1hFMbulg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32858879"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="32858879"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 19:09:48 -0700
X-CSE-ConnectionGUID: 1NnVO2L+RVuiG8TxWNtpfg==
X-CSE-MsgGUID: UHLtHqW/RwKu2Nt+4Mzdeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="78981913"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Oct 2024 19:07:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2hpR-000R2R-0N;
	Mon, 21 Oct 2024 02:07:29 +0000
Date: Mon, 21 Oct 2024 10:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [linux-next:pending-fixes 476/742] arch/riscv/kernel/acpi.c:213:30:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202410210953.CRe6JG4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   4778061ba8680be32d596bf0d43ff7efca73245d
commit: 0dcf8269ecee961f940b78365e124927d99c112b [476/742] RISC-V: ACPI: fix early_ioremap to early_memremap
config: riscv-randconfig-r122-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210953.CRe6JG4O-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410210953.CRe6JG4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210953.CRe6JG4O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/acpi.c:213:30: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   arch/riscv/kernel/acpi.c:213:30: sparse:     expected void [noderef] __iomem *
   arch/riscv/kernel/acpi.c:213:30: sparse:     got void *
>> arch/riscv/kernel/acpi.c:221:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *map @@
   arch/riscv/kernel/acpi.c:221:24: sparse:     expected void *addr
   arch/riscv/kernel/acpi.c:221:24: sparse:     got void [noderef] __iomem *map

vim +213 arch/riscv/kernel/acpi.c

   203	
   204	/*
   205	 * __acpi_map_table() will be called before paging_init(), so early_ioremap()
   206	 * or early_memremap() should be called here to for ACPI table mapping.
   207	 */
   208	void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
   209	{
   210		if (!size)
   211			return NULL;
   212	
 > 213		return early_memremap(phys, size);
   214	}
   215	
   216	void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
   217	{
   218		if (!map || !size)
   219			return;
   220	
 > 221		early_memunmap(map, size);
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
