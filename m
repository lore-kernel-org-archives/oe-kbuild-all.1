Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AC6FBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680888010; x=1712424010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4VH+VRcdW8+90cnd2MT7OJdabObOUnqRFQczAgyOP90=;
  b=mHNiUXoN2/vN9iOl6QPzZQGTTq7gZj6C8VgDQA/CUyDkJlxVtDn21X0P
   nS3FwrEPbmQYH86EKRA4RRVBUrEfjALcMqGNt53ZtKa2fFeD8KMQ+yZG6
   RyB3rZbIPNWM7EvdO1fZWZUfpEDD74CswOE7BQrk+Q56JMIY/VdvJWAlH
   XZJpOkxaDCf408twVqwwfltpbYbSU6VQQwxooCdY9WE1x4fXT2OsKHlsE
   wKPDb4HWim9YIVTsQmnY5FxgmXAFZaq1fWVNAXOf6K5wfWxr2kSl6lI+j
   WZNXuTiRfjLVV3pT5BX8+yfhxPla2JWgV96RNLI2xO15A8xf/p7XX+WiM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="323403613"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="323403613"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717903846"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="717903846"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 10:19:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpki-000SjC-0q;
	Fri, 07 Apr 2023 17:19:56 +0000
Date: Sat, 8 Apr 2023 01:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] power: supply: hwmon: constify pointers to
 hwmon_channel_info
Message-ID: <202304080128.dlkdpYww-lkp@intel.com>
References: <20230407150326.80183-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150326.80183-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/power-supply-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20230407150326.80183-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] power: supply: hwmon: constify pointers to hwmon_channel_info
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080128.dlkdpYww-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/54a815cb7128a140e1a6e18ef6bbafa22b98aadf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/power-supply-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231258
        git checkout 54a815cb7128a140e1a6e18ef6bbafa22b98aadf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080128.dlkdpYww-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/power_supply_hwmon.c:324:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     324 |         .info = power_supply_hwmon_info,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +/const +324 drivers/power/supply/power_supply_hwmon.c

e67d4dfc9ff19d Andrey Smirnov 2019-06-12  321  
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  322  static const struct hwmon_chip_info power_supply_hwmon_chip_info = {
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  323  	.ops = &power_supply_hwmon_ops,
e67d4dfc9ff19d Andrey Smirnov 2019-06-12 @324  	.info = power_supply_hwmon_info,
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  325  };
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  326  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
