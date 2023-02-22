Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BBA2904
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 11:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677064332; x=1708600332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+uBBCEvBWxkjqWlqYV+g3FU1r3OSrWUKYN9K3U8pCPU=;
  b=lWsVUKX7AS5fNgbkjoIM9tNqZy50wyvRvWAqsUpMZv02shFZlhsIBJ/i
   lWjRosLTodnvPSgnp+SnqE64yEGHo2cSOUgJZ/C2r8voU277OKNVL06OP
   BoS9ZV6mvvq4KAncmS7DYg9ecDRvozFGJdYv8uYV8V0NN6853Jbn70mCE
   S7lXhuk+MZZnRdjD6dKsQ0uzjQ4Y00gosreZVCnWFVN6aA6D0Xq0XHh2b
   Y1eldJOaXzvsGLcNiLyjewJdRFbgN+Rk+93QwWfSdwMtA7tSLCKpo9EGx
   SfxE5MkHak07mSTSRUKg+iPH1F5HpjS1BJwBu9ZRqdxn4Xq77dt2wTrdl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330623505"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="330623505"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 03:12:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760921984"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="760921984"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 03:12:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUn2g-0000I1-0e;
	Wed, 22 Feb 2023 11:12:10 +0000
Date: Wed, 22 Feb 2023 19:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 65/92] pinctrl-npcm8xx.c:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202302221921.Jbhb4JjR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   cac6306557586ba4479dab12c3e5efcb67e63388
commit: f11b240864d1eb9dfac9cd9bf59389f118d3e406 [65/92] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
config: ia64-randconfig-r016-20230222 (https://download.01.org/0day-ci/archive/20230222/202302221921.Jbhb4JjR-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/f11b240864d1eb9dfac9cd9bf59389f118d3e406
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout f11b240864d1eb9dfac9cd9bf59389f118d3e406
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221921.Jbhb4JjR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/pinctrl/nuvoton/pinctrl-npcm8xx.o: in function `npcm8xx_dt_node_to_map':
>> pinctrl-npcm8xx.c:(.text+0xb02): undefined reference to `pinconf_generic_dt_node_to_map'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
