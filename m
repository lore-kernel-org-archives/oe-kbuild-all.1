Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62771E3DCB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735898450; cv=none; b=Yn3Xtcc6XNwpLHt2Zx+EFDi1ObYDoLXed43fTLxfYGnsQMQ51X22b0CW+cB5FwTJpxVtoKygsYT1WHMcAskq9ATNz1SrGYXuWyn9Oz9Eoe3KvHAr0b7mYcEVfb55kKZMqLFl8RxGTCd4R9gxi0to2eYhNW0R34dE/Td049vHYa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735898450; c=relaxed/simple;
	bh=OogSfU+CwbjFPXp/1zaHgN2FK+n84BUs3oYdxTcDzQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iX5/RF8YkNu4Qn9o4qoVl5ZDxZbos0CC/2YqwMhLQwp+OJ6s8qbKF/oqNMLkDNW99IVW2JmESUcjBmu30CQSXwoKlDHJ2kVPUV1nNOWazpTM+Ee2IgbfC/xIrefgXCPVpuQBUnjOSbNji/y1fHujAtc7C8VvDzSCDoupEh6/bPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgmpx+OH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgmpx+OH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735898447; x=1767434447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OogSfU+CwbjFPXp/1zaHgN2FK+n84BUs3oYdxTcDzQ8=;
  b=fgmpx+OHpFKjP/m00UivPyYyUIs4320UluPunJy+jIIkuvUJHoMsTvhV
   WKNpuOq+D9erilLcjBmklyvUhv3bU1jPu/Z2tBcaInabi88DO4cBWlLPM
   ajqBxeNSz28yqH8yzqf6xep3NDSqSKefE2XUJk/2dsVtCu5Rs2yAaOLc/
   uEdaJMZ30RcHXoTgFUC/Xt+SbnhpRzbjPteJlOd13zIcvhhebK19TfGmA
   NnkzfQtcaPwT29+zGXb9jQTuZSkXFxdj6Gc+fYSPI9tAvGnJgfQV7d/bI
   o/VMO4j3vTAoR+pe902aG6W0wVzK5QFGDTFQIdEREcR6yAFvbk45pWjs2
   g==;
X-CSE-ConnectionGUID: S3TmfB2sTaqSG28MtvEsPQ==
X-CSE-MsgGUID: ANHRmHDUS0qDs9cYYgDLbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36024832"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36024832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 02:00:46 -0800
X-CSE-ConnectionGUID: 2iZIaVrwSfmKsBGpxAPz5Q==
X-CSE-MsgGUID: BIAqHnKJRm243ysA4un87A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102256320"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 02:00:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTeTy-0009YE-1l;
	Fri, 03 Jan 2025 10:00:42 +0000
Date: Fri, 3 Jan 2025 18:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/1693]
 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202501031701.nFiZOCS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tianrui,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   604e996dd0189ddb0875f389b87fa2084b3a9424
commit: 07db411edd838080fb7c42b9f56bc08dd60d9af6 [1693/1693] LoongArch: KVM: Enable kvm config and add the makefile
config: loongarch-randconfig-r112-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031701.nFiZOCS8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501031701.nFiZOCS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031701.nFiZOCS8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: note: in included file:
   include/linux/kvm_host.h:1946:54: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:1948:56: sparse: sparse: array of flexible structures
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got unsigned int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got unsigned int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     expected void *ptr
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5350:9: sparse:     got int [noderef] __percpu *
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_change_pte' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_start' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_invalidate_range_end' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_flush_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_clear_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:602:9: sparse: sparse: context imbalance in 'kvm_mmu_notifier_test_young' - different lock contexts for basic block
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: note: in included file (through include/linux/mutex.h, include/linux/kvm_types.h, include/kvm/iodev.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1973:49: sparse: sparse: self-comparison always evaluates to false
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1979:37: sparse: sparse: self-comparison always evaluates to false
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:2678:9: sparse: sparse: context imbalance in 'hva_to_pfn_remapped' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +5340 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

9a2b85c620b977 drivers/kvm/kvm_main.c Rusty Russell       2007-07-17  5328  
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5329  static int kvm_suspend(void)
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5330  {
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5331  	/*
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5332  	 * Secondary CPUs and CPU hotplug are disabled across the suspend/resume
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5333  	 * callbacks, i.e. no need to acquire kvm_lock to ensure the usage count
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5334  	 * is stable.  Assert that kvm_lock is not held to ensure the system
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5335  	 * isn't suspended while KVM is enabling hardware.  Hardware enabling
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5336  	 * can be preempted, but the task cannot be frozen until it has dropped
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5337  	 * all locks (userspace tasks are frozen via a fake signal).
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5338  	 */
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5339  	lockdep_assert_not_held(&kvm_lock);
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30 @5340  	lockdep_assert_irqs_disabled();
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5341  
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5342  	if (kvm_usage_count)
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5343  		hardware_disable_nolock(NULL);
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5344  	return 0;
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5345  }
35774a9f94db08 virt/kvm/kvm_main.c    Sean Christopherson 2022-11-30  5346  

:::::: The code at line 5340 was first introduced by commit
:::::: 35774a9f94db08df78e1c08d2b097666deec4e76 KVM: Register syscore (suspend/resume) ops early in kvm_init()

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
