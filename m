Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AAF156EF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 08:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683274051; x=1714810051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rmSJY0j+1r5L0IYMLThcW+Hp+jS5MNdVZmUKInYhVyQ=;
  b=gLzzP/MSsFKwmJqCtkH+3t6rFTpyJNBZjv5rmwfUPtzMFz8vD2HuP/x2
   7VnJXvR0EOsQvP8oNYim3V8fCd5dNwBkNdX8p08xayYtx3cfYWYR5BXVg
   j6PGhUxS9DvliYfRmFTuA2T3gJhPMqC+8lWMhMrqlXIN9+zitnlJgknuS
   ltCUblLsrrns8dm6ZMzNHgiYRGEAA6UeNi6rvKOkaKFEl4Qiv0vwIIBai
   +644yF6xZ1tBYD8n8FIaXemA7KMY0wIt4tJMhbWp4MzCgZZIrAfgQ7X9o
   IVH+3pqLzF6mj/PE5Qu7mU4f9piIEO2q9n3tuCk0np74pAEnFpJZalolg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347980775"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="347980775"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 01:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="691556991"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="691556991"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 May 2023 01:07:09 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puqT6-0000ON-04;
	Fri, 05 May 2023 08:07:08 +0000
Date: Fri, 5 May 2023 16:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:btrfs-bio-ordered 14/20] fs/btrfs/ordered-data.c:326
 can_finish_ordered_extent() warn: inconsistent indenting
Message-ID: <202305051554.zTNU0nBF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git btrfs-bio-ordered
head:   9094131de4ccd8a3407420c690ab8f435e7da5cc
commit: 4f8e47c9b505503bc84bde9155384aaefc1e57e7 [14/20] btrfs: factor out a can_finish_ordered_extent helper
config: m68k-randconfig-m041-20230430 (https://download.01.org/0day-ci/archive/20230505/202305051554.zTNU0nBF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051554.zTNU0nBF-lkp@intel.com/

smatch warnings:
fs/btrfs/ordered-data.c:326 can_finish_ordered_extent() warn: inconsistent indenting

vim +326 fs/btrfs/ordered-data.c

   290	
   291	static bool can_finish_ordered_extent(struct btrfs_ordered_extent *ordered,
   292					      struct page *page, u64 file_offset,
   293					      u64 len, bool uptodate)
   294	{
   295		struct btrfs_inode *inode = BTRFS_I(ordered->inode);
   296		struct btrfs_fs_info *fs_info = inode->root->fs_info;
   297	
   298		lockdep_assert_held(&inode->ordered_tree.lock);
   299	
   300		if (page) {
   301			ASSERT(page->mapping);
   302			ASSERT(page_offset(page) <= file_offset);
   303			ASSERT(file_offset + len <= page_offset(page) + PAGE_SIZE);
   304	
   305			/*
   306			 * Ordered (Private2) bit indicates whether we still
   307			 * have pending io unfinished for the ordered extent.
   308			 *
   309			 * If there's no such bit, we need to skip to next range.
   310			 */
   311			if (!btrfs_page_test_ordered(fs_info, page, file_offset, len))
   312				return false;
   313			btrfs_page_clear_ordered(fs_info, page, file_offset, len);
   314		}
   315	
   316		/* Now we're fine to update the accounting */
   317		if (WARN_ON_ONCE(len > ordered->bytes_left)) {
   318			btrfs_crit(fs_info,
   319	"bad ordered extent accounting, root=%llu ino=%llu OE offset=%llu OE len=%llu to_dec=%llu left=%llu",
   320				   inode->root->root_key.objectid,
   321				   btrfs_ino(inode),
   322				   ordered->file_offset,
   323				   ordered->num_bytes,
   324				   len,
   325				   ordered->bytes_left);
 > 326				   ordered->bytes_left = 0;
   327		} else {
   328			ordered->bytes_left -= len;
   329		}
   330	
   331		if (!uptodate)
   332			set_bit(BTRFS_ORDERED_IOERR, &ordered->flags);
   333	
   334		if (ordered->bytes_left)
   335			return false;
   336	
   337		/*
   338		 * All the IO of the ordered extent is finished, we need to queue
   339		 * the finish_func to be executed.
   340		 */
   341		set_bit(BTRFS_ORDERED_IO_DONE, &ordered->flags);
   342		cond_wake_up(&ordered->wait);
   343		refcount_inc(&ordered->refs);
   344		trace_btrfs_ordered_extent_mark_finished(inode, ordered);
   345		return true;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
