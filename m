Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCBC2FFFB3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663336; cv=none; b=urbF6Ur3AFZ6IOnJjTomuwmdTKXOV35Vnm3Xk0fAo40tpRNpF5DWOn5jpqXyGTP3gOrnLp5XPHE7mndwhssq6UX1bK9QK37/Mt1RN/iNka4S3dVX1EUnyKcHBpe7pUchpPa/1XCUj4TWLTAfguARgqTuvije3bGQBcLah69D6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663336; c=relaxed/simple;
	bh=eO0PoFfxdDvwPN8H883DxVff+vw9lQPiJvgdWWRnv4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxefPzL4qt2fsoA1+38cdf4A5IdI1lDCvQHAw28RR6N+Px2zcE0pi8WEM7RcesfIzuBvSaaxJVRBjX7HQKbWASY+xQYkJGqLphIpY65V/vhq520XUPrGjX85Tf5epfDf3FuVFPhuKN0BmAS9qDZ99DK+OdXrV1Egw2iMJh5SHsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuXrLM3B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuXrLM3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764663335; x=1796199335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eO0PoFfxdDvwPN8H883DxVff+vw9lQPiJvgdWWRnv4I=;
  b=TuXrLM3B0UYEfnBvIb+mSUXtxMAICzYg7GVzVHm5ilgjcG0D6z+uzHO1
   a12/DSDm6ibfhB0xD/ZqOJIgqfPEk0sp+KUxpncudXAoyClcxwVpi+pps
   ts2YrcoDfrbQ65TMpbYhVr6wpEywUcK6zMdBV9264v9WdDPuuqAnMda/u
   Tsh4TOk3HvgAJM+6ksCc3+Eqxdr4CPUODzuLsjHvxaBcc8QlkGcOmf8fA
   9B2OmfEArjjvI+Gr31k5kNsayRZZk2qP917ipFuf46euPL7f6idZ5Po0f
   1iCNmBY8MoVoDFkLXsXRIDFROso9EoYt3IgsFJhT5CkgF/X6pBDLE2DXS
   Q==;
X-CSE-ConnectionGUID: SR2MiUiEQC2rpVMRfIAJKQ==
X-CSE-MsgGUID: x/kcwVuTRvqGu18bOYQ5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65623664"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="65623664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 00:15:34 -0800
X-CSE-ConnectionGUID: ut0eE3CURXmuswbrP7Hgtw==
X-CSE-MsgGUID: w4howBQNSKagAqXa5eAfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194526546"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2025 00:15:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQLXn-000000002qB-0cEm;
	Tue, 02 Dec 2025 08:15:31 +0000
Date: Tue, 2 Dec 2025 09:15:28 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [linux-next:master 12362/13055] include/vdso/bits.h:7:40: warning:
 left shift count >= width of type
Message-ID: <202512020956.Dnz8A2H0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 256a21743d911f94ce92fe28f793cd586f3860b2 [12362/13055] i3c: Add HDR API support
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20251202/202512020956.Dnz8A2H0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020956.Dnz8A2H0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020956.Dnz8A2H0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from drivers/i3c/device.c:8:
   drivers/i3c/device.c: In function 'i3c_device_get_supported_xfer_mode':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/i3c/device.c:272:68: note: in expansion of macro 'BIT'
     272 |         return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
         |                                                                    ^~~
--
   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from device.c:8:
   device.c: In function 'i3c_device_get_supported_xfer_mode':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   device.c:272:68: note: in expansion of macro 'BIT'
     272 |         return i3c_dev_get_master(dev->desc)->this->info.hdr_cap | BIT(I3C_SDR);
         |                                                                    ^~~


vim +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

:::::: The code at line 7 was first introduced by commit
:::::: 3945ff37d2f48d39fd1751d282c80176654049e4 linux/bits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
