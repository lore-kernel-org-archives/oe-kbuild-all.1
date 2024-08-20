Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824D18C024
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145330; cv=none; b=WLf3v4n4hl4tB6iNwUGHWQnNZqEqDxrv67jW0yVdDrsk8Ys5wr0OIIdM447P+Ubb1M9FI6IIQl+7DTk3acjed8vPzEZFOQlzQWR4JmOFm/G3TUrLyG8jiPiCVOqU9vaSd7O0V9mIbqIF4Zeltev8HDs6qHQ+1Eg4LsnuxhKZAiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145330; c=relaxed/simple;
	bh=M2pXyeLtUoV/IfWHPCgfghNIr7RzwttGN80RkkBq04M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjpfgL+Z8M+Te0xhFRSiPeek4uZRvYtRLjNakkvoWw8dWgbTthNbL07HQgzh87WyjqKXhAI6nno1OumDamzpbZUgMWUbP925fuezRThdqytuFbHvMl61HoFjEMIMULiMIF5newLXMAEcb7LRkX79lh+ZT2/731lbGA0Y7WK9Kas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CC8BVWKK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CC8BVWKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724145328; x=1755681328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2pXyeLtUoV/IfWHPCgfghNIr7RzwttGN80RkkBq04M=;
  b=CC8BVWKKchnbZWeVY3JbXI8aGzYfJyqo4SltE50vtQjf2yMK6UzaFaWb
   FQRkGmXbw8xqlgl7HANiyzA9K0QqJeqigI1SL5IYd3mCFJMWnpXgtNsvf
   ATRjlzMxgSy6WigMXEyZ6zUJLle82EWaIWTYvzyVoe1s1cPbXCeHBps3a
   t04qOQkd5I8LsN08aLRpPQia91GqgtCNn9aYllsvgxqgsyWh+KAtSOJhN
   lZNYlZM3ynS+24MaJ0gkz6JBRK9IVJ6FJJBjbFJXo9Nz1wvjU4pZySnsi
   bsAkPaLv1NhPQMT+a0ytEzPWhGWpMM4+S/+DdqCOcMMqbY0LcsCbE1UPO
   Q==;
X-CSE-ConnectionGUID: GW4RKfQATjWCqZ5OPk1BUg==
X-CSE-MsgGUID: hilixyKXR92ed66YSOtiTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22596932"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="22596932"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 02:15:27 -0700
X-CSE-ConnectionGUID: Xji8Hcc5Q0eO83umHXU6kw==
X-CSE-MsgGUID: HncNAx//Sj6gRJhafdm/fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="61425464"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2024 02:15:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgKxY-0009x8-0h;
	Tue, 20 Aug 2024 09:15:24 +0000
Date: Tue, 20 Aug 2024 17:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 78/78] fs/btrfs/extent_io.c:2277:21:
 warning: unused variable 'nr'
Message-ID: <202408201722.z443bHQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   9803e168d6a211447526b59e760a95e9ef0fb8b4
commit: 9803e168d6a211447526b59e760a95e9ef0fb8b4 [78/78] btrfs: remove the nr_ret parameter from __extent_writepage_io()
config: arc-randconfig-001-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201722.z443bHQm-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201722.z443bHQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201722.z443bHQm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.c: In function 'extent_write_locked_range':
>> fs/btrfs/extent_io.c:2277:21: warning: unused variable 'nr' [-Wunused-variable]
    2277 |                 int nr = 0;
         |                     ^~


vim +/nr +2277 fs/btrfs/extent_io.c

d1310b2e0cd98eb Chris Mason       2008-01-24  2246  
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2247  /*
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2248   * Submit the pages in the range to bio for call sites which delalloc range has
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2249   * already been ran (aka, ordered extent inserted) and all pages are still
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2250   * locked.
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2251   */
c20aad4886b993c Josef Bacik       2024-07-24  2252  void extent_write_locked_range(struct inode *inode, const struct folio *locked_folio,
778b878543f05dd Christoph Hellwig 2023-06-28  2253  			       u64 start, u64 end, struct writeback_control *wbc,
778b878543f05dd Christoph Hellwig 2023-06-28  2254  			       bool pages_dirty)
771ed689d2cd534 Chris Mason       2008-11-06  2255  {
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2256  	bool found_error = false;
771ed689d2cd534 Chris Mason       2008-11-06  2257  	int ret = 0;
771ed689d2cd534 Chris Mason       2008-11-06  2258  	struct address_space *mapping = inode->i_mapping;
41044b41ad2c8c8 David Sterba      2023-09-14  2259  	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
eb34dceace983e3 Christoph Hellwig 2023-05-31  2260  	const u32 sectorsize = fs_info->sectorsize;
eb34dceace983e3 Christoph Hellwig 2023-05-31  2261  	loff_t i_size = i_size_read(inode);
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2262  	u64 cur = start;
c000bc04bad42db Christoph Hellwig 2023-02-27  2263  	struct btrfs_bio_ctrl bio_ctrl = {
7027f87108ce3d2 Christoph Hellwig 2023-05-31  2264  		.wbc = wbc,
7027f87108ce3d2 Christoph Hellwig 2023-05-31  2265  		.opf = REQ_OP_WRITE | wbc_to_write_flags(wbc),
c000bc04bad42db Christoph Hellwig 2023-02-27  2266  	};
771ed689d2cd534 Chris Mason       2008-11-06  2267  
7027f87108ce3d2 Christoph Hellwig 2023-05-31  2268  	if (wbc->no_cgroup_owner)
7027f87108ce3d2 Christoph Hellwig 2023-05-31  2269  		bio_ctrl.opf |= REQ_BTRFS_CGROUP_PUNT;
7027f87108ce3d2 Christoph Hellwig 2023-05-31  2270  
66448b9d5b6840c Qu Wenruo         2021-09-27  2271  	ASSERT(IS_ALIGNED(start, sectorsize) && IS_ALIGNED(end + 1, sectorsize));
66448b9d5b6840c Qu Wenruo         2021-09-27  2272  
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2273  	while (cur <= end) {
66448b9d5b6840c Qu Wenruo         2021-09-27  2274  		u64 cur_end = min(round_down(cur, PAGE_SIZE) + PAGE_SIZE - 1, end);
9783e4deed72919 Christoph Hellwig 2023-06-28  2275  		u32 cur_len = cur_end + 1 - cur;
4ee731d27040d67 Josef Bacik       2024-07-24  2276  		struct folio *folio;
eb34dceace983e3 Christoph Hellwig 2023-05-31 @2277  		int nr = 0;
66448b9d5b6840c Qu Wenruo         2021-09-27  2278  
4ee731d27040d67 Josef Bacik       2024-07-24  2279  		folio = __filemap_get_folio(mapping, cur >> PAGE_SHIFT, 0, 0);
4ee731d27040d67 Josef Bacik       2024-07-24  2280  
4ee731d27040d67 Josef Bacik       2024-07-24  2281  		/*
4ee731d27040d67 Josef Bacik       2024-07-24  2282  		 * This shouldn't happen, the pages are pinned and locked, this
4ee731d27040d67 Josef Bacik       2024-07-24  2283  		 * code is just in case, but shouldn't actually be run.
4ee731d27040d67 Josef Bacik       2024-07-24  2284  		 */
4ee731d27040d67 Josef Bacik       2024-07-24  2285  		if (IS_ERR(folio)) {
4ee731d27040d67 Josef Bacik       2024-07-24  2286  			btrfs_mark_ordered_io_finished(BTRFS_I(inode), NULL,
4ee731d27040d67 Josef Bacik       2024-07-24  2287  						       cur, cur_len, false);
4ee731d27040d67 Josef Bacik       2024-07-24  2288  			mapping_set_error(mapping, PTR_ERR(folio));
4ee731d27040d67 Josef Bacik       2024-07-24  2289  			cur = cur_end + 1;
4ee731d27040d67 Josef Bacik       2024-07-24  2290  			continue;
4ee731d27040d67 Josef Bacik       2024-07-24  2291  		}
4ee731d27040d67 Josef Bacik       2024-07-24  2292  
4ee731d27040d67 Josef Bacik       2024-07-24  2293  		ASSERT(folio_test_locked(folio));
c20aad4886b993c Josef Bacik       2024-07-24  2294  		if (pages_dirty && folio != locked_folio)
4ee731d27040d67 Josef Bacik       2024-07-24  2295  			ASSERT(folio_test_dirty(folio));
eb34dceace983e3 Christoph Hellwig 2023-05-31  2296  
4ee731d27040d67 Josef Bacik       2024-07-24  2297  		ret = __extent_writepage_io(BTRFS_I(inode), folio, cur, cur_len,
9803e168d6a2114 Qu Wenruo         2024-08-14  2298  					    &bio_ctrl, i_size);
eb34dceace983e3 Christoph Hellwig 2023-05-31  2299  		if (ret == 1)
eb34dceace983e3 Christoph Hellwig 2023-05-31  2300  			goto next_page;
eb34dceace983e3 Christoph Hellwig 2023-05-31  2301  
9783e4deed72919 Christoph Hellwig 2023-06-28  2302  		if (ret) {
d07c0f3c01c3dd5 Josef Bacik       2024-07-24  2303  			btrfs_mark_ordered_io_finished(BTRFS_I(inode), folio,
9783e4deed72919 Christoph Hellwig 2023-06-28  2304  						       cur, cur_len, !ret);
4ee731d27040d67 Josef Bacik       2024-07-24  2305  			mapping_set_error(mapping, ret);
9783e4deed72919 Christoph Hellwig 2023-06-28  2306  		}
4ee731d27040d67 Josef Bacik       2024-07-24  2307  		btrfs_folio_unlock_writer(fs_info, folio, cur, cur_len);
0835d1e66e7f224 Christoph Hellwig 2023-06-28  2308  		if (ret < 0)
2bd0fc9349b6365 Qu Wenruo         2021-09-27  2309  			found_error = true;
eb34dceace983e3 Christoph Hellwig 2023-05-31  2310  next_page:
4ee731d27040d67 Josef Bacik       2024-07-24  2311  		folio_put(folio);
66448b9d5b6840c Qu Wenruo         2021-09-27  2312  		cur = cur_end + 1;
771ed689d2cd534 Chris Mason       2008-11-06  2313  	}
771ed689d2cd534 Chris Mason       2008-11-06  2314  
ee5f017dccc79e5 David Sterba      2022-10-27  2315  	submit_write_bio(&bio_ctrl, found_error ? ret : 0);
771ed689d2cd534 Chris Mason       2008-11-06  2316  }
d1310b2e0cd98eb Chris Mason       2008-01-24  2317  

:::::: The code at line 2277 was first introduced by commit
:::::: eb34dceace983e304e00d4bf711cec0a603959ac btrfs: only call __extent_writepage_io from extent_write_locked_range

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
