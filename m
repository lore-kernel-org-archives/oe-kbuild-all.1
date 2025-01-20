Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A2191F95
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 11:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737373005; cv=none; b=o2vea7elb/Du4s1WDIwl+ht3aH13irarVULCE9YE7fBtW5jhYpv0+xqQjKEB8ReO4wYGGJlDcrQqVmDYQkpSCLzc7tOSAGQQ4Wcevn0xb/PDYQlllpMoG/FJxrYQ4ulVlJeM9DjakBK9YSJwnav7vUI4x+2vcMCKcJ1Qg9tnpWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737373005; c=relaxed/simple;
	bh=ta5vQ2nlUCqkDFdaOrFjRIPH5jNhLztzrVaKA0eryMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttBOy4C0gRK7lLPtm3r5deRuBR0bRrlXFs1Ve27w+WO+lc2j68xDuH0eNRPMk3kZA2yJu2k0/ZPj/rD0U8O7SiAJZg4TKIIkqQalEs94ELE4XldWMzK3yV3jPXkIx79Agn1+M2xLIJ9BO+1VAYWmQnqzKOrc+qGWpOZebMz7D74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDlfUn1o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDlfUn1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737373002; x=1768909002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ta5vQ2nlUCqkDFdaOrFjRIPH5jNhLztzrVaKA0eryMg=;
  b=hDlfUn1oPu4XXoKh3qvZwxuw0L3R0v5WtngiNFVlQV+B3C6OEJgj+Vwn
   6I/83bOYYsEK0ilZcKaeXo8riHpyjrK7AcAMFJHM9B6B+4zU66kNm1Ohe
   Q2r2pGO7k4IXu44zxOXMVUb1WLpWhhWMscIxGjcW1tOIt0qx3rVA3dadI
   qBhPZNLicxYGgh8C4t6CMgCCjVOZh9RAnivkXaqC/+gIjj8TbjVItq2yz
   m6KNp3qg5Aea2NBqBoC1TZbApDgS+nPK3qbRrnAYRlC+yfgs185WbpaRa
   T747PxDLqNo3sfvv1Y57amNJYwB5Pkd5gEoOBftbLksL1DhuPzqD33UVE
   g==;
X-CSE-ConnectionGUID: rDQaBh5aRBWy/as/Xs9ODg==
X-CSE-MsgGUID: 0vBGPhhPRaG4S2FpQhXqQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37998608"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37998608"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:36:41 -0800
X-CSE-ConnectionGUID: FIYF4k1+R5aeyWEzU8RZEA==
X-CSE-MsgGUID: ao75EaqAS4i88kIHy6nbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106928077"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jan 2025 03:36:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZq57-000WUR-2a;
	Mon, 20 Jan 2025 11:36:37 +0000
Date: Mon, 20 Jan 2025 19:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrzej Hajda <a.hajda@samsung.com>
Subject: drivers/video/fbdev/mmp/hw/mmp_spi.c:31: warning: expecting
 prototype for spi_write(). Prototype was for lcd_spi_write() instead
Message-ID: <202501201917.lnFCnpB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: dd90e9ae55a1e7efd3ac036afe9f7ae7bb64d39d video: fbdev: mmp: add COMPILE_TEST support
date:   5 years ago
config: csky-randconfig-r026-20230823 (https://download.01.org/0day-ci/archive/20250120/202501201917.lnFCnpB0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201917.lnFCnpB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201917.lnFCnpB0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/mmp/hw/mmp_spi.c:31: warning: Function parameter or struct member 'spi' not described in 'lcd_spi_write'
>> drivers/video/fbdev/mmp/hw/mmp_spi.c:31: warning: expecting prototype for spi_write(). Prototype was for lcd_spi_write() instead


vim +31 drivers/video/fbdev/mmp/hw/mmp_spi.c

641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  17  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  18  /**
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  19   * spi_write - write command to the SPI port
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  20   * @data: can be 8/16/32-bit, MSB justified data to write.
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  21   * @len:  data length.
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  22   *
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  23   * Wait bus transfer complete IRQ.
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  24   * The caller is expected to perform the necessary locking.
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  25   *
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  26   * Returns:
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  27   *   %-ETIMEDOUT	timeout occurred
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  28   *   0			success
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  29   */
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  30  static inline int lcd_spi_write(struct spi_device *spi, u32 data)
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21 @31  {
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  32  	int timeout = 100000, isr, ret = 0;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  33  	u32 tmp;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  34  	void *reg_base =
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  35  		*(void **)spi_master_get_devdata(spi->master);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  36  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  37  	/* clear ISR */
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  38  	writel_relaxed(~SPI_IRQ_MASK, reg_base + SPU_IRQ_ISR);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  39  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  40  	switch (spi->bits_per_word) {
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  41  	case 8:
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  42  		writel_relaxed((u8)data, reg_base + LCD_SPU_SPI_TXDATA);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  43  		break;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  44  	case 16:
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  45  		writel_relaxed((u16)data, reg_base + LCD_SPU_SPI_TXDATA);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  46  		break;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  47  	case 32:
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  48  		writel_relaxed((u32)data, reg_base + LCD_SPU_SPI_TXDATA);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  49  		break;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  50  	default:
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  51  		dev_err(&spi->dev, "Wrong spi bit length\n");
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  52  	}
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  53  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  54  	/* SPI start to send command */
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  55  	tmp = readl_relaxed(reg_base + LCD_SPU_SPI_CTRL);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  56  	tmp &= ~CFG_SPI_START_MASK;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  57  	tmp |= CFG_SPI_START(1);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  58  	writel(tmp, reg_base + LCD_SPU_SPI_CTRL);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  59  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  60  	isr = readl_relaxed(reg_base + SPU_IRQ_ISR);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  61  	while (!(isr & SPI_IRQ_ENA_MASK)) {
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  62  		udelay(100);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  63  		isr = readl_relaxed(reg_base + SPU_IRQ_ISR);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  64  		if (!--timeout) {
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  65  			ret = -ETIMEDOUT;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  66  			dev_err(&spi->dev, "spi cmd send time out\n");
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  67  			break;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  68  		}
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  69  	}
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  70  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  71  	tmp = readl_relaxed(reg_base + LCD_SPU_SPI_CTRL);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  72  	tmp &= ~CFG_SPI_START_MASK;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  73  	tmp |= CFG_SPI_START(0);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  74  	writel_relaxed(tmp, reg_base + LCD_SPU_SPI_CTRL);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  75  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  76  	writel_relaxed(~SPI_IRQ_MASK, reg_base + SPU_IRQ_ISR);
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  77  
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  78  	return ret;
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  79  }
641b4b1b6a7cb4 drivers/video/mmp/hw/mmp_spi.c Zhou Zhu 2013-02-21  80  

:::::: The code at line 31 was first introduced by commit
:::::: 641b4b1b6a7cb4ab21cfd9dd7b93a1162eae4501 video: mmpdisp: add spi port in display controller

:::::: TO: Zhou Zhu <zzhu3@marvell.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
