Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C823C9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 00:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730160156; cv=none; b=ay2N2sqo59nPUW+QQWmTGwVMcPUZhqVdZ1CwjhWazMxkNb1aMBM7+vl4AEI+82aLq9zH4zkjiloQQ0hO3TFs89cj1YvoR0/v+DNf4YQvplUtF0MMNBxOh/uueEJtZ6vbKVSqs2WDoqaoHvUtITLj16vxle+j9umeAnSnopnuWM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730160156; c=relaxed/simple;
	bh=+9AGjHhrhfHhEHHoTvZ8NNXlzkYjL+tmTzMwiyGL7VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHrhFyy/JahfSLhadz7Ngdg4qZfD4BtY2gu/Njf5OM4eibFKSf/A6WQRcpmTfT4bd/GGeM0IqZ4kxYJDxR+YTw/5LUP+7Mvtr4V8sbU1QCTwNlJqLCapq+9/zIoZXcX5Rb+8KxbZeJXiQzyD+hXfpPWaexNSCewInvLNqHBJKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfPHUQot; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfPHUQot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730160154; x=1761696154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9AGjHhrhfHhEHHoTvZ8NNXlzkYjL+tmTzMwiyGL7VQ=;
  b=hfPHUQotJfIPMCPHCpBvd2eoW/xCpYY5MmCbDmizkPyRsJ7v/mc40QPb
   kN7TOzzfZqORkpiQXhdxurR4R70sfFrIWaC/hFniDvasj2My4v/aOZrI2
   OW2TvF1sg+Kqb3HaK2SfX96XNFg9n6qKpNzsTxozCCn1/o/5Ul6xtPBIN
   ZtjRxh3erEVJdWR+E1Z6R0Hts7Wbw4a9Tn/0su6NHWnZZyImm/0MaAjfB
   JXnckJK4JrHAdzqOF66TYdfS+24PBtcmlkTxs0VnnhEwsV1JEsxa5EWaY
   L75uZN8BEY/PeSUTk4gjDa2d0DooIPYfR6Oi0W5bIBStaGNWdyD25Ovvt
   Q==;
X-CSE-ConnectionGUID: q3QyFjMnSaKiXAE73VU8qg==
X-CSE-MsgGUID: wPtIvdZwQTKSerYTvrjgXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29681969"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="29681969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 17:02:33 -0700
X-CSE-ConnectionGUID: 2gvfn4n7RoC3j73uKVi9lQ==
X-CSE-MsgGUID: yi8hYY8qSgi1V/Nr0TlAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="82105710"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2024 17:02:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Zgs-000d2U-0f;
	Tue, 29 Oct 2024 00:02:30 +0000
Date: Tue, 29 Oct 2024 08:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 31/34] fs/afs/dir_edit.c:423
 afs_edit_dir_remove() warn: unsigned 'entry' is never less than zero.
Message-ID: <202410291037.uzpw7XAB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   c7c0ac11bb2527f2257071bcbe4c5f9fd8fb1419
commit: eadceef6daf592360873df4893b954620c991d08 [31/34] afs: Use the contained hashtable to search a directory
config: i386-randconfig-r072-20241028 (https://download.01.org/0day-ci/archive/20241029/202410291037.uzpw7XAB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291037.uzpw7XAB-lkp@intel.com/

smatch warnings:
fs/afs/dir_edit.c:423 afs_edit_dir_remove() warn: unsigned 'entry' is never less than zero.
fs/afs/dir_search.c:155 afs_dir_search_bucket() warn: potential spectre issue 'block->dirents' [r] (local cap)

vim +/entry +423 fs/afs/dir_edit.c

   385	
   386	/*
   387	 * Edit a directory's file data to remove a new directory entry.  Doing this
   388	 * after unlink, rmdir or rename if the data version number is incremented by
   389	 * exactly one avoids the need to re-download the entire directory contents.
   390	 *
   391	 * The caller must hold the inode locked.
   392	 */
   393	void afs_edit_dir_remove(struct afs_vnode *vnode,
   394				 struct qstr *name, enum afs_edit_dir_reason why)
   395	{
   396		union afs_xdr_dir_block *meta, *block, *pblock;
   397		union afs_xdr_dirent *de, *pde;
   398		struct afs_dir_iter iter = { .dvnode = vnode };
   399		struct afs_fid fid;
   400		unsigned int b, slot, entry;
   401		loff_t i_size;
   402		__be16 next;
   403	
   404		_enter(",,{%d,%s},", name->len, name->name);
   405	
   406		i_size = i_size_read(&vnode->netfs.inode);
   407		if (i_size < AFS_DIR_BLOCK_SIZE ||
   408		    i_size > AFS_DIR_BLOCK_SIZE * AFS_DIR_MAX_BLOCKS ||
   409		    (i_size & (AFS_DIR_BLOCK_SIZE - 1))) {
   410			afs_invalidate_dir(vnode, afs_dir_invalid_edit_rem_bad_size);
   411			return;
   412		}
   413	
   414		if (!afs_dir_init_iter(&iter, name))
   415			return;
   416	
   417		meta = afs_dir_find_block(&iter, 0);
   418		if (!meta)
   419			return;
   420	
   421		/* Find the entry in the blob. */
   422		entry = afs_dir_search_bucket(&iter, name, &fid);
 > 423		if (entry < 0) {
   424			/* Didn't find the dirent to clobber.  Re-download. */
   425			trace_afs_edit_dir(vnode, why, afs_edit_dir_delete_noent,
   426					   0, 0, 0, 0, name->name);
   427			afs_invalidate_dir(vnode, afs_dir_invalid_edit_rem_wrong_name);
   428			goto out_unmap;
   429		}
   430	
   431		b    = entry / AFS_DIR_SLOTS_PER_BLOCK;
   432		slot = entry % AFS_DIR_SLOTS_PER_BLOCK;
   433	
   434		block = afs_dir_find_block(&iter, b);
   435		if (!block)
   436			goto error;
   437		if (!test_bit(AFS_VNODE_DIR_VALID, &vnode->flags))
   438			goto already_invalidated;
   439	
   440		/* Check and clear the entry. */
   441		de = &block->dirents[slot];
   442		if (de->u.valid != 1)
   443			goto error_unmap;
   444	
   445		trace_afs_edit_dir(vnode, why, afs_edit_dir_delete, b, slot,
   446				   ntohl(de->u.vnode), ntohl(de->u.unique),
   447				   name->name);
   448	
   449		/* Adjust the bitmap. */
   450		afs_clear_contig_bits(block, slot, iter.nr_slots);
   451	
   452		/* Adjust the allocation counter. */
   453		if (b < AFS_DIR_BLOCKS_WITH_CTR)
   454			meta->meta.alloc_ctrs[b] += iter.nr_slots;
   455	
   456		/* Clear the constituent entries. */
   457		next = de->u.hash_next;
   458		memset(de, 0, sizeof(*de) * iter.nr_slots);
   459		kunmap_local(block);
   460	
   461		/* Adjust the hash chain: if iter->prev_entry is 0, the hashtable head
   462		 * index is previous; otherwise it's slot number of the previous entry.
   463		 */
   464		if (!iter.prev_entry) {
   465			__be16 prev_next = meta->meta.hashtable[iter.bucket];
   466	
   467			if (unlikely(prev_next != htons(entry))) {
   468				pr_warn("%llx:%llx:%x: not head of chain b=%x p=%x,%x e=%x %*s",
   469					vnode->fid.vid, vnode->fid.vnode, vnode->fid.unique,
   470					iter.bucket, iter.prev_entry, prev_next, entry,
   471					name->len, name->name);
   472				goto error;
   473			}
   474			meta->meta.hashtable[iter.bucket] = next;
   475		} else {
   476			unsigned int pb = iter.prev_entry / AFS_DIR_SLOTS_PER_BLOCK;
   477			unsigned int ps = iter.prev_entry % AFS_DIR_SLOTS_PER_BLOCK;
   478			__be16 prev_next;
   479	
   480			pblock = afs_dir_find_block(&iter, pb);
   481			if (!pblock)
   482				goto error;
   483			pde = &pblock->dirents[ps];
   484			prev_next = pde->u.hash_next;
   485			if (prev_next != htons(entry)) {
   486				kunmap_local(pblock);
   487				pr_warn("%llx:%llx:%x: not prev in chain b=%x p=%x,%x e=%x %*s",
   488					vnode->fid.vid, vnode->fid.vnode, vnode->fid.unique,
   489					iter.bucket, iter.prev_entry, prev_next, entry,
   490					name->len, name->name);
   491				goto error;
   492			}
   493			pde->u.hash_next = next;
   494			kunmap_local(pblock);
   495		}
   496	
   497		netfs_single_mark_inode_dirty(&vnode->netfs.inode);
   498	
   499		inode_set_iversion_raw(&vnode->netfs.inode, vnode->status.data_version);
   500		afs_stat_v(vnode, n_dir_rm);
   501		_debug("Remove %s from %u[%u]", name->name, b, slot);
   502	
   503	out_unmap:
   504		kunmap_local(meta);
   505		_leave("");
   506		return;
   507	
   508	already_invalidated:
   509		kunmap_local(block);
   510		trace_afs_edit_dir(vnode, why, afs_edit_dir_delete_inval,
   511				   0, 0, 0, 0, name->name);
   512		goto out_unmap;
   513	
   514	error_unmap:
   515		kunmap_local(block);
   516	error:
   517		trace_afs_edit_dir(vnode, why, afs_edit_dir_delete_error,
   518				   0, 0, 0, 0, name->name);
   519		goto out_unmap;
   520	}
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
