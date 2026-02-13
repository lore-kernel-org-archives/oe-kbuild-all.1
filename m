Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BA287516
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771015308; cv=none; b=IaWQ0CpFMV/I0cbznkvFfrZgjHlKwBhz3cYbHrtZGdggYW+KQSn/JN8IIVhrULo+4Tf4SMhpSEpHflgH+CSFD841WFRFlshgFvAGMHEVQM9LCIlUAdL3NeA6UBKrK1d3S6ARUIzA1fdXnHk2gcbMA+Z1nDECJFcJ7LA++GUf2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771015308; c=relaxed/simple;
	bh=jaZsbRaTCTjNpn5u9h56UvACC38vFNv+1BNempSFHW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YHw+J6sjGjOq0wbqedwQr0rm2fgJDapTQNAt2D5fy8lh38YdeTVZQaCs1DUraehZV133SpslJZtYoSJuwIInuwK9WznZeJ68XGhl7oZn8cijpJ2xp+Z0yGQOTg0Q1fX244XmaDT36327LJxK/QaDMQQFdI08PyhqpYweGZbf6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYXQfniQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYXQfniQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771015307; x=1802551307;
  h=date:from:to:cc:subject:message-id;
  bh=jaZsbRaTCTjNpn5u9h56UvACC38vFNv+1BNempSFHW8=;
  b=JYXQfniQUIt74sHP1VnMKVEXiPGsqiqsStS0H/k1IeVsGiNpgkrG8k4y
   eDhIPwTRPiuSFInzaM7MebrE4qje5JxTtJLrOJRYCHs3qVKuy41wUKoEf
   BLK0rPRy3Q1HN+mNx+me5pDaQKiA3iuG3wzTQjOQdwEvAKwLkakuZ/bR7
   CI1g3/iyuhBFYQTwG/xJcn3jGZIr12TFxhlWUtwais7ztjgehMm2cwuOF
   XxgEifPAfTHwaD+HeyKvGDhH9sGUT9GIl5QquqQ3Lu8MwnQ6WLdn+LnjV
   JFxYPAn5g5Jp4AbRrGQAjPpZzFsZl+t9kh3leBn5b3DsSnSla22ZeE9mj
   A==;
X-CSE-ConnectionGUID: 4m8NzJluS/uf7EU/rxgpRw==
X-CSE-MsgGUID: 3YhUN9x8QNa+hkUnQADiBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72248975"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72248975"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 12:41:47 -0800
X-CSE-ConnectionGUID: xGqqcwPhQw2NNEqtlh7p4w==
X-CSE-MsgGUID: y/d/e/tEQUiN2dSg7v8HYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="242378656"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2026 12:41:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqzyw-00000000voQ-3wtJ;
	Fri, 13 Feb 2026 20:41:42 +0000
Date: Sat, 14 Feb 2026 04:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 58/590]
 drivers/mtd/spi-nor/core.c:2466:13: warning: variable 'rem_bank_len' set but
 not used
Message-ID: <202602140432.6r0NeVc9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: f2c0bf803b0ac2d1ff9069fd52e28c33540772d1 [58/590] mtd: spi-nor: Add EAR support
config: x86_64-randconfig-161-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140432.6r0NeVc9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140432.6r0NeVc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140432.6r0NeVc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c: In function 'spi_nor_read':
   drivers/mtd/spi-nor/core.c:2271:13: warning: variable 'sz' set but not used [-Wunused-but-set-variable]
    2271 |         u64 sz = 0;
         |             ^~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_write':
>> drivers/mtd/spi-nor/core.c:2466:13: warning: variable 'rem_bank_len' set but not used [-Wunused-but-set-variable]
    2466 |         u32 rem_bank_len = 0;
         |             ^~~~~~~~~~~~


vim +/rem_bank_len +2466 drivers/mtd/spi-nor/core.c

  2454	
  2455	/*
  2456	 * Write an address range to the nor chip.  Data must be written in
  2457	 * FLASH_PAGESIZE chunks.  The address range may be any size provided
  2458	 * it is within the physical boundaries.
  2459	 */
  2460	static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
  2461		size_t *retlen, const u_char *buf)
  2462	{
  2463		struct spi_nor *nor = mtd_to_spi_nor(mtd);
  2464		u32 page_size = nor->params->page_size;
  2465		size_t page_offset, i, ret;
> 2466		u32 rem_bank_len = 0;
  2467		u32 n_flash = 1;
  2468		loff_t addr;
  2469		u8 bank;
  2470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
