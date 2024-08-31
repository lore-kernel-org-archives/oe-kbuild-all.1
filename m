Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D824FC8DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725113891; cv=none; b=lhzqPBhCEfoGhSqAa/ZhRf8XtOjA//VK/NVfgtAZBTX2aUigHuduLvXh4zyywXO1JQEzJZiS0fcYAlR7RQV70CEosbgeDZW4I2Pa30F0pdLUqUeoNt8yr7ph8gsz+t55WcZwDsb6lFuhhbYncyrg+XJJQmtMe4A39zCWfX+CEJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725113891; c=relaxed/simple;
	bh=l0a9YP2+MMfCwNExSRU4V3/3lgAFzSvK1FEqsQU0GJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mWLZn00TIBsyHoYVVcs5QcIs+twHubtOd/CLm9kZTRIJiAsmnOJYAfsdy3ega6PQAZJTyixm6GK0GDAHt73qD3gQylx5I9OGeXiJZXWkm7yCBHDhpJXhY/RiSn0rinVhPsTVWT/pKswK4tIwaiH+IZPCCvB7HFE+71VRbG2CFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdS652v3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdS652v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725113890; x=1756649890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0a9YP2+MMfCwNExSRU4V3/3lgAFzSvK1FEqsQU0GJI=;
  b=CdS652v3BasztlKLrvLMtpcJy0kQzTv5AYzszd58xWj/zhqS+VI9xTvG
   0hRfl4spfOqtUGK5VYAAKNIpCuZskUkK1KmNLWtiTxh7pggE73Rr3a8Wl
   GM8F0KO75LfPFt8XT5+HXNO6lXc5Y2d5sbJMwqkkIk5DyuQsB9x7nsl7B
   ClWtmGc7PoJ/RSarZhqdMqj3X84aPEDH6Yn5EbOxhg3nODM4j+9qnC0G9
   1axbI+tdOSwvKDy6wADG3pe9okrH/yBQr+n4vRKGP4PAJ6MaJROCTcSWp
   NES3xPvf5cf3bbQXvk7GCZH4vT2E/MyjFA+Ll7hsLAWs8BR4K8ZH1fP46
   g==;
X-CSE-ConnectionGUID: zkwhAL27SHCMNzhiCblPcA==
X-CSE-MsgGUID: PhwrW/r2TMCjFI4Tk5rltQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="46253352"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="46253352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 07:18:10 -0700
X-CSE-ConnectionGUID: iOhus2EhQtCDzo26dF5m9Q==
X-CSE-MsgGUID: W1eJ/vZmS5GcXQlkjlbzVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64214446"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2024 07:18:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skOvW-0002oY-16;
	Sat, 31 Aug 2024 14:18:06 +0000
Date: Sat, 31 Aug 2024 22:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:i2c-repeated-send-debug 2/4]
 drivers/i2c/busses/i2c-microchip-corei2c.c:121: warning: Function parameter
 or struct member 'msg_queue' not described in 'mchp_corei2c_dev'
Message-ID: <202408312226.7GmF5A53-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git i2c-repeated-send-debug
head:   39dbd883618e7102143007c1b2f82ba1cb5edf39
commit: 7a2a2bbc167e6fb853b930098aaa9389ef442ae0 [2/4] i2c: microchip-core: actually use repeated sends
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408312226.7GmF5A53-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312226.7GmF5A53-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312226.7GmF5A53-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-microchip-corei2c.c:121: warning: Function parameter or struct member 'msg_queue' not described in 'mchp_corei2c_dev'
>> drivers/i2c/busses/i2c-microchip-corei2c.c:121: warning: Function parameter or struct member 'total_num' not described in 'mchp_corei2c_dev'
>> drivers/i2c/busses/i2c-microchip-corei2c.c:121: warning: Function parameter or struct member 'current_num' not described in 'mchp_corei2c_dev'
   drivers/i2c/busses/i2c-microchip-corei2c.c:121: warning: Function parameter or struct member 'repeated_send_needed' not described in 'mchp_corei2c_dev'


vim +121 drivers/i2c/busses/i2c-microchip-corei2c.c

64a6f1c4987e02 Conor Dooley 2022-07-06   89  
64a6f1c4987e02 Conor Dooley 2022-07-06   90  /**
64a6f1c4987e02 Conor Dooley 2022-07-06   91   * struct mchp_corei2c_dev - Microchip CoreI2C device private data
64a6f1c4987e02 Conor Dooley 2022-07-06   92   *
64a6f1c4987e02 Conor Dooley 2022-07-06   93   * @base:		pointer to register struct
64a6f1c4987e02 Conor Dooley 2022-07-06   94   * @dev:		device reference
64a6f1c4987e02 Conor Dooley 2022-07-06   95   * @i2c_clk:		clock reference for i2c input clock
64a6f1c4987e02 Conor Dooley 2022-07-06   96   * @buf:		pointer to msg buffer for easier use
64a6f1c4987e02 Conor Dooley 2022-07-06   97   * @msg_complete:	xfer completion object
64a6f1c4987e02 Conor Dooley 2022-07-06   98   * @adapter:		core i2c abstraction
64a6f1c4987e02 Conor Dooley 2022-07-06   99   * @msg_err:		error code for completed message
64a6f1c4987e02 Conor Dooley 2022-07-06  100   * @bus_clk_rate:	current i2c bus clock rate
64a6f1c4987e02 Conor Dooley 2022-07-06  101   * @isr_status:		cached copy of local ISR status
64a6f1c4987e02 Conor Dooley 2022-07-06  102   * @msg_len:		number of bytes transferred in msg
64a6f1c4987e02 Conor Dooley 2022-07-06  103   * @addr:		address of the current slave
64a6f1c4987e02 Conor Dooley 2022-07-06  104   */
64a6f1c4987e02 Conor Dooley 2022-07-06  105  struct mchp_corei2c_dev {
64a6f1c4987e02 Conor Dooley 2022-07-06  106  	void __iomem *base;
64a6f1c4987e02 Conor Dooley 2022-07-06  107  	struct device *dev;
64a6f1c4987e02 Conor Dooley 2022-07-06  108  	struct clk *i2c_clk;
7a2a2bbc167e6f Conor Dooley 2024-07-19  109  	struct i2c_msg *msg_queue;
64a6f1c4987e02 Conor Dooley 2022-07-06  110  	u8 *buf;
64a6f1c4987e02 Conor Dooley 2022-07-06  111  	struct completion msg_complete;
64a6f1c4987e02 Conor Dooley 2022-07-06  112  	struct i2c_adapter adapter;
64a6f1c4987e02 Conor Dooley 2022-07-06  113  	int msg_err;
7a2a2bbc167e6f Conor Dooley 2024-07-19  114  	int total_num;
7a2a2bbc167e6f Conor Dooley 2024-07-19  115  	int current_num;
64a6f1c4987e02 Conor Dooley 2022-07-06  116  	u32 bus_clk_rate;
64a6f1c4987e02 Conor Dooley 2022-07-06  117  	u32 isr_status;
64a6f1c4987e02 Conor Dooley 2022-07-06  118  	u16 msg_len;
64a6f1c4987e02 Conor Dooley 2022-07-06  119  	u8 addr;
7a2a2bbc167e6f Conor Dooley 2024-07-19  120  	bool repeated_send_needed;
64a6f1c4987e02 Conor Dooley 2022-07-06 @121  };
64a6f1c4987e02 Conor Dooley 2022-07-06  122  

:::::: The code at line 121 was first introduced by commit
:::::: 64a6f1c4987e027339818b9d142257e7ede6dfe0 i2c: add support for microchip fpga i2c controllers

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Wolfram Sang <wsa@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
