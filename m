Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86523815F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 03:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529275; cv=none; b=oH5X/Z0hAbnCfIM3fCktfVUt/eF2UsBYR8vOFFIgQzuJh7GdqT62LLvtjmN04gja36glbg9kZqOfnAEmuJbCqMygwVyBsZD+0B3+2TBpWNo7ojhvGUUBujqwmoruYF1E3RueYQ2+U5IGLjaaoOc/wlSLWnIv1AqdouvcE6P4bCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529275; c=relaxed/simple;
	bh=njiAyGaS474k+TJa77v5FRdw2E0eI3/REIxTKflUl44=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KI5VhlAxdddt6rn+C+36vcD4rwL49ilNXPZi6KiMGI4xK3ciZbry1Iwlg6YYDw37+x2nmNW7JfpJS6U0M0XU0hIV0/gHMHMTX3qS5q9J119fC/KeTnoS6Am+xHm6yHdLpP4POwQR08i7ezgsNcF9cEbOLNz8+C8vMRi5tNYQ530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjf1YT7O; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjf1YT7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789529273; x=1821065273;
  h=date:from:to:cc:subject:message-id;
  bh=njiAyGaS474k+TJa77v5FRdw2E0eI3/REIxTKflUl44=;
  b=jjf1YT7OmCic1HwV0Lb07OQxkgJim0IZzPWD0sqVfq8vBd5Ia/QlD89u
   9j8w9x+QUr9d0Sc36yoMRe+1C9OyXV0OSl/mavbYviGRcDogJ6Ntf6c9N
   B2tKLuwdp6gNTjut5l8rhkoe4q+Fu7xLPN09b7JcFPbw5hLKq8y/XnvIM
   eKyOviqHDJifHJtq0Wufhm5EajIvTA/X98I+ZeCZ4JyaZIB5hyVsU1Rym
   B85FV6PH6kIjphDdoqahLWZg2Lhe5YzRqwj4uIGOu5PAm0SCyUwI+Jo79
   t+CGNCxwJeG3LPN4ZaiCR9Xfl/CudzirDs4va0mn1gAyLuKHxeIbe2DD9
   Q==;
X-CSE-ConnectionGUID: Ogb1YwppSPKsZoWFqHZV3w==
X-CSE-MsgGUID: i8/tNyiJRi+Otrx0IZVUPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112670947"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112670947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 20:27:53 -0700
X-CSE-ConnectionGUID: FSA/lfcOS06f8BFYCGfqCA==
X-CSE-MsgGUID: +pKYCdYcRMm7JfAH5jbqgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271422662"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Sep 2026 20:27:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6gJJ-000000005Sb-1Km3;
	Wed, 16 Sep 2026 03:27:49 +0000
Date: Wed, 16 Sep 2026 11:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-tdx-efistub 1/3] tdx-shared.c:undefined reference
 to `__fortify_panic'
Message-ID: <202609161131.AUTN2fQJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-tdx-efistub
head:   dbd995955d7cd3afb151e05449c3571295cdef92
commit: 43b4de908d8dc65b83348c0041d879c420ed0536 [1/3] x86/tdx: Share tdx_panic() with the EFI stub
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260916/202609161131.AUTN2fQJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609161131.AUTN2fQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609161131.AUTN2fQJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/boot/compressed/tdx-shared.o: in function `tdx_panic.cold':
>> tdx-shared.c:(.text.unlikely+0x9): undefined reference to `__fortify_panic'
>> ld: tdx-shared.c:(.text.unlikely+0x18): undefined reference to `__fortify_panic'
   ld: arch/x86/boot/compressed/vmlinux: hidden symbol `__SCK__WARN_trap' isn't defined
   ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
