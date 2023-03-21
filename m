Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7DD1FA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679378598; x=1710914598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rf2sGDMxS+jEGaN9eagvKtFOGsBfDJ5r0BSEWACXRTU=;
  b=fSbV2o7mSG763Fwt91hxDpSpcJNeHZy1A9DoQdJlTde8gpOFFR7BDw5H
   H6ofXUOyiOXnYJoWlyxfwEm3A0H0uCkHIQ+ItO0MOGmiigFxuu3rCN/XF
   hei6aqbKCVeBofC7DxcRavgR9ZfJ6leVt/ODixL0M0KCa/13citGE77mq
   vEau0uifHAJPxY7fTfCv4MHwdrxibh7R4pnbIHWjrXzLfhjUPTvnX6ZhL
   82qEFCq63PibTHl6VsN2zGDe5DkMYSvEXOiQ0nqB0X//pv5ZhRyQBDTj2
   qgukJ5EIu6fljQmF1eCGUrBRwxhgvyn6V9LQP5Ix3IBRjjutldWaFA7Eo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318507558"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="318507558"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 23:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="805191432"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="805191432"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 23:03:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peV5X-000Bec-1d;
	Tue, 21 Mar 2023 06:03:15 +0000
Date: Tue, 21 Mar 2023 14:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:for-next 100/116] fs/btrfs/inode.c:7770:25:
 error: implicit declaration of function 'find_lock_delalloc_range'
Message-ID: <202303211348.iNsVQy0p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git for-next
head:   465eb700af54a8387516df830fbfae6c11b9f136
commit: bb3bcb5aa77394e13bb25dc15daf53369e31e3fd [100/116] btrfs: locking extents for async writeback
config: x86_64-randconfig-a006 (https://download.01.org/0day-ci/archive/20230321/202303211348.iNsVQy0p-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/kdave/btrfs-devel/commit/bb3bcb5aa77394e13bb25dc15daf53369e31e3fd
        git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-devel.git
        git fetch --no-tags kdave-btrfs-devel for-next
        git checkout bb3bcb5aa77394e13bb25dc15daf53369e31e3fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211348.iNsVQy0p-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'btrfs_writepages_async':
>> fs/btrfs/inode.c:7770:25: error: implicit declaration of function 'find_lock_delalloc_range' [-Werror=implicit-function-declaration]
    7770 |                 found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/find_lock_delalloc_range +7770 fs/btrfs/inode.c

  7756	
  7757	static int btrfs_writepages_async(struct btrfs_inode *inode, struct writeback_control *wbc, u64 start, u64 end)
  7758	{
  7759		u64 last_start, cur_start = start;
  7760		u64 cur_end;
  7761		int ret = 0;
  7762	
  7763		lock_extent(&inode->io_tree, start, end, NULL);
  7764	
  7765		while (cur_start < end) {
  7766			bool found;
  7767			last_start = cur_start;
  7768			cur_end = end;
  7769	
> 7770			found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
  7771			/* Nothing to writeback */
  7772			if (!found) {
  7773				unlock_extent(&inode->io_tree, cur_start, cur_end, NULL);
  7774				cur_start = cur_end + 1;
  7775				continue;
  7776			}
  7777	
  7778			/* A hole with no pages, unlock part therof */
  7779			if (cur_start > last_start)
  7780				unlock_extent(&inode->io_tree, last_start, cur_start - 1, NULL);
  7781	
  7782			/* Got more than we requested for */
  7783			if (cur_end > end) {
  7784				if (try_lock_extent(&inode->io_tree, end + 1, cur_end, NULL)) {
  7785					/* Try writing the whole extent */
  7786					end = cur_end;
  7787				} else {
  7788					/*
  7789					 * Someone is holding the extent lock.
  7790					 * Unlock pages from last part of extent, and
  7791					 * write just as much writepage requested for
  7792					 */
  7793					__unlock_for_delalloc(&inode->vfs_inode, NULL, end + 1, cur_end);
  7794					cur_end = end;
  7795				}
  7796			}
  7797	
  7798			ret = cow_file_range_async(inode, wbc, cur_start, cur_end);
  7799			if (ret < 0) {
  7800				unlock_extent(&inode->io_tree, cur_start, end, NULL);
  7801				break;
  7802			}
  7803	
  7804			cur_start = cur_end + 1;
  7805		}
  7806	
  7807		return ret;
  7808	}
  7809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
