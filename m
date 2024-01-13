Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F26139
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 02:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RB4kTUG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705114543; x=1736650543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKi4u3i0sAQj/LBv/OFBFHY6oX263ag879o/zqg2yM8=;
  b=RB4kTUG0JvT17KcKybOLRwyjSomvkwfOXmQ+tFON69vaBVcZ4oQLGmci
   pvPoPpH9TZkmVMAglbd5Ef6f2QYvYEemT0zNk60nKD0iofni1kFHa1Jqf
   RA/4Xaf+tmS8D6jmSmmDFQpThTVENIvQETxlZYVuImuhSRAWUvjyzjn/q
   pyH1thQRLbpp8qVVopzcC93eYINJrfwcaqjDM5WFUDPT3NcYbqAROg+ZD
   H91qVtO9/S8gW03dmzlTlGL4+ortWcWN1o8TzUnwGmYxVk5TijtW4q5JM
   2+7wpZlN1XS4dwJHtOdsKZ5eJzyIOZKwrwfof8I+9BtIVBlOqlnE7OUn3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="399021328"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="399021328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 18:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="24918674"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2024 18:55:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOUBF-000A1A-2q;
	Sat, 13 Jan 2024 02:55:29 +0000
Date: Sat, 13 Jan 2024 10:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 9950/17888] ld: i2c-flexio.c:undefined
 reference to `flexio_readl'
Message-ID: <202401131033.glhCOjdn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Adrian,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 16b65085d4d93242942e510c861a445167acc4e6 [9950/17888] LF-8343-2: driver: i2c: buses: flexio: rework to use mfd
config: x86_64-buildonly-randconfig-001-20240113 (https://download.01.org/0day-ci/archive/20240113/202401131033.glhCOjdn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131033.glhCOjdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131033.glhCOjdn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x21a): undefined reference to `flexio_readl'
>> ld: i2c-flexio.c:(.text+0x25e): undefined reference to `flexio_readl'
>> ld: i2c-flexio.c:(.text+0x270): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x282): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x2ad): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x2f4): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x315): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x376): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x385): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x3c0): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x46d): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x4c6): undefined reference to `flexio_writel'
   ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0x513): more undefined references to `flexio_writel' follow
   ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x56e): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x599): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x5b9): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x5de): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x5f0): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x633): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x650): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x665): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x679): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x69d): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x6c7): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x712): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x724): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x731): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x743): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x75a): undefined reference to `flexio_readl'
   ld: i2c-flexio.c:(.text+0x76e): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x77d): undefined reference to `flexio_writel'
   ld: i2c-flexio.c:(.text+0x7a0): undefined reference to `flexio_writel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
