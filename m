Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A992E19C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 02:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690512571; x=1722048571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zYb981OOslswRMPi7Vvc/hn9TFn+cMpSCsLigw7iOD4=;
  b=g2QJ13eOuxaeFFZ5GJH+cQjopUq0R1BIPnNprv4L5g3T9eqzi0dMvVnX
   1bqq2BaNrHedurxLmC9qH7rSLC41qv070BFDd0EE4YcEEzZ/umJEk5M9/
   tZok6gimaty0KUM24h/LN+YTgyrP2r8ZvBDNVn3RmW2pJfOo1N3GlQtts
   DBRHiX5QP/MgkTMAYyk7U7ax9WdCrqqlqfTicTb3SF13rz7HABGAJdkqV
   utqR2reTsIxqPEWQkNINNmn5C3O1wVkdWLush6tISb4UDUx12xH6UcTkG
   w7SrvV0Mqwus9YMlj3pBNsmp5BXpeLf5p5OjkWyhu5irrXJKIBOfdpSVu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368505731"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="368505731"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 19:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727294556"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="727294556"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 27 Jul 2023 19:49:29 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPDX8-0002oD-0V;
	Fri, 28 Jul 2023 02:48:58 +0000
Date: Fri, 28 Jul 2023 10:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 260/494]
 fs/xfs/scrub/dirtree_repair.c:333:6: warning: variable 'error' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202307281011.oTyGV0Sf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   b2b95cc3133e2d4395ceef4f5cdbceddfc10d197
commit: 0d65ddd15d78c4b26fdafd532f357912a7fb32cf [260/494] xfs: fix corruptions in the directory tree
config: hexagon-randconfig-r011-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281011.oTyGV0Sf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281011.oTyGV0Sf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281011.oTyGV0Sf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/dirtree_repair.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/xfs/scrub/dirtree_repair.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/xfs/scrub/dirtree_repair.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:31:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/xfs/scrub/dirtree_repair.c:333:6: warning: variable 'error' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     333 |         if (!d_is_dir(child_dentry)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/dirtree_repair.c:346:9: note: uninitialized use occurs here
     346 |         return error;
         |                ^~~~~
   fs/xfs/scrub/dirtree_repair.c:333:2: note: remove the 'if' if its condition is always true
     333 |         if (!d_is_dir(child_dentry)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/dirtree_repair.c:302:13: note: initialize the variable 'error' to silence this warning
     302 |         int                     error;
         |                                      ^
         |                                       = 0
   7 warnings generated.


vim +333 fs/xfs/scrub/dirtree_repair.c

   292	
   293	/* Delete the VFS dentry for a removed child. */
   294	STATIC int
   295	xrep_dirtree_purge_dentry(
   296		struct xchk_dirtree	*dl,
   297		struct xfs_inode	*dp,
   298		const struct xfs_name	*name)
   299	{
   300		struct qstr		qname = QSTR_INIT(name->name, name->len);
   301		struct dentry		*parent_dentry, *child_dentry;
   302		int			error;
   303	
   304		/*
   305		 * Find the dentry for the parent directory.  If there isn't one, we're
   306		 * done.  Caller already holds i_rwsem for parent and child.
   307		 */
   308		parent_dentry = d_find_alias(VFS_I(dp));
   309		if (!parent_dentry)
   310			return 0;
   311	
   312		/* The VFS thinks the parent is a directory, right? */
   313		if (!d_is_dir(parent_dentry)) {
   314			ASSERT(d_is_dir(parent_dentry));
   315			error = -EFSCORRUPTED;
   316			goto out_dput_parent;
   317		}
   318	
   319		/*
   320		 * Try to find the dirent pointing to the child.  If there isn't one,
   321		 * we're done.
   322		 */
   323		qname.hash = full_name_hash(parent_dentry, name->name, name->len);
   324		child_dentry = d_lookup(parent_dentry, &qname);
   325		if (!child_dentry) {
   326			error = 0;
   327			goto out_dput_parent;
   328		}
   329	
   330		trace_xrep_dirtree_delete_child(dp->i_mount, child_dentry);
   331	
   332		/* Child is not a directory?  We're screwed. */
 > 333		if (!d_is_dir(child_dentry)) {
   334			ASSERT(d_is_dir(child_dentry));
   335			error = -EFSCORRUPTED;
   336			goto out_dput_child;
   337		}
   338	
   339		/* Replace the child dentry with a negative one. */
   340		d_delete(child_dentry);
   341	
   342	out_dput_child:
   343		dput(child_dentry);
   344	out_dput_parent:
   345		dput(parent_dentry);
   346		return error;
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
