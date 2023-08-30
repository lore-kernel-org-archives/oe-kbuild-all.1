Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500EA1877
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693386322; x=1724922322;
  h=date:from:cc:subject:message-id:mime-version;
  bh=B0SRxmhgspnFQ2h5PNdwEbepkxCMdsMgy9Mz5wRNUUc=;
  b=ZtNcfsXZwHyphAgu46smunQ+MhbhOptDck1lM4ggFTAF6FUhJKrTSPLY
   9P8X9rH38+uvt9BPlR/LcjhXm4m19xE5s/rZQMqKhpZfSi4ot84Bum6fI
   sU4dd6e/a5Dbos99XX6Itd1ZrV7To92wrXFtCQZH7P9dgPGAR46eLaflk
   XC+u1/QVvOFCVBwxxZBrPcWWbSjrZ9lShi/0hY1flomdhmfQ/ENNjIBlo
   3xBtW9Wmoe5ghPsWuqtGLsOKE0zHatERAZGEvD3QWsLZbMb/hcvxKbygQ
   AZJDbAfayoCmJL8+KdPxopZo3F0iBGn3p8+raLT1pvgUOqgXM3WvVHyvU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378307232"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="378307232"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 02:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912709770"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="912709770"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Aug 2023 02:05:20 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbH8Z-0009eJ-22;
	Wed, 30 Aug 2023 09:05:19 +0000
Date: Wed, 30 Aug 2023 17:04:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>
Subject: [intel-lts:5.15/android_t-cve 2/16] arch/x86/kvm/xen.c:53:35: error:
 'struct gfn_to_pfn_cache' has no member named 'lock'
Message-ID: <202308301636.kg5gxjeT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t-cve
head:   42e5e003787ea49b32813fe6b85794f6142f9a2f
commit: 578c52964a7dcbb9fb59a260a69479b274d48d17 [2/16] KVM: x86: Fix wall clock writes in Xen shared_info not to mark page dirty
config: i386-randconfig-012-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301636.kg5gxjeT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301636.kg5gxjeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301636.kg5gxjeT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/xen.c: In function 'kvm_xen_shared_info_init':
   arch/x86/kvm/xen.c:36:17: error: implicit declaration of function 'kvm_gfn_to_pfn_cache_destroy'; did you mean 'kvm_gfn_to_hva_cache_init'? [-Werror=implicit-function-declaration]
      36 |                 kvm_gfn_to_pfn_cache_destroy(kvm, gpc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 kvm_gfn_to_hva_cache_init
   arch/x86/kvm/xen.c:41:23: error: implicit declaration of function 'kvm_gfn_to_pfn_cache_init'; did you mean 'kvm_gfn_to_hva_cache_init'? [-Werror=implicit-function-declaration]
      41 |                 ret = kvm_gfn_to_pfn_cache_init(kvm, gpc, NULL, false, true,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                       kvm_gfn_to_hva_cache_init
   In file included from include/linux/spinlock.h:317,
                    from include/linux/wait.h:9,
                    from include/linux/pid.h:6,
                    from include/linux/sched.h:14,
                    from include/linux/hardirq.h:9,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/x86.h:5,
                    from arch/x86/kvm/xen.c:9:
>> arch/x86/kvm/xen.c:53:35: error: 'struct gfn_to_pfn_cache' has no member named 'lock'
      53 |                 read_lock_irq(&gpc->lock);
         |                                   ^~
   include/linux/rwlock.h:101:60: note: in definition of macro 'read_lock_irq'
     101 | #define read_lock_irq(lock)             _raw_read_lock_irq(lock)
         |                                                            ^~~~
>> arch/x86/kvm/xen.c:55:24: error: 'struct gfn_to_pfn_cache' has no member named 'valid'
      55 |                 if (gpc->valid)
         |                        ^~
   arch/x86/kvm/xen.c:58:37: error: 'struct gfn_to_pfn_cache' has no member named 'lock'
      58 |                 read_unlock_irq(&gpc->lock);
         |                                     ^~
   include/linux/rwlock.h:107:62: note: in definition of macro 'read_unlock_irq'
     107 | #define read_unlock_irq(lock)           _raw_read_unlock_irq(lock)
         |                                                              ^~~~
>> arch/x86/kvm/xen.c:79:56: error: 'struct gfn_to_pfn_cache' has no member named 'khva'
      79 |                 struct compat_shared_info *shinfo = gpc->khva;
         |                                                        ^~
   arch/x86/kvm/xen.c:95:29: error: 'struct gfn_to_pfn_cache' has no member named 'lock'
      95 |         read_unlock_irq(&gpc->lock);
         |                             ^~
   include/linux/rwlock.h:107:62: note: in definition of macro 'read_unlock_irq'
     107 | #define read_unlock_irq(lock)           _raw_read_unlock_irq(lock)
         |                                                              ^~~~
   arch/x86/kvm/xen.c: In function 'kvm_xen_hvm_get_attr':
   arch/x86/kvm/xen.c:354:47: error: 'struct gfn_to_pfn_cache' has no member named 'active'
     354 |                 if (kvm->arch.xen.shinfo_cache.active)
         |                                               ^
   arch/x86/kvm/xen.c:355:88: error: 'struct gfn_to_pfn_cache' has no member named 'gpa'
     355 |                         data->u.shared_info.gfn = gpa_to_gfn(kvm->arch.xen.shinfo_cache.gpa);
         |                                                                                        ^
   cc1: some warnings being treated as errors


vim +53 arch/x86/kvm/xen.c

   > 9	#include "x86.h"
    10	#include "xen.h"
    11	#include "hyperv.h"
    12	
    13	#include <linux/kvm_host.h>
    14	#include <linux/sched/stat.h>
    15	
    16	#include <trace/events/kvm.h>
    17	#include <xen/interface/xen.h>
    18	#include <xen/interface/vcpu.h>
    19	
    20	#include "trace.h"
    21	
    22	DEFINE_STATIC_KEY_DEFERRED_FALSE(kvm_xen_enabled, HZ);
    23	
    24	static int kvm_xen_shared_info_init(struct kvm *kvm, gfn_t gfn)
    25	{
    26		struct gfn_to_pfn_cache *gpc = &kvm->arch.xen.shinfo_cache;
    27		struct pvclock_wall_clock *wc;
    28		gpa_t gpa = gfn_to_gpa(gfn);
    29		u32 *wc_sec_hi;
    30		u32 wc_version;
    31		u64 wall_nsec;
    32		int ret = 0;
    33		int idx = srcu_read_lock(&kvm->srcu);
    34	
    35		if (gfn == GPA_INVALID) {
    36			kvm_gfn_to_pfn_cache_destroy(kvm, gpc);
    37			goto out;
    38		}
    39	
    40		do {
    41			ret = kvm_gfn_to_pfn_cache_init(kvm, gpc, NULL, false, true,
    42							gpa, PAGE_SIZE, false);
    43			if (ret)
    44				goto out;
    45	
    46			/*
    47			 * This code mirrors kvm_write_wall_clock() except that it writes
    48			 * directly through the pfn cache and doesn't mark the page dirty.
    49			 */
    50			wall_nsec = ktime_get_real_ns() - get_kvmclock_ns(kvm);
    51	
    52			/* It could be invalid again already, so we need to check */
  > 53			read_lock_irq(&gpc->lock);
    54	
  > 55			if (gpc->valid)
    56				break;
    57	
    58			read_unlock_irq(&gpc->lock);
    59		} while (1);
    60	
    61		/* Paranoia checks on the 32-bit struct layout */
    62		BUILD_BUG_ON(offsetof(struct compat_shared_info, wc) != 0x900);
    63		BUILD_BUG_ON(offsetof(struct compat_shared_info, arch.wc_sec_hi) != 0x924);
    64		BUILD_BUG_ON(offsetof(struct pvclock_vcpu_time_info, version) != 0);
    65	
    66	#ifdef CONFIG_X86_64
    67		/* Paranoia checks on the 64-bit struct layout */
    68		BUILD_BUG_ON(offsetof(struct shared_info, wc) != 0xc00);
    69		BUILD_BUG_ON(offsetof(struct shared_info, wc_sec_hi) != 0xc0c);
    70	
    71		if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
    72			struct shared_info *shinfo = gpc->khva;
    73	
    74			wc_sec_hi = &shinfo->wc_sec_hi;
    75			wc = &shinfo->wc;
    76		} else
    77	#endif
    78		{
  > 79			struct compat_shared_info *shinfo = gpc->khva;
    80	
    81			wc_sec_hi = &shinfo->arch.wc_sec_hi;
    82			wc = &shinfo->wc;
    83		}
    84	
    85		/* Increment and ensure an odd value */
    86		wc_version = wc->version = (wc->version + 1) | 1;
    87		smp_wmb();
    88	
    89		wc->nsec = do_div(wall_nsec,  1000000000);
    90		wc->sec = (u32)wall_nsec;
    91		*wc_sec_hi = wall_nsec >> 32;
    92		smp_wmb();
    93	
    94		wc->version = wc_version + 1;
    95		read_unlock_irq(&gpc->lock);
    96	
    97		kvm_make_all_cpus_request(kvm, KVM_REQ_MASTERCLOCK_UPDATE);
    98	
    99	out:
   100		srcu_read_unlock(&kvm->srcu, idx);
   101		return ret;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
