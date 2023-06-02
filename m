Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5090310796
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685717679; x=1717253679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWsjr4B1G0LrGKE5ZBjtT2OAoL0Yzcy+bRbMs3pgnWw=;
  b=JHn1f8r1cY4qszDNSoeZ1OIbnZmnQ0dJmiwW6kKd03nMY7/DUwdg2w+B
   P7jOPJQpLweHDZe6PTLwAoFd1wz47YekOLhuVS5aY97f2DqpHKwDvCwFf
   XzMAhP3I8TLJ3dTep967TUmEnhynpEwg0fj0ZSgP3T3wAgYzu3ItGr3nK
   YQT86UTkbhA9vlq84H/NlCHAU4IZx9Ybb4IJcX9+p4R0flUNEwDfAF9WN
   8zsrKjgEH6tSBOYQApNklLLqnJ/5Byp+ar6fowOA+CjBbwXF5z9Jl93SU
   ROSCX0F5M/7to1I2SuCIdS6SdU33PbnDKiC24Rs8eYsoW5+XBntjXfOZo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="340515205"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="340515205"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="954529409"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="954529409"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jun 2023 07:54:37 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q56Am-0000Yh-1p;
	Fri, 02 Jun 2023 14:54:36 +0000
Date: Fri, 2 Jun 2023 22:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 157/282] drivers/clk/qcom/clk-cbf-8996.c:354:31: error: 'icc_sync_state'
 undeclared here (not in a function)
Message-ID: <202306022206.0a85TstW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   297b910637065761660eaae156585c0319676c58
commit: b8e134ab278eec96d6592640d14294fc1b7bdd37 [157/282] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
config: arm64-buildonly-randconfig-r001-20230531 (https://download.01.org/0day-ci/archive/20230602/202306022206.0a85TstW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/b8e134ab278eec96d6592640d14294fc1b7bdd37
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout b8e134ab278eec96d6592640d14294fc1b7bdd37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306022206.0a85TstW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/clk-cbf-8996.c:354:31: error: 'icc_sync_state' undeclared here (not in a function)
     354 |                 .sync_state = icc_sync_state,
         |                               ^~~~~~~~~~~~~~


vim +/icc_sync_state +354 drivers/clk/qcom/clk-cbf-8996.c

   347	
   348	static struct platform_driver qcom_msm8996_cbf_driver = {
   349		.probe = qcom_msm8996_cbf_probe,
   350		.remove = qcom_msm8996_cbf_remove,
   351		.driver = {
   352			.name = "qcom-msm8996-cbf",
   353			.of_match_table = qcom_msm8996_cbf_match_table,
 > 354			.sync_state = icc_sync_state,
   355		},
   356	};
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
