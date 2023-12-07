Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A53101DE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/4/JeqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701960352; x=1733496352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eAFNe8Mj9Qyd5GReny7fyjVVA+UM88BVsgbXVumjSCU=;
  b=U/4/JeqXErf1frHzHPhhicrYzmg+5FjbmW71YJEDnewpCEHPOS8zyhJ5
   dRsQDpY76/VHHKh1Rr+Exumre9xDbyjHWfYBuV0oBiOtpK9tNW9einpDT
   oqxDYUMAKk1uCy62jx9Aw5j8ZdHskhJlh3wsaB6jWqUNV/0Sb+n/4xRAX
   0j+PmzKbpxdi+9CU6UZVRg1UTTb+1/7ivZs0uw5KXrApRb2RduyhgZQGK
   8kUHMKaUJJdwFgHTRsKzrWL9rCextw8eoBzNB4HoslAgI31vO8GMZO4A0
   W3aljWdhTxcpAA0B3ApzF+TypxVpqDLt3VJBzH6qSYe5d7f3LHYc4d683
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1119751"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1119751"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1103216860"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1103216860"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 07 Dec 2023 06:45:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBFdM-000CNm-16;
	Thu, 07 Dec 2023 14:45:48 +0000
Date: Thu, 7 Dec 2023 22:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-next 6/7] drivers/reset/sti/reset-syscfg.c:196:1: warning:
 control reaches end of non-void function
Message-ID: <202312072209.EZJmUcli-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   6c26cfb1561efbf12fe3cf700ddc2e956866af45
commit: f793fea7761d32ed64767311c82f39f0798fe6d6 [6/7] of: Stop circularly including of_device.h and of_platform.h
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20231207/202312072209.EZJmUcli-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072209.EZJmUcli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072209.EZJmUcli-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/reset/sti/reset-syscfg.c: In function 'syscfg_reset_probe':
   drivers/reset/sti/reset-syscfg.c:192:29: error: invalid use of undefined type 'const struct of_device_id'
     192 |         if (!match || !match->data)
         |                             ^~
   drivers/reset/sti/reset-syscfg.c:195:59: error: invalid use of undefined type 'const struct of_device_id'
     195 |         return syscfg_reset_controller_register(dev, match->data);
         |                                                           ^~
>> drivers/reset/sti/reset-syscfg.c:196:1: warning: control reaches end of non-void function [-Wreturn-type]
     196 | }
         | ^


vim +196 drivers/reset/sti/reset-syscfg.c

e5d76075d9300a4 Stephen Gallimore 2013-08-07  182  
e5d76075d9300a4 Stephen Gallimore 2013-08-07  183  int syscfg_reset_probe(struct platform_device *pdev)
e5d76075d9300a4 Stephen Gallimore 2013-08-07  184  {
e5d76075d9300a4 Stephen Gallimore 2013-08-07  185  	struct device *dev = pdev ? &pdev->dev : NULL;
e5d76075d9300a4 Stephen Gallimore 2013-08-07  186  	const struct of_device_id *match;
e5d76075d9300a4 Stephen Gallimore 2013-08-07  187  
e5d76075d9300a4 Stephen Gallimore 2013-08-07  188  	if (!dev || !dev->driver)
e5d76075d9300a4 Stephen Gallimore 2013-08-07  189  		return -ENODEV;
e5d76075d9300a4 Stephen Gallimore 2013-08-07  190  
e5d76075d9300a4 Stephen Gallimore 2013-08-07  191  	match = of_match_device(dev->driver->of_match_table, dev);
e5d76075d9300a4 Stephen Gallimore 2013-08-07  192  	if (!match || !match->data)
e5d76075d9300a4 Stephen Gallimore 2013-08-07  193  		return -EINVAL;
e5d76075d9300a4 Stephen Gallimore 2013-08-07  194  
e5d76075d9300a4 Stephen Gallimore 2013-08-07  195  	return syscfg_reset_controller_register(dev, match->data);
e5d76075d9300a4 Stephen Gallimore 2013-08-07 @196  }

:::::: The code at line 196 was first introduced by commit
:::::: e5d76075d9300a483619f7f308a693311af9c2cb drivers: reset: STi SoC system configuration reset controller support

:::::: TO: Stephen Gallimore <stephen.gallimore@st.com>
:::::: CC: Srinivas Kandagatla <srinivas.kandagatla@st.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
