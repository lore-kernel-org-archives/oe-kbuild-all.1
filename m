Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530515ECD7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 17:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765733919; cv=none; b=VRejD68Hj3CnIDpeKXHFTRslM7+pOJ9LymsxGmwRLZYD6ECFOvyVuaiJnL+vuEAhTvGVjoFTPGtD2XUAs3ml5tDgOoRUYjQPzCqpMss9I3eMlRD0fILyJE61toFzWlGKV+aYojZwKR2JAE216RZNHCrjUMiXWYrJljKF9M4d+ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765733919; c=relaxed/simple;
	bh=3clZs7KsxnjXFLrdpf2AEtbVOc0hiyMQ5HZ/Gtt7+FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTl4GExXpUmSv8mhFcLS2IsFyMY7o6Ay9gs5Dcu10tSas/cNKWoir5/bMqGvqdOoN1ESz+ElV5IVd+nmJO+GvPS8i7cDqVDZnoAUQnKNdS6WSosU9MIkay8VdUkqH3Gt/74+eAN3pSos5YNQs+Qazl0QqzINEKhj7deWQgvDL5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SX5PJHwL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SX5PJHwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765733918; x=1797269918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3clZs7KsxnjXFLrdpf2AEtbVOc0hiyMQ5HZ/Gtt7+FQ=;
  b=SX5PJHwLU/IlGMKgTVKvWes0pmpL1M4s/HKLT7hamlRzMwp21hc0Bmtj
   Ejx77duzKXDhwQl861bQZ6w42WHQQFQToZABTUlHR93yRf11wnC6uJVhD
   Os6Tbgm3VFRe7E8Qp+MkzFDsL1Wq1GNO5RPp+vHhHqQMOrFCg/YpnV5ZB
   wuCO43NzxTVRS/ia7MhN+sab2T59dlD9coGjOy8tUp3XHN0zwXMildqzs
   xI8gl4Nr5CMxbyVpX+l3EadIbKWmdI2Zs5LXoXXBtNBapQdcIrj/yp4/R
   hmOtVw7zjAOYUGYNC1R2txVF1fJifxfCgv0WN4sH6axi9uVc0ZqXmYsLg
   g==;
X-CSE-ConnectionGUID: oaj56U0oSbSnkGxLhe5lTQ==
X-CSE-MsgGUID: RpXgSondTSCrFuK3/tGLhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66831407"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66831407"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 09:38:37 -0800
X-CSE-ConnectionGUID: sKx59VvDQF6nCOEJA5qWGQ==
X-CSE-MsgGUID: kWqbUs92SmiubE+uHmpciA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228608423"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 09:38:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUq3F-000000009Er-1jaL;
	Sun, 14 Dec 2025 17:38:33 +0000
Date: Mon, 15 Dec 2025 01:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] error: unknown target ABI 'ilp32'
Message-ID: <202512150148.bF5oIxkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [3541/3541] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-r131-20251213 (https://download.01.org/0day-ci/archive/20251215/202512150148.bF5oIxkA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150148.bF5oIxkA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150148.bF5oIxkA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
>> error: unknown target ABI 'ilp32'
   make[3]: *** [scripts/Makefile.build:373: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.lds] Error 1
   clang: error: -Wl,-soname=linux-ilp32-vdso.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:84: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o] Error 1
>> error: unknown target ABI 'ilp32'
>> error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:87: arch/arm64/kernel/vdso-ilp32/note-ilp32.o] Error 1
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
