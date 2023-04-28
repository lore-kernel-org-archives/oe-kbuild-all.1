Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD9F15AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 01:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682645256; x=1714181256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RgjBEritDZg+IyCvHP6Y0CiBBCHw3CHh/wd+kepTkEQ=;
  b=LCXhE/rWeoWD6N9AmseheXbFYTnj+xkJ5UwiZ/cngBymDhwVoSDOAp9g
   uzY22z1gPZFxSyPXk/k9QfwxBuG8ZCm7diPFYfarvt8j6r9I2QwITWQCm
   9Y3k9L5QWNHXMj6ft+D1En6k7b2EYM/xDYMBKCD1X+yiS6V4dCRf/SJ72
   Lv2lU2+Y/YuvOJbBWBMZtvxo1ygfYX8ZU+aGY1RJuet/5pTF/7QDRYXqc
   Q3mQH4Sf5yuzKd9fSebqRsT2QOi9ZBmMle6tbHUStgRTFwZ4oq8VuT9RA
   a3ASLhaz7QXbk3LCnAl0r3kJJyXbalPWXx/4J191GnOVv0X2sv8DW+ee8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345071964"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="345071964"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 18:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727358064"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="727358064"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 18:27:32 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psCtX-0000G9-1p;
	Fri, 28 Apr 2023 01:27:31 +0000
Date: Fri, 28 Apr 2023 09:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inodegc-fixes-6.4 6/8] fs/xfs/xfs_icache.c:1859:18:
 error: 'struct xfs_inodegc' has no member named 'cpu'
Message-ID: <202304280904.2OIxGFdD-lkp@intel.com>
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
config: s390-randconfig-r002-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280904.2OIxGFdD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=baa0f3f3405029259068bcbdbbdc71785f105691
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs inodegc-fixes-6.4
        git checkout baa0f3f3405029259068bcbdbbdc71785f105691
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280904.2OIxGFdD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:5,
                    from include/linux/uuid.h:11,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_icache.c:6:
   fs/xfs/xfs_icache.c: In function 'xfs_inodegc_worker':
>> fs/xfs/xfs_icache.c:1859:18: error: 'struct xfs_inodegc' has no member named 'cpu'
    1859 |         ASSERT(gc->cpu == smp_processor_id());
         |                  ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   fs/xfs/xfs_icache.c:1859:9: note: in expansion of macro 'ASSERT'
    1859 |         ASSERT(gc->cpu == smp_processor_id());
         |         ^~~~~~


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
