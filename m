Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B662EA15C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768293222; cv=none; b=crRT2ZdtaKKckR0nUbEXbapyIWbPOITSH1bluUGVKr1IDtdo/LMmgkdNWKvBrraN4mZncmAsN+ErA1YlcdmS1Rlq2623uTsLA3Qmwk0IZbaxHFRzAY8OnYii7qzwkMrdsD3E9FEEhMqbpr5DTRTz2+E6lLgmmf0dvrr9H9x6qLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768293222; c=relaxed/simple;
	bh=lwCtf+zehpDqENjwrSwDtcnqs4Jwe7Cjz+BR28hTAgc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BPxG4adnzZE7m6+K1YlR8ZJXmdqCJOSDbQaVq/LdoCeUX4MZjX8cnRdUL1dnnNOyvq1eY7ZvUF5cn6pAH1xxfVvemmHi97Rkxxe8IOJG1/kh7CekK69Mp8NoOy+IQ1F5CyVj7NRngWSkGOfSIl9s+1Wra4ofeUYVv040kTY/3Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJwWsdJ2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJwWsdJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768293220; x=1799829220;
  h=date:from:to:cc:subject:message-id;
  bh=lwCtf+zehpDqENjwrSwDtcnqs4Jwe7Cjz+BR28hTAgc=;
  b=PJwWsdJ2lJjsqqArp09rhcNXbSGoK44R0d1qLrlO1qvFTZv2GFhCP5NF
   PMYYvXxwjk/7vDzNJtdkoozy7EQV6CDSsAmWMUxfKz9KsN70rCkVhNFRH
   WEijtZK04vyjK5K17uIrgq4iU8XnzbNrUO+MOCc/A/6WHhqb8jfKVoegb
   o6VwV/gq9PE3IzKRgTBvG9ioW0KbQ2zwnN9JpNG5i7rd51vJzmDk/gnjz
   43Hm4/wOXZGkG3+pFQzMI0qpFMBfcfg8z9DXBCTUmrlswsUre4U8rmfTE
   oduDZ3+p0XJmnY1qDlgdJYG+at0663OztAaLZuL9DTgPH4PMCEAgyDa0u
   Q==;
X-CSE-ConnectionGUID: GpKnYBQWQK2uljKkKef6+Q==
X-CSE-MsgGUID: 5CVyPPljS8W8RBm5VJOHuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68578605"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68578605"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:33:40 -0800
X-CSE-ConnectionGUID: kWCE1SpjS3C7cYtf3q1PfQ==
X-CSE-MsgGUID: SST497RiTTGn5SNuqE6I3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208832838"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Jan 2026 00:33:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfZqJ-00000000ET0-3ELe;
	Tue, 13 Jan 2026 08:33:35 +0000
Date: Tue, 13 Jan 2026 16:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/irqfd_deassign_inactive 2/3]
 arch/x86/kvm/../../../virt/kvm/eventfd.c:168:51: error: expected ')' before
 '->' token
Message-ID: <202601131632.nGvfm9gk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/irqfd_deassign_inactive
head:   a0dab45842873bdc51c3dd77d9c23fa9ed6eafc9
commit: 4dc2946a56da0ac732287ae07ccdc0fe1edfb06b [2/3] KVM: Don't clobber irqfd routing type when deassigning irqfd
config: x86_64-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131632.nGvfm9gk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131632.nGvfm9gk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131632.nGvfm9gk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/segment.h:6,
                    from arch/x86/include/asm/ptrace.h:5,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from include/linux/sched.h:13,
                    from include/linux/resume_user_mode.h:6,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/../../../virt/kvm/eventfd.c:12:
   arch/x86/kvm/../../../virt/kvm/eventfd.c: In function 'irqfd_is_active':
>> arch/x86/kvm/../../../virt/kvm/eventfd.c:168:51: error: expected ')' before '->' token
     168 |                        srcu_read_lock_held(&&irqfd->kvm->srcu));
         |                                           ~       ^~
   include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   arch/x86/kvm/../../../virt/kvm/eventfd.c:167:9: note: in expansion of macro 'lockdep_assert'
     167 |         lockdep_assert(lockdep_is_held(&irqfd->kvm->irqfds.lock) ||
         |         ^~~~~~~~~~~~~~
>> arch/x86/kvm/../../../virt/kvm/eventfd.c:167:9: error: label 'irqfd' used but not defined


vim +168 arch/x86/kvm/../../../virt/kvm/eventfd.c

  > 12	#include <linux/kvm_host.h>
    13	#include <linux/kvm.h>
    14	#include <linux/kvm_irqfd.h>
    15	#include <linux/workqueue.h>
    16	#include <linux/syscalls.h>
    17	#include <linux/wait.h>
    18	#include <linux/poll.h>
    19	#include <linux/file.h>
    20	#include <linux/list.h>
    21	#include <linux/eventfd.h>
    22	#include <linux/kernel.h>
    23	#include <linux/srcu.h>
    24	#include <linux/slab.h>
    25	#include <linux/seqlock.h>
    26	#include <linux/irqbypass.h>
    27	#include <trace/events/kvm.h>
    28	
    29	#include <kvm/iodev.h>
    30	
    31	#ifdef CONFIG_HAVE_KVM_IRQCHIP
    32	
    33	static struct workqueue_struct *irqfd_cleanup_wq;
    34	
    35	bool __attribute__((weak))
    36	kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args)
    37	{
    38		return true;
    39	}
    40	
    41	static void
    42	irqfd_inject(struct work_struct *work)
    43	{
    44		struct kvm_kernel_irqfd *irqfd =
    45			container_of(work, struct kvm_kernel_irqfd, inject);
    46		struct kvm *kvm = irqfd->kvm;
    47	
    48		if (!irqfd->resampler) {
    49			kvm_set_irq(kvm, KVM_USERSPACE_IRQ_SOURCE_ID, irqfd->gsi, 1,
    50					false);
    51			kvm_set_irq(kvm, KVM_USERSPACE_IRQ_SOURCE_ID, irqfd->gsi, 0,
    52					false);
    53		} else
    54			kvm_set_irq(kvm, KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID,
    55				    irqfd->gsi, 1, false);
    56	}
    57	
    58	static void irqfd_resampler_notify(struct kvm_kernel_irqfd_resampler *resampler)
    59	{
    60		struct kvm_kernel_irqfd *irqfd;
    61	
    62		list_for_each_entry_srcu(irqfd, &resampler->list, resampler_link,
    63					 srcu_read_lock_held(&resampler->kvm->irq_srcu))
    64			eventfd_signal(irqfd->resamplefd);
    65	}
    66	
    67	/*
    68	 * Since resampler irqfds share an IRQ source ID, we de-assert once
    69	 * then notify all of the resampler irqfds using this GSI.  We can't
    70	 * do multiple de-asserts or we risk racing with incoming re-asserts.
    71	 */
    72	static void
    73	irqfd_resampler_ack(struct kvm_irq_ack_notifier *kian)
    74	{
    75		struct kvm_kernel_irqfd_resampler *resampler;
    76		struct kvm *kvm;
    77		int idx;
    78	
    79		resampler = container_of(kian,
    80				struct kvm_kernel_irqfd_resampler, notifier);
    81		kvm = resampler->kvm;
    82	
    83		kvm_set_irq(kvm, KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID,
    84			    resampler->notifier.gsi, 0, false);
    85	
    86		idx = srcu_read_lock(&kvm->irq_srcu);
    87		irqfd_resampler_notify(resampler);
    88		srcu_read_unlock(&kvm->irq_srcu, idx);
    89	}
    90	
    91	static void
    92	irqfd_resampler_shutdown(struct kvm_kernel_irqfd *irqfd)
    93	{
    94		struct kvm_kernel_irqfd_resampler *resampler = irqfd->resampler;
    95		struct kvm *kvm = resampler->kvm;
    96	
    97		mutex_lock(&kvm->irqfds.resampler_lock);
    98	
    99		list_del_rcu(&irqfd->resampler_link);
   100	
   101		if (list_empty(&resampler->list)) {
   102			list_del_rcu(&resampler->link);
   103			kvm_unregister_irq_ack_notifier(kvm, &resampler->notifier);
   104			/*
   105			 * synchronize_srcu_expedited(&kvm->irq_srcu) already called
   106			 * in kvm_unregister_irq_ack_notifier().
   107			 */
   108			kvm_set_irq(kvm, KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID,
   109				    resampler->notifier.gsi, 0, false);
   110			kfree(resampler);
   111		} else {
   112			synchronize_srcu_expedited(&kvm->irq_srcu);
   113		}
   114	
   115		mutex_unlock(&kvm->irqfds.resampler_lock);
   116	}
   117	
   118	/*
   119	 * Race-free decouple logic (ordering is critical)
   120	 */
   121	static void
   122	irqfd_shutdown(struct work_struct *work)
   123	{
   124		struct kvm_kernel_irqfd *irqfd =
   125			container_of(work, struct kvm_kernel_irqfd, shutdown);
   126		struct kvm *kvm = irqfd->kvm;
   127		u64 cnt;
   128	
   129		/* Make sure irqfd has been initialized in assign path. */
   130		synchronize_srcu_expedited(&kvm->irq_srcu);
   131	
   132		/*
   133		 * Synchronize with the wait-queue and unhook ourselves to prevent
   134		 * further events.
   135		 */
   136		eventfd_ctx_remove_wait_queue(irqfd->eventfd, &irqfd->wait, &cnt);
   137	
   138		/*
   139		 * We know no new events will be scheduled at this point, so block
   140		 * until all previously outstanding events have completed
   141		 */
   142		flush_work(&irqfd->inject);
   143	
   144		if (irqfd->resampler) {
   145			irqfd_resampler_shutdown(irqfd);
   146			eventfd_ctx_put(irqfd->resamplefd);
   147		}
   148	
   149		/*
   150		 * It is now safe to release the object's resources
   151		 */
   152	#if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
   153		irq_bypass_unregister_consumer(&irqfd->consumer);
   154	#endif
   155		eventfd_ctx_put(irqfd->eventfd);
   156		kfree(irqfd);
   157	}
   158	
   159	
   160	static bool irqfd_is_active(struct kvm_kernel_irqfd *irqfd)
   161	{
   162		/*
   163		 * Checking list_empty() is safe under SRCU, as an irqfd is never added
   164		 * back to the list once it's deactivated, i.e. false negatives on the
   165		 * irqfd being active are a non-issue.
   166		 */
 > 167		lockdep_assert(lockdep_is_held(&irqfd->kvm->irqfds.lock) ||
 > 168			       srcu_read_lock_held(&&irqfd->kvm->srcu));
   169	
   170		return list_empty(&irqfd->list) ? false : true;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
