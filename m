Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4FB186B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683984313; x=1715520313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PbEfrHTvy7YyMqJclWiAFHWEsmEJRzlmTW1rlbV8mBM=;
  b=U7V2a+g91KTDOM7AFpYsaWuXSiRcZlefl9CF4Y2UulFNIwsb16kwujz0
   TEcmjLkoIROqhn1SR836WtV+rjFXH8DcRsCE4bq2j0Nroj6j5eEiDLk7e
   EpHt9U2LEVd2kJURHY3vHsFTMgK08ivfQqNDVirV+SKirFz1tORuPXAu9
   /Z8BsTQSa2f2sBfI+PTFODhrW0SxGKSyZywhML/onDuvfLs22dQOxlEbg
   zWEiW7NMMKV/WH+qDL70FwX9ws+UvRSDny0/od6tkKlSg7pzkuV8Fbx0r
   kwYNYCamsIkR1wc5q2U9Xjkjr+NztOc7nC46loExZCH/BqGRB8abJzSUT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335484252"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="335484252"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 06:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="946910220"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="946910220"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 May 2023 06:25:10 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxpFG-0005VM-0n;
	Sat, 13 May 2023 13:25:10 +0000
Date: Sat, 13 May 2023 21:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-stable-rc:queue/6.2 122/208] drivers/dma/at_xdmac.c:2035:33:
 error: implicit declaration of function 'at_xdmac_device_pause_set'; did you
 mean 'at_xdmac_device_pause'?
Message-ID: <202305132127.A0f0Vdsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.2
head:   7620e22b6a8eef6261614ecfbe6a3bdb3b7e07fc
commit: 34e56b6298c2a48c036f88216e6d74121f616454 [122/208] dmaengine: at_xdmac: restore the content of grws register
config: arm-randconfig-r024-20230509 (https://download.01.org/0day-ci/archive/20230513/202305132127.A0f0Vdsf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=34e56b6298c2a48c036f88216e6d74121f616454
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.2
        git checkout 34e56b6298c2a48c036f88216e6d74121f616454
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305132127.A0f0Vdsf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma/at_xdmac.c: In function 'atmel_xdmac_resume':
>> drivers/dma/at_xdmac.c:2035:33: error: implicit declaration of function 'at_xdmac_device_pause_set'; did you mean 'at_xdmac_device_pause'? [-Werror=implicit-function-declaration]
    2035 |                                 at_xdmac_device_pause_set(atxdmac, atchan);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 at_xdmac_device_pause
   cc1: some warnings being treated as errors


vim +2035 drivers/dma/at_xdmac.c

  1998	
  1999	static int __maybe_unused atmel_xdmac_resume(struct device *dev)
  2000	{
  2001		struct at_xdmac		*atxdmac = dev_get_drvdata(dev);
  2002		struct at_xdmac_chan	*atchan;
  2003		struct dma_chan		*chan, *_chan;
  2004		struct platform_device	*pdev = container_of(dev, struct platform_device, dev);
  2005		int			i;
  2006		int ret;
  2007	
  2008		ret = clk_prepare_enable(atxdmac->clk);
  2009		if (ret)
  2010			return ret;
  2011	
  2012		at_xdmac_axi_config(pdev);
  2013	
  2014		/* Clear pending interrupts. */
  2015		for (i = 0; i < atxdmac->dma.chancnt; i++) {
  2016			atchan = &atxdmac->chan[i];
  2017			while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
  2018				cpu_relax();
  2019		}
  2020	
  2021		at_xdmac_write(atxdmac, AT_XDMAC_GIE, atxdmac->save_gim);
  2022		list_for_each_entry_safe(chan, _chan, &atxdmac->dma.channels, device_node) {
  2023			atchan = to_at_xdmac_chan(chan);
  2024			at_xdmac_chan_write(atchan, AT_XDMAC_CC, atchan->save_cc);
  2025			if (at_xdmac_chan_is_cyclic(atchan)) {
  2026				if (at_xdmac_chan_is_paused(atchan))
  2027					at_xdmac_device_resume(chan);
  2028	
  2029				/*
  2030				 * We may resume from a deep sleep state where power
  2031				 * to DMA controller is cut-off. Thus, restore the
  2032				 * suspend state of channels set though dmaengine API.
  2033				 */
  2034				else if (at_xdmac_chan_is_paused(atchan))
> 2035					at_xdmac_device_pause_set(atxdmac, atchan);
  2036	
  2037				at_xdmac_chan_write(atchan, AT_XDMAC_CNDA, atchan->save_cnda);
  2038				at_xdmac_chan_write(atchan, AT_XDMAC_CNDC, atchan->save_cndc);
  2039				at_xdmac_chan_write(atchan, AT_XDMAC_CIE, atchan->save_cim);
  2040				wmb();
  2041				if (atxdmac->save_gs & atchan->mask)
  2042					at_xdmac_write(atxdmac, AT_XDMAC_GE, atchan->mask);
  2043			}
  2044		}
  2045		return 0;
  2046	}
  2047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
