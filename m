Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C033B969
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 07:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001461; cv=none; b=AigUZvr9KSOlIrKEJqCes+KA+vGuHX43gH9gVUzc3nI13EsgC0TTzJmpG+k11IHEgOtwIvUlFYa7I8BQj3jwQv+Jyj0m7ocv9b7W7LkZhjLuWfpBp8o2aSs+ErO2nAsn8hbcy1rh1qNYTqrqQ5siHLpBejAXlOx1RiTTm5AeWmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001461; c=relaxed/simple;
	bh=A9kbtts1LMb580YTLTJcnmvkR7OOHJmvn7p8S8jZpjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NLyJFgf+MPXbIJnQhEYRkgxXv5+t0xj1DELsy3wK0aVYjS6A56bIlid+Qfapmw2n5teOHMyEUE8fgzYYvsrryhhFb14SIqqW9+UCrc33LkZOBETtWrb372FBsrF2MKjdpeqEvB4CJjUjEHPtki/+DWMR5S8kGehAWIVM3ohHP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vl+T8IAL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vl+T8IAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786001458; x=1817537458;
  h=date:from:to:cc:subject:message-id;
  bh=A9kbtts1LMb580YTLTJcnmvkR7OOHJmvn7p8S8jZpjI=;
  b=Vl+T8IALWv/jL28XhQe6KoR9bS+cF8vheVQkso4KzxAtZF8WCBSFLjuX
   JiDBck6pHfIS3JG0DBCnp7lCt1+30zl8fBZqykBBBjSWXyx6wXOVixEwe
   hMPgB/qP33KDTgB7rEn/vJmOABhBnWs4LxATzZm4fH076j7yETdf+8Kv0
   XTYJS1AFxy4hr3UdJPgYMDmAXnGps5cvWvDDWXQbLuGldUM9v9TQ3V+0L
   7j2BrlghFWFSq3HywtAx2NgdajIjPgBB4Rqri7YSP9E8X9vil0teF63/m
   B19r/Ne58fNMvFFdDg9qq54g9pu8SP+6X42JyTFg+NCI1xEpcLd1WVPLE
   g==;
X-CSE-ConnectionGUID: +LGgBfyxSfe+9XPSHAOaGQ==
X-CSE-MsgGUID: ANTiWR5BTPePiNmVJK4PLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86615592"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86615592"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:30:49 -0700
X-CSE-ConnectionGUID: CPEIUNRpSoqvMDf6O+ZAew==
X-CSE-MsgGUID: HwClJMzASwaF0swYisClXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="286697470"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2026 00:30:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrsYv-00000000EUv-0Fr5;
	Thu, 06 Aug 2026 07:30:45 +0000
Date: Thu, 06 Aug 2026 15:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 0/13]
 mm/pgsize_migration.c:204:19: error: no member named 'vm_lock' in 'struct
 vm_area_struct'
Message-ID: <202608061538.Hndz1smF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   08944e3ae242ce5177ecd96e33de7674550043af
commit: 67bb232cd7287051bc998673e42c9a1b7e86e93b [0/13] ANDROID: 16K: Fallback to mmap lock for linker context VMA lookup
config: x86_64-randconfig-015-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061538.Hndz1smF-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061538.Hndz1smF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061538.Hndz1smF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> mm/pgsize_migration.c:204:19: error: no member named 'vm_lock' in 'struct vm_area_struct'
     204 |                 down_read(&vma->vm_lock->lock);
         |                            ~~~  ^
   1 warning and 1 error generated.


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
