Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE79F1C68F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280990; cv=none; b=Aqs0wFsxMvnAmwtEIFV35YCq4ekIHAX1nVQWZluXW6RW1Szag/sdOQV8+KXPH+o4ZdJpw2VWi9Rnof4eKVIXOhIB83f/XuKb71RDGq8BLI7THLFlZfQZn/IxOmTqM+UBxXR415yGa5p+XwusByoS2blgb/exYJjUCq+DzpUNn78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280990; c=relaxed/simple;
	bh=PXLrSHLYXaPJ1G+n4ymCl2+Vubs9xD5M87Eeub4C3jI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gye1zE/OVcW7BvDF10GIkgP50OaPzZqyPicFolMP+iIiVqreYyCird5lRRnvIRr8x3mElHcjTJ6JzzZp46Jpl0So4bQkFZ7O54KhcUR1YH+JttT9Ae3KYh5/WKRRXsgd+ClAVlLF3lusyFRHMVwbgZ9OM7AJUpnj9HcCuDEE6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oF2nnE1m; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oF2nnE1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706280989; x=1737816989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PXLrSHLYXaPJ1G+n4ymCl2+Vubs9xD5M87Eeub4C3jI=;
  b=oF2nnE1mRyq11pVC+C99e0OY2EpAk+lSE07/ZvviVESAQ4l6fdDy4E/H
   cl8cfbFyUEISb1bzzem1sZgv2dbxdUA08vd2bFH5LafkYXHhG4tfAdt9p
   rEJTfqvbeUK5ufp3a3pyENR1UrAaeGLZzk2cTWKBY9LBgAnnPrMZOpT9D
   K3bH0GSXP5R1uPkjp1XthJWlg868Bd9h5evlhYjAL47Ylm2eMuyKnNrTi
   dpqN+U8Af/GvqKOlBF9lL/J8pHWZsE4l7bubbDHu1IR/9zoS+ybk5ZlL4
   z3bsyy+/YBP/V3vNdeNo2pp5Fg74Q6HIZfby4FpHnfBw/X7ByYNHRSDb4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9858702"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9858702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 06:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2679515"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2024 06:56:23 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTNcy-00016o-2t;
	Fri, 26 Jan 2024 14:56:20 +0000
Date: Fri, 26 Jan 2024 22:55:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 115/275] fs/xfs/xfs_trace.h:4674:11:
 error: unknown type name 'xfs_btnum_t'
Message-ID: <202401262209.1D4CDbGg-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20240126 (https://download.01.org/0day-ci/archive/20240126/202401262209.1D4CDbGg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401262209.1D4CDbGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401262209.1D4CDbGg-lkp@intel.com/

Note: the djwong-xfs/vectorized-scrub HEAD 370f4f5a373f371e76fdc9634867b15775947255 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_trace.c:56:
   In file included from fs/xfs/xfs_trace.h:4705:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:94:
>> fs/xfs/xfs_trace.h:4674:11: error: unknown type name 'xfs_btnum_t'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                         ^
   In file included from fs/xfs/xfs_trace.c:56:
   In file included from fs/xfs/xfs_trace.h:4705:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
>> fs/xfs/xfs_trace.h:4686:38: error: use of undeclared identifier 'XFS_BTNUM_STRINGS'
    4686 |                   __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
         |                                                    ^
   In file included from fs/xfs/xfs_trace.c:56:
   In file included from fs/xfs/xfs_trace.h:4705:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:250:
>> fs/xfs/xfs_trace.h:4674:11: error: use of undeclared identifier 'xfs_btnum_t'
    4674 |                 __field(xfs_btnum_t, btnum)
         |                         ^
>> fs/xfs/xfs_trace.h:4674:11: error: unknown type name 'xfs_btnum_t'
>> fs/xfs/xfs_trace.h:4674:11: error: use of undeclared identifier 'xfs_btnum_t'
>> fs/xfs/xfs_trace.h:4674:11: error: use of undeclared identifier 'xfs_btnum_t'
   In file included from fs/xfs/xfs_trace.c:56:
   In file included from fs/xfs/xfs_trace.h:4705:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
>> fs/xfs/xfs_trace.h:4680:25: error: no member named 'bc_btnum' in 'struct xfs_btree_cur'
    4680 |                 __entry->btnum = cur->bc_btnum;
         |                                  ~~~  ^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:402:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
     402 |         { assign; }                                                     \
         |           ^~~~~~
   In file included from fs/xfs/xfs_trace.c:56:
   In file included from fs/xfs/xfs_trace.h:4705:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> fs/xfs/xfs_trace.h:4680:25: error: no member named 'bc_btnum' in 'struct xfs_btree_cur'
    4680 |                 __entry->btnum = cur->bc_btnum;
         |                                  ~~~  ^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   8 errors generated.


vim +/xfs_btnum_t +4674 fs/xfs/xfs_trace.h

  4667	
  4668	DECLARE_EVENT_CLASS(xfbtree_freesp_class,
  4669		TP_PROTO(struct xfbtree *xfbt, struct xfs_btree_cur *cur,
  4670			 xfs_fileoff_t fileoff),
  4671		TP_ARGS(xfbt, cur, fileoff),
  4672		TP_STRUCT__entry(
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
  4684		TP_printk("xfino 0x%lx btree %s nlevels %d fileoff 0x%llx",
  4685			  __entry->xfino,
> 4686			  __print_symbolic(__entry->btnum, XFS_BTNUM_STRINGS),
  4687			  __entry->nlevels,
  4688			  (unsigned long long)__entry->fileoff)
  4689	)
  4690	
  4691	#define DEFINE_XFBTREE_FREESP_EVENT(name) \
  4692	DEFINE_EVENT(xfbtree_freesp_class, name, \
  4693		TP_PROTO(struct xfbtree *xfbt, struct xfs_btree_cur *cur, \
  4694			 xfs_fileoff_t fileoff), \
  4695		TP_ARGS(xfbt, cur, fileoff))
  4696	DEFINE_XFBTREE_FREESP_EVENT(xfbtree_alloc_block);
  4697	DEFINE_XFBTREE_FREESP_EVENT(xfbtree_free_block);
  4698	#endif /* CONFIG_XFS_BTREE_IN_MEM */
  4699	
  4700	#endif /* _TRACE_XFS_H */
  4701	
  4702	#undef TRACE_INCLUDE_PATH
  4703	#define TRACE_INCLUDE_PATH .
  4704	#define TRACE_INCLUDE_FILE xfs_trace
> 4705	#include <trace/define_trace.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
