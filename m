Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14682AE77
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771283803; cv=none; b=tHi3+g2UAtZw8J5jY7aZ2jbJb93qmMocOpapJHuGMEk62Co95KJ5wZrl5AcIllBHWT4U3gKlx/qpSwBkbzg6EvrPCkfq0NNdtcVhhIr8byUQOV++/c95IzpwKoLtAr/uoIjQU1A9UT/wg+KwB7hx6rTHTJObodMNrBIOt70CVJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771283803; c=relaxed/simple;
	bh=O1dtScI1RSucQPOm2LBCS+x06Jz9yD+MhvRMudm0s0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SpgYCyUhvWu+muGF3BQtIyH1GfyEy1koeSiS0XQbFhTC9J1ZzLjsVBeXXcDzXoFQhNOFh2Qgi3bnQkJFG82K/qUMIjxGDc2mO0tvy1g92XKRCRYaM6HocafpRyc99fPf+oD9dykDkRtkChKUAZqWY8UhrGNj/g7CghZPEy+XrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXI47roB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXI47roB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771283802; x=1802819802;
  h=date:from:to:cc:subject:message-id;
  bh=O1dtScI1RSucQPOm2LBCS+x06Jz9yD+MhvRMudm0s0o=;
  b=BXI47roBseId4/ytDI90llIddXcN581nyxNFTAxIy7iq+pCbpusQJQ8A
   0A/4vVKskzghXcCZb4TAQxH5DKtPhtMqm7mESSLJjngKQ4alJ9N4ybwN9
   iV1iDkVWBHU8eqK7/LO+ofWhrPGBt80GaFQXaOvFHB2T0w4NE1SRyTY6H
   qeB0+UZmkIQL5mrIXxWBwcUPo5Ws3E0Cywa03CZlFPkfji5WoMZ80bh0S
   uUCV25GbdNuW376N84/tJZ3mZBQv0j1JEZC3vwCmkvLYXO1mDomCtL8i+
   2mh7i7Z4tx6ZWeMURnKJPzsKLJH/rZJUAOMx43EKfgmkENIA2eMjW9duu
   w==;
X-CSE-ConnectionGUID: u2+k7RszSb+YJ+4jZEwjZQ==
X-CSE-MsgGUID: FjQPhnFlSk+lP49pueVmuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76201026"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="76201026"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 15:16:41 -0800
X-CSE-ConnectionGUID: 4vQVouLvR3yYQ96idG1hSQ==
X-CSE-MsgGUID: 06F+jM2nToGRJtf3L29hmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212239619"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2026 15:16:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs7pV-000000010M9-1i3Y;
	Mon, 16 Feb 2026 23:16:37 +0000
Date: Tue, 17 Feb 2026 07:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Boris Burkov <boris@bur.io>
Subject: fs/btrfs/ordered-data.c:215:5-11: ERROR: allocation function
 on line 173 returns NULL not ERR_PTR on failure
Message-ID: <202602170751.qIgCJbJI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: 08c649a5637371cb6bf8f3e974323cf59a7f434b btrfs: check we grabbed inode reference when allocating an ordered extent
date:   9 months ago
config: mips-randconfig-r064-20260215 (https://download.01.org/0day-ci/archive/20260217/202602170751.qIgCJbJI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170751.qIgCJbJI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/ordered-data.c:215:5-11: ERROR: allocation function on line 173 returns NULL not ERR_PTR on failure

vim +215 fs/btrfs/ordered-data.c

   147	
   148	static struct btrfs_ordered_extent *alloc_ordered_extent(
   149				struct btrfs_inode *inode, u64 file_offset, u64 num_bytes,
   150				u64 ram_bytes, u64 disk_bytenr, u64 disk_num_bytes,
   151				u64 offset, unsigned long flags, int compress_type)
   152	{
   153		struct btrfs_ordered_extent *entry;
   154		int ret;
   155		u64 qgroup_rsv = 0;
   156		const bool is_nocow = (flags &
   157		       ((1U << BTRFS_ORDERED_NOCOW) | (1U << BTRFS_ORDERED_PREALLOC)));
   158	
   159		if (is_nocow) {
   160			/* For nocow write, we can release the qgroup rsv right now */
   161			ret = btrfs_qgroup_free_data(inode, NULL, file_offset, num_bytes, &qgroup_rsv);
   162			if (ret < 0)
   163				return ERR_PTR(ret);
   164		} else {
   165			/*
   166			 * The ordered extent has reserved qgroup space, release now
   167			 * and pass the reserved number for qgroup_record to free.
   168			 */
   169			ret = btrfs_qgroup_release_data(inode, file_offset, num_bytes, &qgroup_rsv);
   170			if (ret < 0)
   171				return ERR_PTR(ret);
   172		}
 > 173		entry = kmem_cache_zalloc(btrfs_ordered_extent_cache, GFP_NOFS);
   174		if (!entry) {
   175			entry = ERR_PTR(-ENOMEM);
   176			goto out;
   177		}
   178	
   179		entry->file_offset = file_offset;
   180		entry->num_bytes = num_bytes;
   181		entry->ram_bytes = ram_bytes;
   182		entry->disk_bytenr = disk_bytenr;
   183		entry->disk_num_bytes = disk_num_bytes;
   184		entry->offset = offset;
   185		entry->bytes_left = num_bytes;
   186		if (WARN_ON_ONCE(!igrab(&inode->vfs_inode))) {
   187			kmem_cache_free(btrfs_ordered_extent_cache, entry);
   188			entry = ERR_PTR(-ESTALE);
   189			goto out;
   190		}
   191		entry->inode = inode;
   192		entry->compress_type = compress_type;
   193		entry->truncated_len = (u64)-1;
   194		entry->qgroup_rsv = qgroup_rsv;
   195		entry->flags = flags;
   196		refcount_set(&entry->refs, 1);
   197		init_waitqueue_head(&entry->wait);
   198		INIT_LIST_HEAD(&entry->list);
   199		INIT_LIST_HEAD(&entry->log_list);
   200		INIT_LIST_HEAD(&entry->root_extent_list);
   201		INIT_LIST_HEAD(&entry->work_list);
   202		INIT_LIST_HEAD(&entry->bioc_list);
   203		init_completion(&entry->completion);
   204	
   205		/*
   206		 * We don't need the count_max_extents here, we can assume that all of
   207		 * that work has been done at higher layers, so this is truly the
   208		 * smallest the extent is going to get.
   209		 */
   210		spin_lock(&inode->lock);
   211		btrfs_mod_outstanding_extents(inode, 1);
   212		spin_unlock(&inode->lock);
   213	
   214	out:
 > 215		if (IS_ERR(entry) && !is_nocow)
   216			btrfs_qgroup_free_refroot(inode->root->fs_info,
   217						  btrfs_root_id(inode->root),
   218						  qgroup_rsv, BTRFS_QGROUP_RSV_DATA);
   219	
   220		return entry;
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
