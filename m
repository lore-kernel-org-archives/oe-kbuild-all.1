Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA113358A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 08:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960826; cv=none; b=FVDvt5o8b9+3IRG6ct4BK5rFp4ew/C72lgNx2HzuxgcUVt3rR5pVX+sc4x343aB52cUv+bZSGl2bipuhbEqixPSAr7bfLL7k9Vo40eTd36GcRniUg0bJqe86l8HvhjnqGMbKdptFYbI2DkNGVPKQltdEQ38AKJPD9h5Fx7gWCsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960826; c=relaxed/simple;
	bh=GtRpW1c1HCM/nclHa77/wEHkdSB4WckncwlRy5M8EaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5uusJ/KluY9kbXagfWqtrBvonxFcQpAWwWdLy9IZREw4M8yVvOW7TTOf9JVzmr4FUncfwOWYz+/XDnC39rCxxNi5kxTPoww8VeeanZjFYLEJDUG9vBUnHao1yGEim4J5XE/uuIpnhv0GlUbgPpDnkTivcPvX4ayZ8dsuQ+Igl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmSM5Rhf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmSM5Rhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765960824; x=1797496824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GtRpW1c1HCM/nclHa77/wEHkdSB4WckncwlRy5M8EaI=;
  b=hmSM5RhfwtN1DCoNIoXv3P5ZeeHiddZaB60dbmiT3Kv0PgQpn3B6LiNL
   JLQBiJG+Jf28WolxzGTgHBAd7hFViiEpPTuNQDTKZmh5ekqUQk8jMvXE6
   wY9Nmj7CuFhA8l4+cdu6n+tkwcZawPfVx5Jgmq3jh9x/7jeCcXJ2/7w08
   IEF+pEfKbdHoX/1LSwcge8VDPAP0ICo9RsM45IWFM8wdjtmUd86LLJhe/
   22931kHW6klSFM+7nySaHtGdzhDvkoOhGpdJKftEHqyQZxq5CDlrLJwlD
   Q8q6CJHbS3z/ZaLdwJp990NP20xMe4diz0GP0vM0ffo6GQh8sFfh70POX
   w==;
X-CSE-ConnectionGUID: i8zp1U26S/yIkmYvEudf0w==
X-CSE-MsgGUID: rphpjQa6TQCNgmmc3TcG6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67646063"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="67646063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 00:40:24 -0800
X-CSE-ConnectionGUID: Qs8Z5hYmROSiSP3c0hJ3TA==
X-CSE-MsgGUID: 9Y1Ur6x8TQOE+tm7yNqJDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="235645081"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2025 00:40:22 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVn51-000000000EZ-3xja;
	Wed, 17 Dec 2025 08:40:19 +0000
Date: Wed, 17 Dec 2025 16:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 4/30] fs/ext4/balloc.c:197:25: error:
 'EFSBADCRC' undeclared
Message-ID: <202512171623.WLZWIuEX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   446cbdd65d84009edd9f121171953c5a5a880ce2
commit: 71e560adf7eb3432536ada866f108bdad0aaff25 [4/30] uapi: promote EFSCORRUPTED and EUCLEAN to errno.h
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20251217/202512171623.WLZWIuEX-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171623.WLZWIuEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171623.WLZWIuEX-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ext4/balloc.c: In function 'ext4_init_block_bitmap':
>> fs/ext4/balloc.c:197:25: error: 'EFSBADCRC' undeclared (first use in this function)
     197 |                 return -EFSBADCRC;
         |                         ^~~~~~~~~
   fs/ext4/balloc.c:197:25: note: each undeclared identifier is reported only once for each function it appears in
>> fs/ext4/balloc.c:203:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
     203 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/balloc.c: In function 'ext4_validate_block_bitmap':
   fs/ext4/balloc.c:415:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
     415 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/balloc.c:426:25: error: 'EFSBADCRC' undeclared (first use in this function)
     426 |                 return -EFSBADCRC;
         |                         ^~~~~~~~~
   fs/ext4/balloc.c: In function 'ext4_read_block_bitmap_nowait':
   fs/ext4/balloc.c:478:33: error: 'EFSCORRUPTED' undeclared (first use in this function)
     478 |                 return ERR_PTR(-EFSCORRUPTED);
         |                                 ^~~~~~~~~~~~
   fs/ext4/balloc.c: In function 'ext4_wait_block_bitmap':
   fs/ext4/balloc.c:579:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
     579 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
--
   fs/ext4/block_validity.c: In function 'add_system_zone':
>> fs/ext4/block_validity.c:85:33: error: 'EFSCORRUPTED' undeclared (first use in this function)
      85 |                         return -EFSCORRUPTED;
         |                                 ^~~~~~~~~~~~
   fs/ext4/block_validity.c:85:33: note: each undeclared identifier is reported only once for each function it appears in
   fs/ext4/block_validity.c: In function 'ext4_protect_reserved_inode':
   fs/ext4/block_validity.c:178:45: error: 'EFSCORRUPTED' undeclared (first use in this function)
     178 |                                 if (err == -EFSCORRUPTED) {
         |                                             ^~~~~~~~~~~~
   fs/ext4/block_validity.c: In function 'ext4_check_blockref':
   fs/ext4/block_validity.c:365:33: error: 'EFSCORRUPTED' undeclared (first use in this function)
     365 |                         return -EFSCORRUPTED;
         |                                 ^~~~~~~~~~~~
--
   fs/ext4/dir.c: In function 'ext4_check_all_de':
>> fs/ext4/dir.c:660:33: error: 'EFSCORRUPTED' undeclared (first use in this function)
     660 |                         return -EFSCORRUPTED;
         |                                 ^~~~~~~~~~~~
   fs/ext4/dir.c:660:33: note: each undeclared identifier is reported only once for each function it appears in
--
   fs/ext4/extents.c: In function '__ext4_ext_check':
>> fs/ext4/extents.c:462:29: error: 'EFSCORRUPTED' undeclared (first use in this function)
     462 |         int max = 0, err = -EFSCORRUPTED;
         |                             ^~~~~~~~~~~~
   fs/ext4/extents.c:462:29: note: each undeclared identifier is reported only once for each function it appears in
>> fs/ext4/extents.c:501:24: error: 'EFSBADCRC' undeclared (first use in this function)
     501 |                 err = -EFSBADCRC;
         |                        ^~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_find_extent':
   fs/ext4/extents.c:904:24: error: 'EFSCORRUPTED' undeclared (first use in this function)
     904 |                 ret = -EFSCORRUPTED;
         |                        ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_insert_index':
   fs/ext4/extents.c:990:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
     990 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_split':
   fs/ext4/extents.c:1080:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1080 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_search_left':
   fs/ext4/extents.c:1477:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1477 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_search_right':
   fs/ext4/extents.c:1545:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1545 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_correct_indexes':
   fs/ext4/extents.c:1718:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1718 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_insert_extent':
   fs/ext4/extents.c:1992:24: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1992 |                 err = -EFSCORRUPTED;
         |                        ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_rm_idx':
   fs/ext4/extents.c:2306:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    2306 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_rm_leaf':
   fs/ext4/extents.c:2620:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    2620 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_remove_space':
   fs/ext4/extents.c:2872:40: error: 'EFSCORRUPTED' undeclared (first use in this function)
    2872 |                                 err = -EFSCORRUPTED;
         |                                        ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_split_extent':
   fs/ext4/extents.c:3394:41: error: 'EFSCORRUPTED' undeclared (first use in this function)
    3394 |                         return ERR_PTR(-EFSCORRUPTED);
         |                                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'convert_initialized_extent':
   fs/ext4/extents.c:3856:32: error: 'EFSCORRUPTED' undeclared (first use in this function)
    3856 |                         err = -EFSCORRUPTED;
         |                                ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_handle_unwritten_extents':
   fs/ext4/extents.c:3927:32: error: 'EFSCORRUPTED' undeclared (first use in this function)
    3927 |                         err = -EFSCORRUPTED;
         |                                ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_map_blocks':
   fs/ext4/extents.c:4226:24: error: 'EFSCORRUPTED' undeclared (first use in this function)
    4226 |                 err = -EFSCORRUPTED;
         |                        ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_shift_path_extents':
   fs/ext4/extents.c:5207:41: error: 'EFSCORRUPTED' undeclared (first use in this function)
    5207 |                                 return -EFSCORRUPTED;
         |                                         ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_shift_extents':
   fs/ext4/extents.c:5378:33: error: 'EFSCORRUPTED' undeclared (first use in this function)
    5378 |                         return -EFSCORRUPTED;
         |                                 ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_clu_mapped':
   fs/ext4/extents.c:5894:24: error: 'EFSCORRUPTED' undeclared (first use in this function)
    5894 |                 err = -EFSCORRUPTED;
         |                        ^~~~~~~~~~~~
   fs/ext4/extents.c: In function 'ext4_ext_replay_update_ex':
   fs/ext4/extents.c:5951:24: error: 'EFSCORRUPTED' undeclared (first use in this function)
    5951 |                 ret = -EFSCORRUPTED;
         |                        ^~~~~~~~~~~~
--
   fs/ext4/fsmap.c: In function 'ext4_getfsmap_find_fixed_metadata':
>> fs/ext4/fsmap.c:483:34: error: 'EFSCORRUPTED' undeclared (first use in this function)
     483 |                         error = -EFSCORRUPTED;
         |                                  ^~~~~~~~~~~~
   fs/ext4/fsmap.c:483:34: note: each undeclared identifier is reported only once for each function it appears in
--
   fs/ext4/ialloc.c: In function 'ext4_validate_inode_bitmap':
>> fs/ext4/ialloc.c:95:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
      95 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/ialloc.c:95:25: note: each undeclared identifier is reported only once for each function it appears in
>> fs/ext4/ialloc.c:108:25: error: 'EFSBADCRC' undeclared (first use in this function)
     108 |                 return -EFSBADCRC;
         |                         ^~~~~~~~~
   fs/ext4/ialloc.c: In function 'ext4_read_inode_bitmap':
   fs/ext4/ialloc.c:133:33: error: 'EFSCORRUPTED' undeclared (first use in this function)
     133 |                 return ERR_PTR(-EFSCORRUPTED);
         |                                 ^~~~~~~~~~~~
   fs/ext4/ialloc.c: In function 'ext4_free_inode':
   fs/ext4/ialloc.c:297:34: error: 'EFSCORRUPTED' undeclared (first use in this function)
     297 |                         fatal = -EFSCORRUPTED;
         |                                  ^~~~~~~~~~~~
   fs/ext4/ialloc.c: In function 'ext4_mark_inode_used':
   fs/ext4/ialloc.c:763:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
     763 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/ialloc.c: In function '__ext4_new_inode':
   fs/ext4/ialloc.c:1188:40: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1188 |                                 err = -EFSCORRUPTED;
         |                                        ^~~~~~~~~~~~
   fs/ext4/ialloc.c: In function 'ext4_orphan_get':
   fs/ext4/ialloc.c:1373:20: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1373 |         int err = -EFSCORRUPTED;
         |                    ^~~~~~~~~~~~
--
   fs/ext4/indirect.c: In function 'ext4_get_branch':
>> fs/ext4/indirect.c:163:32: error: 'EFSCORRUPTED' undeclared (first use in this function)
     163 |                         ret = -EFSCORRUPTED;
         |                                ^~~~~~~~~~~~
   fs/ext4/indirect.c:163:32: note: each undeclared identifier is reported only once for each function it appears in
   fs/ext4/indirect.c: In function 'ext4_ind_map_blocks':
   fs/ext4/indirect.c:605:24: error: 'EFSCORRUPTED' undeclared (first use in this function)
     605 |                 err = -EFSCORRUPTED;
         |                        ^~~~~~~~~~~~
--
   fs/ext4/inline.c: In function 'ext4_find_inline_data_nolock':
>> fs/ext4/inline.c:170:34: error: 'EFSCORRUPTED' undeclared (first use in this function)
     170 |                         error = -EFSCORRUPTED;
         |                                  ^~~~~~~~~~~~
   fs/ext4/inline.c:170:34: note: each undeclared identifier is reported only once for each function it appears in
   fs/ext4/inline.c: In function 'ext4_create_inline_data':
   fs/ext4/inline.c:308:26: error: 'EFSCORRUPTED' undeclared (first use in this function)
     308 |                 error = -EFSCORRUPTED;
         |                          ^~~~~~~~~~~~
   fs/ext4/inline.c: In function 'ext4_update_inline_data':
   fs/ext4/inline.c:363:26: error: 'EFSCORRUPTED' undeclared (first use in this function)
     363 |                 error = -EFSCORRUPTED;
         |                          ^~~~~~~~~~~~
   fs/ext4/inline.c: In function 'ext4_inline_data_truncate':
   fs/ext4/inline.c:1893:40: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1893 |                                 err = -EFSCORRUPTED;
         |                                        ^~~~~~~~~~~~
--
   fs/ext4/inode.c: In function '__check_block_validity':
>> fs/ext4/inode.c:393:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
     393 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/inode.c:393:25: note: each undeclared identifier is reported only once for each function it appears in
   fs/ext4/inode.c: In function 'ext4_map_blocks':
   fs/ext4/inode.c:718:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
     718 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/inode.c: In function 'ext4_map_blocks_atomic_write_slow':
   fs/ext4/inode.c:3572:32: error: 'EFSCORRUPTED' undeclared (first use in this function)
    3572 |                         ret = -EFSCORRUPTED;
         |                                ^~~~~~~~~~~~
   fs/ext4/inode.c: In function 'ext4_inode_blocks_set':
   fs/ext4/inode.c:4677:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    4677 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/inode.c: In function 'ext4_fill_raw_inode':
   fs/ext4/inode.c:4782:31: error: 'EFSCORRUPTED' undeclared (first use in this function)
    4782 |                 err = err ?: -EFSCORRUPTED;
         |                               ^~~~~~~~~~~~
   fs/ext4/inode.c: In function '__ext4_get_inode_loc':
   fs/ext4/inode.c:4811:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    4811 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/inode.c: In function 'check_igot_inode':
   fs/ext4/inode.c:5144:17: error: 'EFSCORRUPTED' undeclared (first use in this function)
    5144 |         return -EFSCORRUPTED;
         |                 ^~~~~~~~~~~~
   fs/ext4/inode.c: In function '__ext4_iget':
   fs/ext4/inode.c:5188:57: error: 'EFSCORRUPTED' undeclared (first use in this function)
    5188 |                 __ext4_error(sb, function, line, false, EFSCORRUPTED, 0,
         |                                                         ^~~~~~~~~~~~
   In file included from fs/ext4/ext4_jbd2.h:17,
                    from fs/ext4/inode.c:46:
>> fs/ext4/inode.c:5251:33: error: 'EFSBADCRC' undeclared (first use in this function)
    5251 |                                 EFSBADCRC, "iget: checksum invalid");
         |                                 ^~~~~~~~~
   fs/ext4/ext4.h:3252:29: note: in definition of macro 'ext4_error_inode_err'
    3252 |                            (err), (fmt), ##__VA_ARGS__)
         |                             ^~~
   fs/ext4/inode.c: In function '__ext4_expand_extra_isize':
   fs/ext4/inode.c:6319:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    6319 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
--
   fs/ext4/ioctl.c: In function 'ext4_update_superblocks_fn':
>> fs/ext4/ioctl.c:246:37: error: 'EFSBADCRC' undeclared (first use in this function)
     246 |                         if (ret == -EFSBADCRC)
         |                                     ^~~~~~~~~
   fs/ext4/ioctl.c:246:37: note: each undeclared identifier is reported only once for each function it appears in
--
   fs/ext4/mballoc.c: In function 'ext4_mb_init_cache':
>> fs/ext4/mballoc.c:1469:32: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1469 |                         err = -EFSCORRUPTED;
         |                                ^~~~~~~~~~~~
   fs/ext4/mballoc.c:1469:32: note: each undeclared identifier is reported only once for each function it appears in
   fs/ext4/mballoc.c: In function 'ext4_mb_init_group':
   fs/ext4/mballoc.c:1606:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1606 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/mballoc.c: In function 'ext4_mb_load_buddy_gfp':
   fs/ext4/mballoc.c:1680:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    1680 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/mballoc.c: In function 'ext4_mb_find_by_goal':
   fs/ext4/mballoc.c:2429:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    2429 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/mballoc.c: In function 'ext4_mb_good_group_nolock':
   fs/ext4/mballoc.c:2772:25: error: 'EFSCORRUPTED' undeclared (first use in this function)
    2772 |                 return -EFSCORRUPTED;
         |                         ^~~~~~~~~~~~
   fs/ext4/mballoc.c: In function 'ext4_mb_mark_diskspace_used':
   fs/ext4/mballoc.c:4226:32: error: 'EFSCORRUPTED' undeclared (first use in this function)
    4226 |                         err = -EFSCORRUPTED;
         |                                ^~~~~~~~~~~~
..


vim +/EFSBADCRC +197 fs/ext4/balloc.c

49f7f9af4bb4d7 Theodore Ts'o     2011-09-09  180  
fd034a84e1ea5c Theodore Ts'o     2011-09-09  181  /* Initializes an uninitialized block bitmap */
aef4885ae14f1d Dmitry Monakhov   2014-10-13  182  static int ext4_init_block_bitmap(struct super_block *sb,
c197855ea14175 Stephen Hemminger 2014-05-12  183  				   struct buffer_head *bh,
fd034a84e1ea5c Theodore Ts'o     2011-09-09  184  				   ext4_group_t block_group,
fd034a84e1ea5c Theodore Ts'o     2011-09-09  185  				   struct ext4_group_desc *gdp)
717d50e4971b81 Andreas Dilger    2007-10-16  186  {
d5b8f31007a937 Theodore Ts'o     2011-09-09  187  	unsigned int bit, bit_max;
717d50e4971b81 Andreas Dilger    2007-10-16  188  	struct ext4_sb_info *sbi = EXT4_SB(sb);
fd034a84e1ea5c Theodore Ts'o     2011-09-09  189  	ext4_fsblk_t start, tmp;
717d50e4971b81 Andreas Dilger    2007-10-16  190  
837c23fbc1b812 Chunguang Xu      2020-11-07  191  	ASSERT(buffer_locked(bh));
717d50e4971b81 Andreas Dilger    2007-10-16  192  
feb0ab32a57e4e Darrick J. Wong   2012-04-29  193  	if (!ext4_group_desc_csum_verify(sb, block_group, gdp)) {
db79e6d1fb1f71 Wang Shilong      2018-05-12  194  		ext4_mark_group_bitmap_corrupted(sb, block_group,
db79e6d1fb1f71 Wang Shilong      2018-05-12  195  					EXT4_GROUP_INFO_BBITMAP_CORRUPT |
db79e6d1fb1f71 Wang Shilong      2018-05-12  196  					EXT4_GROUP_INFO_IBITMAP_CORRUPT);
6a797d27378389 Darrick J. Wong   2015-10-17 @197  		return -EFSBADCRC;
717d50e4971b81 Andreas Dilger    2007-10-16  198  	}
717d50e4971b81 Andreas Dilger    2007-10-16  199  	memset(bh->b_data, 0, sb->s_blocksize);
d00a6d7b40b44e Akinobu Mita      2008-04-17  200  
d5b8f31007a937 Theodore Ts'o     2011-09-09  201  	bit_max = ext4_num_base_meta_clusters(sb, block_group);
5b9554dc5bf008 Theodore Ts'o     2016-07-05  202  	if ((bit_max >> 3) >= bh->b_size)
5b9554dc5bf008 Theodore Ts'o     2016-07-05 @203  		return -EFSCORRUPTED;
5b9554dc5bf008 Theodore Ts'o     2016-07-05  204  
717d50e4971b81 Andreas Dilger    2007-10-16  205  	for (bit = 0; bit < bit_max; bit++)
717d50e4971b81 Andreas Dilger    2007-10-16  206  		ext4_set_bit(bit, bh->b_data);
717d50e4971b81 Andreas Dilger    2007-10-16  207  
d00a6d7b40b44e Akinobu Mita      2008-04-17  208  	start = ext4_group_first_block_no(sb, block_group);
717d50e4971b81 Andreas Dilger    2007-10-16  209  
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  210  	/* Set bits for block and inode bitmaps, and inode table */
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  211  	tmp = ext4_block_bitmap(sb, gdp);
819b23f1c501b1 Theodore Ts'o     2018-06-13  212  	if (ext4_block_in_group(sb, tmp, block_group))
d5b8f31007a937 Theodore Ts'o     2011-09-09  213  		ext4_set_bit(EXT4_B2C(sbi, tmp - start), bh->b_data);
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  214  
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  215  	tmp = ext4_inode_bitmap(sb, gdp);
819b23f1c501b1 Theodore Ts'o     2018-06-13  216  	if (ext4_block_in_group(sb, tmp, block_group))
d5b8f31007a937 Theodore Ts'o     2011-09-09  217  		ext4_set_bit(EXT4_B2C(sbi, tmp - start), bh->b_data);
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  218  
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  219  	tmp = ext4_inode_table(sb, gdp);
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  220  	for (; tmp < ext4_inode_table(sb, gdp) +
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  221  		     sbi->s_itb_per_group; tmp++) {
819b23f1c501b1 Theodore Ts'o     2018-06-13  222  		if (ext4_block_in_group(sb, tmp, block_group))
d5b8f31007a937 Theodore Ts'o     2011-09-09  223  			ext4_set_bit(EXT4_B2C(sbi, tmp - start), bh->b_data);
0bf7e8379ce7e0 Jose R. Santos    2008-06-03  224  	}
d5b8f31007a937 Theodore Ts'o     2011-09-09  225  
717d50e4971b81 Andreas Dilger    2007-10-16  226  	/*
fd034a84e1ea5c Theodore Ts'o     2011-09-09  227  	 * Also if the number of blocks within the group is less than
fd034a84e1ea5c Theodore Ts'o     2011-09-09  228  	 * the blocksize * 8 ( which is the size of bitmap ), set rest
fd034a84e1ea5c Theodore Ts'o     2011-09-09  229  	 * of the block bitmap to 1
717d50e4971b81 Andreas Dilger    2007-10-16  230  	 */
d5b8f31007a937 Theodore Ts'o     2011-09-09  231  	ext4_mark_bitmap_end(num_clusters_in_group(sb, block_group),
fd034a84e1ea5c Theodore Ts'o     2011-09-09  232  			     sb->s_blocksize * 8, bh->b_data);
aef4885ae14f1d Dmitry Monakhov   2014-10-13  233  	return 0;
717d50e4971b81 Andreas Dilger    2007-10-16  234  }
fd034a84e1ea5c Theodore Ts'o     2011-09-09  235  

:::::: The code at line 197 was first introduced by commit
:::::: 6a797d2737838906f2ea0a31686e87c3151e21ca ext4: call out CRC and corruption errors with specific error codes

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
