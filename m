Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8131B101
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 18:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190867; cv=none; b=EkqUU5X8cucV4jB/n0u9OWpRI8X0DaDng/wGJ77V0cwmSekis5R/hU28wFzkVQuw6CQULCzrtYarxRuvSeN1+zq7utsTy8C72nBOwpU2y9q08/Cm3Fo4Gpv079AkTNlqye90LPFbTaAn54/bFgr0MCS67BQQCaC1GgMo2sOHTHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190867; c=relaxed/simple;
	bh=NmCXuJiwsdpiWleQ9UN50cwgH7In2RVFp9uYOhRoGKo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L4RnQdP5sHzKh9P4A8BAwWEnNfJZ4WkhoxxNGGOYaQX0iex1JOP1YKQCCjElGjcTBxlUr8hIbFNiaqO0TuWVm+O9oBUpp+6i37YFgAfrihyDiOQ6hVvXqyy3nCWw8MmZi8C9qkHtYCce0Eneg6ea8FsoceZK/1dJ9kOnUb2K6OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXxVyXAy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXxVyXAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776190864; x=1807726864;
  h=date:from:to:cc:subject:message-id;
  bh=NmCXuJiwsdpiWleQ9UN50cwgH7In2RVFp9uYOhRoGKo=;
  b=YXxVyXAyAAxzqy5Lm08RboYCJraKQFgf8sDWdMP981KAit/vDG+9ZO5G
   36s6/nwqVcfbIdY+jDull9taUaUyUYOyYD5EGkEXM3Tikm9fe+j/PG846
   J27d1eGGpmOOKKz89n+7Q2/Ws/jEJmn1CTvUDjOy86hCWilv03NoB6kcD
   ZawlT7tipB8Tgw2MM4UqemXhYCGlC5cvkaELbkBadMAiaqtVFoKGpGadA
   ee7xivndfxXs/bWQvqmnxAiDgeCViCkPNXjRzvf2D+2sxphf+uDC92StY
   y8jRnVUQ9E5/aMUaXKqn9nXd0+bEiFTAAqEi2EZcyIH6RylJiRZas8Tlp
   g==;
X-CSE-ConnectionGUID: ZC2AgIpTQLmCEBzvaR4gYQ==
X-CSE-MsgGUID: 8pGC3VaZS+GwnXT8z0qhSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77129724"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77129724"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:21:04 -0700
X-CSE-ConnectionGUID: QgFIUJMyQemnN6KH241VDQ==
X-CSE-MsgGUID: huIRgT0vRUycNsPH4q6W0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225455895"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 11:21:04 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCiNg-000000001kV-0ipq;
	Tue, 14 Apr 2026 18:21:00 +0000
Date: Wed, 15 Apr 2026 02:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 73/73]
 fs/fuse/fuse_iomap_bpf.c:347:1: sparse: sparse: symbol
 'fuse_bpf_inode_nodeid' was not declared. Should it be static?
Message-ID: <202604150200.22OXI5fX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   7815cf2d85bdc74581749a4c7b2ef1a639ba07fe
commit: 7815cf2d85bdc74581749a4c7b2ef1a639ba07fe [73/73] fuse: make fuse_inode opaque to iomap bpf programs
config: arc-randconfig-r132-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150200.22OXI5fX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150200.22OXI5fX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150200.22OXI5fX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fuse/fuse_iomap_bpf.c:228:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t const [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
   fs/fuse/fuse_iomap_bpf.c:228:17: sparse:     expected struct atomic_t const [usertype] *v
   fs/fuse/fuse_iomap_bpf.c:228:17: sparse:     got struct atomic_t [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:230:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fuse_iomap_bpf_ops *ops @@     got struct fuse_iomap_bpf_ops [noderef] __rcu *bpf_ops @@
   fs/fuse/fuse_iomap_bpf.c:230:59: sparse:     expected struct fuse_iomap_bpf_ops *ops
   fs/fuse/fuse_iomap_bpf.c:230:59: sparse:     got struct fuse_iomap_bpf_ops [noderef] __rcu *bpf_ops
   fs/fuse/fuse_iomap_bpf.c:241:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:241:52: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:241:52: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:293:1: sparse: sparse: symbol 'fuse_bpf_iomap_inval_mappings' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:319:1: sparse: sparse: symbol 'fuse_bpf_iomap_upsert_mappings' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:347:1: sparse: sparse: symbol 'fuse_bpf_inode_nodeid' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:355:1: sparse: sparse: symbol 'fuse_bpf_inode_orig_ino' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:391:1: sparse: sparse: symbol 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:393:1: sparse: sparse: symbol 'btf_fuse_iomap_begin_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:395:1: sparse: sparse: symbol 'btf_fuse_iomap_ioend_out_id' was not declared. Should it be static?

vim +/fuse_bpf_inode_nodeid +347 fs/fuse/fuse_iomap_bpf.c

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
 > 228			ASSERT(atomic_read(&fc->iomap_conn.bpf_ops->users) == 1);
   229	
 > 230			__fuse_iomap_detach_bpf(fc, fc->iomap_conn.bpf_ops);
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
