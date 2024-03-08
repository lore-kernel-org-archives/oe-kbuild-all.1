Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41971BDDB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887668; cv=none; b=j2xKpRUh9K1yOCl5sWIPqiafbzGqMlKZMeO1XmdU0djUctajUGt15018fVd88CMo3B/Nt76E3qP6Ks1irx/k+F3G8QUj0oi3/CiqS86Z9ewb6Ujf9vq9RmhQbg72L1/frOE1/xuc2GeB5GKeCE0/ZACRnVtq+SRCUDwnm5KFrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887668; c=relaxed/simple;
	bh=OrZg/sOcdwWTdgdz1FG6WRJduWmdI5Q/g77mQJiTKXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAxTsSuuFOatgnWhtUxUHVYk70vVVFz838ruwx5+oRK6oqBh+rY3iyiQ1yp54/ROA5VHYJENuFYq/CQ4OzOOLcl6311gZDOVFSiE7xZz6R1GRQz+asjRiLjGySyvQtT1sYYVvQasTtjrXOlOoWO0j56FIN4jDs2lCC7AhXiEloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8H/SBe0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8H/SBe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709887667; x=1741423667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrZg/sOcdwWTdgdz1FG6WRJduWmdI5Q/g77mQJiTKXM=;
  b=g8H/SBe0YlnYXMI0EB7zelBaSCUJPAlSy6lYO5tfZHf3mCQjPmucEAYT
   oFg1QQwlgPukl+bgAdKfPY3ZsDBq3HF7Iye0eydnLmYfc12JBILhmnF6R
   OQ1pQvas8Oiwv592Bpnua5YZZbRYX0Oj67wHvZh9Y1fsD9YINuVb1YUA2
   +It2gHm6nnMYDJObZS81uEGd3M+uyNhm+hef2Ifn3S6sPtyI3Vk1TO+7e
   UXzaX8LvpzbYeYz8SM8LnksNVTSn0i50LncbJLhyMUg+kFhqa+LJwaZOf
   464xMGsv4JEI/kKWuuZ6z4mSmOcEwUSyltwoO43a5oht1byq+PoGwSTcp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4737753"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4737753"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 00:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10950542"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2024 00:47:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riVtG-0006DL-1S;
	Fri, 08 Mar 2024 08:47:42 +0000
Date: Fri, 8 Mar 2024 16:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 21/37]
 fs/xfs/libxfs/xfs_ondisk.h:199:18: error: static assertion expression is not
 an integral constant expression
Message-ID: <202403081651.q1Nu9cP9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 8d4c4b96db63ef47a68c7ec47792eedf89efaff5 [21/37] xfs: add fs-verity support
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240308/202403081651.q1Nu9cP9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081651.q1Nu9cP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081651.q1Nu9cP9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_super.c:7:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/xfs/xfs_super.c:34:
>> fs/xfs/libxfs/xfs_ondisk.h:199:18: error: static assertion expression is not an integral constant expression
     199 |         XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
         |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     200 |                         XFS_VERITY_DESCRIPTOR_NAME_LEN);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:19:17: note: expanded from macro 'XFS_CHECK_VALUE'
      19 |         static_assert((value) == (expected), \
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
      20 |                 "XFS: value of " #value " is wrong, expected " #expected)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   5 warnings and 1 error generated.


vim +199 fs/xfs/libxfs/xfs_ondisk.h

     8	
     9	#define XFS_CHECK_STRUCT_SIZE(structname, size) \
    10		static_assert(sizeof(structname) == (size), \
    11			"XFS: sizeof(" #structname ") is wrong, expected " #size)
    12	
    13	#define XFS_CHECK_OFFSET(structname, member, off) \
    14		static_assert(offsetof(structname, member) == (off), \
    15			"XFS: offsetof(" #structname ", " #member ") is wrong, " \
    16			"expected " #off)
    17	
    18	#define XFS_CHECK_VALUE(value, expected) \
    19		static_assert((value) == (expected), \
    20			"XFS: value of " #value " is wrong, expected " #expected)
    21	
    22	static inline void __init
    23	xfs_check_ondisk_structs(void)
    24	{
    25		/* ag/file structures */
    26		XFS_CHECK_STRUCT_SIZE(struct xfs_acl,			4);
    27		XFS_CHECK_STRUCT_SIZE(struct xfs_acl_entry,		12);
    28		XFS_CHECK_STRUCT_SIZE(struct xfs_agf,			224);
    29		XFS_CHECK_STRUCT_SIZE(struct xfs_agfl,			36);
    30		XFS_CHECK_STRUCT_SIZE(struct xfs_agi,			344);
    31		XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_key,		8);
    32		XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_rec,		16);
    33		XFS_CHECK_STRUCT_SIZE(struct xfs_bmdr_block,		4);
    34		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_shdr,	48);
    35		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_lhdr,	64);
    36		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block,		72);
    37		XFS_CHECK_STRUCT_SIZE(struct xfs_dinode,		176);
    38		XFS_CHECK_STRUCT_SIZE(struct xfs_disk_dquot,		104);
    39		XFS_CHECK_STRUCT_SIZE(struct xfs_dqblk,			136);
    40		XFS_CHECK_STRUCT_SIZE(struct xfs_dsb,			264);
    41		XFS_CHECK_STRUCT_SIZE(struct xfs_dsymlink_hdr,		56);
    42		XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_key,		4);
    43		XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_rec,		16);
    44		XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_key,		4);
    45		XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_rec,		12);
    46		XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_key,		20);
    47		XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_rec,		24);
    48		XFS_CHECK_STRUCT_SIZE(xfs_timestamp_t,			8);
    49		XFS_CHECK_STRUCT_SIZE(struct xfs_legacy_timestamp,	8);
    50		XFS_CHECK_STRUCT_SIZE(xfs_alloc_key_t,			8);
    51		XFS_CHECK_STRUCT_SIZE(xfs_alloc_ptr_t,			4);
    52		XFS_CHECK_STRUCT_SIZE(xfs_alloc_rec_t,			8);
    53		XFS_CHECK_STRUCT_SIZE(xfs_inobt_ptr_t,			4);
    54		XFS_CHECK_STRUCT_SIZE(xfs_refcount_ptr_t,		4);
    55		XFS_CHECK_STRUCT_SIZE(xfs_rmap_ptr_t,			4);
    56	
    57		/* dir/attr trees */
    58		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leaf_hdr,	80);
    59		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leafblock,	80);
    60		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_rmt_hdr,		56);
    61		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_blkinfo,		56);
    62		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_intnode,		64);
    63		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_node_hdr,		64);
    64		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_blk_hdr,		48);
    65		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_data_hdr,		64);
    66		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free,		64);
    67		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free_hdr,		64);
    68		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf,		64);
    69		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf_hdr,		64);
    70		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_entry_t,		8);
    71		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_hdr_t,		32);
    72		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_map_t,		4);
    73		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_name_local_t,	4);
    74	
    75		/* realtime structures */
    76		XFS_CHECK_STRUCT_SIZE(union xfs_rtword_raw,		4);
    77		XFS_CHECK_STRUCT_SIZE(union xfs_suminfo_raw,		4);
    78	
    79		/*
    80		 * m68k has problems with xfs_attr_leaf_name_remote_t, but we pad it to
    81		 * 4 bytes anyway so it's not obviously a problem.  Hence for the moment
    82		 * we don't check this structure. This can be re-instated when the attr
    83		 * definitions are updated to use c99 VLA definitions.
    84		 *
    85		XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_name_remote_t,	12);
    86		 */
    87	
    88		XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, valuelen,	0);
    89		XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, namelen,	2);
    90		XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, nameval,	3);
    91		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, valueblk,	0);
    92		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, valuelen,	4);
    93		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, namelen,	8);
    94		XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, name,	9);
    95		XFS_CHECK_STRUCT_SIZE(xfs_attr_leafblock_t,		32);
    96		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_hdr,		4);
    97		XFS_CHECK_OFFSET(struct xfs_attr_sf_hdr, totsize,	0);
    98		XFS_CHECK_OFFSET(struct xfs_attr_sf_hdr, count,		2);
    99		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, namelen,	0);
   100		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, valuelen,	1);
   101		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, flags,	2);
   102		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, nameval,	3);
   103		XFS_CHECK_STRUCT_SIZE(xfs_da_blkinfo_t,			12);
   104		XFS_CHECK_STRUCT_SIZE(xfs_da_intnode_t,			16);
   105		XFS_CHECK_STRUCT_SIZE(xfs_da_node_entry_t,		8);
   106		XFS_CHECK_STRUCT_SIZE(xfs_da_node_hdr_t,		16);
   107		XFS_CHECK_STRUCT_SIZE(xfs_dir2_data_free_t,		4);
   108		XFS_CHECK_STRUCT_SIZE(xfs_dir2_data_hdr_t,		16);
   109		XFS_CHECK_OFFSET(xfs_dir2_data_unused_t, freetag,	0);
   110		XFS_CHECK_OFFSET(xfs_dir2_data_unused_t, length,	2);
   111		XFS_CHECK_STRUCT_SIZE(xfs_dir2_free_hdr_t,		16);
   112		XFS_CHECK_STRUCT_SIZE(xfs_dir2_free_t,			16);
   113		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_entry_t,		8);
   114		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_hdr_t,		16);
   115		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_t,			16);
   116		XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_tail_t,		4);
   117		XFS_CHECK_STRUCT_SIZE(xfs_dir2_sf_entry_t,		3);
   118		XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, namelen,		0);
   119		XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, offset,		1);
   120		XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, name,		3);
   121		XFS_CHECK_STRUCT_SIZE(xfs_dir2_sf_hdr_t,		10);
   122	
   123		/* log structures */
   124		XFS_CHECK_STRUCT_SIZE(struct xfs_buf_log_format,	88);
   125		XFS_CHECK_STRUCT_SIZE(struct xfs_dq_logformat,		24);
   126		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_32,	16);
   127		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_64,	16);
   128		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_32,	16);
   129		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_64,	16);
   130		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_32,		12);
   131		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_64,		16);
   132		XFS_CHECK_STRUCT_SIZE(struct xfs_log_dinode,		176);
   133		XFS_CHECK_STRUCT_SIZE(struct xfs_icreate_log,		28);
   134		XFS_CHECK_STRUCT_SIZE(xfs_log_timestamp_t,		8);
   135		XFS_CHECK_STRUCT_SIZE(struct xfs_log_legacy_timestamp,	8);
   136		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format_32,	52);
   137		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format,	56);
   138		XFS_CHECK_STRUCT_SIZE(struct xfs_qoff_logformat,	20);
   139		XFS_CHECK_STRUCT_SIZE(struct xfs_trans_header,		16);
   140		XFS_CHECK_STRUCT_SIZE(struct xfs_attri_log_format,	40);
   141		XFS_CHECK_STRUCT_SIZE(struct xfs_attrd_log_format,	16);
   142		XFS_CHECK_STRUCT_SIZE(struct xfs_bui_log_format,	16);
   143		XFS_CHECK_STRUCT_SIZE(struct xfs_bud_log_format,	16);
   144		XFS_CHECK_STRUCT_SIZE(struct xfs_cui_log_format,	16);
   145		XFS_CHECK_STRUCT_SIZE(struct xfs_cud_log_format,	16);
   146		XFS_CHECK_STRUCT_SIZE(struct xfs_rui_log_format,	16);
   147		XFS_CHECK_STRUCT_SIZE(struct xfs_rud_log_format,	16);
   148		XFS_CHECK_STRUCT_SIZE(struct xfs_map_extent,		32);
   149		XFS_CHECK_STRUCT_SIZE(struct xfs_phys_extent,		16);
   150	
   151		XFS_CHECK_OFFSET(struct xfs_bui_log_format, bui_extents,	16);
   152		XFS_CHECK_OFFSET(struct xfs_cui_log_format, cui_extents,	16);
   153		XFS_CHECK_OFFSET(struct xfs_rui_log_format, rui_extents,	16);
   154		XFS_CHECK_OFFSET(struct xfs_efi_log_format, efi_extents,	16);
   155		XFS_CHECK_OFFSET(struct xfs_efi_log_format_32, efi_extents,	16);
   156		XFS_CHECK_OFFSET(struct xfs_efi_log_format_64, efi_extents,	16);
   157	
   158		/*
   159		 * The v5 superblock format extended several v4 header structures with
   160		 * additional data. While new fields are only accessible on v5
   161		 * superblocks, it's important that the v5 structures place original v4
   162		 * fields/headers in the correct location on-disk. For example, we must
   163		 * be able to find magic values at the same location in certain blocks
   164		 * regardless of superblock version.
   165		 *
   166		 * The following checks ensure that various v5 data structures place the
   167		 * subset of v4 metadata associated with the same type of block at the
   168		 * start of the on-disk block. If there is no data structure definition
   169		 * for certain types of v4 blocks, traverse down to the first field of
   170		 * common metadata (e.g., magic value) and make sure it is at offset
   171		 * zero.
   172		 */
   173		XFS_CHECK_OFFSET(struct xfs_dir3_leaf, hdr.info.hdr,	0);
   174		XFS_CHECK_OFFSET(struct xfs_da3_intnode, hdr.info.hdr,	0);
   175		XFS_CHECK_OFFSET(struct xfs_dir3_data_hdr, hdr.magic,	0);
   176		XFS_CHECK_OFFSET(struct xfs_dir3_free, hdr.hdr.magic,	0);
   177		XFS_CHECK_OFFSET(struct xfs_attr3_leafblock, hdr.info.hdr, 0);
   178	
   179		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat,		192);
   180		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers,		24);
   181		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat_req,		64);
   182		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers_req,		64);
   183	
   184		/*
   185		 * Make sure the incore inode timestamp range corresponds to hand
   186		 * converted values based on the ondisk format specification.
   187		 */
   188		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MIN - XFS_BIGTIME_EPOCH_OFFSET,
   189				XFS_LEGACY_TIME_MIN);
   190		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MAX - XFS_BIGTIME_EPOCH_OFFSET,
   191				16299260424LL);
   192	
   193		/* Do the same with the incore quota expiration range. */
   194		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MIN << XFS_DQ_BIGTIME_SHIFT, 4);
   195		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MAX << XFS_DQ_BIGTIME_SHIFT,
   196				16299260424LL);
   197	
   198		/* fs-verity descriptor xattr name */
 > 199		XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
   200				XFS_VERITY_DESCRIPTOR_NAME_LEN);
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
