Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EFC423760
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 16:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528687; cv=none; b=g/w18VzalMm0o6uCEnIYdiy77bqSPpHAGHlxBrLrcpfG9eCwFry5Mhkvs6sG/UnnUbkyHDyvBExWs1aLQ17ZaDOttxYn7fRhwCzFXzrNYT+xkiiOK8zmANClnQQc+08Av1gtmswbqTia1jcGobkhW0a+FNzdP8bpx343KzhCFuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528687; c=relaxed/simple;
	bh=vUJlYOhha+ymfEeUJONjYWkiPwCXQJ+RJ2y1CyqXVLI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TJp1sDnikKFJuAzu5ooSt01kcaaimQYv6TrNFceCLUKQeTFqdZlzCfYUItdZejw0VmdaDmDAjgVcyGCbOqf9BxZKB/3uspGdtrhdjVNmv4nc5VdwWhMCyiW+lwp/x1nd+JgNXkiAR5LC3ZT5HEUWJ+A3L6EqLi+luQ3jPo+aUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adwDB8Qa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adwDB8Qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783528685; x=1815064685;
  h=date:from:to:cc:subject:message-id;
  bh=vUJlYOhha+ymfEeUJONjYWkiPwCXQJ+RJ2y1CyqXVLI=;
  b=adwDB8QaF8RzjTyj3fbrGaZ5a8DFpSlktHDx1ZEp9Uix1W36Dg7HPvmt
   WsFPesFhbtzkENOWkFX6wjOQA+xnh0m+WnhJpFRIRsotGv+tTpAqourG8
   ohqwLTwq37lrsbM2oZooQtJSnKnLKzLYhG1qjbXaidO9+jwzi/7Qgikgd
   Zj7t9rrAtrbixqHJFDCCrJJManR/Rv8xXd6f5jGwrfkqf4m6h3bubCHRk
   qoXr7fD0KMJWYdWYJtk76vxyWrgOsvMZqjmxWW9gt+zLy81Is6bDEn7h1
   ekyYZDU7q/CRBE0YEMHxGcDCAV6YbM0qn9BbXkZeCGurE5pYNNdobV/8T
   Q==;
X-CSE-ConnectionGUID: doia6a84TRyl3cnZeP9Eqg==
X-CSE-MsgGUID: dmWPewgGTbqPqQ0Vnt39yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87879931"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="87879931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 09:38:04 -0700
X-CSE-ConnectionGUID: 8PAKWrFSQku7HtHL9FFPYw==
X-CSE-MsgGUID: VVZlKNF9QEyUrolAhu3pGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254973932"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Jul 2026 09:38:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whVHc-00000000Gcv-0Z0L;
	Wed, 08 Jul 2026 16:38:00 +0000
Date: Thu, 09 Jul 2026 00:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 24/69]
 arch/hexagon/kernel/smp.c:25:1: sparse: sparse: symbol '__pcpu_scope_ipi_irq'
 was not declared. Should it be static?
Message-ID: <202607090058.qXwCQYnf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   89efd48e5609f41280973bc49df20ffe80177690
commit: 8be2af9ea122e286ca475227495296847336bb9d [24/69] hexagon: add debug infrastructure
config: hexagon-randconfig-r121-20260707 (https://download.01.org/0day-ci/archive/20260709/202607090058.qXwCQYnf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090058.qXwCQYnf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090058.qXwCQYnf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/kernel/smp.c: note: in included file (through arch/hexagon/include/asm/processor.h, arch/hexagon/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/kernel/smp.c:25:1: sparse: sparse: symbol '__pcpu_scope_ipi_irq' was not declared. Should it be static?
>> arch/hexagon/kernel/smp.c:28:1: sparse: sparse: symbol '__pcpu_scope_vpid' was not declared. Should it be static?

vim +/__pcpu_scope_ipi_irq +25 arch/hexagon/kernel/smp.c

    24	
  > 25	DEFINE_PER_CPU(u32, ipi_irq);
    26	
    27	/*  Virtual Processor ID storage  */
  > 28	DEFINE_PER_CPU(u32, vpid);
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
