Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BBE1847
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 05:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688707614; x=1720243614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j5FigJxoFPSevRBplWyCC3cSyTfWYcWd+otIThq6j6U=;
  b=KtU4kRZh2TOz5d2ElbNxdYs+kHXd7sivOA182LhNjggSCC2kE9OJ1/Nk
   DHMT5/UompHgkKFN/bx46j/jzDi9HG53RwSnYXMtNoaKYUSYxtKxY286S
   f71Dxt1r/NsQmvy/a+vz3bj8OfTuogn2zq4GTlnafYeXeWiz3+ZGN2oXm
   26EJHqNNGCpTr44o9PpgcKbM3oxSpLj7aGFW3KpNbs2m0sZFfH0n7ab6g
   pfiV5s4lgOxKFurKLBy1DmMiimG45mbi9GmphKWo5gCYQKtvSeRryqG38
   CE6Ruw7OLQ5XqtPhDvJwd9c/yPxeKX+KgSMdP38WYOdUM2+Cr09PZvwjw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="361280311"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="361280311"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 22:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="749415010"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="749415010"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Jul 2023 22:26:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHdzX-0001nP-1k;
	Fri, 07 Jul 2023 05:26:51 +0000
Date: Fri, 7 Jul 2023 13:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 58/86]
 drivers/gpu/drm/sun4i/sun4i_tcon.c:661:21: error: implicit declaration of
 function 'devm_clk_get_enabled'
Message-ID: <202307071347.amCEKL0V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   b53596175480d790f9254a50e5fc5eb8ae15df06
commit: bce03c0f8a6dc7bb6fceddc250b57cbb2c2cfda7 [58/86] drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230707/202307071347.amCEKL0V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071347.amCEKL0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071347.amCEKL0V-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_tcon.c:236:6: warning: no previous prototype for 'sun4i_tcon_set_mux' [-Wmissing-prototypes]
     236 | void sun4i_tcon_set_mux(struct sun4i_tcon *tcon, int channel,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun4i_tcon.c: In function 'sun4i_tcon_init_clocks':
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:661:21: error: implicit declaration of function 'devm_clk_get_enabled' [-Werror=implicit-function-declaration]
     661 |         tcon->clk = devm_clk_get_enabled(dev, "ahb");
         |                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/sun4i/sun4i_tcon.c:661:19: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     661 |         tcon->clk = devm_clk_get_enabled(dev, "ahb");
         |                   ^
   drivers/gpu/drm/sun4i/sun4i_tcon.c:668:29: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     668 |                 tcon->sclk0 = devm_clk_get_enabled(dev, "tcon-ch0");
         |                             ^
   cc1: some warnings being treated as errors


vim +/devm_clk_get_enabled +661 drivers/gpu/drm/sun4i/sun4i_tcon.c

   657	
   658	static int sun4i_tcon_init_clocks(struct device *dev,
   659					  struct sun4i_tcon *tcon)
   660	{
 > 661		tcon->clk = devm_clk_get_enabled(dev, "ahb");
   662		if (IS_ERR(tcon->clk)) {
   663			dev_err(dev, "Couldn't get the TCON bus clock\n");
   664			return PTR_ERR(tcon->clk);
   665		}
   666	
   667		if (tcon->quirks->has_channel_0) {
   668			tcon->sclk0 = devm_clk_get_enabled(dev, "tcon-ch0");
   669			if (IS_ERR(tcon->sclk0)) {
   670				dev_err(dev, "Couldn't get the TCON channel 0 clock\n");
   671				return PTR_ERR(tcon->sclk0);
   672			}
   673		}
   674	
   675		if (tcon->quirks->has_channel_1) {
   676			tcon->sclk1 = devm_clk_get(dev, "tcon-ch1");
   677			if (IS_ERR(tcon->sclk1)) {
   678				dev_err(dev, "Couldn't get the TCON channel 1 clock\n");
   679				return PTR_ERR(tcon->sclk1);
   680			}
   681		}
   682	
   683		return 0;
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
