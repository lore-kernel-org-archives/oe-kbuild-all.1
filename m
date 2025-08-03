Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CD216EB42
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754246349; cv=none; b=WJCD+erhB6KBLof9C9g0ah11B1/Odlco+PYD/eQqyZfRqZ4uxMpwRXJsdNTU8e+EXTm1dcS/gJAXdeZ3FuCCkDNBG+XLPNKwZ3YvfA5fXafUTea8DG42TjQBS035CFPg5clKbxodgrIaWwAgwMIlkbV+NMHynvmXTSCSQFS5W3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754246349; c=relaxed/simple;
	bh=jMswNCLuyhSDrudeCWTZ5XIPvwZxI1P9rbgzfxiFOR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9ETC3mF5oyQGWqj+5uWr4L8MGZ5ZIE/wfjmvc/kYxYfpv8w5BPd1+ZIFCeEue9N/KwhHrkHB56SU+HRvNFDAhy2ge7UiXY+KE6sCGu8o28YrCQqMNbC4t5/qZXZSGmIXReJyHDEwT3JXad6RLpjPiS3hZpC42ClOZhQOERRegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkpvoPGR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkpvoPGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754246346; x=1785782346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMswNCLuyhSDrudeCWTZ5XIPvwZxI1P9rbgzfxiFOR8=;
  b=IkpvoPGRm0GlqULZrtKCNTVB9Oh+28ZOp1ZUyffJwfNVx9iTartVAItn
   +EEOEQyPcwE5u+Y/yMYGZZTwf4rciwIugV1YKkG5IvMKEIWtuVWeAaD0t
   6vw9V8QuBl6ADi2pNyb+zyqmyKerdn2XLHO3tsR+J8iXB1sGu0a0ErUFU
   Fl7u0YWQPGXv8/KXuoQmsbLe7A7ucKA0BesqBC/AHrpZtb3zp2b5cTUbl
   tOkRXwao40QaILBP1vHEcXyckhQD3ljY2E5Ddo2oZgq/EvmB7YUqPxIVp
   FUcaJYBn2vMTjUdtO6oKpbH+4QbckCoPI4JC4wNY4lAU1LmRmWDeiY3UM
   g==;
X-CSE-ConnectionGUID: vFNuEpkVTIypJC4tkCFKdw==
X-CSE-MsgGUID: tO5U8u3bRICLW9SQjBKlmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="60328244"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60328244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 11:39:06 -0700
X-CSE-ConnectionGUID: G7xBNS9XSwCgmCAIcKISxA==
X-CSE-MsgGUID: EZXthl9ySwmsZtefZmxuTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164773646"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 03 Aug 2025 11:39:05 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uidbq-0001fL-2e;
	Sun, 03 Aug 2025 18:39:02 +0000
Date: Sun, 3 Aug 2025 20:38:13 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] fs/btrfs/extent_io.c:3203:26:
 warning: 'last_extent_end' may be used uninitialized
Message-ID: <202508032052.ohxTqFUt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c1a4113af4ffd59599729ba53e1fdc4b44429bc7
commit: 49d640d2946c35a17b051d54171a032dd95b0f50 [1/1] btrfs: fix race when detecting delalloc ranges during fiemap
config: x86_64-buildonly-randconfig-2001-20250803 (https://download.01.org/0day-ci/archive/20250803/202508032052.ohxTqFUt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508032052.ohxTqFUt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508032052.ohxTqFUt-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.c: In function 'extent_fiemap':
>> fs/btrfs/extent_io.c:3203:26: warning: 'last_extent_end' may be used uninitialized [-Wmaybe-uninitialized]
    3203 |         if (cache.cached && cache.offset + cache.len >= last_extent_end) {
         |             ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3021:13: note: 'last_extent_end' was declared here
    3021 |         u64 last_extent_end;
         |             ^~~~~~~~~~~~~~~


vim +/last_extent_end +3203 fs/btrfs/extent_io.c

ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3011  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3012  int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3013  		  u64 start, u64 len)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3014  {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3015  	const u64 ino = btrfs_ino(inode);
49d640d2946c35 Filipe Manana  2024-02-28  3016  	struct extent_state *cached_state = NULL;
b3e744fe6d289b Filipe Manana  2022-11-11  3017  	struct extent_state *delalloc_cached_state = NULL;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3018  	struct btrfs_path *path;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3019  	struct fiemap_cache cache = { 0 };
61dbb952f0a5f5 Filipe Manana  2022-10-11  3020  	struct btrfs_backref_share_check_ctx *backref_ctx;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3021  	u64 last_extent_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3022  	u64 prev_extent_end;
ded566b4637f1b Josef Bacik    2024-02-12  3023  	u64 range_start;
ded566b4637f1b Josef Bacik    2024-02-12  3024  	u64 range_end;
ded566b4637f1b Josef Bacik    2024-02-12  3025  	const u64 sectorsize = inode->root->fs_info->sectorsize;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3026  	bool stopped = false;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3027  	int ret;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3028  
49d640d2946c35 Filipe Manana  2024-02-28  3029  	cache.entries_size = PAGE_SIZE / sizeof(struct btrfs_fiemap_entry);
49d640d2946c35 Filipe Manana  2024-02-28  3030  	cache.entries = kmalloc_array(cache.entries_size,
49d640d2946c35 Filipe Manana  2024-02-28  3031  				      sizeof(struct btrfs_fiemap_entry),
49d640d2946c35 Filipe Manana  2024-02-28  3032  				      GFP_KERNEL);
84a7949d409753 Filipe Manana  2022-10-11  3033  	backref_ctx = btrfs_alloc_backref_share_check_ctx();
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3034  	path = btrfs_alloc_path();
49d640d2946c35 Filipe Manana  2024-02-28  3035  	if (!cache.entries || !backref_ctx || !path) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3036  		ret = -ENOMEM;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3037  		goto out;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3038  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3039  
49d640d2946c35 Filipe Manana  2024-02-28  3040  restart:
ded566b4637f1b Josef Bacik    2024-02-12  3041  	range_start = round_down(start, sectorsize);
ded566b4637f1b Josef Bacik    2024-02-12  3042  	range_end = round_up(start + len, sectorsize);
ded566b4637f1b Josef Bacik    2024-02-12  3043  	prev_extent_end = range_start;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3044  
49d640d2946c35 Filipe Manana  2024-02-28  3045  	lock_extent(&inode->io_tree, range_start, range_end, &cached_state);
49d640d2946c35 Filipe Manana  2024-02-28  3046  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3047  	ret = fiemap_find_last_extent_offset(inode, path, &last_extent_end);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3048  	if (ret < 0)
49d640d2946c35 Filipe Manana  2024-02-28  3049  		goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3050  	btrfs_release_path(path);
fe09e16cc8d444 Liu Bo         2013-09-22  3051  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3052  	path->reada = READA_FORWARD;
ded566b4637f1b Josef Bacik    2024-02-12  3053  	ret = fiemap_search_slot(inode, path, range_start);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3054  	if (ret < 0) {
49d640d2946c35 Filipe Manana  2024-02-28  3055  		goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3056  	} else if (ret > 0) {
b8f164e3e67f22 Filipe Manana  2022-09-01  3057  		/*
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3058  		 * No file extent item found, but we may have delalloc between
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3059  		 * the current offset and i_size. So check for that.
b8f164e3e67f22 Filipe Manana  2022-09-01  3060  		 */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3061  		ret = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3062  		goto check_eof_delalloc;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3063  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3064  
ded566b4637f1b Josef Bacik    2024-02-12  3065  	while (prev_extent_end < range_end) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3066  		struct extent_buffer *leaf = path->nodes[0];
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3067  		struct btrfs_file_extent_item *ei;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3068  		struct btrfs_key key;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3069  		u64 extent_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3070  		u64 extent_len;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3071  		u64 extent_offset = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3072  		u64 extent_gen;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3073  		u64 disk_bytenr = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3074  		u64 flags = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3075  		int extent_type;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3076  		u8 compression;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3077  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3078  		btrfs_item_key_to_cpu(leaf, &key, path->slots[0]);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3079  		if (key.objectid != ino || key.type != BTRFS_EXTENT_DATA_KEY)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3080  			break;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3081  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3082  		extent_end = btrfs_file_extent_end(path);
b8f164e3e67f22 Filipe Manana  2022-09-01  3083  
fe09e16cc8d444 Liu Bo         2013-09-22  3084  		/*
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3085  		 * The first iteration can leave us at an extent item that ends
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3086  		 * before our range's start. Move to the next item.
fe09e16cc8d444 Liu Bo         2013-09-22  3087  		 */
ded566b4637f1b Josef Bacik    2024-02-12  3088  		if (extent_end <= range_start)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3089  			goto next_item;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3090  
877c14767f106a Filipe Manana  2022-10-11  3091  		backref_ctx->curr_leaf_bytenr = leaf->start;
877c14767f106a Filipe Manana  2022-10-11  3092  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3093  		/* We have in implicit hole (NO_HOLES feature enabled). */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3094  		if (prev_extent_end < key.offset) {
ded566b4637f1b Josef Bacik    2024-02-12  3095  			const u64 hole_end = min(key.offset, range_end) - 1;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3096  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3097  			ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3098  						  &delalloc_cached_state,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3099  						  backref_ctx, 0, 0, 0,
ded566b4637f1b Josef Bacik    2024-02-12  3100  						  prev_extent_end, hole_end);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3101  			if (ret < 0) {
49d640d2946c35 Filipe Manana  2024-02-28  3102  				goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3103  			} else if (ret > 0) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3104  				/* fiemap_fill_next_extent() told us to stop. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3105  				stopped = true;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3106  				break;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3107  			}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3108  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3109  			/* We've reached the end of the fiemap range, stop. */
ded566b4637f1b Josef Bacik    2024-02-12  3110  			if (key.offset >= range_end) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3111  				stopped = true;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3112  				break;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3113  			}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3114  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3115  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3116  		extent_len = extent_end - key.offset;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3117  		ei = btrfs_item_ptr(leaf, path->slots[0],
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3118  				    struct btrfs_file_extent_item);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3119  		compression = btrfs_file_extent_compression(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3120  		extent_type = btrfs_file_extent_type(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3121  		extent_gen = btrfs_file_extent_generation(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3122  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3123  		if (extent_type != BTRFS_FILE_EXTENT_INLINE) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3124  			disk_bytenr = btrfs_file_extent_disk_bytenr(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3125  			if (compression == BTRFS_COMPRESS_NONE)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3126  				extent_offset = btrfs_file_extent_offset(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3127  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3128  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3129  		if (compression != BTRFS_COMPRESS_NONE)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3130  			flags |= FIEMAP_EXTENT_ENCODED;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3131  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3132  		if (extent_type == BTRFS_FILE_EXTENT_INLINE) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3133  			flags |= FIEMAP_EXTENT_DATA_INLINE;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3134  			flags |= FIEMAP_EXTENT_NOT_ALIGNED;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3135  			ret = emit_fiemap_extent(fieinfo, &cache, key.offset, 0,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3136  						 extent_len, flags);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3137  		} else if (extent_type == BTRFS_FILE_EXTENT_PREALLOC) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3138  			ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3139  						  &delalloc_cached_state,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3140  						  backref_ctx,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3141  						  disk_bytenr, extent_offset,
84a7949d409753 Filipe Manana  2022-10-11  3142  						  extent_gen, key.offset,
84a7949d409753 Filipe Manana  2022-10-11  3143  						  extent_end - 1);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3144  		} else if (disk_bytenr == 0) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3145  			/* We have an explicit hole. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3146  			ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3147  						  &delalloc_cached_state,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3148  						  backref_ctx, 0, 0, 0,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3149  						  key.offset, extent_end - 1);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3150  		} else {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3151  			/* We have a regular extent. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3152  			if (fieinfo->fi_extents_max) {
ceb707da9ad92a Filipe Manana  2022-10-11  3153  				ret = btrfs_is_data_extent_shared(inode,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3154  								  disk_bytenr,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3155  								  extent_gen,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3156  								  backref_ctx);
dc046b10c8b7d4 Josef Bacik    2014-09-10  3157  				if (ret < 0)
49d640d2946c35 Filipe Manana  2024-02-28  3158  					goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3159  				else if (ret > 0)
fe09e16cc8d444 Liu Bo         2013-09-22  3160  					flags |= FIEMAP_EXTENT_SHARED;
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3161  			}
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3162  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3163  			ret = emit_fiemap_extent(fieinfo, &cache, key.offset,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3164  						 disk_bytenr + extent_offset,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3165  						 extent_len, flags);
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3166  		}
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3167  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3168  		if (ret < 0) {
49d640d2946c35 Filipe Manana  2024-02-28  3169  			goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3170  		} else if (ret > 0) {
49d640d2946c35 Filipe Manana  2024-02-28  3171  			/* emit_fiemap_extent() told us to stop. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3172  			stopped = true;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3173  			break;
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3174  		}
09fbc1c8e7b00e Filipe Manana  2022-09-01  3175  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3176  		prev_extent_end = extent_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3177  next_item:
09fbc1c8e7b00e Filipe Manana  2022-09-01  3178  		if (fatal_signal_pending(current)) {
09fbc1c8e7b00e Filipe Manana  2022-09-01  3179  			ret = -EINTR;
49d640d2946c35 Filipe Manana  2024-02-28  3180  			goto out_unlock;
09fbc1c8e7b00e Filipe Manana  2022-09-01  3181  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3182  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3183  		ret = fiemap_next_leaf_item(inode, path);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3184  		if (ret < 0) {
49d640d2946c35 Filipe Manana  2024-02-28  3185  			goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3186  		} else if (ret > 0) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3187  			/* No more file extent items for this inode. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3188  			break;
26e726afe01c1c Chengyu Song   2015-03-24  3189  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3190  		cond_resched();
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3191  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3192  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3193  check_eof_delalloc:
ded566b4637f1b Josef Bacik    2024-02-12  3194  	if (!stopped && prev_extent_end < range_end) {
b3e744fe6d289b Filipe Manana  2022-11-11  3195  		ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3196  					  &delalloc_cached_state, backref_ctx,
ded566b4637f1b Josef Bacik    2024-02-12  3197  					  0, 0, 0, prev_extent_end, range_end - 1);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3198  		if (ret < 0)
49d640d2946c35 Filipe Manana  2024-02-28  3199  			goto out_unlock;
ded566b4637f1b Josef Bacik    2024-02-12  3200  		prev_extent_end = range_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3201  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3202  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01 @3203  	if (cache.cached && cache.offset + cache.len >= last_extent_end) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3204  		const u64 i_size = i_size_read(&inode->vfs_inode);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3205  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3206  		if (prev_extent_end < i_size) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3207  			u64 delalloc_start;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3208  			u64 delalloc_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3209  			bool delalloc;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3210  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3211  			delalloc = btrfs_find_delalloc_in_range(inode,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3212  								prev_extent_end,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3213  								i_size - 1,
b3e744fe6d289b Filipe Manana  2022-11-11  3214  								&delalloc_cached_state,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3215  								&delalloc_start,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3216  								&delalloc_end);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3217  			if (!delalloc)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3218  				cache.flags |= FIEMAP_EXTENT_LAST;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3219  		} else {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3220  			cache.flags |= FIEMAP_EXTENT_LAST;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3221  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3222  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3223  
49d640d2946c35 Filipe Manana  2024-02-28  3224  out_unlock:
49d640d2946c35 Filipe Manana  2024-02-28  3225  	unlock_extent(&inode->io_tree, range_start, range_end, &cached_state);
49d640d2946c35 Filipe Manana  2024-02-28  3226  
49d640d2946c35 Filipe Manana  2024-02-28  3227  	if (ret == BTRFS_FIEMAP_FLUSH_CACHE) {
49d640d2946c35 Filipe Manana  2024-02-28  3228  		btrfs_release_path(path);
49d640d2946c35 Filipe Manana  2024-02-28  3229  		ret = flush_fiemap_cache(fieinfo, &cache);
49d640d2946c35 Filipe Manana  2024-02-28  3230  		if (ret)
49d640d2946c35 Filipe Manana  2024-02-28  3231  			goto out;
49d640d2946c35 Filipe Manana  2024-02-28  3232  		len -= cache.next_search_offset - start;
49d640d2946c35 Filipe Manana  2024-02-28  3233  		start = cache.next_search_offset;
49d640d2946c35 Filipe Manana  2024-02-28  3234  		goto restart;
49d640d2946c35 Filipe Manana  2024-02-28  3235  	} else if (ret < 0) {
49d640d2946c35 Filipe Manana  2024-02-28  3236  		goto out;
49d640d2946c35 Filipe Manana  2024-02-28  3237  	}
49d640d2946c35 Filipe Manana  2024-02-28  3238  
49d640d2946c35 Filipe Manana  2024-02-28  3239  	/*
49d640d2946c35 Filipe Manana  2024-02-28  3240  	 * Must free the path before emitting to the fiemap buffer because we
49d640d2946c35 Filipe Manana  2024-02-28  3241  	 * may have a non-cloned leaf and if the fiemap buffer is memory mapped
49d640d2946c35 Filipe Manana  2024-02-28  3242  	 * to a file, a write into it (through btrfs_page_mkwrite()) may trigger
49d640d2946c35 Filipe Manana  2024-02-28  3243  	 * waiting for an ordered extent that in order to complete needs to
49d640d2946c35 Filipe Manana  2024-02-28  3244  	 * modify that leaf, therefore leading to a deadlock.
49d640d2946c35 Filipe Manana  2024-02-28  3245  	 */
49d640d2946c35 Filipe Manana  2024-02-28  3246  	btrfs_free_path(path);
49d640d2946c35 Filipe Manana  2024-02-28  3247  	path = NULL;
49d640d2946c35 Filipe Manana  2024-02-28  3248  
49d640d2946c35 Filipe Manana  2024-02-28  3249  	ret = flush_fiemap_cache(fieinfo, &cache);
49d640d2946c35 Filipe Manana  2024-02-28  3250  	if (ret)
49d640d2946c35 Filipe Manana  2024-02-28  3251  		goto out;
49d640d2946c35 Filipe Manana  2024-02-28  3252  
5c5aff98f83abc David Sterba   2019-03-20  3253  	ret = emit_last_fiemap_cache(fieinfo, &cache);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3254  out:
b3e744fe6d289b Filipe Manana  2022-11-11  3255  	free_extent_state(delalloc_cached_state);
49d640d2946c35 Filipe Manana  2024-02-28  3256  	kfree(cache.entries);
84a7949d409753 Filipe Manana  2022-10-11  3257  	btrfs_free_backref_share_ctx(backref_ctx);
e02d48eaaed77f Colin Ian King 2019-07-05  3258  	btrfs_free_path(path);
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3259  	return ret;
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3260  }
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3261  

:::::: The code at line 3203 was first introduced by commit
:::::: ac3c0d36a2a2f7a8f9778faef3f2639f5bf29d44 btrfs: make fiemap more efficient and accurate reporting extent sharedness

:::::: TO: Filipe Manana <fdmanana@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
