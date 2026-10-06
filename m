Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A08236453
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 02:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253718; cv=none; b=iP+3rbEabKLChanMbm5+HP6KeNfGlo/GVnNDfYoevx1f+5qkYkSj47iqhU3whMLFBrJN2wisQ3IqFggQ350vYUOPaY6odBxsyUtGeT7AAf1y0a2HCd5ygkq8/V4ZJ+VJqNFiRyGF5WIUgR6sF9rE6PaSwldvJT2GTYVWb3bEBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253718; c=relaxed/simple;
	bh=U+taHVkvcFiGZht8/KeGpMDIXy8+GujWyVT2DZiz5gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ShCds9RQR+uMvwmfopzvP4I8ToLZYfSLlUffr7Sp/Mn1fSMMU8Ey896z9cLrXC35RhW7XeIF+v00sixdE+WO4NRs+68f0+F6HIfY39yvszeP8BRkLZuaNZJ6T5tsIwx+shz88hA3Czn+LqxnDOSQKtFDjxJzA8wxhS56rVcH1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuof16x7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuof16x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791253716; x=1822789716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+taHVkvcFiGZht8/KeGpMDIXy8+GujWyVT2DZiz5gQ=;
  b=kuof16x79RObuFNKT5zZ7tY/HI3Wu4yo5hMwwWIUj+Wdg8nRNnlxUeUj
   JjPhKK35nPAB0PZuyEA44hDwULbxIG0FDv51M68kt8p2ISIr187JT7ZsN
   /xNVc1IghDEfWu+b3tDbSL8e3FDjv5PmAN9CnlDW5z8Wo7N3F0Tqtb9cm
   6v8Ood8O9la06VJfHEJFb9XS5xpATZZFAhW/gcucfrjeKrhizlGI3xaOe
   SV9SUCi3xftFEkTwJM2M5Y7jYrMfcuBaPttqpX+hSjieRfe3kx808Uojk
   MSGv/OZ7mRxqUPHGUyVizz7MSxzdp8uM+4UKjQL2pwas66y3VrKfo06kM
   g==;
X-CSE-ConnectionGUID: qEfaK7cWS7Gf/axIQtTfRA==
X-CSE-MsgGUID: Ksdj40fpSeiA+Lc0jCFk+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90996482"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="90996482"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 19:28:36 -0700
X-CSE-ConnectionGUID: HDeY+mL8SHenPdktxh0rlA==
X-CSE-MsgGUID: EKTTUCtzTZmbsO2M/v4hSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280726152"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2026 19:28:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDuut-0000000014O-29D3;
	Tue, 06 Oct 2026 02:28:31 +0000
Date: Tue, 06 Oct 2026 10:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 10/10]
 =?us-ascii?Q?drivers/accel/habanalabs/goya/../common/../include/hw=5Fip?=
 =?us-ascii?Q?/mmu/mmu=5Fgeneral.h:17:9:?= warning: 'PAGE_SIZE_4KB' macro
 redefined
Message-ID: <202610061021.0BNey2iw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   691ade648ef6da4e746c0857a492d9b9cc1a5780
commit: 04fec2a54c421adc87f0b57f4d1ade2397f8f4ec [10/10] ANDROID: P3S: mm: Add per-MM page shift field and query APIs
config: x86_64-randconfig-1007-20261005 (https://download.01.org/0day-ci/archive/20261006/202610061021.0BNey2iw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061021.0BNey2iw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061021.0BNey2iw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/accel/habanalabs/goya/goya_security.c:8:
   In file included from drivers/accel/habanalabs/goya/goyaP.h:13:
   In file included from drivers/accel/habanalabs/goya/../common/habanalabs.h:13:
>> drivers/accel/habanalabs/goya/../common/../include/hw_ip/mmu/mmu_general.h:17:9: warning: 'PAGE_SIZE_4KB' macro redefined [-Wmacro-redefined]
      17 | #define PAGE_SIZE_4KB                   _BITUL(PAGE_SHIFT_4KB)
         |         ^
   include/linux/p3s/const.h:13:9: note: previous definition is here
      13 | #define PAGE_SIZE_4KB            (_AC(1, UL) << PAGE_SHIFT_4KB)
         |         ^
   1 warning generated.
--
   In file included from drivers/accel/habanalabs/common/decoder.c:8:
   In file included from drivers/accel/habanalabs/common/habanalabs.h:13:
>> drivers/accel/habanalabs/common/../include/hw_ip/mmu/mmu_general.h:17:9: warning: 'PAGE_SIZE_4KB' macro redefined [-Wmacro-redefined]
      17 | #define PAGE_SIZE_4KB                   _BITUL(PAGE_SHIFT_4KB)
         |         ^
   include/linux/p3s/const.h:13:9: note: previous definition is here
      13 | #define PAGE_SIZE_4KB            (_AC(1, UL) << PAGE_SHIFT_4KB)
         |         ^
   1 warning generated.
--
   In file included from drivers/accel/habanalabs/common/mmu/mmu_v2.c:8:
   In file included from drivers/accel/habanalabs/common/mmu/../habanalabs.h:13:
>> drivers/accel/habanalabs/common/mmu/../../include/hw_ip/mmu/mmu_general.h:17:9: warning: 'PAGE_SIZE_4KB' macro redefined [-Wmacro-redefined]
      17 | #define PAGE_SIZE_4KB                   _BITUL(PAGE_SHIFT_4KB)
         |         ^
   include/linux/p3s/const.h:13:9: note: previous definition is here
      13 | #define PAGE_SIZE_4KB            (_AC(1, UL) << PAGE_SHIFT_4KB)
         |         ^
   1 warning generated.
--
   In file included from drivers/accel/habanalabs/gaudi/gaudi_security.c:8:
   In file included from drivers/accel/habanalabs/gaudi/gaudiP.h:12:
   In file included from drivers/accel/habanalabs/gaudi/../common/habanalabs.h:13:
>> drivers/accel/habanalabs/gaudi/../common/../include/hw_ip/mmu/mmu_general.h:17:9: warning: 'PAGE_SIZE_4KB' macro redefined [-Wmacro-redefined]
      17 | #define PAGE_SIZE_4KB                   _BITUL(PAGE_SHIFT_4KB)
         |         ^
   include/linux/p3s/const.h:13:9: note: previous definition is here
      13 | #define PAGE_SIZE_4KB            (_AC(1, UL) << PAGE_SHIFT_4KB)
         |         ^
   1 warning generated.
--
   In file included from drivers/accel/habanalabs/gaudi2/gaudi2.c:8:
   In file included from drivers/accel/habanalabs/gaudi2/gaudi2P.h:12:
   In file included from drivers/accel/habanalabs/gaudi2/../common/habanalabs.h:13:
>> drivers/accel/habanalabs/gaudi2/../common/../include/hw_ip/mmu/mmu_general.h:17:9: warning: 'PAGE_SIZE_4KB' macro redefined [-Wmacro-redefined]
      17 | #define PAGE_SIZE_4KB                   _BITUL(PAGE_SHIFT_4KB)
         |         ^
   include/linux/p3s/const.h:13:9: note: previous definition is here
      13 | #define PAGE_SIZE_4KB            (_AC(1, UL) << PAGE_SHIFT_4KB)
         |         ^
   1 warning generated.
--
   In file included from drivers/accel/habanalabs/common/pci/pci.c:8:
   In file included from drivers/accel/habanalabs/common/pci/../habanalabs.h:13:
>> drivers/accel/habanalabs/common/pci/../../include/hw_ip/mmu/mmu_general.h:17:9: warning: 'PAGE_SIZE_4KB' macro redefined [-Wmacro-redefined]
      17 | #define PAGE_SIZE_4KB                   _BITUL(PAGE_SHIFT_4KB)
         |         ^
   include/linux/p3s/const.h:13:9: note: previous definition is here
      13 | #define PAGE_SIZE_4KB            (_AC(1, UL) << PAGE_SHIFT_4KB)
         |         ^
   1 warning generated.


vim +/PAGE_SIZE_4KB +17 drivers/accel/habanalabs/goya/../common/../include/hw_ip/mmu/mmu_general.h

0feaf86d4e69507 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Omer Shpigelman 2019-02-16  10  
0feaf86d4e69507 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Omer Shpigelman 2019-02-16  11  #define PAGE_SHIFT_4KB			12
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  12  #define PAGE_SHIFT_64KB			16
0feaf86d4e69507 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Omer Shpigelman 2019-02-16  13  #define PAGE_SHIFT_2MB			21
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  14  #define PAGE_SHIFT_16MB			24
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  15  #define PAGE_SHIFT_64MB			26
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  16  #define PAGE_SHIFT_1GB			30
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24 @17  #define PAGE_SIZE_4KB			_BITUL(PAGE_SHIFT_4KB)
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  18  #define PAGE_SIZE_64KB			_BITUL(PAGE_SHIFT_64KB)
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  19  #define PAGE_SIZE_2MB			_BITUL(PAGE_SHIFT_2MB)
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  20  #define PAGE_SIZE_16MB			_BITUL(PAGE_SHIFT_16MB)
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  21  #define PAGE_SIZE_64MB			_BITUL(PAGE_SHIFT_64MB)
01d9ccf8657b549 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Oded Gabbay     2022-06-24  22  #define PAGE_SIZE_1GB			_BITUL(PAGE_SHIFT_1GB)
0feaf86d4e69507 drivers/misc/habanalabs/include/hw_ip/mmu/mmu_general.h Omer Shpigelman 2019-02-16  23  

:::::: The code at line 17 was first introduced by commit
:::::: 01d9ccf8657b54960862fb9db4bab5f73c766b47 habanalabs/gaudi2: add asic registers header files

:::::: TO: Oded Gabbay <ogabbay@kernel.org>
:::::: CC: Oded Gabbay <ogabbay@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
