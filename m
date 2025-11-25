Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304B216A956
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068071; cv=none; b=IoQPH0i+dXDHbY6skZ+pn/MHDnQVmUojSVSoXDpiVfJRZFqCZRCzgLphCvGeowCBa3La10LFSawavgq6V9+LmIDnazpJ0asA7bKPgAgrL9fWhrpWg7NE8wyYH2OhihDvLei0TQuZ+DhdKWjqUN8bwHPYAnlgyMzkL8xpPSW6BxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068071; c=relaxed/simple;
	bh=F5JrAk57BtjRmDi9Ujk5ohqVK8zDINe9KfRSuPzltZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tO2FogMoUHasOh4kj22Rmk1U54gNkXeYWRrH1bnjsfIKFr/IqfmoR9zPsJQsVji7ny0Ik59ic3lm4D4zyoyXiszcdL/yuKtcmAMR0zv0y7xsQ0GKdPph+0D10uEXI6Ox6QDZ16UT4e3lxzU1XYsXDyHg+DyvhsHNE0a16m4/6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/ujHud/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/ujHud/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764068070; x=1795604070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F5JrAk57BtjRmDi9Ujk5ohqVK8zDINe9KfRSuPzltZY=;
  b=N/ujHud/B/1c0q8ZxSa7aKqa9CBdK7wsoqIzXy3oVb2BpfZnFUGaxIv4
   +N4aZ1iIoY1Fy6HgKtCLTmV22qGHEEKzG/IbsNYn0/h7Q5DYyN796nEbC
   gjHAVT4OYEtUhCloPJWuOH1r8cR8xGQh0bnS+WbVqJKPcNmPCLXd/N5FV
   H6rxd2z9F6tbkgdaDXmuKIp4SPeU//c6dItbDrnaLVvCGtGxUbyEVFAF/
   4zKDjQUT4Pjm2EtXangcIrQtH7S4H8TY/XQMgbWa72yS3F+2ndeyN8zRE
   bisHLx29bhml8HKe0HCVq3vl9RCzuvja5eybN9ruWIz4qrJVQelpdxj5d
   A==;
X-CSE-ConnectionGUID: qsWeDgYVStmVC1R6BPMzoQ==
X-CSE-MsgGUID: ajIhck0ZTaussh3U8LgPsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76406630"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="76406630"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 02:54:29 -0800
X-CSE-ConnectionGUID: xn2/JTM3T8GoojRUpgjcZA==
X-CSE-MsgGUID: QBL+mKR5QD+kf46UyjT1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223579808"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2025 02:54:27 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNqgj-000000001eb-0AFV;
	Tue, 25 Nov 2025 10:54:25 +0000
Date: Tue, 25 Nov 2025 18:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1936/1936]
 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.o: warning: objtool:
 missing symbol for section .text
Message-ID: <202511251827.iPD7MiMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Naixin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4ffe43c9c280969676fa933f022ebf1a8aaebcdb
commit: d83c305cb9b2708b835a47c9ddcbcab97cf70c9f [1936/1936] Huawei BMA: Adding Huawei BMA driver: host_kbox_drv
config: x86_64-buildonly-randconfig-004-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251827.iPD7MiMU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251827.iPD7MiMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251827.iPD7MiMU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:42:6: warning: no previous prototype for function 'kbox_write_to_pci' [-Wmissing-prototypes]
      42 | void kbox_write_to_pci(void __iomem *dest, const void *src, int len,
         |      ^
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void kbox_write_to_pci(void __iomem *dest, const void *src, int len,
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:111:6: warning: no previous prototype for function 'kbox_read_from_pci' [-Wmissing-prototypes]
     111 | void kbox_read_from_pci(void *dest, void __iomem *src, int len,
         |      ^
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     111 | void kbox_read_from_pci(void *dest, void __iomem *src, int len,
         | ^
         | static 
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:172:6: warning: no previous prototype for function 'kbox_memset_pci' [-Wmissing-prototypes]
     172 | void kbox_memset_pci(void __iomem *dest, const char set_byte, int len,
         |      ^
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     172 | void kbox_memset_pci(void __iomem *dest, const char set_byte, int len,
         | ^
         | static 
   3 warnings generated.
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.o: warning: objtool: missing symbol for section .text
--
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_dump.c:35:19: warning: unused variable 'g_day_in_month' [-Wunused-const-variable]
      35 | static const char g_day_in_month[] = {
         |                   ^~~~~~~~~~~~~~
   1 warning generated.
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_dump.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_panic.o: warning: objtool: missing symbol for section .text
--
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_image.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
