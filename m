Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4DA23A2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 05:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685771183; x=1717307183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+ccGJOS9tE0Aoa2Ddmnnc7Z17F1fi57SheVscS0tgQ=;
  b=OxDir0qFv7O6LGNIAUYztEotcDCXN4av0Pm+gc6GETf+aDXAdYA+EoK/
   MijGgKl1wuRhO1zuQ711LzpOQ2tLS8YLw0MemMwhAZbEkj18k5zGhnSCX
   3Zo95Yi+yz69p7JdBnGcYSBs/KVDNLucXVjvZvgwU+Tj11OKl7wrAZFz5
   2g2OhRNkcdwLOg4Ua/N0sBoaJHet9N1tV6s7AYF59QMyXr62SxZ112365
   k2xGH2aBe7KHF680CIYWBh+MnOrGekMtrklQKOFcnhXp/S67qWjxtKw3d
   XZFhlLLuLEuLRGqda9Pwq3HVGbvfPsikaNN0eimQJqWJzvx6Wiqby2sNT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="353528696"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="353528696"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 22:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="882300480"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="882300480"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Jun 2023 22:46:21 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5K5k-0001Ll-0v;
	Sat, 03 Jun 2023 05:46:20 +0000
Date: Sat, 3 Jun 2023 13:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:raid-stripe-tree 11/31] fs/btrfs/ordered-data.c:341
 can_finish_ordered_extent() warn: inconsistent indenting
Message-ID: <202306031353.PvqTJNjV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git raid-stripe-tree
head:   7f755507b2a1f921afadd2b041bc46829e2bda2b
commit: a3cf6fb6f100ebf9aa7f36dd9db0ec97b12f377b [11/31] btrfs: factor out a can_finish_ordered_extent helper
config: x86_64-randconfig-m001-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031353.PvqTJNjV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306031353.PvqTJNjV-lkp@intel.com/

smatch warnings:
fs/btrfs/ordered-data.c:341 can_finish_ordered_extent() warn: inconsistent indenting

vim +341 fs/btrfs/ordered-data.c

   305	
   306	static bool can_finish_ordered_extent(struct btrfs_ordered_extent *ordered,
   307					      struct page *page, u64 file_offset,
   308					      u64 len, bool uptodate)
   309	{
   310		struct btrfs_inode *inode = BTRFS_I(ordered->inode);
   311		struct btrfs_fs_info *fs_info = inode->root->fs_info;
   312	
   313		lockdep_assert_held(&inode->ordered_tree.lock);
   314	
   315		if (page) {
   316			ASSERT(page->mapping);
   317			ASSERT(page_offset(page) <= file_offset);
   318			ASSERT(file_offset + len <= page_offset(page) + PAGE_SIZE);
   319	
   320			/*
   321			 * Ordered (Private2) bit indicates whether we still
   322			 * have pending io unfinished for the ordered extent.
   323			 *
   324			 * If there's no such bit, we need to skip to next range.
   325			 */
   326			if (!btrfs_page_test_ordered(fs_info, page, file_offset, len))
   327				return false;
   328			btrfs_page_clear_ordered(fs_info, page, file_offset, len);
   329		}
   330	
   331		/* Now we're fine to update the accounting */
   332		if (WARN_ON_ONCE(len > ordered->bytes_left)) {
   333			btrfs_crit(fs_info,
   334	"bad ordered extent accounting, root=%llu ino=%llu OE offset=%llu OE len=%llu to_dec=%llu left=%llu",
   335				   inode->root->root_key.objectid,
   336				   btrfs_ino(inode),
   337				   ordered->file_offset,
   338				   ordered->num_bytes,
   339				   len,
   340				   ordered->bytes_left);
 > 341				   ordered->bytes_left = 0;
   342		} else {
   343			ordered->bytes_left -= len;
   344		}
   345	
   346		if (!uptodate)
   347			set_bit(BTRFS_ORDERED_IOERR, &ordered->flags);
   348	
   349		if (ordered->bytes_left)
   350			return false;
   351	
   352		/*
   353		 * All the IO of the ordered extent is finished, we need to queue
   354		 * the finish_func to be executed.
   355		 */
   356		set_bit(BTRFS_ORDERED_IO_DONE, &ordered->flags);
   357		cond_wake_up(&ordered->wait);
   358		refcount_inc(&ordered->refs);
   359		trace_btrfs_ordered_extent_mark_finished(inode, ordered);
   360		return true;
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
