Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1FF134B6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727437577; cv=none; b=Fg7Qusm+94BRCM81QX/nN/3nnEM93KwdyZabZA2gqOhJR7jmUa81GaM7MNr5jZuuU5YORQR8w3hVN6f0dTLmH710sMxvak1vTH9EGUiri9JmqX/0bQ6hwvT/Y/Cer+6UKxrx5YdcwzHUGlO69d4RTUNbAViFtCZyjPNiOtISNtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727437577; c=relaxed/simple;
	bh=rPXbdWLvgfVSSVMuq2lybQbiQ2VejmFB1kwFnn5LTls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKjACzTkfCxrj81DT0nRfhg2NLdEI9ca7NJ71EOmNKrnoCnv+ZVt9nOrHIGF8n/sPAq6BQm0eOqkeg6CFjlTXbJKsHTig/8Q4i34gFSRKsPqsKCZeL5SNoL+3GWQYUQQNky1ZIUbYvbOSwxo7P4NghIicH0Y7IaFAVqCwtl+xNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSf7NMTD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSf7NMTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727437576; x=1758973576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rPXbdWLvgfVSSVMuq2lybQbiQ2VejmFB1kwFnn5LTls=;
  b=BSf7NMTDEyOgcgo3SBwBEFQpD0/iufIKSg6YG1H4y9EHDwL5lsUIdZbW
   u5SXwxNcXYLZQLWjuC3J9bLVK0jOxRWLXTUwcP0RdcaW+MK7WvGLA/KEg
   ohQswHwne26+ZUF2lDttQ4gOZxVrBcFAIPAsEssAItgO01lRsHVG1ajjV
   aKoCKpGgM2SJTDnjrge9RhjFNr4UMoT+R1A/S1wwY+e8b3DEx65IzksdL
   jpM0tAtOFMdKRgmomN1VKB0pu1PPnIWLaAig17UrQqtxDWIXl7Ki2NYkK
   mbuN7p8n1HYEuzKA0xoui0WV9Bqi9nK9oV3VoX1GD+OjymQSbUrwparzn
   g==;
X-CSE-ConnectionGUID: N3ULjC9QTkuybI5A+CeHRA==
X-CSE-MsgGUID: sq/vPwKoR+2W2T9qsRoxgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26380352"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26380352"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 04:46:15 -0700
X-CSE-ConnectionGUID: NBn+4vIrSSWcvCeZ7f5XOA==
X-CSE-MsgGUID: w4qfap5BTT6CRHZDK9/3tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="103303022"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2024 04:46:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su9QJ-000Lrh-1K;
	Fri, 27 Sep 2024 11:46:11 +0000
Date: Fri, 27 Sep 2024 19:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 653/1001]
 drivers/spi/spi-zynqmp-gqspi.c:227:6: warning: no previous prototype for
 'zynqmp_gqspi_update_stripe'
Message-ID: <202409271920.YJV6gbNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 49ca08cbfd979a5d3ce09aa8a0702e9ab47a62c8 [653/1001] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: i386-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271920.YJV6gbNR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271920.YJV6gbNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271920.YJV6gbNR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynqmp-gqspi.c:227:6: warning: no previous prototype for 'zynqmp_gqspi_update_stripe' [-Wmissing-prototypes]
     227 | bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/spi/spi-zynqmp-gqspi.c:13:
   include/linux/firmware/xlnx-zynqmp.h:898:12: warning: 'zynqmp_pm_fpga_get_feature_list' defined but not used [-Wunused-function]
     898 | static int zynqmp_pm_fpga_get_feature_list(u32 *value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:893:12: warning: 'zynqmp_pm_fpga_get_version' defined but not used [-Wunused-function]
     893 | static int zynqmp_pm_fpga_get_version(u32 *value)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/zynqmp_gqspi_update_stripe +227 drivers/spi/spi-zynqmp-gqspi.c

   219	
   220	/**
   221	 * zynqmp_gqspi_update_stripe - For GQSPI controller data stripe capabilities
   222	 * @op:	Pointer to mem ops
   223	 * Return:      Status of the data stripe
   224	 *
   225	 * Returns true if data stripe need to be enabled, else returns false
   226	 */
 > 227	bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
   228	{
   229		if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
   230		    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
   231		    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
   232		    op->cmd.opcode ==  SPINOR_OP_SE ||
   233		    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
   234		    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
   235		    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
   236		    op->cmd.opcode ==  SPINOR_OP_WRSR ||
   237		    op->cmd.opcode ==  SPINOR_OP_BRWR ||
   238		    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
   239			return false;
   240	
   241		return true;
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
