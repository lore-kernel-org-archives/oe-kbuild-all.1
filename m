Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1716D59B40
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YisNolyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701467652; x=1733003652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+HpXQBBhbcTJrfN7Hr/IPldSPt9k8XYmYOIz+3UCP0w=;
  b=YisNolyDvb5GHBd53IQiJgROreI69EcnmPtQSuHmRDm4urUQcnYhgrH6
   JEy/ZyXI/5/KqRXRll0zIra9kKWy1/yy4CdlMjBae0PmEQskxwwizo2Eq
   8OX0rxWzEl3gsWg9bwWGYW/H7GG4UAbhBIiHhPdSC0W1K6aDJYIPPL5bz
   JRuirg5HbUcWZliHO4VuKRaDHphmUZtj6Ya/+F/A75qXJectvbCawKyvS
   12XEgNmiBcaBgt+9GwaQi6Xk+9wQ/XY/3pAZx1gaWFDPnwtEhg9hSXqsS
   IgRnpQ1ADZkjqmIHnPLwCOA0BHn/D/pi1FdDe8zj5jLiqAcTdx/Bl0S+B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="373738014"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="373738014"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 13:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943212972"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="943212972"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 13:54:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9BSZ-0004KC-0O;
	Fri, 01 Dec 2023 21:54:07 +0000
Date: Sat, 2 Dec 2023 05:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.misc.backing_file 10/12] fs/file.c:879:21: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202312020530.3E4AUuWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc.backing_file
head:   6c9453d302c574bab05b2fd62ebe48bf7567eef5
commit: d089d9d056c048303aedd40a7f3f26593ebd040c [10/12] file: convert to SLAB_TYPESAFE_BY_RCU
config: x86_64-randconfig-122-20231008 (https://download.01.org/0day-ci/archive/20231202/202312020530.3E4AUuWV-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312020530.3E4AUuWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312020530.3E4AUuWV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:379:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:379:17: sparse:     expected struct file **old_fds
   fs/file.c:379:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:380:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:380:17: sparse:     expected struct file **new_fds
   fs/file.c:380:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:395:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:395:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:395:17: sparse:    struct file *
   fs/file.c:430:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/file.c:470:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:646:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:841:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:875:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
>> fs/file.c:879:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic64_t [usertype] *v @@     got struct atomic64_t [noderef] __rcu * @@
   fs/file.c:882:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:907:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:909:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1203:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@

vim +879 fs/file.c

   855	
   856	/**
   857	 * get_file_rcu - try go get a reference to a file under rcu
   858	 * @f: the file to get a reference on
   859	 *
   860	 * This function tries to get a reference on @f carefully verifying that
   861	 * @f hasn't been reused.
   862	 *
   863	 * This function should rarely have to be used and only by users who
   864	 * understand the implications of SLAB_TYPESAFE_BY_RCU. Try to avoid it.
   865	 *
   866	 * Return: Returns @f with the reference count increased or NULL.
   867	 */
   868	struct file *get_file_rcu(struct file __rcu **f)
   869	{
   870		for (;;) {
   871			struct file __rcu *file;
   872			struct file __rcu *file_reloaded;
   873			struct file __rcu *file_reloaded_cmp;
   874	
   875			file = rcu_dereference_raw(*f);
   876			if (!file)
   877				return NULL;
   878	
 > 879			if (unlikely(!atomic_long_inc_not_zero(&file->f_count)))
   880				continue;
   881	
   882			file_reloaded = rcu_dereference_raw(*f);
   883	
   884			/*
   885			 * Ensure that all accesses have a dependency on the
   886			 * load from rcu_dereference_raw() above so we get
   887			 * correct ordering between reuse/allocation and the
   888			 * pointer check below.
   889			 */
   890			file_reloaded_cmp = file_reloaded;
   891			OPTIMIZER_HIDE_VAR(file_reloaded_cmp);
   892	
   893			/*
   894			 * atomic_long_inc_not_zero() above provided a full
   895			 * memory barrier when we acquired a reference.
   896			 *
   897			 * This is paired with the write barrier from assigning
   898			 * to the __rcu protected file pointer so that if that
   899			 * pointer still matches the current file, we know we
   900			 * have successfully acquired a reference to the right
   901			 * file.
   902			 *
   903			 * If the pointers don't match the file has been
   904			 * reallocated by SLAB_TYPESAFE_BY_RCU.
   905			 */
   906			if (file == file_reloaded_cmp)
   907				return file_reloaded;
   908	
   909			fput(file);
   910		}
   911	}
   912	EXPORT_SYMBOL_GPL(get_file_rcu);
   913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
