Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084C2BE02A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933139; cv=none; b=W4GG05RhFGwimS4+geGy1Qoz24LmPHjObkTLef8tTR+7+upi6owe/GjVD3+U/JqiTss4p0qvIof51vxgJ5cTV4pQCBZLVnSd+rfZ/SYnTDpUDO0QDa3tavXmoMqHDoPeoZnejroabW/6/2Z/1HfByIblgaRFHzHlSPZahziIBAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933139; c=relaxed/simple;
	bh=L2wyAWsXwkYdxSVB0AxMrHbNiD4IMAYWX8jCYraHONE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k4XnnpZg48lzRIbXT6TzoPRnRWgX1JfUsnRbNaplZfQY46p+bMNzNL34uOVPEAorMJ8311BfBN4R43cKYeyeHFOXxQoqEO+HfOiMyLzwD1Pc7DdgcSEEVmoWoppIcyEsYZCPHCiPs6eBvXn4MRanon+aa0vW5px6mrLOBvKCQOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwfRUlVT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwfRUlVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770933138; x=1802469138;
  h=date:from:to:cc:subject:message-id;
  bh=L2wyAWsXwkYdxSVB0AxMrHbNiD4IMAYWX8jCYraHONE=;
  b=SwfRUlVT8DcPMzxaAbG/I3JWIUh+Tawbk5Tf6xC+5p8B1jUAFg5F3Pgz
   1IFqZ+zfp5/XuIi98VBvShHqbXY9nulSStjcQERtQix5YyKQAuD/tFiIO
   JtysEzv6ip6UTHIlL4kBAoJHgGZQKbh6SsOlWn91YZOCpN23kMyrnQW3N
   j95HclzLaUiVzuJ/GsZTqzZt4pxWEA/iLL6g4EnylBnihJ/xlMmiXodl6
   XJnm6yYDwkPeEev/aIv49c1YtiPa/HxxuoVdt1UKT7Rbum1ICiqCBJOih
   IQM/GtdReqbsaJm7kiV7s4QmyB+MBq/oI9067oPLaIyz6LUwykmAJL9Z4
   A==;
X-CSE-ConnectionGUID: 9S43rBmxSjSTbN5NlB15Dg==
X-CSE-MsgGUID: 70unQuGiRomZpMEqiMEACg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94757149"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="94757149"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 13:52:18 -0800
X-CSE-ConnectionGUID: q4DLUe5VRg69BzpXVvWZOQ==
X-CSE-MsgGUID: SLkIKN/LSYKHgAqTOoET9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="211997190"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2026 13:52:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqebd-00000000tfc-3yqV;
	Thu, 12 Feb 2026 21:52:13 +0000
Date: Fri, 13 Feb 2026 05:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 12/12]
 drivers/mtd/nand/raw/hisi504_nand.c:465:28: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202602130502.ZwHFmSVl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   381e953b46044769038aaae1649b66fa6cb55011
commit: 381e953b46044769038aaae1649b66fa6cb55011 [12/12] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: arc-randconfig-r112-20260213 (https://download.01.org/0day-ci/archive/20260213/202602130502.ZwHFmSVl-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130502.ZwHFmSVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130502.ZwHFmSVl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mtd/nand/raw/hisi504_nand.c:362:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/hisi504_nand.c:367:26: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/mtd/nand/raw/hisi504_nand.c:465:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:465:28: sparse:     expected void *ptr
   drivers/mtd/nand/raw/hisi504_nand.c:465:28: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:477:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:477:28: sparse:     expected void *ptr
   drivers/mtd/nand/raw/hisi504_nand.c:477:28: sparse:     got void [noderef] __iomem *mmio
   drivers/mtd/nand/raw/hisi504_nand.c:603:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem *mmio @@
   drivers/mtd/nand/raw/hisi504_nand.c:603:20: sparse:     expected void *ptr
   drivers/mtd/nand/raw/hisi504_nand.c:603:20: sparse:     got void [noderef] __iomem *mmio

vim +465 drivers/mtd/nand/raw/hisi504_nand.c

54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  422  
5295cf2e047cf6 drivers/mtd/nand/raw/hisi504_nand.c Boris Brezillon 2018-09-06  423  static void hisi_nfc_cmdfunc(struct nand_chip *chip, unsigned command,
5295cf2e047cf6 drivers/mtd/nand/raw/hisi504_nand.c Boris Brezillon 2018-09-06  424  			     int column, int page_addr)
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  425  {
5295cf2e047cf6 drivers/mtd/nand/raw/hisi504_nand.c Boris Brezillon 2018-09-06  426  	struct mtd_info *mtd = nand_to_mtd(chip);
d699ed250c0738 drivers/mtd/nand/hisi504_nand.c     Boris Brezillon 2015-12-10  427  	struct hinfc_host *host = nand_get_controller_data(chip);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  428  	int is_cache_invalid = 1;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  429  	unsigned int flag = 0;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  430  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  431  	host->command =  command;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  432  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  433  	switch (command) {
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  434  	case NAND_CMD_READ0:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  435  	case NAND_CMD_READOOB:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  436  		if (command == NAND_CMD_READ0)
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  437  			host->offset = column;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  438  		else
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  439  			host->offset = column + mtd->writesize;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  440  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  441  		is_cache_invalid = 0;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  442  		set_addr(mtd, column, page_addr);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  443  		hisi_nfc_send_cmd_readstart(host);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  444  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  445  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  446  	case NAND_CMD_SEQIN:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  447  		host->offset = column;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  448  		set_addr(mtd, column, page_addr);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  449  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  450  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  451  	case NAND_CMD_ERASE1:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  452  		set_addr(mtd, column, page_addr);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  453  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  454  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  455  	case NAND_CMD_PAGEPROG:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  456  		hisi_nfc_send_cmd_pageprog(host);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  457  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  458  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  459  	case NAND_CMD_ERASE2:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  460  		hisi_nfc_send_cmd_erase(host);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  461  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  462  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  463  	case NAND_CMD_READID:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  464  		host->offset = column;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25 @465  		memset(host->mmio, 0, 0x10);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  466  		hisi_nfc_send_cmd_readid(host);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  467  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  468  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  469  	case NAND_CMD_STATUS:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  470  		flag = hinfc_read(host, HINFC504_CON);
bace41f80f65dc drivers/mtd/nand/raw/hisi504_nand.c Miquel Raynal   2020-08-27  471  		if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  472  			hinfc_write(host,
dd58d38fb30aa9 drivers/mtd/nand/hisi504_nand.c     Dan Carpenter   2015-02-11  473  				    flag & ~(HINFC504_CON_ECCTYPE_MASK <<
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  474  				    HINFC504_CON_ECCTYPE_SHIFT), HINFC504_CON);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  475  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  476  		host->offset = 0;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  477  		memset(host->mmio, 0, 0x10);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  478  		hisi_nfc_send_cmd_status(host);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  479  		hinfc_write(host, flag, HINFC504_CON);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  480  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  481  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  482  	case NAND_CMD_RESET:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  483  		hisi_nfc_send_cmd_reset(host, host->chipselect);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  484  		break;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  485  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  486  	default:
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  487  		dev_err(host->dev, "Error: unsupported cmd(cmd=%x, col=%x, page=%x)\n",
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  488  			command, column, page_addr);
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  489  	}
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  490  
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  491  	if (is_cache_invalid) {
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  492  		host->cache_addr_value[0] = ~0;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  493  		host->cache_addr_value[1] = ~0;
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  494  	}
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  495  }
54f531f6e33287 drivers/mtd/nand/hisi504_nand.c     Zhou Wang       2015-01-25  496  

:::::: The code at line 465 was first introduced by commit
:::::: 54f531f6e332875bd8a604871532f7f1174adc0e mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc

:::::: TO: Zhou Wang <wangzhou1@hisilicon.com>
:::::: CC: Brian Norris <computersforpeace@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
