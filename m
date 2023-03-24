Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70EA8F71
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679690442; x=1711226442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OVO3JSjFsKgZG2jjLQuXhHcGNqQEXhFLUnwajskFKc=;
  b=I3QtI3GLhA/xvAbFrl+KsF4IqNbwjuKl0PXMFJ9WUDXrDpSnN16SMqCD
   dP3lF+wgZ+rAjQFinvNkelqYxgcZ1E4gg0pDN/qkTi4lSd0cDjag+AHG7
   GgsEk9vmUSNlo+Jg+9t9tyoLL2fZA4UHEnKFkF1auY5sjaLrKDyUHpRrS
   s0H5aY7f1MKTabOvyufi3MMNuuYinJbkM6zpgIhLkeR0/dfh9QmyR9mXB
   Y6Z8+u1+eCxNAJWZaowlZlVBXwY4cfI1w7c+uWkAx/NURCNLZVmu6pTKW
   N2WDeI5NOOqVRTDkyJB5Z1FpeuooEQJh/e4noH5K18rzUOewNWmlNEYs1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337385977"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="337385977"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 13:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826389055"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="826389055"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 13:40:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfoDA-000Fdm-0Y;
	Fri, 24 Mar 2023 20:40:32 +0000
Date: Sat, 25 Mar 2023 04:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pwm-dev-v15 4/9] drivers/pwm/pwm-microchip-core.c:430:65:
 error: expected ';' before 'if'
Message-ID: <202303250450.otHWagcB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pwm-dev-v15
head:   f675a783c2fc465c5fb8f52191d740467e265b89
commit: 1d5bcc2680eafb15c14856a00fbb92b40e26cba1 [4/9] report pwmchip_add() failures
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230325/202303250450.otHWagcB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=1d5bcc2680eafb15c14856a00fbb92b40e26cba1
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor pwm-dev-v15
        git checkout 1d5bcc2680eafb15c14856a00fbb92b40e26cba1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250450.otHWagcB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-microchip-core.c: In function 'mchp_core_pwm_probe':
>> drivers/pwm/pwm-microchip-core.c:430:65: error: expected ';' before 'if'
     430 |         ret = devm_pwmchip_add(&pdev->dev, &mchp_core_pwm->chip)
         |                                                                 ^
         |                                                                 ;
     431 |         if (ret)
         |         ~~                                                       
   drivers/pwm/pwm-microchip-core.c:398:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     398 |         int ret;
         |             ^~~
   drivers/pwm/pwm-microchip-core.c:435:1: error: control reaches end of non-void function [-Werror=return-type]
     435 | }
         | ^
   cc1: some warnings being treated as errors


vim +430 drivers/pwm/pwm-microchip-core.c

   393	
   394	static int mchp_core_pwm_probe(struct platform_device *pdev)
   395	{
   396		struct mchp_core_pwm_chip *mchp_core_pwm;
   397		struct resource *regs;
   398		int ret;
   399	
   400		mchp_core_pwm = devm_kzalloc(&pdev->dev, sizeof(*mchp_core_pwm), GFP_KERNEL);
   401		if (!mchp_core_pwm)
   402			return -ENOMEM;
   403	
   404		mchp_core_pwm->base = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
   405		if (IS_ERR(mchp_core_pwm->base))
   406			return PTR_ERR(mchp_core_pwm->base);
   407	
   408		mchp_core_pwm->clk = devm_clk_get_enabled(&pdev->dev, NULL);
   409		if (IS_ERR(mchp_core_pwm->clk))
   410			return dev_err_probe(&pdev->dev, PTR_ERR(mchp_core_pwm->clk),
   411					     "failed to get PWM clock\n");
   412	
   413		if (of_property_read_u32(pdev->dev.of_node, "microchip,sync-update-mask",
   414					 &mchp_core_pwm->sync_update_mask))
   415			mchp_core_pwm->sync_update_mask = 0;
   416	
   417		mutex_init(&mchp_core_pwm->lock);
   418	
   419		mchp_core_pwm->chip.dev = &pdev->dev;
   420		mchp_core_pwm->chip.ops = &mchp_core_pwm_ops;
   421		mchp_core_pwm->chip.npwm = 16;
   422	
   423		mchp_core_pwm->channel_enabled = readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_EN(0));
   424		mchp_core_pwm->channel_enabled |=
   425			readb_relaxed(mchp_core_pwm->base + MCHPCOREPWM_EN(1)) << 8;
   426	
   427		writel_relaxed(1U, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
   428		mchp_core_pwm->update_timestamp = ktime_get();
   429	
 > 430		ret = devm_pwmchip_add(&pdev->dev, &mchp_core_pwm->chip)
   431		if (ret)
   432			return dev_err_probe(&pdev->dev, ret, "Failed to add pwmchip\n")
   433	
   434		return 0;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
