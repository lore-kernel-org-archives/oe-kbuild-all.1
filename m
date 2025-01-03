Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD834C62
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 02:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735871634; cv=none; b=WFY3RuD7xv9iitPHXiA3EtoGrXB8uLu622nyCdmNqCfV4NFI4wlbzMsTAWGW8O37K8li64j3DTOtcavbeego7EU0qUSUoTTWIkrZxWrE8yIPHtSGjW64xZe7g/fvfCkV955MYkEIXJ1dIPNElIobvPMhlhgKSycdzfyAijxQJsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735871634; c=relaxed/simple;
	bh=x7sB+KrJDRGuP6zlX3MnrYooHaPvuI/I7cuH8Ezyi/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+bH5GusMscyUFbgiBtznxAMElwEdC0PGzWsjmlQGIxbC1MKLkwTvqPrxbpvR8eangoRHkhQedKHlXd75r3458q3XOJDnLFB5+JWMPNvYAOrywOGI3LjXZezrPJNTZddJ6UDw8Y7LtkznmgC5vC0NjvKymyxZJ4hJhpgA2htYFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6IGCkKD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6IGCkKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735871632; x=1767407632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7sB+KrJDRGuP6zlX3MnrYooHaPvuI/I7cuH8Ezyi/E=;
  b=H6IGCkKDnL54+0VaNtU89+DYvU/BVNSm9g37FCzPZw/lhw74OKwtLg5Y
   ZigU4aZ30RLOudTg8p+7LXkUzuSZfPgzU0kAQ0kJfjz28ZjHWUXS9UlcZ
   zDIIwiY/HOwROyQFJcb3JgD+mdUIet0fM4E9n+flIWBJQf8Li63uXxSmA
   jN5DkGAxlxP9JRcpbURq5s3e1v+wRXigqZpu9fe4Nq6BYj2obofvsW87u
   Twgj+Gx3GQA6bc2X+GtTGA6PxbVz3iHKzQQRHtjrvGu/Cu872iPYpvYHc
   PDPVsbwXKfsV0pdR73eKHJ1YtqOtqPEt6XCNElHjSdF8hocLcdvYFX+Uv
   Q==;
X-CSE-ConnectionGUID: I9BgNV6ET+WamUwCY9v5cw==
X-CSE-MsgGUID: kJg06GvMQ6mjvvvpSmWLYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35822296"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35822296"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 18:33:52 -0800
X-CSE-ConnectionGUID: gB9Wy7YjTC6N3yTVaRNmLg==
X-CSE-MsgGUID: Lo1gTmFAR4a/GVT6zNB0Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101472027"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jan 2025 18:33:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTXVU-00095t-2m;
	Fri, 03 Jan 2025 02:33:48 +0000
Date: Fri, 3 Jan 2025 10:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/1693]
 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:5340:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202501031054.kEd1r4Aw-lkp@intel.com>
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
head:   c2f1662c3fb301fe7ba127fe06c14538112982d4
commit: 07db411edd838080fb7c42b9f56bc08dd60d9af6 [1693/1693] LoongArch: KVM: Enable kvm config and add the makefile
config: loongarch-randconfig-r112-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031054.kEd1r4Aw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501031054.kEd1r4Aw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031054.kEd1r4Aw-lkp@intel.com/

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
