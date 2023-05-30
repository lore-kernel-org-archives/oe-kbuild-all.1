Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3532E9462
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685431396; x=1716967396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IjwmQL4rBX4MWPbF++HRiRaC5aQKdtJgjfYQ+vMZtnU=;
  b=Zdj9bMwyDefkXXAlSpZ1YpIW/E/8/EtAk5BiohKa09A/nkQH1yDKuHho
   YHtBtkJytPYkxs+UTJTW7UTIzuN46LT9JExR9GjxOTcQwBhZIaTya7JX9
   zZ86QMg6u/4eVOen/fbYC1WT+5S9r3p4xZhkUhO4jdF6H5AbeiWHKaRaX
   GOEOjq8kIGQQSb3E20Rm6wUB8LCwI+t0W5pPbpn9t09AgG8YYmwe/40l1
   lA9t3a3wknXoduIYSJ3ZzTW8IZOg5FP0RLoZYIWsEyQPy/4vtsBowNl1o
   4zN1SilFx6GJ5Lo1nh6y0x3j7CDEqyKxI2JBxW6fnjy31WQF60/s1NZCM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334460173"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="334460173"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 00:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706314239"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="706314239"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2023 00:23:13 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3thI-0000By-1w;
	Tue, 30 May 2023 07:23:12 +0000
Date: Tue, 30 May 2023 15:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.4.0-rc4 117/119]
 drivers/firmware/qcom_qseecom_uefisecapp.c:251:16: warning: no previous
 prototype for 'qcuefi_dev'
Message-ID: <202305301538.IR6zYk58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.4.0-rc4
head:   3cbfe4d71844450cfc938433021e83308fe21870
commit: e0a001e54f11178d4593d4a10e5579a1d2140f92 [117/119] firmware: Add support for Qualcomm UEFI Secure Application
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305301538.IR6zYk58-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/e0a001e54f11178d4593d4a10e5579a1d2140f92
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-v6.4.0-rc4
        git checkout e0a001e54f11178d4593d4a10e5579a1d2140f92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301538.IR6zYk58-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/qcom_qseecom_uefisecapp.c:251:16: warning: no previous prototype for 'qcuefi_dev' [-Wmissing-prototypes]
     251 | struct device *qcuefi_dev(struct qcuefi_client *qcuefi)
         |                ^~~~~~~~~~


vim +/qcuefi_dev +251 drivers/firmware/qcom_qseecom_uefisecapp.c

   250	
 > 251	struct device *qcuefi_dev(struct qcuefi_client *qcuefi)
   252	{
   253		return &qcuefi->client->aux_dev.dev;
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
