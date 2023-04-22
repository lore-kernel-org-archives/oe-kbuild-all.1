Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456427F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 08:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682150681; x=1713686681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nkvnvHJLqHcxO4wXA5cb3OPwjGsRtFBweWopy2q0iG0=;
  b=CrZZ9yuut4VobCPJ0HGn9c8ad9plNHSbvQJ1vdikXdvK4+XnsSHcMf91
   ia282e4MmSC56otHoOtGPs8ajuttpgt9ekcyrOFaJyvnYEDf9uxD5kSPx
   EWEy7ksbmKGcwbm7p7AktBZuHo+kV551/sfxJLnitU9zRmjjaMZ0VIkrF
   o7ApACewB4awH7wm9TZboTqebpaLhfL0gnnrjMgs0TMIJewMmwuSmswVn
   BW1NaYtjW26QowgRSVv1XDpVpJHe8fHht+Hvh6aJOsPz/k0p8Gr9PAkpy
   UXQboYflxA6YeIu8I0WWzfTe142DIou32xobGSFf62dbPmYDXNEIUQ+DP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="343623585"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="343623585"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 01:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="938746815"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="938746815"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Apr 2023 01:04:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq8EY-000hB0-1g;
	Sat, 22 Apr 2023 08:04:38 +0000
Date: Sat, 22 Apr 2023 16:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 946/1117] drivers/spi/spi-zynqmp-gqspi.c:229:6:
 warning: no previous prototype for 'zynqmp_gqspi_update_stripe'
Message-ID: <202304221513.SLSeRNeC-lkp@intel.com>
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
commit: 754602bf2ee623dc6274c971e7e84058b70450aa [946/1117] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230422/202304221513.SLSeRNeC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/754602bf2ee623dc6274c971e7e84058b70450aa
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 754602bf2ee623dc6274c971e7e84058b70450aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221513.SLSeRNeC-lkp@intel.com/

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
