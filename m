Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0901921376
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 23:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TF9xT/Lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698969507; x=1730505507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaPQHODUHGcci0o7r+2ZsTbOs2yXENMLU9iKYH6OlFs=;
  b=TF9xT/LvBA5lhmiEYIxPZuIIIva0/rucJZGjDg/LsYGRk5YzQD6SGGef
   MXieGfSj1/Wyk0uV+cls+9scjaZTmPOT/ar6XLdoEoxM9gkU8rFyqyZek
   pFfggcLLQa5D5skz+4/VsIZ74mf5h8LSYmBFMrMk7q2fk/i8PlQeleDzb
   qyDzwgwyhNK/aMrFLgFZs0pM4C768z/zZNosXfzGlQTf+3LlO46H9/5BH
   kDpDQ8JiWaAv30kGinnRDcs16eg2zu4tYYZNjmCkw/nw4R05k8q6/3ow7
   1WPqpBDq3F6yZ9dy96bjjB28cDyy0YKVXVlQD5vHIG2EI7Nt4aD7sdeUU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379241180"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="379241180"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 16:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="827318200"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="827318200"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Nov 2023 16:58:25 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyhZv-00021w-1O;
	Thu, 02 Nov 2023 23:58:23 +0000
Date: Fri, 3 Nov 2023 07:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/file.c:866:13: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202311030740.46qJJF34-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: 0ede61d8589cc2d93aa78230d74ac58b5b8d0244 file: convert to SLAB_TYPESAFE_BY_RCU
date:   2 weeks ago
config: i386-randconfig-061-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030740.46qJJF34-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030740.46qJJF34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030740.46qJJF34-lkp@intel.com/

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
>> fs/file.c:866:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __rcu * @@
   fs/file.c:869:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:892:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:894:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:915:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:922:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1212:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@

vim +866 fs/file.c

   855	
   856	static struct file *__get_file_rcu(struct file __rcu **f)
   857	{
   858		struct file __rcu *file;
   859		struct file __rcu *file_reloaded;
   860		struct file __rcu *file_reloaded_cmp;
   861	
   862		file = rcu_dereference_raw(*f);
   863		if (!file)
   864			return NULL;
   865	
 > 866		if (unlikely(!atomic_long_inc_not_zero(&file->f_count)))
   867			return ERR_PTR(-EAGAIN);
   868	
   869		file_reloaded = rcu_dereference_raw(*f);
   870	
   871		/*
   872		 * Ensure that all accesses have a dependency on the load from
   873		 * rcu_dereference_raw() above so we get correct ordering
   874		 * between reuse/allocation and the pointer check below.
   875		 */
   876		file_reloaded_cmp = file_reloaded;
   877		OPTIMIZER_HIDE_VAR(file_reloaded_cmp);
   878	
   879		/*
   880		 * atomic_long_inc_not_zero() above provided a full memory
   881		 * barrier when we acquired a reference.
   882		 *
   883		 * This is paired with the write barrier from assigning to the
   884		 * __rcu protected file pointer so that if that pointer still
   885		 * matches the current file, we know we have successfully
   886		 * acquired a reference to the right file.
   887		 *
   888		 * If the pointers don't match the file has been reallocated by
   889		 * SLAB_TYPESAFE_BY_RCU.
   890		 */
   891		if (file == file_reloaded_cmp)
   892			return file_reloaded;
   893	
   894		fput(file);
   895		return ERR_PTR(-EAGAIN);
   896	}
   897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
