Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC91DED5B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184632; cv=none; b=gs4FT80DDTHvlkO4YpnX/seE1rHWkVm8Iuvn+GeCKq9aas9BV70s/D0yX2kGD4uQmsxLxopnJ9OVLirAfXGHuVruL1xlBK2zvFSACoubBYtPB12nySlf4k7h9/V8YTKckEWN7kExWsZetTwbFVdMFccCmyJWRkL5tV2O0yMORis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184632; c=relaxed/simple;
	bh=vYdCtrpTRun4aPznadKbcXoijDS9Uc18WRGRWRjFMLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LvO2LO02WP+EfHhnsFqHwPX0rEeOGYdpj4A+ZbeCQm94OaieT+Zzt+zp1I3naJTDPE4XOwhrCNFNkc7R1gYYZJ2Rxn8D7j5lO2KFcmSJIumZ68rlMXb8tMFcDXY/wZeP5LRcU2x5Gue+L3KjtJcu77GrVUj+ygX5Jfl+LLaCKpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTlEae+A; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTlEae+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743184630; x=1774720630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYdCtrpTRun4aPznadKbcXoijDS9Uc18WRGRWRjFMLc=;
  b=BTlEae+AwPiZf8qEhwT1GNPU9EEaK3gZRM0gFmz54hkaNL1/lfbELvq7
   KdSS74/JaTuLTZ1RP+qzhQeqxQ2y2Pv25eT43lxjMDMUoMDBtb5dmCcBQ
   r52kGBfQxVs0IxYgN+lkWOJP9umS7uJuTZgfgN4cPzNGkzokGv9Kn0uMG
   77SimAC3tEbotdc3malL30Um8O3SxJA1ILIQ6REwue6yioQo1SHt+bqKn
   K/IZl/A2O69rkMzL0bO6sLJ1XIIlXTia2+wMGroY89E0E1ZK9quto2c/J
   icON9hVylFBFqnO2w//xwYdWHOP9oy04UyvEefEulva+eeBuEdHlCMR4k
   Q==;
X-CSE-ConnectionGUID: e8gFB08QSz6Qtw5sc/ytYg==
X-CSE-MsgGUID: 65PGIoA1RvCaZg0/4Ld6pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48337670"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="48337670"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 10:57:09 -0700
X-CSE-ConnectionGUID: UOnSdfpnRYe4x5sbc/Szjw==
X-CSE-MsgGUID: lvItsPvLTcq/9BBy41NWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="130614439"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2025 10:57:07 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyDx3-0007cA-1f;
	Fri, 28 Mar 2025 17:57:05 +0000
Date: Sat, 29 Mar 2025 01:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1528/1528] drivers/fpga/dfl.o: warning:
 objtool: build_info_commit_dev()+0x5b: unreachable instruction
Message-ID: <202503290119.FlNWiz0A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Scott,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4d1e247486ffeef035a5a55a97f2659f68177357
commit: 99e28159a079ea6af5a5b789e83b68240d67f9ff [1528/1528] fpga: dfl: Add lockdep classes for pdata->lock
config: x86_64-buildonly-randconfig-006-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290119.FlNWiz0A-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290119.FlNWiz0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290119.FlNWiz0A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/fpga/dfl.c:57: warning: cannot understand function prototype: 'struct dfl_dev_info '
   drivers/fpga/dfl.c:77: warning: cannot understand function prototype: 'struct dfl_chardev_info '
>> drivers/fpga/dfl.o: warning: objtool: build_info_commit_dev()+0x5b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
