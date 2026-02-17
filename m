Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA49327C05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329461; cv=none; b=oahm0TMRZTtSL/mD56pi/PS1cz988AaVZG9MGbeaX2t/w+1ggDCLU6wjDHoXGwcFl3melbb08TdVqO8TmYdiEPagacmD7cm2HxJYHmAMGFzjeILlZj6aong89B4FFk7pRogTaf5H7fQyGZLthBmtmkHkcDmBCT4FFW0x3mEb8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329461; c=relaxed/simple;
	bh=xYDBCaQqcgSW7jaSEnESYEj0g8YIIrr3BKbTOao6AYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qVHJQi8LT4R9GNjEkJfOfg2N5qe2XDp/lImD66xiC6WSuA1ZCEUl6Oyo6LiPncVxEi1J34TDQfb+Nt+pzcCWxpSfdayhWq+1buACoxyaIoqFdgnXPxTtaWie0BRTCxnSBmJIiVVMwogqnCK+dHEs6GODNZiBiC6jHYaY6AZ5Eqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNFa9UB/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNFa9UB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771329459; x=1802865459;
  h=date:from:to:cc:subject:message-id;
  bh=xYDBCaQqcgSW7jaSEnESYEj0g8YIIrr3BKbTOao6AYk=;
  b=mNFa9UB/5VlZ8Z5eKS5EZtQuRtb74EJU0EHDR1B5klRLjnbe5x8GAtf1
   4lkh+QdBgHzsBl8ie+EldtBvyKq0J66401D4uMTuRDzPgrkpf1R9RxEe7
   vz3zSOWR6zmEo/+7Sj21FuQnpalNUMiT4RnjIzQNPWF9VzV0rlNb7+I/f
   nxXc7R8hZQAUkjVExXMfWfTCpG22v8NVc9+7SR46PTevoegzLzkBOiaPu
   8ssNdmJhLdAoHFjbVsm6VIhpulVXNmkNUbbJHStf/vkzCjrbp/kBmRf9W
   Eg8bG1kSgd3VO1jzKcbNnZ7uY1JEMOuru+AjdawF4xf7ZQenhQEzOgHU2
   w==;
X-CSE-ConnectionGUID: DW+s5+xJRxaGKDjCNr6Trw==
X-CSE-MsgGUID: iUeviQEfSLCWmG8nDCW3ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83117972"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="83117972"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 03:57:39 -0800
X-CSE-ConnectionGUID: B63zCl89RxG/Gx9dGDGW0Q==
X-CSE-MsgGUID: wwmtFyGKQESknnhf4JuOuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="212766885"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2026 03:57:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsJhv-000000010uS-2tew;
	Tue, 17 Feb 2026 11:57:35 +0000
Date: Tue, 17 Feb 2026 19:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol
 'regu_irqs' was not declared. Should it be static?
Message-ID: <202602171910.Y0RuKpIM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9f9effed209c5ed7d316dd41c463d06703f269f5
commit: 162e23657e5379f07c6404dbfbf4367cb438ea7d [0/2] regulator: pf0900: Add PMIC PF0900 support
config: x86_64-randconfig-122-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171910.Y0RuKpIM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171910.Y0RuKpIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171910.Y0RuKpIM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol 'regu_irqs' was not declared. Should it be static?

vim +/regu_irqs +774 drivers/regulator/pf0900-regulator.c

   773	
 > 774	struct pf0900_regulator_irq regu_irqs[] = {
   775		PF0900_REGU_IRQ(PF0900_REG_SW_ILIM_INT, PF0900_SW, REGULATOR_ERROR_OVER_CURRENT_WARN),
   776		PF0900_REGU_IRQ(PF0900_REG_LDO_ILIM_INT, PF0900_LDO, REGULATOR_ERROR_OVER_CURRENT_WARN),
   777		PF0900_REGU_IRQ(PF0900_REG_SW_UV_INT, PF0900_SW, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   778		PF0900_REGU_IRQ(PF0900_REG_LDO_UV_INT, PF0900_LDO, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   779		PF0900_REGU_IRQ(PF0900_REG_SW_OV_INT, PF0900_SW, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   780		PF0900_REGU_IRQ(PF0900_REG_LDO_OV_INT, PF0900_LDO, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   781	};
   782	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
