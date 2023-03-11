Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F127B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 21:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678569124; x=1710105124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGXmf9jTnPbp+Evwzszp6AVcOvW+ipDZ5843HSpjjpk=;
  b=CaNHSeOs7x0YsJ4s21tdjfFzEgbQEVF9T80WKnWjW3odzgjzASo3iAeE
   6DRmbXREVPvuVtIxGI3kZk4F9u252SUFjlJqq5PYS5EvxMGKdiinc4g+7
   dEOl7a/DPlwZGTJ/M/OMitVm0SGiih1CxjZYG6Z4wHYdTeJwG1h10qdUB
   CxFnZHQyr3MLTWI4ZiSk5+tVtzmIHny5l3bt7kr95F7bHO6P5VOFhrv9N
   KI4VpeOG8RsWs8TK+C+FGoOIyRcIrD4T+b5K340PKIDSa/3mCbaDJNo59
   IBHI2Kz2St69NauZ5bxk5HVd5nIp20jTA0LQZm4LBdx6+o+KcFXRAsft0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="336962768"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="336962768"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 13:12:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="788442191"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="788442191"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2023 13:12:02 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb6VW-0004oD-09;
	Sat, 11 Mar 2023 21:12:02 +0000
Date: Sun, 12 Mar 2023 05:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/test 14/18] drivers/tty/serial/samsung_tty.c:2034:24:
 error: implicit declaration of function 'of_device_get_match_data'; did you
 mean 'device_get_match_data'?
Message-ID: <202303120520.35fFsMN6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/test
head:   a44acb6722672badc6478a7adf3c949e911a6deb
commit: e4624c687475c173f119d4bced069509fa102cb7 [14/18] cpufreq: Adjust includes to remove of_device.h
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230312/202303120520.35fFsMN6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=e4624c687475c173f119d4bced069509fa102cb7
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/test
        git checkout e4624c687475c173f119d4bced069509fa102cb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/soc/mediatek/ drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120520.35fFsMN6-lkp@intel.com/

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
