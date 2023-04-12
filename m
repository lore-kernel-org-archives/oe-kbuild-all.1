Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2AE3C02
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681324704; x=1712860704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWCuMOwjsh9VKcTkOg6aweqtEBFDLUD7NtkriPOG+1w=;
  b=mzZ9DvDR3UvZkdK9ej9fK1PJW3mZCOkRu7XJCfj5ZDTkT4CXiDhg/tm4
   CWdtp+F2ZJdlr06wjOgZHz1Wk8A0masQOQ069HVDk4VcA6vWIGKIPn3Q7
   QxLH3IcwGVwrT+QZ2pa6YVL1wUiaOxqch5iTt3qhFMoAeW/+U0ZhCmsRE
   H4LVzs/8z+OXJnyVonzA0ZhR3l00il92NAUFLDDBqMh5Y7o7bI4yNC/Km
   zTKebsp5a3+XUmofbuzwMN2KAM7eWiP5dtnBxFRGpZECdj/wjwSHJobEd
   B0IJ1eHtHUCWlIXXdOVyE0wKa4wFIYUmZilfNo1LMOsB4B6SqmZk+gFHA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323611640"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323611640"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 11:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="689011633"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="689011633"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Apr 2023 11:38:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmfMK-000XzH-2v;
	Wed, 12 Apr 2023 18:38:20 +0000
Date: Thu, 13 Apr 2023 02:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 13338/14520] algif_aead.c:undefined reference to
 `af_alg_pull_tsgl'
Message-ID: <202304130250.xsGCeZP0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dhaval,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: b5823a600d05ca886cfea66e926d74f1c143484f [13338/14520] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: arm-randconfig-r032-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130250.xsGCeZP0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/b5823a600d05ca886cfea66e926d74f1c143484f
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout b5823a600d05ca886cfea66e926d74f1c143484f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130250.xsGCeZP0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> algif_aead.c:(.text+0xa2): undefined reference to `af_alg_pull_tsgl'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0xac): undefined reference to `sock_kzfree_s'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0xb6): undefined reference to `sock_kfree_s'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
>> algif_aead.c:(.text+0xd8): undefined reference to `sock_kmalloc'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0xf2): undefined reference to `sock_kmalloc'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x100): undefined reference to `sock_kfree_s'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `_aead_recvmsg.constprop.0':
>> algif_aead.c:(.text+0x234): undefined reference to `af_alg_wait_for_data'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x26c): undefined reference to `af_alg_alloc_areq'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x294): undefined reference to `af_alg_get_rsgl'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x29e): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x2ba): undefined reference to `af_alg_free_resources'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x32a): undefined reference to `af_alg_pull_tsgl'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x3e2): undefined reference to `sk_free'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x3e8): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x3f6): undefined reference to `af_alg_free_resources'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x422): undefined reference to `af_alg_count_tsgl'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x440): undefined reference to `sock_kmalloc'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x44c): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x468): undefined reference to `af_alg_pull_tsgl'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x4bc): undefined reference to `af_alg_async_cb'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_recvmsg':
>> algif_aead.c:(.text+0x548): undefined reference to `lock_sock_nested'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x578): undefined reference to `af_alg_wmem_wakeup'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x57e): undefined reference to `release_sock'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_check_key':
   algif_aead.c:(.text+0x5b0): undefined reference to `lock_sock_nested'
>> arm-linux-gnueabi-ld: algif_aead.c:(.text+0x5c6): undefined reference to `lock_sock_nested'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x5f4): undefined reference to `release_sock'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x5fa): undefined reference to `release_sock'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sendmsg':
>> algif_aead.c:(.text+0x7a): undefined reference to `af_alg_sendmsg'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> algif_aead.c:(.text+0xc0): undefined reference to `af_alg_release_parent'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sendpage_nokey':
>> algif_aead.c:(.text+0x62e): undefined reference to `af_alg_sendpage'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x8): undefined reference to `af_alg_release'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xc): undefined reference to `sock_no_bind'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `sock_no_connect'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x14): undefined reference to `sock_no_socketpair'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_accept'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x1c): undefined reference to `sock_no_getname'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `af_alg_poll'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x24): undefined reference to `sock_no_ioctl'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x2c): undefined reference to `sock_no_listen'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_shutdown'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_mmap'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x74): undefined reference to `af_alg_release'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x78): undefined reference to `sock_no_bind'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x7c): undefined reference to `sock_no_connect'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x80): undefined reference to `sock_no_socketpair'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x84): undefined reference to `sock_no_accept'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `sock_no_getname'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x8c): undefined reference to `af_alg_poll'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `sock_no_ioctl'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x98): undefined reference to `sock_no_listen'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x9c): undefined reference to `sock_no_shutdown'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xb4): undefined reference to `sock_no_mmap'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xb8): undefined reference to `af_alg_sendpage'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `algif_aead_exit':
   algif_aead.c:(.exit.text+0x4): undefined reference to `af_alg_unregister_type'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `algif_aead_init':
   algif_aead.c:(.init.text+0x2): undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
