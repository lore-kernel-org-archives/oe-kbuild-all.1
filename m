Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168581741F0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 10:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721903177; cv=none; b=WHWVLmBBQKOnLolb/gIwbKwGKe2m+j668Fn6RdpYm9MO+lqYhcvHej+zS2APMMs4FfV/wFjDSs2kWIajhzHfkng+1SgxKNWhoYa0o4w6r7L7XZSp+LSNaQkWPI/H/Iapp2Wo162tkist/NwsiXeQBCk+wElN9FFgW6MF0NizRyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721903177; c=relaxed/simple;
	bh=WrJ17pF5LB1yioCZVeH3rGwdQh8HF//TdFVFAHk0cNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcFoS6ZU883YNOI1p0VRnJKrUhzNXcCiiiTByb2H6YETDMc26IGi7Dr6l3e+rF0+aO1o9psgQTRLcCQyZfCWYGGfCOgrr114w0QauK3H8C7Ht3hCz7jlKdMUzTlNc6cBj5sN2cQkCUE0Iax3JHwI86N2phfe3q6Kz0iH+msYRbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpUT+Hrb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpUT+Hrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721903174; x=1753439174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrJ17pF5LB1yioCZVeH3rGwdQh8HF//TdFVFAHk0cNQ=;
  b=bpUT+HrblMLt+6tnaHA4S52szaA6hGl9hPaH47s8ufX+ZW1t2EHO2f3m
   Xt4EnLZ91rdvc9uovPGXcGceKAcDDrEea47XsW3WFtyjbXt5g5NF/CNof
   NEf+npYrrEk1a3brl/KkF1RCR9C7nRYgw4/LJ1RdxlXRh2JifZZneT+vI
   /tqXpBeiw3o0/FxqUquTlWhNzni414aJU+QsE1T2Vvi3yHs7ZXXVUl4hr
   txnJqVroxNBMGpuhOmCtf9le/O4PZGsy7Tv0koYcdeGhRuXyXNeBiAH6S
   jZoRDQqWj+TyLfrFmbKBtfnYf5N7tfHcD1Od7eOYFQR/ZWzvSNE/gYnXD
   g==;
X-CSE-ConnectionGUID: bDYb+GNuTvy8KSB5guwiFg==
X-CSE-MsgGUID: BcWj78uwStqtZp44Nwz6Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31048459"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="31048459"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 03:26:03 -0700
X-CSE-ConnectionGUID: wFkvosh7TA2Ynl61ltWW0Q==
X-CSE-MsgGUID: imCx832BTRqMRcSqj011nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="76092071"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jul 2024 03:26:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWvfa-000o0u-2H;
	Thu, 25 Jul 2024 10:25:58 +0000
Date: Thu, 25 Jul 2024 18:25:01 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [linux-next:master 13686/13827]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:26: error: implicit
 declaration of function 'svm_range_from_addr'
Message-ID: <202407251843.5OnBTq8o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   864b1099d16fc7e332c3ad7823058c65f890486c
commit: b049504e211e8f4dbcd40434f2dcab2215ea1039 [13686/13827] drm/amdkfd: Validate user queue svm memory residency
config: arm64-buildonly-randconfig-r003-20221114 (https://download.01.org/0day-ci/archive/20240725/202407251843.5OnBTq8o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407251843.5OnBTq8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407251843.5OnBTq8o-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c: In function 'kfd_queue_buffer_svm_get':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:26: error: implicit declaration of function 'svm_range_from_addr' [-Werror=implicit-function-declaration]
     107 |                 prange = svm_range_from_addr(&p->svms, addr, NULL);
         |                          ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:107:24: warning: assignment to 'struct svm_range *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     107 |                 prange = svm_range_from_addr(&p->svms, addr, NULL);
         |                        ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:111:28: error: invalid use of undefined type 'struct svm_range'
     111 |                 if (!prange->mapped_to_gpu)
         |                            ^~
   In file included from arch/arm64/include/asm/cache.h:40,
                    from include/linux/cache.h:6,
                    from include/linux/slab.h:15,
                    from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:25:
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:45: error: invalid use of undefined type 'struct svm_range'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                                             ^~
   include/linux/bitops.h:48:39: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:117:22: note: in expansion of macro 'test_bit'
     117 |                 if (!test_bit(gpuidx, prange->bitmap_access) &&
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:45: error: invalid use of undefined type 'struct svm_range'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                                             ^~
   include/linux/bitops.h:48:39: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:118:22: note: in expansion of macro 'test_bit'
     118 |                     !test_bit(gpuidx, prange->bitmap_aip))
         |                      ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:121:29: error: invalid use of undefined type 'struct svm_range'
     121 |                 if (!(prange->flags & KFD_IOCTL_SVM_FLAG_GPU_ALWAYS_MAPPED))
         |                             ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:124:33: error: invalid use of undefined type 'struct svm_range'
     124 |                 list_add(&prange->update_list, &update_list);
         |                                 ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:126:27: error: invalid use of undefined type 'struct svm_range'
     126 |                 if (prange->last - prange->start + 1 >= size) {
         |                           ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:126:42: error: invalid use of undefined type 'struct svm_range'
     126 |                 if (prange->last - prange->start + 1 >= size) {
         |                                          ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:131:31: error: invalid use of undefined type 'struct svm_range'
     131 |                 size -= prange->last - prange->start + 1;
         |                               ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:131:46: error: invalid use of undefined type 'struct svm_range'
     131 |                 size -= prange->last - prange->start + 1;
         |                                              ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:132:31: error: invalid use of undefined type 'struct svm_range'
     132 |                 addr += prange->last - prange->start + 1;
         |                               ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:132:46: error: invalid use of undefined type 'struct svm_range'
     132 |                 addr += prange->last - prange->start + 1;
         |                                              ^~
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6:
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
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
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/uapi/linux/sysinfo.h:5,
                    from include/uapi/linux/kernel.h:5,
                    from include/linux/cache.h:5:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/smp.h:12,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16:
>> include/linux/list.h:769:26: error: invalid use of undefined type 'struct svm_range'
     769 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:779:15: note: in expansion of macro 'list_entry_is_head'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:22,
                    from arch/arm64/include/asm/cpufeature.h:26,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59:
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
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
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:139:9: note: in expansion of macro 'list_for_each_entry'
     139 |         list_for_each_entry(prange, &update_list, update_list)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:140:35: error: invalid use of undefined type 'struct svm_range'
     140 |                 atomic_inc(&prange->queue_refcount);
         |                                   ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c: In function 'kfd_queue_buffer_svm_put':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:165:26: note: in expansion of macro 'container_of'
     165 |                 prange = container_of(node, struct svm_range, it_node);
         |                          ^~~~~~~~~~~~
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:165:26: note: in expansion of macro 'container_of'
     165 |                 prange = container_of(node, struct svm_range, it_node);
         |                          ^~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct svm_range'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:165:26: note: in expansion of macro 'container_of'
     165 |                 prange = container_of(node, struct svm_range, it_node);
         |                          ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:169:46: error: invalid use of undefined type 'struct svm_range'
     169 |                 if (atomic_add_unless(&prange->queue_refcount, -1, 0)) {
         |                                              ^~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:60: error: invalid use of undefined type 'struct svm_range'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                                                            ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:60: error: invalid use of undefined type 'struct svm_range'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                                                            ^~
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:60: error: invalid use of undefined type 'struct svm_range'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                                                            ^~
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
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
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:769:26: error: invalid use of undefined type 'struct svm_range'
     769 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:779:15: note: in expansion of macro 'list_entry_is_head'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:60: error: invalid use of undefined type 'struct svm_range'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                                                            ^~
   include/linux/list.h:769:37: note: in definition of macro 'list_entry_is_head'
     769 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
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
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct svm_range'
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
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:170:25: note: in expansion of macro 'list_for_each_entry'
     170 |                         list_for_each_entry(pchild, &prange->child_list, child_list)
         |                         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c:171:58: error: invalid use of undefined type 'struct svm_range'
     171 |                                 atomic_add_unless(&pchild->queue_refcount, -1, 0);
         |                                                          ^~
   cc1: some warnings being treated as errors


vim +/svm_range_from_addr +107 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_queue.c

    86	
    87	static int kfd_queue_buffer_svm_get(struct kfd_process_device *pdd, u64 addr, u64 size)
    88	{
    89		struct kfd_process *p = pdd->process;
    90		struct list_head update_list;
    91		struct svm_range *prange;
    92		int ret = -EINVAL;
    93	
    94		INIT_LIST_HEAD(&update_list);
    95		addr >>= PAGE_SHIFT;
    96		size >>= PAGE_SHIFT;
    97	
    98		mutex_lock(&p->svms.lock);
    99	
   100		/*
   101		 * range may split to multiple svm pranges aligned to granularity boundaery.
   102		 */
   103		while (size) {
   104			uint32_t gpuid, gpuidx;
   105			int r;
   106	
 > 107			prange = svm_range_from_addr(&p->svms, addr, NULL);
   108			if (!prange)
   109				break;
   110	
 > 111			if (!prange->mapped_to_gpu)
   112				break;
   113	
   114			r = kfd_process_gpuid_from_node(p, pdd->dev, &gpuid, &gpuidx);
   115			if (r < 0)
   116				break;
   117			if (!test_bit(gpuidx, prange->bitmap_access) &&
   118			    !test_bit(gpuidx, prange->bitmap_aip))
   119				break;
   120	
   121			if (!(prange->flags & KFD_IOCTL_SVM_FLAG_GPU_ALWAYS_MAPPED))
   122				break;
   123	
   124			list_add(&prange->update_list, &update_list);
   125	
   126			if (prange->last - prange->start + 1 >= size) {
   127				size = 0;
   128				break;
   129			}
   130	
   131			size -= prange->last - prange->start + 1;
   132			addr += prange->last - prange->start + 1;
   133		}
   134		if (size) {
   135			pr_debug("[0x%llx 0x%llx] not registered\n", addr, addr + size - 1);
   136			goto out_unlock;
   137		}
   138	
   139		list_for_each_entry(prange, &update_list, update_list)
   140			atomic_inc(&prange->queue_refcount);
   141		ret = 0;
   142	
   143	out_unlock:
   144		mutex_unlock(&p->svms.lock);
   145		return ret;
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
