Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580281875
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684010178; x=1715546178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMTH8L60M4xuyDjIs7rac+DXvzWQyD6vUgeHvGu3OUI=;
  b=guQfW/clJ5sXCuhdjuzhtIUsKN11nxdOVSWXICj1h1FBVW4Vwr/OB/Gt
   PtX9tvjKSBEfdxMmEw0qb4jrHofIRpk8aHqM8KnGsKNg5QskfUP60NUgR
   RYQ5tHwZPqlOLCVnLPHMDorlRf25iPSCtMVH+k07OHolRrsv7mQN9WDVN
   7YPblR44CSgZWzW07YAZmk69ryNWsm22GvwuC2M7gauaz/MkaPWXOKS2V
   /wuluk9tSL9UeixSk52yFdDvfNZi/q6IVrZ8lEVm3UtygSCzw0u+DNyfm
   uxBAPFLQ1q8vssdu6gkPQxMB7vC1QRXNusyIApSiKRMtqtt6VNave4/LC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="348480326"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="348480326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 13:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="844772598"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="844772598"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 May 2023 13:36:16 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxvyR-0005fc-31;
	Sat, 13 May 2023 20:36:15 +0000
Date: Sun, 14 May 2023 04:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 143/436]
 drivers/gpu/drm/evdi/evdi_ioc32.c:61:23: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202305140447.Yl866Qc6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5d271868a7df53b1302889854e7bd4c434ccdcac
commit: 4c84ca78d36c41b436f7586426a05ae274ad7e53 [143/436] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
config: sparc-randconfig-s043-20230514 (https://download.01.org/0day-ci/archive/20230514/202305140447.Yl866Qc6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout 4c84ca78d36c41b436f7586426a05ae274ad7e53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/evdi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140447.Yl866Qc6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/evdi/evdi_ioc32.c:61:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char const *[assigned] [noderef] edid @@     got void [noderef] __user * @@
   drivers/gpu/drm/evdi/evdi_ioc32.c:61:23: sparse:     expected unsigned char const *[assigned] [noderef] edid
   drivers/gpu/drm/evdi/evdi_ioc32.c:61:23: sparse:     got void [noderef] __user *
--
>> drivers/gpu/drm/evdi/evdi_gem.c:290:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *vaddr_iomem @@     got void *vmapping @@
   drivers/gpu/drm/evdi/evdi_gem.c:290:60: sparse:     expected void [noderef] __iomem *vaddr_iomem
   drivers/gpu/drm/evdi/evdi_gem.c:290:60: sparse:     got void *vmapping

vim +61 drivers/gpu/drm/evdi/evdi_ioc32.c

    48	
    49	static int compat_evdi_connect(struct file *file,
    50					unsigned int __always_unused cmd,
    51					unsigned long arg)
    52	{
    53		struct drm_evdi_connect32 req32;
    54		struct drm_evdi_connect krequest;
    55	
    56		if (copy_from_user(&req32, (void __user *)arg, sizeof(req32)))
    57			return -EFAULT;
    58	
    59		krequest.connected = req32.connected;
    60		krequest.dev_index = req32.dev_index;
  > 61		krequest.edid = compat_ptr(req32.edid_ptr32);
    62		krequest.edid_length = req32.edid_length;
    63		krequest.pixel_area_limit = req32.pixel_area_limit;
    64		krequest.pixel_per_second_limit = req32.pixel_per_second_limit;
    65	
    66		return drm_ioctl_kernel(file, evdi_painter_connect_ioctl, &krequest, 0);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
