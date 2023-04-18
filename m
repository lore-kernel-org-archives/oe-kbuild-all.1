Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDD184
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 00:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681777270; x=1713313270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JOdD5qP0I/XPfrcez8ny4KPXYqP5fZse7ydlcrx2nU=;
  b=Z1Q5jmzRm2U6L/ImYUDDeREEyjB3o0vJhdSyBqRj7fnEcoW0fuCoE1AC
   /4ZQQpQHyT8TTi6Khm7Dj/q/ixDw1tLA8E0moi1CwBQXVsCghvU0CtQWw
   hQadJJBNpfQmXqHYEwvU1xzWbMT2CUwVdPZnuqgGfD7mHuTicxdaCYaLr
   Ls7TzYNEDvC7TrowVmGsB6RfQVZyvGY2lhi1rTD1mouUWxbM97TDzTJWY
   p/iCU+IIIXHXYuRHd1Z+lsvjWpEHfGEveMXi+hl/KqIppwX8oQgFik0ht
   O0Fv8aX1q6z32bjNbIikkCxnd5ifBrHRsQRovEpL5qQApFxLRTRASLmBB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="431326771"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="431326771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 17:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="815005578"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="815005578"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Apr 2023 17:21:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poZ5n-000clR-2O;
	Tue, 18 Apr 2023 00:21:07 +0000
Date: Tue, 18 Apr 2023 08:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 288/357]
 drivers/iio/adc/qcom-spmi-adc5.c:770:24: sparse: sparse: symbol
 'adc5_data_pmic_lite' was not declared. Should it be static?
Message-ID: <202304180831.JLzIm8Up-lkp@intel.com>
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
commit: b2b03f27417f5831157bbd284d5fc4c022e03e29 [288/357] iio: qcom-spmi-adc5: Add support for adc5-lite
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230418/202304180831.JLzIm8Up-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/krzk/linux/commit/b2b03f27417f5831157bbd284d5fc4c022e03e29
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout b2b03f27417f5831157bbd284d5fc4c022e03e29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180831.JLzIm8Up-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/qcom-spmi-adc5.c:770:24: sparse: sparse: symbol 'adc5_data_pmic_lite' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
