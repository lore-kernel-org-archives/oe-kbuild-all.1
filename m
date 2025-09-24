Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF64C6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716159; cv=none; b=ignHBZLfGjbhNhVv8wBlieSFYk/18EhL9hVD6E2X33SFXvSM0xn9Q/MfVs1xubPbphoYpTUfnmcFfB66Vk68uPlMR5TpPxh4Wa//4W4Jk+IDu6CqeIYNvuk4ygRr8iQ5lagNkEhFm8DY6b16YTvFm7bAtJ1SMrq4abfeciTNQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716159; c=relaxed/simple;
	bh=NnpdwclrrLTPzciZYAmhPcwzIH24l8ZZ3CZmbhGmH68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGrkJ5ZxB3reRml1zmVQ1Z9DlMu82E0xSWiUAgx3zopraoTnxLY8soKVWlQH4f+6SfmFKrRuOwbu4b1/X+iEAyAG1ow+ta6P+hKzB3hd+hquIlxp8pRSBua1zTYU8Egi/f5xD92FmQZoKuGyaf8qRtU9sw1X/p+Dqo4gl5NDqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9NAVZxy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9NAVZxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758716157; x=1790252157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NnpdwclrrLTPzciZYAmhPcwzIH24l8ZZ3CZmbhGmH68=;
  b=W9NAVZxy4E8f5Xtnnb5D1tv9yCNQU9P95+0SFcNsrd38VmfQD5d1LZmX
   xiPHCPGLZ2di2FubMmfj3MEfFjWVQvzBsb0s6CMtzlAWZjU93tq6kNOdU
   PAxnnFK9m7T1WAal+eNtTdkyXuCTjDIUN1PUOZrN+SNlRNH2wumlgtZlP
   cP59pOBHpQCUJegZxOeh65LveRVGNGYIor3+pfC/461uLoesKn23gyZQg
   TgKzg8vmFaxf794C3gJi9RZmbSsTdeqTQwH5V9pbC6I5ntv1nZ+RMi+Gp
   VfrshOnPcQy0e4J6pu6yJ5x9mcOwlCWz6SSr1ECWYy78nqvHT07GSA6mD
   w==;
X-CSE-ConnectionGUID: 2o9UrDWXQjqK2r1O15S3lg==
X-CSE-MsgGUID: 3/9rS1VgRV+2ZGMGCGSpqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61122720"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="61122720"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 05:15:57 -0700
X-CSE-ConnectionGUID: +J8+kRjeRQaEn2aq4lTNgw==
X-CSE-MsgGUID: A3Ns5CtMQwWSgqu+X/eElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="177421491"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2025 05:15:52 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1OPT-00047l-0i;
	Wed, 24 Sep 2025 12:15:47 +0000
Date: Wed, 24 Sep 2025 20:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kvm-x86:exports 60/60] arch/x86/kvm/kvm_onhyperv.c:104:58: error:
 expected ')' before string constant
Message-ID: <202509242018.H6effaVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/kvm-x86/linux exports
head:   ca1831d6ffa3a240830014a0c96633aed6d07367
commit: ca1831d6ffa3a240830014a0c96633aed6d07367 [60/60] KVM: x86: Export KVM-internal symbols for sub-modules only
config: i386-buildonly-randconfig-001-20250924 (https://download.01.org/0day-ci/archive/20250924/202509242018.H6effaVS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509242018.H6effaVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509242018.H6effaVS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/kvm_onhyperv.c:7:
>> arch/x86/kvm/kvm_onhyperv.c:104:58: error: expected ')' before string constant
     104 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs_range);
         |                                                          ^
   include/linux/stringify.h:9:34: note: in definition of macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                  ^
   include/linux/kvm_types.h:13:43: note: in expansion of macro '__stringify'
      13 |         EXPORT_SYMBOL_FOR_MODULES(symbol, __stringify(KVM_SUB_MODULES))
         |                                           ^~~~~~~~~~~
   arch/x86/kvm/kvm_onhyperv.c:104:1: note: in expansion of macro 'EXPORT_SYMBOL_FOR_KVM_INTERNAL'
     104 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs_range);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/kvm_onhyperv.c:110:52: error: expected ')' before string constant
     110 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs);
         |                                                    ^
   include/linux/stringify.h:9:34: note: in definition of macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                  ^
   include/linux/kvm_types.h:13:43: note: in expansion of macro '__stringify'
      13 |         EXPORT_SYMBOL_FOR_MODULES(symbol, __stringify(KVM_SUB_MODULES))
         |                                           ^~~~~~~~~~~
   arch/x86/kvm/kvm_onhyperv.c:110:1: note: in expansion of macro 'EXPORT_SYMBOL_FOR_KVM_INTERNAL'
     110 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/kvm_onhyperv.c:124:49: error: expected ')' before string constant
     124 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_track_root_tdp);
         |                                                 ^
   include/linux/stringify.h:9:34: note: in definition of macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                  ^
   include/linux/kvm_types.h:13:43: note: in expansion of macro '__stringify'
      13 |         EXPORT_SYMBOL_FOR_MODULES(symbol, __stringify(KVM_SUB_MODULES))
         |                                           ^~~~~~~~~~~
   arch/x86/kvm/kvm_onhyperv.c:124:1: note: in expansion of macro 'EXPORT_SYMBOL_FOR_KVM_INTERNAL'
     124 | EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_track_root_tdp);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +104 arch/x86/kvm/kvm_onhyperv.c

     6	
   > 7	#include <linux/kvm_host.h>
     8	#include <asm/mshyperv.h>
     9	
    10	#include "hyperv.h"
    11	#include "kvm_onhyperv.h"
    12	
    13	struct kvm_hv_tlb_range {
    14		u64 start_gfn;
    15		u64 pages;
    16	};
    17	
    18	static int kvm_fill_hv_flush_list_func(struct hv_guest_mapping_flush_list *flush,
    19			void *data)
    20	{
    21		struct kvm_hv_tlb_range *range = data;
    22	
    23		return hyperv_fill_flush_guest_mapping_list(flush, range->start_gfn,
    24				range->pages);
    25	}
    26	
    27	static inline int hv_remote_flush_root_tdp(hpa_t root_tdp,
    28						   struct kvm_hv_tlb_range *range)
    29	{
    30		if (range)
    31			return hyperv_flush_guest_mapping_range(root_tdp,
    32					kvm_fill_hv_flush_list_func, (void *)range);
    33		else
    34			return hyperv_flush_guest_mapping(root_tdp);
    35	}
    36	
    37	static int __hv_flush_remote_tlbs_range(struct kvm *kvm,
    38						struct kvm_hv_tlb_range *range)
    39	{
    40		struct kvm_arch *kvm_arch = &kvm->arch;
    41		struct kvm_vcpu *vcpu;
    42		int ret = 0, nr_unique_valid_roots;
    43		unsigned long i;
    44		hpa_t root;
    45	
    46		spin_lock(&kvm_arch->hv_root_tdp_lock);
    47	
    48		if (!VALID_PAGE(kvm_arch->hv_root_tdp)) {
    49			nr_unique_valid_roots = 0;
    50	
    51			/*
    52			 * Flush all valid roots, and see if all vCPUs have converged
    53			 * on a common root, in which case future flushes can skip the
    54			 * loop and flush the common root.
    55			 */
    56			kvm_for_each_vcpu(i, vcpu, kvm) {
    57				root = vcpu->arch.hv_root_tdp;
    58				if (!VALID_PAGE(root) || root == kvm_arch->hv_root_tdp)
    59					continue;
    60	
    61				/*
    62				 * Set the tracked root to the first valid root.  Keep
    63				 * this root for the entirety of the loop even if more
    64				 * roots are encountered as a low effort optimization
    65				 * to avoid flushing the same (first) root again.
    66				 */
    67				if (++nr_unique_valid_roots == 1)
    68					kvm_arch->hv_root_tdp = root;
    69	
    70				if (!ret)
    71					ret = hv_remote_flush_root_tdp(root, range);
    72	
    73				/*
    74				 * Stop processing roots if a failure occurred and
    75				 * multiple valid roots have already been detected.
    76				 */
    77				if (ret && nr_unique_valid_roots > 1)
    78					break;
    79			}
    80	
    81			/*
    82			 * The optimized flush of a single root can't be used if there
    83			 * are multiple valid roots (obviously).
    84			 */
    85			if (nr_unique_valid_roots > 1)
    86				kvm_arch->hv_root_tdp = INVALID_PAGE;
    87		} else {
    88			ret = hv_remote_flush_root_tdp(kvm_arch->hv_root_tdp, range);
    89		}
    90	
    91		spin_unlock(&kvm_arch->hv_root_tdp_lock);
    92		return ret;
    93	}
    94	
    95	int hv_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, gfn_t nr_pages)
    96	{
    97		struct kvm_hv_tlb_range range = {
    98			.start_gfn = start_gfn,
    99			.pages = nr_pages,
   100		};
   101	
   102		return __hv_flush_remote_tlbs_range(kvm, &range);
   103	}
 > 104	EXPORT_SYMBOL_FOR_KVM_INTERNAL(hv_flush_remote_tlbs_range);
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
