Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72413B1AF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727522597; cv=none; b=R6dRttGqQ0y+aAYkd1CU9gTEYQrac/SJHIsHisPuOBM+ptPn2bPiQHkXTxz9xMcqAWMaR6HHeysEvDpZE63hnk/MxjXUHdjFEew3Q//ov7BhpsEmckofyH6OKoKbHfWxk28n1nvmwSt/5mtEbEzIMMR3dV4UT7lrv7twTiJEhvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727522597; c=relaxed/simple;
	bh=ctAasv1NqvAMS433XojBANkSZ8sNrx6yXMbvGEwhk/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPXMVJozZXe0vC2RLS8bQlIuVHbXCGaAN5mxyB68DZ6HRdYtKtR6FaJcWjPRX71Q7kHpbGqQXXNiaCMPPmraqgsiW5JmjrUHiIMY3hbuPyuLhSwyOx0MRdze/3ZILNXdTzeTMDTeeacHaH1vbpJTdagat+UJG6XfAk+9jlPNAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqoljGpF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqoljGpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727522594; x=1759058594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctAasv1NqvAMS433XojBANkSZ8sNrx6yXMbvGEwhk/U=;
  b=kqoljGpFq1LXX5Zd18L38wQ30xYgpoX1vmqD31yPt4pyyxX6y2kSUY7g
   vdfTW5vtCpvNqX5gxfMKM7ayizdVzN2IUddczvcb7+h4ztImWsS329208
   aBtFhAtmICWBXqu6XpNwmpoF/rtC72MWw+k+XNuZ8RowhsldIdqFJKcEZ
   3B5bT5L81FFOP/5iyH2KK6mx9Yb9g/gO4VNuVcrvo0/XJi+QkmfIG9K/s
   zIWWJCEtWYNUNy2XEwqaStKnLkVSd3gGxVkX9aTdW1cmY8Nckhc9tJUSA
   F80egfvHaEcaB6jp+2ipN57vFGepFKK68+M1vCmwjNLojmdiE2S7oU3Os
   Q==;
X-CSE-ConnectionGUID: wNFFeUPdQACALKj2F7ccAg==
X-CSE-MsgGUID: oMaBCwlrSiSPiwut8YBubg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26794065"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26794065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:23:14 -0700
X-CSE-ConnectionGUID: wl1/2Yd2SIG0J+fkr0Rogg==
X-CSE-MsgGUID: 0WbRMowZS4SxQTqZcOYyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72368752"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 04:23:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVXa-000ND8-2w;
	Sat, 28 Sep 2024 11:23:10 +0000
Date: Sat, 28 Sep 2024 19:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2665/16788] i2c-flexio.c:(.text+0xe0):
 relocation truncated to fit: R_NIOS2_CALL26 against `flexio_sw_reset'
Message-ID: <202409281949.s01Y5fYt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 28f7ee66a10609525341c91f1aef06e8548f994f [2665/16788] LF-8343-2: driver: i2c: buses: flexio: rework to use mfd
config: nios2-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281949.s01Y5fYt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281949.s01Y5fYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281949.s01Y5fYt-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_init_hardware':
   i2c-flexio.c:(.text+0xe0): undefined reference to `flexio_sw_reset'
>> i2c-flexio.c:(.text+0xe0): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_sw_reset'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x104): undefined reference to `flexio_setup_shiftcfg'
>> i2c-flexio.c:(.text+0x104): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_setup_shiftcfg'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x138): undefined reference to `flexio_setup_shiftctl'
>> i2c-flexio.c:(.text+0x138): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_setup_shiftctl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x154): undefined reference to `flexio_setup_shiftcfg'
   i2c-flexio.c:(.text+0x154): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_setup_shiftcfg'
   nios2-linux-ld: i2c-flexio.c:(.text+0x184): undefined reference to `flexio_setup_shiftctl'
   i2c-flexio.c:(.text+0x184): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_setup_shiftctl'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x1ac): undefined reference to `flexio_setup_timercfg'
>> i2c-flexio.c:(.text+0x1ac): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_setup_timercfg'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x1cc): undefined reference to `flexio_writel'
>> i2c-flexio.c:(.text+0x1cc): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_writel'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x208): undefined reference to `flexio_setup_timerctl'
>> i2c-flexio.c:(.text+0x208): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_setup_timerctl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x230): undefined reference to `flexio_setup_timercfg'
   i2c-flexio.c:(.text+0x230): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_setup_timercfg'
   nios2-linux-ld: i2c-flexio.c:(.text+0x240): undefined reference to `flexio_writel'
   i2c-flexio.c:(.text+0x240): relocation truncated to fit: R_NIOS2_CALL26 against `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x27c): undefined reference to `flexio_setup_timerctl'
   i2c-flexio.c:(.text+0x27c): additional relocation overflows omitted from the output
   nios2-linux-ld: i2c-flexio.c:(.text+0x28c): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x29c): undefined reference to `flexio_writel'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x2a4): undefined reference to `flexio_get_default_ctrl'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x2b4): undefined reference to `flexio_setup_ctrl'
   nios2-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_master_xfer':
   i2c-flexio.c:(.text+0x620): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x630): undefined reference to `flexio_writel'
>> nios2-linux-ld: i2c-flexio.c:(.text+0x668): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x6b8): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x6dc): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x6e8): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x700): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x798): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x7c8): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x80c): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x870): undefined reference to `flexio_writel'
   nios2-linux-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0x8c4): more undefined references to `flexio_writel' follow
   nios2-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_master_xfer':
   i2c-flexio.c:(.text+0x934): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x958): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x964): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x97c): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0x988): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0x99c): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xa18): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xa28): undefined reference to `flexio_writel'
   nios2-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0xa68): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xac0): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xad0): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xae0): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xafc): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xb24): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xb64): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xba4): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xbb4): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xbdc): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xc24): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xc4c): undefined reference to `flexio_writel'
   nios2-linux-ld: drivers/i2c/busses/i2c-flexio.o:i2c-flexio.c:(.text+0xc88): more undefined references to `flexio_writel' follow
   nios2-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0xcb4): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xcd8): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xd10): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xd24): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xd3c): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xd50): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xd6c): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xd88): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xdd8): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xdec): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xdf8): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xe08): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xe1c): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xe34): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xe44): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xe5c): undefined reference to `flexio_writel'
   nios2-linux-ld: i2c-flexio.c:(.text+0xe78): undefined reference to `flexio_readl'
   nios2-linux-ld: i2c-flexio.c:(.text+0xe88): undefined reference to `flexio_writel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
