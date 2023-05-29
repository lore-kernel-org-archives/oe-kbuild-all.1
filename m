Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4B0747D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685368142; x=1716904142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDf/Co24ZWP6LKowoI0z4f/fIzjHksPcxU2zpaqZH4w=;
  b=Ty0ilnR5IsVmVSKgdxyIlb2jJnu5U+2bhkNfOjLsIvberIjfjCLYVLHI
   VgVDkaU/9rDfHZNM5i0HLFOWVKUBcghGh/+bUqRie+MZE7wtI51ZNXv+E
   7idkn4nFjN/UhMC80/tTui2ZvJSB0CClZvbtIVNE53ACJJRWF26ymqK/9
   mjBQOOYLbP4me1Vdz8FkxsyDXcJaCelD7AxgRnFN/VQL1dNY0r/Tdbc27
   Y4gtjhfJ32iPlscdLauvuiSfhuuaIOtpbg1GlV24Q7+x3T+qIyFsJoTo6
   ECTrRBiBf1WNAsWyRlU6+uPh5LySUD8TNZyNi43ETS3wTpMmFVY7uARF9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357086206"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="357086206"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 06:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="795943903"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="795943903"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 May 2023 06:48:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3dEU-000L0c-2s;
	Mon, 29 May 2023 13:48:22 +0000
Date: Mon, 29 May 2023 21:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 1/11] drivers/pci/iov.c:285:11: error: initializing 'struct
 attribute **' with an expression of type 'const struct attribute *[2]'
 discards qualifiers in nested pointer types
Message-ID: <202305292108.fHEAjPGs-lkp@intel.com>
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
config: i386-randconfig-i004-20230529 (https://download.01.org/0day-ci/archive/20230529/202305292108.fHEAjPGs-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305292108.fHEAjPGs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/iov.c:285:11: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *[2]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .attrs = sriov_vf_dev_attrs,
                    ^~~~~~~~~~~~~~~~~~
   drivers/pci/iov.c:563:11: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *[8]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .attrs = sriov_pf_dev_attrs,
                    ^~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/pci/switch/switchtec.c:463:1: error: initializing 'struct attribute **' with an expression of type 'const struct attribute *[11]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
   ATTRIBUTE_GROUPS(switchtec_device);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:161:11: note: expanded from macro 'ATTRIBUTE_GROUPS'
           .attrs = _name##_attrs,                                 \
                    ^~~~~~~~~~~~~
   <scratch space>:45:1: note: expanded from here
   switchtec_device_attrs
   ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +285 drivers/pci/iov.c

c3d5c2d96d69f2 Leon Romanovsky 2021-04-04  283  
c3d5c2d96d69f2 Leon Romanovsky 2021-04-04  284  const struct attribute_group sriov_vf_dev_attr_group = {
c3d5c2d96d69f2 Leon Romanovsky 2021-04-04 @285  	.attrs = sriov_vf_dev_attrs,
c3d5c2d96d69f2 Leon Romanovsky 2021-04-04  286  	.is_visible = sriov_vf_attrs_are_visible,
c3d5c2d96d69f2 Leon Romanovsky 2021-04-04  287  };
c3d5c2d96d69f2 Leon Romanovsky 2021-04-04  288  

:::::: The code at line 285 was first introduced by commit
:::::: c3d5c2d96d69f2578d6fbf66e39cc2cf840d9812 PCI/IOV: Add sysfs MSI-X vector assignment interface

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leonro@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
