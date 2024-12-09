Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6881991BF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733782998; cv=none; b=VnZwPuB8VFPO5uaZNXGI6HAgY8WI+/a5RvDwK+3Hy6xUjYEtRpXW6pRlAqkZIr8GPZPWHLKQ/MBuSUZa9KMo6+URO4VgCUxVuc1roA3dL8rRgyovmAQXIe+sde25iLhdFqmj1s6CR+qMw4/ROUIcQ1/w+GTiTNOD+IGyg8ZySTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733782998; c=relaxed/simple;
	bh=F3hAJ7YKetk2L6EUofPdtV1oeCJ7UzL4rGiK4WbNHSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkLtdHDRPJzJ8mWNXSMvbzTMfUN9fZE/cUDKiswpFoPpjZi30S6wnoVtjkiP8pGzZj7Tibk4yUifLGKa1xoYRGiNMRRNztbYHluwMkbZgl+RGrq+7mvnxZ6hzy16Q3pCf+gFJ33P+q8ko5+8OHn3lF5U7rUU9OV6RA97m5BwgP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNJBWWOS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNJBWWOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733782996; x=1765318996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F3hAJ7YKetk2L6EUofPdtV1oeCJ7UzL4rGiK4WbNHSQ=;
  b=MNJBWWOS0cD3p9EZ/BqMwdCROXmX6BSj/fu0nufl9y6DMBNzIblHks1o
   AyN7PT35lvxNrsJRmtlAhfAbY5cVdiLP5NHunj3V+sLtKa/9yL2zGKF5o
   sIkn7NNQvnJODpXQuVoEoEV+ydwVjz8rdPnC3sfYTQnOnG5KIkEZt+N7w
   QHNrWs9TN5ynYCimiJboeBHTlpiGPEoDZkSJ9P0VVmCwkPuOdwpEFGx0X
   sHoA3EbX0ozD/QCvnEplVaWJoWa077MmJsaSqolydC/FwHc4j21b90mF8
   KLi1bExDvdmGW1ekcL26NbpXmytrsD3bJ5Yt0+KkwVGd2vrLeuBLvcUB6
   A==;
X-CSE-ConnectionGUID: cXt4K1SeReexJ918yNJtoQ==
X-CSE-MsgGUID: UZTTdR/ZS/K8Nz6A0PbF4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34161787"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34161787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 14:23:16 -0800
X-CSE-ConnectionGUID: olhngD9HRqSxlbv86JtmAA==
X-CSE-MsgGUID: 6pbbohthTDeUfCfbIT3vvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95689416"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Dec 2024 14:23:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKm9o-0004rZ-2K;
	Mon, 09 Dec 2024 22:23:12 +0000
Date: Tue, 10 Dec 2024 06:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2568/2568] ld.lld: error: version script
 assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed:
 symbol not defined
Message-ID: <202412100625.1CDZ0rpT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fbaada49082c23aa4e4ed43386a1ad4a457a0354
commit: 5476cb89ef2297bd36f8b38e27b54617b6f63236 [2568/2568] x86/vdso: Implement a vDSO for Intel SGX enclave call
config: x86_64-buildonly-randconfig-005-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100625.1CDZ0rpT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100625.1CDZ0rpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100625.1CDZ0rpT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_sgx_enter_enclave' failed: symbol not defined
   llvm-objdump: error: 'arch/x86/entry/vdso/vdso64.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
