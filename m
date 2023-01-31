Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E2563C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 20:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675197161; x=1706733161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYzcAIX/KQTlWxClI8cumgbLjPTSd3XI/Fk+7fAYJ7c=;
  b=ZOf9CVpl9TbOKFDACtorlUIWuq5RHx+p/EX98UNOnCRdmPpsWekl3wjd
   mfexcy6IXoTEe2KhhwiXHsy5WfVYntHT7qA1eCtmPedIFoqvcYW3p6qTb
   CjcR5x4oZWfkEhOoctqspYRncwiN/v5Qeojjzd4yp970vHszfVmMSvgmD
   eDazdSNHMwL+QVeCd+uoXJaHx3kDp8FC2NThmOvv5b2TRscayld8yNbfv
   WyqgIzut1xUW8hCC9GLMMyfWqelMl5mL4C0Uk+TxzMzRk0YxgQo/BRfn6
   HtalsevZNS0zX/aLnVlWmkmPhAMfNlMG1lTN6W4Wrtr122fiqskvz714E
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311577308"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="311577308"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 12:31:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="773135756"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="773135756"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2023 12:31:24 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMxHn-0004gd-1U;
	Tue, 31 Jan 2023 20:31:23 +0000
Date: Wed, 1 Feb 2023 04:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ng Khai Wen <khai.wen.ng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chen Meng J <meng.j.chen@intel.com>
Subject: [intel-lts:5.10/preempt-rt 10992/29702]
 drivers/media/i2c/ti960-des.c:129:5: warning: no previous prototype for
 'bus_switch'
Message-ID: <202302010437.nuYozxq2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ng,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   32e6f493fd5e5c8cadd5b628aac19f8e64db0f33
commit: bd8c7120c481ebe8e2e40e6b9308d689f8adfff7 [10992/29702] media: ti960: remove crlmodule dependency
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302010437.nuYozxq2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/bd8c7120c481ebe8e2e40e6b9308d689f8adfff7
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout bd8c7120c481ebe8e2e40e6b9308d689f8adfff7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ti960-des.c:129:5: warning: no previous prototype for 'bus_switch' [-Wmissing-prototypes]
     129 | int bus_switch(struct ti960 *va)
         |     ^~~~~~~~~~
   drivers/media/i2c/ti960-des.c: In function 'ti960_init':
   drivers/media/i2c/ti960-des.c:1240:22: warning: unused variable 'reset_gpio' [-Wunused-variable]
    1240 |         unsigned int reset_gpio = va->pdata->reset_gpio;
         |                      ^~~~~~~~~~
   In file included from drivers/media/i2c/ti960-des.c:20:
   drivers/media/i2c/ti953.h: At top level:
   drivers/media/i2c/ti953.h:101:42: warning: 'ti953_FPD3_RX_ID' defined but not used [-Wunused-const-variable=]
     101 | static const struct ti953_register_devid ti953_FPD3_RX_ID[] = {
         |                                          ^~~~~~~~~~~~~~~~
   drivers/media/i2c/ti953.h:96:42: warning: 'ti953_init_settings_clk' defined but not used [-Wunused-const-variable=]
      96 | static const struct ti953_register_write ti953_init_settings_clk[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ti953.h:29:42: warning: 'ti953_init_settings' defined but not used [-Wunused-const-variable=]
      29 | static const struct ti953_register_write ti953_init_settings[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~


vim +/bus_switch +129 drivers/media/i2c/ti960-des.c

1aafb1e0df5527 Ng Khai Wen 2021-07-01  128  
d2753af810c799 Ng Khai Wen 2021-07-01 @129  int bus_switch(struct ti960 *va)
d2753af810c799 Ng Khai Wen 2021-07-01  130  {
d2753af810c799 Ng Khai Wen 2021-07-01  131  	int ret;
d2753af810c799 Ng Khai Wen 2021-07-01  132  	int retry, timeout = 10;
d2753af810c799 Ng Khai Wen 2021-07-01  133  	struct i2c_client *client = v4l2_get_subdevdata(&va->sd);
d2753af810c799 Ng Khai Wen 2021-07-01  134  
d2753af810c799 Ng Khai Wen 2021-07-01  135  	dev_dbg(&client->dev, "bus switch");
d2753af810c799 Ng Khai Wen 2021-07-01  136  	client->addr = 0x70;
d2753af810c799 Ng Khai Wen 2021-07-01  137  	for (retry = 0; retry < timeout; retry++) {
d2753af810c799 Ng Khai Wen 2021-07-01  138  		ret = i2c_smbus_write_byte(client, 0x01);
d2753af810c799 Ng Khai Wen 2021-07-01  139  		if (ret < 0)
d2753af810c799 Ng Khai Wen 2021-07-01  140  			usleep_range(5000, 6000);
d2753af810c799 Ng Khai Wen 2021-07-01  141  		else
d2753af810c799 Ng Khai Wen 2021-07-01  142  			break;
d2753af810c799 Ng Khai Wen 2021-07-01  143  	}
d2753af810c799 Ng Khai Wen 2021-07-01  144  
d2753af810c799 Ng Khai Wen 2021-07-01  145  	client->addr = TI960_I2C_ADDRESS;
d2753af810c799 Ng Khai Wen 2021-07-01  146  	if (retry >= timeout) {
d2753af810c799 Ng Khai Wen 2021-07-01  147  		dev_err(&client->dev, "bus switch failed");
d2753af810c799 Ng Khai Wen 2021-07-01  148  		return -EREMOTEIO;
d2753af810c799 Ng Khai Wen 2021-07-01  149  	}
d2753af810c799 Ng Khai Wen 2021-07-01  150  
d2753af810c799 Ng Khai Wen 2021-07-01  151  	return 0;
d2753af810c799 Ng Khai Wen 2021-07-01  152  }
d2753af810c799 Ng Khai Wen 2021-07-01  153  

:::::: The code at line 129 was first introduced by commit
:::::: d2753af810c79927ae6a70fd532a0b19d9816dc5 media: intel-ipu6: add ti960 driver

:::::: TO: Ng Khai Wen <khai.wen.ng@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
