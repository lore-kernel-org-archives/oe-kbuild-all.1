Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16D134AC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 02:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729997650; cv=none; b=pZL+lpuLSJumTgcbu5LhEsgXivDJWJGZ6RpZkFMehYthlkhLxvzrfYBijeB3mJe0VVfrfykF897TitR/EAFvBBiifuqGPHUlv6lpGeX0surULuVH637XDczGIyWNMoX2Sks/ICCafKg4z+gJ2sW7qoe06KQ2UWM/eMexZx/Ru20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729997650; c=relaxed/simple;
	bh=MBRnTKeKLSiErqNczL1v3sZnv6roZ5awZgeNqBBLtZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POGMiN5vAqQT7y+KkuCe9oqe6yv6nHsFLkrzgna8yZ0dYiFZ9jRCDgG2HGC5e8+bnEZ9kWoRr2UqPRze40FSChSp5897aB6ny/8CZRpDzfBxy1gP0GugHgFyElo8LG3VILoruxAn/j6nNNuGOuV7AXX7hSD+B/MTIgQ6jSDo6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDK4uSdq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDK4uSdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729997647; x=1761533647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBRnTKeKLSiErqNczL1v3sZnv6roZ5awZgeNqBBLtZg=;
  b=ZDK4uSdqUoDZ0DlRCWIjd3hYYKK/CA94SIwasYVl/EOxrI01DgShAoH8
   m6B35F/ncY1KxpnZmzYHvB3ASNUkV8cfKGRNyTq2FcWkC2jRkGqprMuQU
   vfsbBeDY0vdQpcJmKWhUF/JASfhifa6pHYLmQEWQyJ+0QcSeNSF/988bH
   e3Z0muWo0w75NNYu0dT934g4SemJFrjpD5SzcGaFToddtyVTi9dCqHINd
   ZHENr7YD70Kqs9EuHuRNtNAX1V6qL6pu5MFs9JWCthb5Q2sQo++IAxBfP
   BdTgKWI78OumBHJXOjdIw06TetHPNbniOd1K8kGCguehA+YCUoe4SRa6I
   g==;
X-CSE-ConnectionGUID: R9vFtxycTmmwwtoZpidc1w==
X-CSE-MsgGUID: +45HQbJBTnGbwRTaYV6tYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29068413"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="29068413"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 19:54:07 -0700
X-CSE-ConnectionGUID: 3KPbyinoR3CcEiSlmJv+Iw==
X-CSE-MsgGUID: xpu0sIY6Rx+f6SkrfH60gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="82107351"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 19:54:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4tPn-000aI6-0w;
	Sun, 27 Oct 2024 02:54:03 +0000
Date: Sun, 27 Oct 2024 10:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/avic_max_vcpu_id 22/44] arch/x86/kvm/svm/avic.c:783:15:
 error: 'struct <anonymous>' has no member named 'irq_bypass_data'
Message-ID: <202410271013.ypozRXOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/avic_max_vcpu_id
head:   8aee5850df49b3f3a5bf57e55d4baf21dd389f1e
commit: 8aec41b51cffe1cbdf3185e60947a78feab01097 [22/44] KVM: x86: Track IRTE data device posted interrupts in routing entry
config: i386-buildonly-randconfig-002-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271013.ypozRXOd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271013.ypozRXOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271013.ypozRXOd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/svm/avic.c: In function 'svm_ir_list_del':
>> arch/x86/kvm/svm/avic.c:783:15: error: 'struct <anonymous>' has no member named 'irq_bypass_data'
     783 |         e->msi.irq_bypass_data = NULL;
         |               ^
   arch/x86/kvm/svm/avic.c: In function 'svm_ir_list_add':
   arch/x86/kvm/svm/avic.c:841:15: error: 'struct <anonymous>' has no member named 'irq_bypass_data'
     841 |         e->msi.irq_bypass_data = ir;
         |               ^
   In file included from include/linux/rculist.h:11,
                    from include/linux/hashtable.h:14,
                    from arch/x86/kvm/svm/avic.c:18:
   arch/x86/kvm/svm/avic.c: In function 'avic_pi_update_irte':
   arch/x86/kvm/svm/avic.c:899:38: error: 'struct kvm' has no member named 'irq_routing'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                      ^~
   include/linux/rcupdate.h:538:17: note: in definition of macro '__rcu_dereference_check'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                 ^
   include/linux/srcu.h:217:34: note: in expansion of macro 'srcu_dereference_check'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/avic.c:899:18: note: in expansion of macro 'srcu_dereference'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                  ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/avic.c:899:38: error: 'struct kvm' has no member named 'irq_routing'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                      ^~
   include/linux/rcupdate.h:538:38: note: in definition of macro '__rcu_dereference_check'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                      ^
   include/linux/srcu.h:217:34: note: in expansion of macro 'srcu_dereference_check'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/avic.c:899:18: note: in expansion of macro 'srcu_dereference'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                  ^~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/x86/kvm/svm/avic.c:899:38: error: 'struct kvm' has no member named 'irq_routing'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                      ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:538:50: note: in expansion of macro 'READ_ONCE'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/srcu.h:204:9: note: in expansion of macro '__rcu_dereference_check'
     204 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcu.h:217:34: note: in expansion of macro 'srcu_dereference_check'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/avic.c:899:18: note: in expansion of macro 'srcu_dereference'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                  ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/avic.c:899:38: error: 'struct kvm' has no member named 'irq_routing'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                      ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:538:50: note: in expansion of macro 'READ_ONCE'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/srcu.h:204:9: note: in expansion of macro '__rcu_dereference_check'
     204 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcu.h:217:34: note: in expansion of macro 'srcu_dereference_check'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/avic.c:899:18: note: in expansion of macro 'srcu_dereference'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                  ^~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/avic.c:899:38: error: 'struct kvm' has no member named 'irq_routing'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                      ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \


vim +783 arch/x86/kvm/svm/avic.c

   765	
   766	static void svm_ir_list_del(struct vcpu_svm *svm,
   767				    struct kvm_kernel_irq_routing_entry *e,
   768				    struct amd_iommu_pi_data *pi)
   769	{
   770		unsigned long flags;
   771		struct amd_svm_iommu_ir *cur;
   772	
   773		spin_lock_irqsave(&svm->ir_list_lock, flags);
   774		list_for_each_entry(cur, &svm->ir_list, node) {
   775			if (cur->data != pi->ir_data)
   776				continue;
   777			list_del(&cur->node);
   778			kfree(cur);
   779			break;
   780		}
   781		spin_unlock_irqrestore(&svm->ir_list_lock, flags);
   782	
 > 783		e->msi.irq_bypass_data = NULL;
   784	}
   785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
