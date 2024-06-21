Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44DF12D771
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 05:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718946630; cv=none; b=iZMGWFRwgUgsqZciFOKwiB6WC5eoXteQfuTBiT5Ym7eU0QUwZXxErYArZ+j++dKd7opejJ1RjFNDSlwoyqBqQTO3zk/V17fvqeSn2LMwU7TeE5HAtSV4y169Kk5IgIsluNHy8nBaGrqaqdt2Lh7Wt188e2jX7T2xnnfLOa0jANs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718946630; c=relaxed/simple;
	bh=aVnNOHm2+Aua+xL1Hx3IgC1l/SFDJ2jncKxNSrR4Aj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXs2fBOsNksx+CMKwcJNC3CwK4n7gnuMpJWMuoN7Hy90pnY3u6w+p71wL2kZ72JaQGEkeSPUh5PfwT1qpgiLhIbyQSpJvRmiClubba0q29GmjozSuWGEDmpDfxysebc+6TY64uI+xnHbBoA/33IHGwSqXryS4Qz7oPIiFOS9q5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXJJZnL/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXJJZnL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718946629; x=1750482629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVnNOHm2+Aua+xL1Hx3IgC1l/SFDJ2jncKxNSrR4Aj4=;
  b=DXJJZnL/4laQYMh/n6/aXMZtTDVYvLi0INuE6NrpTpXgQXBssOPcsgak
   qMT7ibnq7ggALCUtqg2jFBDdJfJmWErxeWvMfi2FwU7L2YPb1t3ApsXYp
   5lq/dmbRzp7S78NX/PIBn+IU1fVPlI+gR/rYrjSXEIpOJBYEAnJG0gCm8
   KUxswJUKb1tWWVuh78SNso/dSNBC9dir/hsUAqjxShND2JwuXB2jkd4J+
   FaKje5R1j1u5TmH0o1LbMDyRkRfY11Zx7BnkstvBSfnYdZKAiuOfosJ+W
   C2bR7hcNGwYvK1NrhWQfnxIKynEqoq0OkwMii40z8+eHpPb1nD2+P5DFU
   Q==;
X-CSE-ConnectionGUID: fRvtS7uFTo+XtD7fBcTQpg==
X-CSE-MsgGUID: vGDl7HhRTta6Ks4rzaiOOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15797013"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="15797013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 22:10:29 -0700
X-CSE-ConnectionGUID: kMvE5rGdTDKJr6hpmyIPUg==
X-CSE-MsgGUID: KhidUkW8TmKdrFDcHAhFlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="46932164"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 22:10:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKWXZ-0008Fj-07;
	Fri, 21 Jun 2024 05:10:25 +0000
Date: Fri, 21 Jun 2024 13:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 14/15]
 arch/loongarch/include/asm/atomic.h:23:25: error: expected identifier or '('
 before string constant
Message-ID: <202406211317.2elaIijF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   c2dd777003347c510f9fecc965fb3e65d7c79a43
commit: 7e11d793823084e2832ee2de474eb3b880a6caf9 [14/15] asm-generic: unistd: fix time32 compat syscall handling
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240621/202406211317.2elaIijF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211317.2elaIijF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211317.2elaIijF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/loongarch/include/asm/bitops.h:27,
                    from include/linux/bitops.h:63,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:6,
                    from ./arch/loongarch/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/loongarch/kernel/asm-offsets.c:8:
>> arch/loongarch/include/asm/atomic.h:23:25: error: expected identifier or '(' before string constant
      23 | #define __SC            "sc.d   "
         |                         ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:66:1: note: in expansion of macro '__SC'
      66 | __SC(time32, io_getevents, sys_io_getevents_time32)
         | ^~~~
   In file included from arch/loongarch/include/asm/vdso/gettimeofday.h:13,
                    from include/vdso/datapage.h:149,
                    from arch/loongarch/include/asm/vdso.h:12,
                    from arch/loongarch/include/asm/elf.h:13,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/loongarch/kernel/asm-offsets.c:11:
>> arch/loongarch/include/asm/vdso/vdso.h:15:1: warning: empty declaration
      15 | } ____cacheline_aligned_in_smp;
         | ^
>> arch/loongarch/include/asm/vdso/vdso.h:18:31: error: array type has incomplete element type 'struct vdso_pcpu_data'
      18 |         struct vdso_pcpu_data pdata[NR_CPUS];
         |                               ^~~~~
>> arch/loongarch/include/asm/atomic.h:23:25: error: expected identifier or '(' before string constant
      23 | #define __SC            "sc.d   "
         |                         ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:66:1: note: in expansion of macro '__SC'
      66 | __SC(time32, io_getevents, sys_io_getevents_time32)
         | ^~~~
   In file included from include/linux/ptrace.h:12,
                    from include/linux/ftrace.h:16,
                    from include/linux/kvm_host.h:32,
                    from arch/loongarch/kernel/asm-offsets.c:12:
   include/linux/seccomp.h: In function 'secure_computing':
>> include/linux/seccomp.h:30:25: error: implicit declaration of function '__secure_computing'; did you mean 'secure_computing'? [-Werror=implicit-function-declaration]
      30 |                 return  __secure_computing(NULL);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         secure_computing
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +23 arch/loongarch/include/asm/atomic.h

5b0b14e550a006 Huacai Chen 2022-05-31  13  
5b0b14e550a006 Huacai Chen 2022-05-31  14  #if __SIZEOF_LONG__ == 4
5b0b14e550a006 Huacai Chen 2022-05-31  15  #define __LL		"ll.w	"
5b0b14e550a006 Huacai Chen 2022-05-31  16  #define __SC		"sc.w	"
5b0b14e550a006 Huacai Chen 2022-05-31  17  #define __AMADD		"amadd.w	"
5b0b14e550a006 Huacai Chen 2022-05-31  18  #define __AMAND_DB	"amand_db.w	"
5b0b14e550a006 Huacai Chen 2022-05-31  19  #define __AMOR_DB	"amor_db.w	"
5b0b14e550a006 Huacai Chen 2022-05-31  20  #define __AMXOR_DB	"amxor_db.w	"
5b0b14e550a006 Huacai Chen 2022-05-31  21  #elif __SIZEOF_LONG__ == 8
5b0b14e550a006 Huacai Chen 2022-05-31  22  #define __LL		"ll.d	"
5b0b14e550a006 Huacai Chen 2022-05-31 @23  #define __SC		"sc.d	"
5b0b14e550a006 Huacai Chen 2022-05-31  24  #define __AMADD		"amadd.d	"
5b0b14e550a006 Huacai Chen 2022-05-31  25  #define __AMAND_DB	"amand_db.d	"
5b0b14e550a006 Huacai Chen 2022-05-31  26  #define __AMOR_DB	"amor_db.d	"
5b0b14e550a006 Huacai Chen 2022-05-31  27  #define __AMXOR_DB	"amxor_db.d	"
5b0b14e550a006 Huacai Chen 2022-05-31  28  #endif
5b0b14e550a006 Huacai Chen 2022-05-31  29  

:::::: The code at line 23 was first introduced by commit
:::::: 5b0b14e550a006b4d093619e7517923872bcc218 LoongArch: Add atomic/locking headers

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
