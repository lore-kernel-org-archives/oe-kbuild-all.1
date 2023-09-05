Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4171DF72
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 21:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693950539; x=1725486539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g1yZyN/GpqKxLRWPOq+/vO42E8WznN6I1qnQVFf6eAc=;
  b=K/5tRnEp4T9XpLKvXXj9XHAsxLZdxNPplmbM0sD4rRsMLNVqcDovvrjr
   CwPb918jbQS/NPOE3cezfk18I267hJpTsOmICfmK7hP9PPvMocc7c1skv
   B4VJWXFh8UuVI6Bfjcgax5eWzh2J/qG67CEJNgJ7thYGkT2KC5sbP1gP6
   kLmyxfcCryyRNPdGD+g8fTTzgDLJ3/z3h1MgcPKbYILQnpszh2M112qhF
   H+rkhcBZG5hVPjQ4MSmTPEHRLCdxS+WSQOLZYP56tVJX8kpcUBVWBCpMg
   DjycuV96OI4UoghBnVDpdI6nLp3l53I+pQW3iHTfhApMOHFACpGodFRZh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379626613"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="379626613"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 14:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="691074705"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="691074705"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 14:48:57 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qddup-00027T-15;
	Tue, 05 Sep 2023 21:48:55 +0000
Date: Wed, 6 Sep 2023 05:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 946/1123] drivers/spi/spi-zynqmp-gqspi.c:229:6:
 warning: no previous prototype for 'zynqmp_gqspi_update_stripe'
Message-ID: <202309060546.Qq5NU4Be-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amit,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: 754602bf2ee623dc6274c971e7e84058b70450aa [946/1123] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: arc-randconfig-r015-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060546.Qq5NU4Be-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060546.Qq5NU4Be-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060546.Qq5NU4Be-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
