Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19B3B6BE8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952268; cv=none; b=cS236+zpbD25/AcXygP5g/CJw9pHjvFpnkMEds8sVzkeoZGQvKepbZ5al7HzKabSwtKeeMpBHmsenlKAR3vU3aNyNNh+8ShLBN1Ex+6K8IOmwXJ/QWCwIxEf+WmzfK/dcmCyu/fLGXXsKjj8C3n+TcYhIORs+5g8rr3qSye2WK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952268; c=relaxed/simple;
	bh=ePxvdezdYJ/uczF2w6fQH1WN4l+7eA6YLGJo9a6eRgA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oHy3Swtbr+qM4v8O39EwrwZz4b50m/I0BQ/MYLZP5BbWUM7fBwABz4aX10oCjpvvls/rmJFue954Fsf6mBR5HKAOFb2YhfKF0q3cMKOJt0gVDv2wFXwvRV69BPH2UDnNXNE0Oip1pSC8nv+9+mjWjqGn6tTpXtyFaFsLvI4MOI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ScEnKZfg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ScEnKZfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774952266; x=1806488266;
  h=date:from:to:cc:subject:message-id;
  bh=ePxvdezdYJ/uczF2w6fQH1WN4l+7eA6YLGJo9a6eRgA=;
  b=ScEnKZfgPT+Fs76u/RCN5RRKfQlvcUWBAD1XGMZR+/3yWSUC059QPAdm
   oQnxQ55yGAhOkWCf9MhzVFTRdoXts7Srdhq5Snx9gDH0Lw+M/LXDtH1xi
   lis7+G0pAmDI5kri8s3EJxPlcQNSNIDIvR7nZ6GcFdpDhAVawz42KBUxJ
   iiu0msCjwaJdim3WJI+zJhA86lQjB9aFDKpPF0J+NRjUSkuiGTDXgunB/
   +02uc+jy4mAWCHmPLe5Rp8pEu+nATkEThNWs6qL4QGkGOU9LMuTem1Nm5
   oEHkDlSbEvMHDFncF6CQjyREjoR8B2BOTXBPuoRCKLUrBhQ+BW9cMkLq1
   w==;
X-CSE-ConnectionGUID: h1ZbD+APQ6isRSw+UwLyJQ==
X-CSE-MsgGUID: oJUtElAOS+KDIQPNMvctWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79560608"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79560608"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:17:42 -0700
X-CSE-ConnectionGUID: mbk+L2lQQ4OwO8R7anNG+Q==
X-CSE-MsgGUID: afE819IyTm2oUk2lQq5u3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="264262574"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2026 03:17:41 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7WAE-000000002W5-0m2r;
	Tue, 31 Mar 2026 10:17:38 +0000
Date: Tue, 31 Mar 2026 18:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 0/1]
 mm/pgsize_migration.c:204:31: error: 'struct vm_area_struct' has no member
 named 'vm_lock'
Message-ID: <202603311825.iRxFxurn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   cae9f8e5112ea6b28d9dd25069d2bf793e8d6774
commit: 67bb232cd7287051bc998673e42c9a1b7e86e93b [0/1] ANDROID: 16K: Fallback to mmap lock for linker context VMA lookup
config: x86_64-randconfig-074-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311825.iRxFxurn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311825.iRxFxurn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311825.iRxFxurn-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pgsize_migration.c: In function 'linker_ctx':
>> mm/pgsize_migration.c:204:31: error: 'struct vm_area_struct' has no member named 'vm_lock'
     204 |                 down_read(&vma->vm_lock->lock);
         |                               ^~


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
