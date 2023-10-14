Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E47E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmVSBBju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697258331; x=1728794331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxAEMgJEzwqmO5wX5fl1m4lHIULCvSrD5Hv6VoP+q4o=;
  b=JmVSBBju7WUfeq1zn9n8r3myBqq4SPreBwssSUxYqz29ht8IDRFz7DxF
   IYKv5swbP6AivVbAa9/a38TO4lOm8+Y6TEIupFkwXs3oFssBb5jFm8ete
   7KfX9c2yL0x1EgNcn+sFFvrZGgoLAr40/B46oi8nSZxsXnuZm4QLWW/9p
   vkL/VmAb6WD84iweXMwrdiqUZI9WWGYi6DQO78YM+fl7dst6mVRR4u7Lx
   9XfNdG/DbRdwwOiRjxda7mpINP9QdP+BhYLOCnoz8YTastzxeurEmr9ef
   nbXhfKSPQnz9HYPO16IBfwi6bmcsvO3dg7TBrufjsPuaLAt+hG3BMULVy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385143071"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="385143071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 21:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731592986"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="731592986"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 21:38:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrWQI-0005hj-2J;
	Sat, 14 Oct 2023 04:38:46 +0000
Date: Sat, 14 Oct 2023 12:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3235/24603]
 drivers/i2c/busses/i2c-imx-lpi2c.c:671:12: warning: 'lpi2c_resume_noirq'
 defined but not used
Message-ID: <202310141246.9iYZKvsE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fugang,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 0158af3e517b96ef5a082edac1dbc11446d4a735 [3235/24603] MLK-16713 i2c: imx-lpi2c: add runtime pm support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141246.9iYZKvsE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141246.9iYZKvsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141246.9iYZKvsE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-imx-lpi2c.c: In function 'lpi2c_runtime_suspend':
   drivers/i2c/busses/i2c-imx-lpi2c.c:630:40: error: 'struct lpi2c_imx_struct' has no member named 'clk_ipg'
     630 |         clk_disable_unprepare(lpi2c_imx->clk_ipg);
         |                                        ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c:631:40: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
     631 |         clk_disable_unprepare(lpi2c_imx->clk_per);
         |                                        ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c: In function 'lpi2c_runtime_resume':
   drivers/i2c/busses/i2c-imx-lpi2c.c:643:43: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
     643 |         ret = clk_prepare_enable(lpi2c_imx->clk_per);
         |                                           ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c:649:43: error: 'struct lpi2c_imx_struct' has no member named 'clk_ipg'
     649 |         ret = clk_prepare_enable(lpi2c_imx->clk_ipg);
         |                                           ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c:651:48: error: 'struct lpi2c_imx_struct' has no member named 'clk_per'
     651 |                 clk_disable_unprepare(lpi2c_imx->clk_per);
         |                                                ^~
   drivers/i2c/busses/i2c-imx-lpi2c.c: At top level:
>> drivers/i2c/busses/i2c-imx-lpi2c.c:671:12: warning: 'lpi2c_resume_noirq' defined but not used [-Wunused-function]
     671 | static int lpi2c_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-imx-lpi2c.c:658:12: warning: 'lpi2c_suspend_noirq' defined but not used [-Wunused-function]
     658 | static int lpi2c_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/lpi2c_resume_noirq +671 drivers/i2c/busses/i2c-imx-lpi2c.c

   657	
 > 658	static int lpi2c_suspend_noirq(struct device *dev)
   659	{
   660		int ret;
   661	
   662		ret = pm_runtime_force_suspend(dev);
   663		if (ret)
   664			return ret;
   665	
   666		pinctrl_pm_select_sleep_state(dev);
   667	
   668		return 0;
   669	}
   670	
 > 671	static int lpi2c_resume_noirq(struct device *dev)
   672	{
   673		return pm_runtime_force_resume(dev);
   674	}
   675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
