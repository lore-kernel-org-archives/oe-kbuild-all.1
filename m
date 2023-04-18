Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E510F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 01:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681780331; x=1713316331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iWscTSNuhAgMYo6j6fLeJdWeeTKvi+HeS8nHVHYpx7I=;
  b=RLsa7gAswFODDFoBKANcK3i5hLgYtXwqhvy7sd9U+F42PabemqHBa695
   EKUPUl68pMKl6Lgb6Ma6pllCbqq6kJzRLfDVeT9gZFCKWtck5DBek97p2
   z4icpDwFVW+Sx98tiMmLIK1JNMIz7Te9yyffNyi5QRZflORHkJcubNZou
   TRDnnruL7yu3lHi62auzqcigdwf6v2xCq3oY/r1vSVviX0ZQ6dtIW9G5F
   mMtttvp/Z3SC1CGgmXvwIR/kRR8L34NeYXAaLEbvCXjD34oKY59JKzley
   PXQK/khGMFxKIIkvqLMbwNk9XVDz0Vra9qzj1f3QK2yF1YRsYJ/BaZTwq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407940931"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="407940931"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 18:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="815018343"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="815018343"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Apr 2023 18:12:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poZtB-000cnf-0v;
	Tue, 18 Apr 2023 01:12:09 +0000
Date: Tue, 18 Apr 2023 09:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 166/357]
 tsens.c:undefined reference to `qcom_scm_is_available'
Message-ID: <202304180950.ot35A871-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-hdmi-audio-on-qcomlt
head:   aaffc85ea59d991971812124737973d89355d8b1
commit: 357e123b8ec17622f96f14fa96a14bacbee78552 [166/357] thermal: qcom: tsens: Add driver support for re-initialization quirk
config: loongarch-randconfig-r013-20230417 (https://download.01.org/0day-ci/archive/20230418/202304180950.ot35A871-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/357e123b8ec17622f96f14fa96a14bacbee78552
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout 357e123b8ec17622f96f14fa96a14bacbee78552
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180950.ot35A871-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/thermal/qcom/tsens.o: in function `.L215':
>> tsens.c:(.text+0xdd4): undefined reference to `qcom_scm_is_available'
   loongarch64-linux-ld: drivers/thermal/qcom/tsens.o: in function `.L262':
>> tsens.c:(.text+0x10ec): undefined reference to `qcom_scm_tsens_reinit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
