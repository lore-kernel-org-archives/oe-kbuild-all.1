Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0E21B87D5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615589; cv=none; b=UBn9AlddNDaC2zC7y4RmX0Hv9KwkTEgtjtgqaXwCC9RozC3HLIshZkKeU5VEsvW+9+z4LvhdsraCQUkrc5J3LnKkmuQTKm79nObyAs5CwRxUdivnGCbZCmgeqy9XKWailfZD7D9kIOjOll4dLmx0D1T+n1nlF0lnHBcM3vspmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615589; c=relaxed/simple;
	bh=uzZAGG8vp9PGIDyRmiMLuzPBiwpX4pORIekGbwIrh+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mMBSWM+PcAlW3lIblLNs4g6+QJrr34AgBAoLzbEIpfp/OryhuhEMhD2Sfs7ep61HdnkJOZEATneas+/t7fGYe/dxvjAlHr7ptZB2b7W1bp9oNH5/FglVHx9KpZpa0KaqLiNJZ4EOObOkUsichpnZAanPyOOdok3zAwQQcsDyqxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLpQRRCj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLpQRRCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746615588; x=1778151588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzZAGG8vp9PGIDyRmiMLuzPBiwpX4pORIekGbwIrh+Y=;
  b=kLpQRRCjtOtaJUSbBYQVXoHA/DuFcWaJjPCkEIR3le1UHXUX35yT5Rtr
   3Kr/hNAD7iPHUXpTJpinQQ5zB3zpwvBAlYQ3ZsvEf4tPnhG0EsrGxAc5w
   VsKaLi2Youqz4D+1i9Nkdgn6HOlYsnm8VAXOiJh2D+NEKvY3QkXcAzp/g
   4/Zt+6bv3/eYAADARTIZkfsPw5+0xpDELzOEVoY3V81t+uwrje9u8zEd0
   Rq6q10HE5HGb5muMGcODR+JAu/aU3Tycyo4WRggYRpxVKlDWjM+ZhX1Wg
   Uzy4hUFXcYZZTmO7+hTJmjhnTvr55cLKq2/GCUC/aAkuHUvWOySRZgmun
   A==;
X-CSE-ConnectionGUID: fLYqCgVtQKi3lcZ+JB/efQ==
X-CSE-MsgGUID: xsAMh+/7SFSoRJVmLtbmXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="50984433"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="50984433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:59:47 -0700
X-CSE-ConnectionGUID: LWnIoM74SoeGDnSt4ggDpQ==
X-CSE-MsgGUID: 3cukF1GTSayQlpbRG7lK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136435952"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 03:59:45 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcV5-00009e-0o;
	Wed, 07 May 2025 10:59:43 +0000
Date: Wed, 7 May 2025 18:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1288/9308] drivers/gpu/drm/ttm/ttm_backup.c:139:
 undefined reference to `shmem_writeout'
Message-ID: <202505071839.5Cq3pqTM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: fe75adffac33eeb167b378861d80c805b234495c [1288/9308] ttm: Call shmem_writeout() from ttm_backup_backup_page()
config: openrisc-randconfig-2004-20250506 (https://download.01.org/0day-ci/archive/20250507/202505071839.5Cq3pqTM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071839.5Cq3pqTM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071839.5Cq3pqTM-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/gpu/drm/ttm/ttm_backup.o: in function `ttm_backup_backup_page':
>> drivers/gpu/drm/ttm/ttm_backup.c:139: undefined reference to `shmem_writeout'
>> drivers/gpu/drm/ttm/ttm_backup.c:139:(.text+0x2e0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `shmem_writeout'


vim +139 drivers/gpu/drm/ttm/ttm_backup.c

    80	
    81	/**
    82	 * ttm_backup_backup_page() - Backup a page
    83	 * @backup: The struct backup pointer to use.
    84	 * @page: The page to back up.
    85	 * @writeback: Whether to perform immediate writeback of the page.
    86	 * This may have performance implications.
    87	 * @idx: A unique integer for each page and each struct backup.
    88	 * This allows the backup implementation to avoid managing
    89	 * its address space separately.
    90	 * @page_gfp: The gfp value used when the page was allocated.
    91	 * This is used for accounting purposes.
    92	 * @alloc_gfp: The gfp to be used when allocating memory.
    93	 *
    94	 * Context: If called from reclaim context, the caller needs to
    95	 * assert that the shrinker gfp has __GFP_FS set, to avoid
    96	 * deadlocking on lock_page(). If @writeback is set to true and
    97	 * called from reclaim context, the caller also needs to assert
    98	 * that the shrinker gfp has __GFP_IO set, since without it,
    99	 * we're not allowed to start backup IO.
   100	 *
   101	 * Return: A handle on success. Negative error code on failure.
   102	 *
   103	 * Note: This function could be extended to back up a folio and
   104	 * implementations would then split the folio internally if needed.
   105	 * Drawback is that the caller would then have to keep track of
   106	 * the folio size- and usage.
   107	 */
   108	s64
   109	ttm_backup_backup_page(struct ttm_backup *backup, struct page *page,
   110			       bool writeback, pgoff_t idx, gfp_t page_gfp,
   111			       gfp_t alloc_gfp)
   112	{
   113		struct file *filp = ttm_backup_to_file(backup);
   114		struct address_space *mapping = filp->f_mapping;
   115		unsigned long handle = 0;
   116		struct folio *to_folio;
   117		int ret;
   118	
   119		to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
   120		if (IS_ERR(to_folio))
   121			return PTR_ERR(to_folio);
   122	
   123		folio_mark_accessed(to_folio);
   124		folio_lock(to_folio);
   125		folio_mark_dirty(to_folio);
   126		copy_highpage(folio_file_page(to_folio, idx), page);
   127		handle = ttm_backup_shmem_idx_to_handle(idx);
   128	
   129		if (writeback && !folio_mapped(to_folio) &&
   130		    folio_clear_dirty_for_io(to_folio)) {
   131			struct writeback_control wbc = {
   132				.sync_mode = WB_SYNC_NONE,
   133				.nr_to_write = SWAP_CLUSTER_MAX,
   134				.range_start = 0,
   135				.range_end = LLONG_MAX,
   136				.for_reclaim = 1,
   137			};
   138			folio_set_reclaim(to_folio);
 > 139			ret = shmem_writeout(to_folio, &wbc);
   140			if (!folio_test_writeback(to_folio))
   141				folio_clear_reclaim(to_folio);
   142			/*
   143			 * If writeout succeeds, it unlocks the folio.	errors
   144			 * are otherwise dropped, since writeout is only best
   145			 * effort here.
   146			 */
   147			if (ret)
   148				folio_unlock(to_folio);
   149		} else {
   150			folio_unlock(to_folio);
   151		}
   152	
   153		folio_put(to_folio);
   154	
   155		return handle;
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
