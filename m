Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D882374E48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 20:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786653263; cv=none; b=JjQM6p2uqMDVYgF2TbaXwqRX+7rFx6sGbnhkYacTvAroFx1Xd+CKGBkWFprLDr9Ewt6iZIgiKqqmLojHG0aEP6cCkN5fxrqCYblDbbyZBgErwMCU+TX3REIR7YxRtWNQnYKQ/ll30IMiFXjy9YI5GbRG2x9PRKT43b7eI18JQcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786653263; c=relaxed/simple;
	bh=6+Bwgtm0CRRK41ZlSdv5Wm8xh2VSmet+2rrDsqzxDdc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yy/81qvOtoqfd0UviDI5KEJ0I5/SDQgj7NNlzdIthg89zBDbJ3KXBMUHCdl2XTRBVfCXDVyQ7YFWmNDXoq3X5i/BYoB/MjZWGC2kdSqwLay36rlYKq4lDEbZjp1NMA9hqgs5jDmN+nNtaj9MayZQWZrHsQv37unZUjKjyHVTwG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3tVNoG0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3tVNoG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786653261; x=1818189261;
  h=date:from:to:cc:subject:message-id;
  bh=6+Bwgtm0CRRK41ZlSdv5Wm8xh2VSmet+2rrDsqzxDdc=;
  b=j3tVNoG0S93WpNxPgvmMkqkx4rJmVe0zXrM3hSCsP5tZhs9Ce6LbHAjm
   DaStLrfOS3a4Cb/LZJwfANdJNC565WMYRWYyOHUEzCFsS5nbVTUu5/zS9
   lNsR0+QcECf07L0GJi7fBIcLeZgT7/gN1pLodz7errU/9CsNPKFXLFuLA
   9MPlcejhUiKouuxUMjxwKobwMgirNPaDtpnHEQoZ/R37A97thH/3Kv/NU
   ngtRQQ8a51FUyukXD99f69cLDuFwkSdkJKjK2h8jKD7doNjaK4ztQEFj0
   2d7Cc2gynHzmaybeUWtBltLcGNcQAmQ13SHg95DvClYJUfkOveRSQuQXN
   g==;
X-CSE-ConnectionGUID: lzAleb+PQfiCtR2D5MnY+Q==
X-CSE-MsgGUID: 7oGicoEwQrC/cj3WBfnDbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="110022766"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="110022766"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:34:20 -0700
X-CSE-ConnectionGUID: 9aYhnaf+RBO15+Qz4mBhYg==
X-CSE-MsgGUID: NB1mwcR5Q6GT4kxTxmZCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="259788491"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Aug 2026 13:34:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuc80-00000000WXa-3tKZ;
	Thu, 13 Aug 2026 20:34:16 +0000
Date: Fri, 14 Aug 2026 04:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 36/36]
 arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x4b: unreachable
 instruction
Message-ID: <202608140448.6q6OWojV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   3b83adad5dbcce249f6042cc64bf4ae9fddf5262
commit: 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee [36/36] x86: Mark stop_this_cpu() __noreturn
config: x86_64-randconfig-014-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140448.6q6OWojV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6ea395e4fe4db26920d57779ddae98eac6ba945d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140448.6q6OWojV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140448.6q6OWojV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x4b: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
