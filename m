Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C771868
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681587294; x=1713123294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDOt6VqSDVMJx7luoxP5UCjAniT3KCOhNXevl2aLwcY=;
  b=bXLQISYzvY1mXKB0efAIxRr3GBjSke5bqFPjB92fKsrHccblwmOGqcyH
   65O+pSxs3R3CfI98Iwqf03+7KeXqSA7pt9L5+kZL3DLp7Lmc83z/HPj6M
   PNhoFr+u9iBL0kLl7McmH5OALxyUY5twA17uKXZgt1Uw2Eb2LF7VlQsAP
   bjYD1bhHI7nFjtheI6kyJeSgLylkYLbCbOhipJGVJd0zDdM3yecEyur3m
   S0IF5Sq8psPJJIN0UttN63+QGMzOychQS1YKuWBFbr4JL71IFbSyQnQcn
   4R0q2Cwsa8PBMRpo9zrhvU1Y1zkV1dE8edgqDXKa4rzdFN6YXvH+xnzAn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="430967131"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="430967131"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 12:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="814310304"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="814310304"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2023 12:34:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnlff-000bIT-23;
	Sat, 15 Apr 2023 19:34:51 +0000
Date: Sun, 16 Apr 2023 03:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4839/9838]
 drivers/soc/imx/secvio/imx-secvio-sc.c:459:1: warning: 'static' is not at
 beginning of declaration
Message-ID: <202304160336.o3SrDsG8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: e5c2ac92c948f8eab9eab1fd89a5c15437168e7d [4839/9838] Merge branch 'firmware/next' into next
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230416/202304160336.o3SrDsG8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/e5c2ac92c948f8eab9eab1fd89a5c15437168e7d
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout e5c2ac92c948f8eab9eab1fd89a5c15437168e7d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/mailbox/ drivers/media/platform/mxc/capture/ drivers/net/ drivers/pwm/ drivers/regulator/ drivers/soc/imx/ drivers/staging/ drivers/video/fbdev/mxc/ sound/soc/fsl/ sound/soc/sof/amd/ sound/soc/sof/imx/ sound/soc/sof/intel/ sound/soc/sof/mediatek/mt8186/ sound/soc/sof/mediatek/mt8195/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160336.o3SrDsG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: In function 'int_imx_secvio_sc_disable_irq':
   drivers/soc/imx/secvio/imx-secvio-sc.c:377:36: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     377 |         struct imx_secvio_sc_data *data;
         |                                    ^~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: At top level:
>> drivers/soc/imx/secvio/imx-secvio-sc.c:459:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     459 | const static struct file_operations imx_secvio_sc_fops = {
         | ^~~~~


vim +/static +459 drivers/soc/imx/secvio/imx-secvio-sc.c

16674772de567c Franck LENORMAND 2019-12-05  458  
16674772de567c Franck LENORMAND 2019-12-05 @459  const static struct file_operations imx_secvio_sc_fops = {
16674772de567c Franck LENORMAND 2019-12-05  460  	.owner = THIS_MODULE,
16674772de567c Franck LENORMAND 2019-12-05  461  	.open = imx_secvio_sc_open,
16674772de567c Franck LENORMAND 2019-12-05  462  	.unlocked_ioctl = imx_secvio_sc_ioctl,
16674772de567c Franck LENORMAND 2019-12-05  463  };
16674772de567c Franck LENORMAND 2019-12-05  464  

:::::: The code at line 459 was first introduced by commit
:::::: 16674772de567c3aa328f328af2ae484abc4edd0 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
