Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF30E7E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 03:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683342277; x=1714878277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNl+j1sbaf2z4HhL+c28MV1Z549ZGBmnP2BTIamvfbU=;
  b=f9G3HKU/Vu9oqvCVDP+NYP7Z32i5txGwwS5WP/+ajBdwJM9OBNgWMBke
   YX2kO3gow1J49i4qySrJtnxZ4GfXWcWpayJCiHGjYyDn0Ddx4DnXi2XSm
   jO943KULk3phdVqZa95pcl/9wbet6y8PbL4x6k2kvge86G+M1npysXIHL
   uMo3eNhur1qE6oeur60daAaQc3IfBJ1GSGA5b62hTYmA/T4ovBB2TPznJ
   6rvc4H56qo5N4wRT3DSNZoHAeB4LY91ZpJnYqrb9eD7TTDckO8cjc/SOR
   95FHX4Y5q8g0IQ5cSLnLMmH3dQPq8eMcfiLdAjiDpCjPunfOUtTcrKdMv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="338542675"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="338542675"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 20:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="767370923"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="767370923"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 May 2023 20:04:36 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv8Dr-00016D-18;
	Sat, 06 May 2023 03:04:35 +0000
Date: Sat, 6 May 2023 11:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.2 516/532] drivers/dma/at_xdmac.c:2033:33:
 error: implicit declaration of function 'at_xdmac_device_pause_set'; did you
 mean 'at_xdmac_device_pause'?
Message-ID: <202305061018.P9eg5onD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.2
head:   886911dcc960c1a31ebe92ba882888f5a3311147
commit: 59776f32b3be4a33cb2e1ae94f52597fa8be192f [516/532] dmaengine: at_xdmac: restore the content of grws register
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230506/202305061018.P9eg5onD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=59776f32b3be4a33cb2e1ae94f52597fa8be192f
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.2
        git checkout 59776f32b3be4a33cb2e1ae94f52597fa8be192f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061018.P9eg5onD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma/at_xdmac.c: In function 'atmel_xdmac_resume':
>> drivers/dma/at_xdmac.c:2033:33: error: implicit declaration of function 'at_xdmac_device_pause_set'; did you mean 'at_xdmac_device_pause'? [-Werror=implicit-function-declaration]
    2033 |                                 at_xdmac_device_pause_set(atxdmac, atchan);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 at_xdmac_device_pause
   cc1: some warnings being treated as errors


vim +2033 drivers/dma/at_xdmac.c

  1996	
  1997	static int __maybe_unused atmel_xdmac_resume(struct device *dev)
  1998	{
  1999		struct at_xdmac		*atxdmac = dev_get_drvdata(dev);
  2000		struct at_xdmac_chan	*atchan;
  2001		struct dma_chan		*chan, *_chan;
  2002		struct platform_device	*pdev = container_of(dev, struct platform_device, dev);
  2003		int			i;
  2004		int ret;
  2005	
  2006		ret = clk_prepare_enable(atxdmac->clk);
  2007		if (ret)
  2008			return ret;
  2009	
  2010		at_xdmac_axi_config(pdev);
  2011	
  2012		/* Clear pending interrupts. */
  2013		for (i = 0; i < atxdmac->dma.chancnt; i++) {
  2014			atchan = &atxdmac->chan[i];
  2015			while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
  2016				cpu_relax();
  2017		}
  2018	
  2019		at_xdmac_write(atxdmac, AT_XDMAC_GIE, atxdmac->save_gim);
  2020		list_for_each_entry_safe(chan, _chan, &atxdmac->dma.channels, device_node) {
  2021			atchan = to_at_xdmac_chan(chan);
  2022			at_xdmac_chan_write(atchan, AT_XDMAC_CC, atchan->save_cc);
  2023			if (at_xdmac_chan_is_cyclic(atchan)) {
  2024				if (at_xdmac_chan_is_paused(atchan))
  2025					at_xdmac_device_resume(chan);
  2026	
  2027				/*
  2028				 * We may resume from a deep sleep state where power
  2029				 * to DMA controller is cut-off. Thus, restore the
  2030				 * suspend state of channels set though dmaengine API.
  2031				 */
  2032				else if (at_xdmac_chan_is_paused(atchan))
> 2033					at_xdmac_device_pause_set(atxdmac, atchan);
  2034	
  2035				at_xdmac_chan_write(atchan, AT_XDMAC_CNDA, atchan->save_cnda);
  2036				at_xdmac_chan_write(atchan, AT_XDMAC_CNDC, atchan->save_cndc);
  2037				at_xdmac_chan_write(atchan, AT_XDMAC_CIE, atchan->save_cim);
  2038				wmb();
  2039				at_xdmac_write(atxdmac, AT_XDMAC_GE, atchan->mask);
  2040			}
  2041		}
  2042		return 0;
  2043	}
  2044	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
