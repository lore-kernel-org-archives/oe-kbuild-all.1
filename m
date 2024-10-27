Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DFF188A15
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 23:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730072105; cv=none; b=l3KigQSzZdxMI4ltCqxHMblTsR+Spf6w9T3dj8y2dhwRKCKYVGdF/H/H6qMbEu/tKOBum7ikx+rGXcWuUdFEdROGF+AuZb1zO9ndkeaAr68IjkwyekseN5HDvXzbGdPt57qHWBWlD66cHAk4Z8iPG7zq/48jiJUjc+Ig2ixVhlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730072105; c=relaxed/simple;
	bh=8G7PoVGjRP+fBA1UNbnqSCqEWB4lhSyS4MRzJzSGH8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q/ffeiGMewQ264cUHh3/z0e8jybHnusVWmzxuhXLduo5Dr1dOX8nNkXkOXPsXJ9NExzgSOvRQH7RMz0X9S/pwQRmYUi0Q+2TuJkFbKh5ih8pUQibJDLMOKq+pBawumaA+8HtLGI0jp1HaTdtr9X7SCWe02yL5DNADHhpgQOIjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QapDGqjR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QapDGqjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730072103; x=1761608103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8G7PoVGjRP+fBA1UNbnqSCqEWB4lhSyS4MRzJzSGH8M=;
  b=QapDGqjRYioColiSDft9BXLEI4fYn9yPwYCR93sL2Pe+1+6GsW/valVo
   Gbnn6THiTgywgJhvoYOryQzlX52oRJD4p0ui463Ucqn3Q2u/WltHR6EgM
   PGjJVqPsPFg3+K5WjJo+3CDQSD6fS/NcXpjfWSGEmqiC/GfFJr4Oz8Njt
   gVFCOJ0KrYQQ9F0ZhBOSI7iAnFsHEScD7+qemKLPvz1fWC927+lkCXL/k
   EkkTirIw6fgfle339U73NUPq4w39pCXXY3bMrazOHt3W97BDd9bSaDtGy
   rbZ8ZB+R/oZh2QCrwPZfi3eBZqybeNaYavqTN4hjhRy34hCpUHOytlzlB
   A==;
X-CSE-ConnectionGUID: blO2XLwRQvKwBKCXG3BRTQ==
X-CSE-MsgGUID: 0GgsrIyBTua3Mdk6bD53Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29121356"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="29121356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 16:35:00 -0700
X-CSE-ConnectionGUID: uhtlBXyUQcGh0C3pEfjJTw==
X-CSE-MsgGUID: Wr1Tl6bYRN6pXtpgbc2lWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="86554000"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2024 16:34:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Cme-000b5A-19;
	Sun, 27 Oct 2024 23:34:56 +0000
Date: Mon, 28 Oct 2024 07:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/avic_max_vcpu_id 22/44] arch/x86/kvm/svm/avic.c:783:9:
 error: no member named 'irq_bypass_data' in 'struct
 kvm_kernel_irq_routing_entry::(unnamed at include/linux/kvm_host.h:668:3)'
Message-ID: <202410280733.iObPeYqz-lkp@intel.com>
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
config: i386-randconfig-141-20241028 (https://download.01.org/0day-ci/archive/20241028/202410280733.iObPeYqz-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280733.iObPeYqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280733.iObPeYqz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/avic.c:20:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kvm/svm/avic.c:783:9: error: no member named 'irq_bypass_data' in 'struct kvm_kernel_irq_routing_entry::(unnamed at include/linux/kvm_host.h:668:3)'
     783 |         e->msi.irq_bypass_data = NULL;
         |         ~~~~~~ ^
   arch/x86/kvm/svm/avic.c:841:9: error: no member named 'irq_bypass_data' in 'struct kvm_kernel_irq_routing_entry::(unnamed at include/linux/kvm_host.h:668:3)'
     841 |         e->msi.irq_bypass_data = ir;
         |         ~~~~~~ ^
   arch/x86/kvm/svm/avic.c:899:33: error: no member named 'irq_routing' in 'struct kvm'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                   ~~~  ^
   include/linux/srcu.h:217:58: note: expanded from macro 'srcu_dereference'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                                          ^
   include/linux/srcu.h:204:27: note: expanded from macro 'srcu_dereference_check'
     204 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:538:10: note: expanded from macro '__rcu_dereference_check'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                 ^
   arch/x86/kvm/svm/avic.c:899:33: error: no member named 'irq_routing' in 'struct kvm'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                   ~~~  ^
   include/linux/srcu.h:217:58: note: expanded from macro 'srcu_dereference'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                                          ^
   include/linux/srcu.h:204:27: note: expanded from macro 'srcu_dereference_check'
     204 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:538:31: note: expanded from macro '__rcu_dereference_check'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                      ^
   arch/x86/kvm/svm/avic.c:899:33: error: no member named 'irq_routing' in 'struct kvm'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                   ~~~  ^
   include/linux/srcu.h:217:58: note: expanded from macro 'srcu_dereference'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                                          ^
   include/linux/srcu.h:204:27: note: expanded from macro 'srcu_dereference_check'
     204 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:538:53: note: expanded from macro '__rcu_dereference_check'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                            ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/svm/avic.c:899:33: error: no member named 'irq_routing' in 'struct kvm'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                   ~~~  ^
   include/linux/srcu.h:217:58: note: expanded from macro 'srcu_dereference'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                                          ^
   include/linux/srcu.h:204:27: note: expanded from macro 'srcu_dereference_check'
     204 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:538:53: note: expanded from macro '__rcu_dereference_check'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                            ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/svm/avic.c:899:33: error: no member named 'irq_routing' in 'struct kvm'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                   ~~~  ^
   include/linux/srcu.h:217:58: note: expanded from macro 'srcu_dereference'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
         |                                                          ^
   include/linux/srcu.h:204:27: note: expanded from macro 'srcu_dereference_check'
     204 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |                                  ^
   include/linux/rcupdate.h:538:53: note: expanded from macro '__rcu_dereference_check'
     538 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                            ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/x86/kvm/svm/avic.c:899:33: error: no member named 'irq_routing' in 'struct kvm'
     899 |         irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
         |                                   ~~~  ^
   include/linux/srcu.h:217:58: note: expanded from macro 'srcu_dereference'
     217 | #define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)


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
