Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAB3130E27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 22:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733004830; cv=none; b=AZWjC7CTj2yk/nLF11e3W9s2fsdY2s2QgStUZ5NFqDRALEP0x5/BXFF8RqCQw8U6Bddngjw6kYPlACoIoVh31XFIt9lJjchVj5FBQdnSDcVbs4ML8w+ZafaqBhyFuTWfMrqpgCFE7g6wDHgLwqnr9GCWqLNh/ZQ1JER/j/keN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733004830; c=relaxed/simple;
	bh=hh3A0HyGRJvAz3+hE40q/IirmoAGcrkAOwu1Surco2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdlCcsxqICGkfIUtRYzEWPv8/k87V7CPCFeqUlZ+akRJPfwaYLIapBr71waxtJNeXcXVYaGdeFKn+ByaLiMmHEwFSjwUVC+AByJ17tapf5KISRU7tim6VElJnp4vThzqkEQKs3GbADEmzrJuU/TW8F+FgrQICXs/6WtxuPQ/UJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNM5ZvP3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNM5ZvP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733004828; x=1764540828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hh3A0HyGRJvAz3+hE40q/IirmoAGcrkAOwu1Surco2s=;
  b=UNM5ZvP3UyEVbnEVpb/9W7sWEevzu7krZ/hkxA/sERdKw8s0fr+8BzJj
   6j2Ve+y9ITKg5Pn/vCJBlxGSHv4oZhIqPf7kPwyuLPwKmKqFLo5jMC0cL
   o8rAVJZdjwBEcghpSHXestyU8Ol1qGv87r2qS1zGqCjyANE1El9/V54iW
   p843O7ZrGGRW8INkGXhNL5aW7LArfcQQBhm4Dg5pgBZv2uTBQpNRDTR+A
   RvGUErwN4FxY1DC6XcoV9E/3EfUZlLN+gb6DkXCCK5HGP305lgYaZ8h9t
   EqSZR/5mkhbDunSWCaER0Ka+ByLDKIEnDUFh305SHcHgqVwyFgMKbbgcx
   w==;
X-CSE-ConnectionGUID: 8zUJClvURDeoPDrfEPAFVg==
X-CSE-MsgGUID: M8+08NftRsG2Jxolt8/VHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33064626"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33064626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 14:13:47 -0800
X-CSE-ConnectionGUID: juiPgkrMQmKfRrwGBi6Arw==
X-CSE-MsgGUID: Ao1kMTX5QSagHRtV5MWhbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="96827284"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Nov 2024 14:13:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHViY-00010P-0c;
	Sat, 30 Nov 2024 22:13:36 +0000
Date: Sun, 1 Dec 2024 06:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 32/60] fs/xfs/libxfs/xfs_ondisk.h:237:2:
 error: static assertion failed due to requirement 'sizeof(struct xfs_sb) ==
 (304)': XFS: sizeof(struct xfs_sb) is wrong, expected 304
Message-ID: <202412010649.5BP36jIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   8fb504f7b6ec8beb58bdf61b3fba4430fedea3ba
commit: af01ccf04b7770a2fa41026d3037ac372b88f8a2 [32/60] xfs: define the zoned on-disk format
config: i386-buildonly-randconfig-002-20241201 (https://download.01.org/0day-ci/archive/20241201/202412010649.5BP36jIB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010649.5BP36jIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010649.5BP36jIB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_super.c:7:
   In file included from fs/xfs/xfs.h:26:
   In file included from fs/xfs/xfs_linux.h:25:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/xfs/xfs_super.c:33:
>> fs/xfs/libxfs/xfs_ondisk.h:237:2: error: static assertion failed due to requirement 'sizeof(struct xfs_sb) == (304)': XFS: sizeof(struct xfs_sb) is wrong, expected 304
     237 |         XFS_CHECK_STRUCT_SIZE(struct xfs_sb,            304);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:16: note: expanded from macro 'XFS_CHECK_STRUCT_SIZE'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      11 |                 "XFS: sizeof(" #structname ") is wrong, expected " #size)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   fs/xfs/libxfs/xfs_ondisk.h:237:2: note: expression evaluates to '300 == 304'
     237 |         XFS_CHECK_STRUCT_SIZE(struct xfs_sb,            304);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_ondisk.h:10:35: note: expanded from macro 'XFS_CHECK_STRUCT_SIZE'
      10 |         static_assert(sizeof(structname) == (size), \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
      11 |                 "XFS: sizeof(" #structname ") is wrong, expected " #size)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 warning and 1 error generated.


vim +237 fs/xfs/libxfs/xfs_ondisk.h

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
    22	#define XFS_CHECK_SB_OFFSET(field, offset) \
    23		XFS_CHECK_OFFSET(struct xfs_dsb, field, offset); \
    24		XFS_CHECK_OFFSET(struct xfs_sb, field, offset);
    25	
    26	static inline void __init
    27	xfs_check_ondisk_structs(void)
    28	{
    29		/* file structures */
    30		XFS_CHECK_STRUCT_SIZE(struct xfs_acl,			4);
    31		XFS_CHECK_STRUCT_SIZE(struct xfs_acl_entry,		12);
    32		XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_key,		8);
    33		XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_rec,		16);
    34		XFS_CHECK_STRUCT_SIZE(struct xfs_bmdr_block,		4);
    35		XFS_CHECK_STRUCT_SIZE(struct xfs_dinode,		176);
    36		XFS_CHECK_STRUCT_SIZE(struct xfs_disk_dquot,		104);
    37		XFS_CHECK_STRUCT_SIZE(struct xfs_dqblk,			136);
    38		XFS_CHECK_STRUCT_SIZE(struct xfs_dsymlink_hdr,		56);
    39		XFS_CHECK_STRUCT_SIZE(xfs_timestamp_t,			8);
    40		XFS_CHECK_STRUCT_SIZE(struct xfs_legacy_timestamp,	8);
    41	
    42		/* space btrees */
    43		XFS_CHECK_STRUCT_SIZE(struct xfs_agf,			224);
    44		XFS_CHECK_STRUCT_SIZE(struct xfs_agfl,			36);
    45		XFS_CHECK_STRUCT_SIZE(struct xfs_agi,			344);
    46		XFS_CHECK_STRUCT_SIZE(struct xfs_alloc_rec,		8);
    47		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block,		72);
    48		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_lhdr,	64);
    49		XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_shdr,	48);
    50		XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_key,		4);
    51		XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_rec,		16);
    52		XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_key,		4);
    53		XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_rec,		12);
    54		XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_key,		20);
    55		XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_rec,		24);
    56		XFS_CHECK_STRUCT_SIZE(xfs_alloc_key_t,			8);
    57		XFS_CHECK_STRUCT_SIZE(xfs_alloc_ptr_t,			4);
    58		XFS_CHECK_STRUCT_SIZE(xfs_inobt_ptr_t,			4);
    59		XFS_CHECK_STRUCT_SIZE(xfs_refcount_ptr_t,		4);
    60		XFS_CHECK_STRUCT_SIZE(xfs_rmap_ptr_t,			4);
    61		XFS_CHECK_STRUCT_SIZE(xfs_bmdr_key_t,			8);
    62	
    63		/* dir/attr trees */
    64		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leaf_hdr,	80);
    65		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leafblock,	80);
    66		XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_rmt_hdr,		56);
    67		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_blkinfo,		56);
    68		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_intnode,		64);
    69		XFS_CHECK_STRUCT_SIZE(struct xfs_da3_node_hdr,		64);
    70		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_blk_hdr,		48);
    71		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_data_hdr,		64);
    72		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free,		64);
    73		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free_hdr,		64);
    74		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf,		64);
    75		XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf_hdr,		64);
    76		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_leaf_entry,		8);
    77		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_leaf_hdr,		32);
    78		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_leaf_map,		4);
    79		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_leaf_name_local,	4);
    80	
    81		/* realtime structures */
    82		XFS_CHECK_STRUCT_SIZE(struct xfs_rtsb,			56);
    83		XFS_CHECK_STRUCT_SIZE(union xfs_rtword_raw,		4);
    84		XFS_CHECK_STRUCT_SIZE(union xfs_suminfo_raw,		4);
    85		XFS_CHECK_STRUCT_SIZE(struct xfs_rtbuf_blkinfo,		48);
    86		XFS_CHECK_STRUCT_SIZE(xfs_rtrmap_ptr_t,			8);
    87		XFS_CHECK_STRUCT_SIZE(struct xfs_rtrmap_root,		4);
    88		XFS_CHECK_STRUCT_SIZE(xfs_rtrefcount_ptr_t,		8);
    89		XFS_CHECK_STRUCT_SIZE(struct xfs_rtrefcount_root,	4);
    90	
    91		/*
    92		 * m68k has problems with struct xfs_attr_leaf_name_remote, but we pad
    93		 * it to 4 bytes anyway so it's not obviously a problem.  Hence for the
    94		 * moment we don't check this structure. This can be re-instated when
    95		 * the attr definitions are updated to use c99 VLA definitions.
    96		 *
    97		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_leaf_name_remote,	12);
    98		 */
    99	
   100		XFS_CHECK_OFFSET(struct xfs_attr_leaf_name_local, valuelen,	0);
   101		XFS_CHECK_OFFSET(struct xfs_attr_leaf_name_local, namelen,	2);
   102		XFS_CHECK_OFFSET(struct xfs_attr_leaf_name_local, nameval,	3);
   103		XFS_CHECK_OFFSET(struct xfs_attr_leaf_name_remote, valueblk,	0);
   104		XFS_CHECK_OFFSET(struct xfs_attr_leaf_name_remote, valuelen,	4);
   105		XFS_CHECK_OFFSET(struct xfs_attr_leaf_name_remote, namelen,	8);
   106		XFS_CHECK_OFFSET(struct xfs_attr_leaf_name_remote, name,	9);
   107		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_leafblock,		32);
   108		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_hdr,		4);
   109		XFS_CHECK_OFFSET(struct xfs_attr_sf_hdr, totsize,	0);
   110		XFS_CHECK_OFFSET(struct xfs_attr_sf_hdr, count,		2);
   111		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, namelen,	0);
   112		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, valuelen,	1);
   113		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, flags,	2);
   114		XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, nameval,	3);
   115		XFS_CHECK_STRUCT_SIZE(struct xfs_da_blkinfo,		12);
   116		XFS_CHECK_STRUCT_SIZE(struct xfs_da_intnode,		16);
   117		XFS_CHECK_STRUCT_SIZE(struct xfs_da_node_entry,		8);
   118		XFS_CHECK_STRUCT_SIZE(struct xfs_da_node_hdr,		16);
   119		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_free,		4);
   120		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_hdr,		16);
   121		XFS_CHECK_OFFSET(struct xfs_dir2_data_unused, freetag,	0);
   122		XFS_CHECK_OFFSET(struct xfs_dir2_data_unused, length,	2);
   123		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_free_hdr,		16);
   124		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_free,		16);
   125		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf_entry,	8);
   126		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf_hdr,		16);
   127		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf,		16);
   128		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf_tail,	4);
   129		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_sf_entry,		3);
   130		XFS_CHECK_OFFSET(struct xfs_dir2_sf_entry, namelen,	0);
   131		XFS_CHECK_OFFSET(struct xfs_dir2_sf_entry, offset,	1);
   132		XFS_CHECK_OFFSET(struct xfs_dir2_sf_entry, name,	3);
   133		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_sf_hdr,		10);
   134		XFS_CHECK_STRUCT_SIZE(struct xfs_parent_rec,		12);
   135	
   136		/* ondisk dir/attr structures from xfs/122 */
   137		XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_entry,		3);
   138		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_free,	4);
   139		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_hdr,		16);
   140		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_data_unused,	6);
   141		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_free,		16);
   142		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_free_hdr,		16);
   143		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf,		16);
   144		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf_entry,	8);
   145		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf_hdr,		16);
   146		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_leaf_tail,	4);
   147		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_sf_entry,		3);
   148		XFS_CHECK_STRUCT_SIZE(struct xfs_dir2_sf_hdr,		10);
   149	
   150		/* log structures */
   151		XFS_CHECK_STRUCT_SIZE(struct xfs_buf_log_format,	88);
   152		XFS_CHECK_STRUCT_SIZE(struct xfs_dq_logformat,		24);
   153		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_32,	16);
   154		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_64,	16);
   155		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_32,	16);
   156		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_64,	16);
   157		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_32,		12);
   158		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_64,		16);
   159		XFS_CHECK_STRUCT_SIZE(struct xfs_log_dinode,		176);
   160		XFS_CHECK_STRUCT_SIZE(struct xfs_icreate_log,		28);
   161		XFS_CHECK_STRUCT_SIZE(xfs_log_timestamp_t,		8);
   162		XFS_CHECK_STRUCT_SIZE(struct xfs_log_legacy_timestamp,	8);
   163		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format_32,	52);
   164		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format,	56);
   165		XFS_CHECK_STRUCT_SIZE(struct xfs_qoff_logformat,	20);
   166		XFS_CHECK_STRUCT_SIZE(struct xfs_trans_header,		16);
   167		XFS_CHECK_STRUCT_SIZE(struct xfs_attri_log_format,	40);
   168		XFS_CHECK_STRUCT_SIZE(struct xfs_attrd_log_format,	16);
   169		XFS_CHECK_STRUCT_SIZE(struct xfs_bui_log_format,	16);
   170		XFS_CHECK_STRUCT_SIZE(struct xfs_bud_log_format,	16);
   171		XFS_CHECK_STRUCT_SIZE(struct xfs_cui_log_format,	16);
   172		XFS_CHECK_STRUCT_SIZE(struct xfs_cud_log_format,	16);
   173		XFS_CHECK_STRUCT_SIZE(struct xfs_rui_log_format,	16);
   174		XFS_CHECK_STRUCT_SIZE(struct xfs_rud_log_format,	16);
   175		XFS_CHECK_STRUCT_SIZE(struct xfs_map_extent,		32);
   176		XFS_CHECK_STRUCT_SIZE(struct xfs_phys_extent,		16);
   177	
   178		XFS_CHECK_OFFSET(struct xfs_bui_log_format, bui_extents,	16);
   179		XFS_CHECK_OFFSET(struct xfs_cui_log_format, cui_extents,	16);
   180		XFS_CHECK_OFFSET(struct xfs_rui_log_format, rui_extents,	16);
   181		XFS_CHECK_OFFSET(struct xfs_efi_log_format, efi_extents,	16);
   182		XFS_CHECK_OFFSET(struct xfs_efi_log_format_32, efi_extents,	16);
   183		XFS_CHECK_OFFSET(struct xfs_efi_log_format_64, efi_extents,	16);
   184	
   185		/* ondisk log structures from xfs/122 */
   186		XFS_CHECK_STRUCT_SIZE(struct xfs_unmount_log_format,		8);
   187		XFS_CHECK_STRUCT_SIZE(struct xfs_xmd_log_format,		16);
   188		XFS_CHECK_STRUCT_SIZE(struct xfs_xmi_log_format,		88);
   189	
   190		/* parent pointer ioctls */
   191		XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_rec,	32);
   192		XFS_CHECK_STRUCT_SIZE(struct xfs_getparents,		40);
   193		XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_by_handle,	64);
   194	
   195		/*
   196		 * The v5 superblock format extended several v4 header structures with
   197		 * additional data. While new fields are only accessible on v5
   198		 * superblocks, it's important that the v5 structures place original v4
   199		 * fields/headers in the correct location on-disk. For example, we must
   200		 * be able to find magic values at the same location in certain blocks
   201		 * regardless of superblock version.
   202		 *
   203		 * The following checks ensure that various v5 data structures place the
   204		 * subset of v4 metadata associated with the same type of block at the
   205		 * start of the on-disk block. If there is no data structure definition
   206		 * for certain types of v4 blocks, traverse down to the first field of
   207		 * common metadata (e.g., magic value) and make sure it is at offset
   208		 * zero.
   209		 */
   210		XFS_CHECK_OFFSET(struct xfs_dir3_leaf, hdr.info.hdr,	0);
   211		XFS_CHECK_OFFSET(struct xfs_da3_intnode, hdr.info.hdr,	0);
   212		XFS_CHECK_OFFSET(struct xfs_dir3_data_hdr, hdr.magic,	0);
   213		XFS_CHECK_OFFSET(struct xfs_dir3_free, hdr.hdr.magic,	0);
   214		XFS_CHECK_OFFSET(struct xfs_attr3_leafblock, hdr.info.hdr, 0);
   215	
   216		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat,		192);
   217		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers,		24);
   218		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat_req,		64);
   219		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers_req,		64);
   220	
   221		/*
   222		 * Make sure the incore inode timestamp range corresponds to hand
   223		 * converted values based on the ondisk format specification.
   224		 */
   225		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MIN - XFS_BIGTIME_EPOCH_OFFSET,
   226				XFS_LEGACY_TIME_MIN);
   227		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MAX - XFS_BIGTIME_EPOCH_OFFSET,
   228				16299260424LL);
   229	
   230		/* Do the same with the incore quota expiration range. */
   231		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MIN << XFS_DQ_BIGTIME_SHIFT, 4);
   232		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MAX << XFS_DQ_BIGTIME_SHIFT,
   233				16299260424LL);
   234	
   235		/* superblock field checks we got from xfs/122 */
   236		XFS_CHECK_STRUCT_SIZE(struct xfs_dsb,		304);
 > 237		XFS_CHECK_STRUCT_SIZE(struct xfs_sb,		304);
   238		XFS_CHECK_SB_OFFSET(sb_magicnum,		0);
   239		XFS_CHECK_SB_OFFSET(sb_blocksize,		4);
   240		XFS_CHECK_SB_OFFSET(sb_dblocks,			8);
   241		XFS_CHECK_SB_OFFSET(sb_rblocks,			16);
   242		XFS_CHECK_SB_OFFSET(sb_rextents,		24);
   243		XFS_CHECK_SB_OFFSET(sb_uuid,			32);
   244		XFS_CHECK_SB_OFFSET(sb_logstart,		48);
   245		XFS_CHECK_SB_OFFSET(sb_rootino,			56);
   246		XFS_CHECK_SB_OFFSET(sb_rbmino,			64);
   247		XFS_CHECK_SB_OFFSET(sb_rsumino,			72);
   248		XFS_CHECK_SB_OFFSET(sb_rextsize,		80);
   249		XFS_CHECK_SB_OFFSET(sb_agblocks,		84);
   250		XFS_CHECK_SB_OFFSET(sb_agcount,			88);
   251		XFS_CHECK_SB_OFFSET(sb_rbmblocks,		92);
   252		XFS_CHECK_SB_OFFSET(sb_logblocks,		96);
   253		XFS_CHECK_SB_OFFSET(sb_versionnum,		100);
   254		XFS_CHECK_SB_OFFSET(sb_sectsize,		102);
   255		XFS_CHECK_SB_OFFSET(sb_inodesize,		104);
   256		XFS_CHECK_SB_OFFSET(sb_inopblock,		106);
   257		XFS_CHECK_SB_OFFSET(sb_blocklog,		120);
   258		XFS_CHECK_SB_OFFSET(sb_fname[12],		120);
   259		XFS_CHECK_SB_OFFSET(sb_sectlog,			121);
   260		XFS_CHECK_SB_OFFSET(sb_inodelog,		122);
   261		XFS_CHECK_SB_OFFSET(sb_inopblog,		123);
   262		XFS_CHECK_SB_OFFSET(sb_agblklog,		124);
   263		XFS_CHECK_SB_OFFSET(sb_rextslog,		125);
   264		XFS_CHECK_SB_OFFSET(sb_inprogress,		126);
   265		XFS_CHECK_SB_OFFSET(sb_imax_pct,		127);
   266		XFS_CHECK_SB_OFFSET(sb_icount,			128);
   267		XFS_CHECK_SB_OFFSET(sb_ifree,			136);
   268		XFS_CHECK_SB_OFFSET(sb_fdblocks,		144);
   269		XFS_CHECK_SB_OFFSET(sb_frextents,		152);
   270		XFS_CHECK_SB_OFFSET(sb_uquotino,		160);
   271		XFS_CHECK_SB_OFFSET(sb_gquotino,		168);
   272		XFS_CHECK_SB_OFFSET(sb_qflags,			176);
   273		XFS_CHECK_SB_OFFSET(sb_flags,			178);
   274		XFS_CHECK_SB_OFFSET(sb_shared_vn,		179);
   275		XFS_CHECK_SB_OFFSET(sb_inoalignmt,		180);
   276		XFS_CHECK_SB_OFFSET(sb_unit,			184);
   277		XFS_CHECK_SB_OFFSET(sb_width,			188);
   278		XFS_CHECK_SB_OFFSET(sb_dirblklog,		192);
   279		XFS_CHECK_SB_OFFSET(sb_logsectlog,		193);
   280		XFS_CHECK_SB_OFFSET(sb_logsectsize,		194);
   281		XFS_CHECK_SB_OFFSET(sb_logsunit,		196);
   282		XFS_CHECK_SB_OFFSET(sb_features2,		200);
   283		XFS_CHECK_SB_OFFSET(sb_bad_features2,		204);
   284		XFS_CHECK_SB_OFFSET(sb_features_compat,		208);
   285		XFS_CHECK_SB_OFFSET(sb_features_ro_compat,	212);
   286		XFS_CHECK_SB_OFFSET(sb_features_incompat,	216);
   287		XFS_CHECK_SB_OFFSET(sb_features_log_incompat,	220);
   288		XFS_CHECK_SB_OFFSET(sb_crc,			224);
   289		XFS_CHECK_SB_OFFSET(sb_spino_align,		228);
   290		XFS_CHECK_SB_OFFSET(sb_pquotino,		232);
   291		XFS_CHECK_SB_OFFSET(sb_lsn,			240);
   292		XFS_CHECK_SB_OFFSET(sb_meta_uuid,		248);
   293		XFS_CHECK_SB_OFFSET(sb_metadirino,		264);
   294		XFS_CHECK_SB_OFFSET(sb_rgcount,			272);
   295		XFS_CHECK_SB_OFFSET(sb_rgextents,		276);
   296		XFS_CHECK_SB_OFFSET(sb_rgblklog,		280);
   297		XFS_CHECK_SB_OFFSET(sb_pad,			281);
   298		XFS_CHECK_SB_OFFSET(sb_rtstart,			288);
   299		XFS_CHECK_SB_OFFSET(sb_rtreserved,		296);
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
