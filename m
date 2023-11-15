Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C152C19B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM9CVAFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700060563; x=1731596563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QEUjGSpL6orxUQ+6h440g1bWRxTgIYCOricGGKyI/i0=;
  b=VM9CVAFDPNNskWVaZn1S1kfb0vuHELAlcFcTGkCYXHCs+JHxdLet0QNf
   HhPVfpwsQtEC6JGVWg10Q89Itw6nzCjb0AEGOk4o3gFAvO+RQJSGOAa9a
   z045zl06an1Vp7ojW1375Y30OCbNd9axdhQU67Yp/j36OkKvV7c2Ohljt
   cxr4gEqRt9gHAPay+5rVL6Ymuofuqd5BNgjpXEPdKmRqTJ1IXFULd5upj
   gBToKPGnXfNKrDUlDJxSj6M7w6YztwZXvTpzFJQWlRsJK94ul00NyCR9h
   7rEPS/ZY9Yh6AHhftO1qF7kG09mVS4q9jjOoAsa8mDfJRFsV7HvNU/wgZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="3970791"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="3970791"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:02:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="6195338"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Nov 2023 07:02:23 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3HPI-0000Qr-0D;
	Wed, 15 Nov 2023 15:02:20 +0000
Date: Wed, 15 Nov 2023 23:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	rafael@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, daniel.lezcano@linaro.org,
	rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] thermal: Add support for device tree thermal zones
 consumers
Message-ID: <202311152213.NNF5X5wd-lkp@intel.com>
References: <20231114131514.89031-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114131514.89031-1-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/thermal]
[also build test ERROR on linus/master v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/thermal-Add-support-for-device-tree-thermal-zones-consumers/20231114-211656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231114131514.89031-1-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH] thermal: Add support for device tree thermal zones consumers
config: arm-randconfig-004-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152213.NNF5X5wd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152213.NNF5X5wd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152213.NNF5X5wd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/power/supply/power_supply_core.o: in function `thermal_of_get_zone_by_index':
>> power_supply_core.c:(.text+0x167c): multiple definition of `thermal_of_get_zone_by_index'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5a4): first defined here
   arm-linux-gnueabi-ld: drivers/power/supply/power_supply_core.o: in function `thermal_of_get_zone':
>> power_supply_core.c:(.text+0x1684): multiple definition of `thermal_of_get_zone'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5ac): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/hwmon.o: in function `thermal_of_get_zone_by_index':
   hwmon.c:(.text+0x9cc): multiple definition of `thermal_of_get_zone_by_index'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5a4): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/hwmon.o: in function `thermal_of_get_zone':
   hwmon.c:(.text+0x9d4): multiple definition of `thermal_of_get_zone'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5ac): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/tc654.o: in function `thermal_of_get_zone_by_index':
   tc654.c:(.text+0x5c8): multiple definition of `thermal_of_get_zone_by_index'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5a4): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/tc654.o: in function `thermal_of_get_zone':
   tc654.c:(.text+0x5d0): multiple definition of `thermal_of_get_zone'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5ac): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/mlxreg-fan.o: in function `thermal_of_get_zone_by_index':
   mlxreg-fan.c:(.text+0x3f0): multiple definition of `thermal_of_get_zone_by_index'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5a4): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/mlxreg-fan.o: in function `thermal_of_get_zone':
   mlxreg-fan.c:(.text+0x3f8): multiple definition of `thermal_of_get_zone'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5ac): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/pwm-fan.o: in function `thermal_of_get_zone_by_index':
   pwm-fan.c:(.text+0x9c): multiple definition of `thermal_of_get_zone_by_index'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5a4): first defined here
   arm-linux-gnueabi-ld: drivers/hwmon/pwm-fan.o: in function `thermal_of_get_zone':
   pwm-fan.c:(.text+0xa4): multiple definition of `thermal_of_get_zone'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5ac): first defined here
   arm-linux-gnueabi-ld: drivers/cpufreq/cpufreq.o: in function `thermal_of_get_zone_by_index':
   cpufreq.c:(.text+0x1a7c): multiple definition of `thermal_of_get_zone_by_index'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5a4): first defined here
   arm-linux-gnueabi-ld: drivers/cpufreq/cpufreq.o: in function `thermal_of_get_zone':
   cpufreq.c:(.text+0x1a84): multiple definition of `thermal_of_get_zone'; drivers/soc/qcom/qcom_aoss.o:qcom_aoss.c:(.text+0x5ac): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
