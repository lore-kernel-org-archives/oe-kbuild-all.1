Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA94A0C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 05:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771132221; cv=none; b=MgDywwpyyW9mR6kIlofQVmjsCeX6piip4c5SICIhnLmu+Xfj4NwBpQsBSIFm1r2olsHxSq0FlIYHN0lD5C/KacmH+5UudKH05Bg7l2BsUk9rcLF6lVQIuApnQZfnnyE8YqU2wbFgU3j82EFOBIesH9SvH2gba9zMCp4wyQpEpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771132221; c=relaxed/simple;
	bh=qxXP+s9aAm1wsn9JQB/VS6WgqpLXOrQ5HjnzirkizfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mtrwv6VNyoQbzqoQ/Y2bQ82VCPirC2F/BFcF9HC/rR1o0M01IV/HNEgcpmn5vBqt4A7Y3D+WV2Y6Xha1wZtP0PlpF1/T8pbvurgTCgWpKfvtOfrruWm8UBm76BhREkS94s7eqxPumVP/LwBWSyao5K8Ns3oGzPIMuClmjGhcVQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhg0pTac; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhg0pTac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771132218; x=1802668218;
  h=date:from:to:cc:subject:message-id;
  bh=qxXP+s9aAm1wsn9JQB/VS6WgqpLXOrQ5HjnzirkizfM=;
  b=fhg0pTacTPMjz/dNiY3A3ZNkN8A4asrpcRbLELlytWvrqXSFsts4JXok
   KK4Cyx26MivzcVBDVDlMV0NQM0vchCHU0ZJk57z6mkGwhM8PEeLYkGXsK
   ZeUU20axFUvHnWYlsq9EgIGskLebu4kbN+Dnq3efwNy+Uo3N1VIkpY/CQ
   O52yNNE2EjvR450Z+Sn2Ob5sj1faClgwYCMKxBQ7n82aefyOkLvuNAqJ5
   DxEtsJvtCauw6oMSHzH6lt3GSXLZdF3K7zATDIDuugHTv29JLRlbInCUu
   QqY8XJzMwlPcQu5nxJCB43TN/ovtv/y3KEMRIJYsBfIH7daAWcciOPlBs
   g==;
X-CSE-ConnectionGUID: 0I7lWM3bS9Oi1bGgiCU9zQ==
X-CSE-MsgGUID: cptwI19fT/OcQkdODj73EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="76107115"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="76107115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 21:10:18 -0800
X-CSE-ConnectionGUID: GsLm+bEtRZ+tvgmTKhXjiw==
X-CSE-MsgGUID: QTYAJZFfTeuUFWxdcv85EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="250961713"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Feb 2026 21:10:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrUOb-00000000xTw-0y0J;
	Sun, 15 Feb 2026 05:10:13 +0000
Date: Sun, 15 Feb 2026 13:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 106/106]
 fs/fuse/fuse_iomap_bpf.c:347:1: sparse: sparse: symbol
 'fuse_bpf_inode_nodeid' was not declared. Should it be static?
Message-ID: <202602151344.GP5RMY8Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   cfabfd535988652f4ce050030fbbf472e820a672
commit: cfabfd535988652f4ce050030fbbf472e820a672 [106/106] fuse: make fuse_inode opaque to iomap bpf programs
config: arm64-randconfig-r122-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151344.GP5RMY8Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151344.GP5RMY8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151344.GP5RMY8Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fuse/fuse_iomap_bpf.c:176:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:176:9: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:176:9: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:215:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:215:9: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:215:9: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:293:1: sparse: sparse: symbol 'fuse_bpf_iomap_inval_mappings' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:319:1: sparse: sparse: symbol 'fuse_bpf_iomap_upsert_mappings' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:347:1: sparse: sparse: symbol 'fuse_bpf_inode_nodeid' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:355:1: sparse: sparse: symbol 'fuse_bpf_inode_orig_ino' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:391:1: sparse: sparse: symbol 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:393:1: sparse: sparse: symbol 'btf_fuse_iomap_begin_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:395:1: sparse: sparse: symbol 'btf_fuse_iomap_ioend_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:190:15: sparse:    struct fuse_iomap_bpf_ops *

vim +/fuse_bpf_inode_nodeid +347 fs/fuse/fuse_iomap_bpf.c

   141	
   142	/* Register an iomap bpf program with a fuse connection */
   143	static int fuse_iomap_bpf_reg(void *kdata, struct bpf_link *link)
   144	{
   145		struct fuse_iomap_bpf_ops *ops = kdata;
   146		struct file *fusedev_file;
   147		struct fuse_dev *fud;
   148		struct fuse_conn *fc;
   149	
   150		CLASS(fd, fusedev_fd)(ops->fuse_fd);
   151		if (fd_empty(fusedev_fd))
   152			return -EBADF;
   153	
   154		fusedev_file = fd_file(fusedev_fd);
   155		if (fusedev_file->f_op != &fuse_dev_operations)
   156			return -EBADF;
   157	
   158		fud = fuse_get_dev(fusedev_file);
   159		fc = fud->fc;
   160	
   161		if (!fc->iomap)
   162			return -EOPNOTSUPP;
   163	
   164		spin_lock(&fuse_iomap_bpf_ops_lock);
   165		if (fc->iomap_conn.bpf_ops) {
   166			spin_unlock(&fuse_iomap_bpf_ops_lock);
   167			return -EBUSY;
   168		}
   169	
   170		trace_fuse_iomap_attach_bpf(fc, ops);
   171	
   172		/*
   173		 * The initial ops user count bias is transferred to fc so that we only
   174		 * initiate wakeup events when someone tries to unregister the BPF.
   175		 */
 > 176		rcu_assign_pointer(fc->iomap_conn.bpf_ops, ops);
   177		ops->fc = fc;
   178		spin_unlock(&fuse_iomap_bpf_ops_lock);
   179	
   180		return 0;
   181	}
   182	
   183	static inline struct fuse_iomap_bpf_ops *
   184	fuse_iomap_get_bpf_ops(struct inode *inode)
   185	{
   186		struct fuse_conn *fc = get_fuse_conn(inode);
   187		struct fuse_iomap_bpf_ops *ops;
   188	
   189		rcu_read_lock();
   190		ops = rcu_dereference(fc->iomap_conn.bpf_ops);
   191		if (ops && !atomic_inc_not_zero(&ops->users))
   192			ops = NULL;
   193		rcu_read_unlock();
   194	
   195		return ops;
   196	}
   197	
   198	static inline void
   199	fuse_iomap_put_bpf_ops(struct fuse_iomap_bpf_ops *ops)
   200	{
   201		if (ops)
   202			atomic_dec_and_wake_up(&ops->users);
   203	}
   204	
   205	DEFINE_CLASS(iomap_bpf_ops, struct fuse_iomap_bpf_ops *,
   206		     fuse_iomap_put_bpf_ops(_T), fuse_iomap_get_bpf_ops(inode),
   207		     struct inode *inode);
   208	
   209	static void __fuse_iomap_detach_bpf(struct fuse_conn *fc,
   210					    struct fuse_iomap_bpf_ops *ops)
   211	{
   212		trace_fuse_iomap_detach_bpf(fc, ops);
   213	
   214		ops->fc = NULL;
   215		rcu_assign_pointer(fc->iomap_conn.bpf_ops, NULL);
   216		fuse_iomap_put_bpf_ops(ops);
   217	}
   218	
   219	/* Detach any iomap bpf programs from the fuse connection */
   220	void fuse_iomap_unmount_bpf(struct fuse_conn *fc)
   221	{
   222		spin_lock(&fuse_iomap_bpf_ops_lock);
   223		if (fc->iomap_conn.bpf_ops) {
   224			/*
   225			 * This should only be called from unmount, so there won't be
   226			 * anybody trying to call the BPF iomap functions.
   227			 */
   228			ASSERT(atomic_read(&fc->iomap_conn.bpf_ops->users) == 1);
   229	
   230			__fuse_iomap_detach_bpf(fc, fc->iomap_conn.bpf_ops);
   231		}
   232		spin_unlock(&fuse_iomap_bpf_ops_lock);
   233	}
   234	
   235	/* Detach the fuse connection from this iomap bpf program */
   236	static void fuse_iomap_bpf_unreg(void *kdata, struct bpf_link *link)
   237	{
   238		struct fuse_iomap_bpf_ops *ops = kdata;
   239	
   240		spin_lock(&fuse_iomap_bpf_ops_lock);
   241		if (ops->fc && ops->fc->iomap_conn.bpf_ops == ops)
   242			__fuse_iomap_detach_bpf(ops->fc, ops);
   243		spin_unlock(&fuse_iomap_bpf_ops_lock);
   244	
   245		/* wait until nobody's trying to call into the bpf iomap program */
   246		wait_var_event(&ops->users, atomic_read(&ops->users) == 0);
   247	}
   248	
   249	/* Dummy function stubs for control flow integrity hashes */
   250	static enum fuse_iomap_bpf_ret
   251	__iomap_begin(struct fuse_bpf_inode *fbi, uint64_t pos, uint64_t count,
   252		      uint32_t opflags, struct fuse_iomap_begin_out *outarg)
   253	{
   254		return FIB_FALLBACK;
   255	}
   256	
   257	static enum fuse_iomap_bpf_ret
   258	__iomap_end(struct fuse_bpf_inode *fbi, uint64_t pos, uint64_t count,
   259		    int64_t written, uint32_t opflags)
   260	{
   261		return FIB_FALLBACK;
   262	}
   263	
   264	static enum fuse_iomap_bpf_ret
   265	__iomap_ioend(struct fuse_bpf_inode *fbi, uint64_t pos, int64_t written,
   266		      uint32_t ioendflags, int error, uint32_t dev, uint64_t new_addr,
   267		      struct fuse_iomap_ioend_out *outarg)
   268	{
   269		return FIB_FALLBACK;
   270	}
   271	
   272	static struct fuse_iomap_bpf_ops __fuse_iomap_bpf_ops = {
   273		.iomap_begin	= __iomap_begin,
   274		.iomap_end	= __iomap_end,
   275		.iomap_ioend	= __iomap_ioend,
   276	};
   277	
   278	static struct bpf_struct_ops fuse_iomap_bpf_struct_ops = {
   279		.verifier_ops	= &fuse_iomap_bpf_verifier_ops,
   280		.init		= fuse_iomap_bpf_ops_init,
   281		.check_member	= fuse_iomap_bpf_ops_check_member,
   282		.init_member	= fuse_iomap_bpf_ops_init_member,
   283		.reg		= fuse_iomap_bpf_reg,
   284		.unreg		= fuse_iomap_bpf_unreg,
   285		.name		= "fuse_iomap_bpf_ops",
   286		.cfi_stubs	= &__fuse_iomap_bpf_ops,
   287		.owner		= THIS_MODULE,
   288	};
   289	
   290	__bpf_kfunc_start_defs();
   291	
   292	__bpf_kfunc int
   293	fuse_bpf_iomap_inval_mappings(struct fuse_bpf_inode *fbi,
   294				      const struct fuse_range *read__nullable,
   295				      const struct fuse_range *write__nullable)
   296	{
   297		struct fuse_inode *fi = fuse_inode_from_bpf(fbi);
   298		struct fuse_iomap_inval_mappings_out outarg = {
   299			.nodeid = fi->nodeid,
   300			.attr_ino = fi->orig_ino,
   301		};
   302		struct inode *inode = &fi->inode;
   303		struct fuse_conn *fc = get_fuse_conn(inode);
   304	
   305		if (!fc->iomap)
   306			return -EOPNOTSUPP;
   307	
   308		if (read__nullable)
   309			memcpy(&outarg.read, read__nullable, sizeof(outarg.read));
   310		if (write__nullable)
   311			memcpy(&outarg.write, write__nullable, sizeof(outarg.write));
   312	
   313		trace_fuse_iomap_inval_mappings(inode, &outarg);
   314	
   315		return fuse_iomap_inval_inode(inode, &outarg);
   316	}
   317	
   318	__bpf_kfunc int
   319	fuse_bpf_iomap_upsert_mappings(struct fuse_bpf_inode *fbi,
   320				       const struct fuse_iomap_io *read__nullable,
   321				       const struct fuse_iomap_io *write__nullable)
   322	{
   323		struct fuse_inode *fi = fuse_inode_from_bpf(fbi);
   324		struct fuse_iomap_upsert_mappings_out outarg = {
   325			.nodeid = fi->nodeid,
   326			.attr_ino = fi->orig_ino,
   327			.read.type = FUSE_IOMAP_TYPE_NOCACHE,
   328			.write.type = FUSE_IOMAP_TYPE_NOCACHE,
   329		};
   330		struct inode *inode = &fi->inode;
   331		struct fuse_conn *fc = get_fuse_conn(inode);
   332	
   333		if (!fc->iomap)
   334			return -EOPNOTSUPP;
   335	
   336		if (read__nullable)
   337			memcpy(&outarg.read, read__nullable, sizeof(outarg.read));
   338		if (write__nullable)
   339			memcpy(&outarg.write, write__nullable, sizeof(outarg.write));
   340	
   341		trace_fuse_iomap_upsert_mappings(inode, &outarg);
   342	
   343		return fuse_iomap_upsert_inode(inode, &outarg);
   344	}
   345	
   346	__bpf_kfunc uint64_t
 > 347	fuse_bpf_inode_nodeid(const struct fuse_bpf_inode *fbi)
   348	{
   349		const struct fuse_inode *fi = fuse_inode_from_bpf(fbi);
   350	
   351		return fi->nodeid;
   352	}
   353	
   354	__bpf_kfunc uint64_t
 > 355	fuse_bpf_inode_orig_ino(const struct fuse_bpf_inode *fbi)
   356	{
   357		const struct fuse_inode *fi = fuse_inode_from_bpf(fbi);
   358	
   359		return fi->orig_ino;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
