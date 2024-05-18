Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5081DA32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716063413; cv=none; b=fgaPvgICkBQkRpnd4dOc4d2opQzLfVizzo3eniznAhyjLpvrne9FVjeMRSWi8QI8oZSYc04rG3FGgVjod5GEDhxA0/2vDS5WQPFndzsUD6oC3MWX0Q76LFzdZ/vBNBciD05gsBxCnvQJgeB5GvKJ8+Dos5Eg5zk4ApxNRpa/Xtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716063413; c=relaxed/simple;
	bh=8q9ke00KGNE3fD2LBCv1zzTei2m1aN6Ium0c59sMCn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTCBXYH+cdi+B6jQQpwl4XkMUIEpI4YZ+mpN5L2ejUUhEHlphuXWVYXEPnRyLie+n5mPozEYW1yaQk1xrBxAMMvGLfoUVDSnuy/tXCcGjncX06y26MPlzrGMkyBVCBVnKeaH9aiMJyouaueU5tNFOWPZjJomul38UP5ZKpHEQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSs6PokI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSs6PokI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716063411; x=1747599411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8q9ke00KGNE3fD2LBCv1zzTei2m1aN6Ium0c59sMCn8=;
  b=kSs6PokIhMQjui8I5Kqe9R9EGIrMoCEBux+hx1QRmx7GJ80y9f1swtNO
   zX+jUPcSjBd/kodN9iEN3t3zGfhnyYmIWZbOIWC+ixIMs9OIUMYL+rhW/
   CbRbJaKifyC/9v+9amtwbYobPefZpF1ZC9PHXft3HFIsfmz5I6DJREClL
   cD8cnlD68P8XRJqHsfrCWavpTcgOWbS7mKZPZGKLS3VTs7PTpeT1mSpR6
   2NnF1b6Rcq9NLMyOfs4ghViyamaroWM1+Kt0Rc6v/ybu2Jy+xI9WkUdOe
   an9qk1rcyiHErUCTN4hEIJYDCmGfc9V0098X6PNKHT4LmCLOsiCeHtrty
   A==;
X-CSE-ConnectionGUID: Dn6Sg7gBRQSK5GVR0KfzgA==
X-CSE-MsgGUID: rJ/GPpWOTh2QV2f+NDGNpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="16057959"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="16057959"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 13:16:51 -0700
X-CSE-ConnectionGUID: 6KphiLIZTha4sYx1FcoUCg==
X-CSE-MsgGUID: QaoiE6TcS/GInMmE4QOmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32542132"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2024 13:16:50 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8QU3-0002ay-1N;
	Sat, 18 May 2024 20:16:47 +0000
Date: Sun, 19 May 2024 04:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:inode-shrink 2/4] include/linux/fs.h:732:9: error: expected
 ';', identifier or '(' before 'struct'
Message-ID: <202405190448.2qdSXJdD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git inode-shrink
head:   bef03a2e1b6b8265d0bda6eeed1bc5dfce1f1915
commit: 72a8424bf1c99226d40dda7fe7c8f3b542a53365 [2/4] fs: move i_generation into new hole created after timestamp conversion
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240519/202405190448.2qdSXJdD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190448.2qdSXJdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190448.2qdSXJdD-lkp@intel.com/

Note: the jlayton/inode-shrink HEAD bef03a2e1b6b8265d0bda6eeed1bc5dfce1f1915 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1114,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/openrisc/kernel/asm-offsets.c:28:
>> include/linux/fs.h:732:9: error: expected ';', identifier or '(' before 'struct'
     732 |         struct fsnotify_mark_connector __rcu    *i_fsnotify_marks;
         |         ^~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +732 include/linux/fs.h

3ddcd0569cd68f0 Linus Torvalds    2011-08-06  679  
3ddcd0569cd68f0 Linus Torvalds    2011-08-06  680  	/* Misc */
3ddcd0569cd68f0 Linus Torvalds    2011-08-06  681  	unsigned long		i_state;
9902af79c01a8e3 Al Viro           2016-04-15  682  	struct rw_semaphore	i_rwsem;
13e12d14e2dccc7 Linus Torvalds    2011-06-08  683  
44a7d7a878c9cbb Nicholas Piggin   2011-01-07  684  	unsigned long		dirtied_when;	/* jiffies of first dirtying */
a2f4870697a5bcf Theodore Ts'o     2015-03-17  685  	unsigned long		dirtied_time_when;
44a7d7a878c9cbb Nicholas Piggin   2011-01-07  686  
^1da177e4c3f415 Linus Torvalds    2005-04-16  687  	struct hlist_node	i_hash;
c7f5408493aeb01 Dave Chinner      2015-03-04  688  	struct list_head	i_io_list;	/* backing dev IO list */
52ebea749aaed19 Tejun Heo         2015-05-22  689  #ifdef CONFIG_CGROUP_WRITEBACK
52ebea749aaed19 Tejun Heo         2015-05-22  690  	struct bdi_writeback	*i_wb;		/* the associated cgroup wb */
2a81490811d0296 Tejun Heo         2015-05-28  691  
2a81490811d0296 Tejun Heo         2015-05-28  692  	/* foreign inode detection, see wbc_detach_inode() */
2a81490811d0296 Tejun Heo         2015-05-28  693  	int			i_wb_frn_winner;
2a81490811d0296 Tejun Heo         2015-05-28  694  	u16			i_wb_frn_avg_time;
2a81490811d0296 Tejun Heo         2015-05-28  695  	u16			i_wb_frn_history;
52ebea749aaed19 Tejun Heo         2015-05-22  696  #endif
7ccf19a8042e343 Nicholas Piggin   2010-10-21  697  	struct list_head	i_lru;		/* inode LRU list */
^1da177e4c3f415 Linus Torvalds    2005-04-16  698  	struct list_head	i_sb_list;
6c60d2b5746cf23 Dave Chinner      2016-07-26  699  	struct list_head	i_wb_list;	/* backing dev writeback list */
fa0d7e3de6d6fc5 Nicholas Piggin   2011-01-07  700  	union {
b3d9b7a3c752dc4 Al Viro           2012-06-09  701  		struct hlist_head	i_dentry;
fa0d7e3de6d6fc5 Nicholas Piggin   2011-01-07  702  		struct rcu_head		i_rcu;
fa0d7e3de6d6fc5 Nicholas Piggin   2011-01-07  703  	};
f02a9ad1f15daf4 Jeff Layton       2017-12-21  704  	atomic64_t		i_version;
8019ad13ef7f64b Peter Zijlstra    2020-03-04  705  	atomic64_t		i_sequence; /* see futex */
2f9d3df8aa1cc3c Linus Torvalds    2012-06-03  706  	atomic_t		i_count;
bd5fe6c5eb9c548 Christoph Hellwig 2011-06-24  707  	atomic_t		i_dio_count;
6cdbb0effc2f511 Theodore Ts'o     2011-10-29  708  	atomic_t		i_writecount;
387e3746d01c344 Amir Goldstein    2019-06-07  709  #if defined(CONFIG_IMA) || defined(CONFIG_FILE_LOCKING)
d984ea604943bbe Mimi Zohar        2013-12-11  710  	atomic_t		i_readcount; /* struct files open RO */
d984ea604943bbe Mimi Zohar        2013-12-11  711  #endif
fdb0da89f4ba0c7 Al Viro           2019-04-10  712  	union {
99ac48f54a91d02 Arjan van de Ven  2006-03-28  713  		const struct file_operations	*i_fop;	/* former ->i_op->default_file_ops */
fdb0da89f4ba0c7 Al Viro           2019-04-10  714  		void (*free_inode)(struct inode *);
fdb0da89f4ba0c7 Al Viro           2019-04-10  715  	};
4a075e39c86490c Jeff Layton       2015-01-16  716  	struct file_lock_context	*i_flctx;
^1da177e4c3f415 Linus Torvalds    2005-04-16  717  	struct address_space	i_data;
^1da177e4c3f415 Linus Torvalds    2005-04-16  718  	struct list_head	i_devices;
4c1541680f8d189 Theodore Ts'o     2006-09-27  719  	union {
^1da177e4c3f415 Linus Torvalds    2005-04-16  720  		struct pipe_inode_info	*i_pipe;
^1da177e4c3f415 Linus Torvalds    2005-04-16  721  		struct cdev		*i_cdev;
61ba64fc0768879 Al Viro           2015-05-02  722  		char			*i_link;
84e710da2a1dfac Al Viro           2016-04-15  723  		unsigned		i_dir_seq;
577c4eb09d1034d Theodore Ts'o     2006-09-27  724  	};
^1da177e4c3f415 Linus Torvalds    2005-04-16  725  
^1da177e4c3f415 Linus Torvalds    2005-04-16  726  
3be25f49b9d6a97 Eric Paris        2009-05-21  727  #ifdef CONFIG_FSNOTIFY
72a8424bf1c9922 Jeff Layton       2023-10-04  728  	union {
3be25f49b9d6a97 Eric Paris        2009-05-21  729  		__u32			i_fsnotify_mask; /* all events this inode cares about */
72a8424bf1c9922 Jeff Layton       2023-10-04  730  		__u64			__i_fsnotify_mask_ext; /* for future expansion */
72a8424bf1c9922 Jeff Layton       2023-10-04  731  	}
08991e83b728663 Jan Kara          2017-02-01 @732  	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
0eeca28300df110 Robert Love       2005-07-12  733  #endif
0eeca28300df110 Robert Love       2005-07-12  734  

:::::: The code at line 732 was first introduced by commit
:::::: 08991e83b7286635167bab40927665a90fb00d81 fsnotify: Free fsnotify_mark_connector when there is no mark attached

:::::: TO: Jan Kara <jack@suse.cz>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
