Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34989B678
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIcu7L9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698414469; x=1729950469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AXUm2rRxSxpCogb2Dd+BYEH9vpRlKpygOK2YEO2zXKU=;
  b=SIcu7L9fDjqACe9+9PZJWp7jGjLyMpoY/FL6unyT3jVMpu/weenIoNEA
   PYYEeYWJ+uh88CIdrZhJjsodN9MfwdUh3ltTLTyqS3yt4kKe26UFgpONN
   LIYNVxgVfbk5ZDHGM9BnnEZT7LcPV5FD48kMKO6RnuOOZ/cuycdB2QDxL
   ehjduAR6hmmx6qkAo24vUDVLz7mmUaFXyGPELPTrzGBB/i6qcobJ2JXao
   gAF8doZSj5mlhvE3UAg6nfsed5pBFTuQ8UqBJsthoqSEUTe7H1NdCHcFc
   U9hqkcA9buCbeueQnngYVz93B61S5RPYHCCmhK/yel8HNvE84fA3OSS/5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="378143941"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="378143941"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 06:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="883186292"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="883186292"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Oct 2023 06:47:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwNBW-000At5-1i;
	Fri, 27 Oct 2023 13:47:34 +0000
Date: Fri, 27 Oct 2023 21:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 14728/15478] fs/file.c:947:31: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202310272130.WYttKhJa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66f1e1ea3548378ff6387b1ce0b40955d54e86aa
commit: 61d4fb0b349ec1b33119913c3b0bd109de30142c [14728/15478] file, i915: fix file reference for mmap_singleton()
config: i386-randconfig-062-20231027 (https://download.01.org/0day-ci/archive/20231027/202310272130.WYttKhJa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310272130.WYttKhJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310272130.WYttKhJa-lkp@intel.com/

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
   fs/file.c:649:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:844:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:865:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:869:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
   fs/file.c:872:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:895:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:897:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:918:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:925:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
>> fs/file.c:947:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file **f @@
   fs/file.c:947:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
>> fs/file.c:951:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *[assigned] file @@
   fs/file.c:1240:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@

vim +947 fs/file.c

   929	
   930	/**
   931	 * get_file_active - try go get a reference to a file
   932	 * @f: the file to get a reference on
   933	 *
   934	 * In contast to get_file_rcu() the pointer itself isn't part of the
   935	 * reference counting.
   936	 *
   937	 * This function should rarely have to be used and only by users who
   938	 * understand the implications of SLAB_TYPESAFE_BY_RCU. Try to avoid it.
   939	 *
   940	 * Return: Returns @f with the reference count increased or NULL.
   941	 */
   942	struct file *get_file_active(struct file **f)
   943	{
   944		struct file __rcu *file;
   945	
   946		rcu_read_lock();
 > 947		file = __get_file_rcu(f);
   948		rcu_read_unlock();
   949		if (IS_ERR(file))
   950			file = NULL;
 > 951		return file;
   952	}
   953	EXPORT_SYMBOL_GPL(get_file_active);
   954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
