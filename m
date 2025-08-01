Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4A4A1E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754007892; cv=none; b=M93VSXL21wS5TrMYRLmIR3Guu6Z69bZt0Xd4nOIqe4Cjpnlcn5On6hGDoVJhxHJ8T1OD5Kw0P9GHvc2Pvn+8h+kgj6mENtelE0gIhqI9PlFiimJgZbxkJjkQT528x2e7IPe8e88ZstdVxWQeheWaHNwItkHM5l2mM8lHpNaP9cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754007892; c=relaxed/simple;
	bh=sATm3+MqtasP52vNaBhizu/pMxPfSG6mB2Q322fHd7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzFR0kTVGCTb/oXZ+z1W7nLqx1IOjPKsb7y0KARwTkJOQpymPTZL1oO/m/3fiL0aCyQRhI+3LvVqbfLs8Cj9mTiYYmP21LAVuZ1gfO9axzJwONWGIpIxKT6NeNQdtWDxanGwubPisbeSihmUTRvLvGVqlzpU+TqS7iZNNRW5v/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7dbDF7m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7dbDF7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754007891; x=1785543891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sATm3+MqtasP52vNaBhizu/pMxPfSG6mB2Q322fHd7Y=;
  b=R7dbDF7m9n8M1QtgbsBdkmqGsjtwn2S02FsXPvSo/ZamVbGptd/K6eE9
   FSUOsNA+9N4Mk2BuY+U/UpqlikFQRQYnV2AMWB3ZSkBbirzm9kJKrNj5f
   noCTkv7aWExHEo4W12FelnWpW37lXWGzHEA+q2rACru/cAt0vzWI2W7ar
   TIjB5FV72Y4bdspkiWSLtfNLp9hE0jCma998iLeU2ZZDpdpEGa2ZnbLwi
   ADG70Dez0BWpqIcaT5Vg1VUoa9ii07sBz6gnlZjuIAmfM62sazTjpPYlv
   PWItJzaQw8WcG+ucmdZCZ6YBQDf/jskQuQYZK8Dcqwj7vTBvpliPSt+1i
   A==;
X-CSE-ConnectionGUID: xYZK0eA5TRacA11KIebrmA==
X-CSE-MsgGUID: ELLlkKubS3+WThCwkLSVGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="73807837"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="73807837"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 17:24:51 -0700
X-CSE-ConnectionGUID: /cs/k7OdRkqHOLpeYebzzA==
X-CSE-MsgGUID: 1nmUyFdiS2a6C4V/NW2Ezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="194386809"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Jul 2025 17:24:50 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhdZm-0004F6-31;
	Fri, 01 Aug 2025 00:24:46 +0000
Date: Fri, 1 Aug 2025 08:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 12779/12926]
 drivers/i3c/master/../internals.h:53:9: error: passing 'const void *' to
 parameter of type 'void *' discards qualifiers
Message-ID: <202508010846.fwKbJz68-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84b92a499e7eca54ba1df6f6c6e01766025943f1
commit: c20d3fa7049144f519b21616e6020e6939822145 [12779/12926] i3c: master: cdns: Use i3c_writel_fifo() and i3c_readl_fifo()
config: sparc64-randconfig-r072-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010846.fwKbJz68-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010846.fwKbJz68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010846.fwKbJz68-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master/i3c-master-cdns.c:26:
>> drivers/i3c/master/../internals.h:53:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      53 |         readsl(addr, buf, nbytes / 4);
         |                ^~~~
   arch/sparc/include/asm/io_64.h:265:41: note: passing argument to parameter 'port' here
     265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
         |                                         ^
   1 error generated.


vim +53 drivers/i3c/master/../internals.h

733b439375b494 Jorge Marques 2025-06-24  43  
733b439375b494 Jorge Marques 2025-06-24  44  /**
733b439375b494 Jorge Marques 2025-06-24  45   * i3c_readl_fifo - Read data buffer from 32bit FIFO
733b439375b494 Jorge Marques 2025-06-24  46   * @addr: FIFO Address to read from
733b439375b494 Jorge Marques 2025-06-24  47   * @buf: Pointer to the buffer to store read bytes
733b439375b494 Jorge Marques 2025-06-24  48   * @nbytes: Number of bytes to read
733b439375b494 Jorge Marques 2025-06-24  49   */
733b439375b494 Jorge Marques 2025-06-24  50  static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
733b439375b494 Jorge Marques 2025-06-24  51  				  int nbytes)
733b439375b494 Jorge Marques 2025-06-24  52  {
733b439375b494 Jorge Marques 2025-06-24 @53  	readsl(addr, buf, nbytes / 4);
733b439375b494 Jorge Marques 2025-06-24  54  	if (nbytes & 3) {
733b439375b494 Jorge Marques 2025-06-24  55  		u32 tmp;
733b439375b494 Jorge Marques 2025-06-24  56  
733b439375b494 Jorge Marques 2025-06-24  57  		tmp = readl(addr);
733b439375b494 Jorge Marques 2025-06-24  58  		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
733b439375b494 Jorge Marques 2025-06-24  59  	}
733b439375b494 Jorge Marques 2025-06-24  60  }
733b439375b494 Jorge Marques 2025-06-24  61  

:::::: The code at line 53 was first introduced by commit
:::::: 733b439375b494e8a6950ab47d18a4b615b73cb3 i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()

:::::: TO: Jorge Marques <jorge.marques@analog.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
