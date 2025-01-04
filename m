Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9BB20EB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735993241; cv=none; b=TbuRnypPCvxCg8ba1J6V4LtY/vCRTTylkdv4zCRChdpltVm3xAZtWUupMmB8RhQeIxxikJ016ED7S3B0MlZBNut4vdcV6vF0ZCQHH6MacIF7yRnz1XkyQJXub6+RtoKlNdCz804QsrKYCabtlTpzzYMAcSaflvfFK3j1iUT19Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735993241; c=relaxed/simple;
	bh=XurH9Yziz7za2y3QtSeG0ThDhZSwYgtyrPJHmCt08a0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqZYRPhCpaiuP1GXw3f6tVBLqYN+UpKlHfBLP300IqFBFjt73qvocUHgXMKXmXsoKPGXbowi+tSzoFgre/XBl3HR8V3+0bMIp4vJwLrSXursjZ8vienRjNK0J8U+NbED+B3iReulvF0LfAOOY8GuP3kcu3ys/bn4FI649BW3AUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YprrrGdo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YprrrGdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735993240; x=1767529240;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XurH9Yziz7za2y3QtSeG0ThDhZSwYgtyrPJHmCt08a0=;
  b=YprrrGdo6WGt6QNh6pF6Zpn79KKiG5oBrCbG30DggXj0+NOvv+V6GHkY
   5cgVQftxj6COsf8p7+WDjYI2lrS1fI5dVDgjzkKnIGs/eaUafIEEUV+KT
   mFMx2BV74QWLBhJeLziz3cEw8drsgS01iIuBg/uJF1OIq/H1XOfHtdDQx
   w6hfDHUzAiF4pY859Cma+xN2ODYwStjGo8WKH++prp+3qiJxI8FDoaPHu
   by2O8wFtm9IsPeJxhjBwPwMoBWEwuz6Y8Wkz4abupM06X870ILsVUpeC3
   hf2U5kS5uPw0rN9EnjEej7sFBcO+EPXMGMBAo5T3peoV1uZHKzQ15KNOw
   w==;
X-CSE-ConnectionGUID: EWvdZgPYSnWlpH/gxoql4w==
X-CSE-MsgGUID: Ln2Id82MTL2Gz1eI9ZvO1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="23813385"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="23813385"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 04:20:39 -0800
X-CSE-ConnectionGUID: OU1+mplzTuyev2r3/A/FwA==
X-CSE-MsgGUID: 6qOYWouDSAih8KJXXtp+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="101835741"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jan 2025 04:20:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU38t-000Atr-0J;
	Sat, 04 Jan 2025 12:20:35 +0000
Date: Sat, 4 Jan 2025 20:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/firmware/broadcom/bcm47xx_nvram.c:55: warning: Function
 parameter or struct member 'flash_start' not described in
 'bcm47xx_nvram_find_and_copy'
Message-ID: <202501042024.1bBjlJCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Rafał,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: fb009cbdd0693bd633f11e99526617b3d392cfad firmware: bcm47xx_nvram: rename finding function and its variables
date:   3 years, 10 months ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250104/202501042024.1bBjlJCW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501042024.1bBjlJCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501042024.1bBjlJCW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/broadcom/bcm47xx_nvram.c:55: warning: Function parameter or struct member 'flash_start' not described in 'bcm47xx_nvram_find_and_copy'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:55: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_find_and_copy'


vim +55 drivers/firmware/broadcom/bcm47xx_nvram.c

f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   50  
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   51  /**
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   52   * bcm47xx_nvram_find_and_copy - find NVRAM on flash mapping & copy it
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   53   */
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   54  static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_size)
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08  @55  {
8d602dd0f984e8 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   56  	struct nvram_header __iomem *header;
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   57  	size_t flash_size;
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   58  	u32 size;
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   59  
94a0535baf4d78 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06   60  	if (nvram_len) {
8d602dd0f984e8 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   61  		pr_warn("nvram already initialized\n");
8d602dd0f984e8 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   62  		return -EEXIST;
8d602dd0f984e8 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   63  	}
8d602dd0f984e8 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-09-03   64  
c4485671fbbb6f arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   65  	/* TODO: when nvram is on nand flash check for bad blocks first. */
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   66  	flash_size = FLASH_MIN;
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   67  	while (flash_size <= res_size) {
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   68  		/* Windowed flash access */
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   69  		size = find_nvram_size(flash_start + flash_size);
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   70  		if (size) {
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   71  			header = (struct nvram_header *)(flash_start + flash_size - size);
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   72  			goto found;
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   73  		}
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   74  		flash_size <<= 1;
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   75  	}
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   76  
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   77  	/* Try embedded NVRAM at 4 KB and 1 KB as last resorts */
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   78  	header = (struct nvram_header *)(flash_start + 4096);
341097f17c76b3 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-10-30   79  	if (header->magic == NVRAM_MAGIC) {
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   80  		size = NVRAM_SPACE;
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   81  		goto found;
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   82  	}
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   83  
fb009cbdd0693b drivers/firmware/broadcom/bcm47xx_nvram.c Rafał Miłecki     2021-03-08   84  	header = (struct nvram_header *)(flash_start + 1024);
341097f17c76b3 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2014-10-30   85  	if (header->magic == NVRAM_MAGIC) {
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   86  		size = NVRAM_SPACE;
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   87  		goto found;
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   88  	}
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   89  
f36738ddfeea02 arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   90  	pr_err("no nvram found\n");
cc4403e02541af arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26   91  	return -ENXIO;
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   92  
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08   93  found:
1f330c3279004d drivers/firmware/broadcom/bcm47xx_nvram.c Stephen Boyd      2016-01-20   94  	__ioread32_copy(nvram_buf, header, sizeof(*header) / 4);
4c11e554fb894b drivers/firmware/broadcom/bcm47xx_nvram.c Aaro Koskinen     2016-03-17   95  	nvram_len = ((struct nvram_header *)(nvram_buf))->len;
94a0535baf4d78 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06   96  	if (nvram_len > size) {
55cab93bcf1422 arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21   97  		pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
94a0535baf4d78 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06   98  		nvram_len = size;
55cab93bcf1422 arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21   99  	}
94a0535baf4d78 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06  100  	if (nvram_len >= NVRAM_SPACE) {
feb4eb060c3aec drivers/firmware/broadcom/bcm47xx_nvram.c Florian Fainelli  2019-05-14  101  		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
4c11e554fb894b drivers/firmware/broadcom/bcm47xx_nvram.c Aaro Koskinen     2016-03-17  102  		       nvram_len, NVRAM_SPACE - 1);
94a0535baf4d78 arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-06-06  103  		nvram_len = NVRAM_SPACE - 1;
55cab93bcf1422 arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21  104  	}
55cab93bcf1422 arch/mips/bcm47xx/nvram.c                 Hante Meuleman    2015-05-21  105  	/* proceed reading data after header */
1f330c3279004d drivers/firmware/broadcom/bcm47xx_nvram.c Stephen Boyd      2016-01-20  106  	__ioread32_copy(nvram_buf + sizeof(*header), header + 1,
1f330c3279004d drivers/firmware/broadcom/bcm47xx_nvram.c Stephen Boyd      2016-01-20  107  			DIV_ROUND_UP(nvram_len, 4));
d28c9a55c297db arch/mips/bcm47xx/nvram.c                 Rafał Miłecki     2015-05-12  108  	nvram_buf[NVRAM_SPACE - 1] = '\0';
cc4403e02541af arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26  109  
cc4403e02541af arch/mips/bcm47xx/nvram.c                 Hauke Mehrtens    2012-12-26  110  	return 0;
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08  111  }
121915c4ee0812 arch/mips/bcm47xx/nvram.c                 Waldemar Brodkorb 2010-06-08  112  

:::::: The code at line 55 was first introduced by commit
:::::: 121915c4ee0812a14bc8d752bc210d0238d755c1 MIPS: BCM47xx: Add NVRAM support devices

:::::: TO: Waldemar Brodkorb <mips@waldemar-brodkorb.de>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
