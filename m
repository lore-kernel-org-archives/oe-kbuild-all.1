Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440E214BF85
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717583917; cv=none; b=j/ky5mQUWJqt4kOAxviO3VX2m5ccUa1ZZTgqAAESbpZRjLTD0ilzHsu+cLsUSi8BciWdViSvGdb/Ioi7ErjxdHJJBdAyPzAgxyXBTrKUVvJeblAySYR5QhkPge+JJdxJZ96HJ1LxbfcpZ1g/3oXuydXc1eTxjIJsqHmw7oZNA6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717583917; c=relaxed/simple;
	bh=AmfP5qfN/OMxXEoDiPJxPXhowOzDH3RtSfFSifMCGFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ToVr8GXHACC7VykvC5uAmJ3Js6kzRwrol/h2soXGOoO9sk/3y75lduz0aRAN3Cdq3g2cpPWs+Sg6MLaYPTiM1/EbgI/UFXGGoGxx2HvV47Mjbe8o9Kkp129GgPxcKLvfWwpfZRvecb7X0MG8Tw+XD0ZmQc7d39WXiNb0cwx58K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KkUaYyL9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KkUaYyL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717583915; x=1749119915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmfP5qfN/OMxXEoDiPJxPXhowOzDH3RtSfFSifMCGFE=;
  b=KkUaYyL9yj9xHA26Fhor4HK3KCBbRL5xaiUL002S84mA8zKvXZUYCaRx
   6g0EfDp/INONQfDXjqJvrb+6KTut4bpNRqhIDTpCFJSAxxQDvH61hNsCv
   tcjy5AHWYL0XEdTQVgW33gbHpNDyRmo+5eN/y7eKXOrPI94wsRT2GDQPr
   AeEKgD8RQp+sEpENOakvS4LabEDRJhQQsJJFahAvINVcZYh9Fx2n7gKp1
   eba+BCad7LL7SUhU112EhIEdw6mLcvAUm3qBma0EYaKbXZW2qmDxpOOlu
   6octewQk7jbJjVsFg3wC1nQVRFVT8w7YGaU7LTnkXnZem7DCR6AHTvOOQ
   Q==;
X-CSE-ConnectionGUID: kY4K+53iRjOUJ65/oG+PBQ==
X-CSE-MsgGUID: 8m/tVU7aTVWZMQa80V5iPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17121202"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="17121202"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 03:38:35 -0700
X-CSE-ConnectionGUID: NSGu90q0S6CJ10YYd+T3kg==
X-CSE-MsgGUID: XmT2igQeRkGMA2HJ6bqkcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="42099630"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2024 03:38:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEo2F-0001OA-0r;
	Wed, 05 Jun 2024 10:38:27 +0000
Date: Wed, 5 Jun 2024 18:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 3313/3594] kernel/trace/fgraph.c:883:43: error:
 'struct ftrace_ops' has no member named 'subop_list'
Message-ID: <202406051855.9VIYXbTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   234cb065ad82915ff8d06ce01e01c3e640b674d2
commit: df3ec5da6a1e7f6e142680d7c5266d3af187170b [3313/3594] function_graph: Add pid tracing back to function graph tracer
config: riscv-randconfig-001-20240605 (https://download.01.org/0day-ci/archive/20240605/202406051855.9VIYXbTB-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051855.9VIYXbTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051855.9VIYXbTB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:11,
                    from arch/riscv/include/asm/processor.h:71,
                    from arch/riscv/include/asm/thread_info.h:36,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swap.h:5,
                    from include/linux/suspend.h:5,
                    from kernel/trace/fgraph.c:12:
   kernel/trace/fgraph.c: In function 'fgraph_update_pid_func':
>> kernel/trace/fgraph.c:883:43: error: 'struct ftrace_ops' has no member named 'subop_list'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                           ^
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from kernel/trace/fgraph.c:10:
>> kernel/trace/fgraph.c:883:43: error: 'struct ftrace_ops' has no member named 'subop_list'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                           ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: 'struct ftrace_ops' has no member named 'list'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> kernel/trace/fgraph.c:883:43: error: 'struct ftrace_ops' has no member named 'subop_list'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                           ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:428:27: error: expression in static assertion is not an integer
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/riscv/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:299,
                    from include/linux/build_bug.h:5:
>> include/linux/stddef.h:16:33: error: 'struct ftrace_ops' has no member named 'list'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63:
>> include/linux/list.h:769:26: error: 'struct ftrace_ops' has no member named 'list'
     769 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:779:15: note: in expansion of macro 'list_entry_is_head'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> kernel/trace/fgraph.c:883:43: error: 'struct ftrace_ops' has no member named 'subop_list'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |                                           ^
   include/linux/list.h:769:37: note: in definition of macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: 'struct ftrace_ops' has no member named 'list'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: 'struct ftrace_ops' has no member named 'list'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: 'struct ftrace_ops' has no member named 'list'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: 'struct ftrace_ops' has no member named 'list'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:428:27: error: expression in static assertion is not an integer
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct ftrace_ops' has no member named 'list'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   kernel/trace/fgraph.c:883:9: note: in expansion of macro 'list_for_each_entry'
     883 |         list_for_each_entry(op, &graph_ops.subop_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/trace/fgraph.c: In function 'register_ftrace_graph':
   kernel/trace/fgraph.c:972:15: error: implicit declaration of function 'ftrace_startup_subops'; did you mean 'ftrace_startup'? [-Werror=implicit-function-declaration]
     972 |         ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               ftrace_startup
   kernel/trace/fgraph.c: In function 'unregister_ftrace_graph':
   kernel/trace/fgraph.c:1012:9: error: implicit declaration of function 'ftrace_shutdown_subops'; did you mean 'ftrace_shutdown'? [-Werror=implicit-function-declaration]
    1012 |         ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         ftrace_shutdown
   cc1: some warnings being treated as errors


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
