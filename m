Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E43207
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674332084; x=1705868084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxC1+YJPRJ7wxbN+27v2PWzey7DqCadmqs1xprnFWAw=;
  b=c+nvkelQj0igX8UVTmD7bPXKU7MkunUW15BlusVHRt+M9TkFSGA49rd/
   IUrTzwhTuf1PFNwCDY/c4jxlUpvV6M3Zpi3NDfJQ8z+19NV/NCDyaXjHz
   4gYbIu/EFwZxkg8PGakNeDYhfDIr8MPrKdmHvcp32/dSgaSEOWdyljFX6
   9PAvuxuV0nzemNa+A9HvG8J5hhthJZMLESMgw3Yt1KUUyRhdBuYCv4RXP
   uPP7GvINU6+AzWLwMhP32CpRneSvr1UufqtAMrG/KmbtJgPXo85ZoSTb3
   zTLxz42LyXcRocLorPXns5gbMFpyAbXNqhT7dTOt81mokL2AJmsT1yDeA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="353082165"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="353082165"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 12:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="803449424"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="803449424"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2023 12:14:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJKGA-0004R8-00;
	Sat, 21 Jan 2023 20:14:42 +0000
Date: Sun, 22 Jan 2023 04:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>
Subject: [linux-next:master 4008/6912] ERROR: modpost: "free_io_pgtable_ops"
 [drivers/gpu/drm/panfrost/panfrost.ko] undefined!
Message-ID: <202301220457.yZrxIDnf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: d286a58bc8f4d5cf3246481b4e38e4c0c65550ac [4008/6912] iommu: Tidy up io-pgtable dependencies
config: arm-randconfig-c44-20230119 (https://download.01.org/0day-ci/archive/20230122/202301220457.yZrxIDnf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d286a58bc8f4d5cf3246481b4e38e4c0c65550ac
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d286a58bc8f4d5cf3246481b4e38e4c0c65550ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD d514392f17fd4d386cfadde7f849d97db4ca1fb0 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "free_io_pgtable_ops" [drivers/gpu/drm/panfrost/panfrost.ko] undefined!
>> ERROR: modpost: "alloc_io_pgtable_ops" [drivers/gpu/drm/panfrost/panfrost.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [m]:
   - DRM_PANFROST [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARM [=y] || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y]) && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
