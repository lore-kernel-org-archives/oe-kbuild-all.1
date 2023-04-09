Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C2223C5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681055135; x=1712591135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+bVHxp6Kf1NnxHXI/cuczX/yIXQbQBxd1Qt7yv9Fw6k=;
  b=AsJHtCE31/BHUWZ/ilSVcDadPFtkgWc3tmZ1CwIfVwrY0wmms9lHJXKx
   N06hwhigl50CGOYo0CEodB/wWgC6gfZnedMSvhlZGA1MPuayd7a1EP5mN
   P1PEo7k8kfHP3LRKotUoXPHeGPWQChguVE8OaUsFoulRogBBECbHcsI46
   Ofs/eySYq4pb6gfEMdmfW5tZNqrvxkHenudaZ32Hz/cM8HWDvffM0swcd
   tK7R6mUT/8IWzGeY0mXnqmv89Y/LWfNCz62Xjl7CCqIb2aVVrASzNDx3o
   dEs7E7sc9cAN8Z/6096j8Fo946vA6cWPmqxsgO0Rjacp61C3MkvckqZtI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="345890793"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="345890793"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 08:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="799258046"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="799258046"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2023 08:45:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plXES-000UZx-1z;
	Sun, 09 Apr 2023 15:45:32 +0000
Date: Sun, 9 Apr 2023 23:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] media: i2c: video: constify pointers to
 hwmon_channel_info
Message-ID: <202304092352.T3BmNdHl-lkp@intel.com>
References: <20230407150015.79715-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150015.79715-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/media-i2c-video-constify-pointers-to-hwmon_channel_info/20230407-230721
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230407150015.79715-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] media: i2c: video: constify pointers to hwmon_channel_info
config: s390-randconfig-s051-20230409 (https://download.01.org/0day-ci/archive/20230409/202304092352.T3BmNdHl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/a9135e120b356553564ba1046e7752e4f9008666
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/media-i2c-video-constify-pointers-to-hwmon_channel_info/20230407-230721
        git checkout a9135e120b356553564ba1046e7752e4f9008666
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304092352.T3BmNdHl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/video-i2c.c:328:17: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct hwmon_channel_info const **info @@     got struct hwmon_channel_info const *const * @@
   drivers/media/i2c/video-i2c.c:328:17: sparse:     expected struct hwmon_channel_info const **info
   drivers/media/i2c/video-i2c.c:328:17: sparse:     got struct hwmon_channel_info const *const *

vim +328 drivers/media/i2c/video-i2c.c

acbea6798955e9 Matt Ranostay 2018-06-28  325  
acbea6798955e9 Matt Ranostay 2018-06-28  326  static const struct hwmon_chip_info amg88xx_chip_info = {
acbea6798955e9 Matt Ranostay 2018-06-28  327  	.ops = &amg88xx_hwmon_ops,
acbea6798955e9 Matt Ranostay 2018-06-28 @328  	.info = amg88xx_info,
acbea6798955e9 Matt Ranostay 2018-06-28  329  };
acbea6798955e9 Matt Ranostay 2018-06-28  330  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
