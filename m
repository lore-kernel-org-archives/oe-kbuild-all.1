Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FEAF9F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FL+A1fHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704962977; x=1736498977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sl6L6aZHh/4Z4M+xJMi3Ko8EemZlCBRL69qF+YpXz3g=;
  b=FL+A1fHOPZpVfnfsX45lUqtILryUG/8FMtyhA+9cFL+279JKQVy5IjP5
   xH2QqBdn1ycL2DV4Fb90mZjYcBXBOwoSuNyJP/NGD45MknOlC3j2VcyIm
   xXi5LDrQuXnLkeXyAKat4MQ57GiXEvmz47g0X4gmDxBFD42kI6E6XyIsr
   gQlyiqmf5KlAY9J7rXW8EiU8Rn/BnFj2wP3I/NihZOZu+pPS2xt/VUNPg
   yI8aj7qZsRhQEuoxCmoVlGp345+0JFRknmSBKzmvRaaZJNUp7KvB/6DD8
   p2O605wh8qUvzfANJSCsnr6FV8CN2d/W5zqlv56ONuGglZzn2c0U1eodr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12140152"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="12140152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 00:49:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="24255465"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2024 00:49:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNqkj-00081u-22;
	Thu, 11 Jan 2024 08:49:29 +0000
Date: Thu, 11 Jan 2024 16:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 16609/25965]
 include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
Message-ID: <202401111609.uiwiw8AF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   739ec4a4b6eabaa64f85047f9a754787e3a9a3a0
commit: 2616a2072ce0737bbc1b9136056ad9d84991c0de [16609/25965] FROMGIT: arm64: io: Use asm-generic high level MMIO accessors
config: arm64-randconfig-r122-20240106 (https://download.01.org/0day-ci/archive/20240111/202401111609.uiwiw8AF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240111/202401111609.uiwiw8AF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111609.uiwiw8AF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
--
   drivers/i2c/busses/i2c-cadence.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
--
   drivers/i2c/busses/i2c-hix5hd2.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
--
   drivers/i2c/busses/i2c-qcom-geni.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
>> include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
--
   drivers/i2c/busses/i2c-omap.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16
   include/asm-generic/io.h:359:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:359:22: sparse:     expected unsigned short [usertype] val
   include/asm-generic/io.h:359:22: sparse:     got restricted __le16 [usertype]
>> include/asm-generic/io.h:312:15: sparse: sparse: cast to restricted __le16

vim +325 include/asm-generic/io.h

1c8d29696f0d79 Arnd Bergmann       2014-11-11  304  
1c8d29696f0d79 Arnd Bergmann       2014-11-11  305  #ifndef readw_relaxed
8875c55437617f Sinan Kaya          2018-04-06  306  #define readw_relaxed readw_relaxed
8875c55437617f Sinan Kaya          2018-04-06  307  static inline u16 readw_relaxed(const volatile void __iomem *addr)
8875c55437617f Sinan Kaya          2018-04-06  308  {
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  309  	u16 val;
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  310  
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  311  	log_read_mmio(16, addr, _THIS_IP_);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14 @312  	val = __le16_to_cpu(__raw_readw(addr));
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  313  	log_post_read_mmio(val, 16, addr, _THIS_IP_);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  314  	return val;
8875c55437617f Sinan Kaya          2018-04-06  315  }
1c8d29696f0d79 Arnd Bergmann       2014-11-11  316  #endif
1c8d29696f0d79 Arnd Bergmann       2014-11-11  317  
1c8d29696f0d79 Arnd Bergmann       2014-11-11  318  #ifndef readl_relaxed
8875c55437617f Sinan Kaya          2018-04-06  319  #define readl_relaxed readl_relaxed
8875c55437617f Sinan Kaya          2018-04-06  320  static inline u32 readl_relaxed(const volatile void __iomem *addr)
8875c55437617f Sinan Kaya          2018-04-06  321  {
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  322  	u32 val;
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  323  
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  324  	log_read_mmio(32, addr, _THIS_IP_);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14 @325  	val = __le32_to_cpu(__raw_readl(addr));
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  326  	log_post_read_mmio(val, 32, addr, _THIS_IP_);
4de51791002eb2 Vamsi Krishna Lanka 2022-01-14  327  	return val;
8875c55437617f Sinan Kaya          2018-04-06  328  }
1c8d29696f0d79 Arnd Bergmann       2014-11-11  329  #endif
1c8d29696f0d79 Arnd Bergmann       2014-11-11  330  

:::::: The code at line 325 was first introduced by commit
:::::: 4de51791002eb24ab7eab0f35b74c2bb9aed1b6f FROMLIST: asm-generic/io: Add logging support for MMIO accessors

:::::: TO: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
