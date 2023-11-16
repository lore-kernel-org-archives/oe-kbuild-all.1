Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D53DDD7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGGba537"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700118337; x=1731654337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0f1aMdVOzw5HUq1/TuGWkEw1fxRem6hN50CnWju7Tk=;
  b=KGGba537ynTlbVsovcZWj3gSg+CQQUdSW+bKIesxt7/Ud1ILNavlGOwD
   H1u4L/b+u78baKJjnxZAQr8TXDXd42rWFH8auq14CxNw/xxQ0GX+WreiT
   1xKxoVuefKQS8y+tmzV60H8g6vY1RfoSz40DB/1JZOc8GhZLO9UjXY7W+
   Hg3vnv65yRZeAQGDzWxOzpjcHYVcwWDgd79O4bc+0vZ/7NebCmIZYXhnC
   YqbpiL9negs281R3Sqa3QJZh09bz4wpXwl7vRfa3kKTSpGMEHxVRyrCc8
   sDMjcWv4+we9h4QEZGt9SUuRSoq5Dm3rvepmnDdBInBQWVbseHbo7UDnf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4159751"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="4159751"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 23:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855893639"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="855893639"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2023 23:05:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3WRQ-0001R6-0L;
	Thu, 16 Nov 2023 07:05:32 +0000
Date: Thu, 16 Nov 2023 15:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 17/17] drivers/cdx/cdx.c:575:20: warning:
 assignment to 'struct platform_device *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202311161510.QeT26SWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   30bd4c46bf0b9c85631b39f39c6bfc901846dbc9
commit: 30bd4c46bf0b9c85631b39f39c6bfc901846dbc9 [17/17] of: header cleanups
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231116/202311161510.QeT26SWo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161510.QeT26SWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161510.QeT26SWo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cdx/cdx.c: In function 'rescan_store':
   drivers/cdx/cdx.c:575:22: error: implicit declaration of function 'of_find_device_by_node'; did you mean 'bus_find_device_by_fwnode'? [-Werror=implicit-function-declaration]
     575 |                 pd = of_find_device_by_node(np);
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      bus_find_device_by_fwnode
>> drivers/cdx/cdx.c:575:20: warning: assignment to 'struct platform_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     575 |                 pd = of_find_device_by_node(np);
         |                    ^
   drivers/cdx/cdx.c:579:23: error: implicit declaration of function 'platform_get_drvdata' [-Werror=implicit-function-declaration]
     579 |                 cdx = platform_get_drvdata(pd);
         |                       ^~~~~~~~~~~~~~~~~~~~
>> drivers/cdx/cdx.c:579:21: warning: assignment to 'struct cdx_controller *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     579 |                 cdx = platform_get_drvdata(pd);
         |                     ^
   drivers/cdx/cdx.c:583:31: error: invalid use of undefined type 'struct platform_device'
     583 |                 put_device(&pd->dev);
         |                               ^~
   cc1: some warnings being treated as errors


vim +575 drivers/cdx/cdx.c

48a6c7bced2a78 Nipun Gupta      2023-03-13  550  
d06f5a3f714092 Linus Torvalds   2023-04-27  551  static ssize_t rescan_store(const struct bus_type *bus,
2959ab247061e6 Nipun Gupta      2023-03-13  552  			    const char *buf, size_t count)
2959ab247061e6 Nipun Gupta      2023-03-13  553  {
2959ab247061e6 Nipun Gupta      2023-03-13  554  	struct cdx_controller *cdx;
54b406e10f0334 Abhijit Gangurde 2023-10-17  555  	struct platform_device *pd;
54b406e10f0334 Abhijit Gangurde 2023-10-17  556  	struct device_node *np;
2959ab247061e6 Nipun Gupta      2023-03-13  557  	bool val;
2959ab247061e6 Nipun Gupta      2023-03-13  558  
2959ab247061e6 Nipun Gupta      2023-03-13  559  	if (kstrtobool(buf, &val) < 0)
2959ab247061e6 Nipun Gupta      2023-03-13  560  		return -EINVAL;
2959ab247061e6 Nipun Gupta      2023-03-13  561  
2959ab247061e6 Nipun Gupta      2023-03-13  562  	if (!val)
2959ab247061e6 Nipun Gupta      2023-03-13  563  		return -EINVAL;
2959ab247061e6 Nipun Gupta      2023-03-13  564  
f0af816834667b Abhijit Gangurde 2023-10-17  565  	mutex_lock(&cdx_controller_lock);
f0af816834667b Abhijit Gangurde 2023-10-17  566  
2959ab247061e6 Nipun Gupta      2023-03-13  567  	/* Unregister all the devices on the bus */
2959ab247061e6 Nipun Gupta      2023-03-13  568  	cdx_unregister_devices(&cdx_bus_type);
2959ab247061e6 Nipun Gupta      2023-03-13  569  
2959ab247061e6 Nipun Gupta      2023-03-13  570  	/* Rescan all the devices */
54b406e10f0334 Abhijit Gangurde 2023-10-17  571  	for_each_compatible_node(np, NULL, compat_node_name) {
54b406e10f0334 Abhijit Gangurde 2023-10-17  572  		if (!np)
54b406e10f0334 Abhijit Gangurde 2023-10-17  573  			return -EINVAL;
2959ab247061e6 Nipun Gupta      2023-03-13  574  
54b406e10f0334 Abhijit Gangurde 2023-10-17 @575  		pd = of_find_device_by_node(np);
54b406e10f0334 Abhijit Gangurde 2023-10-17  576  		if (!pd)
54b406e10f0334 Abhijit Gangurde 2023-10-17  577  			return -EINVAL;
54b406e10f0334 Abhijit Gangurde 2023-10-17  578  
54b406e10f0334 Abhijit Gangurde 2023-10-17 @579  		cdx = platform_get_drvdata(pd);
54b406e10f0334 Abhijit Gangurde 2023-10-17  580  		if (cdx && cdx->controller_registered && cdx->ops->scan)
54b406e10f0334 Abhijit Gangurde 2023-10-17  581  			cdx->ops->scan(cdx);
54b406e10f0334 Abhijit Gangurde 2023-10-17  582  
54b406e10f0334 Abhijit Gangurde 2023-10-17  583  		put_device(&pd->dev);
2959ab247061e6 Nipun Gupta      2023-03-13  584  	}
2959ab247061e6 Nipun Gupta      2023-03-13  585  
f0af816834667b Abhijit Gangurde 2023-10-17  586  	mutex_unlock(&cdx_controller_lock);
f0af816834667b Abhijit Gangurde 2023-10-17  587  
2959ab247061e6 Nipun Gupta      2023-03-13  588  	return count;
2959ab247061e6 Nipun Gupta      2023-03-13  589  }
2959ab247061e6 Nipun Gupta      2023-03-13  590  static BUS_ATTR_WO(rescan);
2959ab247061e6 Nipun Gupta      2023-03-13  591  

:::::: The code at line 575 was first introduced by commit
:::::: 54b406e10f0334ee0245d5129c8def444a49cd9b cdx: Remove cdx controller list from cdx bus system

:::::: TO: Abhijit Gangurde <abhijit.gangurde@amd.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
