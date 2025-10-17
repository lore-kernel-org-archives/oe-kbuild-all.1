Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B82D4B68
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760693091; cv=none; b=XFagfTfOfwFYr/SGF5Wsy4NhrJqvGrhIGDbHP6u1vcdZPfhuGhQNVWgIqlvtGrArNQDns+KQmHFbLzCjGVy7XRojZZfTpz1IEc6HkroWMRfX422KaGavPBOBleU0tFsKPopABQfDvDobNgXnbWquzyST6kakJ6bw/1gZv1CgFKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760693091; c=relaxed/simple;
	bh=1pGK8Kqt2b0HBNjb4LUCVrA1XxSNWckK3b/x9pchQo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwU6OCxWa9K7tjvzp9sLf+IjKgnpghQ7sxrUXR/bAZxKlZT9n6UONqtul6yfFMbqOiT2MlMP2zSRHjxsKM4FJnKnmxNEwBWS5T2ndwkHwU5ldRSc0IyaSymfE29Z79Rkry2pxZ7sOV4NS6s4zZu4tKel3PFt0czRP+vhW0tvq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWNgtTtF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWNgtTtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760693090; x=1792229090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1pGK8Kqt2b0HBNjb4LUCVrA1XxSNWckK3b/x9pchQo0=;
  b=eWNgtTtF/9penp+dcJqFvjxDP38hZ6/4usY9WPRn2x682SohwA5yj+hB
   e90qTZaR4W2iNAaRX+Pk6npkn6AzvVulR2+lbbEKJfMonAu4t5PeS6TeO
   cNbGQ5dUNncoUB+HfR2sXNtnmC1Zd/EKKL9hYc2JOP5OojNc32MRYfeTI
   9ME3Gp5vmb6IKD8dXJkL+qT27tO2Ieb04MsLfqI3TwNViuC7pRsRJqaGt
   KEnDFCIj1vSBTH+La+uC/34Me7IKsAZBlmqDWpUs4Wh49Mv/pvXBb0tJ0
   i9eWVLxwBh8AGJMy3nX/TiZEcigGGueGAxcyn1uAp3lqpw9Gxrx5eOQU7
   w==;
X-CSE-ConnectionGUID: lXQuoUqbRbaDIWtbxEFqXg==
X-CSE-MsgGUID: EV1kBIF2RtSFo7PSl2a7Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74014901"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="74014901"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 02:24:49 -0700
X-CSE-ConnectionGUID: gns2F8tgTd6LGmVUAVHcyQ==
X-CSE-MsgGUID: 1so2/S1USjmqIqcWXXWhRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="187085304"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Oct 2025 02:24:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ghY-0005nX-0t;
	Fri, 17 Oct 2025 09:24:44 +0000
Date: Fri, 17 Oct 2025 17:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 1317/2137] fs/btrfs/inode.c:874:6: warning:
 variable 'folios' is used uninitialized whenever 'if' condition is true
Message-ID: <202510171743.VQ6yA0Uu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2433b84761658ef123ae683508bc461b07c5b0f0
commit: 7cd375ca80a7355fb2dc6abe1a175624d9c3b306 [1317/2137] btrfs: introduce a new shutdown state
config: mips-randconfig-r123-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171743.VQ6yA0Uu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171743.VQ6yA0Uu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171743.VQ6yA0Uu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/inode.c:874:6: warning: variable 'folios' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     874 |         if (unlikely(btrfs_is_shutdown(fs_info)))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1038:6: note: uninitialized use occurs here
    1038 |         if (folios) {
         |             ^~~~~~
   fs/btrfs/inode.c:874:2: note: remove the 'if' if its condition is always false
     874 |         if (unlikely(btrfs_is_shutdown(fs_info)))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     875 |                 goto cleanup_and_bail_uncompressed;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:865:23: note: initialize the variable 'folios' to silence this warning
     865 |         struct folio **folios;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +874 fs/btrfs/inode.c

   836	
   837	/*
   838	 * Work queue call back to started compression on a file and pages.
   839	 *
   840	 * This is done inside an ordered work queue, and the compression is spread
   841	 * across many cpus.  The actual IO submission is step two, and the ordered work
   842	 * queue takes care of making sure that happens in the same order things were
   843	 * put onto the queue by writepages and friends.
   844	 *
   845	 * If this code finds it can't get good compression, it puts an entry onto the
   846	 * work queue to write the uncompressed bytes.  This makes sure that both
   847	 * compressed inodes and uncompressed inodes are written in the same order that
   848	 * the flusher thread sent them down.
   849	 */
   850	static void compress_file_range(struct btrfs_work *work)
   851	{
   852		struct async_chunk *async_chunk =
   853			container_of(work, struct async_chunk, work);
   854		struct btrfs_inode *inode = async_chunk->inode;
   855		struct btrfs_fs_info *fs_info = inode->root->fs_info;
   856		struct address_space *mapping = inode->vfs_inode.i_mapping;
   857		const u32 min_folio_shift = PAGE_SHIFT + fs_info->block_min_order;
   858		const u32 min_folio_size = btrfs_min_folio_size(fs_info);
   859		u64 blocksize = fs_info->sectorsize;
   860		u64 start = async_chunk->start;
   861		u64 end = async_chunk->end;
   862		u64 actual_end;
   863		u64 i_size;
   864		int ret = 0;
   865		struct folio **folios;
   866		unsigned long nr_folios;
   867		unsigned long total_compressed = 0;
   868		unsigned long total_in = 0;
   869		unsigned int loff;
   870		int i;
   871		int compress_type = fs_info->compress_type;
   872		int compress_level = fs_info->compress_level;
   873	
 > 874		if (unlikely(btrfs_is_shutdown(fs_info)))
   875			goto cleanup_and_bail_uncompressed;
   876	
   877		inode_should_defrag(inode, start, end, end - start + 1, SZ_16K);
   878	
   879		/*
   880		 * We need to call clear_page_dirty_for_io on each page in the range.
   881		 * Otherwise applications with the file mmap'd can wander in and change
   882		 * the page contents while we are compressing them.
   883		 */
   884		ret = extent_range_clear_dirty_for_io(inode, start, end);
   885	
   886		/*
   887		 * All the folios should have been locked thus no failure.
   888		 *
   889		 * And even if some folios are missing, btrfs_compress_folios()
   890		 * would handle them correctly, so here just do an ASSERT() check for
   891		 * early logic errors.
   892		 */
   893		ASSERT(ret == 0);
   894	
   895		/*
   896		 * We need to save i_size before now because it could change in between
   897		 * us evaluating the size and assigning it.  This is because we lock and
   898		 * unlock the page in truncate and fallocate, and then modify the i_size
   899		 * later on.
   900		 *
   901		 * The barriers are to emulate READ_ONCE, remove that once i_size_read
   902		 * does that for us.
   903		 */
   904		barrier();
   905		i_size = i_size_read(&inode->vfs_inode);
   906		barrier();
   907		actual_end = min_t(u64, i_size, end + 1);
   908	again:
   909		folios = NULL;
   910		nr_folios = (end >> min_folio_shift) - (start >> min_folio_shift) + 1;
   911		nr_folios = min_t(unsigned long, nr_folios, BTRFS_MAX_COMPRESSED >> min_folio_shift);
   912	
   913		/*
   914		 * we don't want to send crud past the end of i_size through
   915		 * compression, that's just a waste of CPU time.  So, if the
   916		 * end of the file is before the start of our current
   917		 * requested range of bytes, we bail out to the uncompressed
   918		 * cleanup code that can deal with all of this.
   919		 *
   920		 * It isn't really the fastest way to fix things, but this is a
   921		 * very uncommon corner.
   922		 */
   923		if (actual_end <= start)
   924			goto cleanup_and_bail_uncompressed;
   925	
   926		total_compressed = actual_end - start;
   927	
   928		/*
   929		 * Skip compression for a small file range(<=blocksize) that
   930		 * isn't an inline extent, since it doesn't save disk space at all.
   931		 */
   932		if (total_compressed <= blocksize &&
   933		   (start > 0 || end + 1 < inode->disk_i_size))
   934			goto cleanup_and_bail_uncompressed;
   935	
   936		total_compressed = min_t(unsigned long, total_compressed,
   937				BTRFS_MAX_UNCOMPRESSED);
   938		total_in = 0;
   939		ret = 0;
   940	
   941		/*
   942		 * We do compression for mount -o compress and when the inode has not
   943		 * been flagged as NOCOMPRESS.  This flag can change at any time if we
   944		 * discover bad compression ratios.
   945		 */
   946		if (!inode_need_compress(inode, start, end))
   947			goto cleanup_and_bail_uncompressed;
   948	
   949		folios = kcalloc(nr_folios, sizeof(struct folio *), GFP_NOFS);
   950		if (!folios) {
   951			/*
   952			 * Memory allocation failure is not a fatal error, we can fall
   953			 * back to uncompressed code.
   954			 */
   955			goto cleanup_and_bail_uncompressed;
   956		}
   957	
   958		if (0 < inode->defrag_compress && inode->defrag_compress < BTRFS_NR_COMPRESS_TYPES) {
   959			compress_type = inode->defrag_compress;
   960			compress_level = inode->defrag_compress_level;
   961		} else if (inode->prop_compress) {
   962			compress_type = inode->prop_compress;
   963		}
   964	
   965		/* Compression level is applied here. */
   966		ret = btrfs_compress_folios(compress_type, compress_level,
   967					    inode, start, folios, &nr_folios, &total_in,
   968					    &total_compressed);
   969		if (ret)
   970			goto mark_incompressible;
   971	
   972		/*
   973		 * Zero the tail end of the last folio, as we might be sending it down
   974		 * to disk.
   975		 */
   976		loff = (total_compressed & (min_folio_size - 1));
   977		if (loff)
   978			folio_zero_range(folios[nr_folios - 1], loff, min_folio_size - loff);
   979	
   980		/*
   981		 * Try to create an inline extent.
   982		 *
   983		 * If we didn't compress the entire range, try to create an uncompressed
   984		 * inline extent, else a compressed one.
   985		 *
   986		 * Check cow_file_range() for why we don't even try to create inline
   987		 * extent for the subpage case.
   988		 */
   989		if (total_in < actual_end)
   990			ret = cow_file_range_inline(inode, NULL, start, end, 0,
   991						    BTRFS_COMPRESS_NONE, NULL, false);
   992		else
   993			ret = cow_file_range_inline(inode, NULL, start, end, total_compressed,
   994						    compress_type, folios[0], false);
   995		if (ret <= 0) {
   996			if (ret < 0)
   997				mapping_set_error(mapping, -EIO);
   998			goto free_pages;
   999		}
  1000	
  1001		/*
  1002		 * We aren't doing an inline extent. Round the compressed size up to a
  1003		 * block size boundary so the allocator does sane things.
  1004		 */
  1005		total_compressed = ALIGN(total_compressed, blocksize);
  1006	
  1007		/*
  1008		 * One last check to make sure the compression is really a win, compare
  1009		 * the page count read with the blocks on disk, compression must free at
  1010		 * least one sector.
  1011		 */
  1012		total_in = round_up(total_in, fs_info->sectorsize);
  1013		if (total_compressed + blocksize > total_in)
  1014			goto mark_incompressible;
  1015	
  1016		/*
  1017		 * The async work queues will take care of doing actual allocation on
  1018		 * disk for these compressed pages, and will submit the bios.
  1019		 */
  1020		ret = add_async_extent(async_chunk, start, total_in, total_compressed, folios,
  1021				       nr_folios, compress_type);
  1022		BUG_ON(ret);
  1023		if (start + total_in < end) {
  1024			start += total_in;
  1025			cond_resched();
  1026			goto again;
  1027		}
  1028		return;
  1029	
  1030	mark_incompressible:
  1031		if (!btrfs_test_opt(fs_info, FORCE_COMPRESS) && !inode->prop_compress)
  1032			inode->flags |= BTRFS_INODE_NOCOMPRESS;
  1033	cleanup_and_bail_uncompressed:
  1034		ret = add_async_extent(async_chunk, start, end - start + 1, 0, NULL, 0,
  1035				       BTRFS_COMPRESS_NONE);
  1036		BUG_ON(ret);
  1037	free_pages:
  1038		if (folios) {
  1039			for (i = 0; i < nr_folios; i++) {
  1040				WARN_ON(folios[i]->mapping);
  1041				btrfs_free_compr_folio(folios[i]);
  1042			}
  1043			kfree(folios);
  1044		}
  1045	}
  1046	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
