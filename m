Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704163218C0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522863; cv=none; b=u6Y+8nikH2lsk+9R1sQiipvJNwKVog/rGAAncpNlBL0EIFev+Pn7pq795yOIupCnQetsvsrHpxFeyHGwX8Yw+kiHPfAAVh5SKxeO/VjiWWW0ZAVIF7he9PhkgRASUyzlKG/wbazXSjXa9hYYnHRnDKxk2QJIquVYmKa0RbPLWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522863; c=relaxed/simple;
	bh=QC251M/K9Xln7wUeBxcbNrv6E2r+ECHZylOIyDZ6u0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3HaSK8SVsHovIBZL2DbZwD8Ml/ooTBMcPvP54aZvNVJmzAoekyVgS+afTq22wjSg5bnNNMzEltv/5dsEXiCNORMpj103iqWim3TRk56GKzU/uP8oqc8w41JxMEFeFHTuXucUMXiWIMqJPnhn2ygfid0ShTwNI04jGt8+/nlsEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H02F6TKE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H02F6TKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755522860; x=1787058860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QC251M/K9Xln7wUeBxcbNrv6E2r+ECHZylOIyDZ6u0A=;
  b=H02F6TKENPsPTmePWOHdTSYfRqD/TH4hWDVKkDnBRRm+evL2RZ63VkE3
   z6ie8ULnb1YEFgnb318b328goEb2J2UqcibdfV1WZk/lnODYWe5SmNq+8
   udTKbg3M+jQLFFqhAoHVT/TRWYoD7zswPXJ/xWI+F0AOR64yAxPXejnKK
   JwEvgg28BiAVsoifjtprVNavKYflEKkvJm4aPK2fLEilLWaET9NsjKVjM
   HTSdjhntbn24mDokBEGdIt+IA/p1XZX06BYpE5/vhVx0ZjmO84zZ8RzG3
   SuAE7x9SlZ2m1q4AVhq+skSuXVyRRPSTxqXQbvBhY0FQWs18X15s3ID+g
   A==;
X-CSE-ConnectionGUID: Fzb0b5J0QvGppHikotTUuQ==
X-CSE-MsgGUID: rxCTUFq2RVS9Q2bUjxN/aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45317314"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="45317314"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 06:14:19 -0700
X-CSE-ConnectionGUID: 6Zasr3m1QECPlV9i2j+AcQ==
X-CSE-MsgGUID: yGbTjL//Q0WiKEKmie2o0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171796000"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 18 Aug 2025 06:14:18 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unzgm-00015f-1k;
	Mon, 18 Aug 2025 13:14:16 +0000
Date: Mon, 18 Aug 2025 15:14:15 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] fs/xfs/libxfs/xfs_alloc.c:102:1:
 warning: no previous prototype for function 'xfs_ag_fixup_aside'
Message-ID: <202508181555.TtWAnl9S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: 8c6e9756375dff2e96d3b598992b2f0e8b3682ee [2687/2687] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: x86_64-buildonly-randconfig-2004-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181555.TtWAnl9S-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181555.TtWAnl9S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181555.TtWAnl9S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/libxfs/xfs_alloc.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:24:
   In file included from fs/xfs/kmem.h:11:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/xfs/libxfs/xfs_alloc.c:102:1: warning: no previous prototype for function 'xfs_ag_fixup_aside' [-Wmissing-prototypes]
     102 | xfs_ag_fixup_aside(
         | ^
   fs/xfs/libxfs/xfs_alloc.c:101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     101 | xfs_extlen_t
         | ^
         | static 
   2 warnings generated.


vim +/xfs_ag_fixup_aside +102 fs/xfs/libxfs/xfs_alloc.c

   > 6	#include "xfs.h"
     7	#include "xfs_fs.h"
     8	#include "xfs_format.h"
     9	#include "xfs_log_format.h"
    10	#include "xfs_shared.h"
    11	#include "xfs_trans_resv.h"
    12	#include "xfs_bit.h"
    13	#include "xfs_mount.h"
    14	#include "xfs_defer.h"
    15	#include "xfs_btree.h"
    16	#include "xfs_rmap.h"
    17	#include "xfs_alloc_btree.h"
    18	#include "xfs_alloc.h"
    19	#include "xfs_extent_busy.h"
    20	#include "xfs_errortag.h"
    21	#include "xfs_error.h"
    22	#include "xfs_trace.h"
    23	#include "xfs_trans.h"
    24	#include "xfs_buf_item.h"
    25	#include "xfs_log.h"
    26	#include "xfs_ag.h"
    27	#include "xfs_ag_resv.h"
    28	#include "xfs_bmap.h"
    29	
    30	struct kmem_cache	*xfs_extfree_item_cache;
    31	
    32	struct workqueue_struct *xfs_alloc_wq;
    33	
    34	#define XFS_ABSDIFF(a,b)	(((a) <= (b)) ? ((b) - (a)) : ((a) - (b)))
    35	
    36	#define	XFSA_FIXUP_BNO_OK	1
    37	#define	XFSA_FIXUP_CNT_OK	2
    38	
    39	/*
    40	 * Size of the AGFL.  For CRC-enabled filesystes we steal a couple of slots in
    41	 * the beginning of the block for a proper header with the location information
    42	 * and CRC.
    43	 */
    44	unsigned int
    45	xfs_agfl_size(
    46		struct xfs_mount	*mp)
    47	{
    48		unsigned int		size = mp->m_sb.sb_sectsize;
    49	
    50		if (xfs_has_crc(mp))
    51			size -= sizeof(struct xfs_agfl);
    52	
    53		return size / sizeof(xfs_agblock_t);
    54	}
    55	
    56	unsigned int
    57	xfs_refc_block(
    58		struct xfs_mount	*mp)
    59	{
    60		if (xfs_has_rmapbt(mp))
    61			return XFS_RMAP_BLOCK(mp) + 1;
    62		if (xfs_has_finobt(mp))
    63			return XFS_FIBT_BLOCK(mp) + 1;
    64		return XFS_IBT_BLOCK(mp) + 1;
    65	}
    66	
    67	xfs_extlen_t
    68	xfs_prealloc_blocks(
    69		struct xfs_mount	*mp)
    70	{
    71		if (xfs_has_reflink(mp))
    72			return xfs_refc_block(mp) + 1;
    73		if (xfs_has_rmapbt(mp))
    74			return XFS_RMAP_BLOCK(mp) + 1;
    75		if (xfs_has_finobt(mp))
    76			return XFS_FIBT_BLOCK(mp) + 1;
    77		return XFS_IBT_BLOCK(mp) + 1;
    78	}
    79	
    80	/*
    81	 * The number of blocks per AG that we withhold from xfs_mod_fdblocks to
    82	 * guarantee that we can refill the AGFL prior to allocating space in a nearly
    83	 * full AG.  Although the space described by the free space btrees, the
    84	 * blocks used by the freesp btrees themselves, and the blocks owned by the
    85	 * AGFL are counted in the ondisk fdblocks, it's a mistake to let the ondisk
    86	 * free space in the AG drop so low that the free space btrees cannot refill an
    87	 * empty AGFL up to the minimum level.  Rather than grind through empty AGs
    88	 * until the fs goes down, we subtract this many AG blocks from the incore
    89	 * fdblocks to ensure user allocation does not overcommit the space the
    90	 * filesystem needs for the AGFLs.  The rmap btree uses a per-AG reservation to
    91	 * withhold space from xfs_mod_fdblocks, so we do not account for that here.
    92	 */
    93	#define XFS_ALLOCBT_AGFL_RESERVE	4
    94	
    95	/*
    96	 * Twice fixup for the same ag may happen within exact one tp, and the consume
    97	 * of agfl after first fixup may trigger second fixup's failure, then xfs will
    98	 * shutdown. To avoid that, we reserve blocks which can satisfy the second
    99	 * fixup.
   100	 */
   101	xfs_extlen_t
 > 102	xfs_ag_fixup_aside(
   103			struct xfs_mount	*mp)
   104	{
   105		xfs_extlen_t ret;
   106	
   107		ret = 2 * mp->m_alloc_maxlevels;
   108		if (xfs_has_rmapbt(mp))
   109			ret += mp->m_rmap_maxlevels;
   110	
   111		return ret;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
