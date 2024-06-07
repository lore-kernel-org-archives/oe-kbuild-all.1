Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9AF200A3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717770807; cv=none; b=CTZH8iRFQJmCco2JPRuEOpHQZwLGQpztp5pHxLQCPU5PgALtyW+6P8ymbJYVqTOiSJAWnTOo0d3E4ZHe7kAlqmmcQVfPAO7XYGYnYFHnt47wwZi1Gg8CkzThYpM57IgS1xemDwGfjkJV1ATue/bjFF3lgKXbgzwXQqGr5CQOoJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717770807; c=relaxed/simple;
	bh=eeUAA8FNtsvBWw049Jrt9l2WZxdDMIoWfQSF+OzC0Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cuVpFWobz12TSlSZDStyd+Y2QNClEEY6/dAH9pqXEBqeCC5PAK0xDFs/2VxACWzwM7gohPfgCUM9xcTQzDFfw8QKta6cN12tpIar4f4SPLtv9up1Gjg9DfM9rBgbqhEWMMp88Le96jP/8QLwUu/UDlWzxKo3tr9POgR6Of3g2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8BR8j38; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8BR8j38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717770806; x=1749306806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eeUAA8FNtsvBWw049Jrt9l2WZxdDMIoWfQSF+OzC0Aw=;
  b=P8BR8j38cRV/ViHvUy93fZ+DncRwNQBriJy1imMQkUKKRxan9gq6Ch7d
   NvntLLiUIG7VzL5TyTs3TjPdRksy/frpwgsQ6W6V2EOgLxJCZf7GoOGoe
   jKfrSWY9IY6CW9y+1PpRRnnO8n7Z+cFZQAIPcpvP3E1t/ce4lVovQAVHS
   xc+4R0+IFAY11u2RkUhhdHPo4FvdlntHLDhlQcxntYPwwUNbCTweiYJBo
   AKDwBwDDLcdB3QyiwDA2w2Gbs1nUb3VPReujJou/OV3H8oneKsemXYqM7
   0SrbFXjgpdOK4sze/O7126vEcfgnTt//M5oGRNXCvGRMzX5TRnXNgCOIt
   Q==;
X-CSE-ConnectionGUID: tBKeZdfHSpiOM/03yWNfEg==
X-CSE-MsgGUID: B9vACItLQCC2bhxTDAONmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="31989306"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="31989306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:33:22 -0700
X-CSE-ConnectionGUID: VBC3pqUfSBa/5ImQmSD0ww==
X-CSE-MsgGUID: P6FpJYvlRsGhcbdvGtQkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="69504103"
Received: from lkp-server01.sh.intel.com (HELO 7b447d911354) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2024 07:33:20 -0700
Received: from kbuild by 7b447d911354 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFaeb-00001m-2J;
	Fri, 07 Jun 2024 14:33:17 +0000
Date: Fri, 7 Jun 2024 22:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 3355/4582] kernel/trace/fgraph.c:883:37: error:
 no member named 'subop_list' in 'struct ftrace_ops'
Message-ID: <202406072236.0B811sja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: df3ec5da6a1e7f6e142680d7c5266d3af187170b [3355/4582] function_graph: Add pid tracing back to function graph tracer
config: mips-randconfig-r052-20240607 (https://download.01.org/0day-ci/archive/20240607/202406072236.0B811sja-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072236.0B811sja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072236.0B811sja-lkp@intel.com/

Note: the linux-next/master HEAD d35b2284e966c0bef3e2182a5c5ea02177dd32e4 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from kernel/trace/fgraph.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/trace/fgraph.c:883:37: error: no member named 'subop_list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                  ~~~~~~~~~ ^
   include/linux/list.h:778:30: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> kernel/trace/fgraph.c:883:37: error: no member named 'subop_list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                  ~~~~~~~~~ ^
   include/linux/list.h:778:30: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:428:63: note: expanded from macro '__same_type'
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/trace/fgraph.c:883:37: error: no member named 'subop_list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                  ~~~~~~~~~ ^
   include/linux/list.h:778:30: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                                     ^~~~
   include/linux/list.h:612:14: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:428:63: note: expanded from macro '__same_type'
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/trace/fgraph.c:883:2: error: no member named 'list' in 'ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^                                              ~~~~
   include/linux/list.h:778:13: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^                                    ~~~~~~
   include/linux/list.h:612:2: note: expanded from macro 'list_first_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^                             ~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^                       ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> kernel/trace/fgraph.c:883:2: error: assigning to 'struct ftrace_ops *' from incompatible type 'void'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:778:11: note: expanded from macro 'list_for_each_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/fgraph.c:883:49: error: no member named 'list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                             ~~                         ^
   include/linux/list.h:779:38: note: expanded from macro 'list_for_each_entry'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |                                  ~~~        ^
   include/linux/list.h:769:21: note: expanded from macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                       ~~~  ^
>> kernel/trace/fgraph.c:883:37: error: no member named 'subop_list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                  ~~~~~~~~~ ^
   include/linux/list.h:779:32: note: expanded from macro 'list_for_each_entry'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:769:30: note: expanded from macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
>> kernel/trace/fgraph.c:883:49: error: no member named 'list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:780:34: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
>> kernel/trace/fgraph.c:883:49: error: no member named 'list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:780:34: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:428:63: note: expanded from macro '__same_type'
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/trace/fgraph.c:883:49: error: no member named 'list' in 'struct ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/list.h:780:34: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/list.h:645:20: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:601:15: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:428:63: note: expanded from macro '__same_type'
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> kernel/trace/fgraph.c:883:2: error: no member named 'list' in 'ftrace_ops'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^                                              ~~~~
   include/linux/list.h:780:13: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^                    ~~~~~~
   include/linux/list.h:645:2: note: expanded from macro 'list_next_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^                                              ~~~~~~
   include/linux/list.h:601:2: note: expanded from macro 'list_entry'
     601 |         container_of(ptr, type, member)
         |         ^                       ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> kernel/trace/fgraph.c:883:2: error: assigning to 'struct ftrace_ops *' from incompatible type 'void'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:780:11: note: expanded from macro 'list_for_each_entry'
     780 |              pos = list_next_entry(pos, member))
         |                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:972:8: error: call to undeclared function 'ftrace_startup_subops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     972 |         ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
         |               ^
   kernel/trace/fgraph.c:1012:2: error: call to undeclared function 'ftrace_shutdown_subops'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1012 |         ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
         |         ^
   1 warning and 14 errors generated.


vim +883 kernel/trace/fgraph.c

   874	
   875	void fgraph_update_pid_func(void)
   876	{
   877		struct fgraph_ops *gops;
   878		struct ftrace_ops *op;
   879	
   880		if (!(graph_ops.flags & FTRACE_OPS_FL_INITIALIZED))
   881			return;
   882	
 > 883		list_for_each_entry(op, &graph_ops.subop_list, list) {
   884			if (op->flags & FTRACE_OPS_FL_PID) {
   885				gops = container_of(op, struct fgraph_ops, ops);
   886				gops->entryfunc = ftrace_pids_enabled(op) ?
   887					fgraph_pid_func : gops->saved_func;
   888			}
   889		}
   890	}
   891	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
