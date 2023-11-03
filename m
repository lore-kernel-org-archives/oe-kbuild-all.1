Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC8879F5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhLcQtCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699000888; x=1730536888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TX+zBd0aiQi6lep7iTz14gzDPtyzYj6wzey71ja7Uqc=;
  b=lhLcQtCzqTYWtXdW0OtqKcKHvcAQgaMlBSfMSn8Pr0hZCGXHSjSdFZ/6
   lczblnLESYfwwun7LtUdlOtWKkR+1/BxWOSG0xhIASotitEHPnntj7Dt9
   e1/VhsH9tO1UbuzF+sjnZ89ME3laxzNbQcBksOIRFFVW1Ctb6UvrKqFZA
   yU6FBa936BAF4x3kZcWg6re2SXjEF+UhrT1RPzzIRrTrpkslwqczjWrPU
   7WPE1HktQoGLyURb03l+pU+201pK/oQWxaMbQkllv3FL/Z1HkDsLt7qYi
   weNy6lpBJkjKs+leQKqMP3yYtQFfrlgGfNmyP1MbzCLj9Zf28zMZZeEuc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379305553"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="379305553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 01:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2832996"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Nov 2023 01:41:20 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qypjy-0002Ne-0H;
	Fri, 03 Nov 2023 08:41:18 +0000
Date: Fri, 3 Nov 2023 16:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 16110/16252] arch/riscv/kernel/smpboot.c:251:32:
 warning: passing argument 1 of 'check_unaligned_access' makes pointer from
 integer without a cast
Message-ID: <202311031648.9xiTejVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e27090b1413ff236ca1aec26d6b022149115de2c
commit: 8aefa036ccd9b3745e8f68c7a78ee4172296462f [16110/16252] Merge patch series "Add support to handle misaligned accesses in S-mode"
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311031648.9xiTejVV-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031648.9xiTejVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031648.9xiTejVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/smpboot.c: In function 'smp_callin':
>> arch/riscv/kernel/smpboot.c:251:32: warning: passing argument 1 of 'check_unaligned_access' makes pointer from integer without a cast [-Wint-conversion]
     251 |         check_unaligned_access(curr_cpuid);
         |                                ^~~~~~~~~~
         |                                |
         |                                unsigned int
   In file included from arch/riscv/include/asm/hwcap.h:73,
                    from arch/riscv/include/asm/alternative.h:19,
                    from arch/riscv/include/asm/errata_list.h:8,
                    from arch/riscv/include/asm/tlbflush.h:12,
                    from arch/riscv/include/asm/pgtable.h:117,
                    from arch/riscv/include/asm/uaccess.h:12,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:14,
                    from arch/riscv/kernel/smpboot.c:11:
   arch/riscv/include/asm/cpufeature.h:33:34: note: expected 'void *' but argument is of type 'unsigned int'
      33 | int check_unaligned_access(void *unused);
         |                            ~~~~~~^~~~~~


vim +/check_unaligned_access +251 arch/riscv/kernel/smpboot.c

   231	
   232	/*
   233	 * C entry point for a secondary processor.
   234	 */
   235	asmlinkage __visible void smp_callin(void)
   236	{
   237		struct mm_struct *mm = &init_mm;
   238		unsigned int curr_cpuid = smp_processor_id();
   239	
   240		/* All kernel threads share the same mm context.  */
   241		mmgrab(mm);
   242		current->active_mm = mm;
   243	
   244		store_cpu_topology(curr_cpuid);
   245		notify_cpu_starting(curr_cpuid);
   246	
   247		riscv_ipi_enable();
   248	
   249		numa_add_cpu(curr_cpuid);
   250		set_cpu_online(curr_cpuid, 1);
 > 251		check_unaligned_access(curr_cpuid);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
