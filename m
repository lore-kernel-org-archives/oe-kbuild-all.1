Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A031FDD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 01:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728696769; cv=none; b=YgIUSmjSqGTYrsz9RVlU9XR4qthqXmvvoaYoLyILc6wsGpxMiC0E/U1l4/3sfIOvtPrbPwzRviF5j4jzigV8AQz7RnJO8+hXAd4INzwKni1k52EOHW/sNuz2bD6+fYPOjo+BhGTfaHaJS1PVXtHCd33kCiM6La2fVmdemAvLaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728696769; c=relaxed/simple;
	bh=6vEtviPJZ8D85x6E4Fy11yj63GfON+A/rXIAgBkmKhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVB5c6E72u0gknvidQK8uFz59s4zlBq6GWMDKZ5unmFn2geFDqsdxSRldGBVQwjIzCaBC7LXH+oYSad9skiQcFTTRT2V4lLumU+DNa/1KJpHrjQFmeHa6itPtCBVcVzKpcuFDeJl1zivvjmDBoAU1Wb86Mz83ZF75oWSemzc/EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzoNLjHd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzoNLjHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728696767; x=1760232767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6vEtviPJZ8D85x6E4Fy11yj63GfON+A/rXIAgBkmKhs=;
  b=mzoNLjHdxUWaUUY89J06LFXQAU/jOMD96Rix8NpN8g5EIhOUjrlLfP7v
   Br7V8DcbfiTsEtVdF6nyuqP8UxFs1aaf8YVJxYjJ70d1/uQSli61tafA4
   6OtrBa5mJVWsPxFxAik++mCZICRZzozExvcZvnd+M3vMvMD/nCDs+XJZG
   /BbaaIAdTauvtGerAbcfEv9b6aD+XWvHjXzh4i1Z2ECrVjsnrDVr/jLgB
   7B4pRyDiLPwFaJSrqNpYAqSDkJFLfFSSzv2sumv9+wingswBA4+r58ADz
   cAFGhkn17QszZD/4/mehYQj448n/y6UyGtQ6pHtWT1we7VRYYvCZMTWgx
   g==;
X-CSE-ConnectionGUID: h1VIg8wsQom43JIF3fPnBQ==
X-CSE-MsgGUID: OuOuNCeiTvqfLw2y+VhSxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32020993"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="32020993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 18:32:47 -0700
X-CSE-ConnectionGUID: HYeix3OtQMSQNGgIukBKMA==
X-CSE-MsgGUID: xwFsn1r8QJKTYATp1GgmqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="77166662"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Oct 2024 18:32:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szQzr-000Cvj-2G;
	Sat, 12 Oct 2024 01:32:43 +0000
Date: Sat, 12 Oct 2024 09:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 4034/23827] fs/file.c:368:17: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202410120916.m0AjmQWh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b2f1457c730cd7915663ac5d9ccb849f2657714
commit: 72ee1590dc860d0091f8e7714b467be5878d51ae [4034/23827] cgroups: Resource controller for open files
config: x86_64-randconfig-123-20241012 (https://download.01.org/0day-ci/archive/20241012/202410120916.m0AjmQWh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120916.m0AjmQWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120916.m0AjmQWh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:339:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] <asn:4> **fd @@
   fs/file.c:339:17: sparse:     expected struct file **old_fds
   fs/file.c:339:17: sparse:     got struct file [noderef] <asn:4> **fd
   fs/file.c:340:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] <asn:4> **fd @@
   fs/file.c:340:17: sparse:     expected struct file **new_fds
   fs/file.c:340:17: sparse:     got struct file [noderef] <asn:4> **fd
>> fs/file.c:368:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **[assigned] new_fds @@     got struct file [noderef] <asn:4> **fd @@
   fs/file.c:368:17: sparse:     expected struct file **[assigned] new_fds
   fs/file.c:368:17: sparse:     got struct file [noderef] <asn:4> **fd
   fs/file.c:409:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] <asn:4> *[assigned] __ret @@
   fs/file.c:409:54: sparse:     expected struct file *file
   fs/file.c:409:54: sparse:     got struct file [noderef] <asn:4> *[assigned] __ret
   fs/file.c:477:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] <asn:4> *fdt @@     got struct fdtable * @@
   fs/file.c:477:28: sparse:     expected struct fdtable [noderef] <asn:4> *fdt
   fs/file.c:477:28: sparse:     got struct fdtable *
   fs/file.c:666:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] <asn:4> * @@
   fs/file.c:666:14: sparse:     expected struct file *file
   fs/file.c:666:14: sparse:     got struct file [noderef] <asn:4> *
   fs/file.c:701:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] <asn:4> * @@
   fs/file.c:701:30: sparse:     expected struct file *file
   fs/file.c:701:30: sparse:     got struct file [noderef] <asn:4> *
   fs/file.c:868:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] <asn:4> * @@
   fs/file.c:868:16: sparse:     expected struct file *tofree
   fs/file.c:868:16: sparse:     got struct file [noderef] <asn:4> *
   fs/file.o: warning: objtool: alloc_fdtable()+0x2d: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: __fget()+0x2c3: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: __put_unused_fd()+0x56: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: __close_fd()+0x63: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: do_dup2()+0x62: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: iterate_fd.part.0()+0x187: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: expand_fdtable.constprop.0()+0x108: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: expand_files()+0x145: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: ksys_dup3()+0x148: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: __se_sys_dup2()+0x1da: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: dup_fd()+0x87e: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: __alloc_fd()+0x39e: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: __fd_install()+0xb1: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: do_close_on_exec()+0x9d: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: set_close_on_exec()+0x97: sibling call from callable instruction with modified stack frame
   fs/file.o: warning: objtool: get_close_on_exec()+0x141: sibling call from callable instruction with modified stack frame

vim +368 fs/file.c

   300	
   301		spin_lock(&oldf->file_lock);
   302		old_fdt = files_fdtable(oldf);
   303		open_files = count_open_files(old_fdt);
   304	
   305		/*
   306		 * Check whether we need to allocate a larger fd array and fd set.
   307		 */
   308		while (unlikely(open_files > new_fdt->max_fds)) {
   309			spin_unlock(&oldf->file_lock);
   310	
   311			if (new_fdt != &newf->fdtab)
   312				__free_fdtable(new_fdt);
   313	
   314			new_fdt = alloc_fdtable(open_files - 1);
   315			if (!new_fdt) {
   316				*errorp = -ENOMEM;
   317				goto out_release;
   318			}
   319	
   320			/* beyond sysctl_nr_open; nothing to do */
   321			if (unlikely(new_fdt->max_fds < open_files)) {
   322				__free_fdtable(new_fdt);
   323				*errorp = -EMFILE;
   324				goto out_release;
   325			}
   326	
   327			/*
   328			 * Reacquire the oldf lock and a pointer to its fd table
   329			 * who knows it may have a new bigger fd table. We need
   330			 * the latest pointer.
   331			 */
   332			spin_lock(&oldf->file_lock);
   333			old_fdt = files_fdtable(oldf);
   334			open_files = count_open_files(old_fdt);
   335		}
   336	
   337		copy_fd_bitmaps(new_fdt, old_fdt, open_files);
   338	
   339		old_fds = old_fdt->fd;
   340		new_fds = new_fdt->fd;
   341	
   342		for (i = open_files; i != 0; i--) {
   343			struct file *f = *old_fds++;
   344			if (f) {
   345				get_file(f);
   346			} else {
   347				/*
   348				 * The fd may be claimed in the fd bitmap but not yet
   349				 * instantiated in the files array if a sibling thread
   350				 * is partway through open().  So make sure that this
   351				 * fd is available to the new process.
   352				 */
   353				__clear_open_fd(open_files - i, new_fdt);
   354			}
   355			rcu_assign_pointer(*new_fds++, f);
   356		}
   357		spin_unlock(&oldf->file_lock);
   358	
   359		/* clear the remainder */
   360		memset(new_fds, 0, (new_fdt->max_fds - open_files) * sizeof(struct file *));
   361	
   362		rcu_assign_pointer(newf->fdt, new_fdt);
   363	#ifdef CONFIG_CGROUP_FILES
   364		if (!files_cgroup_alloc_fd(newf, files_cgroup_count_fds(newf)))
   365			return newf;
   366	
   367	/* could not get enough FD resources.  Need to clean up. */
 > 368		new_fds = new_fdt->fd;
   369		for (i = open_files; i != 0; i--) {
   370			struct file *f = *new_fds++;
   371	
   372			if (f)
   373				fput(f);
   374		}
   375		if (new_fdt != &newf->fdtab)
   376			__free_fdtable(new_fdt);
   377		*errorp = -EMFILE;
   378	#else
   379		return newf;
   380	#endif
   381	
   382	out_release:
   383	#ifdef CONFIG_CGROUP_FILES
   384		files_cgroup_remove(newf);
   385	#endif
   386		kmem_cache_free(files_cachep, newf);
   387	out:
   388		return NULL;
   389	}
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
