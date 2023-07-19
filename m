Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FFC2E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689755211; x=1721291211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r20dsIIyaFCD5jJ6rHGIoI8LkPWPT4immuJ0KRgUY9I=;
  b=mEAfrDImINnMZJy11uvpxBiFWERm8mCftGuYEkhcHwj7rKh6q7yFlpG8
   MVmhgSkyrJYOSZtiFXtYsZwQ1xwf3jl7GHVmenmM1d6fx5Qc496MINeU0
   C+wg3PwD4cBdn6DPn10N0zmAKF7DU+ntJScDVNkYuB6JAyVcYFi7P+Aor
   QldL+n1Kh8dZ8wJHbiBZYQfl/v2ESTZ4zi+SXIno/ng7dMqQhEH9NMtmw
   o3OGOxMqfUJ1Vw/kQYDLhoNRnTFwwSc+XQeJ1L8PWikvKtT51UIhivPxG
   G/l6b3GqNs/GjNUgnfeYHIWjtqF4BnBpm6ahwH6CchS07B5eYg787D0R6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346707586"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346707586"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 01:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="897836928"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="897836928"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 01:26:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM2WB-0004Kn-2K;
	Wed, 19 Jul 2023 08:26:48 +0000
Date: Wed, 19 Jul 2023 16:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 3816/12467]
 drivers/spi/spi-nxp-fspi.c:1340:12: error: use of undeclared identifier
 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
Message-ID: <202307191637.jQ5lUuZ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haibo,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   791ee62ff569635e685d84c09b2179f002c4e0bf
commit: e0b338dc8b0a33b70718899aa798738d157d0259 [3816/12467] spi: spi-nxp-fspi: enable runtime pm for fspi
config: i386-randconfig-i013-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191637.jQ5lUuZ5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191637.jQ5lUuZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191637.jQ5lUuZ5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-nxp-fspi.c:1340:12: error: use of undeclared identifier 'nxp_fspi_pm_ops'; did you mean 'nxp_fspi_mem_ops'?
                   .pm =   &nxp_fspi_pm_ops,
                            ^~~~~~~~~~~~~~~
                            nxp_fspi_mem_ops
   drivers/spi/spi-nxp-fspi.c:1086:44: note: 'nxp_fspi_mem_ops' declared here
   static const struct spi_controller_mem_ops nxp_fspi_mem_ops = {
                                              ^
>> drivers/spi/spi-nxp-fspi.c:1340:11: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'const struct spi_controller_mem_ops *' [-Werror,-Wincompatible-pointer-types]
                   .pm =   &nxp_fspi_pm_ops,
                           ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +1340 drivers/spi/spi-nxp-fspi.c

55ab8487e01d184 kuldip dwivedi      2020-09-11  1334  
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1335  static struct platform_driver nxp_fspi_driver = {
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1336  	.driver = {
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1337  		.name	= "nxp-fspi",
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1338  		.of_match_table = nxp_fspi_dt_ids,
55ab8487e01d184 kuldip dwivedi      2020-09-11  1339  		.acpi_match_table = ACPI_PTR(nxp_fspi_acpi_ids),
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15 @1340  		.pm =   &nxp_fspi_pm_ops,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1341  	},
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1342  	.probe          = nxp_fspi_probe,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1343  	.remove		= nxp_fspi_remove,
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1344  };
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1345  module_platform_driver(nxp_fspi_driver);
a5356aef6a907c2 Yogesh Narayan Gaur 2019-01-15  1346  

:::::: The code at line 1340 was first introduced by commit
:::::: a5356aef6a907c2e2aed0caaa2b88b6021394471 spi: spi-mem: Add driver for NXP FlexSPI controller

:::::: TO: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
