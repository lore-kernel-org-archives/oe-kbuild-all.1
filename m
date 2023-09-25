Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6817F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 02:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695609383; x=1727145383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=29td/HPKTV6DrCovPsb3cQ5STIfhl+HlrIlMZ3S2CBU=;
  b=bgA2SR9OaOVhtbqetA59knwOv+DW54UDocfOY7SMWNkQy4sJJ22hu4wT
   OZPCx0HuF8Qzr7/BgiWUXfolgLzBhilvg9tht/ST6omfXyZGYN5saAhId
   L20KHcWHUVQ16xobcSfFL5+6/LM0uQgqjEY+BwpLzGsJRh5TTqo4zS3fk
   g8VzmOsPiy4+8dfjkjyNoKryWRIJVyOdVRos9N8OdSGDG+rxwkBsjoDZ6
   q5B4j6vqJun0v6Em0ChWZ0XjLEuIQ9Nf94iLbfmx2kjbh5YIu4gIAB9Gx
   0+92RFvPP2pDfXbZ2mJcGLAPn6LeZTyMTrBjsx8BSXVRmLq4pg4YTwEIm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378421021"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="378421021"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995200207"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="995200207"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2023 19:36:20 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkbSM-0000uT-2Q;
	Mon, 25 Sep 2023 02:36:18 +0000
Date: Mon, 25 Sep 2023 10:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 966/1123] drivers/spi/spi-zynq-qspi.c:167:6:
 warning: no previous prototype for 'zynq_qspi_update_stripe'
Message-ID: <202309251029.lwl6qEQG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: 7fe5d3fbd9be0cef89fbe9db59796698379345ea [966/1123] spi: spi-zynq-qspi: Add multi-cs support in Zynq QSPI driver
config: nios2-randconfig-r016-20230905 (https://download.01.org/0day-ci/archive/20230925/202309251029.lwl6qEQG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251029.lwl6qEQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251029.lwl6qEQG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mtd/spi-nor.h:10,
                    from drivers/spi/spi-zynq-qspi.c:19:
   include/linux/mtd/cfi.h:62:2: warning: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Wcpp]
      62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
         |  ^~~~~~~
>> drivers/spi/spi-zynq-qspi.c:167:6: warning: no previous prototype for 'zynq_qspi_update_stripe' [-Wmissing-prototypes]
     167 | bool zynq_qspi_update_stripe(const struct spi_mem_op *op)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/spi/spi-zynq-qspi.c:158: warning: Function parameter or member 'flags' not described in 'zynq_qspi'


vim +/zynq_qspi_update_stripe +167 drivers/spi/spi-zynq-qspi.c

   122	
   123	/* Maximum address width */
   124	#define ZYNQ_QSPI_MAX_ADDR_WIDTH	3
   125	/**
   126	 * struct zynq_qspi - Defines qspi driver instance
   127	 * @ctlr:		Pointer to the spi controller information
   128	 * @dev:		Pointer to the this device's information
   129	 * @regs:		Virtual address of the QSPI controller registers
   130	 * @refclk:		Pointer to the peripheral clock
   131	 * @pclk:		Pointer to the APB clock
   132	 * @irq:		IRQ number
   133	 * @txbuf:		Pointer to the TX buffer
   134	 * @rxbuf:		Pointer to the RX buffer
   135	 * @tx_bytes:		Number of bytes left to transfer
   136	 * @rx_bytes:		Number of bytes left to receive
   137	 * @data_completion:	completion structure
   138	 * @is_stripe:		Flag to indicate if data needs to be split between flashes
   139	 *			(Used in dual parallel configuration)
   140	 */
   141	struct zynq_qspi {
   142		struct spi_controller *ctlr;
   143		struct device *dev;
   144		void __iomem *regs;
   145		struct clk *refclk;
   146		struct clk *pclk;
   147		int irq;
   148		u8 *txbuf;
   149		u8 *rxbuf;
   150		int tx_bytes;
   151		int rx_bytes;
   152		u32 flags;
   153	#define	ZYNQ_QSPI_MEM_CONFIG		BIT(0)
   154	#define	ZYNQ_QSPI_IS_PARALLEL		BIT(1)
   155	#define	ZYNQ_QSPI_IS_STACKED		BIT(2)
   156		bool is_stripe;
   157		struct completion data_completion;
 > 158	};
   159	
   160	/**
   161	 * zynq_qspi_update_stripe - For Zynq QSPI controller data stripe capabilities
   162	 * @op: Pointer to mem ops
   163	 * Return:      Status of the data stripe
   164	 *
   165	 * Returns true if data stripe need to be enabled, else returns false
   166	 */
 > 167	bool zynq_qspi_update_stripe(const struct spi_mem_op *op)
   168	{
   169		if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
   170		    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
   171		    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
   172		    op->cmd.opcode ==  SPINOR_OP_SE ||
   173		    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
   174		    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
   175		    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
   176		    op->cmd.opcode ==  SPINOR_OP_WRSR ||
   177		    op->cmd.opcode ==  SPINOR_OP_WREAR ||
   178		    op->cmd.opcode ==  SPINOR_OP_BRWR ||
   179		    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
   180			return false;
   181	
   182		return true;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
