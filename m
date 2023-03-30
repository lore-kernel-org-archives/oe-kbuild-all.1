Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1A1380
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 03:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680145479; x=1711681479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJEFXfGUIJG3WudBSBTdqVAkdHrEU7udlI5kNZxJNdY=;
  b=VyIxGhccOskIeTVpgGCug62UsYct3OHEuGVf/Rc4+kbKEo3l31YK5R8G
   BKPrEow/T7C28e95ZTH6UoLbhTqycQAe8Bejx+vOa+7xSx2AjND5r20qb
   59GzKyTmlJ/OM0veELJkrYVWTJDz2WuhbnC+dpziAGY1sduauLvfKHes/
   +gpGJlxYxVGWXz7f3LTnGKAKjC3/Y7ZfCiR90H9R6FG8AmFLYD3Zka9yT
   IVu+jN1TdkM+b+zAam9zLEgGnaVIadUqgeFbYSW+vNE8apVwFy8YPZTiu
   F7cMUHBg0T/CVrF4yI0MxzeooFdbHi1DaPECDkM0LoSxaBmIQZUoVgZCH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="321441081"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="321441081"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 20:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="773823334"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="773823334"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Mar 2023 20:04:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phiaO-000KFc-1r;
	Thu, 30 Mar 2023 03:04:24 +0000
Date: Thu, 30 Mar 2023 11:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 15/20] drivers/tty/serial/samsung_tty.c:2034:24:
 error: implicit declaration of function 'of_device_get_match_data'; did you
 mean 'device_get_match_data'?
Message-ID: <202303301023.OIEDxctx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   d65e96b2f9a9ef1dcb6d70aee8684dfe8906876d
commit: e856eec91683ba6e06e865943384743407ddae39 [15/20] cpufreq: Adjust includes to remove of_device.h
config: alpha-randconfig-r012-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301023.OIEDxctx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=e856eec91683ba6e06e865943384743407ddae39
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh for-kernelci
        git checkout e856eec91683ba6e06e865943384743407ddae39
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301023.OIEDxctx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_get_driver_data':
>> drivers/tty/serial/samsung_tty.c:2034:24: error: implicit declaration of function 'of_device_get_match_data'; did you mean 'device_get_match_data'? [-Werror=implicit-function-declaration]
    2034 |                 return of_device_get_match_data(&pdev->dev);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
         |                        device_get_match_data
>> drivers/tty/serial/samsung_tty.c:2034:24: warning: returning 'int' from a function with return type 'const struct s3c24xx_serial_drv_data *' makes pointer from integer without a cast [-Wint-conversion]
    2034 |                 return of_device_get_match_data(&pdev->dev);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2034 drivers/tty/serial/samsung_tty.c

b497549a035c2a8 drivers/serial/samsung.c         Ben Dooks           2008-07-03  2029  
97a6cfe8115b042 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2030  static inline const struct s3c24xx_serial_drv_data *
695b847b247cff4 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2020-06-17  2031  s3c24xx_get_driver_data(struct platform_device *pdev)
26c919e1d3f4dff drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2032  {
f25fbd5b1ef3773 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08  2033  	if (dev_of_node(&pdev->dev))
f25fbd5b1ef3773 drivers/tty/serial/samsung_tty.c Krzysztof Kozlowski 2022-03-08 @2034  		return of_device_get_match_data(&pdev->dev);
9fe0d41ffd39cb4 drivers/tty/serial/samsung_tty.c Greg Kroah-Hartman  2019-12-10  2035  
26c919e1d3f4dff drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2036  	return (struct s3c24xx_serial_drv_data *)
26c919e1d3f4dff drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2037  			platform_get_device_id(pdev)->driver_data;
26c919e1d3f4dff drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2038  }
26c919e1d3f4dff drivers/tty/serial/samsung.c     Thomas Abraham      2011-11-06  2039  

:::::: The code at line 2034 was first introduced by commit
:::::: f25fbd5b1ef3773bd975135f8a017dc2251626cc tty: serial: samsung: simplify getting OF match data

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
