Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2ABAD22
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680894303; x=1712430303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=heG4bfCv2FvajNPGl7vEhGlkrBJBQJaOi56IOUF1Yo8=;
  b=QLxshMEgHgMba2CijH8WXARILj58I20871l9fJkWb9hoA7sKThOYphYY
   K9ETU4HnS1yJSIBNUXEKVep8ntl+YsQYCPyaAt22dGLYVWfdYBa/hCLqf
   GndsZiCp8IjT0/G9++adkFbs8F6bImtH6uWDegM6sXc9wJaifmCUk+vO/
   PItqjTZTFM7G2xoAmoLZnuC67L1c/DUZYu6JLaiZ6+3mjxTT5JRkCavqf
   jl1dNFvWq6flPJgC1rAKcqgxEQiiUqa+KIdMa1Z45fIq6M9ZFyIwNotbI
   4XnEiNaigVs0VkOhHu0XprK8SFstejE0EDA8q4vbvSfPo431yrV6JTmMw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="429337038"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="429337038"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 12:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="752123712"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="752123712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2023 12:05:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkrOP-000So6-2i;
	Fri, 07 Apr 2023 19:05:01 +0000
Date: Sat, 8 Apr 2023 03:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/i915: constify pointers to hwmon_channel_info
Message-ID: <202304080312.K2F23gGg-lkp@intel.com>
References: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/drm-nouveau-constify-pointers-to-hwmon_channel_info/20230407-230201
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230407150031.79749-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 1/2] drm/i915: constify pointers to hwmon_channel_info
config: x86_64-randconfig-a012-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080312.K2F23gGg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/fc5ea3eef62b29fa9968510db0401656ebce03cc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/drm-nouveau-constify-pointers-to-hwmon_channel_info/20230407-230201
        git checkout fc5ea3eef62b29fa9968510db0401656ebce03cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080312.K2F23gGg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_hwmon.c:617:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     617 |         .info = hwm_info,
         |                 ^~~~~~~~
   drivers/gpu/drm/i915/i915_hwmon.c:655:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     655 |         .info = hwm_gt_info,
         |                 ^~~~~~~~~~~


vim +/const +617 drivers/gpu/drm/i915/i915_hwmon.c

b3b088e28183b8 Dale B Stimson 2022-10-13  614  
b3b088e28183b8 Dale B Stimson 2022-10-13  615  static const struct hwmon_chip_info hwm_chip_info = {
b3b088e28183b8 Dale B Stimson 2022-10-13  616  	.ops = &hwm_ops,
b3b088e28183b8 Dale B Stimson 2022-10-13 @617  	.info = hwm_info,
b3b088e28183b8 Dale B Stimson 2022-10-13  618  };
b3b088e28183b8 Dale B Stimson 2022-10-13  619  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
