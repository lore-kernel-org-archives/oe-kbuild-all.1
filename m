Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CC10E5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103770; cv=none; b=WoWIAiwoP7/JFPyPet+BIEd/7oneFQl2Mcpx9SWxa8tuJiyckusjI+k04fGF+oYafSAiEneSKA0vLUHM9qrKCwX07Car4bcfagewRDFY94lN9yW+E4+krzod3osAI1E+xQAIodvHnkJBDbzzke4y/4c7u2x/swWB272EF9HZ2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103770; c=relaxed/simple;
	bh=jRmJ+xd3pfzsNTkyDdRFsKck3UDwIayhCeA/Lkyttfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ffqxHJxjZK0Jg0ug2cI6BreBQIULvqO1/AsEftEaSqKLcORlx5Uczk/Vt1sJUjFplVhJpwXY/UPT+8PggDLur+hZ9Hv8fFkN3W5mL7blBgz3uCcqIjRBefpguH2ydsEo04OcstzwYB1Z8HJ8oTUVYFMIdJKfmDoXSy8qZtQWMRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvYRBGhk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvYRBGhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744103769; x=1775639769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRmJ+xd3pfzsNTkyDdRFsKck3UDwIayhCeA/Lkyttfc=;
  b=jvYRBGhk/o1IwHwCh3A6FArMdGLgmytqYtG+H5GDGGcj6TUJH/B/ISGB
   2CMVKyw7J+duT2yk0KvZL4ugfpy2WPUdnscuSCsT3/8elSgxgqs/VOESW
   v5aSnD9dsXjosoQ7eHSoKXOSG4O+zmbn58g8Q2G+0y52SLnFt4z3ZS0BF
   OtXeiDC0gH98F2IdyRRgZdjD4pMCT57skjMXCS34uCn385O92uENnMHyy
   8eHqC6PbqhssSYymc8788SGp35mmb2/cEJoAGfeCro2VPWdZQBj4v3qhs
   PKKBgPKNODY1msofxl3DeCHBD0pxGeStcg3tl4/Og5ehmQ+uNsKgt6bl4
   g==;
X-CSE-ConnectionGUID: a3MkgdOdQcWUlbfdrYssJg==
X-CSE-MsgGUID: 8RdCjll5SuyqQhJ27bj6EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44666677"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="44666677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:16:08 -0700
X-CSE-ConnectionGUID: ddpoY6BcQkKdN0zb35NnVQ==
X-CSE-MsgGUID: t5ymSg++RUC9lpusYBMNdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128204877"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Apr 2025 02:16:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u253s-0004NJ-2l;
	Tue, 08 Apr 2025 09:16:04 +0000
Date: Tue, 8 Apr 2025 17:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 1231/1936] fs/kernfs/mount.c:258:57: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202504081746.zMqyeksR-lkp@intel.com>
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
config: arc-randconfig-r121-20250408 (https://download.01.org/0day-ci/archive/20250408/202504081746.zMqyeksR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250408/202504081746.zMqyeksR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081746.zMqyeksR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
   fs/kernfs/mount.c:258:57: sparse:     expected char const *
   fs/kernfs/mount.c:258:57: sparse:     got char const [noderef] __rcu *name
>> fs/kernfs/mount.c:258:57: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const *name @@     got char const [noderef] __rcu *name @@
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
