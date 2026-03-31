Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26DB3FF883
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968948; cv=none; b=KEFiht/x+g6L8Vo7l8+lUg2iZwmz/hFu56DWdbBOEiKFMd70IGNofGdDDZpvE+5Z++72xksibtnF1c/ylU2f0ICQC7J4397qvYi3UIv0/Fv3P0B8SEoBCXNDu8NsMihMgz853K44qmiOvl/lB94crVxrf3SrkFv9OAkF0TrlX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968948; c=relaxed/simple;
	bh=5Q5NnkgfjmOqxVKZK85AK27kMgDTLkdm2RELK6JJVoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c2ztoZniofo9L0kFoFftqmBecQnUF97++bcvFMUptjadHYtN8NqxFBXKOmAKH/tW52kVf1S1S/QgTHo4JgfJXebHY1UGs9wAuIZemetym8juT0G6agECu1jbIUKoHY2UmZ/VhfYIlMhampTqDUKgEJJ7bt67u9wv1qZG0RBT82M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTEUxRrt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTEUxRrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774968946; x=1806504946;
  h=date:from:to:cc:subject:message-id;
  bh=5Q5NnkgfjmOqxVKZK85AK27kMgDTLkdm2RELK6JJVoM=;
  b=VTEUxRrtq54BmgwRbIz7a6ADLvssdNrC1nGHRNtE7AWMPMWWyWD33AQ6
   +r5G87c27HeMtaRc9X1JZpmOlDoKpYv/Vt29hS3ZZ2AFCbq2AFljYSyMm
   wG+xQZfNNvzFXnRfrhjZrmtBVE/PM2EWrPdp5I0NtnX58Of6at/wyiUBP
   oDCAOolHozEioF6TLXQD9oYtOvlG6aAa8IRQuu//KMyVNrJcMC4iiZ43P
   S8FX8KifrRvc36j8hMf0aHF7jgzQUIdvLc+fpYOVe3F41+qR/LAf4IhF/
   xE+1oHc7A5xohYF8HB/MIMzYyZk7DZFPPAiEkovCK99CeBYpSnSRZWJd2
   A==;
X-CSE-ConnectionGUID: 9HAI/ipqRjWw30N47DsHHw==
X-CSE-MsgGUID: +2+/M9BJQzyUjXVs0Wvtfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87061517"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87061517"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 07:55:45 -0700
X-CSE-ConnectionGUID: WnnLsaT6RAuXRT+k1F9b7A==
X-CSE-MsgGUID: hUnSDsu1RRyGzlltPl/ywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="231309862"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2026 07:55:44 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7aVI-000000002mn-3FMd;
	Tue, 31 Mar 2026 14:55:40 +0000
Date: Tue, 31 Mar 2026 22:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-04 2/2]
 net/core/scm.c:95:8: error: no member named 'inflight' in 'struct
 scm_fp_list'
Message-ID: <202603312206.Hi08A4VI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-04
head:   a01f4f3e3d4d93656a40a6739b171e98bd608766
commit: 5277c600821d4d375379a9a2991120d388e5dcf9 [2/2] UPSTREAM: af_unix: Link struct unix_edge when queuing skb.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603312206.Hi08A4VI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603312206.Hi08A4VI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603312206.Hi08A4VI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/scm.c:95:8: error: no member named 'inflight' in 'struct scm_fp_list'
      95 |                 fpl->inflight = false;
         |                 ~~~  ^
   net/core/scm.c:96:8: error: no member named 'edges' in 'struct scm_fp_list'
      96 |                 fpl->edges = NULL;
         |                 ~~~  ^
   net/core/scm.c:97:24: error: no member named 'vertices' in 'struct scm_fp_list'
      97 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:386:12: error: no member named 'inflight' in 'struct scm_fp_list'
     386 |                 new_fpl->inflight = false;
         |                 ~~~~~~~  ^
   net/core/scm.c:387:12: error: no member named 'edges' in 'struct scm_fp_list'
     387 |                 new_fpl->edges = NULL;
         |                 ~~~~~~~  ^
   net/core/scm.c:388:28: error: no member named 'vertices' in 'struct scm_fp_list'
     388 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   6 errors generated.
--
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   net/unix/garbage.c:111:35: error: no member named 'vertices' in 'struct scm_fp_list'
     111 |                 vertex = list_first_entry(&fpl->vertices, typeof(*vertex), entry);
         |                                            ~~~  ^
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:20:23: note: expanded from macro 'container_of'
      20 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:316:63: note: expanded from macro '__same_type'
     316 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   net/unix/garbage.c:132:40: error: no member named 'vertices' in 'struct scm_fp_list'
     132 |                 list_move_tail(&vertex->entry, &fpl->vertices);
         |                                                 ~~~  ^
   net/unix/garbage.c:140:54: error: no member named 'vertices' in 'struct scm_fp_list'
     140 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:761:30: note: expanded from macro 'list_for_each_entry_safe'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:18:26: note: expanded from macro 'container_of'
      18 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   net/unix/garbage.c:140:54: error: no member named 'vertices' in 'struct scm_fp_list'
     140 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:761:30: note: expanded from macro 'list_for_each_entry_safe'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:316:63: note: expanded from macro '__same_type'
     316 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   net/unix/garbage.c:140:54: error: no member named 'vertices' in 'struct scm_fp_list'
     140 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:761:30: note: expanded from macro 'list_for_each_entry_safe'
     761 |         for (pos = list_first_entry(head, typeof(*pos), member),        \
         |                                     ^~~~
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:316:63: note: expanded from macro '__same_type'
     316 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   net/unix/garbage.c:140:54: error: no member named 'vertices' in 'struct scm_fp_list'
     140 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:763:32: note: expanded from macro 'list_for_each_entry_safe'
     763 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:665:20: note: expanded from macro 'list_entry_is_head'
     665 |         (&pos->member == (head))
         |                           ^~~~
   net/unix/garbage.c:164:15: error: no member named 'edges' in 'struct scm_fp_list'
     164 |                 edge = fpl->edges + i++;
         |                        ~~~  ^
>> net/unix/garbage.c:174:7: error: no member named 'inflight' in 'struct scm_fp_list'
     174 |         fpl->inflight = true;
         |         ~~~  ^
   net/unix/garbage.c:189:33: error: no member named 'edges' in 'struct scm_fp_list'
     189 |                 struct unix_edge *edge = fpl->edges + i++;
         |                                          ~~~  ^
   net/unix/garbage.c:197:7: error: no member named 'inflight' in 'struct scm_fp_list'
     197 |         fpl->inflight = false;
         |         ~~~  ^
   net/unix/garbage.c:213:34: error: no member named 'vertices' in 'struct scm_fp_list'
     213 |                 list_add(&vertex->entry, &fpl->vertices);
         |                                           ~~~  ^
   net/unix/garbage.c:216:7: error: no member named 'edges' in 'struct scm_fp_list'
     216 |         fpl->edges = kvmalloc_array(fpl->count_unix, sizeof(*fpl->edges),
         |         ~~~  ^
   net/unix/garbage.c:216:60: error: no member named 'edges' in 'struct scm_fp_list'
     216 |         fpl->edges = kvmalloc_array(fpl->count_unix, sizeof(*fpl->edges),
         |                                                              ~~~  ^
   net/unix/garbage.c:218:12: error: no member named 'edges' in 'struct scm_fp_list'
     218 |         if (!fpl->edges)
         |              ~~~  ^
   net/unix/garbage.c:230:11: error: no member named 'inflight' in 'struct scm_fp_list'
     230 |         if (fpl->inflight)
         |             ~~~  ^
   net/unix/garbage.c:233:14: error: no member named 'edges' in 'struct scm_fp_list'
     233 |         kvfree(fpl->edges);
         |                ~~~  ^
   18 errors generated.


vim +95 net/core/scm.c

    68	
    69	static int scm_fp_copy(struct cmsghdr *cmsg, struct scm_fp_list **fplp)
    70	{
    71		int *fdp = (int*)CMSG_DATA(cmsg);
    72		struct scm_fp_list *fpl = *fplp;
    73		struct file **fpp;
    74		int i, num;
    75	
    76		num = (cmsg->cmsg_len - sizeof(struct cmsghdr))/sizeof(int);
    77	
    78		if (num <= 0)
    79			return 0;
    80	
    81		if (num > SCM_MAX_FD)
    82			return -EINVAL;
    83	
    84		if (!fpl)
    85		{
    86			fpl = kmalloc(sizeof(struct scm_fp_list), GFP_KERNEL_ACCOUNT);
    87			if (!fpl)
    88				return -ENOMEM;
    89			*fplp = fpl;
    90			fpl->count = 0;
    91			fpl->count_unix = 0;
    92			fpl->max = SCM_MAX_FD;
    93			fpl->user = NULL;
    94	#if IS_ENABLED(CONFIG_UNIX)
  > 95			fpl->inflight = false;
    96			fpl->edges = NULL;
    97			INIT_LIST_HEAD(&fpl->vertices);
    98	#endif
    99		}
   100		fpp = &fpl->fp[fpl->count];
   101	
   102		if (fpl->count + num > fpl->max)
   103			return -EINVAL;
   104	
   105		/*
   106		 *	Verify the descriptors and increment the usage count.
   107		 */
   108	
   109		for (i=0; i< num; i++)
   110		{
   111			int fd = fdp[i];
   112			struct file *file;
   113	
   114			if (fd < 0 || !(file = fget_raw(fd)))
   115				return -EBADF;
   116			/* don't allow io_uring files */
   117			if (io_is_uring_fops(file)) {
   118				fput(file);
   119				return -EINVAL;
   120			}
   121			if (unix_get_socket(file))
   122				fpl->count_unix++;
   123	
   124			*fpp++ = file;
   125			fpl->count++;
   126		}
   127	
   128		if (!fpl->user)
   129			fpl->user = get_uid(current_user());
   130	
   131		return num;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
