Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0D31AAAA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774932312; cv=none; b=tZFpOBkjbj+ENr8G/QEj0uKFMtCUPOmaD5RSF8Q2LTRcbYStJQPa2ngJ9Lcqnurz7NU53zbM0Np2HOXZRIu9J+aqB+3zCiE5TIwkPCjVzAChWJi6PV7rbikRj+OiAeRh+jaBtvCPlDmqclGkVpdQg9l0a9//5am07+c+nCvmjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774932312; c=relaxed/simple;
	bh=L/KbeD1AAavn1mBt/HPj8PeEOiTPSL64OCZcnbnolpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HxXdLmrYHjD524yXDZRx7KGpg/FMsFQduodJLi2vcK9yjQwx9nKx/3r7U9/M2YTgGeFjySyytThWDeaJ5R+E1m7cU7s6I+A2nWD7c31TQEgPdkt5/OGU8W6U7DgMGGfdbPzHiFQxMRNJNiNb2bIVvAhNwMdj0mbVTZ3ea/7/s8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUTq0a5o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUTq0a5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774932311; x=1806468311;
  h=date:from:to:cc:subject:message-id;
  bh=L/KbeD1AAavn1mBt/HPj8PeEOiTPSL64OCZcnbnolpc=;
  b=YUTq0a5oRBMFcvU9w4YDM3mTLTzSRKB33yHOipfElroLSA+PFXpOSQCI
   L9S1LYeJihOI4gch9DcSG9SR7ejQUsJvBBnyUML/LWoaiy4P+dhLiACaU
   mwLcfIHf0bIKyHD80GYYHk6FDg/OQYv+dyPVMOsxnTpqAN/6uydomxYx+
   7o94/6mQKEtLWrqfX8PMLrKtlaD92DdD1PZG0EJi16xETwKMR0DGVdN5b
   3BmltEra/l1ZNBjDhzrtA5au5h4zsiRm5qlLiilhVc96bLeosZ6ljkkrP
   CgYTz9TWuZi9z0tinK34alPqAXjKsPXC2EjfxvRzNFp3GC+UXVfWY9AsD
   g==;
X-CSE-ConnectionGUID: gyNM7sbWTuebfBwUlCZCew==
X-CSE-MsgGUID: 4iXuuJNzTE2CggCCKsqN2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87010295"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="87010295"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 21:45:10 -0700
X-CSE-ConnectionGUID: SHIDIIIvSaiR2Gz1TVssKQ==
X-CSE-MsgGUID: 5yl/EwmkSfCHD40ZIQfpNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226121534"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Mar 2026 21:45:10 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7QyQ-000000002Ev-1vXe;
	Tue, 31 Mar 2026 04:45:06 +0000
Date: Tue, 31 Mar 2026 12:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 1/1]
 mm/pgsize_migration.c:204:11: error: call to undeclared function
 'vma_start_read_locked'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603311259.59mcMJMB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   feb767273b096a7c07872106ddb1cdcbfa682fcd
commit: c691ab2c1e67fe61744eb8935689b7f9648dc97d [1/1] ANDROID: look up vma under RCU in linker_ctx()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260331/202603311259.59mcMJMB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311259.59mcMJMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311259.59mcMJMB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pgsize_migration.c:204:11: error: call to undeclared function 'vma_start_read_locked'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     204 |                 BUG_ON(!vma_start_read_locked(vma));
         |                         ^
   1 error generated.


vim +/vma_start_read_locked +204 mm/pgsize_migration.c

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
