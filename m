Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02CB3FC2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 00:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706400972; cv=none; b=N9oqmzXsGgw8B69LoBSp+5+/KxVLgi+ys4ryJXrC1FYiHdHXtelZh/Hly+qVErRKU+Mz4sF+lTqMZd1zmO3OqJjCY1B7C8GSWhUalKx/j32FZ7QcUtrEAXorKIc9TntKR4o3Cf2IisiuL05+qR/RsEiLWSPjsQYqd5ZVlXGEsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706400972; c=relaxed/simple;
	bh=Y/3RtDBm2kLAACOQClto2gr27yNDjM729Xj4cnr7SHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPUJ/4rMXTtipcB9v73f71CQCAdeH5pATfeWUkG4w9BzFtzP8UYPrEE+fELTjoQSlz2aO40OxR+RxVUaTo06v1G26rINh2vkg3GqKtbLyg4UjJV9237ztxbrkXJCZPxqAHldCMosqooSi8kF3KYRoz5nsnb5V3QYUxmTxSRCzG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsrLSmaD; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsrLSmaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706400969; x=1737936969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/3RtDBm2kLAACOQClto2gr27yNDjM729Xj4cnr7SHI=;
  b=EsrLSmaDpuTrNIY4cIWeno9ZHWmEsdibWDIK2r2bZgpFsX4Pkd3yCGuG
   Re6bTSig3+A7PNm2cv+DNoxK6//icCdGjZjya8C5q2UpCiWXhtHLh+YRe
   rnXh2hn0nBwxK81uoOdoUGN+G35pzjGbcipBHmi5iiuzp8WiuNzLVQesc
   lNLGgcf+zLegGbHOOsWA1lV+IeHbYJCLIaHPiztp0bBSPeH5BroxxErwe
   Pn15fXn7nIxJgoZRSgggFp1jM2igiyTope6j2wcZMpNzjp+DETsUEp753
   LzsEnRJKbIGumnDgzgbqd7n0vF5xEmRVQVH8Gi8BzEmlJxhWGOzUJOhzl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="406444722"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="406444722"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:16:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3094943"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2024 16:16:08 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTsqD-0002t8-20;
	Sun, 28 Jan 2024 00:16:05 +0000
Date: Sun, 28 Jan 2024 08:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 115/275] fs/xfs/./xfs_trace.h:4674:25:
 error: unknown type name 'xfs_btnum_t'
Message-ID: <202401280811.NVuIKVOv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   370f4f5a373f371e76fdc9634867b15775947255
commit: 419a4e475da9d40a65908b125856d1bb218a2c7d [115/275] xfs: connect in-memory btrees to xfiles
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240128/202401280811.NVuIKVOv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280811.NVuIKVOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280811.NVuIKVOv-lkp@intel.com/

Note: the djwong-xfs/vectorized-scrub HEAD 370f4f5a373f371e76fdc9634867b15775947255 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from fs/xfs/xfs_trace.h:4705,
                    from fs/xfs/xfs_trace.c:56:
>> fs/xfs/./xfs_trace.h:4674:25: error: unknown type name 'xfs_btnum_t'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                         ^~~~~~~~~~~
   include/trace/trace_events.h:54:17: note: in definition of macro 'DECLARE_EVENT_CLASS'
      54 |                 tstruct                                                 \
         |                 ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:9: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:17: note: in expansion of macro '__field'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                 ^~~~~~~
   fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfbtree_freesp_class':
>> fs/xfs/./xfs_trace.h:4686:52: error: 'XFS_BTNUM_STRINGS' undeclared (first use in this function); did you mean 'XFS_PTAG_STRINGS'?
    4686 |                   __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |                                                    ^~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4684:9: note: in expansion of macro 'TP_printk'
    4684 |         TP_printk("xfino 0x%lx btree %s nlevels %d fileoff 0x%llx",
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4686:19: note: in expansion of macro '__print_symbolic'
    4686 |                   __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |                   ^~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4686:52: note: each undeclared identifier is reported only once for each function it appears in
    4686 |                   __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |                                                    ^~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   fs/xfs/./xfs_trace.h:4684:9: note: in expansion of macro 'TP_printk'
    4684 |         TP_printk("xfino 0x%lx btree %s nlevels %d fileoff 0x%llx",
         |         ^~~~~~~~~
   fs/xfs/./xfs_trace.h:4686:19: note: in expansion of macro '__print_symbolic'
    4686 |                   __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |                   ^~~~~~~~~~~~~~~~
   fs/xfs/./xfs_trace.h: At top level:
>> fs/xfs/./xfs_trace.h:4674:25: error: 'xfs_btnum_t' undeclared here (not in a function); did you mean 'xfs_rtxnum_t'?
    4674 |                 __field(xfs_btnum_t, btnum)
         |                         ^~~~~~~~~~~
   include/trace/trace_events.h:244:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |         tstruct                                                         \
         |         ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:9: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:33: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item)     __field_ext(type, item, FILTER_OTHER)
         |                                 ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:17: note: in expansion of macro '__field'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                 ^~~~~~~
>> fs/xfs/./xfs_trace.h:4674:25: error: expected specifier-qualifier-list before 'xfs_btnum_t'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                         ^~~~~~~~~~~
   include/trace/trace_events.h:244:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |         tstruct                                                         \
         |         ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:9: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:10:41: note: in expansion of macro 'ALIGN_STRUCTFIELD'
      10 |         .size = sizeof(_type), .align = ALIGN_STRUCTFIELD(_type),       \
         |                                         ^~~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:33: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item)     __field_ext(type, item, FILTER_OTHER)
         |                                 ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:17: note: in expansion of macro '__field'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                 ^~~~~~~
>> include/linux/compiler.h:242:60: error: expected ')' before numeric constant
     242 | #define is_signed_type(type) (((type)(-1)) < (__force type)1)
         |                              ~                             ^
   include/trace/trace_events.h:244:9: note: in definition of macro 'DECLARE_EVENT_CLASS'
     244 |         tstruct                                                         \
         |         ^~~~~~~
   fs/xfs/./xfs_trace.h:4672:9: note: in expansion of macro 'TP_STRUCT__entry'
    4672 |         TP_STRUCT__entry(
         |         ^~~~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:11:22: note: in expansion of macro 'is_signed_type'
      11 |         .is_signed = is_signed_type(_type), .filter_type = _filter_type },
         |                      ^~~~~~~~~~~~~~
   include/trace/stages/stage4_event_fields.h:20:33: note: in expansion of macro '__field_ext'
      20 | #define __field(type, item)     __field_ext(type, item, FILTER_OTHER)
         |                                 ^~~~~~~~~~~
   fs/xfs/./xfs_trace.h:4674:17: note: in expansion of macro '__field'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                 ^~~~~~~
   fs/xfs/./xfs_trace.h: In function 'trace_event_raw_event_xfbtree_freesp_class':
>> fs/xfs/./xfs_trace.h:4680:37: error: 'struct xfs_btree_cur' has no member named 'bc_btnum'
    4680 |                 __entry->btnum = cur->bc_btnum;
         |                                     ^~
   include/trace/trace_events.h:402:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   fs/xfs/./xfs_trace.h:4678:9: note: in expansion of macro 'TP_fast_assign'
    4678 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:103:
   fs/xfs/./xfs_trace.h: In function 'perf_trace_xfbtree_freesp_class':
>> fs/xfs/./xfs_trace.h:4680:37: error: 'struct xfs_btree_cur' has no member named 'bc_btnum'
    4680 |                 __entry->btnum = cur->bc_btnum;
         |                                     ^~
   include/trace/perf.h:51:11: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   fs/xfs/./xfs_trace.h:4678:9: note: in expansion of macro 'TP_fast_assign'
    4678 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +/xfs_btnum_t +4674 fs/xfs/./xfs_trace.h

  4667	
  4668	DECLARE_EVENT_CLASS(xfbtree_freesp_class,
  4669		TP_PROTO(struct xfbtree *xfbt, struct xfs_btree_cur *cur,
  4670			 xfs_fileoff_t fileoff),
  4671		TP_ARGS(xfbt, cur, fileoff),
> 4672		TP_STRUCT__entry(
  4673			__field(unsigned long, xfino)
> 4674			__field(xfs_btnum_t, btnum)
  4675			__field(int, nlevels)
  4676			__field(xfs_fileoff_t, fileoff)
  4677		),
  4678		TP_fast_assign(
  4679			__entry->xfino = xfbtree_ino(xfbt);
> 4680			__entry->btnum = cur->bc_btnum;
  4681			__entry->nlevels = cur->bc_nlevels;
  4682			__entry->fileoff = fileoff;
  4683		),
> 4684		TP_printk("xfino 0x%lx btree %s nlevels %d fileoff 0x%llx",
  4685			  __entry->xfino,
> 4686			  __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
  4687			  __entry->nlevels,
  4688			  (unsigned long long)__entry->fileoff)
  4689	)
  4690	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
