Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A7358B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgqgX8NZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697738000; x=1729274000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZotnJX5iDg/I4X+qoSh4atw0SBVgWbZzX4JcumCeFZk=;
  b=KgqgX8NZF4pLn7C97/uIKgVT/ivLRK3mr4jNKnh1Jg9QVtcuV2jqFnAR
   8sf53PkPphIzKNFderIsPopSnStjrvhqeaelkZ/NGzw4zdhzaNplUwEoD
   vDxb/q8RQb8cg7+lmxPpJh4LoQoAyPSoACNErocLNePeDSiryXqqeo03K
   mPPej99piKYvFvFT+fWQlpL9NoS4k73aoQiMkljhoALcAce6hzMhM+DUW
   rPkKg/ZOeo7LZ/nfztV/FSAxVoMsKFunq7Ny90bGlyoj+VPJjIFshw4Xy
   IZgQWb05dD6HBcy15u9KeB20Hmt/5fL4dBDfSinrVZTzK1ihW7RDCFvuI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452801078"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452801078"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 10:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733667205"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733667205"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 10:53:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtXCt-0002J7-1B;
	Thu, 19 Oct 2023 17:53:15 +0000
Date: Fri, 20 Oct 2023 01:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 946/1123] drivers/spi/spi-zynqmp-gqspi.c:229:6:
 warning: no previous declaration for 'zynqmp_gqspi_update_stripe'
Message-ID: <202310200102.TuqdHLwd-lkp@intel.com>
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
commit: 754602bf2ee623dc6274c971e7e84058b70450aa [946/1123] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: i386-randconfig-016-20231019 (https://download.01.org/0day-ci/archive/20231020/202310200102.TuqdHLwd-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200102.TuqdHLwd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200102.TuqdHLwd-lkp@intel.com/

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
