Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E604E257459
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352591; cv=none; b=f81eD9B0qj7hIOd/8bcI2Ov2e7fgu4Vq8XdrB6RbINYwCA+2Ixv/ef35ILtsxN7uYBg4tXpVAFnZPl9T5N9QKlPJiap7Jhck8ZyQKtuFA6yIe21JZOMMODWsN3pAS0xD5GtgmvRWg3d5RkNUJL1Lo6zmHOvAxdIwK4EgPxJ/GEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352591; c=relaxed/simple;
	bh=6t+rwMLzRs8Dsg4dFLC/1hEnW0I2dqSv7KUjrP5A6yA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UPWy7kCg2x+ucyMRic514Nqy8Ehag5R4Q6ughAZ/YbtcNXNk/zz++sdJTl64Ihq6YO5WPVC2G/bxbYXP9Wgq/oZJJKfzK6Rn5CqUcZ0/wU1/PAnGlVt9HHqmRBLl+Zl98KQBewRwE7O8sr23r12dOFEwK0ZiwE0rc2d32UHIicM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmr9zo8c; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmr9zo8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779352590; x=1810888590;
  h=date:from:to:cc:subject:message-id;
  bh=6t+rwMLzRs8Dsg4dFLC/1hEnW0I2dqSv7KUjrP5A6yA=;
  b=mmr9zo8c5oHoaMiQKS6iwNYU0ZLr6zgzEZe3BjzNK5td44x9jgEwcK0v
   dvRL3coPNAKIjcZNpQ4GlIivcXHXhOWOql6dNICSNxPKHcfKD1t2SO9yY
   9V+Ok1WmbolAjuZMoNT47Nn8e0Nlp7noKtfOHkYocj/EuFcrgcm9fYKNQ
   LTPd3LF3o4ACd58UBAFW3ajg0NPYBak3OkNHnabYu4rMoZsPsxvbPuOD9
   d7REMLdVkExHNeSnwGQ7nbCBaNivt3fn4/VGFwixQuOz1Kf3YmL2jKfjn
   dlG3MoW2+LslDOQoAlPDKGWqavIPO6MrU4EAQy4nnPT/7l1H+qVb469eb
   w==;
X-CSE-ConnectionGUID: 31ozUQNiRT2bu53xbb+fNg==
X-CSE-MsgGUID: ve7h6KehTOafKbwaag+7rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90841006"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90841006"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:36:29 -0700
X-CSE-ConnectionGUID: +pn4084rRda1mroD0bGFDQ==
X-CSE-MsgGUID: 9vuCk9xBRzaMLrHVfd1pvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="239460706"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2026 01:36:28 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPytF-000000004fU-3923;
	Thu, 21 May 2026 08:36:25 +0000
Date: Thu, 21 May 2026 16:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1041/1130]
 arch/riscv/kernel/ptrace.c:465:19: warning: unused variable 'pcc'
Message-ID: <202605211638.bWjWudtM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 48f331391ec79fde4f8d61b0c39124cd52c089a4 [1041/1130] cheri: compat64: Prepare binfmt code for compat64 support
config: riscv-randconfig-002-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211638.bWjWudtM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211638.bWjWudtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211638.bWjWudtM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/ptrace.c: In function 'compat_riscv_gpr_set':
>> arch/riscv/kernel/ptrace.c:465:19: warning: unused variable 'pcc' [-Wunused-variable]
     465 |         uintptr_t pcc = regs->epc;
         |                   ^~~


vim +/pcc +465 arch/riscv/kernel/ptrace.c

   453	
   454	static int compat_riscv_gpr_set(struct task_struct *target,
   455					const struct user_regset *regset,
   456					unsigned int pos, unsigned int count,
   457					const void *kbuf, const void __user *ubuf)
   458	{
   459		int ret;
   460		struct compat_user_regs_struct cregs;
   461		struct pt_regs *regs = task_pt_regs(target);
   462	
   463		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &cregs, 0, -1);
   464	
 > 465		uintptr_t pcc = regs->epc;
   466		cregs_to_regs(&cregs, task_pt_regs(target));
   467		regs->epc = (uintptr_t)cheri_address_set(pcc, __c_ua(regs->epc));
   468	
   469		return ret;
   470	}
   471	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
