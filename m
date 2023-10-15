Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C4111F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHXL66Tk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697336356; x=1728872356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6rb0Kj/g1GSnQeBxaO90ifubeypahVMwi8LJrv5GWC0=;
  b=EHXL66TkRBuLSRp3oQI1KSjRCuTbXXGy6DOYb3suS4v1kyNe/kpVNimT
   jI5WbQwLnfua0X3DmqCndbnZZZNcFx+Ycsh6CuXSbRPv2qvijN1A+kfbk
   NtW6mWiX+sBkr6MvV5wpEbR3ecQUTau2kN73a5+Z9OgfCn7QfTrAp1YtN
   /I4mWTmU4ae6d+ZeyiMuwpX+rrS72AyiLwyo+lLcJDRYHD23Feix55TI1
   aG+vM29hAGYQJQzGx4HzQjbOSqStWpuk10yvzCisvpyTk7NXpx/D7VlRS
   WZyI/bH+Q2850m2J58q/JF8Ad2NHAX6CCyoNs1ispB3KEHznBHgm0XlFv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364721043"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364721043"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="928914666"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="928914666"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2023 19:19:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrqil-0006vb-35;
	Sun, 15 Oct 2023 02:19:11 +0000
Date: Sun, 15 Oct 2023 10:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4863/15768]
 drivers/gpio/gpio-imx-rpmsg.c:331:6: warning: no previous prototype for
 'imx_rpmsg_gpio_do_send'
Message-ID: <202310151027.05td8XqO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: d76441df9683065e8b622bc0cdf725ba3b2db0fd [4863/15768] Merge branch 'rpmsg/next' into next
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231015/202310151027.05td8XqO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151027.05td8XqO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151027.05td8XqO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-imx-rpmsg.c:331:6: warning: no previous prototype for 'imx_rpmsg_gpio_do_send' [-Wmissing-prototypes]
     331 | void imx_rpmsg_gpio_do_send(struct work_struct *w)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/imx_rpmsg_gpio_do_send +331 drivers/gpio/gpio-imx-rpmsg.c

8fa5514f1deacc Fugang Duan 2017-09-26  330  
8fa5514f1deacc Fugang Duan 2017-09-26 @331  void imx_rpmsg_gpio_do_send(struct work_struct *w)
8fa5514f1deacc Fugang Duan 2017-09-26  332  {
8fa5514f1deacc Fugang Duan 2017-09-26  333  	struct imx_rpmsg_gpio_work *gpio_send_work =
8fa5514f1deacc Fugang Duan 2017-09-26  334  	       container_of(w, struct imx_rpmsg_gpio_work, rpmsg_send_wq);
8fa5514f1deacc Fugang Duan 2017-09-26  335  
8fa5514f1deacc Fugang Duan 2017-09-26  336  	gpio_send_message(gpio_send_work->port,
8fa5514f1deacc Fugang Duan 2017-09-26  337  			  gpio_send_work->msg, &gpio_rpmsg, false);
8fa5514f1deacc Fugang Duan 2017-09-26  338  }
8fa5514f1deacc Fugang Duan 2017-09-26  339  

:::::: The code at line 331 was first introduced by commit
:::::: 8fa5514f1deacca7cd8833b367cb2b6952ee14d8 gpio: imx-rpmsg: add rpmsg virtual gpio driver

:::::: TO: Fugang Duan <fugang.duan@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
