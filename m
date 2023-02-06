Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C3B3C2C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675684557; x=1707220557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grSvXDSHPkPLjguVqU3N4Ep0Kic3QqAnSYLlkotf6NI=;
  b=CJjbmBPpZEXwIQhT+2+FHVSK+clQioVjeBDE9ZngzZjPiVxjsE46qRPU
   hJxRb48oZECwDm3B4xe25QiivOQVpmYsFqGaSQuxAx76rDhAhbeZYHCfj
   tsayZq2u1xCep6uo4H6Zi5o4+BxEUj+RFY6o1Y/eTirjQvZ450N6uaHbE
   V8hA127sPNGExFQZ97lqT01+kl8c8J3FgXTmtoT7esba8fsh1gCmO3Sga
   VCKvqUIaqWRl6lU3LCwX2w5ACjmySTu+szpuwFGzylegSuo5QgsE4Z7lf
   GG8G/JHEA8MgZJiXdipFLz1N8eYkmTH3S3AoLcB5nwapR7XsV1a/XxAWC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308830725"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="308830725"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 03:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="696852399"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="696852399"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Feb 2023 03:55:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP06F-0002We-00;
	Mon, 06 Feb 2023 11:55:55 +0000
Date: Mon, 6 Feb 2023 19:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6164/20208]
 drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype
 for 'int_imx_secvio_sc_check_state'
Message-ID: <202302061913.2hKbncHz-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 8e33e9a47296b6a3afd7da3c950b77eaacfc42b3 [6164/20208] Merge branch 'firmware/next' into next
config: arm-randconfig-r046-20230205 (https://download.01.org/0day-ci/archive/20230206/202302061913.2hKbncHz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/8e33e9a47296b6a3afd7da3c950b77eaacfc42b3
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 8e33e9a47296b6a3afd7da3c950b77eaacfc42b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-imx/ drivers/firmware/imx/ drivers/rpmsg/ drivers/soc/imx/secvio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/secvio/imx-secvio-sc.c:140:5: warning: no previous prototype for 'int_imx_secvio_sc_check_state' [-Wmissing-prototypes]
     140 | int int_imx_secvio_sc_check_state(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: In function 'int_imx_secvio_sc_disable_irq':
>> drivers/soc/imx/secvio/imx-secvio-sc.c:377:36: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     377 |         struct imx_secvio_sc_data *data;
         |                                    ^~~~
   drivers/soc/imx/secvio/imx-secvio-sc.c: At top level:
>> drivers/soc/imx/secvio/imx-secvio-sc.c:459:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     459 | const static struct file_operations imx_secvio_sc_fops = {
         | ^~~~~
--
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:35:5: warning: no previous prototype for 'fuse_reader' [-Wmissing-prototypes]
      35 | int fuse_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:56:5: warning: no previous prototype for 'snvs_reader' [-Wmissing-prototypes]
      56 | int snvs_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~
>> drivers/soc/imx/secvio/imx-secvio-debugfs.c:95:5: warning: no previous prototype for 'snvs_dgo_reader' [-Wmissing-prototypes]
      95 | int snvs_dgo_reader(struct device *dev, u32 id, u32 *value, u8 mul)
         |     ^~~~~~~~~~~~~~~


vim +/int_imx_secvio_sc_check_state +140 drivers/soc/imx/secvio/imx-secvio-sc.c

c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  139  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05 @140  int int_imx_secvio_sc_check_state(struct device *dev)
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  141  {
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  142  	struct secvio_sc_notifier_info info = {0};
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  143  	int ret = 0;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  144  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  145  	ret = int_imx_secvio_sc_get_state(dev, &info);
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  146  	if (ret) {
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  147  		dev_err(dev, "Failed to get secvio state\n");
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  148  		goto exit;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  149  	}
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  150  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  151  	/* Call chain of CB registered to this module if status detected */
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  152  	if (info.hpsvs || info.lps || info.lptds)
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  153  		if (imx_secvio_sc_notifier_call_chain(&info))
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  154  			dev_warn(dev,
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  155  				 "Issues when calling the notifier chain\n");
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  156  
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  157  exit:
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  158  	return ret;
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  159  }
c4c96d8e4f4bd6 Franck LENORMAND 2019-12-05  160  

:::::: The code at line 140 was first introduced by commit
:::::: c4c96d8e4f4bd60d88bfbcedf2edefdc1e1f7cf8 SSI-87: soc: imx: secvio: Add support for SNVS secvio and tamper via SCFW

:::::: TO: Franck LENORMAND <franck.lenormand@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
