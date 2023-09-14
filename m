Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D7424209
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694699637; x=1726235637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iWXcxrU74K2FjMxVTKdKsXj5b2rV6/He22ehKPQcY5w=;
  b=UKBuNiozJ8i5N+X0V+c6v+w9Gucgen+QYWoSHFzkT56F4TIRTSzWkLlE
   YlTdkvWlB+u25ou4cQdwsV139f/35GHruU/daHmposxN1qBEc+2CNbOI9
   9ndhWA3ydAzNI5XTOs1hCOYnGA6k/fy0Sd6J5utPBVQ9rHWM5uq+lrCfc
   VkzLcjAORIgq6IsIvtfxJEm5fEoIjQopCq9SIAZWA2lq6SZNG+ukBauSK
   lwIoHZEjiVi97i7YcH8MyAAxipy6KqhRXPkxNPUNDFF6jyoKyLx4MCJP5
   5lFtanaKL8LLyHu+WUYcrPJUWXl9YWSR5YQeGHjT8fcp9ZrRIHRLIt4/s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="364000227"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="364000227"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 06:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991389375"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="991389375"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2023 06:36:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgmVk-0001dK-1S;
	Thu, 14 Sep 2023 13:36:00 +0000
Date: Thu, 14 Sep 2023 21:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Georgi Vlaev <g-vlaev@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 217/382]
 drivers/dma/ti/k3-udma.c:5551:12: warning: 'udma_pm_resume' defined but not
 used
Message-ID: <202309142146.euQethmd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   67baeccff6749ac4362307312cdf2f68175dabb7
commit: 5f0c27386ed3c8d9408d9c5a9fb79981e05199a7 [217/382] dmaengine: ti: k3-udma: Add system suspend/resume support
config: arm64-randconfig-002-20230914 (https://download.01.org/0day-ci/archive/20230914/202309142146.euQethmd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309142146.euQethmd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309142146.euQethmd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/ti/k3-udma.c:5551:12: warning: 'udma_pm_resume' defined but not used [-Wunused-function]
    5551 | static int udma_pm_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/dma/ti/k3-udma.c:5529:12: warning: 'udma_pm_suspend' defined but not used [-Wunused-function]
    5529 | static int udma_pm_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/udma_pm_resume +5551 drivers/dma/ti/k3-udma.c

  5528	
> 5529	static int udma_pm_suspend(struct device *dev)
  5530	{
  5531		struct udma_dev *ud = dev_get_drvdata(dev);
  5532		struct dma_device *dma_dev = &ud->ddev;
  5533		struct dma_chan *chan;
  5534		struct udma_chan *uc;
  5535	
  5536		list_for_each_entry(chan, &dma_dev->channels, device_node) {
  5537			if (chan->client_count) {
  5538				uc = to_udma_chan(chan);
  5539				/* backup the channel configuration */
  5540				memcpy(&uc->backup_config, &uc->config,
  5541				       sizeof(struct udma_chan_config));
  5542				dev_dbg(dev, "Suspending channel %s\n",
  5543					dma_chan_name(chan));
  5544				ud->ddev.device_free_chan_resources(chan);
  5545			}
  5546		}
  5547	
  5548		return 0;
  5549	}
  5550	
> 5551	static int udma_pm_resume(struct device *dev)
  5552	{
  5553		struct udma_dev *ud = dev_get_drvdata(dev);
  5554		struct dma_device *dma_dev = &ud->ddev;
  5555		struct dma_chan *chan;
  5556		struct udma_chan *uc;
  5557		int ret;
  5558	
  5559		list_for_each_entry(chan, &dma_dev->channels, device_node) {
  5560			if (chan->client_count) {
  5561				uc = to_udma_chan(chan);
  5562				/* restore the channel configuration */
  5563				memcpy(&uc->config, &uc->backup_config,
  5564				       sizeof(struct udma_chan_config));
  5565				dev_dbg(dev, "Resuming channel %s\n",
  5566					dma_chan_name(chan));
  5567				ret = ud->ddev.device_alloc_chan_resources(chan);
  5568				if (ret)
  5569					return ret;
  5570			}
  5571		}
  5572	
  5573		return 0;
  5574	}
  5575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
