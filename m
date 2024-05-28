Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18AC16E866
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902199; cv=none; b=L7X2OcbOxjdGW4WHH8re9zcBBPDeOkG4tNsQR6YXE6vL5LzaaEsKan74VFxCCXgaIq4YuByrShixCt3SiNS7+pK64rvWS+vfj85EnncfYPy35ebn0T60dettlbJeiHJzvJSQ1F6YUQWhYdSZrQWqbIrvNaKM4SPCyYMV6hifffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902199; c=relaxed/simple;
	bh=SHNtEGO43XApTJHbUKN/hYx9DOHyaGbvDnGO5lSPBeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J68f8cqKz2JOPdPbt4wtn4Ww19lyz0Q8cVC4DCFvrH7Lf4BVEKzccUThz9yk1FpSrn6jcDaWYaW9t39AMCTVf2h8mIN2BNEFA/RdjpcAoi+qXQrP4MUllMAqgKx16xSSdq9wQ8wAwq2I/zxwVpNktSWF2Ti4SBYR0fWjMwYqBfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUxZjmfv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUxZjmfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716902198; x=1748438198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHNtEGO43XApTJHbUKN/hYx9DOHyaGbvDnGO5lSPBeg=;
  b=cUxZjmfvXRkdyZYPyGDfF6Xz3cTkf/qqs9lqeXqYjz+RHW3EKw7roMTT
   5LY8AFtjD5EdtPgovmdwloMz/a7BnOG3xAALVACqqtbQfjyiU4D/xT+bV
   Os4/dkVrWZTNwqSpfJrplOeABzBRGZeiyqOHqYtgU+BTOA8pB3vorMoxM
   xWMO3dosim8mm6Vwpjq07ZPi1v0/KrB2IyEnzr8dGAd91cZltERrU2i48
   /ckLZpKdLvzjmkG6RI9OjQupvLQmCFnXgTszxiIRY00LC82v7L6D4gRNP
   XPE+lX8Q7JVOZzguQDnM63sBU97HVJmrGjUaYanZ2p8rrq/NQ1I7e/AMG
   g==;
X-CSE-ConnectionGUID: TlU9/GmFQoOZYB8yflb14g==
X-CSE-MsgGUID: dStep7RITQmplrpwbgYLDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13465607"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="13465607"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 06:16:37 -0700
X-CSE-ConnectionGUID: +lLuGA3GTni6Yyj9ORgBhQ==
X-CSE-MsgGUID: 84WA2KV+T6Gp/cpTbMdx2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="66279041"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2024 06:16:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBwgr-000CDL-0e;
	Tue, 28 May 2024 13:16:33 +0000
Date: Tue, 28 May 2024 21:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [linux-next:master 1478/2075] fs/btrfs/fiemap.c:822:26: warning:
 'last_extent_end' may be used uninitialized
Message-ID: <202405282148.jaF0FLhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6dc544b66971c7f9909ff038b62149105272d26a
commit: 827308f8ead0e75a04ee3a5c2f47b84c67decfb2 [1478/2075] btrfs: move fiemap code into its own file
config: mips-buildonly-randconfig-r002-20221001 (https://download.01.org/0day-ci/archive/20240528/202405282148.jaF0FLhu-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405282148.jaF0FLhu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282148.jaF0FLhu-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/fiemap.c: In function 'extent_fiemap':
>> fs/btrfs/fiemap.c:822:26: warning: 'last_extent_end' may be used uninitialized [-Wmaybe-uninitialized]
     822 |         if (cache.cached && cache.offset + cache.len >= last_extent_end) {
         |             ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/fiemap.c:640:13: note: 'last_extent_end' was declared here
     640 |         u64 last_extent_end;
         |             ^~~~~~~~~~~~~~~


vim +/last_extent_end +822 fs/btrfs/fiemap.c

   629	
   630	static int extent_fiemap(struct btrfs_inode *inode,
   631				 struct fiemap_extent_info *fieinfo,
   632				 u64 start, u64 len)
   633	{
   634		const u64 ino = btrfs_ino(inode);
   635		struct extent_state *cached_state = NULL;
   636		struct extent_state *delalloc_cached_state = NULL;
   637		struct btrfs_path *path;
   638		struct fiemap_cache cache = { 0 };
   639		struct btrfs_backref_share_check_ctx *backref_ctx;
   640		u64 last_extent_end;
   641		u64 prev_extent_end;
   642		u64 range_start;
   643		u64 range_end;
   644		const u64 sectorsize = inode->root->fs_info->sectorsize;
   645		bool stopped = false;
   646		int ret;
   647	
   648		cache.entries_size = PAGE_SIZE / sizeof(struct btrfs_fiemap_entry);
   649		cache.entries = kmalloc_array(cache.entries_size,
   650					      sizeof(struct btrfs_fiemap_entry),
   651					      GFP_KERNEL);
   652		backref_ctx = btrfs_alloc_backref_share_check_ctx();
   653		path = btrfs_alloc_path();
   654		if (!cache.entries || !backref_ctx || !path) {
   655			ret = -ENOMEM;
   656			goto out;
   657		}
   658	
   659	restart:
   660		range_start = round_down(start, sectorsize);
   661		range_end = round_up(start + len, sectorsize);
   662		prev_extent_end = range_start;
   663	
   664		lock_extent(&inode->io_tree, range_start, range_end, &cached_state);
   665	
   666		ret = fiemap_find_last_extent_offset(inode, path, &last_extent_end);
   667		if (ret < 0)
   668			goto out_unlock;
   669		btrfs_release_path(path);
   670	
   671		path->reada = READA_FORWARD;
   672		ret = fiemap_search_slot(inode, path, range_start);
   673		if (ret < 0) {
   674			goto out_unlock;
   675		} else if (ret > 0) {
   676			/*
   677			 * No file extent item found, but we may have delalloc between
   678			 * the current offset and i_size. So check for that.
   679			 */
   680			ret = 0;
   681			goto check_eof_delalloc;
   682		}
   683	
   684		while (prev_extent_end < range_end) {
   685			struct extent_buffer *leaf = path->nodes[0];
   686			struct btrfs_file_extent_item *ei;
   687			struct btrfs_key key;
   688			u64 extent_end;
   689			u64 extent_len;
   690			u64 extent_offset = 0;
   691			u64 extent_gen;
   692			u64 disk_bytenr = 0;
   693			u64 flags = 0;
   694			int extent_type;
   695			u8 compression;
   696	
   697			btrfs_item_key_to_cpu(leaf, &key, path->slots[0]);
   698			if (key.objectid != ino || key.type != BTRFS_EXTENT_DATA_KEY)
   699				break;
   700	
   701			extent_end = btrfs_file_extent_end(path);
   702	
   703			/*
   704			 * The first iteration can leave us at an extent item that ends
   705			 * before our range's start. Move to the next item.
   706			 */
   707			if (extent_end <= range_start)
   708				goto next_item;
   709	
   710			backref_ctx->curr_leaf_bytenr = leaf->start;
   711	
   712			/* We have in implicit hole (NO_HOLES feature enabled). */
   713			if (prev_extent_end < key.offset) {
   714				const u64 hole_end = min(key.offset, range_end) - 1;
   715	
   716				ret = fiemap_process_hole(inode, fieinfo, &cache,
   717							  &delalloc_cached_state,
   718							  backref_ctx, 0, 0, 0,
   719							  prev_extent_end, hole_end);
   720				if (ret < 0) {
   721					goto out_unlock;
   722				} else if (ret > 0) {
   723					/* fiemap_fill_next_extent() told us to stop. */
   724					stopped = true;
   725					break;
   726				}
   727	
   728				/* We've reached the end of the fiemap range, stop. */
   729				if (key.offset >= range_end) {
   730					stopped = true;
   731					break;
   732				}
   733			}
   734	
   735			extent_len = extent_end - key.offset;
   736			ei = btrfs_item_ptr(leaf, path->slots[0],
   737					    struct btrfs_file_extent_item);
   738			compression = btrfs_file_extent_compression(leaf, ei);
   739			extent_type = btrfs_file_extent_type(leaf, ei);
   740			extent_gen = btrfs_file_extent_generation(leaf, ei);
   741	
   742			if (extent_type != BTRFS_FILE_EXTENT_INLINE) {
   743				disk_bytenr = btrfs_file_extent_disk_bytenr(leaf, ei);
   744				if (compression == BTRFS_COMPRESS_NONE)
   745					extent_offset = btrfs_file_extent_offset(leaf, ei);
   746			}
   747	
   748			if (compression != BTRFS_COMPRESS_NONE)
   749				flags |= FIEMAP_EXTENT_ENCODED;
   750	
   751			if (extent_type == BTRFS_FILE_EXTENT_INLINE) {
   752				flags |= FIEMAP_EXTENT_DATA_INLINE;
   753				flags |= FIEMAP_EXTENT_NOT_ALIGNED;
   754				ret = emit_fiemap_extent(fieinfo, &cache, key.offset, 0,
   755							 extent_len, flags);
   756			} else if (extent_type == BTRFS_FILE_EXTENT_PREALLOC) {
   757				ret = fiemap_process_hole(inode, fieinfo, &cache,
   758							  &delalloc_cached_state,
   759							  backref_ctx,
   760							  disk_bytenr, extent_offset,
   761							  extent_gen, key.offset,
   762							  extent_end - 1);
   763			} else if (disk_bytenr == 0) {
   764				/* We have an explicit hole. */
   765				ret = fiemap_process_hole(inode, fieinfo, &cache,
   766							  &delalloc_cached_state,
   767							  backref_ctx, 0, 0, 0,
   768							  key.offset, extent_end - 1);
   769			} else {
   770				/* We have a regular extent. */
   771				if (fieinfo->fi_extents_max) {
   772					ret = btrfs_is_data_extent_shared(inode,
   773									  disk_bytenr,
   774									  extent_gen,
   775									  backref_ctx);
   776					if (ret < 0)
   777						goto out_unlock;
   778					else if (ret > 0)
   779						flags |= FIEMAP_EXTENT_SHARED;
   780				}
   781	
   782				ret = emit_fiemap_extent(fieinfo, &cache, key.offset,
   783							 disk_bytenr + extent_offset,
   784							 extent_len, flags);
   785			}
   786	
   787			if (ret < 0) {
   788				goto out_unlock;
   789			} else if (ret > 0) {
   790				/* emit_fiemap_extent() told us to stop. */
   791				stopped = true;
   792				break;
   793			}
   794	
   795			prev_extent_end = extent_end;
   796	next_item:
   797			if (fatal_signal_pending(current)) {
   798				ret = -EINTR;
   799				goto out_unlock;
   800			}
   801	
   802			ret = fiemap_next_leaf_item(inode, path);
   803			if (ret < 0) {
   804				goto out_unlock;
   805			} else if (ret > 0) {
   806				/* No more file extent items for this inode. */
   807				break;
   808			}
   809			cond_resched();
   810		}
   811	
   812	check_eof_delalloc:
   813		if (!stopped && prev_extent_end < range_end) {
   814			ret = fiemap_process_hole(inode, fieinfo, &cache,
   815						  &delalloc_cached_state, backref_ctx,
   816						  0, 0, 0, prev_extent_end, range_end - 1);
   817			if (ret < 0)
   818				goto out_unlock;
   819			prev_extent_end = range_end;
   820		}
   821	
 > 822		if (cache.cached && cache.offset + cache.len >= last_extent_end) {
   823			const u64 i_size = i_size_read(&inode->vfs_inode);
   824	
   825			if (prev_extent_end < i_size) {
   826				u64 delalloc_start;
   827				u64 delalloc_end;
   828				bool delalloc;
   829	
   830				delalloc = btrfs_find_delalloc_in_range(inode,
   831									prev_extent_end,
   832									i_size - 1,
   833									&delalloc_cached_state,
   834									&delalloc_start,
   835									&delalloc_end);
   836				if (!delalloc)
   837					cache.flags |= FIEMAP_EXTENT_LAST;
   838			} else {
   839				cache.flags |= FIEMAP_EXTENT_LAST;
   840			}
   841		}
   842	
   843	out_unlock:
   844		unlock_extent(&inode->io_tree, range_start, range_end, &cached_state);
   845	
   846		if (ret == BTRFS_FIEMAP_FLUSH_CACHE) {
   847			btrfs_release_path(path);
   848			ret = flush_fiemap_cache(fieinfo, &cache);
   849			if (ret)
   850				goto out;
   851			len -= cache.next_search_offset - start;
   852			start = cache.next_search_offset;
   853			goto restart;
   854		} else if (ret < 0) {
   855			goto out;
   856		}
   857	
   858		/*
   859		 * Must free the path before emitting to the fiemap buffer because we
   860		 * may have a non-cloned leaf and if the fiemap buffer is memory mapped
   861		 * to a file, a write into it (through btrfs_page_mkwrite()) may trigger
   862		 * waiting for an ordered extent that in order to complete needs to
   863		 * modify that leaf, therefore leading to a deadlock.
   864		 */
   865		btrfs_free_path(path);
   866		path = NULL;
   867	
   868		ret = flush_fiemap_cache(fieinfo, &cache);
   869		if (ret)
   870			goto out;
   871	
   872		ret = emit_last_fiemap_cache(fieinfo, &cache);
   873	out:
   874		free_extent_state(delalloc_cached_state);
   875		kfree(cache.entries);
   876		btrfs_free_backref_share_ctx(backref_ctx);
   877		btrfs_free_path(path);
   878		return ret;
   879	}
   880	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
