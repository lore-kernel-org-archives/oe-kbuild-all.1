Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2F182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 00:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674950763; x=1706486763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STPOxarH8Q6pepyJ+16mT1VF4/vM49zTxmIr/DDnC9g=;
  b=eRjYA8Qv1O+OwYXFxmmxytF99CxmBpTTOzfJR4rf3Fw+oIa8JuO7HqV9
   LFvUv3UV77P0yZDFfMNYtyFvcVlFYIFzi4xh4wbqPAk3M3A5YlNFo37d2
   eAldrkm5nFNiE6627wwBFIaOU4Wa1qSnWqnjBYBjwpAeqtIFj07UOzbIj
   Jyrc21kaErHHxm+KDi2oUWrzmvrd2bCtnjBFGfBxj3DJ+Gd3uWTknTY7v
   PgjPMPtWBUGnB+QvZllEL1llUEsKEkykdfTKcq1xq4zh60jGmuelUPm94
   +sUTxqJawXoiVAzANaUW/cDDk5g+MlpdZ5vR7RPMoeHb+vgIe7/zYTyIQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354660876"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354660876"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 16:06:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="732266872"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="732266872"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2023 16:05:59 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLvCo-0001FM-3C;
	Sun, 29 Jan 2023 00:05:58 +0000
Date: Sun, 29 Jan 2023 08:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_guest_rfc 96/109] lib/devres.c:19:17:
 error: implicit declaration of function 'iounmap_driver_hardened'
Message-ID: <202301290842.7sGWB0eM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux dev/atishp/kvm_aptee_guest_rfc
head:   adf357593cff6780e32553a751d6cb7bb88dd6a6
commit: e8a79efa4fe8d5bb0ce1a52cd5b7bbd2e15df33c [96/109] asm/io.h: Add iounmap_driver_hardened
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230129/202301290842.7sGWB0eM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/e8a79efa4fe8d5bb0ce1a52cd5b7bbd2e15df33c
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 dev/atishp/kvm_aptee_guest_rfc
        git checkout e8a79efa4fe8d5bb0ce1a52cd5b7bbd2e15df33c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   lib/devres.c: In function 'devm_ioremap_release':
>> lib/devres.c:19:17: error: implicit declaration of function 'iounmap_driver_hardened' [-Werror=implicit-function-declaration]
      19 |                 iounmap_driver_hardened(*(void __iomem **)res);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c: In function '__devm_ioremap':
   lib/devres.c:45:32: error: implicit declaration of function 'ioremap_driver_hardened' [-Werror=implicit-function-declaration]
      45 |                         addr = ioremap_driver_hardened(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:45:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      45 |                         addr = ioremap_driver_hardened(offset, size);
         |                              ^
   lib/devres.c:51:32: error: implicit declaration of function 'ioremap_driver_hardened_uc' [-Werror=implicit-function-declaration]
      51 |                         addr = ioremap_driver_hardened_uc(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:51:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      51 |                         addr = ioremap_driver_hardened_uc(offset, size);
         |                              ^
   lib/devres.c:57:32: error: implicit declaration of function 'ioremap_driver_hardened_wc' [-Werror=implicit-function-declaration]
      57 |                         addr = ioremap_driver_hardened_wc(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:57:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      57 |                         addr = ioremap_driver_hardened_wc(offset, size);
         |                              ^
   lib/devres.c:63:32: error: implicit declaration of function 'ioremap_driver_hardened_np' [-Werror=implicit-function-declaration]
      63 |                         addr = ioremap_driver_hardened_np(offset, size);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:63:30: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      63 |                         addr = ioremap_driver_hardened_np(offset, size);
         |                              ^
   cc1: some warnings being treated as errors


vim +/iounmap_driver_hardened +19 lib/devres.c

    15	
    16	void devm_ioremap_release(struct device *dev, void *res)
    17	{
    18		if (dev_is_authorized(dev)) {
  > 19			iounmap_driver_hardened(*(void __iomem **)res);
    20			return;
    21		}
    22	
    23		iounmap(*(void __iomem **)res);
    24	}
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
