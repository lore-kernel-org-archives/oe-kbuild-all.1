Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1F807
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678348036; x=1709884036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ejfuq4p10REPkyjwp3nJWlY211upcBI69n5Zp39mejE=;
  b=bfRqA0ZiXtMNc1maTDW+Od1ruhdvu6gTMzKUtkQJZrEOkbzmEgBW1hSq
   HIl7J9QOdAO0AKnPAuntIFo9/RZr4/v1MR0obCXOxKJgRO2F1C6bvxhZr
   b8Zwspc30pvv6qxWMxQfmiXBKnGJKZvg0EXWYpwsvk1bivXdvAlFp6PrG
   8iCj3KBZtlbE2UNl0mPqgIwN2FlsLRFlymZZxT/ZYGHMyXKSIUkD3N8BA
   Ehk09aFGCEhryMGPkRKeBLSOTEwNkA1hm+bDeULFcDIYuqqC4CwT5cYH1
   OiNjV9+wA4cGZReHJASoOry9Qr9/FkIidmR+beSwm94SsMkMba8UKCGw0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398958830"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="398958830"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="677278758"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="677278758"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Mar 2023 23:47:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paAzZ-0002kj-3A;
	Thu, 09 Mar 2023 07:47:13 +0000
Date: Thu, 9 Mar 2023 15:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Burkov <boris@bur.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] btrfs: fix dio continue after short write due to
 buffer page fault
Message-ID: <202303091501.3JopRswb-lkp@intel.com>
References: <6733f2fac24b674d9f60dc1093de30513c099629.1678212067.git.boris@bur.io>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6733f2fac24b674d9f60dc1093de30513c099629.1678212067.git.boris@bur.io>

Hi Boris,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Burkov/btrfs-fix-dio-continue-after-short-write-due-to-buffer-page-fault/20230308-044956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/6733f2fac24b674d9f60dc1093de30513c099629.1678212067.git.boris%40bur.io
patch subject: [PATCH v3] btrfs: fix dio continue after short write due to buffer page fault
config: arc-randconfig-r043-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091501.3JopRswb-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/938364315c6a1c0055382359a2d94d4d069a273c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Boris-Burkov/btrfs-fix-dio-continue-after-short-write-due-to-buffer-page-fault/20230308-044956
        git checkout 938364315c6a1c0055382359a2d94d4d069a273c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091501.3JopRswb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'btrfs_create_dio_extent':
>> fs/btrfs/inode.c:7001:19: error: implicit declaration of function 'btrfs_alloc_ordered_extent'; did you mean 'btrfs_split_ordered_extent'? [-Werror=implicit-function-declaration]
    7001 |         ordered = btrfs_alloc_ordered_extent(inode, start, len, len,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   btrfs_split_ordered_extent
>> fs/btrfs/inode.c:7001:17: warning: assignment to 'struct btrfs_ordered_extent *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    7001 |         ordered = btrfs_alloc_ordered_extent(inode, start, len, len,
         |                 ^
   cc1: some warnings being treated as errors


vim +7001 fs/btrfs/inode.c

  6978	
  6979	static struct extent_map *btrfs_create_dio_extent(struct btrfs_inode *inode,
  6980							  struct btrfs_dio_data *dio_data,
  6981							  const u64 start,
  6982							  const u64 len,
  6983							  const u64 orig_start,
  6984							  const u64 block_start,
  6985							  const u64 block_len,
  6986							  const u64 orig_block_len,
  6987							  const u64 ram_bytes,
  6988							  const int type)
  6989	{
  6990		struct extent_map *em = NULL;
  6991		struct btrfs_ordered_extent *ordered;
  6992	
  6993		if (type != BTRFS_ORDERED_NOCOW) {
  6994			em = create_io_em(inode, start, len, orig_start, block_start,
  6995					  block_len, orig_block_len, ram_bytes,
  6996					  BTRFS_COMPRESS_NONE, /* compress_type */
  6997					  type);
  6998			if (IS_ERR(em))
  6999				goto out;
  7000		}
> 7001		ordered = btrfs_alloc_ordered_extent(inode, start, len, len,
  7002						     block_start, block_len, 0,
  7003						     (1 << type) |
  7004						     (1 << BTRFS_ORDERED_DIRECT),
  7005						     BTRFS_COMPRESS_NONE);
  7006		if (IS_ERR(ordered)) {
  7007			if (em) {
  7008				free_extent_map(em);
  7009				btrfs_drop_extent_map_range(inode, start,
  7010							    start + len - 1, false);
  7011			}
  7012			em = ERR_PTR(PTR_ERR(ordered));
  7013		} else {
  7014			ASSERT(!dio_data->ordered);
  7015			dio_data->ordered = ordered;
  7016		}
  7017	 out:
  7018	
  7019		return em;
  7020	}
  7021	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
