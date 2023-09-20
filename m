Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D83C8E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695197768; x=1726733768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZKYRoUVaeCSNwSHyuSliIH9MGCpjscLXk+Xk+FC8pI=;
  b=hF7HLyJTWzZCt+Ywu0JifvmXBw6YGFSbS4DhRaef9cgJqNewEkB0Hksh
   KeOXZms5pu/HXRm/BOg3h1q/h+xnr1e7EqRl6qSyovgCtOncFv19gttBE
   v21FrDW5BYR5EONN+6zViAQa7xmna7ZdN3pR7ICZ6+9sqPqYER+3wsEtN
   MizUXG79dlfN2dHbN0H6X5PqCRQMaKzOg1EqNuR+Albpe/l5pf16bDmgS
   u14Em7oDnqiW/qyHlGRtdTizAAaLhAKMkK4I9SyLTUcsN2RBoofIAx2uf
   2lLNbPmCfc5hsqK7wJAwLNIgMv+P/DPW9boPByfPN0XxZlRPJoL8l9uGW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="444254430"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="444254430"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 01:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746560962"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="746560962"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 20 Sep 2023 01:16:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qisNK-0008Ui-0D;
	Wed, 20 Sep 2023 08:15:58 +0000
Date: Wed, 20 Sep 2023 16:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 894/1363]
 drivers/spi/spi-zynqmp-gqspi.c:229:6: warning: no previous declaration for
 'zynqmp_gqspi_update_stripe'
Message-ID: <202309201642.44k03jXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: b6d3f45bb9e69eb86a125a3ac6ebd60c14bc872c [894/1363] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: i386-randconfig-013-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201642.44k03jXZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201642.44k03jXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201642.44k03jXZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynqmp-gqspi.c:229:6: warning: no previous declaration for 'zynqmp_gqspi_update_stripe' [-Wmissing-declarations]
    bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/spi/spi-zynqmp-gqspi.c:13:0:
   include/linux/firmware/xlnx-zynqmp.h:1334:12: warning: 'versal_pm_sha_hash' defined but not used [-Wunused-function]
    static int versal_pm_sha_hash(const u64 src, const u64 dst, const u32 size)
               ^~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1329:12: warning: 'zynqmp_pm_fpga_get_feature_list' defined but not used [-Wunused-function]
    static int zynqmp_pm_fpga_get_feature_list(u32 *value)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1324:12: warning: 'zynqmp_pm_fpga_get_version' defined but not used [-Wunused-function]
    static int zynqmp_pm_fpga_get_version(u32 *value)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1254:12: warning: 'zynqmp_pm_sec_mask_write_reg' defined but not used [-Wunused-function]
    static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:1249:12: warning: 'zynqmp_pm_sec_read_reg' defined but not used [-Wunused-function]
    static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
               ^~~~~~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests/wiki
