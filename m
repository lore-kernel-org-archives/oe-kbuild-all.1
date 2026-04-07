Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17077322A1F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534440; cv=none; b=YGshHi5AQq16tlAwiRVjfKPxYwSyu0s+Jx9aJ59o0gZroKzCPyk1AzfUskGYKBqMdx9anhwk++2gkenUzq5x2IEAR2Zkq+YSZdI2oKBXOJ6DM5BnOUjjhRLS74u7jh641h/Is5JPHKLX+j+VZpSG8X1LyUUoRBUiC6CXF8N5CPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534440; c=relaxed/simple;
	bh=0H+dGPPyVa+pTBEuyKfmi/nAPMufswQvJhXFqMGoVs0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9AzmR/kJmknEjIAm9RSOMgyzrcc74v9Gv8YAFIOAG1kkSvG6mIscWFuvoTM4bNsTz+/FRw1+PUcn/IhjC4yhE8c/eUTWSir7ULJcQL5+UP9DzQanY4BAzHrrfHdBlX2cUGM5osFg5ID/kggu+hFqwmHKd0lz930VQJIoNmnSGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4+hO0mR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4+hO0mR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534439; x=1807070439;
  h=date:from:to:cc:subject:message-id;
  bh=0H+dGPPyVa+pTBEuyKfmi/nAPMufswQvJhXFqMGoVs0=;
  b=Y4+hO0mRoVByQOB00oU1Q9U0CWdk0xwGNsGhweng/Ai42NwdOLvnpmHU
   dxwjq+DkNyiC02fdcCSapWfGFDOJcJnNOFWU5RBLvtpDMxfE/8Ww/BQVk
   9KQVYL0R5A1/SidKbOtfvDz7spzKa3jZVIOXMtjPteqnkiz/T/x9ExRAm
   6FxIG4XtPrC5jPuShD3jMwZG9sSqDwejeeNQCInyiDUsmN+JsAZFJbrQx
   K5eWmCQ4EiLNmq9uvIXrBMXE7ULcVHjnPv19L8mtjUCRqhvefwJ2BPJPk
   eVoJx+/LosTBM5pOEPaoAVxrlJQRHAjlsZLQ/J/mWFyqYRLGhTuDlA9qe
   A==;
X-CSE-ConnectionGUID: n6laAMNRQNSzMvdjY8XRSw==
X-CSE-MsgGUID: aSXup/BDS+2LXdX0s8wMRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86782254"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="86782254"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:00:37 -0700
X-CSE-ConnectionGUID: TMSsAS6PTYW9Wo7wndjwYQ==
X-CSE-MsgGUID: YL/IhbK2QF6BLQPeoRA38w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="225304371"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 21:00:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xc9-0000000007R-2TcT;
	Tue, 07 Apr 2026 04:00:33 +0000
Date: Tue, 07 Apr 2026 12:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/prjc 16/22] kernel/sched/alt_core.c:7352:44:
 error: 'struct mm_mm_cid' has no member named 'user_list'
Message-ID: <202604051820.Vi494cDW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/prjc
head:   14ff03aebefa493a7d7ecfcbff66ded1147dba3e
commit: 929363bec03b29a52d29a1e3b16e8b631ad47d18 [16/22] sched/alt: [Sync] 81f70f0ee9ea sched/mmcid: Avoid full tasklist walks
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260405/202604051820.Vi494cDW-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051820.Vi494cDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051820.Vi494cDW-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/alt_core.c:3092:13: error: static declaration of 'sched_mm_cid_fork' follows non-static declaration
    3092 | static void sched_mm_cid_fork(struct task_struct *t);
         |             ^~~~~~~~~~~~~~~~~
   In file included from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2351:6: note: previous declaration of 'sched_mm_cid_fork' with type 'void(struct task_struct *)'
    2351 | void sched_mm_cid_fork(struct task_struct *t);
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_init_topology_cpumask':
   kernel/sched/alt_core.c:6220:57: error: implicit declaration of function 'cpu_coregroup_mask' [-Wimplicit-function-declaration]
    6220 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:6220:57: error: passing argument 1 of 'cpumask_first' makes pointer from integer without a cast [-Wint-conversion]
    6220 |                 per_cpu(sd_llc_id, cpu) = cpumask_first(cpu_coregroup_mask(cpu));
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                         |
         |                                                         int
   In file included from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:6,
                    from ./arch/mips/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12:
   include/linux/cpumask.h:155:73: note: expected 'const struct cpumask *' but argument is of type 'int'
     155 | static __always_inline unsigned int cpumask_first(const struct cpumask *srcp)
         |                                                   ~~~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/sched/alt_core.c:6222:45: error: passing argument 3 of 'cpumask_and' makes pointer from integer without a cast [-Wint-conversion]
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6196:37: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6196 |         if (cpumask_and(topo, topo, mask)) {                                    \
         |                                     ^~~~
   include/linux/cpumask.h:714:40: note: expected 'const struct cpumask *' but argument is of type 'int'
     714 |                  const struct cpumask *src2p)
         |                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
   kernel/sched/alt_core.c:6222:45: error: passing argument 2 of 'cpumask_copy' makes pointer from integer without a cast [-Wint-conversion]
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   kernel/sched/alt_core.c:6197:36: note: in definition of macro 'TOPOLOGY_CPUMASK'
    6197 |                 cpumask_copy(topo, mask);                                       \
         |                                    ^~~~
   include/linux/cpumask.h:932:63: note: expected 'const struct cpumask *' but argument is of type 'int'
     932 | void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
         |                                         ~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/cpumask.h:13:
   include/linux/cpumask_types.h:18:37: error: invalid type argument of '->' (have 'int')
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   kernel/sched/alt_core.c:6202:55: note: in expansion of macro 'cpumask_bits'
    6202 |                 bitmap_complement(cpumask_bits(topo), cpumask_bits(mask),       \
         |                                                       ^~~~~~~~~~~~
   kernel/sched/alt_core.c:6222:17: note: in expansion of macro 'TOPOLOGY_CPUMASK'
    6222 |                 TOPOLOGY_CPUMASK(coregroup, cpu_coregroup_mask(cpu), false);
         |                 ^~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:8,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15:
   kernel/sched/alt_core.c: In function 'mm_cid_fixup_tasks_to_cpus':
>> kernel/sched/alt_core.c:7352:44: error: 'struct mm_mm_cid' has no member named 'user_list'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                            ^
   include/linux/list.h:1156:19: note: in definition of macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                   ^~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7352:44: error: 'struct mm_mm_cid' has no member named 'user_list'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                            ^
   include/linux/list.h:1156:35: note: in definition of macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                                   ^~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13:
   include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1167:20: note: in expansion of macro 'hlist_entry_safe'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7352:62: error: 'struct sched_mm_cid' has no member named 'node'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                                              ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1167:20: note: in expansion of macro 'hlist_entry_safe'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:35: error: invalid type argument of unary '*' (have 'int')
      22 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1167:20: note: in expansion of macro 'hlist_entry_safe'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:566:27: error: expression in static assertion is not an integer
     566 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1167:20: note: in expansion of macro 'hlist_entry_safe'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/uapi/linux/sched.h:5,
                    from include/linux/sched.h:10:
>> include/linux/stddef.h:16:33: error: 'struct sched_mm_cid' has no member named 'node'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1167:20: note: in expansion of macro 'hlist_entry_safe'
    1167 |         for (pos = hlist_entry_safe((head)->first, typeof(*(pos)), member);\
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7352:62: error: 'struct sched_mm_cid' has no member named 'node'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                                              ^
   include/linux/list.h:1156:19: note: in definition of macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                   ^~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7352:62: error: 'struct sched_mm_cid' has no member named 'node'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                                              ^
   include/linux/list.h:1156:35: note: in definition of macro 'hlist_entry_safe'
    1156 |         ({ typeof(ptr) ____ptr = (ptr); \
         |                                   ^~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:21:35: error: invalid type argument of unary '*' (have 'int')
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1169:20: note: in expansion of macro 'hlist_entry_safe'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:7352:62: error: 'struct sched_mm_cid' has no member named 'node'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |                                                              ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1169:20: note: in expansion of macro 'hlist_entry_safe'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:35: error: invalid type argument of unary '*' (have 'int')
      22 |                       __same_type(*(ptr), void),                        \
         |                                   ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1169:20: note: in expansion of macro 'hlist_entry_safe'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:566:27: error: expression in static assertion is not an integer
     566 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1169:20: note: in expansion of macro 'hlist_entry_safe'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct sched_mm_cid' has no member named 'node'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:1146:40: note: in expansion of macro 'container_of'
    1146 | #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
         |                                        ^~~~~~~~~~~~
   include/linux/list.h:1157:22: note: in expansion of macro 'hlist_entry'
    1157 |            ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
         |                      ^~~~~~~~~~~
   include/linux/list.h:1169:20: note: in expansion of macro 'hlist_entry_safe'
    1169 |              pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
         |                    ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:7352:9: note: in expansion of macro 'hlist_for_each_entry'
    7352 |         hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function 'sched_mm_cid_add_user':
   kernel/sched/alt_core.c:7366:34: error: 'struct sched_mm_cid' has no member named 'node'
    7366 |         hlist_add_head(&t->mm_cid.node, &mm->mm_cid.user_list);
         |                                  ^
   kernel/sched/alt_core.c:7366:52: error: 'struct mm_mm_cid' has no member named 'user_list'
    7366 |         hlist_add_head(&t->mm_cid.node, &mm->mm_cid.user_list);
         |                                                    ^
   kernel/sched/alt_core.c: In function 'sched_mm_cid_remove_user':
   kernel/sched/alt_core.c:7424:34: error: 'struct sched_mm_cid' has no member named 'node'
    7424 |         hlist_del_init(&t->mm_cid.node);
         |                                  ^
   kernel/sched/alt_core.c: In function 'mm_init_cid':
   kernel/sched/alt_core.c:7567:36: error: 'struct mm_mm_cid' has no member named 'user_list'
    7567 |         INIT_HLIST_HEAD(&mm->mm_cid.user_list);
         |                                    ^
   include/linux/list.h:945:32: note: in definition of macro 'INIT_HLIST_HEAD'
     945 | #define INIT_HLIST_HEAD(ptr) ((ptr)->first = NULL)
         |                                ^~~


vim +7352 kernel/sched/alt_core.c

  7344	
  7345	static void mm_cid_fixup_tasks_to_cpus(void)
  7346	{
  7347		struct mm_struct *mm = current->mm;
  7348		struct task_struct *t;
  7349	
  7350		lockdep_assert_held(&mm->mm_cid.mutex);
  7351	
> 7352		hlist_for_each_entry(t, &mm->mm_cid.user_list, mm_cid.node) {
  7353			/* Current has already transferred before invoking the fixup. */
  7354			if (t != current)
  7355				mm_cid_fixup_task_to_cpu(t, mm);
  7356		}
  7357	
  7358		mm_cid_complete_transit(mm, MM_CID_ONCPU);
  7359	}
  7360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
