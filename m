Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3161A29CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681296252; x=1712832252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eKbMz+oYJIb6E8WiHPnxHGViXzZQFTByp7wBiU+1S08=;
  b=M57tJs9sj/GXBz7RQ8dwyLZIPVQB2LIhgN8HQygKObW3m32yZEyKwJXj
   LlYHlRRRCI3ZIbI3CKWP+0JI9loS71vvt1VkmhMNMXE1Sn2+rcww6PdXr
   jLsdJpRsZxskuMenhPGS4NqOeEQxi41qYb0xnSkMDBZxkxE2Zm+VUhf0k
   sJDG69eZ55Vufu5kUrEBS1Z3CdAterYaM+63irv+BwFssJ4kUDDwJzxXT
   nUYjywmVt2QZYT+hdOye3wu/4R+HLPSrT8pjMWqHRkSi9sgE5xe4GsaLQ
   zu45jJGvq+OLStV3DTItdm9Qz1GiFvYwwyFRhxAByIyOSaTAo00oqMWLI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="345650671"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="345650671"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 03:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="863257650"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863257650"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 03:44:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmXxO-000Xdf-0f;
	Wed, 12 Apr 2023 10:44:06 +0000
Date: Wed, 12 Apr 2023 18:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.1 58/133] aarch64-linux-ld: aspeed-sbc.c:undefined
 reference to `arch_debugfs_dir'
Message-ID: <202304121809.iuNMbCX0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.1
head:   05d1a5ffc3570dce4f7497aefcbaea0bbb1d79df
commit: 3fe223630c750ba63727f653033b128d6ad0f4b7 [58/133] ARM: soc: aspeed: Add secure boot controller support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304121809.iuNMbCX0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/shenki/linux/commit/3fe223630c750ba63727f653033b128d6ad0f4b7
        git remote add shenki https://github.com/shenki/linux
        git fetch --no-tags shenki dev-6.1
        git checkout 3fe223630c750ba63727f653033b128d6ad0f4b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121809.iuNMbCX0-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: in function `aspeed_sbc_init':
   aspeed-sbc.c:(.init.text+0x264): undefined reference to `arch_debugfs_dir'
   aarch64-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `arch_debugfs_dir' which may bind externally can not be used when making a shared object; recompile with -fPIC
   aspeed-sbc.c:(.init.text+0x264): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: aspeed-sbc.c:(.init.text+0x26c): undefined reference to `arch_debugfs_dir'
   aarch64-linux-ld: aspeed-sbc.c:(.init.text+0x274): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
