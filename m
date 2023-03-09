Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A12ABA57
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678372175; x=1709908175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmfHrJtkVJQktWhlYJxGRkOeMMYWL49Aqqs9Ka9GzZk=;
  b=asMB29ZhH8mACqYojRZt5uVh7iFzHk+zaNt4kivUMHVvaFtF4UhCBrMh
   WAWtKp9eV0u2KWXpp6emr7wmCMt3N0x6gGmvdNLSYiuAX2+g44HlCKSly
   J7tb0a6tpVfFBRP3dpbitnEECeLNbMJDw3spxpPSz8GEzmooy7kylrTmb
   M4UbFoI6g+gNjeQ3AtAlYBWrYXU7jFF+JMMqtxYdeRPuZ/GbcHTixWHTL
   tpLZw18BZM4nwatfipgycijkSiyUENubtHBTJWkfMSnlVbU4wCwntiK9h
   0qE/rZsd2A7Yz6Ii2DGDjsPflrNbzxuvF2bWy9tBkrOjrkwJUdpSNuFnn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316112492"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="316112492"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 06:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679784058"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="679784058"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 06:29:27 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paHGo-000313-1o;
	Thu, 09 Mar 2023 14:29:26 +0000
Date: Thu, 9 Mar 2023 22:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/linux 18854/23027]
 drivers/counter/intel-qep.c:529:13: warning: variable 'cgsr_reg' set but not
 used
Message-ID: <202303092225.XIsBEKqr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lakshmi,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   2533aa36ba52e96057d68a4ab377a6293b91c1fc
commit: 3f8cef0c2b42d7b55a58fb9469ba99159f20c74f [18854/23027] counter: Enable D0i3 flow for PSE QEP
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303092225.XIsBEKqr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/3f8cef0c2b42d7b55a58fb9469ba99159f20c74f
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 3f8cef0c2b42d7b55a58fb9469ba99159f20c74f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/counter/ drivers/gpu/drm/bridge/imx/ drivers/gpu/drm/mcde/ drivers/media/i2c/ drivers/pwm/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092225.XIsBEKqr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/counter/intel-qep.c: In function 'intel_qep_runtime_suspend':
>> drivers/counter/intel-qep.c:529:13: warning: variable 'cgsr_reg' set but not used [-Wunused-but-set-variable]
     529 |         u32 cgsr_reg;
         |             ^~~~~~~~


vim +/cgsr_reg +529 drivers/counter/intel-qep.c

   521	
   522	#ifdef CONFIG_PM
   523	static int intel_qep_runtime_suspend(struct device *dev)
   524	{
   525		struct pci_dev *pdev = container_of(dev, struct pci_dev, dev);
   526		struct intel_qep *qep = pci_get_drvdata(pdev);
   527		unsigned long j0, j1, delay;
   528		u32 d0i3c_reg;
 > 529		u32 cgsr_reg;
   530	
   531		delay = msecs_to_jiffies(100);
   532		j0 = jiffies;
   533		j1 = j0 + delay;
   534	
   535		cgsr_reg = intel_qep_readl(qep, INTEL_QEP_CGSR);
   536		intel_qep_writel(qep, INTEL_QEP_CGSR, INTEL_QEP_CGSR_CG);
   537	
   538		d0i3c_reg = intel_qep_readl(qep, INTEL_QEP_D0I3C);
   539	
   540		if (d0i3c_reg & INTEL_QEP_D0I3_CIP) {
   541			dev_info(dev, "%s d0i3c CIP detected", __func__);
   542		} else {
   543			intel_qep_writel(qep, INTEL_QEP_D0I3C, INTEL_QEP_D0I3_EN);
   544			d0i3c_reg = intel_qep_readl(qep, INTEL_QEP_D0I3C);
   545		}
   546	
   547		while (time_before(jiffies, j1)) {
   548			d0i3c_reg = intel_qep_readl(qep, INTEL_QEP_D0I3C);
   549			if (!(d0i3c_reg & INTEL_QEP_D0I3_CIP))
   550				break;
   551		}
   552	
   553		if (d0i3c_reg & INTEL_QEP_D0I3_CIP)
   554			dev_info(dev, "%s: timeout waiting CIP to be cleared", __func__);
   555	
   556		return 0;
   557	}
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
