Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EF18825
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680891785; x=1712427785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/rtk2Woo5jLpAMdSIpqCOJL1Mh7bvXEEkbaKF8TbGjs=;
  b=jVTNSDpmsHdB7Hcelz1xOWUnFbTOHhf3s4JXFnxF5zad3dTt3KtzKkRm
   FK4j+Sfkiz9//qOUKascXTzzfgUVToxOtWcfObryDLXaF41ImT3D2Bn4Z
   Uqw5XlCg6VIl1RbweuHHBfBK4Q6lp+oNQErulNkK324Jti6nJNgnYSzx9
   6M/uqpdDIpS4o7vTczIFRb3qfnQOzfPIy7CoHzbOEkwpMxJD/c81bofXA
   VhP0w/Ua4LZqlt6l+bMtLU1AuQYN7umH4vEF56by26uKgifdTqZi3PDB9
   JtfjisSBHxXYytsD6UomIQyBlsMuXuZYmijRNChjODYp9jCVP2e5bEa+Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="343050175"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="343050175"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="776915019"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="776915019"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2023 11:23:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqji-000SmW-0I;
	Fri, 07 Apr 2023 18:22:58 +0000
Date: Sat, 8 Apr 2023 02:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] rtc: ab-eoz9: constify pointers to hwmon_channel_info
Message-ID: <202304080217.jll816za-lkp@intel.com>
References: <20230407150306.80141-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150306.80141-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/rtc-ds3232-constify-pointers-to-hwmon_channel_info/20230407-231346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20230407150306.80141-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 1/4] rtc: ab-eoz9: constify pointers to hwmon_channel_info
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080217.jll816za-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2b39e4ff9f9bbc04c31fa2819e09754ca5001669
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/rtc-ds3232-constify-pointers-to-hwmon_channel_info/20230407-231346
        git checkout 2b39e4ff9f9bbc04c31fa2819e09754ca5001669
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080217.jll816za-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-ab-eoz9.c:471:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     471 |         .info = abeoz9_info,
         |                 ^~~~~~~~~~~


vim +/const +471 drivers/rtc/rtc-ab-eoz9.c

67075b63cce26c Artem Panfilov 2019-02-17  468  
67075b63cce26c Artem Panfilov 2019-02-17  469  static const struct hwmon_chip_info abeoz9_chip_info = {
67075b63cce26c Artem Panfilov 2019-02-17  470  	.ops = &abeoz9_hwmon_ops,
67075b63cce26c Artem Panfilov 2019-02-17 @471  	.info = abeoz9_info,
67075b63cce26c Artem Panfilov 2019-02-17  472  };
67075b63cce26c Artem Panfilov 2019-02-17  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
