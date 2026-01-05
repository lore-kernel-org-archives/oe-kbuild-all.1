Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9762BEFFF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 05:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589417; cv=none; b=Mr0ZParTcRR+G7snEnSd3c8ZfpWUtS/oSegVw8U7UkX9pc32SJLKlU2wQ3RlEaMOHkMnsrME/B3G0maNKuOt9rNa79vpoF3BwDEZmUQSGT7TLvJ/Xa7jVNuLbKLq/i0Vs8B47YrSqx6ckxuZionTlakLC4gJadkU+vkwjYESETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589417; c=relaxed/simple;
	bh=5lFrewzT4b4Z7EBUYiIwuBcAiITuiUvpH6ddAamhtT0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XKbbX1cz8P4FYzpTFaPZlBxgjCQGfuKXNou+sY2KE649Ut5JY1DpX13wrGQXLEd8Ld4c+D79yz3wxzFIwGhBR9fUBA7gp8c+VnKyk02sP3ACZRSQlrGQH+N7kdZSzKaidLu0YwbU63prVEzj+2+QLWPd1W1U0faZyuLnnXHXGco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR2V12eb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR2V12eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767589416; x=1799125416;
  h=date:from:to:cc:subject:message-id;
  bh=5lFrewzT4b4Z7EBUYiIwuBcAiITuiUvpH6ddAamhtT0=;
  b=fR2V12ebUBKJGuZBEJYqwsAe4pUhsH2BVlF1PVxJgpL4fooX05emCYwM
   D3Uhz523m504OPVDkFEwiVtnonII5i2yEviyZSxe+jxV7GxkaH41nsAO0
   te8eHcSmNwwu1bmst8fBj6yqxexgx/tuxYvGlkqzb3Rt3J+QhweeAWnG3
   OcThCqXE5kmy4yEX9IpQX0IiJCiCWAA1cowNACTn7237TZvVWRIaGhnrv
   LZ4+IIFBZonKTY/DvEAVxR+FxPe6Lt+LI4Q7PONv70IM90HcGHQW3V9T0
   HMPhmAKPUFdAJSGiUByOXBneGwAIKvpNdRhdm+mTzy6A4+Fp2v8AwFEM6
   A==;
X-CSE-ConnectionGUID: FOFcK6GpRl21RIHyP/LxRA==
X-CSE-MsgGUID: RPRmG0S6QMiCiG8NIa/EgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72813269"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="72813269"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 21:03:35 -0800
X-CSE-ConnectionGUID: zMaMu3RdSve/Z1nZF6Ck6w==
X-CSE-MsgGUID: eCe8mnzhTRSQF+trPIlM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="201539357"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 04 Jan 2026 21:03:33 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcckd-0000000011t-0olP;
	Mon, 05 Jan 2026 05:03:31 +0000
Date: Mon, 05 Jan 2026 06:02:37 +0100
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/pan-opticon 12/15]
 arm64/set_id_regs.c:94:2: error: use of undeclared identifier
 'ID_AA64ISAR0_EL1_TME_SHIFT'
Message-ID: <202601050608.TC3CBB7L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pan-opticon
head:   e0c0ca59df5170d6045ce9389baed5f38d0d1499
commit: 2cb34575bea47cd18dd0fd0a6997548617d05255 [12/15] KVM: arm64: Remove all traces of FEAT_TME
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260105/202601050608.TC3CBB7L-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050608.TC3CBB7L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050608.TC3CBB7L-lkp@intel.com/

Note: the arm-platforms/kvm-arm64/pan-opticon HEAD e0c0ca59df5170d6045ce9389baed5f38d0d1499 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arm64/set_id_regs.c:94:2: error: use of undeclared identifier 'ID_AA64ISAR0_EL1_TME_SHIFT'
      94 |         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, TME, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arm64/set_id_regs.c:58:52: note: expanded from macro 'REG_FTR_BITS'
      58 |         __REG_FTR_BITS(reg##_##field, FTR_UNSIGNED, type, reg##_##field##_SHIFT, \
         |                                                           ^~~~~~~~~~~~~~~~~~~~~
   <scratch space>:11:1: note: expanded from here
      11 | ID_AA64ISAR0_EL1_TME_SHIFT
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arm64/set_id_regs.c:94:2: error: use of undeclared identifier 'ID_AA64ISAR0_EL1_TME_MASK'
      94 |         REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR0_EL1, TME, 0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arm64/set_id_regs.c:59:10: note: expanded from macro 'REG_FTR_BITS'
      59 |                        reg##_##field##_MASK, safe_val)
         |                        ^~~~~~~~~~~~~~~~~~~~
   <scratch space>:14:1: note: expanded from here
      14 | ID_AA64ISAR0_EL1_TME_MASK
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
