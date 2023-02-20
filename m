Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31E58BEF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676937458; x=1708473458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5wW9AYtdfCg0tr4dQtat8pQzGGIeLnLTBk/jtOghGs=;
  b=ab/5YT/5HKgvqVdOMZw7DjBq9MmaHXLCZx6MAyWETrSia9M/NJJO6xn5
   PLhC5M9N93pXPcyLjfZ4jN0vt0/4+gUom6A1ADXfhLu5JJTNTR1cTJFdU
   cCZP+fRIoQawDKQr2FG3L3XsjUSYjdtYrleoTDYIdnlulFTQjJ1NhqiLF
   TIyx6OzDWgMFqJ2J6XxbCegrRR3TFAGSyRCvz8r+zK5tWTNoNS9PKqRLP
   4qbsGHWIcpohEXg14Vox9LOGEI8Fc97XrZaHc6Or0UmHYTiBnzEPm4+p0
   x9c8KipL7sK+DmqU2eDz/8pqf89lxMUPkYFrJGI65TfFt47ufuDhLTFRG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="334706517"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="334706517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 15:57:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000410801"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="1000410801"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2023 15:57:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUG2I-000EFu-07;
	Mon, 20 Feb 2023 23:57:34 +0000
Date: Tue, 21 Feb 2023 07:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:kobject-const 122/122] drivers/iommu/iommu.c:118:9:
 warning: initialization discards 'const' qualifier from pointer target type
Message-ID: <202302210708.PQqZ8mR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git kobject-const
head:   de9d11ba9a2261b62a065a1b6539eecf8a6d81f5
commit: de9d11ba9a2261b62a065a1b6539eecf8a6d81f5 [122/122] driver core: platform: make platform_bus_type constant
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230221/202302210708.PQqZ8mR4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=de9d11ba9a2261b62a065a1b6539eecf8a6d81f5
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core kobject-const
        git checkout de9d11ba9a2261b62a065a1b6539eecf8a6d81f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210708.PQqZ8mR4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:118:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     118 |         &platform_bus_type,
         |         ^


vim +/const +118 drivers/iommu/iommu.c

b0119e870837dc Joerg Roedel 2017-02-01  116  
c13dbc1e248549 Robin Murphy 2022-08-15  117  static struct bus_type * const iommu_buses[] = {
c13dbc1e248549 Robin Murphy 2022-08-15 @118  	&platform_bus_type,
c13dbc1e248549 Robin Murphy 2022-08-15  119  #ifdef CONFIG_PCI
c13dbc1e248549 Robin Murphy 2022-08-15  120  	&pci_bus_type,
c13dbc1e248549 Robin Murphy 2022-08-15  121  #endif
c13dbc1e248549 Robin Murphy 2022-08-15  122  #ifdef CONFIG_ARM_AMBA
c13dbc1e248549 Robin Murphy 2022-08-15  123  	&amba_bustype,
c13dbc1e248549 Robin Murphy 2022-08-15  124  #endif
c13dbc1e248549 Robin Murphy 2022-08-15  125  #ifdef CONFIG_FSL_MC_BUS
c13dbc1e248549 Robin Murphy 2022-08-15  126  	&fsl_mc_bus_type,
c13dbc1e248549 Robin Murphy 2022-08-15  127  #endif
c13dbc1e248549 Robin Murphy 2022-08-15  128  #ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
c13dbc1e248549 Robin Murphy 2022-08-15  129  	&host1x_context_device_bus_type,
c13dbc1e248549 Robin Murphy 2022-08-15  130  #endif
c13dbc1e248549 Robin Murphy 2022-08-15  131  };
c13dbc1e248549 Robin Murphy 2022-08-15  132  

:::::: The code at line 118 was first introduced by commit
:::::: c13dbc1e24854908376c40ccaeb7a3a3c111e3af iommu: Always register bus notifiers

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
