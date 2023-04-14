Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACA7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681471709; x=1713007709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4ZUTjtv6GAgrkBy9HgIlEhH9rxLwVT9WpBYyCNBoW8=;
  b=fGcNatM8nZ+n8n0YQ/IinO5gUHaZmTkRb2Nz1T1LGYT52ZMk5lwhjpM5
   WZzJSkp8b4fjcUZz14jX8uJiBvMQwslQH1JjTcHITeHNw5hszv4ebAvhE
   hTy932XuWheTKIZ8JpHgcrTWTKXtmbL1cdo7QWN/kCSnH0E0u6oARphQB
   sFIVWnHr1ssOrA9Lj5hKr/Q/AEFQafmx2M4n1regswWWJrZHOvi/et4j5
   vMlc60keqe7LWvQkQPeN1pj7+sS9NuwjS84XPvMYc/kIKRBymyyyxFn8Y
   ckgp9F0x6t8nH5GuslpxTjsNOTacyV5Su2635YkO5HM1bDzqDMQK2KrlP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333214727"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="333214727"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 04:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="720262079"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="720262079"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Apr 2023 04:28:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnHbO-000ZUF-2c;
	Fri, 14 Apr 2023 11:28:26 +0000
Date: Fri, 14 Apr 2023 19:28:11 +0800
From: kernel test robot <lkp@intel.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 15/78] drivers/mfd/qcom-pm8008.c:143:35:
 error: initialization of 'int (*)(unsigned int **, unsigned int,  const
 struct regmap_irq *, int)' from incompatible pointer type 'int (*)(unsigned
 int **, unsigned int,  const struct regmap_irq *, int,  void *)'
Message-ID: <202304141926.cSoD7Vgw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   9d8d0d98885abba451d7ffc4885236d14ead3c9a
commit: 540eee4708487d16d7f9d1ddadd679ce3e0b9d69 [15/78] mfd: qcom-pm8008: Convert irq chip to config regs
config: arc-randconfig-r043-20230412 (https://download.01.org/0day-ci/archive/20230414/202304141926.cSoD7Vgw-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=540eee4708487d16d7f9d1ddadd679ce3e0b9d69
        git remote add lee-mfd https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
        git fetch --no-tags lee-mfd for-mfd-next
        git checkout 540eee4708487d16d7f9d1ddadd679ce3e0b9d69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/mfd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141926.cSoD7Vgw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/qcom-pm8008.c:143:35: error: initialization of 'int (*)(unsigned int **, unsigned int,  const struct regmap_irq *, int)' from incompatible pointer type 'int (*)(unsigned int **, unsigned int,  const struct regmap_irq *, int,  void *)' [-Werror=incompatible-pointer-types]
     143 |         .set_type_config        = pm8008_set_type_config,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/qcom-pm8008.c:143:35: note: (near initialization for 'pm8008_irq_chip.set_type_config')
   cc1: some warnings being treated as errors


vim +143 drivers/mfd/qcom-pm8008.c

   125	
   126	static struct regmap_irq_chip pm8008_irq_chip = {
   127		.name			= "pm8008_irq",
   128		.main_status		= I2C_INTR_STATUS_BASE,
   129		.num_main_regs		= 1,
   130		.irqs			= pm8008_irqs,
   131		.num_irqs		= ARRAY_SIZE(pm8008_irqs),
   132		.num_regs		= PM8008_NUM_PERIPHS,
   133		.not_fixed_stride	= true,
   134		.sub_reg_offsets	= pm8008_sub_reg_offsets,
   135		.status_base		= PM8008_STATUS_BASE,
   136		.mask_base		= PM8008_MASK_BASE,
   137		.unmask_base		= PM8008_UNMASK_BASE,
   138		.mask_unmask_non_inverted = true,
   139		.ack_base		= PM8008_ACK_BASE,
   140		.config_base		= pm8008_config_regs,
   141		.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
   142		.num_config_regs	= PM8008_NUM_PERIPHS,
 > 143		.set_type_config	= pm8008_set_type_config,
   144	};
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
