Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305307B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678516485; x=1710052485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3lrY33BS4drQBJ4/7FdS+sGR2z1DEjYPovtGGHHdqLs=;
  b=FhOo+d8RLMlMESCK5wZRR7RLqF9s6mzCnZrwWGAvdDV8OBVmyM1rmZKx
   f2p1pJ7XNK3G5DEX38D4XLrS1mEWIrDIugx7fWDnysgj65miqmH6Ekt34
   RLzxrXQnJYPwutku9h+4bibfmp+EI2ZmxDxO0z0G32ESF7nCNNaICT5ll
   pPFq1eIqPVhHiNL+TypQ2VQVVYnKtSIEc9keNSrKRWDvCBZ6ZlffJdaP7
   XNM9vao/ijMbZf31nGkh+NhpvAERi9aiU7v2pBtTi4LmWLUah+hq5CL5f
   XDJlhbNY2tdxui7frcPU0WsIktu8pEwYJjHk8XUld0WHxCQqkAOMMvmMk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="399478291"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="399478291"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:34:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="628077532"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="628077532"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 22:34:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pasoU-0004PZ-38;
	Sat, 11 Mar 2023 06:34:42 +0000
Date: Sat, 11 Mar 2023 14:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:lock-rearrange 11/21] fs/btrfs/inode.c:7808:25: error:
 implicit declaration of function 'find_lock_delalloc_range'
Message-ID: <202303111459.lVb8UUm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux lock-rearrange
head:   cf186c1bdf9992b2e1f6b970ec5db50595bfc363
commit: 970a0d3be13f4c873d5912b3b62cfabd6fa12215 [11/21] btrfs: locking extents for async writeback
config: nios2-randconfig-r025-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111459.lVb8UUm5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/goldwynr/linux/commit/970a0d3be13f4c873d5912b3b62cfabd6fa12215
        git remote add goldwynr https://github.com/goldwynr/linux
        git fetch --no-tags goldwynr lock-rearrange
        git checkout 970a0d3be13f4c873d5912b3b62cfabd6fa12215
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111459.lVb8UUm5-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'btrfs_writepages_async':
>> fs/btrfs/inode.c:7808:25: error: implicit declaration of function 'find_lock_delalloc_range' [-Werror=implicit-function-declaration]
    7808 |                 found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/find_lock_delalloc_range +7808 fs/btrfs/inode.c

  7794	
  7795	static int btrfs_writepages_async(struct btrfs_inode *inode, struct writeback_control *wbc, u64 start, u64 end)
  7796	{
  7797		u64 last_start, cur_start = start;
  7798		u64 cur_end;
  7799		int ret = 0;
  7800	
  7801		lock_extent(&inode->io_tree, start, end, NULL);
  7802	
  7803		while (cur_start < end) {
  7804			bool found;
  7805			last_start = cur_start;
  7806			cur_end = end;
  7807	
> 7808			found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
  7809			/* Nothing to writeback */
  7810			if (!found) {
  7811				unlock_extent(&inode->io_tree, cur_start, cur_end, NULL);
  7812				cur_start = cur_end + 1;
  7813				continue;
  7814			}
  7815	
  7816			/* A hole with no pages, unlock part therof */
  7817			if (cur_start > last_start)
  7818				unlock_extent(&inode->io_tree, last_start, cur_start - 1, NULL);
  7819	
  7820			/* Got more than we requested for */
  7821			if (cur_end > end) {
  7822				if (try_lock_extent(&inode->io_tree, end + 1, cur_end, NULL)) {
  7823					/* Try writing the whole extent */
  7824					end = cur_end;
  7825				} else {
  7826					/*
  7827					 * Someone is holding the extent lock.
  7828					 * Unlock pages from last part of extent, and
  7829					 * write just as much writepage requested for
  7830					 */
  7831					__unlock_for_delalloc(&inode->vfs_inode, NULL, end + 1, cur_end);
  7832					cur_end = end;
  7833				}
  7834			}
  7835	
  7836			ret = cow_file_range_async(inode, wbc, cur_start, cur_end);
  7837			if (ret < 0) {
  7838				unlock_extent(&inode->io_tree, cur_start, end, NULL);
  7839				break;
  7840			}
  7841	
  7842			cur_start = cur_end + 1;
  7843		}
  7844	
  7845		return ret;
  7846	}
  7847	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
