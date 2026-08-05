Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BF184524
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785900454; cv=none; b=sA5fUrlM9eVbQQ6o613YavqUoaG2OTRltRl6GncmQKvrg2hMBPt4EgH+tRX066Z1lHWZmPjXIh+qve3kU/ACCJfySq0YAkC9CpQeXy600aGhOvK05w9UtSTU3x2zzbIorcSoEWT9dc9XQ90Nq9e4JF9ApygfQGn382Nznbey8xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785900454; c=relaxed/simple;
	bh=jB7gpKsIiXBQdaZsBjW0AvC/MLNrgg0W03SL55JLxa8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f98P3pX5nVDgrkDT5r+8zUpnIcNxIhjjIOy8G+wX7l4+BBvm0iBE9yMc3mlMd3Bge4IeEY8Zjukij4SO+XzptRXzSfXw2jtMZtvyzpYffCdEgjteXYTTyLaVU0QUk36PPxVhrR0VW6y6xNd7PODBGsrp8WUKOGwvY4+4dcjO0SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyrnnbpR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyrnnbpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785900452; x=1817436452;
  h=date:from:to:cc:subject:message-id;
  bh=jB7gpKsIiXBQdaZsBjW0AvC/MLNrgg0W03SL55JLxa8=;
  b=KyrnnbpR4NcsIyo3JBFCHS4rSpvPI6OA4tzUTwfXfKc8vvz50bB5LiIH
   dGwOVN0nVrFXr9tcsopOwpwwYD4qstDIpQosyxwYJB3LWkaTPL/wN7xFF
   3jmiNdtxpERAgaPqabwI6lASjflgwSWndbBZGqZJwjILOUXmIrii7Fmm+
   4wLh7YfXLAFWYBhlrVdxUHhaOhmEiyQqpKEnstJK4YH5UUh/ycnFHdiRU
   sV9D6EROHsOeOZELJunJrUqRtfIJFo1iaAqU4jb9nXDA8Bm5ju+ZEb1xx
   dkrxwqXRRk9Tlf+RK0aG51d4CDptuHSvKbqyi7HTHYQyuV/bzlCeA80n3
   A==;
X-CSE-ConnectionGUID: 6KkEbGGqTLSG19/22VbnRQ==
X-CSE-MsgGUID: MlveN4mGSF2SAc5mUPEW+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86343897"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86343897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:27:30 -0700
X-CSE-ConnectionGUID: stj47YRBT4O1Z7q3dG+Xtg==
X-CSE-MsgGUID: KPx2r4QQQ6CZITRYg/54Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="286330802"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2026 20:27:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrSHu-00000000BMv-357A;
	Wed, 05 Aug 2026 03:27:26 +0000
Date: Wed, 05 Aug 2026 11:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 kernel/gki_module.c:31:6: warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202608051115.B3MOYJwI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   9ed6d24476a19dbfb33c7d2b53c623b054bb285f
commit: e7451150cb701de01d6b836c496e1bd012d885cd [0/1] ANDROID: GKI: Add module load time symbol protection
config: x86_64-buildonly-randconfig-002-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051115.B3MOYJwI-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051115.B3MOYJwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051115.B3MOYJwI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:356:9: note: previous definition is here
     356 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> kernel/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
