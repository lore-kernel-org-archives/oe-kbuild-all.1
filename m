Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CD2C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681410964; x=1712946964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQxY8y8ghcVRsOh0i59qrl7q/US9ew4SDk+5oZI9poA=;
  b=DZJaaHa7iymsnt8O+hyyrJwMLULGlit+SoqCdZFKUiIo+oO05xvErvgo
   oaSHroCoiJqjhZYJqLiGDnMrse+rQaZfaXtQli62MKkxZLQ8DQqT8cyQb
   H3YWV6Z8s3ou+YevY2Vxs/EMQW4VTkkA9XhOmNFSSqcY/cB4mKfxDtofD
   pcjvUP4JT02u3oz0ycJILPGDnrDoyP8cmONdEXMQIIXqI9KfO92nRVBkL
   Vwf55wbG0FzZncXyFLVwFDUP8a5JYQE77PTC94lxw0zuZtAcaRjMDRYeA
   QVBuV571Z71BpJ2+uWKmgBAXuM8uM1PPsctBmc2l4IBR9+k4ytIXkPdVy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="328411493"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="328411493"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 11:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="800906371"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="800906371"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 11:36:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn1nb-000YsQ-1C;
	Thu, 13 Apr 2023 18:35:59 +0000
Date: Fri, 14 Apr 2023 02:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1 894/1065]
 drivers/spi/spi-zynqmp-gqspi.c:229:6: warning: no previous prototype for
 'zynqmp_gqspi_update_stripe'
Message-ID: <202304140258.cAQcxGXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1
head:   bbf25ceb15a43c9047e14ab46a1d25c8ae6b67b4
commit: 6f819749a70b1dfaf7ab06422e342c6d26d2863a [894/1065] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230414/202304140258.cAQcxGXL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/6f819749a70b1dfaf7ab06422e342c6d26d2863a
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1
        git checkout 6f819749a70b1dfaf7ab06422e342c6d26d2863a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140258.cAQcxGXL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynqmp-gqspi.c:229:6: warning: no previous prototype for 'zynqmp_gqspi_update_stripe' [-Wmissing-prototypes]
     229 | bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/spi/spi-zynqmp-gqspi.c:13:
   include/linux/firmware/xlnx-zynqmp.h:1334:12: warning: 'versal_pm_sha_hash' defined but not used [-Wunused-function]
    1334 | static int versal_pm_sha_hash(const u64 src, const u64 dst, const u32 size)
         |            ^~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1329:12: warning: 'zynqmp_pm_fpga_get_feature_list' defined but not used [-Wunused-function]
    1329 | static int zynqmp_pm_fpga_get_feature_list(u32 *value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1324:12: warning: 'zynqmp_pm_fpga_get_version' defined but not used [-Wunused-function]
    1324 | static int zynqmp_pm_fpga_get_version(u32 *value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1254:12: warning: 'zynqmp_pm_sec_mask_write_reg' defined but not used [-Wunused-function]
    1254 | static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1249:12: warning: 'zynqmp_pm_sec_read_reg' defined but not used [-Wunused-function]
    1249 | static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/zynqmp_gqspi_update_stripe +229 drivers/spi/spi-zynqmp-gqspi.c

   221	
   222	/**
   223	 * zynqmp_gqspi_update_stripe - For GQSPI controller data stripe capabilities
   224	 * @op:	Pointer to mem ops
   225	 * Return:      Status of the data stripe
   226	 *
   227	 * Returns true if data stripe need to be enabled, else returns false
   228	 */
 > 229	bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
   230	{
   231		if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
   232		    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
   233		    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
   234		    op->cmd.opcode ==  SPINOR_OP_SE ||
   235		    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
   236		    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
   237		    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
   238		    op->cmd.opcode ==  SPINOR_OP_WRSR ||
   239		    op->cmd.opcode ==  SPINOR_OP_BRWR ||
   240		    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
   241			return false;
   242	
   243		return true;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
