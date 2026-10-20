Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479615;
	b=Ijvf8bCuU8YaTJ9sI9GRtx65cbX4uQApnhvD+C7xdrkUJrnGxX2MgzkydBuOvxqxkOBP
	 4kINggRB+BRKCDGop5Jneuak2mdzSX3WDuT3BgvrXyucv85xd/CAf+RK3TnrSUxeQLKY1
	 qKmApPOm5w38aoz/NT87qU8UQ9CCcN0/+bkJaNx5uxA1LCj2yaQGmAtsKzn87DfXNLXb4
	 XQ00227zRvoWwSEpm3SAK58RqiuuSB4Qy3gdZCOnc4qecDJNVVXXeQk/pW5MnvKxITYbd
	 3ndf+c4UZJ1TzqD7vO2JqXcHUtqa9RNmW9TytK+BeFmPodsj8TKKcrpa/wM7OP0oDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479615;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Xo+79J3lz8xdKUmDDPaatT4ezN+xGj9co9kfztmRMRk=;
	b=SVZNN0PXviShBKSkYuq8qq207tunh0SBmlhsplHBnactTFWypDsUtUwFR5BO4leBcrft
	 ZqP7ggqchjxTIoh0CSkT99cepZrTy+Xk7u/lQZ636tPjxh/kN49o7qf5Ba18iJUHRWX97
	 7IiHeanRV95KkV2GOqiqzzq1Izm8/ndTqD7jgUE8wi+e9IBXkFvWEzWCdu2KsBEwfN/Pa
	 ibJ6GfAQb/CNGcV3CM7octKTX+eBVyHTkcIeZb8zbi2nzSjZW9KTalta7h2Ub4N2oKcFZ
	 OmGB6L2VQ5zu6LM7kNJSbrkmy/mdbjtEbAYBDVGAfQoBTrMzL0jxaIACbPLE31//beQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L9arH89B;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F4E606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 07:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F4E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L9arH89B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792479604; x=1824015604;
  h=date:from:to:cc:subject:message-id;
  bh=DG8o6u6GiCqyhDd4HkH7/5ijTnpiAPlD9wIqdepPyiA=;
  b=L9arH89Bdoopt0ynu8FA+OXGRNDjfo4Ai2zVfCSlKn9QYb/UYyjCyLBC
   VverVy8a5oF53PpDXUiLUcjeAE2ntGUODaKrcT9Mr/MVMkE4cfCbi+OwQ
   2CpppoX72oQNtfPsqc6AogmDej43EWt6FEbGjhjApVO7c2ENhzodGoBDW
   WIvOzKE0mYaEGlYi/mK/Fqkeree7IOzbK+s6T78D8kl4EIwDynxMpGELc
   qE+OG0Jk2YPGH/OneNH32b8kud+EgubjLQK9m3mr2wqFLG/rrNzJL6DUB
   wFU2m2C6oA8AM5SrUOHYIZEQRk50YjNk8Z10rFVVm+7fPXyGhjnh2ZteP
   w==;
X-CSE-ConnectionGUID: TvbkGPjVQziuWZESUlwfJw==
X-CSE-MsgGUID: 09W6qAbHSfymO03icg4nsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1065348"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1065348"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 00:00:03 -0700
X-CSE-ConnectionGUID: BW77iVLyTvS64IJSV/LILQ==
X-CSE-MsgGUID: lDVXli+QRjqstxuY4MYWRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4525396"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 20 Oct 2026 00:00:01 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ3pH-00000000N3S-0TbO;
	Tue, 20 Oct 2026 06:59:59 +0000
Date: Tue, 20 Oct 2026 14:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/i2c/busses/i2c-stm32f7.c:361: warning: Function parameter or member
 'atomic' not described in 'stm32f7_i2c_dev'
Message-ID: <202610201412.IODJLh0e-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Sean,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e6c95791cab73087319ad89d1abd4fedf43ede9d
commit: e84f4400bf8caaa06ffce9a97e8f2a4bd91246fe [0/1] i2c: stm32f7: Add atomic_xfer method to driver
config: i386-buildonly-randconfig-1001-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201412.IODJLh0e-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201412.IODJLh0e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201412.IODJLh0e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-stm32f7.c:361: warning: Function parameter or member 'atomic' not described in 'stm32f7_i2c_dev'


vim +361 drivers/i2c/busses/i2c-stm32f7.c

c8062d11e20c218 Alain Volmat        2021-05-05  294  
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  295  /**
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  296   * struct stm32f7_i2c_dev - private data of the controller
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  297   * @adap: I2C adapter for this controller
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  298   * @dev: device for this controller
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  299   * @base: virtual memory area
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  300   * @complete: completion of I2C message
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  301   * @clk: hw i2c clock
09cc9a3bce914d3 Alain Volmat        2020-04-20  302   * @bus_rate: I2C clock frequency of the controller
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  303   * @msg: Pointer to data to be written
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  304   * @msg_num: number of I2C messages to be executed
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  305   * @msg_id: message identifiant
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  306   * @f7_msg: customized i2c msg for driver usage
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  307   * @setup: I2C timing input setup
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  308   * @timing: I2C computed timings
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  309   * @slave: list of slave devices registered on the I2C bus
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  310   * @slave_running: slave device currently used
ea6dd25deeb5b79 Alain Volmat        2020-01-06  311   * @backup_regs: backup of i2c controller registers (for suspend/resume)
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  312   * @slave_dir: transfer direction for the current slave device
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  313   * @master_mode: boolean to know in which mode the I2C is running (master or
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  314   * slave)
7ecc8cfde553b92 Pierre-Yves MORDRET 2018-04-11  315   * @dma: dma data
7ecc8cfde553b92 Pierre-Yves MORDRET 2018-04-11  316   * @use_dma: boolean to know if dma is used in the current transfer
cb944fb973bcd32 Pierre-Yves MORDRET 2018-11-19  317   * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
0f8205640784a26 Alain Volmat        2020-03-02  318   * @fmp_sreg: register address for setting Fast Mode Plus bits
0f8205640784a26 Alain Volmat        2020-03-02  319   * @fmp_creg: register address for clearing Fast Mode Plus bits
3347ea9bafe7630 Alain Volmat        2020-03-02  320   * @fmp_mask: mask for Fast Mode Plus bits in set register
419be8e1dfed5af Alain Volmat        2020-02-03  321   * @wakeup_src: boolean to know if the device is a wakeup source
6af077194600d54 Alain Volmat        2020-08-03  322   * @smbus_mode: states that the controller is configured in SMBus mode
6af077194600d54 Alain Volmat        2020-08-03  323   * @host_notify_client: SMBus host-notify client
83c3408f7b9c6b0 Alain Volmat        2021-02-05  324   * @analog_filter: boolean to indicate enabling of the analog filter
9449a558549978c Alain Volmat        2021-02-05  325   * @dnf_dt: value of digital filter requested via dt
9449a558549978c Alain Volmat        2021-02-05  326   * @dnf: value of digital filter to apply
c8062d11e20c218 Alain Volmat        2021-05-05  327   * @alert: SMBus alert specific data
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  328   */
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  329  struct stm32f7_i2c_dev {
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  330  	struct i2c_adapter adap;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  331  	struct device *dev;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  332  	void __iomem *base;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  333  	struct completion complete;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  334  	struct clk *clk;
09cc9a3bce914d3 Alain Volmat        2020-04-20  335  	unsigned int bus_rate;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  336  	struct i2c_msg *msg;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  337  	unsigned int msg_num;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  338  	unsigned int msg_id;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  339  	struct stm32f7_i2c_msg f7_msg;
463a9215f3ca760 Pierre-Yves MORDRET 2017-09-21  340  	struct stm32f7_i2c_setup setup;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  341  	struct stm32f7_i2c_timings timing;
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  342  	struct i2c_client *slave[STM32F7_I2C_MAX_SLAVE];
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  343  	struct i2c_client *slave_running;
ea6dd25deeb5b79 Alain Volmat        2020-01-06  344  	struct stm32f7_i2c_regs backup_regs;
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  345  	u32 slave_dir;
60d609f30de27b1 Pierre-Yves MORDRET 2018-04-11  346  	bool master_mode;
7ecc8cfde553b92 Pierre-Yves MORDRET 2018-04-11  347  	struct stm32_i2c_dma *dma;
7ecc8cfde553b92 Pierre-Yves MORDRET 2018-04-11  348  	bool use_dma;
cb944fb973bcd32 Pierre-Yves MORDRET 2018-11-19  349  	struct regmap *regmap;
0f8205640784a26 Alain Volmat        2020-03-02  350  	u32 fmp_sreg;
0f8205640784a26 Alain Volmat        2020-03-02  351  	u32 fmp_creg;
3347ea9bafe7630 Alain Volmat        2020-03-02  352  	u32 fmp_mask;
419be8e1dfed5af Alain Volmat        2020-02-03  353  	bool wakeup_src;
6af077194600d54 Alain Volmat        2020-08-03  354  	bool smbus_mode;
6af077194600d54 Alain Volmat        2020-08-03  355  	struct i2c_client *host_notify_client;
83c3408f7b9c6b0 Alain Volmat        2021-02-05  356  	bool analog_filter;
9449a558549978c Alain Volmat        2021-02-05  357  	u32 dnf_dt;
9449a558549978c Alain Volmat        2021-02-05  358  	u32 dnf;
c8062d11e20c218 Alain Volmat        2021-05-05  359  	struct stm32f7_i2c_alert *alert;
e84f4400bf8caaa Sean Nyekjaer       2023-08-16  360  	bool atomic;
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14 @361  };
aeb068c57214858 Pierre-Yves MORDRET 2017-09-14  362  

:::::: The code at line 361 was first introduced by commit
:::::: aeb068c57214858b638d5ee627bb4a831f98771e i2c: i2c-stm32f7: add driver

:::::: TO: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
