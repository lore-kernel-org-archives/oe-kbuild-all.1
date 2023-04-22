Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CFA7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 07:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682148823; x=1713684823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFX+69UFsEY5qjVrSqGpEVjKFLjmrLAlGcK2+zEsxtg=;
  b=RcQqgnkdfauuehGKQYArIlcpDlp3PaUvYfQHOBBFODtWYlAgxJ1olkbw
   DTvvHNGwS6/B3GELfjNgbLz0l/ydbQdyWRLxjnUtdIjx/ftw/D8RnPKQ/
   SHoeyv1Q00jJRPI0SXZUHf30RZbhM1orZTRkkvzS48sVtSOGGnUnLBOYN
   rVDWaOo+YFpFPM10ERREOuPyCE8Ng/JPVl3zBdB9Xx7m8ILf15bNhfbIA
   6OxY9v5DfONDoK1t+9IW1Rl9Y//erRI3JFHNyzG3vHBRJg8lsr/fFBdHk
   valZyCRChD36yr6WrJ0z2VRmNoyXdIxNX22f6vARy6HyVf7spIGdXpU+C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="409075361"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="409075361"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 00:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781833547"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="781833547"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2023 00:33:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq7kY-000hAO-0i;
	Sat, 22 Apr 2023 07:33:38 +0000
Date: Sat, 22 Apr 2023 15:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 966/1117] drivers/spi/spi-zynq-qspi.c:167:6:
 warning: no previous prototype for 'zynq_qspi_update_stripe'
Message-ID: <202304221545.sXCm59rf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: 7fe5d3fbd9be0cef89fbe9db59796698379345ea [966/1117] spi: spi-zynq-qspi: Add multi-cs support in Zynq QSPI driver
config: arc-randconfig-r043-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221545.sXCm59rf-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/7fe5d3fbd9be0cef89fbe9db59796698379345ea
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 7fe5d3fbd9be0cef89fbe9db59796698379345ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221545.sXCm59rf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynq-qspi.c:167:6: warning: no previous prototype for 'zynq_qspi_update_stripe' [-Wmissing-prototypes]
     167 | bool zynq_qspi_update_stripe(const struct spi_mem_op *op)
         |      ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])


vim +/zynq_qspi_update_stripe +167 drivers/spi/spi-zynq-qspi.c

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
https://github.com/intel/lkp-tests
