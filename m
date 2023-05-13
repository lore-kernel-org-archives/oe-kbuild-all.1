Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B7137B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683972070; x=1715508070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WD+Ciqjo15vqOiV1MD0af3q0PtBPZPB8R5Nc1Iq2Zw=;
  b=kFYb3ESTbfwN0tUzeegqMM3uLVdsVnepjuXUlBfU0+zpgkYAgthjzu9I
   FFiwf9ztdiTjm6NBXP88HKLWKQlAV/rN/s2F97rohc4l1wVZJZrG0R0I1
   CRbEr5tEh//0EOcIY8qfKXvmLEQDWDmjXABb17gyFBipn2wZNNnX6DbHz
   VMJCNB1L7yIb9k7t4dmJ2Hqp14Hm9PWhJN/OnfN3s2WYOoV0LT4dqZhh+
   9N7a8J5HQQsj5qZBJNt6IrGFXOptqEJYpP9J3js4P4yzlQMt3bmzhgshu
   J3KvYcwVnd9+yfs69hOwWWU7bkPVRM2xb48mTvBJjUdqnQJdjuL6I/1VF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340278212"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="340278212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 03:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="700431139"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="700431139"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 May 2023 03:01:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxm3o-0005Rk-1B;
	Sat, 13 May 2023 10:01:08 +0000
Date: Sat, 13 May 2023 18:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 261/453] drivers/iio/adc/qcom-spmi-adc5.c:778:24: sparse: sparse: symbol
 'adc5_data_pmic_lite' was not declared. Should it be static?
Message-ID: <202305131737.rzxjcpfX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   255ec801b7a09e914735a942f27f3c74f5e8e810
commit: e905c108b5ad7e6f465be7ebb9cd72c91524ee52 [261/453] iio: qcom-spmi-adc5: Add support for adc5-lite
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230513/202305131737.rzxjcpfX-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/krzk/linux/commit/e905c108b5ad7e6f465be7ebb9cd72c91524ee52
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout e905c108b5ad7e6f465be7ebb9cd72c91524ee52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131737.rzxjcpfX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/qcom-spmi-adc5.c:778:24: sparse: sparse: symbol 'adc5_data_pmic_lite' was not declared. Should it be static?

vim +/adc5_data_pmic_lite +778 drivers/iio/adc/qcom-spmi-adc5.c

   777	
 > 778	const struct adc5_data adc5_data_pmic_lite = {
   779		.full_scale_code_volt = 0x70e4,
   780		.full_scale_code_cur = 0x1388,
   781		.adc_chans = adc5_chans_pmic,
   782		.info = &adc5_info,
   783		.decimation = (unsigned int [ADC5_DECIMATION_SAMPLES_MAX])
   784					{250, 420, 840},
   785		.hw_settle_1 = (unsigned int [VADC_HW_SETTLE_SAMPLES_MAX])
   786					{15, 100, 200, 300, 400, 500, 600, 700,
   787					 800, 900, 1, 2, 4, 6, 8, 10},
   788	};
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
