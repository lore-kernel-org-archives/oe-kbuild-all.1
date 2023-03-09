Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857829A9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 08:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678349957; x=1709885957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MRCi/wSLBaiTcwzOmYpAAxPxJLdT5Qh3sSdaOqro1+w=;
  b=PJM5ugH7DwekboN7Jgpy1doDdg5PL66eNhh3/633+T8Ne77XKELXUPwK
   WnrhGwIMKHkhfuqtVokFzvmR6q5xqOLBr0tRqaqiupWPizYF2v6Sf7wTs
   bhGvlSiJUSnuOdoFlelmYKtrXtUaeSDl+7muHle/Ie3uxwXKA7S0Eny6F
   tlyaqiuDp9C1G0t5zDC59UhfDANJ6aTPatZi+ijjNmEZQO0/tjnYNBbIz
   qWE2PcE85Ysd1iIts9vu1dO2T8knpLdSHqEnZR3FN5nff3e2mn42luK8J
   IJhwGvv0JEAuA64fyTE80izCV0Tc9easzBy9rZOLnnxH+7Qu4xxNc4agj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324707084"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="324707084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 00:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627267780"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="627267780"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2023 00:19:16 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paBUZ-0002mv-1b;
	Thu, 09 Mar 2023 08:19:15 +0000
Date: Thu, 9 Mar 2023 16:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:lock-rearrange 11/21] fs/btrfs/inode.c:7803:25: error:
 implicit declaration of function 'find_lock_delalloc_range'
Message-ID: <202303091658.NpCTBp8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux lock-rearrange
head:   11ad35ece43be2868f38d830941cd55abc43449d
commit: 68a6d531bf22dfa0e8f9ca79d7a9da2fa1db8185 [11/21] btrfs: locking extents for async writeback
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230309/202303091658.NpCTBp8Y-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/goldwynr/linux/commit/68a6d531bf22dfa0e8f9ca79d7a9da2fa1db8185
        git remote add goldwynr https://github.com/goldwynr/linux
        git fetch --no-tags goldwynr lock-rearrange
        git checkout 68a6d531bf22dfa0e8f9ca79d7a9da2fa1db8185
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091658.NpCTBp8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'btrfs_writepages_async':
>> fs/btrfs/inode.c:7803:25: error: implicit declaration of function 'find_lock_delalloc_range' [-Werror=implicit-function-declaration]
    7803 |                 found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/find_lock_delalloc_range +7803 fs/btrfs/inode.c

  7789	
  7790	static int btrfs_writepages_async(struct btrfs_inode *inode, struct writeback_control *wbc, u64 start, u64 end)
  7791	{
  7792		u64 last_start, cur_start = start;
  7793		u64 cur_end;
  7794		int ret = 0;
  7795	
  7796		lock_extent(&inode->io_tree, start, end, NULL);
  7797	
  7798		while (cur_start < end) {
  7799			bool found;
  7800			last_start = cur_start;
  7801			cur_end = end;
  7802	
> 7803			found = find_lock_delalloc_range(&inode->vfs_inode, NULL, &cur_start, &cur_end);
  7804			/* Nothing to writeback */
  7805			if (!found) {
  7806				unlock_extent(&inode->io_tree, cur_start, cur_end, NULL);
  7807				cur_start = cur_end + 1;
  7808				continue;
  7809			}
  7810	
  7811			/* A hole with no pages, unlock part therof */
  7812			if (cur_start > last_start)
  7813				unlock_extent(&inode->io_tree, last_start, cur_start - 1, NULL);
  7814	
  7815			/* Got more than we requested for */
  7816			if (cur_end > end) {
  7817				if (try_lock_extent(&inode->io_tree, end + 1, cur_end, NULL)) {
  7818					/* Try writing the whole extent */
  7819					end = cur_end;
  7820				} else {
  7821					/*
  7822					 * Someone is holding the extent lock.
  7823					 * Unlock pages from last part of extent, and
  7824					 * write just as much writepage requested for
  7825					 */
  7826					__unlock_for_delalloc(&inode->vfs_inode, NULL, end + 1, cur_end);
  7827					cur_end = end;
  7828				}
  7829			}
  7830	
  7831			ret = cow_file_range_async(inode, wbc, cur_start, cur_end);
  7832			if (ret < 0) {
  7833				unlock_extent(&inode->io_tree, cur_start, end, NULL);
  7834				break;
  7835			}
  7836	
  7837			cur_start = cur_end + 1;
  7838		}
  7839	
  7840		return ret;
  7841	}
  7842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
