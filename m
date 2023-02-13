Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B467290B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676314812; x=1707850812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vcns5HWtMdCSPTntvOyyhHIshiZeykNMqNLZlCPO1ck=;
  b=OJwQ5k71VzR6zqUYTqqs5mltdvREnv3sQ+QPvYhNbHfZogF8J1dhj8tN
   6xIN8reVpV45aWzJb2OZwiIj3MjsHTy9A/jgOkrInuv6XwYAc1Z5j1286
   E2/eku/uMqJl1qJ0Zlj+eFMmzD6H3SPIcGfCZRGkiI+gf2q/spzXIJrQi
   u6E+KRV7JNFRFZpRcHzsj7OfewEsG37RbhNwcLhbeUehXA4BFxs0ymNRZ
   tWHDCPGmZsmQT/WAgbTGwnMqtxvbBn+LUjiybb1ZIbvt3nRMPGuMCy08F
   /yFRlKND19ZqYiFZ0bNFkN2cm8sI4UDX82EcYSMoOD51BMB4Yp6zlVOQZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328678424"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="328678424"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 10:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="737620559"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="737620559"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2023 10:55:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRdz9-0007x7-0W;
	Mon, 13 Feb 2023 18:55:31 +0000
Date: Tue, 14 Feb 2023 02:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:vfio_device_cdev_v3 16/19]
 drivers/vfio/vfio_main.c:252:34: error: no member named 'cdev' in 'struct
 vfio_device'; did you mean 'dev'?
Message-ID: <202302140239.q4gPORFG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git vfio_device_cdev_v3
head:   98491da60ae1496187eb3585f5de36c843a237d1
commit: 241853c75dabceb7ecc9d96df30fff1c586c6b03 [16/19] vfio: Add cdev for vfio_device
config: hexagon-randconfig-r041-20230212 (https://download.01.org/0day-ci/archive/20230214/202302140239.q4gPORFG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/yiliu1765/iommufd/commit/241853c75dabceb7ecc9d96df30fff1c586c6b03
        git remote add yiliu1765-iommufd https://github.com/yiliu1765/iommufd.git
        git fetch --no-tags yiliu1765-iommufd vfio_device_cdev_v3
        git checkout 241853c75dabceb7ecc9d96df30fff1c586c6b03
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140239.q4gPORFG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_main.c:18:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/vfio/vfio_main.c:18:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/vfio/vfio_main.c:18:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/vfio/vfio_main.c:252:34: error: no member named 'cdev' in 'struct vfio_device'; did you mean 'dev'?
                   ret = cdev_device_add(&device->cdev, &device->device);
                                                  ^~~~
                                                  dev
   include/linux/vfio.h:38:17: note: 'dev' declared here
           struct device *dev;
                          ^
   drivers/vfio/vfio_main.c:261:28: error: no member named 'cdev' in 'struct vfio_device'; did you mean 'dev'?
                   cdev_device_del(&device->cdev, &device->device);
                                            ^~~~
                                            dev
   include/linux/vfio.h:38:17: note: 'dev' declared here
           struct device *dev;
                          ^
   6 warnings and 2 errors generated.


vim +252 drivers/vfio/vfio_main.c

   246	
   247	static int vfio_device_add(struct vfio_device *device)
   248	{
   249		int ret;
   250	
   251		if (IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV))
 > 252			ret = cdev_device_add(&device->cdev, &device->device);
   253		else
   254			ret = device_add(&device->device);
   255		return ret;
   256	}
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
