Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139BE4690
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 21:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745097745; cv=none; b=Y1oFIgLea14Hybw/iq0ATMwCSm2hq3ombGRnqoibtWw93zXiF5F9PDGRgSO4abvpGCSZk5l5nPyP+3pC870ZDr87PnJUW1yT33Gj3/WOzfWIP0mmwtVRfHYf2EEoeI7IdH83zqRt3e0zQlcplldC3X8roYdy+s9sDtZRtvtZyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745097745; c=relaxed/simple;
	bh=uEcwiw2PHaetLTwQfCW34ySAUJCwsyQwEDJWLmsaWzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gH+0HmyxZ/K28c+rDfuZvze/PhfkOgIg/0TleSSeCVT37XmK7BAonv2CwdtUPSIs841ydwfIq4axT5rIb4AwZwKvoJdOylPrCymBe2imQ7qynsh3eWVw1KuFT5wLmCAPucYOlYsCT7Aq/BxZ2BjCDkwB5NY9ctyai7ksWDvACEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OptRMYl6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OptRMYl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745097743; x=1776633743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uEcwiw2PHaetLTwQfCW34ySAUJCwsyQwEDJWLmsaWzk=;
  b=OptRMYl6RV6+iAQWVsln3SB1C7wjxkb2yw4kiElC5kdiQ+h6YKbdCEaC
   8BmA+BtU5JGXomM2lw73DqhJvlXlIS3XvBRYN0XWtArWXV9C8LbDUV5B4
   lLfU9+g6yRYhgUnyWBFd9g1Jsx8J84QjCUocOLQ5QjO76XIhm65aIZQY5
   4Zc8hLZJdoN5gm64rOQhieFliL5udc+Web8yODVYkcS4Q4IQIq3Rcx5KP
   KbuKZhTOzLwjniLetff7xsD4t88Ug9KqjP5a/P85X2Os23kyci9Th0FGI
   KoRImBxdMKHTrbI7cGFlW4uVYuYo8KNJdUWxbzfK2bhcWH08DGx3z69oP
   Q==;
X-CSE-ConnectionGUID: SrIteJ9sSUGIOyNTjNyn0w==
X-CSE-MsgGUID: UOYLM+vmS6mOrnCXa+8wRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46856451"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46856451"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 14:22:22 -0700
X-CSE-ConnectionGUID: 11W4gRsTTviFtedI8YUSuw==
X-CSE-MsgGUID: +xUw0+AfSfO82eXzjUZ4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131244875"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Apr 2025 14:22:21 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Fdj-0004CB-0O;
	Sat, 19 Apr 2025 21:22:19 +0000
Date: Sun, 20 Apr 2025 05:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1394/4779]
 drivers/gpu/drm/ttm/ttm_backup.c:139:undefined reference to `shmem_writeout'
Message-ID: <202504200514.Ldt6j1zC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: fe75adffac33eeb167b378861d80c805b234495c [1394/4779] ttm: Call shmem_writeout() from ttm_backup_backup_page()
config: loongarch-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200514.Ldt6j1zC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200514.Ldt6j1zC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200514.Ldt6j1zC-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/gpu/drm/ttm/ttm_backup.o: in function `.LVL117':
>> drivers/gpu/drm/ttm/ttm_backup.c:139:(.text+0x53c): undefined reference to `shmem_writeout'


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
