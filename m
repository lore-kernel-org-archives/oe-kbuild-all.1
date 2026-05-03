Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9500C155C97
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777809709; cv=none; b=kEtBaZCVdL5MQ6jqvel+BEbJHrjMLEeOIXZh4AhO5k6ZEyFdlH1QFpw+Z34F2EP8s1rMFlHZfxJEvsK3GlFbofmGooiqYGpfes49MZxjbDbRHFmjy4S4KUF4v8ENeQKIAVWlOOuedwBMqj4U+kZ4f4BZW9uhCXV+X+GCihSYY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777809709; c=relaxed/simple;
	bh=c6sENOF8dfT4dRNrGgs6I0PFSTlObwxtRcI3laImhbg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hfPBNAChzMFuXye0DH5DSuTQhLn/miuTIWVk369eBmVURca9a2UguPmCD9R9/zDlR/fmEGpghVcbPZ+LQ1MhC39Uoj6ys8YIjDn6kcrShjNW7J2/zVy0JKoHJpYr9h85Em6lE1A1noxRYz5dsb0743YNvT0PpfkXQ3SuDTbd5cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxnfGZtG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxnfGZtG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777809707; x=1809345707;
  h=date:from:to:cc:subject:message-id;
  bh=c6sENOF8dfT4dRNrGgs6I0PFSTlObwxtRcI3laImhbg=;
  b=lxnfGZtGRkB7X4me0RK1LPkFKcwgroxaUMe19qKkxKU3U9yc5IiQujDh
   ZkzTDWhGY0ku25wl3GmEZHXM9FRtZ8GDa1QatFP3c7tltTyo2lqnaAP0I
   Sc/usU2UDOKtJYmUVlHNZWPpclhQjDCizKfGkGeghqnYuUTbwqINi+shz
   IspLBReYVRM0VricZh+vj+cryUjClE7eEzh2UHw7OZdCm8AHfAKFjoOKD
   tflDyFhHvs9GUkJtEyxncABMCWA6VZYPH+gaWJQSMhOJkuFjERA0yuU1v
   by69hyO5aQ3wgySiXGvmo1xEx3z5DTTFm0OHMBvAiJLi/GXb/9xoUMD2X
   g==;
X-CSE-ConnectionGUID: CWXOVycfR9qeYJr0sAqICA==
X-CSE-MsgGUID: hbKjEER9TciXi2e+plRIOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="81266292"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="81266292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 05:01:46 -0700
X-CSE-ConnectionGUID: ZVG6rV0BQeSipHB2EEVrOg==
X-CSE-MsgGUID: XK95lMUET9i1o7C9Duql3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="240271727"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 May 2026 05:01:46 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJVW2-000000002Wn-3fHP;
	Sun, 03 May 2026 12:01:42 +0000
Date: Sun, 03 May 2026 20:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 24/49]
 arch/hexagon/kernel/smp.c:25:1: sparse: sparse: symbol '__pcpu_scope_ipi_irq'
 was not declared. Should it be static?
Message-ID: <202605031939.gzvCSKnr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   5bc5de36ac3892ae317113600fed8d455c1c39cf
commit: 6807c51541e46cb0091dae5b508516aa252cb35f [24/49] hexagon: add debug infrastructure
config: hexagon-randconfig-r111-20260503 (https://download.01.org/0day-ci/archive/20260503/202605031939.gzvCSKnr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031939.gzvCSKnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031939.gzvCSKnr-lkp@intel.com/

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
