Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0315C1D61AA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744140409; cv=none; b=gmW+YZ8HhlRQQ8S6nXDwl01Nm2p+tVmIrO/NsmeyY3OgcOjNQusXTxW/ZW73D7UU+3XKdYIu3b3ryORbeRCTecIQhnNgh94Jr9WcU2Zzj0ftVdtXZAMNqDvFhW7wizlHnitNsT5ch223gsYo4/KelRlw1pfM5sNfMzG0Zm+WiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744140409; c=relaxed/simple;
	bh=seyXWtTz0wCeeQXOz99vxy6nfOolp1DKSKM25JI0MQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BSv9BzzfSbU6x3VlJpQG+2jUdA5srvRiuffK8+XeBAKOlOSxMQo4jos5ghgcm1jnIGKdQc3bIgcT7bLJMpKlJ30rHkU8V9rQxdGKA7jSFMyYKLWacQVDF2RhkGINlrS94P96d6tntu7cgan6wXKvZeehSdK4Oy37LmkA4zs65qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFvhQhHW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFvhQhHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744140408; x=1775676408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=seyXWtTz0wCeeQXOz99vxy6nfOolp1DKSKM25JI0MQI=;
  b=YFvhQhHWOUdD90At+Kv3WH4TO/rkv1h00l9R3mAs6u5z73f9BVcJ7bj7
   zFz1NHYOn5RJtWkHeaYvPQ3eW+NFSbaFgsgouHpiORV7j5mDI4JyRrMp5
   Obxz0h7Em/tjKrAkCASAuedAbnSQSV3MMkdhkq/bpy44orrRsK3IOSk6x
   gJIvEMKJ7ZqX/PwFY3v1eFo9T1UOmTPWdi3vz4L4cULCYa5TA96ORW8Q5
   jJhH7xEokgp1JWsPAB78TJr2FKbNZt3t5F2xv5LA7LPKw5C61xWeQ9Or9
   Q71HovzGeC23E1Qj2seyojsiJ9zHEPHqcWMblvrFyQJ3noQ6OIuBwc+5q
   g==;
X-CSE-ConnectionGUID: HMh+CGKSSye33kIqVsUonA==
X-CSE-MsgGUID: VWDyYBILS/WLMBezXdCybg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33198233"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="33198233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 12:26:47 -0700
X-CSE-ConnectionGUID: Jy8cF+W1RDWXVbIAbRiDXg==
X-CSE-MsgGUID: eg7BcwsEQ1+0OG1CHhryKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133229453"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Apr 2025 12:26:45 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Eap-0007ux-1V;
	Tue, 08 Apr 2025 19:26:43 +0000
Date: Wed, 9 Apr 2025 03:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1231/1936] fs/kernfs/mount.c:258:57: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202504090310.xjNpww93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
commit: 973256a7be6ed574f242995c15a8aa80cc0cc566 [1231/1936] VFS: rename lookup_one_len family to lookup_noperm and remove permission check
config: x86_64-randconfig-122-20250408 (https://download.01.org/0day-ci/archive/20250409/202504090310.xjNpww93-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090310.xjNpww93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090310.xjNpww93-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
   fs/kernfs/mount.c:258:57: sparse:     expected char const *
   fs/kernfs/mount.c:258:57: sparse:     got char const [noderef] __rcu *name
   fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
   fs/kernfs/mount.c:258:57: sparse:     expected char const *
   fs/kernfs/mount.c:258:57: sparse:     got char const [noderef] __rcu *name
>> fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *const p @@     got char const [noderef] __rcu *name @@
   fs/kernfs/mount.c:258:57: sparse:     expected char const *const p
   fs/kernfs/mount.c:258:57: sparse:     got char const [noderef] __rcu *name
   fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const *name @@     got char const [noderef] __rcu *name @@
   fs/kernfs/mount.c:258:57: sparse:     expected unsigned char const *name
   fs/kernfs/mount.c:258:57: sparse:     got char const [noderef] __rcu *name

vim +258 fs/kernfs/mount.c

   199	
   200	/**
   201	 * kernfs_node_dentry - get a dentry for the given kernfs_node
   202	 * @kn: kernfs_node for which a dentry is needed
   203	 * @sb: the kernfs super_block
   204	 *
   205	 * Return: the dentry pointer
   206	 */
   207	struct dentry *kernfs_node_dentry(struct kernfs_node *kn,
   208					  struct super_block *sb)
   209	{
   210		struct dentry *dentry;
   211		struct kernfs_node *knparent;
   212		struct kernfs_root *root;
   213	
   214		BUG_ON(sb->s_op != &kernfs_sops);
   215	
   216		dentry = dget(sb->s_root);
   217	
   218		/* Check if this is the root kernfs_node */
   219		if (!rcu_access_pointer(kn->__parent))
   220			return dentry;
   221	
   222		root = kernfs_root(kn);
   223		/*
   224		 * As long as kn is valid, its parent can not vanish. This is cgroup's
   225		 * kn so it can't have its parent replaced. Therefore it is safe to use
   226		 * the ancestor node outside of the RCU or locked section.
   227		 */
   228		if (WARN_ON_ONCE(!(root->flags & KERNFS_ROOT_INVARIANT_PARENT)))
   229			return ERR_PTR(-EINVAL);
   230		scoped_guard(rcu) {
   231			knparent = find_next_ancestor(kn, NULL);
   232		}
   233		if (WARN_ON(!knparent)) {
   234			dput(dentry);
   235			return ERR_PTR(-EINVAL);
   236		}
   237	
   238		do {
   239			struct dentry *dtmp;
   240			struct kernfs_node *kntmp;
   241			const char *name;
   242	
   243			if (kn == knparent)
   244				return dentry;
   245	
   246			scoped_guard(rwsem_read, &root->kernfs_rwsem) {
   247				kntmp = find_next_ancestor(kn, knparent);
   248				if (WARN_ON(!kntmp)) {
   249					dput(dentry);
   250					return ERR_PTR(-EINVAL);
   251				}
   252				name = kstrdup(kernfs_rcu_name(kntmp), GFP_KERNEL);
   253			}
   254			if (!name) {
   255				dput(dentry);
   256				return ERR_PTR(-ENOMEM);
   257			}
 > 258			dtmp = lookup_noperm_positive_unlocked(&QSTR(kntmp->name), dentry);
   259			dput(dentry);
   260			kfree(name);
   261			if (IS_ERR(dtmp))
   262				return dtmp;
   263			knparent = kntmp;
   264			dentry = dtmp;
   265		} while (true);
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
