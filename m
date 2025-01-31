Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCC1FAA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 03:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738293184; cv=none; b=quZLootVr318tyRzqb8WWNic6C4fpFgZuEQDjOSC9PBrDyNZPoEdXUNKF/RgtZAlmujGTkejwV1bzqmb0OOPumCZRRa2P3qyU/XdjQGd7tHWFLczLGAL+XsJoAgxJFdghXEQF7MCGvfGm+EK6zDDDnoVyXJX/4rEQcVnSmivC/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738293184; c=relaxed/simple;
	bh=SOVI0sruBabd7/Yvq0KKm3kueFp4CcsO4nZraXaV98Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FT/zqlW8sp17xrxl+fp+VZxoad8fflMzFws/0anP9RUArMzucmM24qwJk03sOgB8LfeB/3zmNEX4CLJrbortHA2TacT3Rj06JjIThs7Uuo5KsnhRoyUapkliR4yqL+wTx9/7Q7NZcR3XT+CM+7996kBKdRUq4cqfjHL6WTgXYEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k65pf3Af; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k65pf3Af"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738293182; x=1769829182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOVI0sruBabd7/Yvq0KKm3kueFp4CcsO4nZraXaV98Q=;
  b=k65pf3AfooFrXe2R7b8Lezq/Ea+eFpHnrMJ/vamAt50W8hVqGH71GZf/
   a54Kk6nOt0Hxbs0ge/JXLouMP9Xfrm7BQ/8e6KfHlz/EjB3gt9K6xTS8r
   74cVHL97EnP3ryYShZVRFvkKRzJ6hhDPyarpN5Bq9+HKgSEYMPqgO4v7Z
   w3WhctT72hE5FgljTaAwBTYMzr1YFtMLy9vU9fzEEdSOV2jbj5Fg/yhNh
   Qgf1/P7cZYfjq/gNOxK18oFxI9aLzePJKfutUWVA0sR5BLAfaNBHtDH85
   kRLDLk5U3jKmZf07G0ZUhrZKhDHcurek4U0nMyete2t5uiuVIiEEZ26/J
   Q==;
X-CSE-ConnectionGUID: YTfMaCfmRFmSLTUHjNKS1Q==
X-CSE-MsgGUID: xqNeBDIcS7CedZg14dwX4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42515526"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="42515526"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 19:13:01 -0800
X-CSE-ConnectionGUID: Ch8bfTxyQla2xhVAHW+Mgg==
X-CSE-MsgGUID: X8B6eO0+SDeIzNoYcfmw6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114514675"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2025 19:13:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdhSk-000lp1-04;
	Fri, 31 Jan 2025 03:12:58 +0000
Date: Fri, 31 Jan 2025 11:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 61/88] mm/cma_debug.c:189:55: warning: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size 3
Message-ID: <202501311125.wbG1DN2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   495206a68b359eb6117d0860861578113bbb94e7
commit: 77cbd63e91fa6c5f6157a30e61a380b6c47c1443 [61/88] mm, cma: support multiple contiguous ranges, if requested
config: x86_64-buildonly-randconfig-003-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311125.wbG1DN2B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311125.wbG1DN2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311125.wbG1DN2B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/cma_debug.c: In function 'cma_debugfs_add_one':
>> mm/cma_debug.c:189:55: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Wformat-truncation=]
     189 |                 snprintf(rdirname, sizeof(rdirname), "%d", r);
         |                                                       ^~
   mm/cma_debug.c:189:54: note: directive argument in the range [-2147483644, 2147483646]
     189 |                 snprintf(rdirname, sizeof(rdirname), "%d", r);
         |                                                      ^~~~
   mm/cma_debug.c:189:17: note: 'snprintf' output between 2 and 12 bytes into a destination of size 3
     189 |                 snprintf(rdirname, sizeof(rdirname), "%d", r);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +189 mm/cma_debug.c

   168	
   169	static void cma_debugfs_add_one(struct cma *cma, struct dentry *root_dentry)
   170	{
   171		struct dentry *tmp, *dir, *rangedir;
   172		int r;
   173		char rdirname[3];
   174		struct cma_memrange *cmr;
   175	
   176		tmp = debugfs_create_dir(cma->name, root_dentry);
   177	
   178		debugfs_create_file("alloc", 0200, tmp, cma, &cma_alloc_fops);
   179		debugfs_create_file("free", 0200, tmp, cma, &cma_free_fops);
   180		debugfs_create_file("count", 0444, tmp, &cma->count, &cma_debugfs_fops);
   181		debugfs_create_file("order_per_bit", 0444, tmp,
   182				    &cma->order_per_bit, &cma_debugfs_fops);
   183		debugfs_create_file("used", 0444, tmp, cma, &cma_used_fops);
   184		debugfs_create_file("maxchunk", 0444, tmp, cma, &cma_maxchunk_fops);
   185	
   186		rangedir = debugfs_create_dir("ranges", tmp);
   187		for (r = 0; r < cma->nranges; r++) {
   188			cmr = &cma->ranges[r];
 > 189			snprintf(rdirname, sizeof(rdirname), "%d", r);
   190			dir = debugfs_create_dir(rdirname, rangedir);
   191			debugfs_create_file("base_pfn", 0444, dir,
   192				    &cmr->base_pfn, &cma_debugfs_fops);
   193			cmr->dfs_bitmap.array = (u32 *)cmr->bitmap;
   194			cmr->dfs_bitmap.n_elements =
   195				DIV_ROUND_UP(cma_bitmap_maxno(cma, cmr),
   196						BITS_PER_BYTE * sizeof(u32));
   197			debugfs_create_u32_array("bitmap", 0444, dir,
   198					&cmr->dfs_bitmap);
   199		}
   200	
   201		/*
   202		 * Backward compatible symlinks to range 0 for base_pfn and bitmap.
   203		 */
   204		debugfs_create_symlink("base_pfn", tmp, "ranges/0/base_pfn");
   205		debugfs_create_symlink("bitmap", tmp, "ranges/0/bitmap");
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
