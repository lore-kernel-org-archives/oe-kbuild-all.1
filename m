Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A1613FD93
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 09:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715851792; cv=none; b=ZCzOsNJUCITbhhizGEJpRWeScMt3bdf+z+mpjwmvx/S81FawUbDdfMJb+PBFyLR2r8IV6mOTSIXmlAIDY6auif+DRLpo//WyCnozQ9vLEiXIe+mzL10oGQhpb8VsRzVVzcTTREj1c8wTkLAQZXrPytwTNlBGDeaLPorJ0Jg66GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715851792; c=relaxed/simple;
	bh=fyPMoKUr8hXQUTOYLY56bwQPnNtvgmgWcwXXOTH/8no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gGb0wdrequKX5R+sFzG5zT0aD7Nbh9VhtsaeMF/5npT+zlfZa57RwSGVE77e3JyyfixsbQvb7rOM7v4sn+iLLp9w9nBN4Zth7S/GHMC6fF+gwWsewe2lWTuTCzbC5AIL55p+MFJVkf8a53wnGLv6RbU7kbek9vm2+kOvDRu75M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8VtIwuC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8VtIwuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715851790; x=1747387790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fyPMoKUr8hXQUTOYLY56bwQPnNtvgmgWcwXXOTH/8no=;
  b=B8VtIwuCr+u0nb4HwSFVybRxF3WYgAavJbEG2VJynl3yLb9M1I53jRV0
   CxX9oNn3bkHgyVuSpIaaX18G26ktgCzy1axIABzVaoRAvg8GC6hEoLvoz
   oiuL86AY9c21uT5Sl4Js8dkkmPA1PxsqVI0eIpPNGP6/2Mz643mKQ3quf
   IijHxJJ7r2unSoftFKywPTaUVu345uNpLk9o9f50I6PHykDdBJDw3Z7z2
   Do2EVDHZ6OW5YYIcCCL+36nO3TXp6omjaCs/XiMIhMHzUE5cci0Zp3ymg
   ssJM05d+fNkF3rOohOSlRXJq2EkOQkiNxmBElpHJ7BhOMuVs6UMS3Yn8R
   w==;
X-CSE-ConnectionGUID: gaB2Y8NCQuqM/YR+GaOpNQ==
X-CSE-MsgGUID: QYvDVvR6Q6aZEjDtMKvv3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11802151"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="11802151"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 02:29:50 -0700
X-CSE-ConnectionGUID: lVlrqO2rSK2zY85p8Hfztg==
X-CSE-MsgGUID: KtN7ENqFQUSuD5pQvtvmIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="62572897"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2024 02:29:48 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7XQo-000E5X-1M;
	Thu, 16 May 2024 09:29:46 +0000
Date: Thu, 16 May 2024 17:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13225/13339]
 arch/riscv/errata/andes/errata.c:68:45: error:
 'RISCV_VENDOR_EXT_ALTERNATIVES_BASE' undeclared
Message-ID: <202405161715.aW57SJuh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dbd9e2e056d8577375ae4b31ada94f8aa3769e8a
commit: 37235efc056ab6df9316c50f65355cfff4554bf6 [13225/13339] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-randconfig-r051-20231214 (https://download.01.org/0day-ci/archive/20240516/202405161715.aW57SJuh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405161715.aW57SJuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405161715.aW57SJuh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/riscv/errata/andes/errata.c: In function 'andes_errata_patch_func':
>> arch/riscv/errata/andes/errata.c:68:45: error: 'RISCV_VENDOR_EXT_ALTERNATIVES_BASE' undeclared (first use in this function)
      68 |         BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:23: note: in definition of macro '__compiletime_assert'
     458 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:478:9: note: in expansion of macro '_compiletime_assert'
     478 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/errata/andes/errata.c:68:9: note: in expansion of macro 'BUILD_BUG_ON'
      68 |         BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
         |         ^~~~~~~~~~~~
   arch/riscv/errata/andes/errata.c:68:45: note: each undeclared identifier is reported only once for each function it appears in
      68 |         BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:23: note: in definition of macro '__compiletime_assert'
     458 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:478:9: note: in expansion of macro '_compiletime_assert'
     478 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/riscv/errata/andes/errata.c:68:9: note: in expansion of macro 'BUILD_BUG_ON'
      68 |         BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
         |         ^~~~~~~~~~~~


vim +/RISCV_VENDOR_EXT_ALTERNATIVES_BASE +68 arch/riscv/errata/andes/errata.c

e021ae7f5145d4 Lad Prabhakar   2023-08-18  63  
e021ae7f5145d4 Lad Prabhakar   2023-08-18  64  void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
e021ae7f5145d4 Lad Prabhakar   2023-08-18  65  					      unsigned long archid, unsigned long impid,
e021ae7f5145d4 Lad Prabhakar   2023-08-18  66  					      unsigned int stage)
e021ae7f5145d4 Lad Prabhakar   2023-08-18  67  {
589e2fc8585098 Charlie Jenkins 2024-05-03 @68  	BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);

:::::: The code at line 68 was first introduced by commit
:::::: 589e2fc8585098e66cf5dace3806b4737edd0fd1 riscv: Convert xandespmu to use the vendor extension framework

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
