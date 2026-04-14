Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477E3B38B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182517; cv=none; b=DSKTsTt17VcwObSEMsLbeF5x7A0jpihlXtNCVnCqUjkws+iREOMaPbWhFk0w+svEbVKEH8QUdAphC47XQqNBHmz3OLKSStSreZ9/ji+oCbBGvsQKE3OhfFJ+hkGxx8Ik3f/5TDpzCearXTuB6UOePdzAU9WZv+bpOGXYQEmAVj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182517; c=relaxed/simple;
	bh=tIbFQB2gfbzijwyQR4ng/2Meha5YbocpbSc3C7qlfw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SfCTUCiXeVwSvH2Omll/feLvj8J6sCJmkSt9n2kEYtS4MaOX1qW1fdJ4sD4jC5Jot+mejSOEvS3juxzCm0ldr6/jAsev5lQygvQsJ9EoBQAiciebmha4glsLwTNg7C/MWf+riSpI6XwWCnJgrjO93t/2iplq71P8uouXf2cJPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBaLt67W; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBaLt67W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776182517; x=1807718517;
  h=date:from:to:cc:subject:message-id;
  bh=tIbFQB2gfbzijwyQR4ng/2Meha5YbocpbSc3C7qlfw4=;
  b=aBaLt67WkVBb5l9FhQl1pL8eqvMExPDnx8zqtcgMuW/jzTgsmzmOl9PZ
   U80FxB5kQ6mTkQPnhsjpJSyi2QylfIHXTIrHP2hw8KyKrfuze3uqmlLs6
   V4yG4/9A3LaiuvR/wRR5oeI3PLruMQPK5rdLdEl/y3tbDwYKrxT16J6JG
   KCcT1FJNUyS8Piedr/g9ZdoSSop1kNliFyozHMeErM4cuYYKQAR4y+CF7
   d9sdmjF/hv6OFGjIiSchFiceDsPaY7LzAk9yQZ75bGsDwJChvbfVS+cIm
   ZV1UYB0KMzP8J0WoTid2ifusaPSYXYyxovCDt4CJGMad+9Bi82/SnyXVF
   g==;
X-CSE-ConnectionGUID: SsItPTmaR92uJJAKHVMhaA==
X-CSE-MsgGUID: GdmW+G9aTeqMbME7NcIGUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77327090"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77327090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:01:54 -0700
X-CSE-ConnectionGUID: 8oUSltl5RVqbeIdbdFPxjQ==
X-CSE-MsgGUID: J6DnW76JSiGCgumFwhAhow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230062865"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Apr 2026 09:01:52 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCgCz-000000001cL-2XW8;
	Tue, 14 Apr 2026 16:01:49 +0000
Date: Wed, 15 Apr 2026 00:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 69/73]
 fs/fuse/fuse_iomap_bpf.c:172:17: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202604142300.uqsoXxnN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   7815cf2d85bdc74581749a4c7b2ef1a639ba07fe
commit: fba5fe201b29323807ba169bd629de599ded4c44 [69/73] fuse: enable fuse servers to upload BPF programs to handle iomap requests
config: arc-randconfig-r132-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142300.uqsoXxnN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142300.uqsoXxnN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142300.uqsoXxnN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/fuse_iomap_bpf.c:172:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t const [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
   fs/fuse/fuse_iomap_bpf.c:172:17: sparse:     expected struct atomic_t const [usertype] *v
   fs/fuse/fuse_iomap_bpf.c:172:17: sparse:     got struct atomic_t [noderef] __rcu *
>> fs/fuse/fuse_iomap_bpf.c:174:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct fuse_iomap_bpf_ops *ops @@     got struct fuse_iomap_bpf_ops [noderef] __rcu *bpf_ops @@
   fs/fuse/fuse_iomap_bpf.c:174:59: sparse:     expected struct fuse_iomap_bpf_ops *ops
   fs/fuse/fuse_iomap_bpf.c:174:59: sparse:     got struct fuse_iomap_bpf_ops [noderef] __rcu *bpf_ops
>> fs/fuse/fuse_iomap_bpf.c:185:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:185:52: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:185:52: sparse:    struct fuse_iomap_bpf_ops *
>> fs/fuse/fuse_iomap_bpf.c:242:1: sparse: sparse: symbol 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:244:1: sparse: sparse: symbol 'btf_fuse_iomap_begin_out_id' was not declared. Should it be static?
>> fs/fuse/fuse_iomap_bpf.c:246:1: sparse: sparse: symbol 'btf_fuse_iomap_ioend_out_id' was not declared. Should it be static?

vim +172 fs/fuse/fuse_iomap_bpf.c

   162	
   163	/* Detach any iomap bpf programs from the fuse connection */
   164	void fuse_iomap_unmount_bpf(struct fuse_conn *fc)
   165	{
   166		spin_lock(&fuse_iomap_bpf_ops_lock);
   167		if (fc->iomap_conn.bpf_ops) {
   168			/*
   169			 * This should only be called from unmount, so there won't be
   170			 * anybody trying to call the BPF iomap functions.
   171			 */
 > 172			ASSERT(atomic_read(&fc->iomap_conn.bpf_ops->users) == 1);
   173	
 > 174			__fuse_iomap_detach_bpf(fc, fc->iomap_conn.bpf_ops);
   175		}
   176		spin_unlock(&fuse_iomap_bpf_ops_lock);
   177	}
   178	
   179	/* Detach the fuse connection from this iomap bpf program */
   180	static void fuse_iomap_bpf_unreg(void *kdata, struct bpf_link *link)
   181	{
   182		struct fuse_iomap_bpf_ops *ops = kdata;
   183	
   184		spin_lock(&fuse_iomap_bpf_ops_lock);
 > 185		if (ops->fc && ops->fc->iomap_conn.bpf_ops == ops)
   186			__fuse_iomap_detach_bpf(ops->fc, ops);
   187		spin_unlock(&fuse_iomap_bpf_ops_lock);
   188	
   189		/* wait until nobody's trying to call into the bpf iomap program */
   190		wait_var_event(&ops->users, atomic_read(&ops->users) == 0);
   191	}
   192	
   193	/* Dummy function stubs for control flow integrity hashes */
   194	static enum fuse_iomap_bpf_ret
   195	__iomap_begin(struct fuse_inode *fi, uint64_t pos, uint64_t count,
   196		      uint32_t opflags, struct fuse_iomap_begin_out *outarg)
   197	{
   198		return FIB_FALLBACK;
   199	}
   200	
   201	static enum fuse_iomap_bpf_ret
   202	__iomap_end(struct fuse_inode *fi, uint64_t pos, uint64_t count,
   203		    int64_t written, uint32_t opflags)
   204	{
   205		return FIB_FALLBACK;
   206	}
   207	
   208	static enum fuse_iomap_bpf_ret
   209	__iomap_ioend(struct fuse_inode *fi, uint64_t pos, int64_t written,
   210		      uint32_t ioendflags, int error, uint32_t dev, uint64_t new_addr,
   211		      struct fuse_iomap_ioend_out *outarg)
   212	{
   213		return FIB_FALLBACK;
   214	}
   215	
   216	static struct fuse_iomap_bpf_ops __fuse_iomap_bpf_ops = {
   217		.iomap_begin	= __iomap_begin,
   218		.iomap_end	= __iomap_end,
   219		.iomap_ioend	= __iomap_ioend,
   220	};
   221	
   222	static struct bpf_struct_ops fuse_iomap_bpf_struct_ops = {
   223		.verifier_ops	= &fuse_iomap_bpf_verifier_ops,
   224		.init		= fuse_iomap_bpf_ops_init,
   225		.check_member	= fuse_iomap_bpf_ops_check_member,
   226		.init_member	= fuse_iomap_bpf_ops_init_member,
   227		.reg		= fuse_iomap_bpf_reg,
   228		.unreg		= fuse_iomap_bpf_unreg,
   229		.name		= "fuse_iomap_bpf_ops",
   230		.cfi_stubs	= &__fuse_iomap_bpf_ops,
   231		.owner		= THIS_MODULE,
   232	};
   233	
   234	/* Register the iomap bpf ops so that fuse servers can attach to it */
   235	int __init fuse_iomap_init_bpf(void)
   236	{
   237		return register_bpf_struct_ops(&fuse_iomap_bpf_struct_ops,
   238					       fuse_iomap_bpf_ops);
   239	}
   240	
   241	/* Register key structures with BTF so that BPF programs can use structs */
 > 242	BTF_ID_LIST_GLOBAL_SINGLE(btf_fuse_iomap_bpf_ops_id,
   243				  struct, fuse_iomap_bpf_ops)
 > 244	BTF_ID_LIST_GLOBAL_SINGLE(btf_fuse_iomap_begin_out_id,
   245				  struct, fuse_iomap_begin_out)
 > 246	BTF_ID_LIST_GLOBAL_SINGLE(btf_fuse_iomap_ioend_out_id,
   247				  struct, fuse_iomap_ioend_out)
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
