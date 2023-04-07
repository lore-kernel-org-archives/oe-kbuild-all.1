Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A43F847C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680889859; x=1712425859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L31FGdUq5M3cKIkaUD6zibfML9sVlCv15gSx92+vGtY=;
  b=UO9pAtlTmtF2zz3SK0PrkOJP4X3WXXPDXYZ5dm33V3swZZu4Qli+VIbL
   oBf5NTNwnVU+2gAs26aacuIxnftgbmkD4fBTM72ds4oQGdOhUCXTiImHB
   1gOC0XquHCn0a2FXp7hLDpAeBvdfBSoW7L6ygSTgBD2AOQtB+bcq7yAgy
   9wWL3Tkl7vINgYyWDYx6lE0bB/UeCWMRhzGxs+g2HqNssreLpGes6S2mV
   uI1JP1j3pkDTwRoUvm5Bla2Tw6E3zhjG87ds8xvvUngWUoY7BquAMJYlk
   LZlpmVUVT0v05D9ZIL5b72qL41R91ECZfZv+gkhDyIbfGyWA2K70XdMXH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405859428"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="405859428"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717911678"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="717911678"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 10:50:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqEi-000SkY-3C;
	Fri, 07 Apr 2023 17:50:56 +0000
Date: Sat, 8 Apr 2023 01:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ufs: hwmon: constify pointers to hwmon_channel_info
Message-ID: <202304080101.U6AkrSrf-lkp@intel.com>
References: <20230407150137.79947-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150137.79947-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/ufs-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230407150137.79947-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] ufs: hwmon: constify pointers to hwmon_channel_info
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080101.U6AkrSrf-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7697d4619c62de396a373d422e59846af320e552
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/ufs-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231053
        git checkout 7697d4619c62de396a373d422e59846af320e552
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/ufs/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080101.U6AkrSrf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufs-hwmon.c:162:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     162 |         .info   = ufs_hwmon_info,
         |                   ^~~~~~~~~~~~~~


vim +/const +162 drivers/ufs/core/ufs-hwmon.c

e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  159  
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  160  static const struct hwmon_chip_info ufs_hwmon_hba_info = {
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  161  	.ops	= &ufs_hwmon_ops,
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15 @162  	.info	= ufs_hwmon_info,
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  163  };
e88e2d32200a17 drivers/scsi/ufs/ufs-hwmon.c Avri Altman 2021-09-15  164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
