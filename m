Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84B747D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685368140; x=1716904140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89Ky3bZkRwOCzd1E2A+yx3+uFDpD7Qp4gcR0Z7h4aR8=;
  b=Swqiwk12kb6jgyISWen2lKNyHQEUe3S57W884mWIpYq+DH+km4Ax+Bqd
   zv+LTuy1S4siSAW+OaKws0SYSxd7Y0rRq7R0qF1zdJNcUXUPQ+hQ/QVM5
   i6b/07ceqR9du1Sq9P2dQtMSrEsO181RiNb2vribYRpZxPXXVJG1zZXOb
   iBGTxDUal/9lhVxcej0GjbDamSfa6VBSDIPL079k0PxRWH8GvJgLTDyoY
   lwX49E1D36ikVZQNOO2HZs+ZAXPRgWJ8+jK4DMVi7oT2a3vqWG/5HOw18
   r4BRKqmuVTRBpLacPfdtL0CfEUz+D6ouNnvTBCPeDyfC7O9oHhCR+yVGk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357086203"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="357086203"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 06:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="795943904"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="795943904"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 May 2023 06:48:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3dEU-000L0e-38;
	Mon, 29 May 2023 13:48:22 +0000
Date: Mon, 29 May 2023 21:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 1/11] drivers/pci/pcie/aer.c:622:12: error: initializing
 'struct attribute **' with an expression of type 'const struct attribute
 *[7]' discards qualifiers in nested pointer types
Message-ID: <202305292125.vgzGO2KD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   c81db35145ac2ec46628bbddefee2b381bdd1c6d
commit: 0f8fb4dff0ef5ef8fd9ac84330d682ab9804d4f8 [1/11] PCI: Constify sysfs attribute groups
config: i386-randconfig-i006-20230529 (https://download.01.org/0day-ci/archive/20230529/202305292125.vgzGO2KD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/0f8fb4dff0ef5ef8fd9ac84330d682ab9804d4f8
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 0f8fb4dff0ef5ef8fd9ac84330d682ab9804d4f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305292125.vgzGO2KD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pcie/aer.c:622:12: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *[7]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .attrs  = aer_stats_attrs,
                     ^~~~~~~~~~~~~~~
   1 error generated.


vim +622 drivers/pci/pcie/aer.c

81aa5206f9a7c9 Rajat Jain 2018-06-21  620  
81aa5206f9a7c9 Rajat Jain 2018-06-21  621  const struct attribute_group aer_stats_attr_group = {
81aa5206f9a7c9 Rajat Jain 2018-06-21 @622  	.attrs  = aer_stats_attrs,
81aa5206f9a7c9 Rajat Jain 2018-06-21  623  	.is_visible = aer_stats_attrs_are_visible,
81aa5206f9a7c9 Rajat Jain 2018-06-21  624  };
81aa5206f9a7c9 Rajat Jain 2018-06-21  625  

:::::: The code at line 622 was first introduced by commit
:::::: 81aa5206f9a7c9793e2f7971400351664e40b04f PCI/AER: Add sysfs attributes to provide AER stats and breakdown

:::::: TO: Rajat Jain <rajatja@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
