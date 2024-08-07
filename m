Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0121741C9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723031059; cv=none; b=Q7Bwkqmdsa8J8rOu918YpjtXV4KokzZZMsskhVLIv/K0uXa9UXmp35PaC1aKwwQugnFNrSwQuupmYCR30ts5D97JfAvS9d8UZJ2vammjGnctq0pEzD0kqGc8l5y+dqgVMfy5+r0RvLBfCn45vnu/HBdrRNqhXa0E3tNaevrUfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723031059; c=relaxed/simple;
	bh=Cip0420gTJt3lIkMLCNPo2B6iGc0dnu0cf/oHemuEwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dqUPkL34XuZJaXUqM+AqF4C5iGYZ7FAZrVsz0Px0AGyTIpAunk7V3qW+WIbBhio09zUW3PdD/tkKveNBNWrjwSbxZ3fVvogPqd6wMTWyMDnWsFSfAwVpv7omLGKbCkXm6rRIwi0ib3Yi/bAL/1OD1TXHN+BJAF25j5D8aFCg6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akkRbA7K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akkRbA7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723031056; x=1754567056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cip0420gTJt3lIkMLCNPo2B6iGc0dnu0cf/oHemuEwg=;
  b=akkRbA7K1j6Y71V4f2TnVnI5KkuC+F9lCwPPSppx4zUm6ibyRVFN0Vk0
   cOVJqvi4XGY8JhNlmphZj1yKs8SLc3sizNK8VasYQKssdj4yXokVSfXS7
   vHaj9N7eWmbcGTynaHT45n2gBZUjcQcv6U+403gUpEGYpnL07L8PndsZ4
   qVTvWjg8zhGdZB3VKgI/3YF5ewnh1m0EK2TG35vLXlSm/5gXZAD5CgSoj
   +udYE7co8K26pqqk54r9ftk4g3UnO3hMJaE5ZLEwS2CPNhivOahApvP0t
   PIjhCQeMF1XbiMqoUITUSw0J7lIN+USkKH+n4bWVQHI0fAoatTwo5A6XS
   A==;
X-CSE-ConnectionGUID: bJEoWdVDQjiBM1aPzP97AQ==
X-CSE-MsgGUID: KCKAAqlkQE2kGCMBCXphlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31725177"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="31725177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:44:15 -0700
X-CSE-ConnectionGUID: xQxwU8c8T7iH2KW2YQbEnw==
X-CSE-MsgGUID: dmru6i4LSmiMZVWHOZUyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56693884"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2024 04:44:14 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbf5P-0005Kg-1b;
	Wed, 07 Aug 2024 11:44:11 +0000
Date: Wed, 7 Aug 2024 19:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/prjc 1/477] kernel/sched/core.c:3887:48: error: 'struct
 task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
Message-ID: <202408071926.bWBrGpvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/prjc
head:   c8c75ea66490474e19c68959730c4991f1be5bf5
commit: d821e3e85092581709b1b5f9ab8cacf0ce70c1a8 [1/477] Project C v5.7.5-r2
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240807/202408071926.bWBrGpvi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071926.bWBrGpvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071926.bWBrGpvi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:87:
   kernel/sched/sched.h: In function '__set_task_cpu':
   kernel/sched/sched.h:2075:12: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    2075 |         p->wake_cpu = cpu;
         |            ^~~~~~~~
         |            wake_q
   kernel/sched/core.c: In function 'migration_cpu_stop':
   kernel/sched/core.c:2633:28: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    2633 |                         p->wake_cpu = arg->dest_cpu;
         |                            ^~~~~~~~
         |                            wake_q
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   kernel/sched/core.c: In function 'sched_ttwu_pending':
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:203:20: note: in expansion of macro 'llist_entry'
     203 |         for (pos = llist_entry((node), typeof(*pos), member);                  \
         |                    ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:203:20: note: in expansion of macro 'llist_entry'
     203 |         for (pos = llist_entry((node), typeof(*pos), member);                  \
         |                    ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:299,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:203:20: note: in expansion of macro 'llist_entry'
     203 |         for (pos = llist_entry((node), typeof(*pos), member);                  \
         |                    ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   include/linux/llist.h:204:14: note: in expansion of macro 'member_address_is_nonnull'
     204 |              member_address_is_nonnull(pos, member) &&                         \
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/llist.h:205:22: note: in expansion of macro 'llist_entry'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                      ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:205:22: note: in expansion of macro 'llist_entry'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                      ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:205:22: note: in expansion of macro 'llist_entry'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                      ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:205:22: note: in expansion of macro 'llist_entry'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                      ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:205:22: note: in expansion of macro 'llist_entry'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                      ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:299,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
>> kernel/sched/core.c:3887:48: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |                                                ^~~~~~~~~~
   include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                          ^~~~~~
   include/linux/llist.h:110:9: note: in expansion of macro 'container_of'
     110 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/llist.h:205:22: note: in expansion of macro 'llist_entry'
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                      ^~~~~~~~~~~
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/smp_types.h:5,
                    from include/linux/smp.h:15,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:9:
   include/linux/llist.h:205:71: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     205 |                 (n = llist_entry(pos->member.next, typeof(*n), member), true); \
         |                                                                       ^
   kernel/sched/core.c:3887:9: note: in expansion of macro 'llist_for_each_entry_safe'
    3887 |         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function '__ttwu_queue_wakelist':
   kernel/sched/core.c:3940:42: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    3940 |         __smp_call_single_queue(cpu, &p->wake_entry.llist);
         |                                          ^~~~~~~~~~
         |                                          ptrace_entry
   kernel/sched/core.c: In function 'try_to_wake_up':
   kernel/sched/core.c:4362:44: error: 'struct task_struct' has no member named 'wake_cpu'; did you mean 'wake_q'?
    4362 |                 cpu = select_task_rq(p, p->wake_cpu, wake_flags | WF_TTWU);
         |                                            ^~~~~~~~
         |                                            wake_q
   kernel/sched/core.c: In function '__sched_fork':
   kernel/sched/core.c:4564:12: error: 'struct task_struct' has no member named 'wake_entry'; did you mean 'ptrace_entry'?
    4564 |         p->wake_entry.u_flags = CSD_TYPE_TTWU;
         |            ^~~~~~~~~~
         |            ptrace_entry
   kernel/sched/core.c: In function 'wake_up_new_task':
   kernel/sched/core.c:4891:10: error: 'struct task_struct' has no member named 'recent_used_cpu'
    4891 |         p->recent_used_cpu = task_cpu(p);
         |          ^~


vim +3887 kernel/sched/core.c

c05fbafba1c548 kernel/sched.c      Peter Zijlstra 2011-04-05  3872  
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3873  #ifdef CONFIG_SMP
a148866489fbe2 kernel/sched/core.c Peter Zijlstra 2020-05-26  3874  void sched_ttwu_pending(void *arg)
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3875  {
a148866489fbe2 kernel/sched/core.c Peter Zijlstra 2020-05-26  3876  	struct llist_node *llist = arg;
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3877  	struct rq *rq = this_rq();
73215849dfbf63 kernel/sched/core.c Byungchul Park 2017-05-12  3878  	struct task_struct *p, *t;
d8ac897137a230 kernel/sched/core.c Matt Fleming   2016-09-21  3879  	struct rq_flags rf;
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3880  
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3881  	if (!llist)
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3882  		return;
e3baac47f0e82c kernel/sched/core.c Peter Zijlstra 2014-06-04  3883  
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra 2016-10-04  3884  	rq_lock_irqsave(rq, &rf);
77558e4d01ac0c kernel/sched/core.c Peter Zijlstra 2017-02-21  3885  	update_rq_clock(rq);
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3886  
8c4890d1c3358f kernel/sched/core.c Peter Zijlstra 2020-06-22 @3887  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3888  		if (WARN_ON_ONCE(p->on_cpu))
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3889  			smp_cond_load_acquire(&p->on_cpu, !VAL);
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3890  
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3891  		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3892  			set_task_cpu(p, cpu_of(rq));
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3893  
73215849dfbf63 kernel/sched/core.c Byungchul Park 2017-05-12  3894  		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra 2020-06-22  3895  	}
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3896  
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3897  	/*
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3898  	 * Must be after enqueueing at least once task such that
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3899  	 * idle_cpu() does not observe a false-negative -- if it does,
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3900  	 * it is possible for select_idle_siblings() to stack a number
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3901  	 * of tasks on this CPU during that window.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3902  	 *
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3903  	 * It is ok to clear ttwu_pending when another task pending.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3904  	 * We will receive IPI after local irq enabled and then enqueue it.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3905  	 * Since now nr_running > 0, idle_cpu() will always get correct result.
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3906  	 */
d6962c4fe8f96f kernel/sched/core.c Tianchen Ding  2022-11-04  3907  	WRITE_ONCE(rq->ttwu_pending, 0);
8a8c69c3277886 kernel/sched/core.c Peter Zijlstra 2016-10-04  3908  	rq_unlock_irqrestore(rq, &rf);
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3909  }
317f394160e9be kernel/sched.c      Peter Zijlstra 2011-04-05  3910  

:::::: The code at line 3887 was first introduced by commit
:::::: 8c4890d1c3358fb8023d46e1e554c41d54f02878 smp, irq_work: Continue smp_call_function*() and irq_work*() integration

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
