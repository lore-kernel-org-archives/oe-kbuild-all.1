Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A63A1A2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 02:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709259909; cv=none; b=TFJk1yfyhAOYQ5izk3u0ji44+FYQBpx3fjpWxhQCsknejT0tu3HyWdKGjhAzjtNCn7xOsB6fO7SPuCJkgLKzY3NigNNvWPB72oATq9GpVm+N3d59yWe5SEp16b94ZOJllN1CIuiXnwDwKAn+2Vm+Bd+FGWR9ziqpdeYB6mcRlfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709259909; c=relaxed/simple;
	bh=5FtvapvKroPzwQjR3dHuVf3qnTIhl+AzKQhpC6vNzmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pruqpp+YJAOos1IArPrPILrVVQXG1BBm8OzbjH0uC8ZTdRaFF6ryLfQmmupe5Ffexe6SPffis0gSONq1ufFATVs556R5RoPm0qXKgl+ILk+kF0ZXlxAAnD2fVPaCTYpXOWsqzWLKDMjse7kcDcMYT7J4eF4NA99R63Zk2F3GXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lvh03jv9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lvh03jv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709259907; x=1740795907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5FtvapvKroPzwQjR3dHuVf3qnTIhl+AzKQhpC6vNzmQ=;
  b=Lvh03jv9xPfAWXqGGkHafvij/LNfXD4ZjwEKsSgWIsx9AZ2A36EiMMEI
   ZnuvnvJ/i1JJNZURcvnGweIQZd/UHK6WBU9ZbWxKEF6Nd0BFdQuL8VAH0
   IWdyglySmQIVvKddfdnvx2PV2J9Egv3OTsnex6gPbD3P44LJaKfwi8jOu
   kLnMGL4vZS/J4ce3NYaZ+fvaWe+LATphieXBwaCoH2pONU+IaFZsh69DJ
   FrMupa6Vjus36FuuhHwZU9Feviq2QcnYnRTt//t5C83wuweEL6Lwttka4
   lAdaQsi9CkN/BIQRtNuzKs+GyN90UBHXWZ/diRFrYQVWUuMNs3pxj/V1m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21320967"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="21320967"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 18:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8172566"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Feb 2024 18:25:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfsa2-000DTK-2z;
	Fri, 01 Mar 2024 02:25:01 +0000
Date: Fri, 1 Mar 2024 10:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2] fs/btrfs/extent_io.c:1003:25:
 error: label 'out' used but not defined
Message-ID: <202403011035.aklOMwGJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   0a84521f08563ca390596baeb35dbe53018b502d
commit: 982031a7a2c868aa28f34250596679cd5bbc5a66 [1/2] ANDROID: Revert "mm: remove cleancache"
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240301/202403011035.aklOMwGJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011035.aklOMwGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011035.aklOMwGJ-lkp@intel.com/

Note: the android-common/android15-6.6 HEAD 0a84521f08563ca390596baeb35dbe53018b502d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/btrfs/extent_io.c: In function 'btrfs_do_readpage':
>> fs/btrfs/extent_io.c:1003:25: error: label 'out' used but not defined
    1003 |                         goto out;
         |                         ^~~~


vim +/out +1003 fs/btrfs/extent_io.c

   939	
   940	static struct extent_map *
   941	__get_extent_map(struct inode *inode, struct page *page, size_t pg_offset,
   942			 u64 start, u64 len, struct extent_map **em_cached)
   943	{
   944		struct extent_map *em;
   945	
   946		if (em_cached && *em_cached) {
   947			em = *em_cached;
   948			if (extent_map_in_tree(em) && start >= em->start &&
   949			    start < extent_map_end(em)) {
   950				refcount_inc(&em->refs);
   951				return em;
   952			}
   953	
   954			free_extent_map(em);
   955			*em_cached = NULL;
   956		}
   957	
   958		em = btrfs_get_extent(BTRFS_I(inode), page, pg_offset, start, len);
   959		if (em_cached && !IS_ERR(em)) {
   960			BUG_ON(*em_cached);
   961			refcount_inc(&em->refs);
   962			*em_cached = em;
   963		}
   964		return em;
   965	}
   966	/*
   967	 * basic readpage implementation.  Locked extent state structs are inserted
   968	 * into the tree that are removed when the IO is done (by the end_io
   969	 * handlers)
   970	 * XXX JDM: This needs looking at to ensure proper page locking
   971	 * return 0 on success, otherwise return error
   972	 */
   973	static int btrfs_do_readpage(struct page *page, struct extent_map **em_cached,
   974			      struct btrfs_bio_ctrl *bio_ctrl, u64 *prev_em_start)
   975	{
   976		struct inode *inode = page->mapping->host;
   977		struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
   978		u64 start = page_offset(page);
   979		const u64 end = start + PAGE_SIZE - 1;
   980		u64 cur = start;
   981		u64 extent_offset;
   982		u64 last_byte = i_size_read(inode);
   983		u64 block_start;
   984		struct extent_map *em;
   985		int ret = 0;
   986		size_t pg_offset = 0;
   987		size_t iosize;
   988		size_t blocksize = inode->i_sb->s_blocksize;
   989		struct extent_io_tree *tree = &BTRFS_I(inode)->io_tree;
   990	
   991		ret = set_page_extent_mapped(page);
   992		if (ret < 0) {
   993			unlock_extent(tree, start, end, NULL);
   994			unlock_page(page);
   995			return ret;
   996		}
   997	
   998		if (!PageUptodate(page)) {
   999			if (cleancache_get_page(page) == 0) {
  1000				BUG_ON(blocksize != PAGE_SIZE);
  1001				unlock_extent(tree, start, end, NULL);
  1002				unlock_page(page);
> 1003				goto out;
  1004			}
  1005		}
  1006	
  1007		if (page->index == last_byte >> PAGE_SHIFT) {
  1008			size_t zero_offset = offset_in_page(last_byte);
  1009	
  1010			if (zero_offset) {
  1011				iosize = PAGE_SIZE - zero_offset;
  1012				memzero_page(page, zero_offset, iosize);
  1013			}
  1014		}
  1015		bio_ctrl->end_io_func = end_bio_extent_readpage;
  1016		begin_page_read(fs_info, page);
  1017		while (cur <= end) {
  1018			enum btrfs_compression_type compress_type = BTRFS_COMPRESS_NONE;
  1019			bool force_bio_submit = false;
  1020			u64 disk_bytenr;
  1021	
  1022			ASSERT(IS_ALIGNED(cur, fs_info->sectorsize));
  1023			if (cur >= last_byte) {
  1024				iosize = PAGE_SIZE - pg_offset;
  1025				memzero_page(page, pg_offset, iosize);
  1026				unlock_extent(tree, cur, cur + iosize - 1, NULL);
  1027				end_page_read(page, true, cur, iosize);
  1028				break;
  1029			}
  1030			em = __get_extent_map(inode, page, pg_offset, cur,
  1031					      end - cur + 1, em_cached);
  1032			if (IS_ERR(em)) {
  1033				unlock_extent(tree, cur, end, NULL);
  1034				end_page_read(page, false, cur, end + 1 - cur);
  1035				return PTR_ERR(em);
  1036			}
  1037			extent_offset = cur - em->start;
  1038			BUG_ON(extent_map_end(em) <= cur);
  1039			BUG_ON(end < cur);
  1040	
  1041			if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags))
  1042				compress_type = em->compress_type;
  1043	
  1044			iosize = min(extent_map_end(em) - cur, end - cur + 1);
  1045			iosize = ALIGN(iosize, blocksize);
  1046			if (compress_type != BTRFS_COMPRESS_NONE)
  1047				disk_bytenr = em->block_start;
  1048			else
  1049				disk_bytenr = em->block_start + extent_offset;
  1050			block_start = em->block_start;
  1051			if (test_bit(EXTENT_FLAG_PREALLOC, &em->flags))
  1052				block_start = EXTENT_MAP_HOLE;
  1053	
  1054			/*
  1055			 * If we have a file range that points to a compressed extent
  1056			 * and it's followed by a consecutive file range that points
  1057			 * to the same compressed extent (possibly with a different
  1058			 * offset and/or length, so it either points to the whole extent
  1059			 * or only part of it), we must make sure we do not submit a
  1060			 * single bio to populate the pages for the 2 ranges because
  1061			 * this makes the compressed extent read zero out the pages
  1062			 * belonging to the 2nd range. Imagine the following scenario:
  1063			 *
  1064			 *  File layout
  1065			 *  [0 - 8K]                     [8K - 24K]
  1066			 *    |                               |
  1067			 *    |                               |
  1068			 * points to extent X,         points to extent X,
  1069			 * offset 4K, length of 8K     offset 0, length 16K
  1070			 *
  1071			 * [extent X, compressed length = 4K uncompressed length = 16K]
  1072			 *
  1073			 * If the bio to read the compressed extent covers both ranges,
  1074			 * it will decompress extent X into the pages belonging to the
  1075			 * first range and then it will stop, zeroing out the remaining
  1076			 * pages that belong to the other range that points to extent X.
  1077			 * So here we make sure we submit 2 bios, one for the first
  1078			 * range and another one for the third range. Both will target
  1079			 * the same physical extent from disk, but we can't currently
  1080			 * make the compressed bio endio callback populate the pages
  1081			 * for both ranges because each compressed bio is tightly
  1082			 * coupled with a single extent map, and each range can have
  1083			 * an extent map with a different offset value relative to the
  1084			 * uncompressed data of our extent and different lengths. This
  1085			 * is a corner case so we prioritize correctness over
  1086			 * non-optimal behavior (submitting 2 bios for the same extent).
  1087			 */
  1088			if (test_bit(EXTENT_FLAG_COMPRESSED, &em->flags) &&
  1089			    prev_em_start && *prev_em_start != (u64)-1 &&
  1090			    *prev_em_start != em->start)
  1091				force_bio_submit = true;
  1092	
  1093			if (prev_em_start)
  1094				*prev_em_start = em->start;
  1095	
  1096			free_extent_map(em);
  1097			em = NULL;
  1098	
  1099			/* we've found a hole, just zero and go on */
  1100			if (block_start == EXTENT_MAP_HOLE) {
  1101				memzero_page(page, pg_offset, iosize);
  1102	
  1103				unlock_extent(tree, cur, cur + iosize - 1, NULL);
  1104				end_page_read(page, true, cur, iosize);
  1105				cur = cur + iosize;
  1106				pg_offset += iosize;
  1107				continue;
  1108			}
  1109			/* the get_extent function already copied into the page */
  1110			if (block_start == EXTENT_MAP_INLINE) {
  1111				unlock_extent(tree, cur, cur + iosize - 1, NULL);
  1112				end_page_read(page, true, cur, iosize);
  1113				cur = cur + iosize;
  1114				pg_offset += iosize;
  1115				continue;
  1116			}
  1117	
  1118			if (bio_ctrl->compress_type != compress_type) {
  1119				submit_one_bio(bio_ctrl);
  1120				bio_ctrl->compress_type = compress_type;
  1121			}
  1122	
  1123			if (force_bio_submit)
  1124				submit_one_bio(bio_ctrl);
  1125			submit_extent_page(bio_ctrl, disk_bytenr, page, iosize,
  1126					   pg_offset);
  1127			cur = cur + iosize;
  1128			pg_offset += iosize;
  1129		}
  1130	
  1131		return 0;
  1132	}
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
