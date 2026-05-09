Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A769175A95
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778342026; cv=none; b=JDR9ERpK7kmxJ5xSd1LQHgy2fHznNSroyanwkJWI9EDeFcXCrACMDLhJxGww8CgjkEjIkzwr4ZOQ4vEnIt+GQLo6+8ng84FODLmOgqGQ8ROI6+6w/pYePSNBIj+e9jzLqXf6+5hNXhL0dCZ8fWOZmJ20ebPqGRGjndCB1u2JUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778342026; c=relaxed/simple;
	bh=OFE8ZEEitR78Z3RVAJWzfIC8GrGm4jg5JAAqgaO5AOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t5SKKyk15HTR/zW5yx0vOwe/6Aw/LWId3Ay5P/2c0Tg64Dh7RpoKvLjWYA6c9PMo3qX4cG333vKwyzeIc5w846FUzfUxLcjM4pEJLAXGLWNSD3dZUnLfaJelkUoG5F518g7xLlwL6JKucxE5bSxcDKDJMInylKinABtV4KbFpxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLahllNy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLahllNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778342023; x=1809878023;
  h=date:from:to:cc:subject:message-id;
  bh=OFE8ZEEitR78Z3RVAJWzfIC8GrGm4jg5JAAqgaO5AOA=;
  b=dLahllNyZqhw1Bt9gyJ2xCbdXXQKow3PsWfntFJ9zn72jDnIvf9c239M
   BNuqCu3M8NEp6RpoNLrdGe3hdtJknPFjU+yreoaq+SH7aWKAKAznoCsbZ
   pG4Zi7OZLkLTx/GFnpRE9V8c5fhnxUw0XSArjTQe4Mk2ue6itsk1CK6oa
   yUdV0hS8vQM7jKvCHMU1+q+3jEW1VpzlEorD+GOxdQYJkHbMHamMWEki3
   elZdGBQiRNodSjJl06Iy4IduDdHzd0+koTND3CiHQ0eAWn59yVDBlQFUW
   3iT6ShzVLZRIaubGXz5Jw3kOb5yxybO9wM461uWpDm9l1X8xeE5EXqwZv
   w==;
X-CSE-ConnectionGUID: tvSK+omrQlCfqgW38qes2w==
X-CSE-MsgGUID: 9cOEx3AXQ4OJrzZpGP8pQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="96719458"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96719458"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 08:53:42 -0700
X-CSE-ConnectionGUID: CVm3SGMsTD+u+Cq6W4dN3A==
X-CSE-MsgGUID: AfA84qoyQGiz4clbSE1NWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="242038791"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2026 08:53:40 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLjzl-0000000018r-2TkS;
	Sat, 09 May 2026 15:53:37 +0000
Date: Sat, 09 May 2026 23:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate /6] fs/btrfs/inode.c:10584:13:
 error: static declaration of 'btrfs_swap_deactivate' follows non-static
 declaration
Message-ID: <202605092326.BHvSGWFB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   b51af8ce758e01e86b01132c21a589894c45e0b7
commit: aabacaa23a058cd154f095a3c577bb71d676b0ae [/6] fs,swap: move swapfile operations to struct file_operations
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260509/202605092326.BHvSGWFB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092326.BHvSGWFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605092326.BHvSGWFB-lkp@intel.com/

Note: the hch-misc/swap_activate HEAD b51af8ce758e01e86b01132c21a589894c45e0b7 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> fs/btrfs/inode.c:10584:13: error: static declaration of 'btrfs_swap_deactivate' follows non-static declaration
   10584 | static void btrfs_swap_deactivate(struct file *file)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from fs/btrfs/transaction.h:16,
                    from fs/btrfs/inode.c:40:
   fs/btrfs/btrfs_inode.h:675:6: note: previous declaration of 'btrfs_swap_deactivate' with type 'void(struct file *)'
     675 | void btrfs_swap_deactivate(struct file *file);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> fs/btrfs/inode.c:10588:12: error: conflicting types for 'btrfs_swap_activate'; have 'int(struct swap_info_struct *, struct file *, sector_t *)' {aka 'int(struct swap_info_struct *, struct file *, long long unsigned int *)'}
   10588 | static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
         |            ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/btrfs_inode.h:673:5: note: previous declaration of 'btrfs_swap_activate' with type 'int(struct file *, struct swap_info_struct *, u64 *)' {aka 'int(struct file *, struct swap_info_struct *, long long unsigned int *)'}
     673 | int btrfs_swap_activate(struct file *file, struct swap_info_struct *sis,
         |     ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10588:12: warning: 'btrfs_swap_activate' defined but not used [-Wunused-function]
   10588 | static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
         |            ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:10584:13: warning: 'btrfs_swap_deactivate' defined but not used [-Wunused-function]
   10584 | static void btrfs_swap_deactivate(struct file *file)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/btrfs_swap_deactivate +10584 fs/btrfs/inode.c

ed46ff3d423780f Omar Sandoval     2016-11-03  10261  
aabacaa23a058cd Christoph Hellwig 2026-05-09  10262  int btrfs_swap_activate(struct file *file, struct swap_info_struct *sis,
aabacaa23a058cd Christoph Hellwig 2026-05-09  10263  		u64 *span)
ed46ff3d423780f Omar Sandoval     2016-11-03  10264  {
ed46ff3d423780f Omar Sandoval     2016-11-03  10265  	struct inode *inode = file_inode(file);
dd0734f2a866f9d Filipe Manana     2021-02-05  10266  	struct btrfs_root *root = BTRFS_I(inode)->root;
dd0734f2a866f9d Filipe Manana     2021-02-05  10267  	struct btrfs_fs_info *fs_info = root->fs_info;
ed46ff3d423780f Omar Sandoval     2016-11-03  10268  	struct extent_io_tree *io_tree = &BTRFS_I(inode)->io_tree;
ed46ff3d423780f Omar Sandoval     2016-11-03  10269  	struct extent_state *cached_state = NULL;
7dc66abb5a47778 Filipe Manana     2023-11-21  10270  	struct btrfs_chunk_map *map = NULL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10271  	struct btrfs_device *device = NULL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10272  	struct btrfs_swap_info bsi = {
ed46ff3d423780f Omar Sandoval     2016-11-03  10273  		.lowest_ppage = (sector_t)-1ULL,
ed46ff3d423780f Omar Sandoval     2016-11-03  10274  	};
03018e5d8508254 Filipe Manana     2024-12-09  10275  	struct btrfs_backref_share_check_ctx *backref_ctx = NULL;
03018e5d8508254 Filipe Manana     2024-12-09  10276  	struct btrfs_path *path = NULL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10277  	int ret = 0;
ed46ff3d423780f Omar Sandoval     2016-11-03  10278  	u64 isize;
03018e5d8508254 Filipe Manana     2024-12-09  10279  	u64 prev_extent_end = 0;
ed46ff3d423780f Omar Sandoval     2016-11-03  10280  
0525064bb82e50d Filipe Manana     2024-11-29  10281  	/*
0525064bb82e50d Filipe Manana     2024-11-29  10282  	 * Acquire the inode's mmap lock to prevent races with memory mapped
0525064bb82e50d Filipe Manana     2024-11-29  10283  	 * writes, as they could happen after we flush delalloc below and before
0525064bb82e50d Filipe Manana     2024-11-29  10284  	 * we lock the extent range further below. The inode was already locked
0525064bb82e50d Filipe Manana     2024-11-29  10285  	 * up in the call chain.
0525064bb82e50d Filipe Manana     2024-11-29  10286  	 */
0525064bb82e50d Filipe Manana     2024-11-29  10287  	btrfs_assert_inode_locked(BTRFS_I(inode));
0525064bb82e50d Filipe Manana     2024-11-29  10288  	down_write(&BTRFS_I(inode)->i_mmap_lock);
ed46ff3d423780f Omar Sandoval     2016-11-03  10289  
ed46ff3d423780f Omar Sandoval     2016-11-03  10290  	/*
ed46ff3d423780f Omar Sandoval     2016-11-03  10291  	 * If the swap file was just created, make sure delalloc is done. If the
ed46ff3d423780f Omar Sandoval     2016-11-03  10292  	 * file changes again after this, the user is doing something stupid and
ed46ff3d423780f Omar Sandoval     2016-11-03  10293  	 * we don't really care.
ed46ff3d423780f Omar Sandoval     2016-11-03  10294  	 */
e641e323abb3cef Filipe Manana     2024-05-18  10295  	ret = btrfs_wait_ordered_range(BTRFS_I(inode), 0, (u64)-1);
ed46ff3d423780f Omar Sandoval     2016-11-03  10296  	if (ret)
0525064bb82e50d Filipe Manana     2024-11-29  10297  		goto out_unlock_mmap;
ed46ff3d423780f Omar Sandoval     2016-11-03  10298  
ed46ff3d423780f Omar Sandoval     2016-11-03  10299  	/*
ed46ff3d423780f Omar Sandoval     2016-11-03  10300  	 * The inode is locked, so these flags won't change after we check them.
ed46ff3d423780f Omar Sandoval     2016-11-03  10301  	 */
ed46ff3d423780f Omar Sandoval     2016-11-03  10302  	if (BTRFS_I(inode)->flags & BTRFS_INODE_COMPRESS) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10303  		btrfs_warn(fs_info, "swapfile must not be compressed");
0525064bb82e50d Filipe Manana     2024-11-29  10304  		ret = -EINVAL;
0525064bb82e50d Filipe Manana     2024-11-29  10305  		goto out_unlock_mmap;
ed46ff3d423780f Omar Sandoval     2016-11-03  10306  	}
ed46ff3d423780f Omar Sandoval     2016-11-03  10307  	if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATACOW)) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10308  		btrfs_warn(fs_info, "swapfile must not be copy-on-write");
0525064bb82e50d Filipe Manana     2024-11-29  10309  		ret = -EINVAL;
0525064bb82e50d Filipe Manana     2024-11-29  10310  		goto out_unlock_mmap;
ed46ff3d423780f Omar Sandoval     2016-11-03  10311  	}
ed46ff3d423780f Omar Sandoval     2016-11-03  10312  	if (!(BTRFS_I(inode)->flags & BTRFS_INODE_NODATASUM)) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10313  		btrfs_warn(fs_info, "swapfile must not be checksummed");
0525064bb82e50d Filipe Manana     2024-11-29  10314  		ret = -EINVAL;
0525064bb82e50d Filipe Manana     2024-11-29  10315  		goto out_unlock_mmap;
ed46ff3d423780f Omar Sandoval     2016-11-03  10316  	}
ed46ff3d423780f Omar Sandoval     2016-11-03  10317  
03018e5d8508254 Filipe Manana     2024-12-09  10318  	path = btrfs_alloc_path();
03018e5d8508254 Filipe Manana     2024-12-09  10319  	backref_ctx = btrfs_alloc_backref_share_check_ctx();
03018e5d8508254 Filipe Manana     2024-12-09  10320  	if (!path || !backref_ctx) {
03018e5d8508254 Filipe Manana     2024-12-09  10321  		ret = -ENOMEM;
03018e5d8508254 Filipe Manana     2024-12-09  10322  		goto out_unlock_mmap;
ed46ff3d423780f Omar Sandoval     2016-11-03  10323  	}
ed46ff3d423780f Omar Sandoval     2016-11-03  10324  
ed46ff3d423780f Omar Sandoval     2016-11-03  10325  	/*
ed46ff3d423780f Omar Sandoval     2016-11-03  10326  	 * Balance or device remove/replace/resize can move stuff around from
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  10327  	 * under us. The exclop protection makes sure they aren't running/won't
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  10328  	 * run concurrently while we are mapping the swap extents, and
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  10329  	 * fs_info->swapfile_pins prevents them from running while the swap
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  10330  	 * file is active and moving the extents. Note that this also prevents
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  10331  	 * a concurrent device add which isn't actually necessary, but it's not
ed46ff3d423780f Omar Sandoval     2016-11-03  10332  	 * really worth the trouble to allow it.
ed46ff3d423780f Omar Sandoval     2016-11-03  10333  	 */
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  10334  	if (!btrfs_exclop_start(fs_info, BTRFS_EXCLOP_SWAP_ACTIVATE)) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10335  		btrfs_warn(fs_info,
ed46ff3d423780f Omar Sandoval     2016-11-03  10336  	   "cannot activate swapfile while exclusive operation is running");
0525064bb82e50d Filipe Manana     2024-11-29  10337  		ret = -EBUSY;
0525064bb82e50d Filipe Manana     2024-11-29  10338  		goto out_unlock_mmap;
ed46ff3d423780f Omar Sandoval     2016-11-03  10339  	}
dd0734f2a866f9d Filipe Manana     2021-02-05  10340  
dd0734f2a866f9d Filipe Manana     2021-02-05  10341  	/*
dd0734f2a866f9d Filipe Manana     2021-02-05  10342  	 * Prevent snapshot creation while we are activating the swap file.
dd0734f2a866f9d Filipe Manana     2021-02-05  10343  	 * We do not want to race with snapshot creation. If snapshot creation
dd0734f2a866f9d Filipe Manana     2021-02-05  10344  	 * already started before we bumped nr_swapfiles from 0 to 1 and
dd0734f2a866f9d Filipe Manana     2021-02-05  10345  	 * completes before the first write into the swap file after it is
dd0734f2a866f9d Filipe Manana     2021-02-05  10346  	 * activated, than that write would fallback to COW.
dd0734f2a866f9d Filipe Manana     2021-02-05  10347  	 */
dd0734f2a866f9d Filipe Manana     2021-02-05  10348  	if (!btrfs_drew_try_write_lock(&root->snapshot_lock)) {
dd0734f2a866f9d Filipe Manana     2021-02-05  10349  		btrfs_exclop_finish(fs_info);
dd0734f2a866f9d Filipe Manana     2021-02-05  10350  		btrfs_warn(fs_info,
dd0734f2a866f9d Filipe Manana     2021-02-05  10351  	   "cannot activate swapfile because snapshot creation is in progress");
0525064bb82e50d Filipe Manana     2024-11-29  10352  		ret = -EINVAL;
0525064bb82e50d Filipe Manana     2024-11-29  10353  		goto out_unlock_mmap;
dd0734f2a866f9d Filipe Manana     2021-02-05  10354  	}
ed46ff3d423780f Omar Sandoval     2016-11-03  10355  	/*
ed46ff3d423780f Omar Sandoval     2016-11-03  10356  	 * Snapshots can create extents which require COW even if NODATACOW is
ed46ff3d423780f Omar Sandoval     2016-11-03  10357  	 * set. We use this counter to prevent snapshots. We must increment it
ed46ff3d423780f Omar Sandoval     2016-11-03  10358  	 * before walking the extents because we don't want a concurrent
ed46ff3d423780f Omar Sandoval     2016-11-03  10359  	 * snapshot to run after we've already checked the extents.
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10360  	 *
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10361  	 * It is possible that subvolume is marked for deletion but still not
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10362  	 * removed yet. To prevent this race, we check the root status before
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10363  	 * activating the swapfile.
ed46ff3d423780f Omar Sandoval     2016-11-03  10364  	 */
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10365  	spin_lock(&root->root_item_lock);
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10366  	if (btrfs_root_dead(root)) {
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10367  		spin_unlock(&root->root_item_lock);
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10368  
9c803c474c6c002 Filipe Manana     2024-11-29  10369  		btrfs_drew_write_unlock(&root->snapshot_lock);
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10370  		btrfs_exclop_finish(fs_info);
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10371  		btrfs_warn(fs_info,
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10372  		"cannot activate swapfile because subvolume %llu is being deleted",
e094f48040cda67 Josef Bacik       2024-04-15  10373  			btrfs_root_id(root));
0525064bb82e50d Filipe Manana     2024-11-29  10374  		ret = -EPERM;
0525064bb82e50d Filipe Manana     2024-11-29  10375  		goto out_unlock_mmap;
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10376  	}
dd0734f2a866f9d Filipe Manana     2021-02-05  10377  	atomic_inc(&root->nr_swapfiles);
60021bd754c6ca0 Kaiwen Hu         2022-03-23  10378  	spin_unlock(&root->root_item_lock);
ed46ff3d423780f Omar Sandoval     2016-11-03  10379  
ed46ff3d423780f Omar Sandoval     2016-11-03  10380  	isize = ALIGN_DOWN(inode->i_size, fs_info->sectorsize);
ed46ff3d423780f Omar Sandoval     2016-11-03  10381  
242570e80bfdf3f Filipe Manana     2025-03-31  10382  	btrfs_lock_extent(io_tree, 0, isize - 1, &cached_state);
03018e5d8508254 Filipe Manana     2024-12-09  10383  	while (prev_extent_end < isize) {
03018e5d8508254 Filipe Manana     2024-12-09  10384  		struct btrfs_key key;
03018e5d8508254 Filipe Manana     2024-12-09  10385  		struct extent_buffer *leaf;
03018e5d8508254 Filipe Manana     2024-12-09  10386  		struct btrfs_file_extent_item *ei;
32da5386d9a4fd5 David Sterba      2019-10-29  10387  		struct btrfs_block_group *bg;
03018e5d8508254 Filipe Manana     2024-12-09  10388  		u64 logical_block_start;
03018e5d8508254 Filipe Manana     2024-12-09  10389  		u64 physical_block_start;
03018e5d8508254 Filipe Manana     2024-12-09  10390  		u64 extent_gen;
03018e5d8508254 Filipe Manana     2024-12-09  10391  		u64 disk_bytenr;
03018e5d8508254 Filipe Manana     2024-12-09  10392  		u64 len;
ed46ff3d423780f Omar Sandoval     2016-11-03  10393  
03018e5d8508254 Filipe Manana     2024-12-09  10394  		key.objectid = btrfs_ino(BTRFS_I(inode));
03018e5d8508254 Filipe Manana     2024-12-09  10395  		key.type = BTRFS_EXTENT_DATA_KEY;
03018e5d8508254 Filipe Manana     2024-12-09  10396  		key.offset = prev_extent_end;
03018e5d8508254 Filipe Manana     2024-12-09  10397  
03018e5d8508254 Filipe Manana     2024-12-09  10398  		ret = btrfs_search_slot(NULL, root, &key, path, 0, 0);
03018e5d8508254 Filipe Manana     2024-12-09  10399  		if (ret < 0)
ed46ff3d423780f Omar Sandoval     2016-11-03  10400  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10401  
03018e5d8508254 Filipe Manana     2024-12-09  10402  		/*
03018e5d8508254 Filipe Manana     2024-12-09  10403  		 * If key not found it means we have an implicit hole (NO_HOLES
03018e5d8508254 Filipe Manana     2024-12-09  10404  		 * is enabled).
03018e5d8508254 Filipe Manana     2024-12-09  10405  		 */
03018e5d8508254 Filipe Manana     2024-12-09  10406  		if (ret > 0) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10407  			btrfs_warn(fs_info, "swapfile must not have holes");
ed46ff3d423780f Omar Sandoval     2016-11-03  10408  			ret = -EINVAL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10409  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10410  		}
03018e5d8508254 Filipe Manana     2024-12-09  10411  
03018e5d8508254 Filipe Manana     2024-12-09  10412  		leaf = path->nodes[0];
03018e5d8508254 Filipe Manana     2024-12-09  10413  		ei = btrfs_item_ptr(leaf, path->slots[0], struct btrfs_file_extent_item);
03018e5d8508254 Filipe Manana     2024-12-09  10414  
03018e5d8508254 Filipe Manana     2024-12-09  10415  		if (btrfs_file_extent_type(leaf, ei) == BTRFS_FILE_EXTENT_INLINE) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10416  			/*
ed46ff3d423780f Omar Sandoval     2016-11-03  10417  			 * It's unlikely we'll ever actually find ourselves
ed46ff3d423780f Omar Sandoval     2016-11-03  10418  			 * here, as a file small enough to fit inline won't be
ed46ff3d423780f Omar Sandoval     2016-11-03  10419  			 * big enough to store more than the swap header, but in
ed46ff3d423780f Omar Sandoval     2016-11-03  10420  			 * case something changes in the future, let's catch it
ed46ff3d423780f Omar Sandoval     2016-11-03  10421  			 * here rather than later.
ed46ff3d423780f Omar Sandoval     2016-11-03  10422  			 */
ed46ff3d423780f Omar Sandoval     2016-11-03  10423  			btrfs_warn(fs_info, "swapfile must not be inline");
ed46ff3d423780f Omar Sandoval     2016-11-03  10424  			ret = -EINVAL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10425  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10426  		}
03018e5d8508254 Filipe Manana     2024-12-09  10427  
03018e5d8508254 Filipe Manana     2024-12-09  10428  		if (btrfs_file_extent_compression(leaf, ei) != BTRFS_COMPRESS_NONE) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10429  			btrfs_warn(fs_info, "swapfile must not be compressed");
ed46ff3d423780f Omar Sandoval     2016-11-03  10430  			ret = -EINVAL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10431  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10432  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10433  
03018e5d8508254 Filipe Manana     2024-12-09  10434  		disk_bytenr = btrfs_file_extent_disk_bytenr(leaf, ei);
03018e5d8508254 Filipe Manana     2024-12-09  10435  		if (disk_bytenr == 0) {
03018e5d8508254 Filipe Manana     2024-12-09  10436  			btrfs_warn(fs_info, "swapfile must not have holes");
03018e5d8508254 Filipe Manana     2024-12-09  10437  			ret = -EINVAL;
03018e5d8508254 Filipe Manana     2024-12-09  10438  			goto out;
03018e5d8508254 Filipe Manana     2024-12-09  10439  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10440  
03018e5d8508254 Filipe Manana     2024-12-09  10441  		logical_block_start = disk_bytenr + btrfs_file_extent_offset(leaf, ei);
03018e5d8508254 Filipe Manana     2024-12-09  10442  		extent_gen = btrfs_file_extent_generation(leaf, ei);
03018e5d8508254 Filipe Manana     2024-12-09  10443  		prev_extent_end = btrfs_file_extent_end(path);
03018e5d8508254 Filipe Manana     2024-12-09  10444  
03018e5d8508254 Filipe Manana     2024-12-09  10445  		if (prev_extent_end > isize)
03018e5d8508254 Filipe Manana     2024-12-09  10446  			len = isize - key.offset;
03018e5d8508254 Filipe Manana     2024-12-09  10447  		else
03018e5d8508254 Filipe Manana     2024-12-09  10448  			len = btrfs_file_extent_num_bytes(leaf, ei);
ed46ff3d423780f Omar Sandoval     2016-11-03  10449  
03018e5d8508254 Filipe Manana     2024-12-09  10450  		backref_ctx->curr_leaf_bytenr = leaf->start;
03018e5d8508254 Filipe Manana     2024-12-09  10451  
03018e5d8508254 Filipe Manana     2024-12-09  10452  		/*
03018e5d8508254 Filipe Manana     2024-12-09  10453  		 * Don't need the path anymore, release to avoid deadlocks when
03018e5d8508254 Filipe Manana     2024-12-09  10454  		 * calling btrfs_is_data_extent_shared() because when joining a
03018e5d8508254 Filipe Manana     2024-12-09  10455  		 * transaction it can block waiting for the current one's commit
03018e5d8508254 Filipe Manana     2024-12-09  10456  		 * which in turn may be trying to lock the same leaf to flush
03018e5d8508254 Filipe Manana     2024-12-09  10457  		 * delayed items for example.
03018e5d8508254 Filipe Manana     2024-12-09  10458  		 */
03018e5d8508254 Filipe Manana     2024-12-09  10459  		btrfs_release_path(path);
03018e5d8508254 Filipe Manana     2024-12-09  10460  
03018e5d8508254 Filipe Manana     2024-12-09  10461  		ret = btrfs_is_data_extent_shared(BTRFS_I(inode), disk_bytenr,
03018e5d8508254 Filipe Manana     2024-12-09  10462  						  extent_gen, backref_ctx);
ed46ff3d423780f Omar Sandoval     2016-11-03  10463  		if (ret < 0) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10464  			goto out;
03018e5d8508254 Filipe Manana     2024-12-09  10465  		} else if (ret > 0) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10466  			btrfs_warn(fs_info,
ed46ff3d423780f Omar Sandoval     2016-11-03  10467  				   "swapfile must not be copy-on-write");
ed46ff3d423780f Omar Sandoval     2016-11-03  10468  			ret = -EINVAL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10469  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10470  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10471  
7dc66abb5a47778 Filipe Manana     2023-11-21  10472  		map = btrfs_get_chunk_map(fs_info, logical_block_start, len);
7dc66abb5a47778 Filipe Manana     2023-11-21  10473  		if (IS_ERR(map)) {
7dc66abb5a47778 Filipe Manana     2023-11-21  10474  			ret = PTR_ERR(map);
ed46ff3d423780f Omar Sandoval     2016-11-03  10475  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10476  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10477  
7dc66abb5a47778 Filipe Manana     2023-11-21  10478  		if (map->type & BTRFS_BLOCK_GROUP_PROFILE_MASK) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10479  			btrfs_warn(fs_info,
ed46ff3d423780f Omar Sandoval     2016-11-03  10480  				   "swapfile must have single data profile");
ed46ff3d423780f Omar Sandoval     2016-11-03  10481  			ret = -EINVAL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10482  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10483  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10484  
ed46ff3d423780f Omar Sandoval     2016-11-03  10485  		if (device == NULL) {
7dc66abb5a47778 Filipe Manana     2023-11-21  10486  			device = map->stripes[0].dev;
ed46ff3d423780f Omar Sandoval     2016-11-03  10487  			ret = btrfs_add_swapfile_pin(inode, device, false);
ed46ff3d423780f Omar Sandoval     2016-11-03  10488  			if (ret == 1)
ed46ff3d423780f Omar Sandoval     2016-11-03  10489  				ret = 0;
ed46ff3d423780f Omar Sandoval     2016-11-03  10490  			else if (ret)
ed46ff3d423780f Omar Sandoval     2016-11-03  10491  				goto out;
7dc66abb5a47778 Filipe Manana     2023-11-21  10492  		} else if (device != map->stripes[0].dev) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10493  			btrfs_warn(fs_info, "swapfile must be on one device");
ed46ff3d423780f Omar Sandoval     2016-11-03  10494  			ret = -EINVAL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10495  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10496  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10497  
7dc66abb5a47778 Filipe Manana     2023-11-21  10498  		physical_block_start = (map->stripes[0].physical +
7dc66abb5a47778 Filipe Manana     2023-11-21  10499  					(logical_block_start - map->start));
7dc66abb5a47778 Filipe Manana     2023-11-21  10500  		btrfs_free_chunk_map(map);
7dc66abb5a47778 Filipe Manana     2023-11-21  10501  		map = NULL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10502  
ed46ff3d423780f Omar Sandoval     2016-11-03  10503  		bg = btrfs_lookup_block_group(fs_info, logical_block_start);
ed46ff3d423780f Omar Sandoval     2016-11-03  10504  		if (!bg) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10505  			btrfs_warn(fs_info,
ed46ff3d423780f Omar Sandoval     2016-11-03  10506  			   "could not find block group containing swapfile");
ed46ff3d423780f Omar Sandoval     2016-11-03  10507  			ret = -EINVAL;
ed46ff3d423780f Omar Sandoval     2016-11-03  10508  			goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10509  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10510  
195a49eaf655eb9 Filipe Manana     2021-02-05  10511  		if (!btrfs_inc_block_group_swap_extents(bg)) {
195a49eaf655eb9 Filipe Manana     2021-02-05  10512  			btrfs_warn(fs_info,
195a49eaf655eb9 Filipe Manana     2021-02-05  10513  			   "block group for swapfile at %llu is read-only%s",
195a49eaf655eb9 Filipe Manana     2021-02-05  10514  			   bg->start,
195a49eaf655eb9 Filipe Manana     2021-02-05  10515  			   atomic_read(&fs_info->scrubs_running) ?
195a49eaf655eb9 Filipe Manana     2021-02-05  10516  				       " (scrub running)" : "");
195a49eaf655eb9 Filipe Manana     2021-02-05  10517  			btrfs_put_block_group(bg);
195a49eaf655eb9 Filipe Manana     2021-02-05  10518  			ret = -EINVAL;
195a49eaf655eb9 Filipe Manana     2021-02-05  10519  			goto out;
195a49eaf655eb9 Filipe Manana     2021-02-05  10520  		}
195a49eaf655eb9 Filipe Manana     2021-02-05  10521  
ed46ff3d423780f Omar Sandoval     2016-11-03  10522  		ret = btrfs_add_swapfile_pin(inode, bg, true);
ed46ff3d423780f Omar Sandoval     2016-11-03  10523  		if (ret) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10524  			btrfs_put_block_group(bg);
ed46ff3d423780f Omar Sandoval     2016-11-03  10525  			if (ret == 1)
ed46ff3d423780f Omar Sandoval     2016-11-03  10526  				ret = 0;
ed46ff3d423780f Omar Sandoval     2016-11-03  10527  			else
ed46ff3d423780f Omar Sandoval     2016-11-03  10528  				goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10529  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10530  
ed46ff3d423780f Omar Sandoval     2016-11-03  10531  		if (bsi.block_len &&
ed46ff3d423780f Omar Sandoval     2016-11-03  10532  		    bsi.block_start + bsi.block_len == physical_block_start) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10533  			bsi.block_len += len;
ed46ff3d423780f Omar Sandoval     2016-11-03  10534  		} else {
ed46ff3d423780f Omar Sandoval     2016-11-03  10535  			if (bsi.block_len) {
ed46ff3d423780f Omar Sandoval     2016-11-03  10536  				ret = btrfs_add_swap_extent(sis, &bsi);
ed46ff3d423780f Omar Sandoval     2016-11-03  10537  				if (ret)
ed46ff3d423780f Omar Sandoval     2016-11-03  10538  					goto out;
ed46ff3d423780f Omar Sandoval     2016-11-03  10539  			}
03018e5d8508254 Filipe Manana     2024-12-09  10540  			bsi.start = key.offset;
ed46ff3d423780f Omar Sandoval     2016-11-03  10541  			bsi.block_start = physical_block_start;
ed46ff3d423780f Omar Sandoval     2016-11-03  10542  			bsi.block_len = len;
ed46ff3d423780f Omar Sandoval     2016-11-03  10543  		}
ed46ff3d423780f Omar Sandoval     2016-11-03  10544  
9a45022a0efadd9 Filipe Manana     2024-12-09  10545  		if (fatal_signal_pending(current)) {
9a45022a0efadd9 Filipe Manana     2024-12-09  10546  			ret = -EINTR;
9a45022a0efadd9 Filipe Manana     2024-12-09  10547  			goto out;
9a45022a0efadd9 Filipe Manana     2024-12-09  10548  		}
2c8507c63f5498d Filipe Manana     2024-12-09  10549  
2c8507c63f5498d Filipe Manana     2024-12-09  10550  		cond_resched();
ed46ff3d423780f Omar Sandoval     2016-11-03  10551  	}
ed46ff3d423780f Omar Sandoval     2016-11-03  10552  
ed46ff3d423780f Omar Sandoval     2016-11-03  10553  	if (bsi.block_len)
ed46ff3d423780f Omar Sandoval     2016-11-03  10554  		ret = btrfs_add_swap_extent(sis, &bsi);
ed46ff3d423780f Omar Sandoval     2016-11-03  10555  
ed46ff3d423780f Omar Sandoval     2016-11-03  10556  out:
7dc66abb5a47778 Filipe Manana     2023-11-21  10557  	if (!IS_ERR_OR_NULL(map))
7dc66abb5a47778 Filipe Manana     2023-11-21  10558  		btrfs_free_chunk_map(map);
ed46ff3d423780f Omar Sandoval     2016-11-03  10559  
242570e80bfdf3f Filipe Manana     2025-03-31  10560  	btrfs_unlock_extent(io_tree, 0, isize - 1, &cached_state);
ed46ff3d423780f Omar Sandoval     2016-11-03  10561  
ed46ff3d423780f Omar Sandoval     2016-11-03  10562  	if (ret)
ed46ff3d423780f Omar Sandoval     2016-11-03  10563  		btrfs_swap_deactivate(file);
ed46ff3d423780f Omar Sandoval     2016-11-03  10564  
dd0734f2a866f9d Filipe Manana     2021-02-05  10565  	btrfs_drew_write_unlock(&root->snapshot_lock);
dd0734f2a866f9d Filipe Manana     2021-02-05  10566  
c3e1f96c37d0f86 Goldwyn Rodrigues 2020-08-25  10567  	btrfs_exclop_finish(fs_info);
ed46ff3d423780f Omar Sandoval     2016-11-03  10568  
0525064bb82e50d Filipe Manana     2024-11-29  10569  out_unlock_mmap:
0525064bb82e50d Filipe Manana     2024-11-29  10570  	up_write(&BTRFS_I(inode)->i_mmap_lock);
03018e5d8508254 Filipe Manana     2024-12-09  10571  	btrfs_free_backref_share_ctx(backref_ctx);
03018e5d8508254 Filipe Manana     2024-12-09  10572  	btrfs_free_path(path);
ed46ff3d423780f Omar Sandoval     2016-11-03  10573  	if (ret)
ed46ff3d423780f Omar Sandoval     2016-11-03  10574  		return ret;
ed46ff3d423780f Omar Sandoval     2016-11-03  10575  
ed46ff3d423780f Omar Sandoval     2016-11-03  10576  	if (device)
ed46ff3d423780f Omar Sandoval     2016-11-03  10577  		sis->bdev = device->bdev;
ed46ff3d423780f Omar Sandoval     2016-11-03  10578  	*span = bsi.highest_ppage - bsi.lowest_ppage + 1;
ed46ff3d423780f Omar Sandoval     2016-11-03  10579  	sis->max = bsi.nr_pages;
ed46ff3d423780f Omar Sandoval     2016-11-03  10580  	sis->pages = bsi.nr_pages - 1;
ed46ff3d423780f Omar Sandoval     2016-11-03  10581  	return bsi.nr_extents;
ed46ff3d423780f Omar Sandoval     2016-11-03  10582  }
ed46ff3d423780f Omar Sandoval     2016-11-03  10583  #else
ed46ff3d423780f Omar Sandoval     2016-11-03 @10584  static void btrfs_swap_deactivate(struct file *file)
ed46ff3d423780f Omar Sandoval     2016-11-03  10585  {
ed46ff3d423780f Omar Sandoval     2016-11-03  10586  }
ed46ff3d423780f Omar Sandoval     2016-11-03  10587  
ed46ff3d423780f Omar Sandoval     2016-11-03 @10588  static int btrfs_swap_activate(struct swap_info_struct *sis, struct file *file,
ed46ff3d423780f Omar Sandoval     2016-11-03  10589  			       sector_t *span)
ed46ff3d423780f Omar Sandoval     2016-11-03  10590  {
ed46ff3d423780f Omar Sandoval     2016-11-03  10591  	return -EOPNOTSUPP;
ed46ff3d423780f Omar Sandoval     2016-11-03  10592  }
ed46ff3d423780f Omar Sandoval     2016-11-03  10593  #endif
ed46ff3d423780f Omar Sandoval     2016-11-03  10594  

:::::: The code at line 10584 was first introduced by commit
:::::: ed46ff3d423780fa5173b38a844bf0fdb210a2a7 Btrfs: support swap files

:::::: TO: Omar Sandoval <osandov@fb.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
