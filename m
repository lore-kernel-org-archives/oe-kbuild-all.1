Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF2A54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 05:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678425118; x=1709961118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=noDPSzkrbIVRmf73+0OTg5GszDAlUz5733GqCCRBmYM=;
  b=cEbdzd3yqLOleZzGPYopXVDk9NEK5yVYr9A0e2gsyhyzt/ABEBYTDXvP
   tOStE8GISJzC1qjuTuVQ7F5rfqoFlE1C3vldKsxq0BDdQJi9DdbmHWjZH
   SCB4/okdcax2t0Fynw1R7mfeWwNLYF6YgXMxwaZpFPQcBxepAJsC5503G
   QqcIkEFYsEinaB/S9hA/NtjlHpT/dAku4dsephw8caBI7/GhMObBfowu5
   yH4RSFRlJ/ZVNTFpH+9gH1rsDhVfU+SOiXPd5PsUFCaquIYQEJ22b0f6d
   cBrTdyjoH+NonY2W1Ej9+PwcYgb+S0cowl/p18Fw08FMxqdxdAFH176qH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="336667025"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="336667025"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 21:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="680091881"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="680091881"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 21:11:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paV2o-0003Wd-00;
	Fri, 10 Mar 2023 05:11:54 +0000
Date: Fri, 10 Mar 2023 13:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv1 02/11] power: supply: core: auto-exposure of
 simple-battery data
Message-ID: <202303101236.fqHwh3Tt-lkp@intel.com>
References: <20230309225041.477440-3-sre@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309225041.477440-3-sre@kernel.org>

Hi Sebastian,

I love your patch! Yet something to improve:

[auto build test ERROR on sre-power-supply/for-next]
[also build test ERROR on robh/for-next linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/dt-bindings-power-supply-adc-battery-add-binding/20230310-065229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20230309225041.477440-3-sre%40kernel.org
patch subject: [PATCHv1 02/11] power: supply: core: auto-exposure of simple-battery data
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230310/202303101236.fqHwh3Tt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/83ec4c841d68a66bc95f5e534a805e765785f934
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sebastian-Reichel/dt-bindings-power-supply-adc-battery-add-binding/20230310-065229
        git checkout 83ec4c841d68a66bc95f5e534a805e765785f934
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101236.fqHwh3Tt-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "power_supply_get_property" [drivers/phy/ti/phy-tusb1210.ko] undefined!
>> ERROR: modpost: "power_supply_get_property" [drivers/power/supply/88pm860x_charger.ko] undefined!
>> ERROR: modpost: "power_supply_get_property" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
