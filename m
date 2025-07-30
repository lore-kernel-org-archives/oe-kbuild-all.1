Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F22E267E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898520; cv=none; b=rSAoWdP/aFdb6zJDXorqTXjNFTtryRNqe2e+khAs9HHQWTA8pH5VVCuC1R0HmVKRQmefdpzIyFwIGtDbaAHAAikmRUKuWgee7YHsSflaM3imXmffrAqAqQ/hZdCS8FC/sWr8ltCKUYbyhUEoXp+rpFfS1+kcvF4F9B6+vdHkyQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898520; c=relaxed/simple;
	bh=szIVGrFWPYian6i8+e5IlujZb/a79xY47IWtkBm9d6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gd1rYriQgiPmaiafsrpG/oSkErye6XQ0Kl0EmrFWTs+F5P45eZ5knzYWFayzWThBqZLBCctol4eU2qq8w/s4cWf3Xk0HJV2eQXmAoZnD3En8xilYndweXi4HlB9yst5OVGDkj83J4lso5YyxsMmWwwWG/l0x4wPMGxogw0OoSOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPxfzqGB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPxfzqGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753898518; x=1785434518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szIVGrFWPYian6i8+e5IlujZb/a79xY47IWtkBm9d6U=;
  b=ZPxfzqGB/Btn32P+UgOjhz8LiexG17sk9BFaRsZpj3ljtw9Dv9DfEq/q
   cGGMP3xjvsqzaVA7Vbs+2dlCkHU44xkvBcAFaSn1SBSYymQ8MnuRtz6k5
   gli9rOxwg6vPt9UEa4XTQ8Caf7IGwKNmzqy/SNFEQwNZ1DWXENktUYxaa
   N43KxXPfcWvqBb7904CKltrqIhpdDYo//Zzrp5YTXVO8gWkUGdfSCPT21
   APsO10XBCZtCj20Z0E0unnxyAjMPAjLjPJQe7k7b50j0+IBugfiY6KbuJ
   9xXPLHsOuNR9BfCe1LsFVxMr5EuVFg6JJiihvnU8z9DzUYp3IcY2aBNFM
   Q==;
X-CSE-ConnectionGUID: RNepwH0lRcaYVes6C//EHw==
X-CSE-MsgGUID: yCICG4GITk2xbLuQzkqr9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67570854"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="67570854"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 11:01:57 -0700
X-CSE-ConnectionGUID: EaRD0+zmQsaYL+oqP4CGDQ==
X-CSE-MsgGUID: WPoGEpJ0RPiiGDCWT5cMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="168341531"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jul 2025 11:01:56 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhB7i-00031Y-1N;
	Wed, 30 Jul 2025 18:01:54 +0000
Date: Thu, 31 Jul 2025 02:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/4]
 fs/btrfs/ordered-data.c:215:5-11: ERROR: allocation function on line 173
 returns NULL not ERR_PTR on failure
Message-ID: <202507310138.qpLBCd1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   aa5e6ae38cc3c34905aae46f2e6cf5e5b4a901cc
commit: 08c649a5637371cb6bf8f3e974323cf59a7f434b [0/4] btrfs: check we grabbed inode reference when allocating an ordered extent
config: i386-randconfig-052-20250730 (https://download.01.org/0day-ci/archive/20250731/202507310138.qpLBCd1I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310138.qpLBCd1I-lkp@intel.com/

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
