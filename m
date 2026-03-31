Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5763822B5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958030; cv=none; b=B/0LoQ7V+vqTF5cIldSX5bM5qDLrEGCWL5fQ/C1I4akHIIB+9QQIvmRYnyFtNRQnf91L9kI+gjhYSY7ouWXxvYeKIq5NM5Vq9HCfpTWIn5A3WpL5kC9FEBhZ2162n932JVQN9wacEjy+DjfivBs+tDUiAdCPS6LQCldcV2xOfwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958030; c=relaxed/simple;
	bh=9Yc9bjOblMJaDiHRAiIL/2okXdItOq/ubWL3isriCbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QHB9djwbT0EqNQTBBHy2qgC2/1eO9d6uh9VX5evsPv1eBtF+2bDWgz0D6ZLOql2pTwUrorrq6AAGRTgPLW3a/PJbFkjxmgRzCtd6r83xp6gM5N5IOuLagWeSsk3acrVNaU/ESJas5/Qtf7Y8+SsTyTKt3dld3jnjIawmJUtonw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNs/F3ea; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNs/F3ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774958028; x=1806494028;
  h=date:from:to:cc:subject:message-id;
  bh=9Yc9bjOblMJaDiHRAiIL/2okXdItOq/ubWL3isriCbs=;
  b=cNs/F3ea8kcDATtySnBtLqPsBXeG4zOd8JYJ4ZOwzwI/8JY74KK/0NJK
   6/xloxW5JdbYplFZ8o2iSVZZOTjsTZ2Jfb3Z+MHT0uGwT/Z1dejZ4v0B4
   LJkZsKRJTyZc9TIKIcMItc5XGqhKKUMlbHaMXb+KwcF6U7XNdsGnSwTrY
   Afz/ZD8e1BSTOhjfoxQq9xU12H3bqokgwas/IIpK6jgAwVsdzE2VOQ5sW
   tRsNZwd+gQMi0mLlzptg1Rq7sSKDzBZr2xRDrNZtTDmh6bvo4s3OA/sln
   glodkZiHTC40kvr5SOxeab8I5EXJ1WUmhGo3hvEMY3rLwKzK5Egyq0M5x
   Q==;
X-CSE-ConnectionGUID: bw4zgXIQT0u4o+/EVuNMiQ==
X-CSE-MsgGUID: fjIlBKLKRp2Lo6YaYHbcFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79568654"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79568654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 04:53:48 -0700
X-CSE-ConnectionGUID: oBQ3+xVeRT6xzZp4iHrO+w==
X-CSE-MsgGUID: O8o3Er9cQ7a1zbe1sHmedA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230411540"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 04:53:46 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7XfD-000000002ab-30Nd;
	Tue, 31 Mar 2026 11:53:43 +0000
Date: Tue, 31 Mar 2026 19:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-04 2/2]
 net/core/scm.c:95:8: error: no member named 'edges' in 'struct scm_fp_list'
Message-ID: <202603311908.XPguNADv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-04
head:   a01f4f3e3d4d93656a40a6739b171e98bd608766
commit: 6c08a31a23556833e2f2fde1c7fe546b476c8784 [2/2] UPSTREAM: af_unix: Allocate struct unix_edge for each inflight AF_UNIX fd.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603311908.XPguNADv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311908.XPguNADv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311908.XPguNADv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/scm.c:95:8: error: no member named 'edges' in 'struct scm_fp_list'
      95 |                 fpl->edges = NULL;
         |                 ~~~  ^
   net/core/scm.c:96:24: error: no member named 'vertices' in 'struct scm_fp_list'
      96 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:385:12: error: no member named 'edges' in 'struct scm_fp_list'
     385 |                 new_fpl->edges = NULL;
         |                 ~~~~~~~  ^
   net/core/scm.c:386:28: error: no member named 'vertices' in 'struct scm_fp_list'
     386 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   4 errors generated.
--
   net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
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
   net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
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
   net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
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
   net/unix/garbage.c:108:54: error: no member named 'vertices' in 'struct scm_fp_list'
     108 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:763:32: note: expanded from macro 'list_for_each_entry_safe'
     763 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:665:20: note: expanded from macro 'list_entry_is_head'
     665 |         (&pos->member == (head))
         |                           ^~~~
   net/unix/garbage.c:127:34: error: no member named 'vertices' in 'struct scm_fp_list'
     127 |                 list_add(&vertex->entry, &fpl->vertices);
         |                                           ~~~  ^
>> net/unix/garbage.c:130:7: error: no member named 'edges' in 'struct scm_fp_list'
     130 |         fpl->edges = kvmalloc_array(fpl->count_unix, sizeof(*fpl->edges),
         |         ~~~  ^
   net/unix/garbage.c:130:60: error: no member named 'edges' in 'struct scm_fp_list'
     130 |         fpl->edges = kvmalloc_array(fpl->count_unix, sizeof(*fpl->edges),
         |                                                              ~~~  ^
   net/unix/garbage.c:132:12: error: no member named 'edges' in 'struct scm_fp_list'
     132 |         if (!fpl->edges)
         |              ~~~  ^
   net/unix/garbage.c:144:14: error: no member named 'edges' in 'struct scm_fp_list'
     144 |         kvfree(fpl->edges);
         |                ~~~  ^
   9 errors generated.


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
  > 95			fpl->edges = NULL;
    96			INIT_LIST_HEAD(&fpl->vertices);
    97	#endif
    98		}
    99		fpp = &fpl->fp[fpl->count];
   100	
   101		if (fpl->count + num > fpl->max)
   102			return -EINVAL;
   103	
   104		/*
   105		 *	Verify the descriptors and increment the usage count.
   106		 */
   107	
   108		for (i=0; i< num; i++)
   109		{
   110			int fd = fdp[i];
   111			struct file *file;
   112	
   113			if (fd < 0 || !(file = fget_raw(fd)))
   114				return -EBADF;
   115			/* don't allow io_uring files */
   116			if (io_is_uring_fops(file)) {
   117				fput(file);
   118				return -EINVAL;
   119			}
   120			if (unix_get_socket(file))
   121				fpl->count_unix++;
   122	
   123			*fpp++ = file;
   124			fpl->count++;
   125		}
   126	
   127		if (!fpl->user)
   128			fpl->user = get_uid(current_user());
   129	
   130		return num;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
