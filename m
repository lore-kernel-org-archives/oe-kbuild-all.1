Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA011C688
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696274050; x=1727810050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OYhWIZV5dcqxhSWwSk2pqHhvmosaEMoGO7V5+gGD9X0=;
  b=cBar1M2F/LBnisq3fFME1xqPfkPnMG6O2pqncs1Bporkh2pytKzZtXHe
   Y/neMtCR+pDchm2AjSJ+ixVOxs2mnsRqeN5sFNr5CS9MHyP3+l6euCvhT
   24aVpXJMwv+adnRGap9eVtyIeSCWNvVBXi7szaiGuoR8H00viBo60RF5n
   YYa103vs3c5ozzuu2il+hOWB7bsOLEtJmBRC2ZvpgU4bFmq58t6Q08x8q
   S8dtEhiupno+LdMTe6w9APmiA3m72uC6WKTV30K7hE8RFCANR2fvxDTOp
   RqSoH+P8TpKWCJKUEL2p1A1AzRgAUF63qw8ZsudyaqRbvfVygXTTaTc9F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362077320"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="362077320"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 11:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="874440486"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="874440486"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Oct 2023 11:24:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnNac-0006Gn-0J;
	Mon, 02 Oct 2023 18:24:18 +0000
Date: Tue, 3 Oct 2023 02:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS_2023.1_update 1/3]
 drivers/net/can/xilinx_can.c:220: warning: Function parameter or member
 'rstc' not described in 'xcan_priv'
Message-ID: <202310030255.j3BjPNEL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS_2023.1_update
head:   496752408d031f93159fcf1aba2831c807a389a3
commit: c7054aa2b0369686d20462e733cf2e84b2fc395b [1/3] can: xilinx_can: Add support for controller reset
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030255.j3BjPNEL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030255.j3BjPNEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030255.j3BjPNEL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/can/xilinx_can.c:220: warning: Function parameter or member 'rstc' not described in 'xcan_priv'


vim +220 drivers/net/can/xilinx_can.c

1598efe57b3e76 Anssi Hannula          2018-02-26  185  
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  186  /**
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  187   * struct xcan_priv - This definition define CAN driver instance
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  188   * @can:			CAN private data structure.
620050d9c2be15 Anssi Hannula          2017-02-23  189   * @tx_lock:			Lock for synchronizing TX interrupt handling
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  190   * @tx_head:			Tx CAN packets ready to send on the queue
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  191   * @tx_tail:			Tx CAN packets successfully sended on the queue
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  192   * @tx_max:			Maximum number packets the driver can send
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  193   * @napi:			NAPI structure
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  194   * @read_reg:			For reading data from CAN registers
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  195   * @write_reg:			For writing data to CAN registers
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  196   * @dev:			Network device data structure
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  197   * @reg_base:			Ioremapped address to registers
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  198   * @irq_flags:			For request_irq()
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  199   * @bus_clk:			Pointer to struct clk
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  200   * @can_clk:			Pointer to struct clk
1598efe57b3e76 Anssi Hannula          2018-02-26  201   * @devtype:			Device type specific constants
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  202   */
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  203  struct xcan_priv {
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  204  	struct can_priv can;
b687a7792b9c28 Marc Kleine-Budde      2019-10-04  205  	spinlock_t tx_lock; /* Lock for synchronizing TX interrupt handling */
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  206  	unsigned int tx_head;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  207  	unsigned int tx_tail;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  208  	unsigned int tx_max;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  209  	struct napi_struct napi;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  210  	u32 (*read_reg)(const struct xcan_priv *priv, enum xcan_reg reg);
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  211  	void (*write_reg)(const struct xcan_priv *priv, enum xcan_reg reg,
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  212  			  u32 val);
4716620d1b6291 Kedareswara rao Appana 2015-10-26  213  	struct device *dev;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  214  	void __iomem *reg_base;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  215  	unsigned long irq_flags;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  216  	struct clk *bus_clk;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  217  	struct clk *can_clk;
1598efe57b3e76 Anssi Hannula          2018-02-26  218  	struct xcan_devtype_data devtype;
c7054aa2b03696 Srinivas Neeli         2023-06-12  219  	struct reset_control *rstc;
b1201e44f50b01 Kedareswara rao Appana 2014-05-21 @220  };
b1201e44f50b01 Kedareswara rao Appana 2014-05-21  221  

:::::: The code at line 220 was first introduced by commit
:::::: b1201e44f50b017a4972a337058b36b40c90abca can: xilinx CAN controller support

:::::: TO: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
