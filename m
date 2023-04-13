Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC7BA32
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681415944; x=1712951944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UUSa1G0LQLwmjH19KBMdXqzSWP+izEZKyfsK7NpAqvU=;
  b=aiRsTPTGR1yu9ryKtGj9vMRpwzcmObGe645kG2yX/mDm5DK00Zd7JfIy
   NoDXWrqmibN3dBNBNCOuYemZN8RilGcHP7ixvkugUwRDlniZtLRV/B3zQ
   IWajCwrCbbFu9UF4C33iImkqDQpJt2nnTGt98GXQMJbXkDgEpwFIhCS31
   hBNv4sQej/63TIOnPIeD0SaE4k/erYttD5fKYVVmh9ncy3eNr23A7j+3f
   sBayTP3ELp/r3FCsHPyYLKIGYQZJ6WeBph3pEhFnkcTaeFDq4e5+XApgl
   G8pDAP/ExJMORO5wwpk2tc+nNUKRdBcTheCxkQZUXATswPWGUcRBng6r/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="344286970"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="344286970"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 12:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="639817097"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="639817097"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 12:59:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn35w-000Yur-37;
	Thu, 13 Apr 2023 19:59:00 +0000
Date: Fri, 14 Apr 2023 03:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1 914/1065]
 drivers/spi/spi-zynq-qspi.c:167:6: warning: no previous prototype for
 'zynq_qspi_update_stripe'
Message-ID: <202304140342.HGAB2WHR-lkp@intel.com>
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
commit: 2ac69c74ecee73f42f83efc33828cce52d831cfa [914/1065] spi: spi-zynq-qspi: Add multi-cs support in Zynq QSPI driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230414/202304140342.HGAB2WHR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/2ac69c74ecee73f42f83efc33828cce52d831cfa
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1
        git checkout 2ac69c74ecee73f42f83efc33828cce52d831cfa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140342.HGAB2WHR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynq-qspi.c:167:6: warning: no previous prototype for 'zynq_qspi_update_stripe' [-Wmissing-prototypes]
     167 | bool zynq_qspi_update_stripe(const struct spi_mem_op *op)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


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
