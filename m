Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0101079A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 23:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695858351; x=1727394351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Cw0k+L7tzrG8V41HAU6ztTL2mLgfOIXYnm0dpcVmkc=;
  b=bYIPp9d/k6Jm1B2fqZym6WB7WVY5T19eaixdTJclsaWl7ieWY6RoD3PG
   Tc9JY/wplMFhdLG0jYNS4UDHk9wk61S7vT9xD8fa4VPG9aI9p4G0jlxew
   /tahOejw0ZekrdhEafxuoGAaycDMrgE9wiTv7kfBDGyGHMBlPFWHlVkr/
   vx/T2zNfpWKKzISj8OBi/q3noqC3mdYQbgw4kpoJXiQkJ2SFSWhe3hCRy
   3sFO5H3v/AKs4XrAQZpq8bvFQcEaFS8PjiA42O+mY34krrPtP+q7lcbOl
   HVALSRcnr6B1ud1/aAlD3dRcDdXAsSC00H7u1sd8lfRKZkl8iTQxeVHMC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448441493"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="448441493"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 16:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752770238"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="752770238"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2023 16:45:49 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qleDz-0000oJ-0C;
	Wed, 27 Sep 2023 23:45:47 +0000
Date: Thu, 28 Sep 2023 07:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:i2c/for-next 5/9] drivers/i2c/busses/i2c-stm32f7.c:361:
 warning: Function parameter or member 'atomic' not described in
 'stm32f7_i2c_dev'
Message-ID: <202309280752.dk8VXcf0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
head:   b5d463c0eecb4a690e631fa38cb6771a906f7620
commit: 470a662688563d8f5e0fb164930d6f5507a883e4 [5/9] i2c: stm32f7: Add atomic_xfer method to driver
config: csky-randconfig-001-20230928 (https://download.01.org/0day-ci/archive/20230928/202309280752.dk8VXcf0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280752.dk8VXcf0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280752.dk8VXcf0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-stm32f7.c:361: warning: Function parameter or member 'atomic' not described in 'stm32f7_i2c_dev'


vim +361 drivers/i2c/busses/i2c-stm32f7.c

c8062d11e20c21 Alain Volmat        2021-05-05  294  
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  295  /**
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  296   * struct stm32f7_i2c_dev - private data of the controller
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  297   * @adap: I2C adapter for this controller
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  298   * @dev: device for this controller
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  299   * @base: virtual memory area
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  300   * @complete: completion of I2C message
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  301   * @clk: hw i2c clock
09cc9a3bce914d Alain Volmat        2020-04-20  302   * @bus_rate: I2C clock frequency of the controller
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  303   * @msg: Pointer to data to be written
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  304   * @msg_num: number of I2C messages to be executed
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  305   * @msg_id: message identifiant
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  306   * @f7_msg: customized i2c msg for driver usage
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  307   * @setup: I2C timing input setup
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  308   * @timing: I2C computed timings
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  309   * @slave: list of slave devices registered on the I2C bus
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  310   * @slave_running: slave device currently used
ea6dd25deeb5b7 Alain Volmat        2020-01-06  311   * @backup_regs: backup of i2c controller registers (for suspend/resume)
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  312   * @slave_dir: transfer direction for the current slave device
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  313   * @master_mode: boolean to know in which mode the I2C is running (master or
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  314   * slave)
7ecc8cfde553b9 Pierre-Yves MORDRET 2018-04-11  315   * @dma: dma data
7ecc8cfde553b9 Pierre-Yves MORDRET 2018-04-11  316   * @use_dma: boolean to know if dma is used in the current transfer
cb944fb973bcd3 Pierre-Yves MORDRET 2018-11-19  317   * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
0f8205640784a2 Alain Volmat        2020-03-02  318   * @fmp_sreg: register address for setting Fast Mode Plus bits
0f8205640784a2 Alain Volmat        2020-03-02  319   * @fmp_creg: register address for clearing Fast Mode Plus bits
3347ea9bafe763 Alain Volmat        2020-03-02  320   * @fmp_mask: mask for Fast Mode Plus bits in set register
419be8e1dfed5a Alain Volmat        2020-02-03  321   * @wakeup_src: boolean to know if the device is a wakeup source
6af077194600d5 Alain Volmat        2020-08-03  322   * @smbus_mode: states that the controller is configured in SMBus mode
6af077194600d5 Alain Volmat        2020-08-03  323   * @host_notify_client: SMBus host-notify client
83c3408f7b9c6b Alain Volmat        2021-02-05  324   * @analog_filter: boolean to indicate enabling of the analog filter
9449a558549978 Alain Volmat        2021-02-05  325   * @dnf_dt: value of digital filter requested via dt
9449a558549978 Alain Volmat        2021-02-05  326   * @dnf: value of digital filter to apply
c8062d11e20c21 Alain Volmat        2021-05-05  327   * @alert: SMBus alert specific data
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  328   */
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  329  struct stm32f7_i2c_dev {
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  330  	struct i2c_adapter adap;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  331  	struct device *dev;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  332  	void __iomem *base;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  333  	struct completion complete;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  334  	struct clk *clk;
09cc9a3bce914d Alain Volmat        2020-04-20  335  	unsigned int bus_rate;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  336  	struct i2c_msg *msg;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  337  	unsigned int msg_num;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  338  	unsigned int msg_id;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  339  	struct stm32f7_i2c_msg f7_msg;
463a9215f3ca76 Pierre-Yves MORDRET 2017-09-21  340  	struct stm32f7_i2c_setup setup;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  341  	struct stm32f7_i2c_timings timing;
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  342  	struct i2c_client *slave[STM32F7_I2C_MAX_SLAVE];
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  343  	struct i2c_client *slave_running;
ea6dd25deeb5b7 Alain Volmat        2020-01-06  344  	struct stm32f7_i2c_regs backup_regs;
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  345  	u32 slave_dir;
60d609f30de27b Pierre-Yves MORDRET 2018-04-11  346  	bool master_mode;
7ecc8cfde553b9 Pierre-Yves MORDRET 2018-04-11  347  	struct stm32_i2c_dma *dma;
7ecc8cfde553b9 Pierre-Yves MORDRET 2018-04-11  348  	bool use_dma;
cb944fb973bcd3 Pierre-Yves MORDRET 2018-11-19  349  	struct regmap *regmap;
0f8205640784a2 Alain Volmat        2020-03-02  350  	u32 fmp_sreg;
0f8205640784a2 Alain Volmat        2020-03-02  351  	u32 fmp_creg;
3347ea9bafe763 Alain Volmat        2020-03-02  352  	u32 fmp_mask;
419be8e1dfed5a Alain Volmat        2020-02-03  353  	bool wakeup_src;
6af077194600d5 Alain Volmat        2020-08-03  354  	bool smbus_mode;
6af077194600d5 Alain Volmat        2020-08-03  355  	struct i2c_client *host_notify_client;
83c3408f7b9c6b Alain Volmat        2021-02-05  356  	bool analog_filter;
9449a558549978 Alain Volmat        2021-02-05  357  	u32 dnf_dt;
9449a558549978 Alain Volmat        2021-02-05  358  	u32 dnf;
c8062d11e20c21 Alain Volmat        2021-05-05  359  	struct stm32f7_i2c_alert *alert;
470a662688563d Sean Nyekjaer       2023-08-16  360  	bool atomic;
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14 @361  };
aeb068c5721485 Pierre-Yves MORDRET 2017-09-14  362  

:::::: The code at line 361 was first introduced by commit
:::::: aeb068c57214858b638d5ee627bb4a831f98771e i2c: i2c-stm32f7: add driver

:::::: TO: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
