Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184A423D1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682591181; x=1714127181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8rJ4Cx9pOXUvun8klbybruKJt49+/+DPiUhj+Vxft74=;
  b=Mm/BdSsonY/vggxj20JFFwlTANHMYWkZMsVxra8Vlur7M8F3jmIx9TAT
   EAYFG02UEYaL+Bla1fpHxlOFd5AgWlbgEPuvRTqVxri+2+MmGF03rj56r
   YBFW5Sw1aDskz5KTlJqYgSJ7y749RzdkSEe2O9rxa24JE82+Am9xprxq1
   cQvzsmqOhAKufrjLeorkV4nP04qTQ0vanrRoLh0cak242f9x7XDgaA9IV
   +6I1BYAy0+nErh6UEvoelqzp2lY26cXdvwZwMDRPJTSXytg1FEldG3UqQ
   9i+u+66GX3wxza2skZKVwvqxtaV0CA4qhF7c0CU7GAInMG3seABoPEcJM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="433679830"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="433679830"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 03:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763737184"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="763737184"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2023 03:26:19 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prypO-0000Af-2q;
	Thu, 27 Apr 2023 10:26:18 +0000
Date: Thu, 27 Apr 2023 18:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 54/56] drivers/regulator/max8660.c:310:34:
 warning: 'max8660_dt_ids' defined but not used
Message-ID: <202304271847.Y0N4jkd6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   4cc2262d09430892703b2d82d4a48f65679a8b53
commit: 2a4525d954c68bb3e0a5d992c7a87f23aa510b6c [54/56] Use of_device_get_match_data
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230427/202304271847.Y0N4jkd6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=2a4525d954c68bb3e0a5d992c7a87f23aa510b6c
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 2a4525d954c68bb3e0a5d992c7a87f23aa510b6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/power/supply/ drivers/regulator/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271847.Y0N4jkd6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/max8660.c:310:34: warning: 'max8660_dt_ids' defined but not used [-Wunused-const-variable=]
     310 | static const struct of_device_id max8660_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~


vim +/max8660_dt_ids +310 drivers/regulator/max8660.c

4a678f037475ed Daniel Mack 2013-08-02  308  
abe4c51afda024 Daniel Mack 2013-08-02  309  #ifdef CONFIG_OF
abe4c51afda024 Daniel Mack 2013-08-02 @310  static const struct of_device_id max8660_dt_ids[] = {
abe4c51afda024 Daniel Mack 2013-08-02  311  	{ .compatible = "maxim,max8660", .data = (void *) MAX8660 },
abe4c51afda024 Daniel Mack 2013-08-02  312  	{ .compatible = "maxim,max8661", .data = (void *) MAX8661 },
abe4c51afda024 Daniel Mack 2013-08-02  313  	{ }
abe4c51afda024 Daniel Mack 2013-08-02  314  };
abe4c51afda024 Daniel Mack 2013-08-02  315  MODULE_DEVICE_TABLE(of, max8660_dt_ids);
abe4c51afda024 Daniel Mack 2013-08-02  316  

:::::: The code at line 310 was first introduced by commit
:::::: abe4c51afda02423c81da6f1eaaa50b733f1ecc2 regulators: max8660: add DT bindings

:::::: TO: Daniel Mack <zonque@gmail.com>
:::::: CC: Mark Brown <broonie@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
