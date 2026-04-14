Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35C2D8376
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 17:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776186363; cv=none; b=cXPWWurG2NtQaPk5slAIF9Myty3ugbrWf02RIwbjJN5nUTWLblzRMSFxaoSIkrRxlNiA3k2WATzcLQ2hCKeMe0RydHFypWw3OoziL0my92emhuOYT85wPNGy8qr2W2EtKG6KS+anINTMDerymBn5Snj4Ls+jllwLPfrfWH37D1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776186363; c=relaxed/simple;
	bh=INQfLgiIwlEwMpZD0PxOIndhqlD8YocAUUKSIVu2HE0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tzb8sABOR4fJk5k+gWzKfJMvJEXFDhCtjotTe09ZGfNUT9nIkS/ztDY+zNCfRUqFyoYTTGT7rUBNSSPfqJJ0JXsgTAlO1gk/s1fit8GTKpKcaufNUuUc2tX3jDeDaWwAHS4d5EN4zOu1thttXh6AZKYwNnOBZbElwFQ79qgFYio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiLHO+qC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiLHO+qC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776186362; x=1807722362;
  h=date:from:to:cc:subject:message-id;
  bh=INQfLgiIwlEwMpZD0PxOIndhqlD8YocAUUKSIVu2HE0=;
  b=aiLHO+qC+437Gyg+bH2/yMMm/XV8i0NLt4yyla4qpLuV8epT8E+/UE6O
   LdmqV5r22cCnTj5fd5uVAJVU2JMcyIfACNzjP/3P0qRnhO1JoBKgT4R10
   UD8GaCZSvjeHAV9DbNbtwbGR3KcPXk2kdIGcYEr04m//Fv6BJvOv7S2IH
   jO5OhwMb7wvWRFAU075kJxWVK58D2DwvVGhCEC4H7zrqupt5PM6ewDzv+
   JPSUQq/uvFcKR4+Y48Kk0AVdNA0zTDjvXCTM7nHwYES97uCVDbkJXPTn5
   cuQOn/PFq88FtcWUApEA0QwaerrA5R00lf7kQFlC1SMdx9F+B3pXi+v3U
   w==;
X-CSE-ConnectionGUID: 6dHya5YeS/aQ49HKRNQxDQ==
X-CSE-MsgGUID: HZhyfWC2Sru9S9E+8b5jBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77224935"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77224935"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 10:06:02 -0700
X-CSE-ConnectionGUID: xiXG6qMpTjyn0IlbY4A1RQ==
X-CSE-MsgGUID: z+16fZ0RSvWczkjTNEtx2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253546906"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 10:06:00 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wChD3-000000001gT-42uK;
	Tue, 14 Apr 2026 17:05:58 +0000
Date: Wed, 15 Apr 2026 01:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 72/73]
 fs/fuse/fuse_iomap_bpf.c:293:1: sparse: sparse: symbol
 'fuse_bpf_iomap_inval_mappings' was not declared. Should it be static?
Message-ID: <202604150118.RodbHVwJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   7815cf2d85bdc74581749a4c7b2ef1a639ba07fe
commit: e452086291368868913da98b03d32bbe2b4c872f [72/73] fuse: add kfuncs for iomap bpf programs to manage the cache
config: arc-randconfig-r132-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150118.RodbHVwJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150118.RodbHVwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150118.RodbHVwJ-lkp@intel.com/

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
>> fs/fuse/fuse_iomap_bpf.c:293:1: sparse: sparse: symbol 'fuse_bpf_iomap_inval_mappings' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:318:1: sparse: sparse: symbol 'fuse_bpf_iomap_upsert_mappings' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:371:1: sparse: sparse: symbol 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:373:1: sparse: sparse: symbol 'btf_fuse_iomap_begin_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:375:1: sparse: sparse: symbol 'btf_fuse_iomap_ioend_out_id' was not declared. Should it be static?

vim +/fuse_bpf_iomap_inval_mappings +293 fs/fuse/fuse_iomap_bpf.c

   291	
   292	__bpf_kfunc int
 > 293	fuse_bpf_iomap_inval_mappings(struct fuse_inode *fi,
   294				      const struct fuse_range *read__nullable,
   295				      const struct fuse_range *write__nullable)
   296	{
   297		struct fuse_iomap_inval_mappings_out outarg = {
   298			.nodeid = fi->nodeid,
   299			.attr_ino = fi->orig_ino,
   300		};
   301		struct inode *inode = &fi->inode;
   302		struct fuse_conn *fc = get_fuse_conn(inode);
   303	
   304		if (!fc->iomap)
   305			return -EOPNOTSUPP;
   306	
   307		if (read__nullable)
   308			memcpy(&outarg.read, read__nullable, sizeof(outarg.read));
   309		if (write__nullable)
   310			memcpy(&outarg.write, write__nullable, sizeof(outarg.write));
   311	
   312		trace_fuse_iomap_inval_mappings(inode, &outarg);
   313	
   314		return fuse_iomap_inval_inode(inode, &outarg);
   315	}
   316	
   317	__bpf_kfunc int
 > 318	fuse_bpf_iomap_upsert_mappings(struct fuse_inode *fi,
   319				       const struct fuse_iomap_io *read__nullable,
   320				       const struct fuse_iomap_io *write__nullable)
   321	{
   322		struct fuse_iomap_upsert_mappings_out outarg = {
   323			.nodeid = fi->nodeid,
   324			.attr_ino = fi->orig_ino,
   325			.read.type = FUSE_IOMAP_TYPE_NOCACHE,
   326			.write.type = FUSE_IOMAP_TYPE_NOCACHE,
   327		};
   328		struct inode *inode = &fi->inode;
   329		struct fuse_conn *fc = get_fuse_conn(inode);
   330	
   331		if (!fc->iomap)
   332			return -EOPNOTSUPP;
   333	
   334		if (read__nullable)
   335			memcpy(&outarg.read, read__nullable, sizeof(outarg.read));
   336		if (write__nullable)
   337			memcpy(&outarg.write, write__nullable, sizeof(outarg.write));
   338	
   339		trace_fuse_iomap_upsert_mappings(inode, &outarg);
   340	
   341		return fuse_iomap_upsert_inode(inode, &outarg);
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
