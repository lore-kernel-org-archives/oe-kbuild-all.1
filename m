Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1133D6EF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575950; cv=none; b=Z7RT7Vc4zZeF5XFYX8X3YPw9CRzU2GIdnyneOoFkSmvsMu8zpwezWgqDJBxiudSTkydFlWlr9r4eWw8MKrBtPOT2Dh87aRRdhzRn+hcSow61cZXiPG35x31PvrfpBbDvpMLJEPDWyxU0CTlxbtekcTH5j0BRQ+JPYB0QHOsxsEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575950; c=relaxed/simple;
	bh=6kMFnbySAzU7KpVZfLBmNvKKAF83/JCwFqhLH4CRc4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ibJ3gZx6q99cwBaMdKPBIJ4ZPqcpbQ6dPt4xlohodl4QhzLlJui1mEgWUWjMKnlOKvAszmCv4Qf1sAJGqEkBwIWDH66DdRWjFUCZ2DS4B+EsqwcG3AGiZw1+ywIXxuJBLB8NfggXDxAkpZ+JgmNwoIEfJCHgeJNOmjYyzyb3W38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCS/3Ydr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCS/3Ydr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775575940; x=1807111940;
  h=date:from:to:cc:subject:message-id;
  bh=6kMFnbySAzU7KpVZfLBmNvKKAF83/JCwFqhLH4CRc4Q=;
  b=XCS/3Ydrilv3P5b/eIpoMVPe1n/fiyOXhbj4Yze98FFPtgqZZ271PWxn
   29mxTJIGhM1UYwMMC6TLDgKud1q3F040WwY8wnUIvcJfeRkWvhr6cGzLE
   T87dDeDkjYJFpX6+NiHXGRBRhAhoeXhXDZLy3CwEwYQir0F+PsZRUCkvN
   xKfhcgV6AzIsieUYDqlk9aysNDO5Kz6D0d/4Cz2PNVSiUQWAb8Zk5YbGa
   Jjsm9Vt1zmwAQVzrOAzFsFeJJp9pZXfX6698g/GsGcki6XB1mCmRzOGle
   R4E047wjMZmyssx+6EAx/4ApHi3mG6XHgcxv6ql1BIU5uanM+0j5gi5iC
   Q==;
X-CSE-ConnectionGUID: St3WZnlrQuO2QdRnwNC5gA==
X-CSE-MsgGUID: 70X+IGUUSbOyx/C703rs9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76555821"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76555821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:32:19 -0700
X-CSE-ConnectionGUID: VLsJnc71SZWJm2eE/prfuQ==
X-CSE-MsgGUID: 4l911y4USeauW1E6dtC5xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223900030"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2026 08:32:18 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA8PX-000000000kT-1yCl;
	Tue, 07 Apr 2026 15:32:15 +0000
Date: Tue, 07 Apr 2026 23:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dakr:devres/stage 10/10]
 arch/sh/drivers/platform_early.c:129:38: error: '(struct list_head
 *)&dev->devres_head' is a pointer; did you mean to use '->'?
Message-ID: <202604072306.5awLfMU7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git devres/stage
head:   784ac2ed774f170efd1045b65df30bdd0cc4bb2b
commit: 784ac2ed774f170efd1045b65df30bdd0cc4bb2b [10/10] wip: devres stage rework
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260407/202604072306.5awLfMU7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072306.5awLfMU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072306.5awLfMU7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sh/drivers/platform_early.c: In function 'sh_early_platform_add_devices':
>> arch/sh/drivers/platform_early.c:129:38: error: '(struct list_head *)&dev->devres_head' is a pointer; did you mean to use '->'?
     129 |                 if (!dev->devres_head.next) {
         |                                      ^
         |                                      ->
>> arch/sh/drivers/platform_early.c:131:40: error: passing argument 1 of 'INIT_LIST_HEAD' from incompatible pointer type [-Wincompatible-pointer-types]
     131 |                         INIT_LIST_HEAD(&dev->devres_head);
         |                                        ^~~~~~~~~~~~~~~~~
         |                                        |
         |                                        struct list_head (*)[2]
   In file included from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from arch/sh/include/asm/platform_early.h:7,
                    from arch/sh/drivers/platform_early.c:3:
   include/linux/list.h:43:53: note: expected 'struct list_head *' but argument is of type 'struct list_head (*)[2]'
      43 | static inline void INIT_LIST_HEAD(struct list_head *list)
         |                                   ~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/drivers/platform_early.c:132:39: error: passing argument 1 of 'list_add_tail' from incompatible pointer type [-Wincompatible-pointer-types]
     132 |                         list_add_tail(&dev->devres_head,
         |                                       ^~~~~~~~~~~~~~~~~
         |                                       |
         |                                       struct list_head (*)[2]
   include/linux/list.h:189:52: note: expected 'struct list_head *' but argument is of type 'struct list_head (*)[2]'
     189 | static inline void list_add_tail(struct list_head *new, struct list_head *head)
         |                                  ~~~~~~~~~~~~~~~~~~^~~
   In file included from include/linux/bits.h:30,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5:
   arch/sh/drivers/platform_early.c: In function 'sh_early_platform_match':
   include/linux/build_bug.h:80:41: error: static assertion failed: "pointer type mismatch in container_of()"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:175:9: note: in expansion of macro 'list_for_each_entry'
     175 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:773:22: error: passing argument 1 of 'list_is_head' from incompatible pointer type [-Wincompatible-pointer-types]
     773 |         list_is_head(&pos->member, (head))
   include/linux/list.h:783:15: note: in expansion of macro 'list_entry_is_head'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:175:9: note: in expansion of macro 'list_for_each_entry'
     175 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:370:56: note: expected 'const struct list_head *' but argument is of type 'struct list_head (*)[2]'
     370 | static inline int list_is_head(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/llist.h:52,
                    from include/linux/smp_types.h:5,
                    from include/linux/sched.h:20:
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:175:9: note: in expansion of macro 'list_for_each_entry'
     175 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:175:9: note: in expansion of macro 'list_for_each_entry'
     175 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:175:9: note: in expansion of macro 'list_for_each_entry'
     175 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:175:9: note: in expansion of macro 'list_for_each_entry'
     175 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c: In function 'sh_early_platform_left':
   include/linux/build_bug.h:80:41: error: static assertion failed: "pointer type mismatch in container_of()"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:193:9: note: in expansion of macro 'list_for_each_entry'
     193 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:773:22: error: passing argument 1 of 'list_is_head' from incompatible pointer type [-Wincompatible-pointer-types]
     773 |         list_is_head(&pos->member, (head))
   include/linux/list.h:783:15: note: in expansion of macro 'list_entry_is_head'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:193:9: note: in expansion of macro 'list_for_each_entry'
     193 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:370:56: note: expected 'const struct list_head *' but argument is of type 'struct list_head (*)[2]'
     370 | static inline int list_is_head(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:193:9: note: in expansion of macro 'list_for_each_entry'
     193 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:193:9: note: in expansion of macro 'list_for_each_entry'
     193 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:193:9: note: in expansion of macro 'list_for_each_entry'
     193 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:193:9: note: in expansion of macro 'list_for_each_entry'
     193 |         list_for_each_entry(pd, &sh_early_platform_device_list, dev.devres_head)
         |         ^~~~~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c: In function 'early_platform_cleanup':
   include/linux/build_bug.h:80:41: error: static assertion failed: "pointer type mismatch in container_of()"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:869:20: note: in expansion of macro 'list_first_entry'
     869 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                    ^~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:870:21: note: in expansion of macro 'list_next_entry'
     870 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
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
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:773:22: error: passing argument 1 of 'list_is_head' from incompatible pointer type [-Wincompatible-pointer-types]
     773 |         list_is_head(&pos->member, (head))
   include/linux/list.h:871:15: note: in expansion of macro 'list_entry_is_head'
     871 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:370:56: note: expected 'const struct list_head *' but argument is of type 'struct list_head (*)[2]'
     370 | static inline int list_is_head(const struct list_head *list, const struct list_head *head)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd2->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:872:27: note: in expansion of macro 'list_next_entry'
     872 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd2->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:667:33: error: '(struct list_head *)&pd2->dev.devres_head' is a pointer; did you mean to use '->'?
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                 ^
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:22:23: note: in expansion of macro '__same_type'
      22 |                       __same_type(*(ptr), void),                        \
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
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   arch/sh/drivers/platform_early.c:331:9: note: in expansion of macro 'list_for_each_entry_safe'
     331 |         list_for_each_entry_safe(pd, pd2, &sh_early_platform_device_list,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sh/drivers/platform_early.c:333:26: error: passing argument 1 of 'list_del' from incompatible pointer type [-Wincompatible-pointer-types]
     333 |                 list_del(&pd->dev.devres_head);
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          |
         |                          struct list_head (*)[2]
   include/linux/list.h:235:47: note: expected 'struct list_head *' but argument is of type 'struct list_head (*)[2]'
     235 | static inline void list_del(struct list_head *entry)
         |                             ~~~~~~~~~~~~~~~~~~^~~~~


vim +129 arch/sh/drivers/platform_early.c

507fd01d5333338 Bartosz Golaszewski 2019-10-03  111  
507fd01d5333338 Bartosz Golaszewski 2019-10-03  112  /**
201e91091b1d470 Bartosz Golaszewski 2019-10-03  113   * sh_early_platform_add_devices - adds a number of early platform devices
507fd01d5333338 Bartosz Golaszewski 2019-10-03  114   * @devs: array of early platform devices to add
507fd01d5333338 Bartosz Golaszewski 2019-10-03  115   * @num: number of early platform devices in array
507fd01d5333338 Bartosz Golaszewski 2019-10-03  116   *
507fd01d5333338 Bartosz Golaszewski 2019-10-03  117   * Used by early architecture code to register early platform devices and
507fd01d5333338 Bartosz Golaszewski 2019-10-03  118   * their platform data.
507fd01d5333338 Bartosz Golaszewski 2019-10-03  119   */
201e91091b1d470 Bartosz Golaszewski 2019-10-03  120  void __init sh_early_platform_add_devices(struct platform_device **devs, int num)
507fd01d5333338 Bartosz Golaszewski 2019-10-03  121  {
507fd01d5333338 Bartosz Golaszewski 2019-10-03  122  	struct device *dev;
507fd01d5333338 Bartosz Golaszewski 2019-10-03  123  	int i;
507fd01d5333338 Bartosz Golaszewski 2019-10-03  124  
507fd01d5333338 Bartosz Golaszewski 2019-10-03  125  	/* simply add the devices to list */
507fd01d5333338 Bartosz Golaszewski 2019-10-03  126  	for (i = 0; i < num; i++) {
507fd01d5333338 Bartosz Golaszewski 2019-10-03  127  		dev = &devs[i]->dev;
507fd01d5333338 Bartosz Golaszewski 2019-10-03  128  
507fd01d5333338 Bartosz Golaszewski 2019-10-03 @129  		if (!dev->devres_head.next) {
507fd01d5333338 Bartosz Golaszewski 2019-10-03  130  			pm_runtime_early_init(dev);
507fd01d5333338 Bartosz Golaszewski 2019-10-03 @131  			INIT_LIST_HEAD(&dev->devres_head);
507fd01d5333338 Bartosz Golaszewski 2019-10-03 @132  			list_add_tail(&dev->devres_head,
201e91091b1d470 Bartosz Golaszewski 2019-10-03  133  				      &sh_early_platform_device_list);
507fd01d5333338 Bartosz Golaszewski 2019-10-03  134  		}
507fd01d5333338 Bartosz Golaszewski 2019-10-03  135  	}
507fd01d5333338 Bartosz Golaszewski 2019-10-03  136  }
507fd01d5333338 Bartosz Golaszewski 2019-10-03  137  

:::::: The code at line 129 was first introduced by commit
:::::: 507fd01d5333338753a1cc26322dfc9f856c109f drivers: move the early platform device support to arch/sh

:::::: TO: Bartosz Golaszewski <bgolaszewski@baylibre.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
