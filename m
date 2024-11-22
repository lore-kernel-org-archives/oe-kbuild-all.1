Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1DE1DFD87
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 19:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732303692; cv=none; b=h2eg4gj1GB/CaBpAgvhgoYZK3puWWMGksoHMhfu6RmTR3ZAEvbkjljvyauoYVNN9QREk7lOzkMpZ485nW2UupcoJrBBGOR9Jiz97M3dOTWdb1CUlpzWsPe73R1uMHkP4xFKo6ZsauLZ1eRlAiucNZva2r1C1NEHEvchw/7m5HD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732303692; c=relaxed/simple;
	bh=4qJ7sIaTTQhAUrFmSlHD5m7AHb3PBOcSEHeDlzCuars=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=St7fL7nF4eU6cfSLazDDQICOer6p/jAnwsehExjjAJYid4E6+SLbLKcONCnefz3l++xCSx39k8dwzHIJVMHe5rc6GfAgjxVJVpNca/Q5ySQk7hCbO+9R/hYGk+sZ9p1C4scK/pjLDuy+722Q0azGKkIk9xuDFNGDu2XJKmevqHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8ILuaZm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8ILuaZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732303690; x=1763839690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4qJ7sIaTTQhAUrFmSlHD5m7AHb3PBOcSEHeDlzCuars=;
  b=j8ILuaZmE8mMIWxMaVy42Nu9Z/bwPpxwfXeOeSCeJ/SOl1P96D97RG4W
   IbdGUoycckJpOVgMzFNvuoNTsvxT1mZzOV4soiGvhWP9nz/Gzn3N0e153
   Hx4EhiLzhOEx/xMpqw8RrirY4KJNZaPLamRVrXQI5jVg0OXp8sFJHdsJ8
   YX3rdPqdtaQnLpioYuzovL/uRdzx2icO/onL7zL8FP3ZLxo3EdCzu/yAT
   8svqJQxF/GZ3My6iFtTzAnj5erJ0JVWvqh/LemL3VhGc86u1/CF4dtoSa
   c3TwUru3sofNqZdUcbB3zp/tkEGG6yxElnwwxK7u540pFKFfzSAF8mO0N
   Q==;
X-CSE-ConnectionGUID: xRj8DssxQwOmLRA5f2CXrA==
X-CSE-MsgGUID: bgZAlHywRTiG7pdzimO0Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32408268"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32408268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 11:28:06 -0800
X-CSE-ConnectionGUID: W9wp6A3jSGKLR6DabkykiQ==
X-CSE-MsgGUID: JyZW6KPIQF2CNP7+9Vg1kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="121615991"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2024 11:28:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEZJz-0004AO-05;
	Fri, 22 Nov 2024 19:28:03 +0000
Date: Sat, 23 Nov 2024 03:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-s390x 11/11]
 include/linux/container_of.h:20:54: error: invalid use of undefined type
 'struct vmcore_mem_node'
Message-ID: <202411230329.lLzTjEF9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-s390x
head:   b7d49c2309397709ff11a8a28f1de6a6a226e446
commit: 972500a8a77a5ce566464b024c2116cce168d4ca [11/11] s390/kdump: virtio-mem kdump support (CONFIG_PROC_VMCORE_DEVICE_RAM)
config: s390-debug_defconfig (https://download.01.org/0day-ci/archive/20241123/202411230329.lLzTjEF9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230329.lLzTjEF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230329.lLzTjEF9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from fs/proc/vmcore.c:11:
   fs/proc/vmcore.c: In function 'vmcore_add_device_ram_elf64':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/s390/include/asm/rwonce.h:29,
                    from include/linux/compiler.h:317,
                    from arch/s390/include/asm/bug.h:5:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
>> include/linux/list.h:769:26: error: invalid use of undefined type 'struct vmcore_mem_node'
     769 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:779:15: note: in expansion of macro 'list_entry_is_head'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/list.h:5:
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1610:9: note: in expansion of macro 'list_for_each_entry'
    1610 |         list_for_each_entry(cur, list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> fs/proc/vmcore.c:1611:45: error: invalid use of undefined type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                             ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1611:31: note: in expansion of macro 'IS_ALIGNED'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                               ^~~~~~~~~~
   fs/proc/vmcore.c:1611:58: error: invalid use of undefined type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                                          ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1611:31: note: in expansion of macro 'IS_ALIGNED'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                               ^~~~~~~~~~
>> fs/proc/vmcore.c:1611:45: error: invalid use of undefined type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                             ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1611:31: note: in expansion of macro 'IS_ALIGNED'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                               ^~~~~~~~~~
   fs/proc/vmcore.c:1611:58: error: invalid use of undefined type 'struct vmcore_mem_node'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                                                          ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   fs/proc/vmcore.c:1611:31: note: in expansion of macro 'IS_ALIGNED'
    1611 |                 WARN_ON_ONCE(!IS_ALIGNED(cur->paddr | cur->size, PAGE_SIZE));
         |                               ^~~~~~~~~~
   fs/proc/vmcore.c:1612:66: error: invalid use of undefined type 'struct vmcore_mem_node'
    1612 |                 elfcorehdr_fill_device_ram_ptload_elf64(phdr, cur->paddr, cur->size);
         |                                                                  ^~
   fs/proc/vmcore.c:1612:78: error: invalid use of undefined type 'struct vmcore_mem_node'
    1612 |                 elfcorehdr_fill_device_ram_ptload_elf64(phdr, cur->paddr, cur->size);
         |                                                                              ^~
   fs/proc/vmcore.c: In function 'vmcore_process_device_ram':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1656:17: note: in expansion of macro 'list_first_entry'
    1656 |         first = list_first_entry(&list, struct vmcore_mem_node, list);
         |                 ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   fs/proc/vmcore.c:1656:17: note: in expansion of macro 'list_first_entry'
    1656 |         first = list_first_entry(&list, struct vmcore_mem_node, list);
         |                 ^~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1656:17: note: in expansion of macro 'list_first_entry'
    1656 |         first = list_first_entry(&list, struct vmcore_mem_node, list);
         |                 ^~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:769:26: error: invalid use of undefined type 'struct vmcore_mem_node'
     769 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:779:15: note: in expansion of macro 'list_entry_is_head'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct vmcore_mem_node'
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
   fs/proc/vmcore.c:1657:9: note: in expansion of macro 'list_for_each_entry'
    1657 |         list_for_each_entry(m, &vmcore_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   fs/proc/vmcore.c:1658:45: error: invalid use of undefined type 'struct vmcore_mem_node'
    1658 |                 unsigned long long m_end = m->paddr + m->size;
         |                                             ^~
   fs/proc/vmcore.c:1658:56: error: invalid use of undefined type 'struct vmcore_mem_node'
    1658 |                 unsigned long long m_end = m->paddr + m->size;
         |                                                        ^~
   fs/proc/vmcore.c:1659:53: error: invalid use of undefined type 'struct vmcore_mem_node'
    1659 |                 unsigned long long first_end = first->paddr + first->size;
         |                                                     ^~
   fs/proc/vmcore.c:1659:68: error: invalid use of undefined type 'struct vmcore_mem_node'
    1659 |                 unsigned long long first_end = first->paddr + first->size;
         |                                                                    ^~
   fs/proc/vmcore.c:1661:26: error: invalid use of undefined type 'struct vmcore_mem_node'
    1661 |                 if (first->paddr < m_end && m->paddr < first_end)
         |                          ^~
   fs/proc/vmcore.c:1661:46: error: invalid use of undefined type 'struct vmcore_mem_node'
    1661 |                 if (first->paddr < m_end && m->paddr < first_end)
         |                                              ^~
>> fs/proc/vmcore.c:1669:9: error: implicit declaration of function 'vmcore_free_mem_nodes'; did you mean 'vmcore_free_ranges'? [-Wimplicit-function-declaration]
    1669 |         vmcore_free_mem_nodes(&list);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         vmcore_free_ranges


vim +20 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  

:::::: The code at line 20 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
