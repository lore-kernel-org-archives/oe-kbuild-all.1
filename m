Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B5347D0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCUFz7iA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696874992; x=1728410992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zUQPgsdq9Q03zCoztXvzZL/JVdQym6JnfjBsoVrXsw=;
  b=aCUFz7iATq6UO4fws8dYCBvcCt40UElRqRaQcj0LIyc5CqXSLkXFoMr1
   WBV93sX3B4674qm+osRSEDF2+z67u/4zrAnYOrxZ22hQXprdfkownJ67U
   PLuTJPx+1wVzgSoUkZnGz898daypUoZ+kR5aUYTBhDoebCKz1s+D3ed61
   3BwCEFYtHfgu37NMwLEH6K5VOKsWiwmEssa5COGrr6/2JWl8UYC+MFLBv
   6h8e0X1lyu6Rl1XXz/odEKp4V+LdLZz3mlsk3nPyAbBLffI/E2idapvDE
   hZpN9aJ+h84ForqE4OBXAbkC+Xv86Hi5l1Ro4ynXw4/ZhMd8zXz/KdcpC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363564809"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="363564809"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 11:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703003593"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="703003593"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Oct 2023 11:09:03 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpuge-0000UQ-33;
	Mon, 09 Oct 2023 18:09:00 +0000
Date: Tue, 10 Oct 2023 02:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.misc 10/12] fs/file.c:922:24: sparse: sparse:
 incorrect type in return expression (different address spaces)
Message-ID: <202310100108.itAyBdia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.misc
head:   2c814c8fad597e079cf3e526bf9b7a2572da0091
commit: f5dc7c8f516455fc4b88a36e4bfd9c45c5823404 [10/12] file: convert to SLAB_TYPESAFE_BY_RCU
config: i386-randconfig-061-20231008 (https://download.01.org/0day-ci/archive/20231010/202310100108.itAyBdia-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100108.itAyBdia-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100108.itAyBdia-lkp@intel.com/

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
   fs/file.c:862:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:866:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
   fs/file.c:869:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:892:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:894:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:915:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
>> fs/file.c:922:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1212:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@

vim +922 fs/file.c

   897	
   898	/**
   899	 * get_file_rcu - try go get a reference to a file under rcu
   900	 * @f: the file to get a reference on
   901	 *
   902	 * This function tries to get a reference on @f carefully verifying that
   903	 * @f hasn't been reused.
   904	 *
   905	 * This function should rarely have to be used and only by users who
   906	 * understand the implications of SLAB_TYPESAFE_BY_RCU. Try to avoid it.
   907	 *
   908	 * Return: Returns @f with the reference count increased or NULL.
   909	 */
   910	struct file *get_file_rcu(struct file __rcu **f)
   911	{
   912		for (;;) {
   913			struct file __rcu *file;
   914	
   915			file = __get_file_rcu(f);
   916			if (unlikely(!file))
   917				return NULL;
   918	
   919			if (unlikely(IS_ERR(file)))
   920				continue;
   921	
 > 922			return file;
   923		}
   924	}
   925	EXPORT_SYMBOL_GPL(get_file_rcu);
   926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
