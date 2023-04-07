Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C86FBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887344; x=1712423344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aJ/Zsu4KZeWcSJeR/qwK4HvhP/nAQWUKe9C/iCijcU0=;
  b=chweEdPuTRcgXbthkTx303jAQ0yeJ97/OmxCm/a3wJD7ZID6oGy0ZVuW
   0G2tcwq9E6oVi0JQ1gnxvGS3Kcwk534dqfFon0M2oiOkYdnf9ZMljQgnR
   MgbB+1BEPw5uu9E/GXAwFFboJm5sDglX1iWy9AHyCZHA2INksTOqMR934
   eEyu6k1xn2ya0hWBnK7rWGbvNUUrR75s36bsRRJt9tM+1+0od5zEZZVIu
   e+0PzTKlXdOFciSUT910UfalACzJK/8Jp324GtbvHeotmdQrf1pUlTtlj
   n1ul4TF8YwrxOO13qwjTLCkGb5qk2t5SpCUsfxv7zNuh+4q0nNr14gSCw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344805050"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="344805050"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637764965"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637764965"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 10:09:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpa3-000SiX-2h;
	Fri, 07 Apr 2023 17:08:55 +0000
Date: Sat, 8 Apr 2023 01:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] platform/x86: hp: constify pointers to
 hwmon_channel_info
Message-ID: <202304080033.OIsXHQG1-lkp@intel.com>
References: <20230407150339.80218-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150339.80218-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/platform-x86-hp-constify-pointers-to-hwmon_channel_info/20230407-231007
patch link:    https://lore.kernel.org/r/20230407150339.80218-2-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 2/4] platform/x86: hp: constify pointers to hwmon_channel_info
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230408/202304080033.OIsXHQG1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/79d2a873fe79e2ec72994d45476e250065845fe4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/platform-x86-hp-constify-pointers-to-hwmon_channel_info/20230407-231007
        git checkout 79d2a873fe79e2ec72994d45476e250065845fe4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/hp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080033.OIsXHQG1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/hp/hp-wmi.c:1499:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1499 |         .info = info,
         |                 ^~~~


vim +/const +1499 drivers/platform/x86/hp/hp-wmi.c

4c51ba9af42dff drivers/platform/x86/hp-wmi.c Enver Balalic 2021-09-02  1496  
4c51ba9af42dff drivers/platform/x86/hp-wmi.c Enver Balalic 2021-09-02  1497  static const struct hwmon_chip_info chip_info = {
4c51ba9af42dff drivers/platform/x86/hp-wmi.c Enver Balalic 2021-09-02  1498  	.ops = &ops,
4c51ba9af42dff drivers/platform/x86/hp-wmi.c Enver Balalic 2021-09-02 @1499  	.info = info,
4c51ba9af42dff drivers/platform/x86/hp-wmi.c Enver Balalic 2021-09-02  1500  };
4c51ba9af42dff drivers/platform/x86/hp-wmi.c Enver Balalic 2021-09-02  1501  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
