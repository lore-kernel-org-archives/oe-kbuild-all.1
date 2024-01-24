Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252A77F01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101507; cv=none; b=OjCc3oOoIX2d5PpGsFFcF4htHI9065OtGSSqFOfKVOE8SjoQAHWD7srV+LFJxaJzhoKdwTtD2hMOlyMboD9NV6r/70bNNiJWscPLZA5wFh04CTN9h3+FSrSThRVMk1ol11I6DWcRIaro+FVhuDSpyMghuw0+OIvIk7Wrd4PHtYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101507; c=relaxed/simple;
	bh=/HFosjyL64mKGXN6CK6Ta+CGJP5ctiQqm3hEm8G9LTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9nHtZV0Ocor1DrN8t4LV5aqiByqmMPnRVVK4vIO3iMyfLauQs/VWwQKF7yDW+Pv+JK9RKxzOEo6iLPAcdhRMf4X2I5AKx+RUueTyTLeEGYloATLcBIkp5zmvG0lfH9XwzroO0/o3WAQBp1bNacJeMGNgyi6ZyzMQWnWZgyxR4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2Vvyic/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2Vvyic/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706101504; x=1737637504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HFosjyL64mKGXN6CK6Ta+CGJP5ctiQqm3hEm8G9LTA=;
  b=V2Vvyic/oNgQbRCMKps4YkF3fzLt6Oe5bbtpXBFCx05cuVzR9l0PcqRc
   VtVeGzVhbBaMNL5afTJRbDkVi0lVrYWacGZ7HDPiV/GghrVdSxuvBwwrN
   i0ZlAcjZ/vJJ0yqB+xobcjUtaBCFKhWLSvs1Gwl721t6gIDQMNyU5AGQb
   8Dg2Ckw7ebgBEZ/cFVgCtlkMwAkXRJA5nNYTp6ctd5ya7XUJiAaFY6l2F
   ZYMXASvRZa9pNL98dbZyDtdrpbhCtdwxN2XRz4zh2xOfbVPUq0rq9chQx
   P+2oq0g2e8ALvqZ9W0Kp7Il1Vozx5q/3fM3ZtgT5CDC0v3BMjRBrI3YM4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8596922"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8596922"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 05:05:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820459744"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="820459744"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jan 2024 05:05:01 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rScw7-00086n-0g;
	Wed, 24 Jan 2024 13:04:59 +0000
Date: Wed, 24 Jan 2024 21:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1198/1678] include/linux/mm_inline.h:401:30:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202401242108.sR7fhT8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8bf1262c53f50fa91fe15d01e5ef5629db55313c
commit: 12600c77ca2b2be6af4e00f83d250f54f9c81496 [1198/1678] mm: make vm_area_struct anon_name field RCU-safe
config: x86_64-randconfig-122-20240124 (https://download.01.org/0day-ci/archive/20240124/202401242108.sR7fhT8J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401242108.sR7fhT8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401242108.sR7fhT8J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/fork.c:1240:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *owner @@     got struct task_struct *p @@
   kernel/fork.c:1240:19: sparse:     expected struct task_struct [noderef] __rcu *owner
   kernel/fork.c:1240:19: sparse:     got struct task_struct *p
   kernel/fork.c:1803:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1803:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1803:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1812:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1812:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1812:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1813:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1813:9: sparse:     expected void const *
   kernel/fork.c:1813:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1813:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1813:9: sparse:     expected void const *
   kernel/fork.c:1813:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1813:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *q @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1813:9: sparse:     expected void const *q
   kernel/fork.c:1813:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1814:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1814:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1814:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2316:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2316:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2316:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2320:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2320:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2320:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2631:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2631:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2631:32: sparse:     got struct task_struct *
   kernel/fork.c:2640:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2640:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2640:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2689:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2689:54: sparse:     expected struct list_head *head
   kernel/fork.c:2689:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2709:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2709:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2709:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2731:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2731:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2731:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2758:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2758:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2758:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2787:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2787:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2787:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2789:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2789:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2789:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3230:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3230:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3230:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3318:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3318:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3318:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c: note: in included file:
>> include/linux/mm_inline.h:401:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct anon_vma_name *anon_name @@     got struct anon_vma_name [noderef] __rcu *anon_name @@
   include/linux/mm_inline.h:401:30: sparse:     expected struct anon_vma_name *anon_name
   include/linux/mm_inline.h:401:30: sparse:     got struct anon_vma_name [noderef] __rcu *anon_name
   kernel/fork.c:1908:9: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2366:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2687:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2688:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1232:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:1232:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:1232:23: sparse:    struct task_struct *
--
>> mm/madvise.c:133:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct anon_vma_name [noderef] __rcu *anon_name @@     got struct anon_vma_name * @@
   mm/madvise.c:133:19: sparse:     expected struct anon_vma_name [noderef] __rcu *anon_name
   mm/madvise.c:133:19: sparse:     got struct anon_vma_name *
>> mm/madvise.c:137:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   mm/madvise.c:137:13: sparse:     expected struct kref *kref
   mm/madvise.c:137:13: sparse:     got struct kref [noderef] __rcu *
>> mm/madvise.c:140:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct anon_vma_name * @@     got struct anon_vma_name [noderef] __rcu *anon_name @@
   mm/madvise.c:140:16: sparse:     expected struct anon_vma_name *
   mm/madvise.c:140:16: sparse:     got struct anon_vma_name [noderef] __rcu *anon_name
   mm/madvise.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/madvise.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   include/linux/rcupdate.h:781:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - unexpected unlock

vim +401 include/linux/mm_inline.h

17fca131cee217 Arnd Bergmann      2022-01-14  394  
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  395  static inline void free_anon_vma_name(struct vm_area_struct *vma)
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  396  {
17fca131cee217 Arnd Bergmann      2022-01-14  397  	/*
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  398  	 * Not using anon_vma_name because it generates a warning if mmap_lock
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  399  	 * is not held, which might be the case here.
17fca131cee217 Arnd Bergmann      2022-01-14  400  	 */
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04 @401  	anon_vma_name_put(vma->anon_name);
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  402  }
17fca131cee217 Arnd Bergmann      2022-01-14  403  

:::::: The code at line 401 was first introduced by commit
:::::: 5c26f6ac9416b63d093e29c30e79b3297e425472 mm: refactor vm_area_struct::anon_vma_name usage code

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
