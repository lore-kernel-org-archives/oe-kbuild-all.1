Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E713FE5C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 23:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/D08m7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701817440; x=1733353440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXoYNXCzqOrgVGOjoxNqZFaBx/iomzF0GtuSahaTLJY=;
  b=e/D08m7AIsWz+5zfUKyimJawUkZQ4yjW++Q9rVsb61vYv1TcUK5p006U
   EqfVn65Wi4Vyp/bAb8ltEEv/hRqFPXHX9ZNIZ6lrzAxB3FUyfOZmsErEV
   BfsSHbkrbqL5nyumldLnWb438gVoOi8Ph3NH3vZoRixwAQ3j4mMc2c6iW
   saQlRiC8r37vc4KgTBsd30ZV8cOxhTNwlN0tPxoxRsDWVYbD26K4mgTrp
   dKL2yBAJYc3kXRR6gfDrQ6sY0Yp6BBmR8eQZoE7920YJqpAMfzNgoSGfa
   Q6rPaI6LS9eSyXFUI0PKFl61PMqKEHDOS6SSc7n/qCoHbUB9dukz1re3I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1031271"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1031271"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 15:03:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841631766"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841631766"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 15:03:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAeSI-0009py-24;
	Tue, 05 Dec 2023 23:03:54 +0000
Date: Wed, 6 Dec 2023 07:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 29/42] drivers/spi/spi-zynq-qspi.c:167:6:
 sparse: sparse: symbol 'zynq_qspi_update_stripe' was not declared. Should it
 be static?
Message-ID: <202312060605.vTJvD8EK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   414b0dc753ec961cf8e532b86412522e78a00169
commit: f941d3281b2d6cb258f536ba0d729ae54abae67c [29/42] spi: spi-zynq-qspi: Add multi-cs support in Zynq QSPI driver
config: sh-randconfig-r122-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060605.vTJvD8EK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060605.vTJvD8EK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060605.vTJvD8EK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-zynq-qspi.c:167:6: sparse: sparse: symbol 'zynq_qspi_update_stripe' was not declared. Should it be static?
   drivers/spi/spi-zynq-qspi.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

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
https://github.com/intel/lkp-tests/wiki
