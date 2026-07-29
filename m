Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA123CF208
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315130; cv=none; b=TgasCJqEAV1XeNMmdPRL4ON/gSxm4tIhP2gl4mZWtfZbaFNTKCcTqkv0lcoYfOuOwgpn5byYRhhs6ffqh2K80RjiPJ7ocsrVa+sKl4Iv80X7pEF+3donpY175Pp84wAe+wXcIJP3r2tGONwVOIoF6Lay0p740K1c9TwSLMcbOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315130; c=relaxed/simple;
	bh=ZdK2M1zPhw8cyOH4EyaUp7IeSmp7zMaxtDS0khpaKBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MWK5wzR2s7vzcajxXlpNRa3mnsMAQ0qGUp1D+WtJh2V0/3Lx+aiviIU52B6jwaIS9mq8yBaMXr3SGUj+9XrD1eRUVGV7aB9a48Alf6THZY/oYbmMQxqVmUJyQX2DZSx/Um1IX4XSPAQYCx4od5hLaA+6tZmDfjp9GnIvNTR+VC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeGnEp4p; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeGnEp4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785315129; x=1816851129;
  h=date:from:to:cc:subject:message-id;
  bh=ZdK2M1zPhw8cyOH4EyaUp7IeSmp7zMaxtDS0khpaKBM=;
  b=AeGnEp4pd97yxpUDTt2yrJRX2CNOxbuEAzrNU8XZC42U7FB+j7xWGU6P
   cd0YgtMkXzVKoq/Aqj26DIIUd2bVM9B2BSigWPPVra7XFmeXgqxPviYtp
   EUwfh0CkFu6cEub50F16x9ei7z3EuJOrcF+N50S1JxVwWQjWb6zPDqMiO
   8QmQIHVN8tXejAa/ZibQsm1XgOH7le2Aw8h34BCMuwtjzcSJFJVEjxH1W
   Yr8gBthUSRe9dEPOYkwLLrfenyyM9QnM7wqYdMLG7ZPb6iLHAEfAyBr+t
   5wvw48tqQ2zUKkaxHwjEJK3KH+EK6tv47GvfOxgv1RROTCr33bsWNB3z4
   w==;
X-CSE-ConnectionGUID: Z3tjYeIwQS6W6oAsAYwhcA==
X-CSE-MsgGUID: kD6cdU5fTBSYCyu4zD4Apg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85928990"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85928990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 01:52:07 -0700
X-CSE-ConnectionGUID: J8R8eAAOT5CRCP3spor84w==
X-CSE-MsgGUID: j2Dw/idwT3ihHY4KJiuH3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="289901204"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2026 01:52:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp00o-00000000fDG-2BeM;
	Wed, 29 Jul 2026 08:51:46 +0000
Date: Wed, 29 Jul 2026 16:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Kairui Song <kasong@tencent.com>
Subject: [linux-next:master 9148/9778]
 drivers/gpu/drm/ttm/ttm_backup.c:163 ttm_backup_backup_folio() warn:
 inconsistent indenting
Message-ID: <202607291606.s2Hw3kEj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3652b49adac266a3d27cb41cdfdb7d8790fc3633
commit: 04b6dc72ddbc3192f17353492f0a9e1669c01725 [9148/9778] shmem: provide a shmem_write_folio wrapper
config: alpha-randconfig-r073-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291606.s2Hw3kEj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291606.s2Hw3kEj-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_backup.c:163 ttm_backup_backup_folio() warn: inconsistent indenting

vim +163 drivers/gpu/drm/ttm/ttm_backup.c

    70	
    71	/**
    72	 * ttm_backup_backup_folio() - Backup a folio
    73	 * @backup: The struct backup pointer to use.
    74	 * @folio: The folio to back up.
    75	 * @order: The allocation order of @folio.  Since TTM allocates higher-order
    76	 *         pages without __GFP_COMP, folio_nr_pages(@folio) would always
    77	 *         return 1; the caller must pass the true order explicitly.
    78	 * @writeback: Whether to perform immediate writeback of the folio's pages.
    79	 * This may have performance implications.
    80	 * @idx: A unique integer for the first page of the folio and each struct backup.
    81	 * This allows the backup implementation to avoid managing
    82	 * its address space separately.
    83	 * @folio_gfp: The gfp value used when the folio was allocated.
    84	 * Currently unused.
    85	 * @alloc_gfp: The gfp to be used when allocating memory.
    86	 * @nr_pages_backed: Output. On a successful return, set to the number of
    87	 * pages actually backed up, which may be less than (1 << @order)
    88	 * if an -ENOMEM was encountered mid-folio.
    89	 *
    90	 * Context: If called from reclaim context, the caller needs to
    91	 * assert that the shrinker gfp has __GFP_FS set, to avoid
    92	 * deadlocking on lock_page(). If @writeback is set to true and
    93	 * called from reclaim context, the caller also needs to assert
    94	 * that the shrinker gfp has __GFP_IO set, since without it,
    95	 * we're not allowed to start backup IO.
    96	 *
    97	 * Return: A handle for the first backed-up page on success (handles for
    98	 * subsequent pages follow sequentially). -ENOMEM if no pages could be backed
    99	 * up. Any other negative error code if a non-ENOMEM failure occurred; in that
   100	 * case any pages backed up so far are truncated before returning.
   101	 */
   102	s64
   103	ttm_backup_backup_folio(struct file *backup, struct folio *folio,
   104				unsigned int order, bool writeback, pgoff_t idx,
   105				gfp_t folio_gfp, gfp_t alloc_gfp,
   106				pgoff_t *nr_pages_backed)
   107	{
   108		struct address_space *mapping = backup->f_mapping;
   109		int nr_pages = 1 << order;
   110		struct folio *to_folio;
   111		int ret, i;
   112	
   113		*nr_pages_backed = 0;
   114	
   115		for (i = 0; i < nr_pages; ) {
   116			int to_nr, j;
   117	
   118			/*
   119			 * Only inject past the first subpage so *nr_pages_backed is
   120			 * always > 0 here, matching a genuine mid-compound -ENOMEM
   121			 * and driving the caller's reactive split fallback instead
   122			 * of an early, no-progress failure.
   123			 */
   124			if (IS_ENABLED(CONFIG_FAULT_INJECTION) && i &&
   125			    ttm_backup_fault_inject_folio())
   126				to_folio = ERR_PTR(-ENOMEM);
   127			else
   128				to_folio = shmem_read_folio_gfp(mapping, idx + i, alloc_gfp);
   129			if (IS_ERR(to_folio)) {
   130				int err = PTR_ERR(to_folio);
   131	
   132				if (err == -ENOMEM && *nr_pages_backed)
   133					return ttm_backup_shmem_idx_to_handle(idx);
   134	
   135				if (*nr_pages_backed) {
   136					shmem_truncate_range(file_inode(backup),
   137							     (loff_t)idx << PAGE_SHIFT,
   138							     ((loff_t)(idx + i) << PAGE_SHIFT) - 1);
   139					/*
   140					 * The pages just truncated are no longer
   141					 * backed up; don't let the caller mistake
   142					 * them for valid handles.
   143					 */
   144					*nr_pages_backed = 0;
   145				}
   146				return err;
   147			}
   148	
   149			to_nr = min_t(int, nr_pages - i,
   150				      folio_next_index(to_folio) - (idx + i));
   151	
   152			folio_mark_accessed(to_folio);
   153			folio_lock(to_folio);
   154			folio_mark_dirty(to_folio);
   155	
   156			for (j = 0; j < to_nr; j++)
   157				copy_highpage(folio_file_page(to_folio, idx + i + j),
   158					      folio_page(folio, i + j));
   159	
   160			if (writeback && !folio_mapped(to_folio) &&
   161			    folio_clear_dirty_for_io(to_folio)) {
   162				folio_set_reclaim(to_folio);
 > 163			ret = shmem_write_folio(to_folio);
   164				if (!folio_test_writeback(to_folio))
   165					folio_clear_reclaim(to_folio);
   166				if (ret == AOP_WRITEPAGE_ACTIVATE)
   167					folio_unlock(to_folio);
   168			} else {
   169				folio_unlock(to_folio);
   170			}
   171	
   172			folio_put(to_folio);
   173			i += to_nr;
   174			*nr_pages_backed = i;
   175		}
   176	
   177		return ttm_backup_shmem_idx_to_handle(idx);
   178	}
   179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
