Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85A6255E2F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745218246; cv=none; b=hB/FfVzGiN0jMjFSWJAxdA5tPghu3zGzL+/v2+JK6wrxALmJPiXSZev0gKlvWJk/KA2O9RWyPChPskZ8sqv/KQA4+52EqRvn5TkdGax5bgc47dlVAo0bUl8xzGeq0p8PksEsPp3QDGGjjeAJogXwIoOG45fvena8cESAp44C2dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745218246; c=relaxed/simple;
	bh=1oQ0/XDOBXqABYkVG/nu+NYxj9rlnmlA1hcR4nnogU8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=XuS5aJ0VBnLk3mNO9/03cw2VFn4DLtvuBzRSkQKcfXXZlQnlCaN75Ul7WyMtERwih71TflSP5z+dfk7cv2ODIqCfSU82W8odi05INMV/wz9ASISsaTRRzF6sBT6LNndOCdTTNCSV2rVjU8v8R/pYhBl1KdFPe1YdXt8zxTAJ87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=e15UkQ9J; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="e15UkQ9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eLXhtOwmFrxlsgKqmRZ8miIFS1cmqmWdFSJXxdbuo4Y=;
  b=e15UkQ9Jw9MUshx5N9P3DXloJKsSSP5gVdX01d2/VfNUxeVEhque8RMX
   3wO19qPkTrRbh9yxc2sCUqxhry4nHK8XWnQyBbouw2Js7hwxJrAy0lxyv
   ILa0oSdtIXjweAC4D34TMeLPyTdepqda0JhC1fSXLz4XrxGdTyq6KLRm7
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,227,1739833200"; 
   d="scan'208";a="114749125"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 08:49:32 +0200
Date: Mon, 21 Apr 2025 08:49:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:vfs.all-ext4-atomic-write-bigalloc-lsfmm-rfcv2-wipv1-0day
 4/4] fs/ext4/inode.c:3406:18-31: opportunity for str_true_false(mixed_mapping)
 (fwd)
Message-ID: <alpine.DEB.2.22.394.2504210848540.3475@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

See the comment on line 3406.

---------- Forwarded message ----------
Date: Mon, 21 Apr 2025 12:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject:
    [riteshharjani:vfs.all-ext4-atomic-write-bigalloc-lsfmm-rfcv2-wipv1-0day
    4/4] fs/ext4/inode.c:3406:18-31: opportunity for
    str_true_false(mixed_mapping)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

tree:   https://github.com/riteshharjani/linux vfs.all-ext4-atomic-write-bigalloc-lsfmm-rfcv2-wipv1-0day
head:   99132117c47d6ba564925d4129dee057f5fd200a
commit: 99132117c47d6ba564925d4129dee057f5fd200a [4/4] ext4: Add multi-fsblock atomic write support with bigalloc
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: nios2-randconfig-r051-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211206.jhmSOTdR-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504211206.jhmSOTdR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/inode.c:3406:18-31: opportunity for str_true_false(mixed_mapping)

vim +3406 fs/ext4/inode.c

b8a6176c214cf9 Jan Kara             2017-11-01  3280
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3281  static void ext4_set_iomap(struct inode *inode, struct iomap *iomap,
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3282  			   struct ext4_map_blocks *map, loff_t offset,
de205114777101 Christoph Hellwig    2021-11-29  3283  			   loff_t length, unsigned int flags)
364443cbcfe70f Jan Kara             2016-11-20  3284  {
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3285  	u8 blkbits = inode->i_blkbits;
364443cbcfe70f Jan Kara             2016-11-20  3286
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3287  	/*
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3288  	 * Writes that span EOF might trigger an I/O size update on completion,
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3289  	 * so consider them to be dirty for the purpose of O_DSYNC, even if
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3290  	 * there is no other metadata changes being made or are pending.
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3291  	 */
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3292  	iomap->flags = 0;
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3293  	if (ext4_inode_datasync_dirty(inode) ||
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3294  	    offset + length > i_size_read(inode))
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3295  		iomap->flags |= IOMAP_F_DIRTY;
545052e9e35a34 Christoph Hellwig    2017-10-01  3296
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3297  	if (map->m_flags & EXT4_MAP_NEW)
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3298  		iomap->flags |= IOMAP_F_NEW;
545052e9e35a34 Christoph Hellwig    2017-10-01  3299
370a6de7651b97 John Garry           2025-03-20  3300  	/* HW-offload atomics are always used */
370a6de7651b97 John Garry           2025-03-20  3301  	if (flags & IOMAP_ATOMIC)
370a6de7651b97 John Garry           2025-03-20  3302  		iomap->flags |= IOMAP_F_ATOMIC_BIO;
370a6de7651b97 John Garry           2025-03-20  3303
de205114777101 Christoph Hellwig    2021-11-29  3304  	if (flags & IOMAP_DAX)
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3305  		iomap->dax_dev = EXT4_SB(inode->i_sb)->s_daxdev;
de205114777101 Christoph Hellwig    2021-11-29  3306  	else
de205114777101 Christoph Hellwig    2021-11-29  3307  		iomap->bdev = inode->i_sb->s_bdev;
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3308  	iomap->offset = (u64) map->m_lblk << blkbits;
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3309  	iomap->length = (u64) map->m_len << blkbits;
545052e9e35a34 Christoph Hellwig    2017-10-01  3310
6386722a329824 Ritesh Harjani       2020-02-28  3311  	if ((map->m_flags & EXT4_MAP_MAPPED) &&
6386722a329824 Ritesh Harjani       2020-02-28  3312  	    !ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
6386722a329824 Ritesh Harjani       2020-02-28  3313  		iomap->flags |= IOMAP_F_MERGED;
6386722a329824 Ritesh Harjani       2020-02-28  3314
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3315  	/*
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3316  	 * Flags passed to ext4_map_blocks() for direct I/O writes can result
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3317  	 * in m_flags having both EXT4_MAP_MAPPED and EXT4_MAP_UNWRITTEN bits
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3318  	 * set. In order for any allocated unwritten extents to be converted
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3319  	 * into written extents correctly within the ->end_io() handler, we
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3320  	 * need to ensure that the iomap->type is set appropriately. Hence, the
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3321  	 * reason why we need to check whether the EXT4_MAP_UNWRITTEN bit has
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3322  	 * been set first.
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3323  	 */
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3324  	if (map->m_flags & EXT4_MAP_UNWRITTEN) {
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3325  		iomap->type = IOMAP_UNWRITTEN;
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3326  		iomap->addr = (u64) map->m_pblk << blkbits;
de205114777101 Christoph Hellwig    2021-11-29  3327  		if (flags & IOMAP_DAX)
de205114777101 Christoph Hellwig    2021-11-29  3328  			iomap->addr += EXT4_SB(inode->i_sb)->s_dax_part_off;
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3329  	} else if (map->m_flags & EXT4_MAP_MAPPED) {
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3330  		iomap->type = IOMAP_MAPPED;
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3331  		iomap->addr = (u64) map->m_pblk << blkbits;
de205114777101 Christoph Hellwig    2021-11-29  3332  		if (flags & IOMAP_DAX)
de205114777101 Christoph Hellwig    2021-11-29  3333  			iomap->addr += EXT4_SB(inode->i_sb)->s_dax_part_off;
ec9d669eba4c27 Zhang Yi             2024-01-27  3334  	} else if (map->m_flags & EXT4_MAP_DELAYED) {
ec9d669eba4c27 Zhang Yi             2024-01-27  3335  		iomap->type = IOMAP_DELALLOC;
ec9d669eba4c27 Zhang Yi             2024-01-27  3336  		iomap->addr = IOMAP_NULL_ADDR;
776722e85d3b09 Jan Kara             2016-11-20  3337  	} else {
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3338  		iomap->type = IOMAP_HOLE;
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3339  		iomap->addr = IOMAP_NULL_ADDR;
545052e9e35a34 Christoph Hellwig    2017-10-01  3340  	}
545052e9e35a34 Christoph Hellwig    2017-10-01  3341  }
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3342) /*
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3343)  * ext4_map_blocks_atomic: Helper routine to ensure the entire requested mapping
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3344)  * [map.m_lblk, map.m_len] is one single contiguous extent with no mixed
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3345)  * mappings. This function is only called when the bigalloc is enabled, so we
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3346)  * know that the allocated physical extent start is always aligned properly.
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3347)  *
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3348)  * We call EXT4_GET_BLOCKS_ZERO only when the underlying physical extent for the
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3349)  * requested range does not have a single mapping type (Hole, Mapped, or
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3350)  * Unwritten) throughout. In that case we will loop over the requested range to
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3351)  * allocate and zero out the unwritten / holes in between, to get a single
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3352)  * mapped extent from [m_lblk, m_len]. This case is mostly non-performance
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3353)  * critical path, so it should be ok to loop using ext4_map_blocks() with
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3354)  * appropriate flags to allocate & zero the underlying short holes/unwritten
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3355)  * extents within the requested range.
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3356)  */
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3357) static int ext4_map_blocks_atomic(handle_t *handle, struct inode *inode,
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3358) 				  struct ext4_map_blocks *map)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3359) {
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3360) 	ext4_lblk_t m_lblk = map->m_lblk;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3361) 	unsigned int m_len = map->m_len;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3362) 	unsigned int mapped_len = 0, flags = 0;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3363) 	u8 blkbits = inode->i_blkbits;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3364) 	bool mixed_mapping = false;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3365) 	int ret = 0;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3366)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3367) 	WARN_ON(!ext4_has_feature_bigalloc(inode->i_sb));
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3368)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3369) 	if (((loff_t)map->m_lblk << blkbits) >= i_size_read(inode)) {
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3370) 		flags = EXT4_GET_BLOCKS_CREATE;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3371) 	} else {
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3372) 		ret = ext4_map_blocks(handle, inode, map, 0);
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3373) 		if ((ret == 0 && map->m_len >= m_len) ||
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3374) 			(ret >= m_len && map->m_flags & EXT4_MAP_UNWRITTEN)) {
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3375) 			flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3376) 		} else {
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3377) 			mixed_mapping = true;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3378) 			flags = EXT4_GET_BLOCKS_CREATE_ZERO;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3379) 		}
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3380) 	}
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3381)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3382) 	do {
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3383) 		ret = ext4_map_blocks(handle, inode, map, flags);
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3384) 		if (ret < 0)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3385) 			goto out;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3386) 		WARN_ON_ONCE(!mixed_mapping && ret < m_len);
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3387) 		if (ret == m_len)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3388) 			goto out;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3389) 		mapped_len += map->m_len;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3390) 		map->m_lblk += map->m_len;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3391) 		map->m_len = m_len - mapped_len;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3392) 	} while (mapped_len < m_len);
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3393)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3394) 	/*
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3395) 	 * We might have done some work in above loop, so we need to query the
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3396) 	 * start of the physical extent, based on the origin m_lblk and m_len.
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3397) 	 * Let's also ensure we were able to allocate the required range for
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3398) 	 * mixed mapping case.
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3399) 	 */
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3400) 	map->m_lblk = m_lblk;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3401) 	map->m_len = m_len;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3402)
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3403) 	ret = ext4_map_blocks(handle, inode, map, 0);
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3404) 	if (ret != m_len) {
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3405) 		ext4_warning_inode(inode, "allocation failed for atomic write request pos:%u, len:%u, mixed_mapping:%s\n",
99132117c47d6b Ritesh Harjani (IBM  2025-03-23 @3406) 			m_lblk, m_len, mixed_mapping ? "true" : "false");
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3407) 		ret = -EINVAL;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3408) 	}
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3409) out:
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3410) 	return ret;
99132117c47d6b Ritesh Harjani (IBM  2025-03-23  3411) }
c8fdfe29418745 Matthew Bobrowski    2019-11-05  3412

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
