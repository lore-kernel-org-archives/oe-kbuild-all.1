Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998B253B42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933634; cv=none; b=JOPJR9vABjnRD88IdTXVasvPa1P+sEW2AoP2evh9S5UjR0hjSrwZfwHfCRPDvkgQHRtnjQyUeSupsFGze9Bc1pdrB+5FyCHKrpBuWWdLr4g81oZsCMw//Yd4KYg3PNBeHnOgCKUCeOLm/P2UTCk6jUksuylPU/EXAxQNqjdQ754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933634; c=relaxed/simple;
	bh=ueuHp5cyxenCgSY5HTRlayTfzjCPpgKbmGBgw36BQrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DlOldoq2D2XIubQOZavuPdNEM3MH3nvlRx4ourhnI03aI9+nU3KUsbqRLdQQiWNHYtMFmXAoID51XcKfWPsXN/HgDy/KFnVGO1uAPCem3QX22mwn8lcSZxKX770+46MyZKiAGQq4xpaXK7ONCd39FyccS7bF8HKNXnKuVmv875I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtLKGPDH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtLKGPDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774933633; x=1806469633;
  h=date:from:to:cc:subject:message-id;
  bh=ueuHp5cyxenCgSY5HTRlayTfzjCPpgKbmGBgw36BQrI=;
  b=VtLKGPDHedc74QmQH0uFxBuJl2L7P/rRE7EYTO04MSvGvW8tK5lNPxlW
   iMwz5Btp5ISeIOsbF5AEgLuViVsEcld0flvxP6LuoXPaqStQrkykyEfw1
   v2d4Yubv/cYzXXVP7mwY/5JU1FBfEywq1lNwAACpqMrCX5BzIMBReAsa/
   qYnKw+z1FEXzsrJFu93KLD2MlweSYgdfPrEpI+W/Td+mpSG9XW2s+/i/i
   JGxH6rGR/ymxm5uMNRbwbe37xT+C/TnMm05OB58AoqKRzvbY73IOe0byF
   d+keNsU+oc2HApQFEXRBXhh5lNrEgZIt6+WZGsMHR+r3iry/SU1kWh/Ln
   g==;
X-CSE-ConnectionGUID: 3Ev3nEv7SBebnWIMjL7VzA==
X-CSE-MsgGUID: T7niHw2ESPGeGS0JOl9t6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93519104"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93519104"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:07:13 -0700
X-CSE-ConnectionGUID: 514jYZNYRSOHrutoLuebJA==
X-CSE-MsgGUID: xuVxHHpBRMmPeCunS8OLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="219607615"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 22:07:11 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7RJk-000000002G5-3Hry;
	Tue, 31 Mar 2026 05:07:08 +0000
Date: Tue, 31 Mar 2026 13:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 1/1]
 mm/pgsize_migration.c:204:19: error: no member named 'vm_lock' in 'struct
 vm_area_struct'
Message-ID: <202603311240.IKk5lUGA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   cae9f8e5112ea6b28d9dd25069d2bf793e8d6774
commit: 67bb232cd7287051bc998673e42c9a1b7e86e93b [1/1] ANDROID: 16K: Fallback to mmap lock for linker context VMA lookup
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260331/202603311240.IKk5lUGA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311240.IKk5lUGA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311240.IKk5lUGA-lkp@intel.com/

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
