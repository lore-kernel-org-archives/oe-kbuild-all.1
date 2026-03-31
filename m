Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240F1371D19
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942285; cv=none; b=unD5FkV/lCnC/i5y1rTMAl8iAFWC0tNTWWkJ8gYOVpSBxShvu63iDCjVaJ9/+7HfY1WatXF04r6jRfOQ3jnS4K82YcfsBmd/uJiHKRQnQsa0qJ1b8IYZUma8iXYeWKqXPvFCrvIj+7oWVFfQ+AxolkF9OYTApGq41yWrXpjCTlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942285; c=relaxed/simple;
	bh=Jm96zD5OIcZTQzy3/+LVfgjz51ZRk+pm7+viCIwncMw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LVVXR4+CGsnicxNg9BebrMkxz0XfBgmlqtjtwPeEAch069EnZV9GXrl1LSHO488x+7RRQY2qXtFgIvo8EHOZeYJnSdu5oBUGzZRzahQJK58jMqM1MP5+61RfKUEJziq0nXvFM4qGHjORVGjWSNVoZs3c7TVO0C8wX0iAHuTQ/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFt7ioK+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFt7ioK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774942284; x=1806478284;
  h=date:from:to:cc:subject:message-id;
  bh=Jm96zD5OIcZTQzy3/+LVfgjz51ZRk+pm7+viCIwncMw=;
  b=oFt7ioK+niDulfREMeNnIHSge4nCRjR4EuHwMs3/Oh/34FNkuMQCcnhk
   BbKC8O1uOKxX/v7ZmzDqd442dHAgv2BL9lzep9J4ZOOz0RzaZvKO/0Oe7
   OZoIx7Tzf2ZSthTVCMuThQgMAG9TRQkHvXCqXyPdkW3NXt7ZjLRgnR/Fx
   n0LBtddsdlNub8t1K44aMMdh8IL6jN6DH04N1S9lJTR2XpR8ec5xNfFwj
   P6OPWSDmPQ8uwCBR9JqvAy7lpnYRiZppui3wyMaRxWPWZ7yGFDMjrfOGn
   4ymsn2RcnKDPkFR0yiU6M/rtjb0tfA+Uhnrsm1SWS7iK/We+uuPlD3Ka3
   g==;
X-CSE-ConnectionGUID: XK2dSlhDTBaXpYZiijpzlA==
X-CSE-MsgGUID: gjSB+RkGRw+hwEYe0eC1tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75662081"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75662081"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 00:31:24 -0700
X-CSE-ConnectionGUID: hewAXumASmWRuiYhq90CAg==
X-CSE-MsgGUID: u6JuuQb+T/ODaIg+UFZiMw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 00:31:22 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7TZH-000000002Mr-3EOb;
	Tue, 31 Mar 2026 07:31:19 +0000
Date: Tue, 31 Mar 2026 15:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 0/1]
 mm/pgsize_migration.c:204:25: error: implicit declaration of function
 'vma_start_read_locked'; did you mean 'vma_assert_write_locked'?
Message-ID: <202603311531.qiZSgoDy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   feb767273b096a7c07872106ddb1cdcbfa682fcd
commit: c691ab2c1e67fe61744eb8935689b7f9648dc97d [0/1] ANDROID: look up vma under RCU in linker_ctx()
config: x86_64-randconfig-074-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311531.qiZSgoDy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311531.qiZSgoDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311531.qiZSgoDy-lkp@intel.com/

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
>> mm/pgsize_migration.c:204:25: error: implicit declaration of function 'vma_start_read_locked'; did you mean 'vma_assert_write_locked'? [-Wimplicit-function-declaration]
     204 |                 BUG_ON(!vma_start_read_locked(vma));
         |                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~
   mm/pgsize_migration.c:204:17: note: in expansion of macro 'BUG_ON'
     204 |                 BUG_ON(!vma_start_read_locked(vma));
         |                 ^~~~~~


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
