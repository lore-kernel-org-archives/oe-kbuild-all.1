Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23ABECA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vj5DWamF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698475815; x=1730011815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mEncRn/hJZOxjyrjWw5DNbARd29Vmmpb8+GGfN3knqU=;
  b=Vj5DWamFm1AnGPkydONdrrRcmzrCJ4/K2CK4LwcqqXmLlzy7NpNi01GZ
   o9V0rbQ78LidRdp3ObkfDn0nQH2JaF4pfDaz+u+iAdBJfKwfcfOvpWdIt
   2CpPuV8vrnWyPULbW5AQe5iW3Q6KUdCB5M8KduWPEfwi82R4wiZOjghjQ
   IeiHRq4bVGIyxRKVbdKrQuBepwPBMBUDe6WnjB7clGgeO2OlD4kgRGNnG
   uezfOxup6H5dFpxGDaXNCHXzuvd+Y8NkYdtsXLbHOA8peTVxuY1lUdLvd
   6AIbmYt+MFkzDmBea4mpVF5eV21Yg9I+vz/VbcfrsgjIvE+lbHB+e3TVD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474121688"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="474121688"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 23:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="753329804"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="753329804"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Oct 2023 23:50:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwd99-000BXh-0T;
	Sat, 28 Oct 2023 06:50:11 +0000
Date: Sat, 28 Oct 2023 14:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS
Message-ID: <202310281446.h5poAk5Y-lkp@intel.com>
References: <20231027093615.140656-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027093615.140656-3-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/dt-bindings-pinctrl-qcom-sm8650-lpass-lpi-pinctrl-add-SM8650-LPASS/20231027-174026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231027093615.140656-3-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 2/2] pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20231028/202310281446.h5poAk5Y-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281446.h5poAk5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281446.h5poAk5Y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:10: error: 'const struct lpi_pinctrl_variant_data' has no member named 'flags'
     232 |         .flags = LPI_FLAG_SLEW_RATE_SAME_REG,
         |          ^~~~~
>> drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:18: error: 'LPI_FLAG_SLEW_RATE_SAME_REG' undeclared here (not in a function); did you mean 'LPI_SLEW_RATE_CTL_REG'?
     232 |         .flags = LPI_FLAG_SLEW_RATE_SAME_REG,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  LPI_SLEW_RATE_CTL_REG
>> drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:18: warning: excess elements in struct initializer
   drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:18: note: (near initialization for 'sm8650_lpi_data')


vim +232 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c

   224	
   225	static const struct lpi_pinctrl_variant_data sm8650_lpi_data = {
   226		.pins = sm8650_lpi_pins,
   227		.npins = ARRAY_SIZE(sm8650_lpi_pins),
   228		.groups = sm8650_groups,
   229		.ngroups = ARRAY_SIZE(sm8650_groups),
   230		.functions = sm8650_functions,
   231		.nfunctions = ARRAY_SIZE(sm8650_functions),
 > 232		.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
   233	};
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
