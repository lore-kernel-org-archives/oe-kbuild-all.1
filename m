Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D5E84D05
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713258969; cv=none; b=vB9mb2m9Tl6IO8Or0PAFMzx9q9Z1aF8B5ksT6b5/8y6CRvXXS+GlWadtzJU14tenDgHlAnAjeNHNvLBt+DiRwaQ/gcNYJrMz9sBesoPACdWGqvvWITHgDp/HCAOWPeHiIpTNFWo7fy0UgPFgQP1S0K7BxDp4k5SJclZ+ZmqvKY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713258969; c=relaxed/simple;
	bh=KwzEwwTFDuKhDhX+ZbKiyuPoShQjfW27zUMCCvuVXk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UOmmCR8MNUCPpPaj9df0MG1CsnKCIdbNHeh/kgP2StRkqrGTZ9V7XEjzkG/9nTzXyIYlJJgKb6ZOIrHd7uTNFpkYC8ec1/d0mjZBjozuvQPo1qBzy6vooNS7Y5z7jz3khOetmDxaNmtQ3XPt0YcB4dx5VUL0AocKHjU2BsM7vdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWcs1m4g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWcs1m4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713258968; x=1744794968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KwzEwwTFDuKhDhX+ZbKiyuPoShQjfW27zUMCCvuVXk0=;
  b=fWcs1m4gaWQW3T74zNXsDRjebaj+wyDAPP3dTHnfYIA+APaV/XIWowlc
   gHLCYvXgRdTCser/neXrFu6wQm86vMq+wOMAfMnLcm1IXNkpLizn0nx+F
   ZSRvFvIfybgKac176hZTI1DdRCEe4BjOElOfJMyFb4qJkGI5PV7U301Fi
   MEH2h+PeNW9JQBs0UWVaZEH2HuAMU+cB2VJzGfI6Bd5UxTJtjEr09YFsW
   oQLy0ZgNRx0s1uaM0vnpf2wOIp3Vq0MtShtQ/bkKpOqLXJQReBIJ1w2+W
   jOOkMfh82Ew/LhpRIb6Rgy3zjK9GqUyWMuvU+Md9jxKX1NfODdmQoJA9F
   g==;
X-CSE-ConnectionGUID: tMMl5P2YSpuWV8qBSpxQQg==
X-CSE-MsgGUID: AJEOSuT/SsKQxQqTd3i3Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20075423"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="20075423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 02:16:07 -0700
X-CSE-ConnectionGUID: /I8qjGxFQi20KwHD0C7ogA==
X-CSE-MsgGUID: /QhfnFWHTAGxBv2if/WW/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26616270"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2024 02:16:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwev5-00056O-20;
	Tue, 16 Apr 2024 09:16:03 +0000
Date: Tue, 16 Apr 2024 17:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 129/166]
 fs/xfs/libxfs/xfs_ondisk.h:160:2: error: static assertion failed due to
 requirement 'sizeof(struct xfs_getparents_rec) == (32)': XFS: sizeof(struct
 xfs_getparents_rec) is wrong, expected 32
Message-ID: <202404161748.Z9IrW503-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   a159a21af843928afe8939fac8d4b1b39c7175fe
commit: 089563f47fb3f09f9be77031a856cd502108dca7 [129/166] xfs: add parent pointer ioctls
config: i386-buildonly-randconfig-003-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161748.Z9IrW503-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161748.Z9IrW503-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161748.Z9IrW503-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/xfs/xfs_super.c:33:
>> fs/xfs/libxfs/xfs_ondisk.h:160:2: error: static assertion failed due to requirement 'sizeof(struct xfs_getparents_rec) == (32)': XFS: sizeof(struct xfs_getparents_rec) is wrong, expected 32
     160 |         XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_rec,        32);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   fs/xfs/libxfs/xfs_ondisk.h:160:2: note: expression evaluates to '28 == 32'
     160 |         XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_rec,        32);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 error generated.


vim +160 fs/xfs/libxfs/xfs_ondisk.h

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
   122		XFS_CHECK_STRUCT_SIZE(struct xfs_parent_rec,		12);
   123	
   124		/* log structures */
   125		XFS_CHECK_STRUCT_SIZE(struct xfs_buf_log_format,	88);
   126		XFS_CHECK_STRUCT_SIZE(struct xfs_dq_logformat,		24);
   127		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_32,	16);
   128		XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_64,	16);
   129		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_32,	16);
   130		XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_64,	16);
   131		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_32,		12);
   132		XFS_CHECK_STRUCT_SIZE(struct xfs_extent_64,		16);
   133		XFS_CHECK_STRUCT_SIZE(struct xfs_log_dinode,		176);
   134		XFS_CHECK_STRUCT_SIZE(struct xfs_icreate_log,		28);
   135		XFS_CHECK_STRUCT_SIZE(xfs_log_timestamp_t,		8);
   136		XFS_CHECK_STRUCT_SIZE(struct xfs_log_legacy_timestamp,	8);
   137		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format_32,	52);
   138		XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format,	56);
   139		XFS_CHECK_STRUCT_SIZE(struct xfs_qoff_logformat,	20);
   140		XFS_CHECK_STRUCT_SIZE(struct xfs_trans_header,		16);
   141		XFS_CHECK_STRUCT_SIZE(struct xfs_attri_log_format,	40);
   142		XFS_CHECK_STRUCT_SIZE(struct xfs_attrd_log_format,	16);
   143		XFS_CHECK_STRUCT_SIZE(struct xfs_bui_log_format,	16);
   144		XFS_CHECK_STRUCT_SIZE(struct xfs_bud_log_format,	16);
   145		XFS_CHECK_STRUCT_SIZE(struct xfs_cui_log_format,	16);
   146		XFS_CHECK_STRUCT_SIZE(struct xfs_cud_log_format,	16);
   147		XFS_CHECK_STRUCT_SIZE(struct xfs_rui_log_format,	16);
   148		XFS_CHECK_STRUCT_SIZE(struct xfs_rud_log_format,	16);
   149		XFS_CHECK_STRUCT_SIZE(struct xfs_map_extent,		32);
   150		XFS_CHECK_STRUCT_SIZE(struct xfs_phys_extent,		16);
   151	
   152		XFS_CHECK_OFFSET(struct xfs_bui_log_format, bui_extents,	16);
   153		XFS_CHECK_OFFSET(struct xfs_cui_log_format, cui_extents,	16);
   154		XFS_CHECK_OFFSET(struct xfs_rui_log_format, rui_extents,	16);
   155		XFS_CHECK_OFFSET(struct xfs_efi_log_format, efi_extents,	16);
   156		XFS_CHECK_OFFSET(struct xfs_efi_log_format_32, efi_extents,	16);
   157		XFS_CHECK_OFFSET(struct xfs_efi_log_format_64, efi_extents,	16);
   158	
   159		/* parent pointer ioctls */
 > 160		XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_rec,	32);
   161		XFS_CHECK_STRUCT_SIZE(struct xfs_getparents,		40);
   162		XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_by_handle,	64);
   163	
   164		/*
   165		 * The v5 superblock format extended several v4 header structures with
   166		 * additional data. While new fields are only accessible on v5
   167		 * superblocks, it's important that the v5 structures place original v4
   168		 * fields/headers in the correct location on-disk. For example, we must
   169		 * be able to find magic values at the same location in certain blocks
   170		 * regardless of superblock version.
   171		 *
   172		 * The following checks ensure that various v5 data structures place the
   173		 * subset of v4 metadata associated with the same type of block at the
   174		 * start of the on-disk block. If there is no data structure definition
   175		 * for certain types of v4 blocks, traverse down to the first field of
   176		 * common metadata (e.g., magic value) and make sure it is at offset
   177		 * zero.
   178		 */
   179		XFS_CHECK_OFFSET(struct xfs_dir3_leaf, hdr.info.hdr,	0);
   180		XFS_CHECK_OFFSET(struct xfs_da3_intnode, hdr.info.hdr,	0);
   181		XFS_CHECK_OFFSET(struct xfs_dir3_data_hdr, hdr.magic,	0);
   182		XFS_CHECK_OFFSET(struct xfs_dir3_free, hdr.hdr.magic,	0);
   183		XFS_CHECK_OFFSET(struct xfs_attr3_leafblock, hdr.info.hdr, 0);
   184	
   185		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat,		192);
   186		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers,		24);
   187		XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat_req,		64);
   188		XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers_req,		64);
   189	
   190		/*
   191		 * Make sure the incore inode timestamp range corresponds to hand
   192		 * converted values based on the ondisk format specification.
   193		 */
   194		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MIN - XFS_BIGTIME_EPOCH_OFFSET,
   195				XFS_LEGACY_TIME_MIN);
   196		XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MAX - XFS_BIGTIME_EPOCH_OFFSET,
   197				16299260424LL);
   198	
   199		/* Do the same with the incore quota expiration range. */
   200		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MIN << XFS_DQ_BIGTIME_SHIFT, 4);
   201		XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MAX << XFS_DQ_BIGTIME_SHIFT,
   202				16299260424LL);
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
