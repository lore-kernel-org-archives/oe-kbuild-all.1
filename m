Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0561CF96
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728207615; cv=none; b=I7ThmA399Kv4Di39aQ3Z5w/kZlFSeNJVc7Ry6kHq0hKQfYTuVl0/+F3iupHN5VtWziFST1tjpdJM7254Fe+40dTkYGOK0Zdd7aM40nhJsTfj9p3XQDxp0xAUAJOc2WZbTTx1iDIaun+3qpquIw7Sf9U3anjhGRISo8+NkORtGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728207615; c=relaxed/simple;
	bh=QEgIkOjbcaRUINjEaWzncAX70EcNtj2K3KQKZlfcpVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFdiyw2PgXVZEDtY2NSjY/hXxsYoaIYDRW3/SRxqtJRMV0TZoc4zTVxJzvTVLvihaINAHi7fY/oYEe1Y+Y5NhbjH39uPiXOzuShLgsJllgtpq9PNPHLUfNgPgggq9M6hOUNhbzDUVz3tB/QYZDsn5FMj5g779ytmcTd2kuc326Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxT42yfE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxT42yfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728207613; x=1759743613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QEgIkOjbcaRUINjEaWzncAX70EcNtj2K3KQKZlfcpVQ=;
  b=TxT42yfE6+m95cigMIc5d9NyHlUAKKkpQCkYzEUAtm5GIGksztI9Dixg
   rhf4o8kTXo/a3msta4N7vB5wV9qeyFILuX9cdXhKgb6zK+X8KSQ4qTDQx
   TqqM/Yn76/Pa4M4MHPeXmwz/CyRT1C5kXK51Cnuz6HgCJD4goPvvJnJmD
   MY2bLB1+8ZgH8sVq2jfVOaxEfE/Wy2FeqbsiLQcw9DtAgl7ii994bPbT8
   2OFcwRAYjyQ/wdiD/eSOQraaR94wMP/gTk6qgSY94wn1cHhDxxTIoZJgG
   1CyYdQJoOYkx7SgyWoA8DiIuDfCrYXqVcnGB3eBX3m82NLG8qjf+3UEQ1
   g==;
X-CSE-ConnectionGUID: 55/62yrESECFgWx1Vu9PTw==
X-CSE-MsgGUID: 2uLC3hfZRGaXhiLvXJrJPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="49904870"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="49904870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 02:40:13 -0700
X-CSE-ConnectionGUID: U9KKpybERJizyU0TzcKiEQ==
X-CSE-MsgGUID: IjMbbm4mSpWkD/rESO0BVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="75597600"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2024 02:40:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxNkH-0003m0-1D;
	Sun, 06 Oct 2024 09:40:09 +0000
Date: Sun, 6 Oct 2024 17:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 665/1001]
 drivers/mtd/spi-nor/winbond.c:45:5: warning: no previous prototype for
 'spi_nor_multi_die_sr_ready'
Message-ID: <202410061709.1LBdf04w-lkp@intel.com>
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
commit: 20b2aab47dff365990bb9af15abfaff80e9c8ca2 [665/1001] mtd: spi-nor: winbond: Add support for Winbond flashes
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410061709.1LBdf04w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410061709.1LBdf04w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410061709.1LBdf04w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/winbond.c:45:5: warning: no previous prototype for 'spi_nor_multi_die_sr_ready' [-Wmissing-prototypes]
      45 | int spi_nor_multi_die_sr_ready(struct spi_nor *nor)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


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
    56		for (die = 0; die < WINBOND_NOR_NUM_DIE; die++) {
    57			nor->bouncebuf[0] = die;
    58			if (nor->spimem) {
    59				struct spi_mem_op op = SPI_NOR_DIESEL_OP(nor->bouncebuf);
    60	
    61				spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
    62				ret = spi_mem_exec_op(nor->spimem, &op);
    63			} else {
    64				ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_DIESEL,
    65								       nor->bouncebuf, 1);
    66			}
    67	
    68			if (ret) {
    69				dev_dbg(nor->dev, "error %d Switching Die\n", ret);
    70				return ret;
    71			}
    72	
    73			do
    74				ret = spi_nor_sr_ready(nor);
    75			while (!ret);
    76			if (ret < 0)
    77				return ret;
    78		}
    79	
    80		return ret;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
