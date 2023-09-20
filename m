Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E91172C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695201651; x=1726737651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YRhPhum1nFJ9fzvLRLIVFt6xCII2rPh0yKA65XWs+cM=;
  b=aJ+K6CBwN5Pl2m4LPRf4hRvo5r3DZT4Bx9AMSyxDY7E9zZ2CM8+gpPDM
   Lzoyt/qQK8k6oKiHFDN8VExsRUAd5RluDViH9jWa4VFelVDc5XV315QNR
   +e//qpbGlq/agd6nL8sTWSh51YMo0l8TnF4XMqofGDekqgXKxX3Ad2opm
   hjgLWY7T1TO9CLm5IuxJTCbodc7x8jvqfBZa7vo8ZMSBWYvOsqQaNBER4
   3/WU3D78V+aFZjw5SPwvSMOyHxuZWHuHzcgeaFaou7Li7Ckh5BXgvB1fF
   /GJ9YwfoTYeClXCV1fLEhcbv0mbrNwopc5KIMdnpSCEEGiWnmNkDf+za7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446643865"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="446643865"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 02:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="740123080"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="740123080"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Sep 2023 02:20:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qitO1-0008Z0-2G;
	Wed, 20 Sep 2023 09:20:45 +0000
Date: Wed, 20 Sep 2023 17:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1332/1363]
 drivers/mtd/spi-nor/winbond.c:45:5: warning: no previous declaration for
 'spi_nor_multi_die_sr_ready'
Message-ID: <202309201740.vihEe6Fm-lkp@intel.com>
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
commit: 7342243138c02416497c48547572f560c8364f87 [1332/1363] mtd: spi-nor: For Winbond flashes with multiple die check WIP of each die
config: i386-randconfig-013-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201740.vihEe6Fm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201740.vihEe6Fm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201740.vihEe6Fm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/winbond.c:45:5: warning: no previous declaration for 'spi_nor_multi_die_sr_ready' [-Wmissing-declarations]
    int spi_nor_multi_die_sr_ready(struct spi_nor *nor)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/spi_nor_multi_die_sr_ready +45 drivers/mtd/spi-nor/winbond.c

    44	
  > 45	int spi_nor_multi_die_sr_ready(struct spi_nor *nor)
    46	{
    47		u8 die;
    48		int ret;
    49	
    50		do
    51			ret = spi_nor_sr_ready(nor);
    52		while (!ret);
    53		if (ret < 0)
    54			return ret;
    55	
    56		if (nor->program_opcode == SPINOR_OP_WRSR ||
    57		    nor->program_opcode == SPINOR_OP_WREAR ||
    58		    nor->program_opcode == SPINOR_OP_CHIP_ERASE) {
    59			for (die = 0; die < WINBOND_NOR_NUM_DIE; die++) {
    60				if (nor->spimem) {
    61					struct spi_mem_op op = SPI_NOR_DIESEL_OP(&die);
    62	
    63					spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
    64	
    65					ret = spi_mem_exec_op(nor->spimem, &op);
    66				} else {
    67					ret = spi_nor_controller_ops_write_reg(nor,
    68									       SPINOR_OP_DIESEL, &die, 1);
    69				}
    70	
    71				if (ret) {
    72					dev_dbg(nor->dev, "error %d Switching Die\n", ret);
    73					return ret;
    74				}
    75	
    76				do
    77					ret = spi_nor_sr_ready(nor);
    78				while (!ret);
    79				if (ret < 0)
    80					return ret;
    81			}
    82		}
    83	
    84		return 0;
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
