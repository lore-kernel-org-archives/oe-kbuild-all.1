Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431483207
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 04:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755837902; cv=none; b=akA6oNaHx0UOLRI/3SpOW4o4LpV/D3vfBf+9HHF4lepCq2VVWcD4KTFA5Crbye3W6u7UJOH9hSqvNj2jrj2AjSs6cXqEWZkMzbIcfmQ8J8nkwUMrEqapZoUXVu+HikP2btZyWp+O8xMHZQxyzsY7qt5PcsudM50/uUxOrK5Wu28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755837902; c=relaxed/simple;
	bh=DJf1oQeqnVBX0jBzvJq7yslZLDGhgKI9sEflIPNZQAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/2WZiE4zByc3FeZkYjb+7VhdOKyGGjZW4nLLU+hB4KGKDfGQ8ZPOflS/8PrQgKfd2hr79RlBopuIY0zobglYLRXITdv0BEuiceWOJpaELyvFxso/fPNX4QZ8O2clXVCMIGt48tkPydbw+rLftkldKO7LZkxrb4fWpplJ81sJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ms9jmgVE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ms9jmgVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755837900; x=1787373900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJf1oQeqnVBX0jBzvJq7yslZLDGhgKI9sEflIPNZQAM=;
  b=ms9jmgVErnvCCTd4urRJVpQHT2sqx5TvZL62A/f4yHg+Y6XAYDhnlyfD
   9ncx4wG8kYLxJj24SID2OHtTEECDNKnW7lhB2sczBBMPH2TP0p86kw4Nw
   MO+fb0X4rDVUUBP/P4Tv5X3e7nh7jCFqJgeZNdzirJVNjHN6QAmL5zDdQ
   XaEoTrMc/fVYjD3WaIlcz2knC8ENtukiBtZv2NBZqQ7mJct1aSupQcw7n
   mVZ2qepkzW0Hu8XuplJHlbeqN9dVPefpYniBXHBMr44k5R1sF1dgEUqsI
   TQB9BzbJoMeqs9JrodSYuk5kIQKzyt/DG7FDwgjEjcvu7KYP9FecMoTV8
   Q==;
X-CSE-ConnectionGUID: SKLkgXMGRgCvPIS4Eog74w==
X-CSE-MsgGUID: Q4jSvidaRtuaCAeI4+30aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69241173"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69241173"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 21:44:59 -0700
X-CSE-ConnectionGUID: 86GqD9iMSNGsNNUlt809AA==
X-CSE-MsgGUID: hBrv+QACS1KKqMdjYnzATw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="167838187"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2025 21:44:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upJe0-000Kv1-2p;
	Fri, 22 Aug 2025 04:44:53 +0000
Date: Fri, 22 Aug 2025 12:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] mm/pgsize_migration.c:204:19:
 error: no member named 'vm_lock' in 'struct vm_area_struct'
Message-ID: <202508221257.I80Pqso3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9381f5d6bdbd5a5b870c85ed2dcaec9b191dd336
commit: 9381f5d6bdbd5a5b870c85ed2dcaec9b191dd336 [3/3] ANDROID: 16K: Fallback to mmap lock for linker context VMA lookup
config: x86_64-buildonly-randconfig-003-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221257.I80Pqso3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221257.I80Pqso3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508221257.I80Pqso3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pgsize_migration.c:204:19: error: no member named 'vm_lock' in 'struct vm_area_struct'
     204 |                 down_read(&vma->vm_lock->lock);
         |                            ~~~  ^
   1 error generated.


vim +204 mm/pgsize_migration.c

   156	
   157	/*
   158	 * The dynamic linker, or interpreter, operates within the process context
   159	 * of the binary that necessitated dynamic linking.
   160	 *
   161	 * Consequently, process context identifiers; like PID, comm, ...; cannot
   162	 * be used to differentiate whether the execution context belongs to the
   163	 * dynamic linker or not.
   164	 *
   165	 * linker_ctx() deduces whether execution is currently in the dynamic linker's
   166	 * context by correlating the current userspace instruction pointer with the
   167	 * VMAs of the current task.
   168	 *
   169	 * Returns true if in linker context, otherwise false.
   170	 */
   171	static inline bool linker_ctx(void)
   172	{
   173		struct pt_regs *regs = task_pt_regs(current);
   174		struct mm_struct *mm = current->mm;
   175		struct vm_area_struct *vma;
   176		struct file *file;
   177	
   178		if (!regs)
   179			return false;
   180	
   181		vma = lock_vma_under_rcu(mm, instruction_pointer(regs));
   182	
   183		/*
   184		 * lock_vma_under_rcu() is a try-lock that can fail if the
   185		 * VMA is already locked for modification.
   186		 *
   187		 * Fallback to finding the vma under mmap read lock.
   188		 */
   189		if (!vma) {
   190			mmap_read_lock(mm);
   191	
   192			vma = find_vma(mm, instruction_pointer(regs));
   193	
   194			/* Current execution context, the VMA must be present */
   195			BUG_ON(!vma);
   196	
   197			/*
   198			 * We cannot use vma_start_read() as it may fail due to
   199			 * false locked (see comment in vma_start_read()). We
   200			 * can avoid that by directly locking vm_lock under
   201			 * mmap_lock, which guarantees that nobody can lock the
   202			 * vma for write (vma_start_write()) under us.
   203			 */
 > 204			down_read(&vma->vm_lock->lock);
   205	
   206			mmap_read_unlock(mm);
   207		}
   208	
   209		file = vma->vm_file;
   210		if (!file)
   211			goto out;
   212	
   213		if ((vma->vm_flags & VM_EXEC)) {
   214			char buf[64];
   215			const int bufsize = sizeof(buf);
   216			char *path;
   217	
   218			memset(buf, 0, bufsize);
   219			path = d_path(&file->f_path, buf, bufsize);
   220	
   221			/*
   222			 * Depending on interpreter requested, valid paths could be any of:
   223			 *   1. /system/bin/bootstrap/linker64
   224			 *   2. /system/bin/linker64
   225			 *   3. /apex/com.android.runtime/bin/linker64
   226			 *
   227			 * Check the base name (linker64).
   228			 */
   229			if (!strcmp(kbasename(path), "linker64")) {
   230				vma_end_read(vma);
   231				return true;
   232			}
   233		}
   234	out:
   235		vma_end_read(vma);
   236		return false;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
