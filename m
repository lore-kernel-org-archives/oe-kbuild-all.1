Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B713C8E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736235620; cv=none; b=puuwe/UUbjCdtkmcyJQXhjH8usSwC6bplAoCkXEY+y2gAMQnxE5GyyQwDDVEGloTrMehr+sI5kgwrXbG8rUVuIDEpi3skzblbdia1uPvNA6xNUTkzjOLFBT93FnmUWzGOEZjXqR4w47t5Vo9Am0bewNcxX5F9GkBIeCoiIO+Ur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736235620; c=relaxed/simple;
	bh=mKz7ywmwsSRFyU/AYU8gM/YzMhWEiV87HnwKhf2mN3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPBNk4OkyhTOqXnjmmPBB3KiBlMwNyQH2p4lBRcr9W1p/A9O764klYyckRcMoABK8ddPeg5O7kcEcbKLBo3XvVXOwKyGXFjgnHZR/z568BqC32WSjM/Y3UZeLOBVAh7/CdwnD8zZ2uIfmhbwWi27uEGevIL36VxvhsSEh+Cj4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMJrA6Yn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMJrA6Yn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736235616; x=1767771616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKz7ywmwsSRFyU/AYU8gM/YzMhWEiV87HnwKhf2mN3I=;
  b=VMJrA6YnxTt0ITcQERgKH+Blz4wOHy72nO/gJ2cTVpF8tt8/jZ4eS67k
   b9JoyUtPYXZOHXnfZcCnMNWlTYwa875d9uekHNojT1OjKmtHyJzGQBrrt
   s8CWmiXLsJBKmB/0FI41YI0OS78M1efNWZr2HTTFaB1g2yUMZarMzL7xp
   zy3DDo4CN/yDKxTauQ+S74WdCupbRTOuq92ejtedHp+najHhuYQHFrJYd
   FKdGvpHDi5IREzPo9gugXCKcoUUXvSIGx4hcwMSHd1iLKu59DUFqKgjan
   lA2SP4B1HgwpM433jCdLIIUtaxaIP9abWRF7bWITTr3S1XzSKlT3qrneI
   A==;
X-CSE-ConnectionGUID: aIn96fW1RfWbU4Rz6ONhNA==
X-CSE-MsgGUID: nbqcLl/yRKaHxvSnHwI+qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36284095"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36284095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 23:40:16 -0800
X-CSE-ConnectionGUID: t63KuzoNRoGeOyrC5Z2shg==
X-CSE-MsgGUID: /v/UnJqjTEqitaQeNLYl6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="103184602"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2025 23:40:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV4CC-000ENN-2c;
	Tue, 07 Jan 2025 07:40:12 +0000
Date: Tue, 7 Jan 2025 15:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 4870/6658] drivers/dma/bcm2835-dma.c:878:12:
 warning: 'bcm2835_dma_suspend_late' defined but not used
Message-ID: <202501071533.yrFb156H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4e16367cfe0ce395f29d0482b78970cce8e1db73
commit: 9602a843cb3a16df8930eb9b046aa7aeb769521b [4870/6658] dmaengine: bcm2835-dma: Prevent suspend if DMA channel is busy
config: arm-randconfig-004-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071533.yrFb156H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071533.yrFb156H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071533.yrFb156H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/bcm2835-dma.c:878:12: warning: 'bcm2835_dma_suspend_late' defined but not used [-Wunused-function]
     878 | static int bcm2835_dma_suspend_late(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/bcm2835_dma_suspend_late +878 drivers/dma/bcm2835-dma.c

   877	
 > 878	static int bcm2835_dma_suspend_late(struct device *dev)
   879	{
   880		struct bcm2835_dmadev *od = dev_get_drvdata(dev);
   881		struct bcm2835_chan *c, *next;
   882	
   883		list_for_each_entry_safe(c, next, &od->ddev.channels,
   884					 vc.chan.device_node) {
   885			void __iomem *chan_base = c->chan_base;
   886	
   887			/* Check if DMA channel is busy */
   888			if (readl(chan_base + BCM2835_DMA_ADDR))
   889				return -EBUSY;
   890		}
   891	
   892		return 0;
   893	}
   894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
