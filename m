Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8536299922
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737433; cv=none; b=HH/yh1IUXZ/chBVm+QzjpUIU5pJPmuWVYWK1ETLzD42TPJIstKXn0TCyav0a4wBEdpmYF+efcerLLAwfsmT6Q1ru11N741JlU10+SrvokEsah8O0WSIehZ19KzYBrpk9nPVWNZZqzV6WviMC7SLfHKMPULtgElEbbSKKXdPAF8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737433; c=relaxed/simple;
	bh=zpKoGlD4kpFXFKoVzFaF0ZLuKYC8toTgJ3eLH7IrkEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iv3yZz2Yvq1SH7DNatH6Ou5Obf3n2CqoqmQvohlS5k2Xg7BLzRXA4iuG7SKXCIFDNFGmKdw8Pe2bDdjKFAbV4PkVdp1dzC/wjRcv8PtYYR2RbDIBVxpF0Ip3vnnbgn0GY3ectV3I5gQRIqwNvxgkVny8x1xnw8ZXtdR0V4/XfAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCGeOjng; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCGeOjng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772737432; x=1804273432;
  h=date:from:to:cc:subject:message-id;
  bh=zpKoGlD4kpFXFKoVzFaF0ZLuKYC8toTgJ3eLH7IrkEA=;
  b=JCGeOjngopwscxfcko7f4F9cNyT+C/A6pOLRlGVBc5O4Ds+jyl3hfxmY
   VIN+XUSZmOZG2n1dBaFirjeZP43hFkjnrdRu1TdG448RjI+RogRDI/IzB
   XZF9iSnzY1U6eGZ/nZo+PUsRj9mcedySeNxK2rQGIeMknPGgth/u6t7vd
   f9UxkXIjCpS4870BK3XKRP8XuB3G19p5HnWFV6/dtcxAdEQrzxRQiAg/F
   poqfyJowmAl74yhL0ecKBuCaq0FW7T/QRBL9QDeysTxKRzt5TdSlzr4xK
   H6MuQwzUyPt+NAM+N2AXWeMSrMTAatBpggKJ8E1Lvpl6Yp4yfdU8zqtfP
   Q==;
X-CSE-ConnectionGUID: eKVsSGhWSeyMAAanIlJC7A==
X-CSE-MsgGUID: nDEB0NJ0TgeE6gBKiWunjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73751568"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73751568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 11:03:51 -0800
X-CSE-ConnectionGUID: lDDBd9hTTSmq9y3D8fEttA==
X-CSE-MsgGUID: 1AK926zpQEqcmcWR/ti9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="249238389"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2026 11:03:49 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyDz7-0000000017m-2zPN;
	Thu, 05 Mar 2026 19:03:45 +0000
Date: Fri, 06 Mar 2026 03:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-laj 1/1]
 drivers/android/binder/rust_binderfs.c:51:6: sparse: sparse: symbol
 'rust_binder_devices_param' was not declared. Should it be static?
Message-ID: <202603060223.kR1T16th-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-laj
head:   93730e472d2b8958b634e40387e6de659bfbf270
commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 [1/1] rust_binder: add Rust Binder driver
config: x86_64-randconfig-r131-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060223.kR1T16th-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060223.kR1T16th-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060223.kR1T16th-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder/rust_binderfs.c:51:6: sparse: sparse: symbol 'rust_binder_devices_param' was not declared. Should it be static?

vim +/rust_binder_devices_param +51 drivers/android/binder/rust_binderfs.c

    50	
  > 51	char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
    52	module_param_named(rust_devices, rust_binder_devices_param, charp, 0444);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
