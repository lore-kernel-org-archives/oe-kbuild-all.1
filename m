Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAE659B41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW2+clcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705063042; x=1736599042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZqMKYEbgGZxLRdJIfPhOKBVu2UEQ09b51Sh26s6O/Us=;
  b=fW2+clcnsyUgjePsnPFS3iIkSZCy33/kmb2YFz4jNXYbgb3OY/6BKqGs
   EKHffQ9iTZSIPRGpBPzvQK0fBOfnC5eV8j+4TmKm1ps3yznhAv3UUnn6N
   FbIP3TPDxKpK/uFonev/LE+K5N1u9vrv6rfRCfB9aarbMCf6t/OI6cmvE
   reLr+7676ha3eGOKY8Ojrsetqmdp5uJFDCCQVakMd1wxaGuVXPjtsx/GC
   yQBKzsgntAI3UwX4zr/GREa2/rSJtX1gobvxSYAlvQj48MXhMp7T/0aZZ
   Z3Z+9E1pQbdC2THDKch7l9M7hmKxxuQTuhjMpe2+grEt1lc/owr3WgpVL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6523352"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6523352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 04:37:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="24993712"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2024 04:37:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOGmY-0009SW-0r;
	Fri, 12 Jan 2024 12:37:06 +0000
Date: Fri, 12 Jan 2024 20:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 691/2356] arch/arm64/include/asm/elf.h:223:9:
 warning: 'COMPAT_ARCH_DLINFO' macro redefined
Message-ID: <202401122047.CyxICDOd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: 7de3ab4c3dd938fae3626a6344830b018eb7ba4f [691/2356] arm64: introduce binfmt_elf32.c
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240112/202401122047.CyxICDOd-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401122047.CyxICDOd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401122047.CyxICDOd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/binfmt_elf32.c:27:
   In file included from arch/arm64/kernel/../../../fs/compat_binfmt_elf.c:17:
   In file included from include/linux/elfcore-compat.h:5:
   In file included from include/linux/elf.h:6:
>> arch/arm64/include/asm/elf.h:223:9: warning: 'COMPAT_ARCH_DLINFO' macro redefined [-Wmacro-redefined]
     223 | #define COMPAT_ARCH_DLINFO                                              \
         |         ^
   arch/arm64/kernel/binfmt_elf32.c:20:9: note: previous definition is here
      20 | #define COMPAT_ARCH_DLINFO
         |         ^
   1 warning generated.


vim +/COMPAT_ARCH_DLINFO +223 arch/arm64/include/asm/elf.h

7de3ab4c3dd938 Yury Norov        2023-11-27  221  
85751e9e5b1480 Vincenzo Frascino 2019-07-10  222  #ifdef CONFIG_COMPAT_VDSO
1e3f17f55aec65 Vincenzo Frascino 2019-06-21 @223  #define COMPAT_ARCH_DLINFO						\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  224  do {									\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  225  	/*								\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  226  	 * Note that we use Elf64_Off instead of elf_addr_t because	\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  227  	 * elf_addr_t in compat is defined as Elf32_Addr and casting	\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  228  	 * current->mm->context.vdso to it triggers a cast warning of	\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  229  	 * cast from pointer to integer of different size.		\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  230  	 */								\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  231  	NEW_AUX_ENT(AT_SYSINFO_EHDR,					\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  232  			(Elf64_Off)current->mm->context.vdso);		\
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  233  } while (0)
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  234  #else
f668cd1673aa2e Catalin Marinas   2012-03-05  235  #define COMPAT_ARCH_DLINFO
1e3f17f55aec65 Vincenzo Frascino 2019-06-21  236  #endif
7de3ab4c3dd938 Yury Norov        2023-11-27  237  

:::::: The code at line 223 was first introduced by commit
:::::: 1e3f17f55aec6510f88ff65dcbaae13435af0ba6 arm64: elf: VDSO code page discovery

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
