Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384271E4AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735050391; cv=none; b=CukaAjOBrbOStwWha8DBrXndo8c70QXE3WiBxH5rSXlmcn80cJEyrtN5F2sYipojSX6lOYzeKigakHJ0c5g4Fd5mPxtyBStws00AjQ07pNsYOl76dJYi3RDpR77qEKH2l+XcnBQ7eAfypxFQHsJ+RjYBu4FWY25r33VouS7YHJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735050391; c=relaxed/simple;
	bh=eSWu//augV+eisv5d0OEyPX/1l1Qao9dPRxECDqL8L0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mYYfKOy5ccpDywUgH4/22wrXknUCelsLRH+lrhU7D3MfOi6XT6wEtrdVH2jitpBnidMmj8mKU7RJsc7mP5SHPzNjbNj8DfpYvsv8kHPtGqiB5ZjWYthlKI85W6+DtWvcbTDa4IJ3v9JGyfIUQcx1MdmdMzTwRZHCqUwM5KvYou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWmihYOp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWmihYOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735050389; x=1766586389;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eSWu//augV+eisv5d0OEyPX/1l1Qao9dPRxECDqL8L0=;
  b=nWmihYOpI4LM0iWlEhmXK/q+pfOSABlCMxBEd2GwEifVAQ3WLRNNBvk3
   N/HzQaeNx8GKY+6YbO3Ied6GYDms4ByNITPATVV7VIKLP4qvtjfis7MZT
   WnLuHhsp2cG0qtSglmSb320i18CrvK+4mDtLTBdWziIcvw7ieDVL/6n4+
   HTTyK6vKNiYWpkBlY3+SdHt+4uoVL8hRefFUAcUW/IXr2/KibAN1vKo3Q
   lu2rbgNOJtv78rMb4ptFwwOhJlwtemh3SLM4qfLBeG6BD08ktcsN9Td/e
   ziOCqD9SIBKiWmzGC34ls91FioVQGDj78CVM+LKXAIE9yb2+d0np2lH/t
   Q==;
X-CSE-ConnectionGUID: iyRY+0BtTumc7ARfSteA+A==
X-CSE-MsgGUID: Ps3k2drDQpmN5WYqFamb7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35683014"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35683014"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 06:26:28 -0800
X-CSE-ConnectionGUID: 7as7wrcwQE+IXcToBETi5A==
X-CSE-MsgGUID: ZEX4UjzuTUmR3hF7W7F73Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104574507"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Dec 2024 06:26:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ5rc-0001DB-2K;
	Tue, 24 Dec 2024 14:26:24 +0000
Date: Tue, 24 Dec 2024 22:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/firmware/broadcom/bcm47xx_nvram.c:55: warning: Function
 parameter or struct member 'flash_start' not described in
 'bcm47xx_nvram_find_and_copy'
Message-ID: <202412242251.Dsb6ZpjZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f07044dd0df0c9d0ad177c3098b62ccddb735a2d
commit: fb009cbdd0693bd633f11e99526617b3d392cfad firmware: bcm47xx_nvram: rename finding function and its variables
date:   3 years, 9 months ago
config: arm64-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241224/202412242251.Dsb6ZpjZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412242251.Dsb6ZpjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412242251.Dsb6ZpjZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/broadcom/bcm47xx_nvram.c:55: warning: Function parameter or struct member 'flash_start' not described in 'bcm47xx_nvram_find_and_copy'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:55: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_find_and_copy'


vim +55 drivers/firmware/broadcom/bcm47xx_nvram.c

f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   50  
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   51  /**
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   52   * bcm47xx_nvram_find_and_copy - find NVRAM on flash mapping & copy it
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   53   */
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   54  static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_size)
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08  @55  {
8d602dd0f984e84 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   56  	struct nvram_header __iomem *header;
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   57  	size_t flash_size;
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   58  	u32 size;
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   59  
94a0535baf4d782 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06   60  	if (nvram_len) {
8d602dd0f984e84 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   61  		pr_warn("nvram already initialized\n");
8d602dd0f984e84 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   62  		return -EEXIST;
8d602dd0f984e84 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   63  	}
8d602dd0f984e84 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   64  
c4485671fbbb6fc arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   65  	/* TODO: when nvram is on nand flash check for bad blocks first. */
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   66  	flash_size = FLASH_MIN;
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   67  	while (flash_size <= res_size) {
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   68  		/* Windowed flash access */
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   69  		size = find_nvram_size(flash_start + flash_size);
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   70  		if (size) {
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   71  			header = (struct nvram_header *)(flash_start + flash_size - size);
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   72  			goto found;
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   73  		}
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   74  		flash_size <<= 1;
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   75  	}
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   76  
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   77  	/* Try embedded NVRAM at 4 KB and 1 KB as last resorts */
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   78  	header = (struct nvram_header *)(flash_start + 4096);
341097f17c76b3d arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-10-30   79  	if (header->magic == NVRAM_MAGIC) {
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   80  		size = NVRAM_SPACE;
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   81  		goto found;
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   82  	}
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   83  
fb009cbdd0693bd drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   84  	header = (struct nvram_header *)(flash_start + 1024);
341097f17c76b3d arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-10-30   85  	if (header->magic == NVRAM_MAGIC) {
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   86  		size = NVRAM_SPACE;
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   87  		goto found;
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   88  	}
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   89  
f36738ddfeea028 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   90  	pr_err("no nvram found\n");
cc4403e02541af2 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   91  	return -ENXIO;
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   92  
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   93  found:
1f330c3279004dd drivers/firmware/broadcom/bcm47xx_nvram.c Stephen Boyd      2016-01-20   94  	__ioread32_copy(nvram_buf, header, sizeof(*header) / 4);
4c11e554fb894b3 drivers/firmware/broadcom/bcm47xx_nvram.c Aaro Koskinen     2016-03-17   95  	nvram_len = ((struct nvram_header *)(nvram_buf))->len;
94a0535baf4d782 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06   96  	if (nvram_len > size) {
55cab93bcf1422a arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21   97  		pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
94a0535baf4d782 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06   98  		nvram_len = size;
55cab93bcf1422a arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21   99  	}
94a0535baf4d782 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06  100  	if (nvram_len >= NVRAM_SPACE) {
feb4eb060c3aecc drivers/firmware/broadcom/bcm47xx_nvram.c Florian Fainelli  2019-05-14  101  		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
4c11e554fb894b3 drivers/firmware/broadcom/bcm47xx_nvram.c Aaro Koskinen     2016-03-17  102  		       nvram_len, NVRAM_SPACE - 1);
94a0535baf4d782 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06  103  		nvram_len = NVRAM_SPACE - 1;
55cab93bcf1422a arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21  104  	}
55cab93bcf1422a arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21  105  	/* proceed reading data after header */
1f330c3279004dd drivers/firmware/broadcom/bcm47xx_nvram.c Stephen Boyd      2016-01-20  106  	__ioread32_copy(nvram_buf + sizeof(*header), header + 1,
1f330c3279004dd drivers/firmware/broadcom/bcm47xx_nvram.c Stephen Boyd      2016-01-20  107  			DIV_ROUND_UP(nvram_len, 4));
d28c9a55c297db6 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-05-12  108  	nvram_buf[NVRAM_SPACE - 1] = '\0';
cc4403e02541af2 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26  109  
cc4403e02541af2 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26  110  	return 0;
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08  111  }
121915c4ee0812a arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08  112  

:::::: The code at line 55 was first introduced by commit
:::::: 121915c4ee0812a14bc8d752bc210d0238d755c1 MIPS: BCM47xx: Add NVRAM support devices

:::::: TO: Waldemar Brodkorb <mips@waldemar-brodkorb.de>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
