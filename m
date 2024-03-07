Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E5682891
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709811061; cv=none; b=lsuTHveNdb/wuWqfQOScxBaSC24yZkCgZlAY14LpofIPIOtQcN1I3FnZBwVMlcb43Y5Jx38BAz1kjGusH3tdrfAvFCYD5sRqKThXuO5hhOhsQXrzJ0VTWrBEORUOBlqNPNaDHhfdlkLsK1rZST15KTiSofkMMu6WOgCXnUnVqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709811061; c=relaxed/simple;
	bh=HRkNkU9Ia5XFyjG2XEH3c/ueOLKfzwp4TDjYOAOBVfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KBQW35ffVvwgBANFgdrNiDRmBGuAyB7DwXJS8hWlHU+N8bKvdfk3Hh4apLihMuiSzrhwQRoZ2x+n0GcA0xwTUgTfvSvLChUBy/K2l+LodlJeZcX4EfUTg3od1qM6uKNaJNLCxEe79s5pQnh7MIatb3hg8JzHpL1Txk7hQKsr35g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHE2RRW8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHE2RRW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709811059; x=1741347059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HRkNkU9Ia5XFyjG2XEH3c/ueOLKfzwp4TDjYOAOBVfk=;
  b=ZHE2RRW8emRHYBMYk+fI7ORLEMUMSKsBSuG27SVmnAREyM61DFjTmP5f
   T3b6bnD9K1TAKWhR2RMWLRKrc4agwMgjSNQKSHoBQRnvBP9vBRbHNzcP2
   lPIHsNmCRKUbS7cLw6uTVmP2m+JViEo19DXw96WyGMpZW1RJQ5GGPAJOb
   00yqaZgU+7CnnM7D+ce1NOFhwKh+6EygTSE4yzsxn2vQ/vM238hgPOy2D
   apqQ1ohhVd61fCmsJRXfM2airdJ/vdcL+qBW6EiIPZHHEvZSVP/F1cIe6
   U0kKfnVQA1UyTLyluWp4yxRkeVtCldyINBqiXYstReZwqOABgDBl2kcPF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4321000"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4321000"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 03:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="47574436"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2024 03:30:56 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riBxd-000589-1s;
	Thu, 07 Mar 2024 11:30:53 +0000
Date: Thu, 7 Mar 2024 19:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: [linux-next:master 11882/12647] fs/btrfs/extent_io.c:3246:26:
 warning: 'last_extent_end' may be used uninitialized
Message-ID: <202403071947.NUYuBx0G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1843e16d2df9d98427ef8045589571749d627cf7
commit: 978b63f7464abcfd364a6c95f734282c50f3decf [11882/12647] btrfs: fix race when detecting delalloc ranges during fiemap
config: s390-randconfig-c005-20230325 (https://download.01.org/0day-ci/archive/20240307/202403071947.NUYuBx0G-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071947.NUYuBx0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071947.NUYuBx0G-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.c: In function 'extent_fiemap':
>> fs/btrfs/extent_io.c:3246:26: warning: 'last_extent_end' may be used uninitialized [-Wmaybe-uninitialized]
    3246 |         if (cache.cached && cache.offset + cache.len >= last_extent_end) {
         |             ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3064:13: note: 'last_extent_end' was declared here
    3064 |         u64 last_extent_end;
         |             ^~~~~~~~~~~~~~~


vim +/last_extent_end +3246 fs/btrfs/extent_io.c

ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3054  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3055  int extent_fiemap(struct btrfs_inode *inode, struct fiemap_extent_info *fieinfo,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3056  		  u64 start, u64 len)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3057  {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3058  	const u64 ino = btrfs_ino(inode);
978b63f7464abc Filipe Manana  2024-02-28  3059  	struct extent_state *cached_state = NULL;
b3e744fe6d289b Filipe Manana  2022-11-11  3060  	struct extent_state *delalloc_cached_state = NULL;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3061  	struct btrfs_path *path;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3062  	struct fiemap_cache cache = { 0 };
61dbb952f0a5f5 Filipe Manana  2022-10-11  3063  	struct btrfs_backref_share_check_ctx *backref_ctx;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3064  	u64 last_extent_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3065  	u64 prev_extent_end;
b0ad381fa76902 Josef Bacik    2024-02-12  3066  	u64 range_start;
b0ad381fa76902 Josef Bacik    2024-02-12  3067  	u64 range_end;
b0ad381fa76902 Josef Bacik    2024-02-12  3068  	const u64 sectorsize = inode->root->fs_info->sectorsize;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3069  	bool stopped = false;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3070  	int ret;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3071  
978b63f7464abc Filipe Manana  2024-02-28  3072  	cache.entries_size = PAGE_SIZE / sizeof(struct btrfs_fiemap_entry);
978b63f7464abc Filipe Manana  2024-02-28  3073  	cache.entries = kmalloc_array(cache.entries_size,
978b63f7464abc Filipe Manana  2024-02-28  3074  				      sizeof(struct btrfs_fiemap_entry),
978b63f7464abc Filipe Manana  2024-02-28  3075  				      GFP_KERNEL);
84a7949d409753 Filipe Manana  2022-10-11  3076  	backref_ctx = btrfs_alloc_backref_share_check_ctx();
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3077  	path = btrfs_alloc_path();
978b63f7464abc Filipe Manana  2024-02-28  3078  	if (!cache.entries || !backref_ctx || !path) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3079  		ret = -ENOMEM;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3080  		goto out;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3081  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3082  
978b63f7464abc Filipe Manana  2024-02-28  3083  restart:
b0ad381fa76902 Josef Bacik    2024-02-12  3084  	range_start = round_down(start, sectorsize);
b0ad381fa76902 Josef Bacik    2024-02-12  3085  	range_end = round_up(start + len, sectorsize);
b0ad381fa76902 Josef Bacik    2024-02-12  3086  	prev_extent_end = range_start;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3087  
978b63f7464abc Filipe Manana  2024-02-28  3088  	lock_extent(&inode->io_tree, range_start, range_end, &cached_state);
978b63f7464abc Filipe Manana  2024-02-28  3089  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3090  	ret = fiemap_find_last_extent_offset(inode, path, &last_extent_end);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3091  	if (ret < 0)
978b63f7464abc Filipe Manana  2024-02-28  3092  		goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3093  	btrfs_release_path(path);
fe09e16cc8d444 Liu Bo         2013-09-22  3094  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3095  	path->reada = READA_FORWARD;
b0ad381fa76902 Josef Bacik    2024-02-12  3096  	ret = fiemap_search_slot(inode, path, range_start);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3097  	if (ret < 0) {
978b63f7464abc Filipe Manana  2024-02-28  3098  		goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3099  	} else if (ret > 0) {
b8f164e3e67f22 Filipe Manana  2022-09-01  3100  		/*
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3101  		 * No file extent item found, but we may have delalloc between
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3102  		 * the current offset and i_size. So check for that.
b8f164e3e67f22 Filipe Manana  2022-09-01  3103  		 */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3104  		ret = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3105  		goto check_eof_delalloc;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3106  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3107  
b0ad381fa76902 Josef Bacik    2024-02-12  3108  	while (prev_extent_end < range_end) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3109  		struct extent_buffer *leaf = path->nodes[0];
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3110  		struct btrfs_file_extent_item *ei;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3111  		struct btrfs_key key;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3112  		u64 extent_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3113  		u64 extent_len;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3114  		u64 extent_offset = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3115  		u64 extent_gen;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3116  		u64 disk_bytenr = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3117  		u64 flags = 0;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3118  		int extent_type;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3119  		u8 compression;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3120  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3121  		btrfs_item_key_to_cpu(leaf, &key, path->slots[0]);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3122  		if (key.objectid != ino || key.type != BTRFS_EXTENT_DATA_KEY)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3123  			break;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3124  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3125  		extent_end = btrfs_file_extent_end(path);
b8f164e3e67f22 Filipe Manana  2022-09-01  3126  
fe09e16cc8d444 Liu Bo         2013-09-22  3127  		/*
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3128  		 * The first iteration can leave us at an extent item that ends
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3129  		 * before our range's start. Move to the next item.
fe09e16cc8d444 Liu Bo         2013-09-22  3130  		 */
b0ad381fa76902 Josef Bacik    2024-02-12  3131  		if (extent_end <= range_start)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3132  			goto next_item;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3133  
877c14767f106a Filipe Manana  2022-10-11  3134  		backref_ctx->curr_leaf_bytenr = leaf->start;
877c14767f106a Filipe Manana  2022-10-11  3135  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3136  		/* We have in implicit hole (NO_HOLES feature enabled). */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3137  		if (prev_extent_end < key.offset) {
b0ad381fa76902 Josef Bacik    2024-02-12  3138  			const u64 hole_end = min(key.offset, range_end) - 1;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3139  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3140  			ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3141  						  &delalloc_cached_state,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3142  						  backref_ctx, 0, 0, 0,
b0ad381fa76902 Josef Bacik    2024-02-12  3143  						  prev_extent_end, hole_end);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3144  			if (ret < 0) {
978b63f7464abc Filipe Manana  2024-02-28  3145  				goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3146  			} else if (ret > 0) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3147  				/* fiemap_fill_next_extent() told us to stop. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3148  				stopped = true;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3149  				break;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3150  			}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3151  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3152  			/* We've reached the end of the fiemap range, stop. */
b0ad381fa76902 Josef Bacik    2024-02-12  3153  			if (key.offset >= range_end) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3154  				stopped = true;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3155  				break;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3156  			}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3157  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3158  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3159  		extent_len = extent_end - key.offset;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3160  		ei = btrfs_item_ptr(leaf, path->slots[0],
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3161  				    struct btrfs_file_extent_item);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3162  		compression = btrfs_file_extent_compression(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3163  		extent_type = btrfs_file_extent_type(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3164  		extent_gen = btrfs_file_extent_generation(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3165  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3166  		if (extent_type != BTRFS_FILE_EXTENT_INLINE) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3167  			disk_bytenr = btrfs_file_extent_disk_bytenr(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3168  			if (compression == BTRFS_COMPRESS_NONE)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3169  				extent_offset = btrfs_file_extent_offset(leaf, ei);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3170  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3171  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3172  		if (compression != BTRFS_COMPRESS_NONE)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3173  			flags |= FIEMAP_EXTENT_ENCODED;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3174  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3175  		if (extent_type == BTRFS_FILE_EXTENT_INLINE) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3176  			flags |= FIEMAP_EXTENT_DATA_INLINE;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3177  			flags |= FIEMAP_EXTENT_NOT_ALIGNED;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3178  			ret = emit_fiemap_extent(fieinfo, &cache, key.offset, 0,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3179  						 extent_len, flags);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3180  		} else if (extent_type == BTRFS_FILE_EXTENT_PREALLOC) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3181  			ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3182  						  &delalloc_cached_state,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3183  						  backref_ctx,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3184  						  disk_bytenr, extent_offset,
84a7949d409753 Filipe Manana  2022-10-11  3185  						  extent_gen, key.offset,
84a7949d409753 Filipe Manana  2022-10-11  3186  						  extent_end - 1);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3187  		} else if (disk_bytenr == 0) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3188  			/* We have an explicit hole. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3189  			ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3190  						  &delalloc_cached_state,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3191  						  backref_ctx, 0, 0, 0,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3192  						  key.offset, extent_end - 1);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3193  		} else {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3194  			/* We have a regular extent. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3195  			if (fieinfo->fi_extents_max) {
ceb707da9ad92a Filipe Manana  2022-10-11  3196  				ret = btrfs_is_data_extent_shared(inode,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3197  								  disk_bytenr,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3198  								  extent_gen,
61dbb952f0a5f5 Filipe Manana  2022-10-11  3199  								  backref_ctx);
dc046b10c8b7d4 Josef Bacik    2014-09-10  3200  				if (ret < 0)
978b63f7464abc Filipe Manana  2024-02-28  3201  					goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3202  				else if (ret > 0)
fe09e16cc8d444 Liu Bo         2013-09-22  3203  					flags |= FIEMAP_EXTENT_SHARED;
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3204  			}
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3205  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3206  			ret = emit_fiemap_extent(fieinfo, &cache, key.offset,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3207  						 disk_bytenr + extent_offset,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3208  						 extent_len, flags);
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3209  		}
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3210  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3211  		if (ret < 0) {
978b63f7464abc Filipe Manana  2024-02-28  3212  			goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3213  		} else if (ret > 0) {
978b63f7464abc Filipe Manana  2024-02-28  3214  			/* emit_fiemap_extent() told us to stop. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3215  			stopped = true;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3216  			break;
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3217  		}
09fbc1c8e7b00e Filipe Manana  2022-09-01  3218  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3219  		prev_extent_end = extent_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3220  next_item:
09fbc1c8e7b00e Filipe Manana  2022-09-01  3221  		if (fatal_signal_pending(current)) {
09fbc1c8e7b00e Filipe Manana  2022-09-01  3222  			ret = -EINTR;
978b63f7464abc Filipe Manana  2024-02-28  3223  			goto out_unlock;
09fbc1c8e7b00e Filipe Manana  2022-09-01  3224  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3225  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3226  		ret = fiemap_next_leaf_item(inode, path);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3227  		if (ret < 0) {
978b63f7464abc Filipe Manana  2024-02-28  3228  			goto out_unlock;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3229  		} else if (ret > 0) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3230  			/* No more file extent items for this inode. */
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3231  			break;
26e726afe01c1c Chengyu Song   2015-03-24  3232  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3233  		cond_resched();
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3234  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3235  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3236  check_eof_delalloc:
b0ad381fa76902 Josef Bacik    2024-02-12  3237  	if (!stopped && prev_extent_end < range_end) {
b3e744fe6d289b Filipe Manana  2022-11-11  3238  		ret = fiemap_process_hole(inode, fieinfo, &cache,
b3e744fe6d289b Filipe Manana  2022-11-11  3239  					  &delalloc_cached_state, backref_ctx,
b0ad381fa76902 Josef Bacik    2024-02-12  3240  					  0, 0, 0, prev_extent_end, range_end - 1);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3241  		if (ret < 0)
978b63f7464abc Filipe Manana  2024-02-28  3242  			goto out_unlock;
b0ad381fa76902 Josef Bacik    2024-02-12  3243  		prev_extent_end = range_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3244  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3245  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01 @3246  	if (cache.cached && cache.offset + cache.len >= last_extent_end) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3247  		const u64 i_size = i_size_read(&inode->vfs_inode);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3248  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3249  		if (prev_extent_end < i_size) {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3250  			u64 delalloc_start;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3251  			u64 delalloc_end;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3252  			bool delalloc;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3253  
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3254  			delalloc = btrfs_find_delalloc_in_range(inode,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3255  								prev_extent_end,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3256  								i_size - 1,
b3e744fe6d289b Filipe Manana  2022-11-11  3257  								&delalloc_cached_state,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3258  								&delalloc_start,
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3259  								&delalloc_end);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3260  			if (!delalloc)
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3261  				cache.flags |= FIEMAP_EXTENT_LAST;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3262  		} else {
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3263  			cache.flags |= FIEMAP_EXTENT_LAST;
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3264  		}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3265  	}
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3266  
978b63f7464abc Filipe Manana  2024-02-28  3267  out_unlock:
978b63f7464abc Filipe Manana  2024-02-28  3268  	unlock_extent(&inode->io_tree, range_start, range_end, &cached_state);
978b63f7464abc Filipe Manana  2024-02-28  3269  
978b63f7464abc Filipe Manana  2024-02-28  3270  	if (ret == BTRFS_FIEMAP_FLUSH_CACHE) {
978b63f7464abc Filipe Manana  2024-02-28  3271  		btrfs_release_path(path);
978b63f7464abc Filipe Manana  2024-02-28  3272  		ret = flush_fiemap_cache(fieinfo, &cache);
978b63f7464abc Filipe Manana  2024-02-28  3273  		if (ret)
978b63f7464abc Filipe Manana  2024-02-28  3274  			goto out;
978b63f7464abc Filipe Manana  2024-02-28  3275  		len -= cache.next_search_offset - start;
978b63f7464abc Filipe Manana  2024-02-28  3276  		start = cache.next_search_offset;
978b63f7464abc Filipe Manana  2024-02-28  3277  		goto restart;
978b63f7464abc Filipe Manana  2024-02-28  3278  	} else if (ret < 0) {
978b63f7464abc Filipe Manana  2024-02-28  3279  		goto out;
978b63f7464abc Filipe Manana  2024-02-28  3280  	}
978b63f7464abc Filipe Manana  2024-02-28  3281  
978b63f7464abc Filipe Manana  2024-02-28  3282  	/*
978b63f7464abc Filipe Manana  2024-02-28  3283  	 * Must free the path before emitting to the fiemap buffer because we
978b63f7464abc Filipe Manana  2024-02-28  3284  	 * may have a non-cloned leaf and if the fiemap buffer is memory mapped
978b63f7464abc Filipe Manana  2024-02-28  3285  	 * to a file, a write into it (through btrfs_page_mkwrite()) may trigger
978b63f7464abc Filipe Manana  2024-02-28  3286  	 * waiting for an ordered extent that in order to complete needs to
978b63f7464abc Filipe Manana  2024-02-28  3287  	 * modify that leaf, therefore leading to a deadlock.
978b63f7464abc Filipe Manana  2024-02-28  3288  	 */
978b63f7464abc Filipe Manana  2024-02-28  3289  	btrfs_free_path(path);
978b63f7464abc Filipe Manana  2024-02-28  3290  	path = NULL;
978b63f7464abc Filipe Manana  2024-02-28  3291  
978b63f7464abc Filipe Manana  2024-02-28  3292  	ret = flush_fiemap_cache(fieinfo, &cache);
978b63f7464abc Filipe Manana  2024-02-28  3293  	if (ret)
978b63f7464abc Filipe Manana  2024-02-28  3294  		goto out;
978b63f7464abc Filipe Manana  2024-02-28  3295  
5c5aff98f83abc David Sterba   2019-03-20  3296  	ret = emit_last_fiemap_cache(fieinfo, &cache);
ac3c0d36a2a2f7 Filipe Manana  2022-09-01  3297  out:
b3e744fe6d289b Filipe Manana  2022-11-11  3298  	free_extent_state(delalloc_cached_state);
978b63f7464abc Filipe Manana  2024-02-28  3299  	kfree(cache.entries);
84a7949d409753 Filipe Manana  2022-10-11  3300  	btrfs_free_backref_share_ctx(backref_ctx);
e02d48eaaed77f Colin Ian King 2019-07-05  3301  	btrfs_free_path(path);
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3302  	return ret;
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3303  }
1506fcc8189cdd Yehuda Sadeh   2009-01-21  3304  

:::::: The code at line 3246 was first introduced by commit
:::::: ac3c0d36a2a2f7a8f9778faef3f2639f5bf29d44 btrfs: make fiemap more efficient and accurate reporting extent sharedness

:::::: TO: Filipe Manana <fdmanana@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
