Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1530615B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682645258; x=1714181258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAfKf4nGdMZhoAdix/RtyDhAE2tXRr5oHAPh9BZeV9E=;
  b=cjTcNWa8gUeMtlwS2+bePQ9Nto5Pj4PWggx43Md7MzeHfRcKiy7Nw9ZM
   jzzf5bMj5rRX9C2RmbBtUrSDTtF6aIpuQNUuIwr2duIzr5OgN+DeTbdS3
   GZUfWBCRTieYsKXObkd1CwTw3qo87itYrSxpnL3nQoV/x8WKBb/CcaI0k
   RkVLiZdCgG/f4/nFEc3Y734o1K4Y5I542juY8r6e9Pam7SZkNJEBkJvoz
   tJc/d4GgTVYX4Ubw/137NgWuFX1ZY/coMupeGAonkIEaT2ep7I2wiRNI6
   9u6F4MRu6ib+k/sQSUDGyr0lF2tep6s5oiDLbbHDBzXnIVqSKCHfY7Mnf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345071968"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="345071968"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 18:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727358065"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="727358065"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 18:27:32 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psCtX-0000GE-1w;
	Fri, 28 Apr 2023 01:27:31 +0000
Date: Fri, 28 Apr 2023 09:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inodegc-fixes-6.4 6/8] fs/xfs/xfs_icache.c:1859:13:
 error: no member named 'cpu' in 'struct xfs_inodegc'
Message-ID: <202304280906.eIEx70UE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git inodegc-fixes-6.4
head:   e97bcb3a53526411603a2fb17dfca3b311ccd986
commit: baa0f3f3405029259068bcbdbbdc71785f105691 [6/8] xfs: check that per-cpu inodegc workers actually run on that cpu
config: arm64-randconfig-r001-20230428 (https://download.01.org/0day-ci/archive/20230428/202304280906.eIEx70UE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=baa0f3f3405029259068bcbdbbdc71785f105691
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs inodegc-fixes-6.4
        git checkout baa0f3f3405029259068bcbdbbdc71785f105691
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280906.eIEx70UE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_icache.c:1859:13: error: no member named 'cpu' in 'struct xfs_inodegc'
           ASSERT(gc->cpu == smp_processor_id());
                  ~~  ^
   fs/xfs/xfs_linux.h:215:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE__))
                   ^~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
>> fs/xfs/xfs_icache.c:1859:13: error: no member named 'cpu' in 'struct xfs_inodegc'
           ASSERT(gc->cpu == smp_processor_id());
                  ~~  ^
   fs/xfs/xfs_linux.h:215:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE__))
                   ^~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   2 errors generated.


vim +1859 fs/xfs/xfs_icache.c

  1848	
  1849	void
  1850	xfs_inodegc_worker(
  1851		struct work_struct	*work)
  1852	{
  1853		struct xfs_inodegc	*gc = container_of(to_delayed_work(work),
  1854							struct xfs_inodegc, work);
  1855		struct llist_node	*node = llist_del_all(&gc->list);
  1856		struct xfs_inode	*ip, *n;
  1857		unsigned int		nofs_flag;
  1858	
> 1859		ASSERT(gc->cpu == smp_processor_id());
  1860	
  1861		WRITE_ONCE(gc->items, 0);
  1862	
  1863		if (!node)
  1864			return;
  1865	
  1866		/*
  1867		 * We can allocate memory here while doing writeback on behalf of
  1868		 * memory reclaim.  To avoid memory allocation deadlocks set the
  1869		 * task-wide nofs context for the following operations.
  1870		 */
  1871		nofs_flag = memalloc_nofs_save();
  1872	
  1873		ip = llist_entry(node, struct xfs_inode, i_gclist);
  1874		trace_xfs_inodegc_worker(ip->i_mount, READ_ONCE(gc->shrinker_hits));
  1875	
  1876		WRITE_ONCE(gc->shrinker_hits, 0);
  1877		llist_for_each_entry_safe(ip, n, node, i_gclist) {
  1878			xfs_iflags_set(ip, XFS_INACTIVATING);
  1879			xfs_inodegc_inactivate(ip);
  1880		}
  1881	
  1882		memalloc_nofs_restore(nofs_flag);
  1883	}
  1884	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
