Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D3B7F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675325300; x=1706861300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0DgLaLeI1iAFSytSZwCGGHbYj/6SO0c2R1K/Y8oOuU=;
  b=WIR9LWVsw5bM89we9OriatCEfceBP7EGPdtqSg8sIW/1pZsxhwkGNdUw
   rTw+mJX9ng0/xiYUGBMHF56OdAxF222+rd5NuGAJLoESwgCyX3Apg/c/l
   3wWD8ix7JLdf1aym5e0j11Z0kG0X9UD+kpRfzYT+sxZ+YZIsBWlj9urXB
   rICXhtl3ZqoxejkvHn/McRmCdZGxsPa7k+BRDjp/piH9nrF7gCKV3jVbV
   tCu/BsGc8lKcHGg112T/H+xnfLjbLp24oUBxzzzPlb81eOWfZU7lBb1Lf
   dhl6xGIrPsYvOuD+IY+lCVgSxzZottn3vsr1CtQdXA31cYzOcj3QcEsnr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="328400916"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="328400916"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 00:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910668686"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="910668686"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Feb 2023 00:08:18 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNUdl-0006J6-38;
	Thu, 02 Feb 2023 08:08:17 +0000
Date: Thu, 2 Feb 2023 16:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [pinchartl-media:muxed/2023.1/gmsl 13338/14446]
 arm-linux-gnueabi-ld: crypto/algif_aead.o:undefined reference to
 `af_alg_release'
Message-ID: <202302021622.HKreEtqd-lkp@intel.com>
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

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/gmsl
head:   d7b50af934e5c02a50d9a365d0f9f31d1286dc3d
commit: b5823a600d05ca886cfea66e926d74f1c143484f [13338/14446] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: arm-randconfig-r046-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021622.HKreEtqd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/gmsl
        git checkout b5823a600d05ca886cfea66e926d74f1c143484f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
   algif_aead.c:(.text+0x68): undefined reference to `af_alg_pull_tsgl'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x72): undefined reference to `sock_kzfree_s'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x7c): undefined reference to `sock_kfree_s'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
   algif_aead.c:(.text+0x9e): undefined reference to `sock_kmalloc'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0xb8): undefined reference to `sock_kmalloc'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0xc6): undefined reference to `sock_kfree_s'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `_aead_recvmsg.constprop.0':
   algif_aead.c:(.text+0x1e8): undefined reference to `af_alg_wait_for_data'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x21c): undefined reference to `af_alg_alloc_areq'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x23c): undefined reference to `af_alg_get_rsgl'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x25a): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x2b2): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x2de): undefined reference to `af_alg_pull_tsgl'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x2f4): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x308): undefined reference to `af_alg_count_tsgl'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x326): undefined reference to `sock_kmalloc'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x332): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x34e): undefined reference to `af_alg_pull_tsgl'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x440): undefined reference to `sk_free'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x494): undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x4ac): undefined reference to `af_alg_async_cb'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_recvmsg':
   algif_aead.c:(.text+0x4c8): undefined reference to `lock_sock_nested'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x4fe): undefined reference to `af_alg_wmem_wakeup'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x504): undefined reference to `release_sock'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_check_key':
   algif_aead.c:(.text+0x532): undefined reference to `lock_sock_nested'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x548): undefined reference to `lock_sock_nested'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x57c): undefined reference to `release_sock'
   arm-linux-gnueabi-ld: algif_aead.c:(.text+0x582): undefined reference to `release_sock'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sendmsg':
   algif_aead.c:(.text+0x40): undefined reference to `af_alg_sendmsg'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
   algif_aead.c:(.text+0x86): undefined reference to `af_alg_release_parent'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sendpage_nokey':
   algif_aead.c:(.text+0x5b0): undefined reference to `af_alg_sendpage'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x8): undefined reference to `af_alg_release'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xc): undefined reference to `sock_no_bind'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `sock_no_connect'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x14): undefined reference to `sock_no_socketpair'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_accept'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x1c): undefined reference to `sock_no_getname'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `af_alg_poll'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x24): undefined reference to `sock_no_ioctl'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x2c): undefined reference to `sock_no_listen'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_shutdown'
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_mmap'
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
>> arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xb8): undefined reference to `af_alg_sendpage'
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
