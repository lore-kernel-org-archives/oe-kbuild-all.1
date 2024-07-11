Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEF12F385
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 21:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720733993; cv=none; b=IoB8cPaCWv/YdCVlrA61vH06sS3QKNMGvlGtGFAxr3efBXxiV19qbYUoAme6GJcMtRczstR4bdt++gUTy0aUAFIvx+nBuyqvUsOhYUBM9PP9iRHfT4vVyckuAHPMP3K2btkBUFLtzLMXdHkHkCNENuDwejPgu7mfAekXCAQov5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720733993; c=relaxed/simple;
	bh=FJwhU1ATWcSwsBsZYEN8T/d0tT2GteJjWIJ3ZDamQIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z+4+mTWxxOkFeN895q5cf3VHbD3pNNP4HAmnzYCQYmuZ51/5c0Siz+og/46g+9zN4zXcr1Q2X1CCkovFEJoqBCQ4+KzQ8b4TEp1pV8OAUs3itiY/SaBpdwAqEScyvcmsEd/dOg8co7WsxXcjOUKB9UXHngWiX2PR6l5yl0kn4WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYLD/9r3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYLD/9r3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720733992; x=1752269992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FJwhU1ATWcSwsBsZYEN8T/d0tT2GteJjWIJ3ZDamQIE=;
  b=RYLD/9r3STUgFxILQ3iil0k1YFIZXmfNRZ1H0yhR3uyGRfDgO1xmuUp8
   HXERHkWxJITqCn4tj1UYqZ0uKwkdAXa1xKtsHyCLF9VU+hFLsAb6RNhRM
   3LtmuBoCgGfGVZ9W+OgCq0gGMDpk8SpWp11w13S/PliLtYp+FHySMvtsg
   vUwA9EgzxKWfz3CSpfFXWrZp/AhVPDdpvVmtesWUXQpKsM7lCX7usEITC
   GQBQNVhkBM9PnyLEAPmylCP/5Yil+BnACDKUFye2vmCp2czDw8r6Au2a9
   vXiwyfueedoD0wszISRoVQA3DioQE5vYy3pGS+6nQCLA8ZPYilEbJSw4O
   w==;
X-CSE-ConnectionGUID: 7Pp32kgcSkmj2S1BaOSDmw==
X-CSE-MsgGUID: s73Ejv3oSNi8pXDsirVfBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29547623"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="29547623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 14:39:51 -0700
X-CSE-ConnectionGUID: vtlt6qd7RWymUYWlr8f3Gw==
X-CSE-MsgGUID: I8uVC4nXTnWoisSX8P8Z3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="48438812"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2024 14:39:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS1Vz-000ZwE-2M;
	Thu, 11 Jul 2024 21:39:47 +0000
Date: Fri, 12 Jul 2024 05:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:i2c-repeated-send-debug 1/1]
 drivers/i2c/busses/i2c-microchip-corei2c.c:119: warning: Function parameter
 or struct member 'next_is_read' not described in 'mchp_corei2c_dev'
Message-ID: <202407120501.cnefBoMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git i2c-repeated-send-debug
head:   ccaa11e74136b352c2b3b62aa54d3f9d09e90b4c
commit: ccaa11e74136b352c2b3b62aa54d3f9d09e90b4c [1/1] try to fix repeated send + debugging code for it not working
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240712/202407120501.cnefBoMM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120501.cnefBoMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120501.cnefBoMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-microchip-corei2c.c:119: warning: Function parameter or struct member 'next_is_read' not described in 'mchp_corei2c_dev'


vim +119 drivers/i2c/busses/i2c-microchip-corei2c.c

64a6f1c4987e02 Conor Dooley 2022-07-06   90  
64a6f1c4987e02 Conor Dooley 2022-07-06   91  /**
64a6f1c4987e02 Conor Dooley 2022-07-06   92   * struct mchp_corei2c_dev - Microchip CoreI2C device private data
64a6f1c4987e02 Conor Dooley 2022-07-06   93   *
64a6f1c4987e02 Conor Dooley 2022-07-06   94   * @base:		pointer to register struct
64a6f1c4987e02 Conor Dooley 2022-07-06   95   * @dev:		device reference
64a6f1c4987e02 Conor Dooley 2022-07-06   96   * @i2c_clk:		clock reference for i2c input clock
64a6f1c4987e02 Conor Dooley 2022-07-06   97   * @buf:		pointer to msg buffer for easier use
64a6f1c4987e02 Conor Dooley 2022-07-06   98   * @msg_complete:	xfer completion object
64a6f1c4987e02 Conor Dooley 2022-07-06   99   * @adapter:		core i2c abstraction
64a6f1c4987e02 Conor Dooley 2022-07-06  100   * @msg_err:		error code for completed message
64a6f1c4987e02 Conor Dooley 2022-07-06  101   * @bus_clk_rate:	current i2c bus clock rate
64a6f1c4987e02 Conor Dooley 2022-07-06  102   * @isr_status:		cached copy of local ISR status
64a6f1c4987e02 Conor Dooley 2022-07-06  103   * @msg_len:		number of bytes transferred in msg
64a6f1c4987e02 Conor Dooley 2022-07-06  104   * @addr:		address of the current slave
64a6f1c4987e02 Conor Dooley 2022-07-06  105   */
64a6f1c4987e02 Conor Dooley 2022-07-06  106  struct mchp_corei2c_dev {
64a6f1c4987e02 Conor Dooley 2022-07-06  107  	void __iomem *base;
64a6f1c4987e02 Conor Dooley 2022-07-06  108  	struct device *dev;
64a6f1c4987e02 Conor Dooley 2022-07-06  109  	struct clk *i2c_clk;
64a6f1c4987e02 Conor Dooley 2022-07-06  110  	u8 *buf;
64a6f1c4987e02 Conor Dooley 2022-07-06  111  	struct completion msg_complete;
64a6f1c4987e02 Conor Dooley 2022-07-06  112  	struct i2c_adapter adapter;
64a6f1c4987e02 Conor Dooley 2022-07-06  113  	int msg_err;
64a6f1c4987e02 Conor Dooley 2022-07-06  114  	u32 bus_clk_rate;
64a6f1c4987e02 Conor Dooley 2022-07-06  115  	u32 isr_status;
64a6f1c4987e02 Conor Dooley 2022-07-06  116  	u16 msg_len;
64a6f1c4987e02 Conor Dooley 2022-07-06  117  	u8 addr;
ccaa11e74136b3 Conor Dooley 2024-07-11  118  	bool next_is_read;
64a6f1c4987e02 Conor Dooley 2022-07-06 @119  };
64a6f1c4987e02 Conor Dooley 2022-07-06  120  

:::::: The code at line 119 was first introduced by commit
:::::: 64a6f1c4987e027339818b9d142257e7ede6dfe0 i2c: add support for microchip fpga i2c controllers

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Wolfram Sang <wsa@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
