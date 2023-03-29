Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432C3C0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680123136; x=1711659136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c/QAeRCa9q/Rkfbi8hix3UogPtmuYA28iOFzcOFau4Q=;
  b=G5tJarv1/4tl2bQ+6QmnRt6OZoAzaFrm13Lx5wD5fQcnDa4DbviE7yTy
   cvtmlAvCO+QPsPsr9BlP1f0E9TJqFK+WYFBf9FdB4+nKVlVLyEYwCyQTW
   HMCoEqtcZqA1BHe+6+KRcTkg+Cy4nPayK6ACO3VNBloIIFeMYnnMP1mtE
   Nz02P8vLnYdBgQrYJ4tNo1rYdKC0ujx2S67UiBiTp+xJTDCEdyLxpdGuL
   8wnKjLDF45Qc2O/36ZE+mriZS26B2L2XOSuh5rEYLZoZMwOmZ1foOEIxw
   KdOymEm26LX8Wz/cLAO9p/GdoUMtkUSkMyo6c6u7vIBmMXZ4ebSYXgh5Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="324915829"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="324915829"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="634612525"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="634612525"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Mar 2023 13:52:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phcmC-000JwM-1E;
	Wed, 29 Mar 2023 20:52:12 +0000
Date: Thu, 30 Mar 2023 04:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 14/19] cpufreq: Adjust includes to remove of_device.h
Message-ID: <202303300425.6JdMZrX7-lkp@intel.com>
References: <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47@kernel.org>

Hi Rob,

I love your patch! Yet something to improve:

[auto build test ERROR on fe15c26ee26efa11741a7b632e9f23b01aca4cc6]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/of-Make-devtree_lock-declaration-private/20230329-235635
base:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
patch link:    https://lore.kernel.org/r/20230329-dt-cpu-header-cleanups-v1-14-581e2605fe47%40kernel.org
patch subject: [PATCH 14/19] cpufreq: Adjust includes to remove of_device.h
config: xtensa-randconfig-r033-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300425.6JdMZrX7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2d8d18f806b57611002876b9921aae0d041bbe63
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Herring/of-Make-devtree_lock-declaration-private/20230329-235635
        git checkout 2d8d18f806b57611002876b9921aae0d041bbe63
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300425.6JdMZrX7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_get_driver_data':
>> drivers/tty/serial/samsung_tty.c:2034:24: error: implicit declaration of function 'of_device_get_match_data'; did you mean 'device_get_match_data'? [-Werror=implicit-function-declaration]
    2034 |                 return of_device_get_match_data(&pdev->dev);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
         |                        device_get_match_data
   drivers/tty/serial/samsung_tty.c:2034:24: warning: returning 'int' from a function with return type 'const struct s3c24xx_serial_drv_data *' makes pointer from integer without a cast [-Wint-conversion]
    2034 |                 return of_device_get_match_data(&pdev->dev);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2034 drivers/tty/serial/samsung_tty.c

b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07-03  2029  
97a6cfe8115b04 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2030  static inline const struct s3c24xx_serial_drv_data *
695b847b247cff drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2020-06-17  2031  s3c24xx_get_driver_data(struct platform_device *pdev)
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2032  {
f25fbd5b1ef377 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2033  	if (dev_of_node(&pdev->dev))
f25fbd5b1ef377 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08 @2034  		return of_device_get_match_data(&pdev->dev);
9fe0d41ffd39cb drivers/tty/serial/samsung_tty.c Greg Kroah-Hartman  2019-12-10  2035  
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2036  	return (struct s3c24xx_serial_drv_data *)
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2037  			platform_get_device_id(pdev)->driver_data;
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2038  }
26c919e1d3f4df drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2039  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
