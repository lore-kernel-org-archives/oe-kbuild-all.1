Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F902EC56E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 00:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150745; cv=none; b=R/Bs0a9XRC6laVUwijfwvJrTJwRZR+FtTPlaD6Ik9afHqcHeFRU2oNOgU36Eg1TSsDIQx79ANOzXxsFwkUIHZJK/Li+NP/KhPvI3qbYDAAoFX5CBylWMJYt82yq8azfLgtBPeW4ZCvxVeLdqXq6c3rmMrDnKDtJd4H0Z74ca1xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150745; c=relaxed/simple;
	bh=6OofgNEB7rY8oJBsgT96ANTb24xMZKBCzGF1MgsfzJc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D4BATzepT+WAKCjRy7qGaeBdU15BwwEu/ewkekx/e0WWZ+IV0UXXmEa2s3ThBAtmdyfSBPfYt/RxNAIOJfsvjjo0WOsnyPTMcark1BbJK3N7pXAU/mxvOPiNLjImflxGnfj6XO91ueMPdFqx3aVgtADh163iyoyp1Dk2W6Y6Uj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ncs36ZZ+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ncs36ZZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786150742; x=1817686742;
  h=date:from:to:cc:subject:message-id;
  bh=6OofgNEB7rY8oJBsgT96ANTb24xMZKBCzGF1MgsfzJc=;
  b=Ncs36ZZ+6JyflVjfhwNdJU8FG2UqtpMIk0X+CCAa9x7aCjFZ72k1bKn1
   l31wc0mz0xN3DiTd183AG81HAWIbCODHoUAWcB7WPO/8bbr4C6VzGEIdU
   wVIH/Dj0XcIuXqL1km14szp2MC1xvLbIPJ0V1qPAnsgkOxrXfKLz+0/jz
   9hKQSL4udeAgxzCwNHtGAUwtlX+K+b4oSjE6nV5rVbDMfvKCiBFOCoVbL
   b4Ak7nSumAKi186/70hvVi2fRI/QvhxbspxoJ/LVXzYprkEOCHCwyers7
   rVdP7SijNNeV99DeWL9T21WVx3w7+Vn9AQyXEnLADO1CU5JvrcdgxiQhc
   w==;
X-CSE-ConnectionGUID: 3YynhS/xT4Sc1uG0Pm6wKw==
X-CSE-MsgGUID: UWMqMpneT6qbl1jDlmpatw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86841935"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86841935"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 17:59:01 -0700
X-CSE-ConnectionGUID: Q1xUdYbqR8ibbCb+Q4swnw==
X-CSE-MsgGUID: vFYQ39t8R6OEIMR62DZtlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="256310036"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2026 17:58:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsVOr-00000000Jad-1F0f;
	Sat, 08 Aug 2026 00:58:57 +0000
Date: Sat, 08 Aug 2026 08:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 5/13] fs/f2fs/file.c:177:13: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202608080742.Ff72R1pA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   23c6aad9d7d40c811878131e6c9fe073b889a246
commit: 023eade52f637a4ab23304baff65191d0292eb30 [5/13] f2fs: fix to zero post-EOF data when extending file size
config: i386-randconfig-062-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080742.Ff72R1pA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080742.Ff72R1pA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080742.Ff72R1pA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/file.c:177:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] ret @@     got int @@
   fs/f2fs/file.c:177:13: sparse:     expected restricted vm_fault_t [usertype] ret
   fs/f2fs/file.c:177:13: sparse:     got int
   fs/f2fs/file.c:4077:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const [usertype] *pwcs @@     got restricted __le16 * @@
   fs/f2fs/file.c:4077:36: sparse:     expected unsigned short const [usertype] *pwcs
   fs/f2fs/file.c:4077:36: sparse:     got restricted __le16 *
   fs/f2fs/file.c:4113:28: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 * @@
   fs/f2fs/file.c:4113:28: sparse:     expected unsigned short [usertype] *pwcs
   fs/f2fs/file.c:4113:28: sparse:     got restricted __le16 *

vim +177 fs/f2fs/file.c

   115	
   116	static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
   117	{
   118		struct folio *folio = page_folio(vmf->page);
   119		struct inode *inode = file_inode(vmf->vma->vm_file);
   120		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
   121		struct dnode_of_data dn;
   122		bool need_alloc = !f2fs_is_pinned_file(inode);
   123		int err = 0;
   124		vm_fault_t ret;
   125	
   126		/*
   127		 * We only support large folio on the read case.
   128		 * Don't make any dirty pages.
   129		 */
   130		if (unlikely(IS_IMMUTABLE(inode)) ||
   131		    mapping_large_folio_support(inode->i_mapping)) {
   132			f2fs_err(sbi, "Not expected: immutable: %d large_folio: %d",
   133					IS_IMMUTABLE(inode),
   134					mapping_large_folio_support(inode->i_mapping));
   135			return VM_FAULT_SIGBUS;
   136		}
   137	
   138		if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
   139			err = -EIO;
   140			goto out;
   141		}
   142	
   143		if (unlikely(f2fs_cp_error(sbi))) {
   144			err = -EIO;
   145			goto out;
   146		}
   147	
   148		if (!f2fs_is_checkpoint_ready(sbi)) {
   149			err = -ENOSPC;
   150			goto out;
   151		}
   152	
   153		err = f2fs_convert_inline_inode(inode);
   154		if (err)
   155			goto out;
   156	
   157	#ifdef CONFIG_F2FS_FS_COMPRESSION
   158		if (f2fs_compressed_file(inode)) {
   159			int ret = f2fs_is_compressed_cluster(inode, folio->index);
   160	
   161			if (ret < 0) {
   162				err = ret;
   163				goto out;
   164			} else if (ret) {
   165				need_alloc = false;
   166			}
   167		}
   168	#endif
   169		/* should do out of any locked page */
   170		if (need_alloc)
   171			f2fs_balance_fs(sbi, true);
   172	
   173		sb_start_pagefault(inode->i_sb);
   174	
   175		f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
   176	
 > 177		ret = f2fs_zero_post_eof_page(inode,
   178			(folio->index + 1) << PAGE_SHIFT, true);
   179		if (ret)
   180			goto out_pagefault;
   181	
   182		file_update_time(vmf->vma->vm_file);
   183		filemap_invalidate_lock_shared(inode->i_mapping);
   184	
   185		folio_lock(folio);
   186		if (unlikely(folio->mapping != inode->i_mapping ||
   187				folio_pos(folio) > i_size_read(inode) ||
   188				!folio_test_uptodate(folio))) {
   189			folio_unlock(folio);
   190			err = -EFAULT;
   191			goto out_sem;
   192		}
   193	
   194		set_new_dnode(&dn, inode, NULL, NULL, 0);
   195		if (need_alloc) {
   196			/* block allocation */
   197			err = f2fs_get_block_locked(&dn, folio->index);
   198		} else {
   199			err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
   200			f2fs_put_dnode(&dn);
   201			if (f2fs_is_pinned_file(inode) &&
   202			    !__is_valid_data_blkaddr(dn.data_blkaddr))
   203				err = -EIO;
   204		}
   205	
   206		if (err) {
   207			folio_unlock(folio);
   208			goto out_sem;
   209		}
   210	
   211		f2fs_folio_wait_writeback(folio, DATA, false, true);
   212	
   213		/* wait for GCed page writeback via META_MAPPING */
   214		f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
   215	
   216		/*
   217		 * check to see if the page is mapped already (no holes)
   218		 */
   219		if (folio_test_mappedtodisk(folio))
   220			goto out_sem;
   221	
   222		/* page is wholly or partially inside EOF */
   223		if (((loff_t)(folio->index + 1) << PAGE_SHIFT) >
   224							i_size_read(inode)) {
   225			loff_t offset;
   226	
   227			offset = i_size_read(inode) & ~PAGE_MASK;
   228			folio_zero_segment(folio, offset, folio_size(folio));
   229		}
   230		folio_mark_dirty(folio);
   231	
   232		f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
   233		f2fs_update_time(sbi, REQ_TIME);
   234	
   235	out_sem:
   236		filemap_invalidate_unlock_shared(inode->i_mapping);
   237	out_pagefault:
   238		sb_end_pagefault(inode->i_sb);
   239	out:
   240		ret = vmf_fs_error(err);
   241	
   242		trace_f2fs_vm_page_mkwrite(inode, folio->index, vmf->vma->vm_flags, ret);
   243		return ret;
   244	}
   245	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
