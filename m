Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE8354AEB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343333; cv=none; b=IXWhZIevCVNZoVrx+SmDyjE83PiTtxFdkCmQ6mMeorq5R57K7cOfm5POwHb7t3JQPQnSvjFi7VCd5AZtGmKNOx+ASIMQ9m9hsqAOQR5mXcGQJAH5Gn022EJ0npDhFroe3A2F1hROob1m121GZJXSVtTn39LWyVe0GrjcGJcmEgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343333; c=relaxed/simple;
	bh=TlKVIYi8ZLQRb/vk9OhoGwGI/T0hIev8gPdWQ7xhIf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/cFVYVcOeqV1bXcO5q+dlLuFUCQrqOGzpc13rxYsAGU1q0LxZ1NGoZNIQLf7iMGq0f0Kw84aDahRLAe/fIk0sjr7QSaI3tb5srmg5b2z2T5dwgXTAn9IijL+8Ad8CS1SFZwwM6Xxqtqym4f1RxcFyc5JGvBgODgSkyahBVZFOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSEGst3y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSEGst3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768343332; x=1799879332;
  h=date:from:to:cc:subject:message-id;
  bh=TlKVIYi8ZLQRb/vk9OhoGwGI/T0hIev8gPdWQ7xhIf8=;
  b=YSEGst3yrhy1wPhnaaC9M4a4QZf5Ov2t98WrVPbtvItbSbIZJOKU279n
   LOxl1epVCZ1nT5pljqsar5ndcMHwO+SYDm61uWPb0PWYxF+3nPf5nH9GV
   L4/zAz4Nf6jnkJsNlIfmk7jP4jtQpceSvcoX9ho/039m1SdrmZuvsVNG7
   T4heHo6+FORJhqbBSa26MAFrIVEy9dk1tXLa9BQsl6Q3b5R8WpQQm547P
   vVhdVukuK5E4M4B34oSOZT16Dn1G/SOKwKMKQaDSm+yplfZV7yjQJfBTv
   rNkPbJnKTovjUAswHObj6E1/Ve+6Qsmw8CfGpAPJlAHDA4gVSDChW/LUC
   Q==;
X-CSE-ConnectionGUID: m7XobH9HReamccM2IyFFVA==
X-CSE-MsgGUID: upO4tD6PT7yAKtrp7v4ozQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69692522"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69692522"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 14:28:51 -0800
X-CSE-ConnectionGUID: 53aYPuROTNioC48JuXPX2w==
X-CSE-MsgGUID: Vlb2fFS4Q/GNLdYVUa4TWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="208967260"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jan 2026 14:28:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfmsZ-00000000FS4-2D3F;
	Tue, 13 Jan 2026 22:28:47 +0000
Date: Wed, 14 Jan 2026 06:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 0/1]
 include/linux/container_of.h:21:54: error: invalid use of undefined type
 'struct iommu_mm_data'
Message-ID: <202601140658.JaOQ7Wkq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   323cc859aea557315d2b8dc9ab0fafdb6a0d0ca7
commit: 82d9be76e213a0fb22f8f20586b020b6a91a5c01 [0/1] Merge 7203ca412fc8 ("Merge tag 'mm-stable-2025-12-03-21-26' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm") into android-mainline
config: x86_64-randconfig-014-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140658.JaOQ7Wkq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140658.JaOQ7Wkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140658.JaOQ7Wkq-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:117:9: note: in expansion of macro 'list_for_each_entry'
     117 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:8,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17:
   drivers/iommu/iommu-sva.c:117:50: error: invalid use of undefined type 'struct iommu_mm_data'
     117 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                                  ^~
   include/linux/list.h:773:37: note: in definition of macro 'list_entry_is_head'
     773 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/iommu/iommu-sva.c:117:9: note: in expansion of macro 'list_for_each_entry'
     117 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:118:70: error: invalid use of undefined type 'struct iommu_mm_data'
     118 |                 ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
         |                                                                      ^~
   drivers/iommu/iommu-sva.c:119:56: error: invalid use of undefined type 'struct iommu_sva'
     119 |                                                 &handle->handle);
         |                                                        ^~
   drivers/iommu/iommu-sva.c:133:62: error: invalid use of undefined type 'struct iommu_mm_data'
     133 |         ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
         |                                                              ^~
   drivers/iommu/iommu-sva.c:134:48: error: invalid use of undefined type 'struct iommu_sva'
     134 |                                         &handle->handle);
         |                                                ^~
   drivers/iommu/iommu-sva.c:139:33: error: invalid use of undefined type 'struct iommu_mm_data'
     139 |         if (list_empty(&iommu_mm->sva_domains)) {
         |                                 ^~
   drivers/iommu/iommu-sva.c:142:35: error: invalid use of undefined type 'struct iommu_mm_data'
     142 |                 list_add(&iommu_mm->mm_list_elm, &iommu_sva_mms);
         |                                   ^~
   drivers/iommu/iommu-sva.c:144:42: error: invalid use of undefined type 'struct iommu_mm_data'
     144 |         list_add(&domain->next, &iommu_mm->sva_domains);
         |                                          ^~
   drivers/iommu/iommu-sva.c:146:29: error: invalid use of undefined type 'struct iommu_sva'
     146 |         refcount_set(&handle->users, 1);
         |                             ^~
   drivers/iommu/iommu-sva.c:148:15: error: invalid use of undefined type 'struct iommu_sva'
     148 |         handle->dev = dev;
         |               ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_unbind_device':
   drivers/iommu/iommu-sva.c:171:45: error: invalid use of undefined type 'struct iommu_sva'
     171 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c:173:36: error: invalid use of undefined type 'struct iommu_sva'
     173 |         struct device *dev = handle->dev;
         |                                    ^~
   drivers/iommu/iommu-sva.c:176:43: error: invalid use of undefined type 'struct iommu_sva'
     176 |         if (!refcount_dec_and_test(&handle->users)) {
         |                                           ^~
   drivers/iommu/iommu-sva.c:181:56: error: invalid use of undefined type 'struct iommu_mm_data'
     181 |         iommu_detach_device_pasid(domain, dev, iommu_mm->pasid);
         |                                                        ^~
   drivers/iommu/iommu-sva.c:187:33: error: invalid use of undefined type 'struct iommu_mm_data'
     187 |         if (list_empty(&iommu_mm->sva_domains)) {
         |                                 ^~
   drivers/iommu/iommu-sva.c:188:35: error: invalid use of undefined type 'struct iommu_mm_data'
     188 |                 list_del(&iommu_mm->mm_list_elm);
         |                                   ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_get_pasid':
   drivers/iommu/iommu-sva.c:200:45: error: invalid use of undefined type 'struct iommu_sva'
     200 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c: In function 'mm_pasid_drop':
   drivers/iommu/iommu-sva.c:213:41: error: invalid use of undefined type 'struct iommu_mm_data'
     213 |         iommu_free_global_pasid(iommu_mm->pasid);
         |                                         ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_handle_iopf':
   drivers/iommu/iommu-sva.c:290:66: error: invalid use of undefined type 'struct iommu_attach_handle'
     290 |                                              group->attach_handle->domain->mm);
         |                                                                  ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_iopf_handler':
   drivers/iommu/iommu-sva.c:302:36: error: 'struct iommu_fault_param' has no member named 'queue'
     302 |         if (!queue_work(fault_param->queue->wq, &group->work))
         |                                    ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_domain_alloc':
   drivers/iommu/iommu-sva.c:314:17: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     314 |         if (!ops->domain_alloc_sva)
         |                 ^~
   drivers/iommu/iommu-sva.c:317:21: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     317 |         domain = ops->domain_alloc_sva(dev, mm);
         |                     ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_invalidate_kva_range':
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct iommu_mm_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
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
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:552:27: error: expression in static assertion is not an integer
     552 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct iommu_mm_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:773:26: error: invalid use of undefined type 'struct iommu_mm_data'
     773 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:783:15: note: in expansion of macro 'list_entry_is_head'
     783 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct iommu_mm_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct iommu_mm_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
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
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct iommu_mm_data'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
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
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:667:25: error: invalid use of undefined type 'struct iommu_mm_data'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:552:27: error: expression in static assertion is not an integer
     552 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct iommu_mm_data'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:667:9: note: in expansion of macro 'list_entry'
     667 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:784:20: note: in expansion of macro 'list_next_entry'
     784 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:339:9: note: in expansion of macro 'list_for_each_entry'
     339 |         list_for_each_entry(iommu_mm, &iommu_sva_mms, mm_list_elm)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:340:69: error: invalid use of undefined type 'struct iommu_mm_data'
     340 |                 mmu_notifier_arch_invalidate_secondary_tlbs(iommu_mm->mm, start, end);
         |                                                                     ^~
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
   drivers/iommu/iommu-priv.h:19:1: warning: control reaches end of non-void function [-Wreturn-type]
      19 | }
         | ^
   include/linux/iommu.h: In function 'mm_get_enqcmd_pasid':
   include/linux/iommu.h:1614:1: warning: control reaches end of non-void function [-Wreturn-type]
    1614 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]


vim +21 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
35cff7af7598b9 Sakari Ailus     2025-05-20  17   * Do not use container_of() in new code.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  19  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  20  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @21  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  22  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  25  

:::::: The code at line 21 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
