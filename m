Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C890E2341F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685621770; x=1717157770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVpWxNLAEyRUHbd4/FqvIYc/Ye7coFp43VXGzYbniTc=;
  b=Sl1m9VXfwAFoNag4mVnM0/of0vPd+RqDYIfq9RcQFbwXOC/2g1q5Ne5Y
   0qS5zXy+UgVDxDWwmIqtmbLHHnkslGYTi5x9QLjRe1Rfi9KzmTYcwqgL8
   GDS6h8C4xSZzRsWwrjP988qDPa1dPzZH3t5uNLx2w12Sh1+1shnCUI19z
   zX4VFziRk3Y9m8zqVYG8XPDvrwDqzerKyXDdFHmlZcbfEWXoETyyjWkoR
   frm5kQqT3NlZ0ci5ieXJ3g+84JcMHaWzvFiUlrYwScjBul5H3F3Qc3Fyf
   428mmNcHjjNJLR+ptMXB1t14Uo8/9lxQ7/lbv+B1mA1kpNgHeMqVrUoEv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="419039484"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="419039484"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 05:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="740335846"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="740335846"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 05:16:09 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4hDs-0002F4-0w;
	Thu, 01 Jun 2023 12:16:08 +0000
Date: Thu, 1 Jun 2023 20:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 31/34] drivers/dma/at_xdmac.c:2013:9:
 error: implicit declaration of function 'pm_runtime_get_noresume'
Message-ID: <202306011559.6IvI8ICS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   01a349b494d6b89296a3f6d2256baf149b4331a6
commit: 5bcbdb894c83b9f724890eaaca1a5ef516ba4ee2 [31/34] dmaengine: at_xdmac: disable/enable clock directly on suspend/resume
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230601/202306011559.6IvI8ICS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=5bcbdb894c83b9f724890eaaca1a5ef516ba4ee2
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.1
        git checkout 5bcbdb894c83b9f724890eaaca1a5ef516ba4ee2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011559.6IvI8ICS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma/at_xdmac.c: In function 'atmel_xdmac_resume':
>> drivers/dma/at_xdmac.c:2013:9: error: implicit declaration of function 'pm_runtime_get_noresume' [-Werror=implicit-function-declaration]
    2013 |         pm_runtime_get_noresume(atxdmac->dev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/at_xdmac.c:2013:40: error: 'struct at_xdmac' has no member named 'dev'
    2013 |         pm_runtime_get_noresume(atxdmac->dev);
         |                                        ^~
   cc1: some warnings being treated as errors


vim +/pm_runtime_get_noresume +2013 drivers/dma/at_xdmac.c

  1999	
  2000	static int __maybe_unused atmel_xdmac_resume(struct device *dev)
  2001	{
  2002		struct at_xdmac		*atxdmac = dev_get_drvdata(dev);
  2003		struct at_xdmac_chan	*atchan;
  2004		struct dma_chan		*chan, *_chan;
  2005		struct platform_device	*pdev = container_of(dev, struct platform_device, dev);
  2006		int			i;
  2007		int ret;
  2008	
  2009		ret = clk_prepare_enable(atxdmac->clk);
  2010		if (ret)
  2011			return ret;
  2012	
> 2013		pm_runtime_get_noresume(atxdmac->dev);
  2014	
  2015		at_xdmac_axi_config(pdev);
  2016	
  2017		/* Clear pending interrupts. */
  2018		for (i = 0; i < atxdmac->dma.chancnt; i++) {
  2019			atchan = &atxdmac->chan[i];
  2020			while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
  2021				cpu_relax();
  2022		}
  2023	
  2024		at_xdmac_write(atxdmac, AT_XDMAC_GIE, atxdmac->save_gim);
  2025		list_for_each_entry_safe(chan, _chan, &atxdmac->dma.channels, device_node) {
  2026			atchan = to_at_xdmac_chan(chan);
  2027			at_xdmac_chan_write(atchan, AT_XDMAC_CC, atchan->save_cc);
  2028			if (at_xdmac_chan_is_cyclic(atchan)) {
  2029				if (at_xdmac_chan_is_paused(atchan))
  2030					at_xdmac_device_resume(chan);
  2031				at_xdmac_chan_write(atchan, AT_XDMAC_CNDA, atchan->save_cnda);
  2032				at_xdmac_chan_write(atchan, AT_XDMAC_CNDC, atchan->save_cndc);
  2033				at_xdmac_chan_write(atchan, AT_XDMAC_CIE, atchan->save_cim);
  2034				wmb();
  2035				if (atxdmac->save_gs & atchan->mask)
  2036					at_xdmac_write(atxdmac, AT_XDMAC_GE, atchan->mask);
  2037			}
  2038		}
  2039		return 0;
  2040	}
  2041	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
