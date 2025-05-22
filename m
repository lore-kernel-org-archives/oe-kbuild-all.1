Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256B03B19A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 03:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747882910; cv=none; b=cApC4sj21Oqip8jVXuABtD8MnjMoU5L6eZQz0VZPt+N8VlDUYeLF/WpekLNySJjoZVUGu2hVINajB7owk1NeHZIm6EXe4hLkePRhMZybFFLtBii2oiz96ftY6ZIJ/EUFKRRrgs4y90JgG8yEZz+Rfi0e+Wq0Vn33vsxsZPWo/WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747882910; c=relaxed/simple;
	bh=8EXO3l5cB5aTBasR3hInAdQK2ZE4AnQF+gO4S9KQK9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qm9atf9P80H0D7eNrYNYPmkaDm869FVZJdie+K7I0Zj9QGid+7NsXrZQ3ZKQO7bvWGfX94uevdwhkDvcJidoy5BgQlmzCbVwlZWcVSaFcv0GQqkA+ELvmLlVYAxMf46V5+ockWYPMCfo0ij8pj34YkbKthl8ZcjB/cA9+5jjtEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHOygvDe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHOygvDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747882909; x=1779418909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8EXO3l5cB5aTBasR3hInAdQK2ZE4AnQF+gO4S9KQK9E=;
  b=HHOygvDeXiyc0kOJRNe4+1Ye8H0QsGE8vn+vGEgrV4mzrINSdcjGckIL
   Ot1+4poNsFrYZwWcukCtcPzf2uo8ecUopTfqI03ZRw+pNFP4OQ+rQQovP
   FR4B9y+IMTZsZ64mjo7pKwsr1tIL9isJHGrSUi+DYji1Rxn0z84KgqR7k
   zD1l2xCsYBXjsolybhCHBeyoEse6nTCWIVsBhaCwYwnlJwyhWtwZtNgSo
   q5PQF6fXe6qKk64SrnrhJ37VkXcw/CSUqGjVS0wfW9SqQ1bn1z3MdCh0v
   4CmYYKzT2YY0MZkWWbKpNINw1YKtBPOQsz12k0cB3XjxSelUtDp7/4gpQ
   g==;
X-CSE-ConnectionGUID: VauN6Yz2Qna9Pr2ruQ5GOA==
X-CSE-MsgGUID: yRR9BeZMT1uGY+dPPbuIHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67303162"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="67303162"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 20:01:48 -0700
X-CSE-ConnectionGUID: 3ZpuEzgYRVSeIQw67Z9bkQ==
X-CSE-MsgGUID: /s8+Tu1gR6uij2z2BVYHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140894866"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2025 20:01:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHwBk-000Os4-1A;
	Thu, 22 May 2025 03:01:44 +0000
Date: Thu, 22 May 2025 11:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap 40/43] fs/fuse/file_iomap.c:1088:28: warning:
 unused variable 'fi'
Message-ID: <202505221037.SsA69Lem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap
head:   5b397601da90a62bdc9e22c480dee2381a16ec90
commit: a5943cfcd1cd6371b483c2a22bfd8276e0d07895 [40/43] fuse: implement buffered IO with iomap
config: i386-buildonly-randconfig-003-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221037.SsA69Lem-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221037.SsA69Lem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221037.SsA69Lem-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/file_iomap.c: In function 'fuse_iomap_destroy_pagecache':
>> fs/fuse/file_iomap.c:1088:28: warning: unused variable 'fi' [-Wunused-variable]
    1088 |         struct fuse_inode *fi = get_fuse_inode(inode);
         |                            ^~
   fs/fuse/file_iomap.c: In function 'fuse_iomap_mmap':
>> fs/fuse/file_iomap.c:1133:23: warning: unused variable 'inode' [-Wunused-variable]
    1133 |         struct inode *inode = file_inode(file);
         |                       ^~~~~


vim +/fi +1088 fs/fuse/file_iomap.c

  1085	
  1086	void fuse_iomap_destroy_pagecache(struct inode *inode)
  1087	{
> 1088		struct fuse_inode *fi = get_fuse_inode(inode);
  1089	
  1090		ASSERT(fuse_has_iomap(inode));
  1091		ASSERT(list_empty(&fi->ioend_list));
  1092	}
  1093	
  1094	/*
  1095	 * Locking for serialisation of IO during page faults. This results in a lock
  1096	 * ordering of:
  1097	 *
  1098	 * mmap_lock (MM)
  1099	 *   sb_start_pagefault(vfs, freeze)
  1100	 *     invalidate_lock (vfs - truncate serialisation)
  1101	 *       page_lock (MM)
  1102	 *         i_lock (FUSE - extent map serialisation)
  1103	 */
  1104	static vm_fault_t fuse_iomap_page_mkwrite(struct vm_fault *vmf)
  1105	{
  1106		struct inode *inode = file_inode(vmf->vma->vm_file);
  1107		struct address_space *mapping = vmf->vma->vm_file->f_mapping;
  1108		vm_fault_t ret;
  1109	
  1110		ASSERT(fuse_has_iomap_pagecache(inode));
  1111	
  1112		trace_fuse_iomap_page_mkwrite(vmf);
  1113	
  1114		sb_start_pagefault(inode->i_sb);
  1115		file_update_time(vmf->vma->vm_file);
  1116	
  1117		filemap_invalidate_lock_shared(mapping);
  1118		ret = iomap_page_mkwrite(vmf, &fuse_iomap_ops, NULL);
  1119		filemap_invalidate_unlock_shared(mapping);
  1120	
  1121		sb_end_pagefault(inode->i_sb);
  1122		return ret;
  1123	}
  1124	
  1125	static const struct vm_operations_struct fuse_iomap_vm_ops = {
  1126		.fault		= filemap_fault,
  1127		.map_pages	= filemap_map_pages,
  1128		.page_mkwrite	= fuse_iomap_page_mkwrite,
  1129	};
  1130	
  1131	int fuse_iomap_mmap(struct file *file, struct vm_area_struct *vma)
  1132	{
> 1133		struct inode *inode = file_inode(file);
  1134	
  1135		ASSERT(fuse_has_iomap_pagecache(inode));
  1136	
  1137		file_accessed(file);
  1138		vma->vm_ops = &fuse_iomap_vm_ops;
  1139		return 0;
  1140	}
  1141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
