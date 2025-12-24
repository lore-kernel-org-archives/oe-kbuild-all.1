Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD351EEA49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766612645; cv=none; b=M3q0HNoU2d8x3qhwPwHD6mzD+bnbpmuEYAYr+68wsoG1yCSX1clm6dHKLXapck7YDBQjBKiXVNZEXPsvt29MKszU3GLQWHmrqYOkO0gwmgBDn4cmy2DwNJye5f/9/1/M5djbopwhsbvT1rG1KmZoDC0PaQQTHsZOZ5aljeiSfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766612645; c=relaxed/simple;
	bh=hBRdFbAJJq1W4aU0Fv1G6L3ukk0ht48dnPui74DshBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sYZ054GpfDiNLeRnEmrcShAXOX6C6pjY3debUCF6T6Bv6igbjMQKxNbCzyIuhAlWlw4z42I1l/oxHtoEMT6P7oVaGdMNaYFeyVi8Z3WG+2VQmUGrx7fTFI2vfilmYt/hVZ+LGxGwfnyfe9SEv7QblgthE++LVcoVx2UTdM9sJgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvvB2CcR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvvB2CcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766612643; x=1798148643;
  h=date:from:to:cc:subject:message-id;
  bh=hBRdFbAJJq1W4aU0Fv1G6L3ukk0ht48dnPui74DshBI=;
  b=UvvB2CcR8OmjOHR7nsstBRKFlO8alEU9+brdD9n2cu/IFhQEBAYsqo2A
   bF3hjhi7R4kxfTilc8i9fUFz+lljuFaPpkcekeNwImlT8i8w6dpBU7EIG
   C+eAbCFEN7UCdx41QltAMFoijiOMC9udSFTxyi4gltLGMLxBms9nCMUkc
   zp/2oevJu/mCitLklCRjMpcUMm0F7YykkqYLKHfljLQYDSOPQM6/SLTuv
   Lofk+slm5Lsv5dlFwuX6vAeA3BQ+tsH5GOnA6ggQY6xbXTP7LCzzayFJa
   ILvMlu+xJXFGtyfZ9Q8iKJ8dxsgET7pAUPj6XTuzZ7Ax29ctQhwI/PVqS
   Q==;
X-CSE-ConnectionGUID: CbWRN5T5Th6jahai9Y7tOg==
X-CSE-MsgGUID: 4r2HvO2RQo2sihIgbHOOYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68199443"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="68199443"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 13:44:02 -0800
X-CSE-ConnectionGUID: plj9m8WTRlG/I5NWxDrWiw==
X-CSE-MsgGUID: oViFyqPmQq+Sn45awjROlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="200584520"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Dec 2025 13:44:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYWeD-000000003Tl-3GxJ;
	Wed, 24 Dec 2025 21:43:57 +0000
Date: Thu, 25 Dec 2025 05:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 kernel/gki_module.c:35:6: warning: no previous prototype for function
 'gki_is_module_protected_symbol'
Message-ID: <202512250519.kVECTQ1z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   eac9374c1d13f8d343094e7b0ceeafa4b833993d
commit: f8bd6cf70dec3961c8b15b987866af33be2ce82b [1/1] ANDROID: GKI: Add module load time protected symbol lookup
config: arm-randconfig-003-20251225 (https://download.01.org/0day-ci/archive/20251225/202512250519.kVECTQ1z-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250519.kVECTQ1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250519.kVECTQ1z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:366:9: note: previous definition is here
     366 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/gki_module.c:35:6: warning: no previous prototype for function 'gki_is_module_protected_symbol' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_symbol(const char *name)
         |      ^
   kernel/gki_module.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | bool gki_is_module_protected_symbol(const char *name)
         | ^
         | static 
>> kernel/gki_module.c:46:6: warning: no previous prototype for function 'gki_is_module_exported_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_exported_symbol(const char *name)
         |      ^
   kernel/gki_module.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | bool gki_is_module_exported_symbol(const char *name)
         | ^
         | static 
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/gki_is_module_protected_symbol +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_symbol - Is a symbol protected from unsigned module?
    32	 *
    33	 * @name:	Symbol being checked against protection from unsigned module
    34	 */
  > 35	bool gki_is_module_protected_symbol(const char *name)
    36	{
    37		return bsearch(name, gki_protected_symbols, NO_OF_PROTECTED_SYMBOLS,
    38			       MAX_PROTECTED_NAME_LEN, cmp_name) != NULL;
    39	}
    40	
    41	/**
    42	 * gki_is_module_exported_symbol - Is a symbol exported from a GKI module?
    43	 *
    44	 * @name:	Symbol being checked against exported symbols from GKI modules
    45	 */
  > 46	bool gki_is_module_exported_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
