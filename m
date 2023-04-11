Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0608BEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681215856; x=1712751856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03UsXdNB8+BULHl0krZoSUanngV0v0BpdMqCglpcaOY=;
  b=G1m3JvqKxZXFZ5NHj6hSiuPdBi/lLFaG3mmpI8L86A1wmY08oG+UV3fL
   osXjZ4JIi56mCzXumu2fAHLtzOxHv66rOWLQa5AOokOkNgw4SKVKj0FkN
   qNvXkBXJTyG/skpqu6WlBsnlM1KwW6hEsPBrvATdX22p2Nnpab4GA149W
   eH1ddWOyawSDqHVlPXJ6kw0BFOwToUTlMXW71qUzoZH0m7rvYi8pdcw6D
   P05wxok+xLNL9iTlNg5MlylM9f6YUTe00rHq3DPfmdtUeHYxX4lX4im/f
   ykBf6/AF0O4JfMN+XIIZMrGVdY02u5aa8X4CqPfEwXW5farEwyqevdqrB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="343606659"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="343606659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 05:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777894076"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="777894076"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2023 05:24:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmD2f-000WIB-1x;
	Tue, 11 Apr 2023 12:24:09 +0000
Date: Tue, 11 Apr 2023 20:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10444/10570]
 drivers/tty/serial/samsung_tty.c:2034:24: error: implicit declaration of
 function 'of_device_get_match_data'; did you mean 'device_get_match_data'?
Message-ID: <202304112044.8NzKpvxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   009795d283d1f9f043e5a4ff97d4140cde17e2d3
commit: 6f2db1788a53dcdbe6fe5639583e871e017f7167 [10444/10570] cpufreq: Adjust includes to remove of_device.h
config: parisc-randconfig-r014-20230409 (https://download.01.org/0day-ci/archive/20230411/202304112044.8NzKpvxM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6f2db1788a53dcdbe6fe5639583e871e017f7167
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6f2db1788a53dcdbe6fe5639583e871e017f7167
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112044.8NzKpvxM-lkp@intel.com/

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

:::::: The code at line 2034 was first introduced by commit
:::::: f25fbd5b1ef3773bd975135f8a017dc2251626cc tty: serial: samsung: simplify getting OF match data

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
