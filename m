Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175C848E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 18:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680891785; x=1712427785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ImW8zqS8imyyzMlsaFPlGW+f9QvzX3V1FzovIvEkv1w=;
  b=P40mRb9cIF2u3Hxk0udIOUHQE1bdbfQUxTSh4HB5gg/+5dIhzXBtXAuF
   1tdC/WAnPqMhWDRi48AuK8WnpofIHxbGt0PNbYdUXaceOjclus5j4YwOq
   3HmkVaFTRda+cf/g8k8ytuAG2GOzfv1wxjGnwWZ46vNm8LTeLHxfeL5Ka
   FsdYOq+9571Y+1i6B6PD67HRTyoWD40gBNE6MeSGp3NbQ1aMn5pDs9eNF
   CkCRfqMHh6a6jgWWLfEE91N0r1m4fjssYtAOdr6sOCRzUahcmQhuLRDyl
   uEWeEbQ/sEcEdaiVAGEs7g0yyqW61Gmv2/lCll+gMISzT10/ZKHjpcvXU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="343050173"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="343050173"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="756803346"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="756803346"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Apr 2023 11:23:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqji-000Sma-0O;
	Fri, 07 Apr 2023 18:22:58 +0000
Date: Sat, 8 Apr 2023 02:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] drm/nouveau: constify pointers to hwmon_channel_info
Message-ID: <202304080218.aBY9i9gk-lkp@intel.com>
References: <20230407150031.79749-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150031.79749-2-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/drm-nouveau-constify-pointers-to-hwmon_channel_info/20230407-230201
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230407150031.79749-2-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 2/2] drm/nouveau: constify pointers to hwmon_channel_info
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080218.aBY9i9gk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/277cad3231afacf354d188d998acac86f0b645b8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/drm-nouveau-constify-pointers-to-hwmon_channel_info/20230407-230201
        git checkout 277cad3231afacf354d188d998acac86f0b645b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080218.aBY9i9gk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_hwmon.c:658:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     658 |         .info = nouveau_info,
         |                 ^~~~~~~~~~~~


vim +/const +658 drivers/gpu/drm/nouveau/nouveau_hwmon.c

dbddaaf083e255 drivers/gpu/drm/nouveau/nouveau_hwmon.c Oscar Salvador 2017-05-18  655  
dbddaaf083e255 drivers/gpu/drm/nouveau/nouveau_hwmon.c Oscar Salvador 2017-05-18  656  static const struct hwmon_chip_info nouveau_chip_info = {
dbddaaf083e255 drivers/gpu/drm/nouveau/nouveau_hwmon.c Oscar Salvador 2017-05-18  657  	.ops = &nouveau_hwmon_ops,
dbddaaf083e255 drivers/gpu/drm/nouveau/nouveau_hwmon.c Oscar Salvador 2017-05-18 @658  	.info = nouveau_info,
dbddaaf083e255 drivers/gpu/drm/nouveau/nouveau_hwmon.c Oscar Salvador 2017-05-18  659  };
b54262f3c828ee drivers/gpu/drm/nouveau/nouveau_pm.c    Martin Peres   2010-10-26  660  #endif
34e9d85a1aae28 drivers/gpu/drm/nouveau/nouveau_pm.c    Martin Peres   2010-09-22  661  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
