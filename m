Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98075395
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 22:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678572184; x=1710108184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yGJTrlnjoNo1DQntbAI01unb1I+KzQLYGeKetNCm8Bc=;
  b=F6otIj5JBk3DAJVJXIlpbFgx/UJXgq3+7fwdkd/w001/TSCQURKc5RuF
   AHNhH2k6LBfrHDLTr9cz/T+B81rbSdmvOHUglVPCofhR3oXfus2iA1a97
   +CwuaFGHoVKsIECHElHnxq3EnI484LuZxEvxZoyHn6d/TZI76oG7HQ2A0
   hDgNEUy6VQ4KyZ01+D3TT6/TN9wBsLhT+C23cRjf5Hj9DNmwYKeiwrXG6
   KwFGeRm50+sqaZOG2s1scqgP6+z0ZQNIaoUUCy1546EBNxp4+krSgPsi4
   9vaSooKFFN9ZAO2iomNg1/Id6hqsrJ8Ki+gTJqEoxnHyOSYhM3usxSXXB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="325300893"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="325300893"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 14:03:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="821483373"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="821483373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2023 14:03:03 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb7Is-0004on-1m;
	Sat, 11 Mar 2023 22:03:02 +0000
Date: Sun, 12 Mar 2023 06:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/test 18/18] drivers/soc/mediatek/mtk-svs.c:2134:41: error:
 implicit declaration of function 'get_cpu_device'; did you mean
 'get_swap_device'?
Message-ID: <202303120652.vtPtTm6u-lkp@intel.com>
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
commit: a44acb6722672badc6478a7adf3c949e911a6deb [18/18] of_device: stop including cpu.h
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230312/202303120652.vtPtTm6u-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=a44acb6722672badc6478a7adf3c949e911a6deb
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/test
        git checkout a44acb6722672badc6478a7adf3c949e911a6deb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/soc/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120652.vtPtTm6u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/soc/mediatek/mtk-svs.c: In function 'svs_mt8183_platform_probe':
>> drivers/soc/mediatek/mtk-svs.c:2134:41: error: implicit declaration of function 'get_cpu_device'; did you mean 'get_swap_device'? [-Werror=implicit-function-declaration]
    2134 |                         svsb->opp_dev = get_cpu_device(svsb->cpu_id);
         |                                         ^~~~~~~~~~~~~~
         |                                         get_swap_device
>> drivers/soc/mediatek/mtk-svs.c:2134:39: warning: assignment to 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2134 |                         svsb->opp_dev = get_cpu_device(svsb->cpu_id);
         |                                       ^
   cc1: some warnings being treated as errors


vim +2134 drivers/soc/mediatek/mtk-svs.c

0bbb09b2af9dd2 Roger Lu 2022-05-16  2116  
681a02e9500073 Roger Lu 2022-05-16  2117  static int svs_mt8183_platform_probe(struct svs_platform *svsp)
681a02e9500073 Roger Lu 2022-05-16  2118  {
6c69271926e9ac Roger Lu 2022-05-16  2119  	struct device *dev;
681a02e9500073 Roger Lu 2022-05-16  2120  	struct svs_bank *svsb;
681a02e9500073 Roger Lu 2022-05-16  2121  	u32 idx;
681a02e9500073 Roger Lu 2022-05-16  2122  
6c69271926e9ac Roger Lu 2022-05-16  2123  	dev = svs_add_device_link(svsp, "thermal");
6c69271926e9ac Roger Lu 2022-05-16  2124  	if (IS_ERR(dev))
6c69271926e9ac Roger Lu 2022-05-16  2125  		return dev_err_probe(svsp->dev, PTR_ERR(dev),
6c69271926e9ac Roger Lu 2022-05-16  2126  				     "failed to get thermal device\n");
6c69271926e9ac Roger Lu 2022-05-16  2127  
681a02e9500073 Roger Lu 2022-05-16  2128  	for (idx = 0; idx < svsp->bank_max; idx++) {
681a02e9500073 Roger Lu 2022-05-16  2129  		svsb = &svsp->banks[idx];
681a02e9500073 Roger Lu 2022-05-16  2130  
681a02e9500073 Roger Lu 2022-05-16  2131  		switch (svsb->sw_id) {
681a02e9500073 Roger Lu 2022-05-16  2132  		case SVSB_CPU_LITTLE:
681a02e9500073 Roger Lu 2022-05-16  2133  		case SVSB_CPU_BIG:
681a02e9500073 Roger Lu 2022-05-16 @2134  			svsb->opp_dev = get_cpu_device(svsb->cpu_id);
681a02e9500073 Roger Lu 2022-05-16  2135  			break;
681a02e9500073 Roger Lu 2022-05-16  2136  		case SVSB_CCI:
681a02e9500073 Roger Lu 2022-05-16  2137  			svsb->opp_dev = svs_add_device_link(svsp, "cci");
681a02e9500073 Roger Lu 2022-05-16  2138  			break;
681a02e9500073 Roger Lu 2022-05-16  2139  		case SVSB_GPU:
681a02e9500073 Roger Lu 2022-05-16  2140  			svsb->opp_dev = svs_add_device_link(svsp, "gpu");
681a02e9500073 Roger Lu 2022-05-16  2141  			break;
681a02e9500073 Roger Lu 2022-05-16  2142  		default:
681a02e9500073 Roger Lu 2022-05-16  2143  			dev_err(svsb->dev, "unknown sw_id: %u\n", svsb->sw_id);
681a02e9500073 Roger Lu 2022-05-16  2144  			return -EINVAL;
681a02e9500073 Roger Lu 2022-05-16  2145  		}
681a02e9500073 Roger Lu 2022-05-16  2146  
681a02e9500073 Roger Lu 2022-05-16  2147  		if (IS_ERR(svsb->opp_dev))
681a02e9500073 Roger Lu 2022-05-16  2148  			return dev_err_probe(svsp->dev, PTR_ERR(svsb->opp_dev),
681a02e9500073 Roger Lu 2022-05-16  2149  					     "failed to get OPP device for bank %d\n",
681a02e9500073 Roger Lu 2022-05-16  2150  					     idx);
681a02e9500073 Roger Lu 2022-05-16  2151  	}
681a02e9500073 Roger Lu 2022-05-16  2152  
681a02e9500073 Roger Lu 2022-05-16  2153  	return 0;
681a02e9500073 Roger Lu 2022-05-16  2154  }
681a02e9500073 Roger Lu 2022-05-16  2155  

:::::: The code at line 2134 was first introduced by commit
:::::: 681a02e9500073cd8b9c25a04f06166254b5a879 soc: mediatek: SVS: introduce MTK SVS engine

:::::: TO: Roger Lu <roger.lu@mediatek.com>
:::::: CC: Matthias Brugger <matthias.bgg@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
