Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDF226FDA8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 20:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757102580; cv=none; b=acpx5G7K8DMr4BJyevz/dCqgsuBorbGWPBxEdhrJ3zCAuw3nCtO0F4iekezjgQw9xoWhwNK7Y+bZTRxfrbAqdS4tdcB1tnSeBhHeUqTKz6OmaZE9MfDqZNjg4ulyJPEc3Jr3zSbMFyXJhW3lRt1ZVyEULIzMrogEFF8N9HSCr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757102580; c=relaxed/simple;
	bh=5sZidaLqM7oXe10/VtyQm6qItLAjcKFHRx82/K9U6p8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lys/uxMCtejsIkhdmzu/5mxKpW8ZCCE0/jBFc1r2Ith/wWoxdu+ZBtBuY/wNfCZMfhrRf/fy1UcWUgUHVDl5BTszIn7+28oiPujVzT1U+c4+w0HTBBu/1avLrMUGKKRjm+kZpyacvOBCUs67CP6AmfDpltJCJ3sEA76Qj+WS4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEVZF++S; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEVZF++S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757102579; x=1788638579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5sZidaLqM7oXe10/VtyQm6qItLAjcKFHRx82/K9U6p8=;
  b=cEVZF++S2R3ockG2R12u9wjg7Ily/5hXzRZpmfWrz6fuB3XjkJqNPErN
   Yf9fM41Fe4YKWFbgGj0jQo0O0mJD/ejW0Tw1Pu91g/QuK5PvrwpExAbpo
   tfWc3wkNDQxwFNOWuDs2cHODWcjmFGWHlRsT0e0ZGKeuy4jxJBftu8Ryq
   fn7OvA8CZn1eunCxbWkyckLQfBNiv6tePkaSQ5168rnx01pAC4wO6Qw7e
   mbb/7k6Jopr0KN0CtVIqVtf0pt5XsP++uhmojAkgSkIaADkvnQWGbRHhZ
   ICKEhiuXPfQYZEtdxVPZhjabQdrpWDB5HfBZblRYjO7uhUjnVcqXaGbIy
   Q==;
X-CSE-ConnectionGUID: XOksCRbxSG2WNclKJqg4hw==
X-CSE-MsgGUID: fi/dJ2brSbib6aSSvu35Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70837460"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="70837460"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 13:02:58 -0700
X-CSE-ConnectionGUID: fBq7HCSuS3i0kKg4CE2hgA==
X-CSE-MsgGUID: wZ1SATs9SJKb+N18BAGmoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="177473704"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Sep 2025 13:02:57 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuce6-0000mx-1I;
	Fri, 05 Sep 2025 20:02:54 +0000
Date: Sat, 6 Sep 2025 04:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5] mm/pgsize_migration.c:204:25:
 error: implicit declaration of function 'vma_start_read_locked'; did you
 mean 'vma_assert_write_locked'?
Message-ID: <202509060322.UDKVKwNw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6904c56038528ab2fc76e7309fa4a2a4c4fbacf2
commit: d702341275709c6d3d9ef7403bfa348ceb584e8b [5/5] ANDROID: look up vma under RCU in linker_ctx()
config: x86_64-buildonly-randconfig-002-20250906 (https://download.01.org/0day-ci/archive/20250906/202509060322.UDKVKwNw-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060322.UDKVKwNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060322.UDKVKwNw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from arch/x86/include/asm/mem_encrypt.h:15,
                    from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/page_types.h:7,
                    from arch/x86/include/asm/page.h:9,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/pgsize_migration_inline.h:16,
                    from include/linux/pgsize_migration.h:16,
                    from mm/pgsize_migration.c:13:
   mm/pgsize_migration.c: In function 'linker_ctx':
>> mm/pgsize_migration.c:204:25: error: implicit declaration of function 'vma_start_read_locked'; did you mean 'vma_assert_write_locked'? [-Werror=implicit-function-declaration]
     204 |                 BUG_ON(!vma_start_read_locked(vma));
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/pgsize_migration.c:204:17: note: in expansion of macro 'BUG_ON'
     204 |                 BUG_ON(!vma_start_read_locked(vma));
         |                 ^~~~~~
   cc1: some warnings being treated as errors


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
   200			 * can avoid that by using vma_start_read_locked under
   201			 * mmap_lock, which guarantees that nobody can lock the
   202			 * vma for write (vma_start_write()) under us.
   203			 */
 > 204			BUG_ON(!vma_start_read_locked(vma));
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
