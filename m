Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF9195
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 00:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685753050; x=1717289050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4n0TZt6ly9/W8gtyHYjl/JFTX5Yq4k4yAgpXlt0xbU=;
  b=DzJG+JzN4Epq/fey1aeWf9MxaZsn36N8KA7r2iScU8pWqLHTXk3XvPLM
   YCWK9KDFLnoeNo3Z6YtwNRFwVxc4pLneVJykbHukikSeL3+YdfFtL59oK
   9iP9vcLMnQRhvaZftDCH3vvmFbEzQ6DOQuvMnacnTbZmBByURaw16d+ea
   DeJAoVydeSabk+nEEyR+8j7jkwSIFqg+b9oVB9njs6iVy44Jr3rmTGA5q
   c66OBYhi7V3h4xwQeouS3folJ/LCfkMxrzCeCP62GZX2pmI+ntYALWZl0
   +GbtsrLeYRfo8biJCLP6JLDe8Qs78gHKOU1DNiJaYuxd2ds17EOFT3l0h
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358444404"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="358444404"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 17:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658436969"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="658436969"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2023 17:44:08 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5FNH-00015x-1W;
	Sat, 03 Jun 2023 00:44:07 +0000
Date: Sat, 3 Jun 2023 08:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 136/282] drivers/iio/adc/qcom-spmi-adc5.c:778:24: sparse: sparse: symbol
 'adc5_data_pmic_lite' was not declared. Should it be static?
Message-ID: <202306030852.CdfunLvV-lkp@intel.com>
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
commit: 71797c522650aee028e5657b90f7638864555c29 [136/282] iio: qcom-spmi-adc5: Add support for adc5-lite
config: i386-randconfig-s003-20230531 (https://download.01.org/0day-ci/archive/20230603/202306030852.CdfunLvV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/krzk/linux/commit/71797c522650aee028e5657b90f7638864555c29
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 71797c522650aee028e5657b90f7638864555c29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030852.CdfunLvV-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
