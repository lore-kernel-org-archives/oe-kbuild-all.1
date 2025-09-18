Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A06238149
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 02:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758162234; cv=none; b=OyE3PqAI2gZQclaABjWSd7gSS1Y8MLX4ZbxUE7bs+jGck20gIKFbcy9Li7G9oru1KoQ2Tl5UiHk+p8m2Rl5HUyosk17sMx7mstIrGrJw5gwWzfWnrjVnSuB9Uoy0yEpF1c4ULIRljJRXZNJeovk8xIC62mPWc1iANkMaSZ1z8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758162234; c=relaxed/simple;
	bh=l//rTF5G4Mj8xoP1cJ0CDqWMc6JU+rsFo57B9l26vZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMJBIVmHOeu7jwjAN7pDYEDUGt7gQd6eSFCIO5qZYNoIqK73ndmyX7RNuGcuqZesr/X0d03+8aebnpmfdJOrSp40SQpCjX+FTxGVRPmlb73Awmonlrt37qUPDPBootJUiNSaANm9wL3Fcg4nngVkVzT48i297ms9CW29j9hwK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0qov7gb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0qov7gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758162231; x=1789698231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l//rTF5G4Mj8xoP1cJ0CDqWMc6JU+rsFo57B9l26vZg=;
  b=h0qov7gbzQeIgC53f4+jc4nsa/EGiYDVGdkDNXelBNsXy4iPPpkdrhLw
   QuppThIrVsMe1UEf77LegA4ERCw1IY+h+qZIPHMVoV0jMOlYB27rX38iW
   JPl9TnxxAmicYyVOsUtObvghN7Ywcg8eHTCqT8pjNIU+6Vh25AX+K/jcs
   tfCUA/H+//NXPfxWUy79Aigsf9vLuBL05zj8P27WnLjtc7CaVM+w4kDi/
   Fc35PB4FY7LWZr7COIHkyI+O9In2DfWbCWl8SSyBChiG6+lYBSISVQGju
   su+OYshAbBw/K8oiUoRjHH+bflGFz1inkS1tqes+uMO9KqN8fhhhXCCae
   g==;
X-CSE-ConnectionGUID: bZvlK1DZRbKjRa7xBAmp3w==
X-CSE-MsgGUID: 1HL3AgpnRAmlOcO8vSiTOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71906353"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="71906353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 19:23:50 -0700
X-CSE-ConnectionGUID: 2B+neTqcRbyObsdBvvo+PA==
X-CSE-MsgGUID: Ru051PfvShmEb0bG/clZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="179400845"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Sep 2025 19:23:49 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz4JG-0002eB-0D;
	Thu, 18 Sep 2025 02:23:46 +0000
Date: Thu, 18 Sep 2025 10:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2904/2904] clang: error:
 -Wl,-soname=linux-ilp32-vdso.so.1: 'linker' input unused
Message-ID: <202509181039.pyJAKtlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8ba53a0f68c5722dd787f872e161bbd850b225c4
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [2904/2904] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-r122-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181039.pyJAKtlO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181039.pyJAKtlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181039.pyJAKtlO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_THREAD__ 1
         |         ^
   1 warning generated.
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_THREAD__ 1
         |         ^
   1 warning generated.
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_THREAD__ 1
         |         ^
   1 warning generated.
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_THREAD__ 1
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   2 warnings generated.
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_THREAD__ 1
         |         ^
   1 warning generated.
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   error: unknown target ABI 'ilp32'
>> clang: error: -Wl,-soname=linux-ilp32-vdso.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
   make[3]: *** [scripts/Makefile.build:373: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.lds] Error 1
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:84: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o] Error 1
   error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:87: arch/arm64/kernel/vdso-ilp32/note-ilp32.o] Error 1
   error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:90: arch/arm64/kernel/vdso-ilp32/sigreturn-ilp32.o] Error 1
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
