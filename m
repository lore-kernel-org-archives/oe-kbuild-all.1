Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B09198E80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721143688; cv=none; b=hi8R9rIDXYlOAAxlBElMfaMUwy+RY7v6h5u2RMqLkM6BF0iZ00kNMYHeHNUP1fFT9vv6fzadPEsBpGhSW0eOFKqN256UsPIhnOlh4dzbvo+ghZhs/ShIZC31aFkYwucYPbgGnBxU+dp3qpbzRdQHxfj6j45WUTyI3xU+sw/CHjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721143688; c=relaxed/simple;
	bh=sYoo8qD3VULcvcE5SgT7W62RaafjX2UN4c1CiX6rpW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQoixg6t5rEn8+zIYRCeZHlWMQX9EldLATZHHmhbHEmDU47itYUFHu7x36bjBVC2u0CizU/M3Yb+tNsUdtwND1I5QWEsOhjqEBVBSpFGrI7ndpA8i885GMiQ9o7YDwjPFwk6M61NO0h2KseVSpEtCPiYVv7BAdEo73Q3P2wKtOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfPwbhMo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfPwbhMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721143686; x=1752679686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sYoo8qD3VULcvcE5SgT7W62RaafjX2UN4c1CiX6rpW4=;
  b=YfPwbhMotZSptzSU8iMRf2nosnX0+mJfJE232pzLGlfpkno5kPzlMfml
   yOY50WtDI2NcqhtZBV5IMoNLQs4pLJHlzR7Rznv9BKvP+mHOy7syxoog4
   s4u3KoRIfwpXvnApk9sdXRcHs5LF6RStxuSYj9OX9cGkvNQ7G0tDnD0/a
   HLY0ikg1bOJfNMEHDk4P6kRFLUmzU4+2U0y7tp7KvXcheClEuVDYL9EhN
   7vW00EmT2P0RS46zjfylxgnQjD24tUNn9i6ksYZu70Rb3+rbRVnLeiNUK
   3X75jm8tr6gtLLjcMcxAgipTf9nbnJgzw8ykPgpWiiwQBsizXdc9LHvlA
   A==;
X-CSE-ConnectionGUID: nPZgNXgyTYe24Jfxg/Q/Iw==
X-CSE-MsgGUID: 5WvT1eJ3QBum0cBZi+kh9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22453882"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="22453882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 08:28:05 -0700
X-CSE-ConnectionGUID: 49iOckXQSDGa34po0kMaPQ==
X-CSE-MsgGUID: +3qWDw8YReiOpW2decsmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="80718395"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jul 2024 08:28:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTk5x-000fO2-0h;
	Tue, 16 Jul 2024 15:28:01 +0000
Date: Tue, 16 Jul 2024 23:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:i2c-repeated-send-debug 2/2]
 drivers/i2c/busses/i2c-microchip-corei2c.c:118: warning: Function parameter
 or struct member 'repeated_send_needed' not described in 'mchp_corei2c_dev'
Message-ID: <202407162347.GvVWfkLO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git i2c-repeated-send-debug
head:   ccc708bf2cda982fe64703a247dda6c8c8aba202
commit: ccc708bf2cda982fe64703a247dda6c8c8aba202 [2/2] this might've fixed it, but looks horrid
config: i386-buildonly-randconfig-002-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162347.GvVWfkLO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162347.GvVWfkLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162347.GvVWfkLO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-microchip-corei2c.c:118: warning: Function parameter or struct member 'repeated_send_needed' not described in 'mchp_corei2c_dev'


vim +118 drivers/i2c/busses/i2c-microchip-corei2c.c

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
64a6f1c4987e02 Conor Dooley 2022-07-06  109  	u8 *buf;
64a6f1c4987e02 Conor Dooley 2022-07-06  110  	struct completion msg_complete;
64a6f1c4987e02 Conor Dooley 2022-07-06  111  	struct i2c_adapter adapter;
64a6f1c4987e02 Conor Dooley 2022-07-06  112  	int msg_err;
64a6f1c4987e02 Conor Dooley 2022-07-06  113  	u32 bus_clk_rate;
64a6f1c4987e02 Conor Dooley 2022-07-06  114  	u32 isr_status;
64a6f1c4987e02 Conor Dooley 2022-07-06  115  	u16 msg_len;
64a6f1c4987e02 Conor Dooley 2022-07-06  116  	u8 addr;
ccc708bf2cda98 Conor Dooley 2024-07-16  117  	bool repeated_send_needed;
64a6f1c4987e02 Conor Dooley 2022-07-06 @118  };
64a6f1c4987e02 Conor Dooley 2022-07-06  119  

:::::: The code at line 118 was first introduced by commit
:::::: 64a6f1c4987e027339818b9d142257e7ede6dfe0 i2c: add support for microchip fpga i2c controllers

:::::: TO: Conor Dooley <conor.dooley@microchip.com>
:::::: CC: Wolfram Sang <wsa@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
