Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06E16FBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680887342; x=1712423342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XiicWjBypl5NSfrpPh5dKrg3U5rNKNBosZjcfBeWGfQ=;
  b=Nu0RWJYfr99jAPSsauS3FXi9dEAq6S3eAQCxtNYGj2pXvl6WgwRoQ2ms
   WgQohuI6ZSobn5Ujy6ZD+AaUnb9IuySOPDd3D32HpN/bEVmqUsR6THu+z
   l9pU0Y0ulTFhct5AXjGn5LPqu+fg5rlHzxAQBbCVAIedmDaCp/6xz1Twn
   PQX7+2NgPD6RRJWVawDmWnCuVKScWZu+StrVDICck/51V/MKr3zQw97Nb
   90Fqi39zWa/HvKq7qVsjw7xpEIB9i1XEG6yKV+yFGHcVmZKyTEv8bOnUW
   FkZM2QA8sRBMCQpq8llypeTLzqxPLWdTwR5g9x809KgIY5YJ0J9yWR8j9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344805047"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="344805047"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637764964"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637764964"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 10:09:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpa3-000SiZ-2k;
	Fri, 07 Apr 2023 17:08:55 +0000
Date: Sat, 8 Apr 2023 01:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] platform/x86: gigabyte: constify pointers to
 hwmon_channel_info
Message-ID: <202304080039.wtlakQPe-lkp@intel.com>
References: <20230407150339.80218-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407150339.80218-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/platform-x86-hp-constify-pointers-to-hwmon_channel_info/20230407-231007
patch link:    https://lore.kernel.org/r/20230407150339.80218-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 1/4] platform/x86: gigabyte: constify pointers to hwmon_channel_info
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080039.wtlakQPe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/209f997979c055ef9e658d2c0198b33e8d2e9f94
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/platform-x86-hp-constify-pointers-to-hwmon_channel_info/20230407-231007
        git checkout 209f997979c055ef9e658d2c0198b33e8d2e9f94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080039.wtlakQPe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/gigabyte-wmi.c:120:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     120 |         .info = gigabyte_wmi_hwmon_info,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +/const +120 drivers/platform/x86/gigabyte-wmi.c

572931972cb56f Thomas Weiﬂschuh 2021-04-12  117  
572931972cb56f Thomas Weiﬂschuh 2021-04-12  118  static const struct hwmon_chip_info gigabyte_wmi_hwmon_chip_info = {
572931972cb56f Thomas Weiﬂschuh 2021-04-12  119  	.ops = &gigabyte_wmi_hwmon_ops,
572931972cb56f Thomas Weiﬂschuh 2021-04-12 @120  	.info = gigabyte_wmi_hwmon_info,
572931972cb56f Thomas Weiﬂschuh 2021-04-12  121  };
572931972cb56f Thomas Weiﬂschuh 2021-04-12  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
