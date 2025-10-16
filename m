Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC7C31D75C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616600; cv=none; b=cG/791V5+GP1Cf2UNH79em6ddcuGCEEwtc0U8dWHzgU6Xoo9E6QeEBzEF+0gomm4jGdEfGz+PFE30OF1fTGjBajSwSl1VAk1ffa/0TRbaWGJxYEXm5s2/rVMK3J6o+idw3Ur3YpdzT9456kYUDALiBThhXdIO3sCnOrBlGfyFpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616600; c=relaxed/simple;
	bh=blmyTabLIwvXNelCk6jVZnkgHgG0lwYeciQW9zGW+Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rsiss8GeUlkD/o5wPSo5YCO0gPAIpncgc7l4TQU/facyv+EZWtZrCOjblq7iRigTYs8wikgD+px3WFZD4w9bAEPAqLWdQwvjg5snoiEiqyiWF5iQuWXhcyNJ0+YKI95tdV78feQJc+T9hlCEqRVQVzGmsuJiMR5JHI1RZwSBDfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO0Vzwx0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO0Vzwx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760616599; x=1792152599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blmyTabLIwvXNelCk6jVZnkgHgG0lwYeciQW9zGW+Jw=;
  b=YO0Vzwx00Pw8TsnS/rvcd+En3DcM0j84B28nZWe6GTwXJJRnmjqtvvQA
   sDCAt6una0Xap7yaSpcSo2GiRg8ZwsJ6d6a/sCWpPcWQdWkfI7hLZa3l3
   RNkEFy7JCWk+D/1wIc1ybD32Qzz55zNK2WaV9+HkGg0LdzkZtc6FigfMC
   TCKbX+vaEFbL2anvXaPG+1FDENHyyW+8EpTxdeunpbeRRLwZcYbqVmVv1
   PNrVWtVy485HECiDniLPNuM2EvMsLAzhAW32Pp7LMqGTa4gnpWHSRryxN
   93LYJRffGyhtoMKkzAA/xkB1Vss+0QKUkpzJ5pX+ymoGEOlKWVjRDoOPD
   A==;
X-CSE-ConnectionGUID: krIt+jXsS3uGPY8USmmyaA==
X-CSE-MsgGUID: l7bA0LHfQb+gQUYoHiekvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74150242"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="74150242"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 05:09:58 -0700
X-CSE-ConnectionGUID: MqQiJNsfQpmhzxTZFl4Idg==
X-CSE-MsgGUID: skpsWXTJRZmjV64RMnJM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187527958"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Oct 2025 05:09:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Mno-0004n1-2P;
	Thu, 16 Oct 2025 12:09:52 +0000
Date: Thu, 16 Oct 2025 20:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Kirsher <jeff.kirsher@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [jkirsher-net-queue:master 3/4] include/linux/list.h:869:64:
 warning: left-hand operand of comma expression has no effect
Message-ID: <202510162006.sqG68GmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   c9a8544415241209a476e56cc98a09ab074e29a8
commit: 342c35f4adfbb95a7be4bd984ee3546a594afde7 [3/4] af_unix: Suppress false-positive lockdep splat for spin_lock() in __unix_gc().
config: arc-nsimosci_defconfig (https://download.01.org/0day-ci/archive/20251016/202510162006.sqG68GmM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510162006.sqG68GmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510162006.sqG68GmM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from net/unix/garbage.c:66:
   net/unix/garbage.c: In function '__unix_gc':
   net/unix/garbage.c:591:34: error: 'u' undeclared (first use in this function); did you mean 'up'?
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |                                  ^
   include/linux/list.h:869:14: note: in definition of macro 'list_for_each_entry_safe'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |              ^~~
   net/unix/garbage.c:591:34: note: each undeclared identifier is reported only once for each function it appears in
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |                                  ^
   include/linux/list.h:869:14: note: in definition of macro 'list_for_each_entry_safe'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |              ^~~
   In file included from include/linux/list.h:5:
   net/unix/garbage.c:591:44: error: 'gc_inflight_list' undeclared (first use in this function)
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |                                            ^~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   net/unix/garbage.c:591:9: note: in expansion of macro 'list_for_each_entry_safe'
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5:
   include/linux/compiler_types.h:530:27: error: expression in static assertion is not an integer
     530 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   net/unix/garbage.c:591:9: note: in expansion of macro 'list_for_each_entry_safe'
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/garbage.c:591:37: error: 'next' undeclared (first use in this function); did you mean 'net'?
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |                                     ^~~~
   include/linux/list.h:870:17: note: in definition of macro 'list_for_each_entry_safe'
     870 |                 n = list_next_entry(pos, member);                       \
         |                 ^
   include/linux/compiler_types.h:530:27: error: expression in static assertion is not an integer
     530 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   net/unix/garbage.c:591:9: note: in expansion of macro 'list_for_each_entry_safe'
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:869:64: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                                                ^
   net/unix/garbage.c:591:9: note: in expansion of macro 'list_for_each_entry_safe'
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:530:27: error: expression in static assertion is not an integer
     530 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   net/unix/garbage.c:591:9: note: in expansion of macro 'list_for_each_entry_safe'
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:872:21: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     872 |              pos = n, n = list_next_entry(n, member))
         |                     ^
   net/unix/garbage.c:591:9: note: in expansion of macro 'list_for_each_entry_safe'
     591 |         list_for_each_entry_safe(u, next, &gc_inflight_list, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   net/unix/garbage.c:600:51: error: 'gc_candidates' undeclared (first use in this function)
     600 |                         list_move_tail(&u->link, &gc_candidates);
         |                                                   ^~~~~~~~~~~~~
   In file included from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9:
   net/unix/garbage.c:601:35: error: 'UNIX_GC_CANDIDATE' undeclared (first use in this function)
     601 |                         __set_bit(UNIX_GC_CANDIDATE, &u->gc_flags);
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   net/unix/garbage.c:601:25: note: in expansion of macro '__set_bit'
     601 |                         __set_bit(UNIX_GC_CANDIDATE, &u->gc_flags);
         |                         ^~~~~~~~~
   net/unix/garbage.c:602:35: error: 'UNIX_GC_MAYBE_CYCLE' undeclared (first use in this function)
     602 |                         __set_bit(UNIX_GC_MAYBE_CYCLE, &u->gc_flags);
         |                                   ^~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   net/unix/garbage.c:602:25: note: in expansion of macro '__set_bit'
     602 |                         __set_bit(UNIX_GC_MAYBE_CYCLE, &u->gc_flags);
         |                         ^~~~~~~~~
   net/unix/garbage.c:605:33: error: implicit declaration of function 'unix_state_lock_nested'; did you mean 'mmap_write_lock_nested'? [-Wimplicit-function-declaration]
     605 |                                 unix_state_lock_nested(sk, U_LOCK_GC_LISTENER);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 mmap_write_lock_nested
   net/unix/garbage.c:626:1: warning: label 'skip_gc' defined but not used [-Wunused-label]
     626 | skip_gc:
         | ^~~~~~~


vim +869 include/linux/list.h

4d70c74659d974 Andy Shevchenko          2022-11-30  765  
e130816164e244 Andy Shevchenko          2020-10-15  766  /**
e130816164e244 Andy Shevchenko          2020-10-15  767   * list_entry_is_head - test if the entry points to the head of the list
e130816164e244 Andy Shevchenko          2020-10-15  768   * @pos:	the type * to cursor
e130816164e244 Andy Shevchenko          2020-10-15  769   * @head:	the head for your list.
e130816164e244 Andy Shevchenko          2020-10-15  770   * @member:	the name of the list_head within the struct.
e130816164e244 Andy Shevchenko          2020-10-15  771   */
e130816164e244 Andy Shevchenko          2020-10-15  772  #define list_entry_is_head(pos, head, member)				\
2932fb0a927d30 Wei Yang                 2024-02-08  773  	list_is_head(&pos->member, (head))
e130816164e244 Andy Shevchenko          2020-10-15  774  
^1da177e4c3f41 Linus Torvalds           2005-04-16  775  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  776   * list_for_each_entry	-	iterate over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  777   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  778   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  779   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  780   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  781  #define list_for_each_entry(pos, head, member)				\
93be3c2eb3371f Oleg Nesterov            2013-11-12  782  	for (pos = list_first_entry(head, typeof(*pos), member);	\
e130816164e244 Andy Shevchenko          2020-10-15  783  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  784  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  785  
^1da177e4c3f41 Linus Torvalds           2005-04-16  786  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  787   * list_for_each_entry_reverse - iterate backwards over list of given type.
8e3a67a99231f9 Randy Dunlap             2006-06-25  788   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  789   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  790   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  791   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  792  #define list_for_each_entry_reverse(pos, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12  793  	for (pos = list_last_entry(head, typeof(*pos), member);		\
e130816164e244 Andy Shevchenko          2020-10-15  794  	     !list_entry_is_head(pos, head, member); 			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  795  	     pos = list_prev_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  796  
^1da177e4c3f41 Linus Torvalds           2005-04-16  797  /**
72fd4a35a82433 Robert P. J. Day         2007-02-10  798   * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
^1da177e4c3f41 Linus Torvalds           2005-04-16  799   * @pos:	the type * to use as a start point
^1da177e4c3f41 Linus Torvalds           2005-04-16  800   * @head:	the head of the list
3943f42c11896c Andrey Utkin             2014-11-14  801   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  802   *
72fd4a35a82433 Robert P. J. Day         2007-02-10  803   * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
^1da177e4c3f41 Linus Torvalds           2005-04-16  804   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  805  #define list_prepare_entry(pos, head, member) \
^1da177e4c3f41 Linus Torvalds           2005-04-16  806  	((pos) ? : list_entry(head, typeof(*pos), member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  807  
^1da177e4c3f41 Linus Torvalds           2005-04-16  808  /**
fe96e57d77481c Randy Dunlap             2006-06-25  809   * list_for_each_entry_continue - continue iteration over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  810   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  811   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  812   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  813   *
fe96e57d77481c Randy Dunlap             2006-06-25  814   * Continue to iterate over list of given type, continuing after
fe96e57d77481c Randy Dunlap             2006-06-25  815   * the current position.
^1da177e4c3f41 Linus Torvalds           2005-04-16  816   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  817  #define list_for_each_entry_continue(pos, head, member) 		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  818  	for (pos = list_next_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  819  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  820  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  821  
768f3591e2b1cc Pavel Emelyanov          2007-09-18  822  /**
768f3591e2b1cc Pavel Emelyanov          2007-09-18  823   * list_for_each_entry_continue_reverse - iterate backwards from the given point
768f3591e2b1cc Pavel Emelyanov          2007-09-18  824   * @pos:	the type * to use as a loop cursor.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  825   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  826   * @member:	the name of the list_head within the struct.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  827   *
768f3591e2b1cc Pavel Emelyanov          2007-09-18  828   * Start to iterate over list of given type backwards, continuing after
768f3591e2b1cc Pavel Emelyanov          2007-09-18  829   * the current position.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  830   */
768f3591e2b1cc Pavel Emelyanov          2007-09-18  831  #define list_for_each_entry_continue_reverse(pos, head, member)		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  832  	for (pos = list_prev_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  833  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  834  	     pos = list_prev_entry(pos, member))
768f3591e2b1cc Pavel Emelyanov          2007-09-18  835  
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  836  /**
fe96e57d77481c Randy Dunlap             2006-06-25  837   * list_for_each_entry_from - iterate over list of given type from the current point
8e3a67a99231f9 Randy Dunlap             2006-06-25  838   * @pos:	the type * to use as a loop cursor.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  839   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  840   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  841   *
fe96e57d77481c Randy Dunlap             2006-06-25  842   * Iterate over list of given type, continuing from current position.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  843   */
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  844  #define list_for_each_entry_from(pos, head, member) 			\
e130816164e244 Andy Shevchenko          2020-10-15  845  	for (; !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  846  	     pos = list_next_entry(pos, member))
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  847  
b862815c3ee7b4 Jiri Pirko               2017-02-03  848  /**
b862815c3ee7b4 Jiri Pirko               2017-02-03  849   * list_for_each_entry_from_reverse - iterate backwards over list of given type
b862815c3ee7b4 Jiri Pirko               2017-02-03  850   *                                    from the current point
b862815c3ee7b4 Jiri Pirko               2017-02-03  851   * @pos:	the type * to use as a loop cursor.
b862815c3ee7b4 Jiri Pirko               2017-02-03  852   * @head:	the head for your list.
b862815c3ee7b4 Jiri Pirko               2017-02-03  853   * @member:	the name of the list_head within the struct.
b862815c3ee7b4 Jiri Pirko               2017-02-03  854   *
b862815c3ee7b4 Jiri Pirko               2017-02-03  855   * Iterate backwards over list of given type, continuing from current position.
b862815c3ee7b4 Jiri Pirko               2017-02-03  856   */
b862815c3ee7b4 Jiri Pirko               2017-02-03  857  #define list_for_each_entry_from_reverse(pos, head, member)		\
e130816164e244 Andy Shevchenko          2020-10-15  858  	for (; !list_entry_is_head(pos, head, member);			\
b862815c3ee7b4 Jiri Pirko               2017-02-03  859  	     pos = list_prev_entry(pos, member))
b862815c3ee7b4 Jiri Pirko               2017-02-03  860  
^1da177e4c3f41 Linus Torvalds           2005-04-16  861  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  862   * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
8e3a67a99231f9 Randy Dunlap             2006-06-25  863   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  864   * @n:		another type * to use as temporary storage
^1da177e4c3f41 Linus Torvalds           2005-04-16  865   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  866   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  867   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  868  #define list_for_each_entry_safe(pos, n, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12 @869  	for (pos = list_first_entry(head, typeof(*pos), member),	\
8120e2e5141a42 Oleg Nesterov            2013-11-12  870  		n = list_next_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  871  	     !list_entry_is_head(pos, head, member); 			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  872  	     pos = n, n = list_next_entry(n, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  873  

:::::: The code at line 869 was first introduced by commit
:::::: 93be3c2eb3371f022ad88acf1ab6bee8e3c38378 list: introduce list_last_entry(), use list_{first,last}_entry()

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
