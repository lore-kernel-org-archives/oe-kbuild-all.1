Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1F379EF9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 18:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981062; cv=none; b=q57GBd7mAzhopHrS4LGUS6vzOmJ+VsfOH6WUyfXvn7hTmWcaYX8AVAMatIZOXDmQMogy/CDE5Mly0KJYPYMZ1HblwOzXaseFibusk/xdnRtWQFP6D/QC/yan7lxAat3ipjl0yc2vycGu9FLLyHuJtGppBQVR8ger15j5dfubMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981062; c=relaxed/simple;
	bh=Fnx0rwGllxp8CBdBZd/hQQD3B4sCCL9QcxoXVTctGDw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BA93uBfSNm04sARVGLjSI8yARcmOOjqj10Z5OeXY/Y18galV3sT5wHXaYRQsoEwjRwEPsk6qkpyZvzx0ROEo4yYTpJWBK6qnzb6pADyxbn4Wbft1UsZL+ayySaBdHXk6og3m4+DtBC7SPb0nQNBTB1meFe0GwZiUQKp6z7Ut3vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKAuW9P8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKAuW9P8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774981058; x=1806517058;
  h=date:from:to:cc:subject:message-id;
  bh=Fnx0rwGllxp8CBdBZd/hQQD3B4sCCL9QcxoXVTctGDw=;
  b=fKAuW9P8lRSrC+bN3LGrgy2a33e+4btp7kQwR0h8qJ0gQvvYVNQdZCUZ
   fhAow7VrNMhftT5uj+hdgFUHqSjZQ49u8/lUT2dF9E88mPuOq04X44AFA
   hoZk/atvoyV48l082gKLPkqfTP1mLzd94mzoxRJo+ym7FX5oKTLIJGfCg
   yWPR60x7ovyznmiDjO6DZqYvp/5GStUBdgPs7/yWeOEJDD4Bd1LisEIu7
   MdMT7U2MrZkVMRIUr/SDnhC3YOcIxwFz/MVyVnjIZAElefMz6Sj4uoDVU
   kKkyBgycn06aB1eeZQlcmhvAYGOe0cJIDSnDWjigslztpGAD38CGTOnlT
   A==;
X-CSE-ConnectionGUID: qyzyI10IQuSwChU17V4e8Q==
X-CSE-MsgGUID: Um2NmxglTuWX/LRc3hoVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78599505"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="78599505"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:17:37 -0700
X-CSE-ConnectionGUID: Hb1TJREcQNGZ7WhEXh65+Q==
X-CSE-MsgGUID: aPveW6McRa6s3q9JoUrVuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="231247360"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2026 11:17:35 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7def-0000000047d-1L3L;
	Tue, 31 Mar 2026 18:17:33 +0000
Date: Wed, 01 Apr 2026 02:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-04 2/2]
 net/core/scm.c:96:8: error: no member named 'dead' in 'struct scm_fp_list'
Message-ID: <202604010208.DcNkyap0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-04
head:   a01f4f3e3d4d93656a40a6739b171e98bd608766
commit: 42b241f4e06eb3c2df1409a2d82522b2ce2a9329 [2/2] UPSTREAM: af_unix: Add dead flag to struct scm_fp_list.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010208.DcNkyap0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010208.DcNkyap0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010208.DcNkyap0-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/scm.c:95:8: error: no member named 'inflight' in 'struct scm_fp_list'
      95 |                 fpl->inflight = false;
         |                 ~~~  ^
>> net/core/scm.c:96:8: error: no member named 'dead' in 'struct scm_fp_list'
      96 |                 fpl->dead = false;
         |                 ~~~  ^
   net/core/scm.c:97:8: error: no member named 'edges' in 'struct scm_fp_list'
      97 |                 fpl->edges = NULL;
         |                 ~~~  ^
   net/core/scm.c:98:24: error: no member named 'vertices' in 'struct scm_fp_list'
      98 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                 ~~~  ^
   net/core/scm.c:387:12: error: no member named 'inflight' in 'struct scm_fp_list'
     387 |                 new_fpl->inflight = false;
         |                 ~~~~~~~  ^
   net/core/scm.c:388:12: error: no member named 'edges' in 'struct scm_fp_list'
     388 |                 new_fpl->edges = NULL;
         |                 ~~~~~~~  ^
   net/core/scm.c:389:28: error: no member named 'vertices' in 'struct scm_fp_list'
     389 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                 ~~~~~~~  ^
   7 errors generated.
--
   net/unix/garbage.c:145:35: error: no member named 'vertices' in 'struct scm_fp_list'
     145 |                 vertex = list_first_entry(&fpl->vertices, typeof(*vertex), entry);
         |                                            ~~~  ^
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:18:26: note: expanded from macro 'container_of'
      18 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   net/unix/garbage.c:145:35: error: no member named 'vertices' in 'struct scm_fp_list'
     145 |                 vertex = list_first_entry(&fpl->vertices, typeof(*vertex), entry);
         |                                            ~~~  ^
   include/linux/list.h:531:14: note: expanded from macro 'list_first_entry'
     531 |         list_entry((ptr)->next, type, member)
         |                     ^~~
   include/linux/list.h:520:15: note: expanded from macro 'list_entry'
     520 |         container_of(ptr, type, member)
         |                      ^~~
   include/linux/container_of.h:19:30: note: expanded from macro 'container_of'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
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
   net/unix/garbage.c:145:35: error: no member named 'vertices' in 'struct scm_fp_list'
     145 |                 vertex = list_first_entry(&fpl->vertices, typeof(*vertex), entry);
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
>> net/unix/garbage.c:165:12: error: no member named 'dead' in 'struct scm_fp_list'
     165 |         if (!fpl->dead)
         |              ~~~  ^
   net/unix/garbage.c:173:40: error: no member named 'vertices' in 'struct scm_fp_list'
     173 |                 list_move_tail(&vertex->entry, &fpl->vertices);
         |                                                 ~~~  ^
   net/unix/garbage.c:181:54: error: no member named 'vertices' in 'struct scm_fp_list'
     181 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
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
   net/unix/garbage.c:181:54: error: no member named 'vertices' in 'struct scm_fp_list'
     181 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
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
   net/unix/garbage.c:181:54: error: no member named 'vertices' in 'struct scm_fp_list'
     181 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
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
   net/unix/garbage.c:181:54: error: no member named 'vertices' in 'struct scm_fp_list'
     181 |         list_for_each_entry_safe(vertex, next_vertex, &fpl->vertices, entry) {
         |                                                        ~~~  ^
   include/linux/list.h:763:32: note: expanded from macro 'list_for_each_entry_safe'
     763 |              !list_entry_is_head(pos, head, member);                    \
         |                                       ^~~~
   include/linux/list.h:665:20: note: expanded from macro 'list_entry_is_head'
     665 |         (&pos->member == (head))
         |                           ^~~~
   net/unix/garbage.c:206:15: error: no member named 'edges' in 'struct scm_fp_list'
     206 |                 edge = fpl->edges + i++;
         |                        ~~~  ^
   net/unix/garbage.c:220:7: error: no member named 'inflight' in 'struct scm_fp_list'
     220 |         fpl->inflight = true;
         |         ~~~  ^
   net/unix/garbage.c:236:33: error: no member named 'edges' in 'struct scm_fp_list'
     236 |                 struct unix_edge *edge = fpl->edges + i++;
         |                                          ~~~  ^
   net/unix/garbage.c:241:12: error: no member named 'dead' in 'struct scm_fp_list'
     241 |         if (!fpl->dead) {
         |              ~~~  ^
   net/unix/garbage.c:242:19: error: no member named 'edges' in 'struct scm_fp_list'
     242 |                 receiver = fpl->edges[0].successor;
         |                            ~~~  ^
   net/unix/garbage.c:251:7: error: no member named 'inflight' in 'struct scm_fp_list'
     251 |         fpl->inflight = false;
         |         ~~~  ^
   net/unix/garbage.c:283:34: error: no member named 'vertices' in 'struct scm_fp_list'
     283 |                 list_add(&vertex->entry, &fpl->vertices);
         |                                           ~~~  ^
   net/unix/garbage.c:286:7: error: no member named 'edges' in 'struct scm_fp_list'
     286 |         fpl->edges = kvmalloc_array(fpl->count_unix, sizeof(*fpl->edges),
         |         ~~~  ^
   net/unix/garbage.c:286:60: error: no member named 'edges' in 'struct scm_fp_list'
     286 |         fpl->edges = kvmalloc_array(fpl->count_unix, sizeof(*fpl->edges),
         |                                                              ~~~  ^


vim +96 net/core/scm.c

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
    95			fpl->inflight = false;
  > 96			fpl->dead = false;
    97			fpl->edges = NULL;
    98			INIT_LIST_HEAD(&fpl->vertices);
    99	#endif
   100		}
   101		fpp = &fpl->fp[fpl->count];
   102	
   103		if (fpl->count + num > fpl->max)
   104			return -EINVAL;
   105	
   106		/*
   107		 *	Verify the descriptors and increment the usage count.
   108		 */
   109	
   110		for (i=0; i< num; i++)
   111		{
   112			int fd = fdp[i];
   113			struct file *file;
   114	
   115			if (fd < 0 || !(file = fget_raw(fd)))
   116				return -EBADF;
   117			/* don't allow io_uring files */
   118			if (io_is_uring_fops(file)) {
   119				fput(file);
   120				return -EINVAL;
   121			}
   122			if (unix_get_socket(file))
   123				fpl->count_unix++;
   124	
   125			*fpp++ = file;
   126			fpl->count++;
   127		}
   128	
   129		if (!fpl->user)
   130			fpl->user = get_uid(current_user());
   131	
   132		return num;
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
