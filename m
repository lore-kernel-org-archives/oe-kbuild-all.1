Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71FCEC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgvUuZAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705141125; x=1736677125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4w8H+23iObX54Z7B+cVilN7dXNAboXMVnRYVy94RTr4=;
  b=IgvUuZAzo2jEYgK+RkhbLsbd/28ERZVLHZVbrSrYfwiksCxOt/EKr7x4
   KHEgoNIZGt1caQYH6DmEkaCXFLOtf6Z2EisFMI6pAp6gORvACpZgMbpnw
   Y9yjLAJ8oe5PVQOq0KavJengb9DqCFXXFJf3Vs83fKerP8Dst640YLTaC
   UnoL7Mnsyembd1NfDAVCmaI9n/31Rzbiat3+eGVuzMK2rEKV5t2jLO2VW
   DJjiiYi1W87szy5KWGYwSVD783trBC5vPgLkH3AnCKgkc2AXB+01l0Rpo
   tTGOW+4qYy6aHlk16kI1Nz2bXfpL9/xS8ZMPTu+KAcVyxhMaVqAM69OI4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="430540078"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="430540078"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 02:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="786609023"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="786609023"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2024 02:18:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOb69-000ALU-1R;
	Sat, 13 Jan 2024 10:18:41 +0000
Date: Sat, 13 Jan 2024 18:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 9950/17888] /usr/bin/ld:
 i2c-flexio.c:undefined reference to `flexio_writel'
Message-ID: <202401131804.0I5YH60a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 16b65085d4d93242942e510c861a445167acc4e6 [9950/17888] LF-8343-2: driver: i2c: buses: flexio: rework to use mfd
config: um-randconfig-002-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131804.0I5YH60a-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131804.0I5YH60a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131804.0I5YH60a-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: certs/system_certificates.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/i2c/busses/i2c-flexio.o: in function `i2c_master_enable_ack':
   i2c-flexio.c:(.text+0x40): undefined reference to `flexio_readl'
>> /usr/bin/ld: i2c-flexio.c:(.text+0x60): undefined reference to `flexio_writel'
   /usr/bin/ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x192): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x1cf): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x211): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x259): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x277): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x2c5): undefined reference to `flexio_writel'
>> /usr/bin/ld: i2c-flexio.c:(.text+0x2fa): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x317): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x34c): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x3a4): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x3c4): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x3f1): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x417): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x42f): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x488): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x492): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x4b4): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x4cb): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x520): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x52f): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x53a): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x549): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x582): undefined reference to `flexio_readl'
   /usr/bin/ld: i2c-flexio.c:(.text+0x593): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x59d): undefined reference to `flexio_writel'
   /usr/bin/ld: i2c-flexio.c:(.text+0x5b7): undefined reference to `flexio_writel'
>> collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
