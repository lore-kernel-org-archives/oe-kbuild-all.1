Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B91C2420
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397370; cv=none; b=D7x68f+tMfTdbfzPXF7uvZ/B7V9K6wpPrQ+DltHOAD+5PAAE68PsmBrLEYF1VB0BrY5M3eOMNR0+8FsGzu4bzJdJr+74LjmPh7Fz9vZpqSpxk5v82vrgZfZ1BXvlPbyvMRRfd0gMwjQ9vdVa0Kb9mnsRnEee4fhV8GVLUhTcNRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397370; c=relaxed/simple;
	bh=vpJTVsMsFvBSMJz5o3tCmK/PVDxxrM9AEvSgPTF3EfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFuBxgsEuoXVuY/Fc5pdd9LNikAgyvxgQbNWRj1uQ14oOMojvlKltOb2wOZZuHKRAm9WUgFy2U+tiwqa0yvip/j1TioYz190TQ6MiLTnJRf1vuL37D8fm7EjGOpH1+S4JS5x0xK2C5GRM1iWDG+SWQvsvWZOwD72Vo4DMX5CjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6Luc6Pn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6Luc6Pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728397369; x=1759933369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vpJTVsMsFvBSMJz5o3tCmK/PVDxxrM9AEvSgPTF3EfQ=;
  b=O6Luc6PnngQRQHluMk8HWh0n2qGZh1rs5snYvjPTktrGHvQyIv+L9bDu
   OMxo93lgnpSDE2Flk4UoM/zDk33DQV6410ak/8pFRH55TB/YJXg6OPezw
   W90AxmeMggyjD0WWpBWpsdTBUqsHwDbK9uC8JPFiKI1EnHMIMN6RmXkLc
   PM6C9YEuC9rNkKXpNm5asw7y46CnZF1jGnSWyp8AjDPPirKZJg5gCa3VF
   D0rPixZUQHGrTpo04PxpjDChTJW4qULvLULzar4+YSclZOnjOhPW6fMEc
   xPpXSDIjAxxUtbR8/ij8rSp+F0RGjfOT59R8kI2iKaH5/C/PkvGjHBljs
   g==;
X-CSE-ConnectionGUID: tGLrBmwtQ/GVReJerb89AQ==
X-CSE-MsgGUID: Sj77Qnd6Tj2f0nBhsKSS1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45063522"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="45063522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 07:22:49 -0700
X-CSE-ConnectionGUID: /5qG3nRUQ0uVD+qrhul+Qg==
X-CSE-MsgGUID: +wAgZUNgTjqOFzYzz5oYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="106607781"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Oct 2024 07:22:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syB6r-0007xq-0p;
	Tue, 08 Oct 2024 14:22:45 +0000
Date: Tue, 8 Oct 2024 22:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.file 3/3] fs/file.c:975:13: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202410082212.JOQcX6Qt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.file
head:   a9fcbdac8eaed571c4d8a88a4114f575106da295
commit: 0baa0e13da423236a61c9006cf8ebcdcdc5d6a6e [3/3] fs: port files to file_ref
config: x86_64-randconfig-122-20241008 (https://download.01.org/0day-ci/archive/20241008/202410082212.JOQcX6Qt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410082212.JOQcX6Qt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410082212.JOQcX6Qt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:486:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:486:17: sparse:     expected struct file **old_fds
   fs/file.c:486:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:487:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:487:17: sparse:     expected struct file **new_fds
   fs/file.c:487:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:502:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:502:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:502:17: sparse:    struct file *
   fs/file.c:537:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __ret @@
   fs/file.c:577:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:760:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:950:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:971:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
>> fs/file.c:975:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file_ref_t [usertype] *ref @@     got struct file_ref_t [noderef] __rcu * @@
   fs/file.c:978:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:1001:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:1003:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1024:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1026:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1048:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file **f @@
   fs/file.c:1048:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1052:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *[assigned] file @@
   fs/file.c:1354:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@

vim +975 fs/file.c

   964	
   965	static struct file *__get_file_rcu(struct file __rcu **f)
   966	{
   967		struct file __rcu *file;
   968		struct file __rcu *file_reloaded;
   969		struct file __rcu *file_reloaded_cmp;
   970	
   971		file = rcu_dereference_raw(*f);
   972		if (!file)
   973			return NULL;
   974	
 > 975		if (unlikely(!file_ref_get(&file->f_ref)))
   976			return ERR_PTR(-EAGAIN);
   977	
   978		file_reloaded = rcu_dereference_raw(*f);
   979	
   980		/*
   981		 * Ensure that all accesses have a dependency on the load from
   982		 * rcu_dereference_raw() above so we get correct ordering
   983		 * between reuse/allocation and the pointer check below.
   984		 */
   985		file_reloaded_cmp = file_reloaded;
   986		OPTIMIZER_HIDE_VAR(file_reloaded_cmp);
   987	
   988		/*
   989		 * file_ref_get() above provided a full memory barrier when we
   990		 * acquired a reference.
   991		 *
   992		 * This is paired with the write barrier from assigning to the
   993		 * __rcu protected file pointer so that if that pointer still
   994		 * matches the current file, we know we have successfully
   995		 * acquired a reference to the right file.
   996		 *
   997		 * If the pointers don't match the file has been reallocated by
   998		 * SLAB_TYPESAFE_BY_RCU.
   999		 */
  1000		if (file == file_reloaded_cmp)
  1001			return file_reloaded;
  1002	
  1003		fput(file);
  1004		return ERR_PTR(-EAGAIN);
  1005	}
  1006	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
