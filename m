Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34FC10E6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 03:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675394985; x=1706930985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NYz3NpRn305p83TEW6klzKQNh18PJI/NlFCfIQsTfA=;
  b=QZhkOgjPvgL5K+RYDKfaX3vKgj/Vfw90hDu1C95+waadiBIchGejkleY
   cnoH+tuX9KNQfJomfKFo57Yhj5ueal+j9+LmLpoYLeyF9SJJSWPR8SjKY
   sJ2kGMKawD7ujhmY9va2OLr+Gca6WUtGcFS0vZIJyeGJ8jab9v9B4G1og
   59KWXsviMy0bddY2Zkmj3WNkEnz9YMAzkgZtdzCAMXfAy9OnQ5kvIJbxI
   i5fVQ/JuY6UZCe+uG/Hnbfr8tBBjcH+ps9tlzuje1ODbDPGxnt56UFuEf
   1ckKv0zFfamDtp2CzJIj9/O7L85iQjEMrWtkhUuRSdBfmYmJQu5mXqX2B
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="355986733"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="355986733"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 19:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="734168744"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="734168744"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 19:29:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNmlV-00002B-0d;
	Fri, 03 Feb 2023 03:29:29 +0000
Date: Fri, 3 Feb 2023 11:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [pinchartl-media:muxed/2023.1/xilinx/api-updates 13338/14420]
 undefined reference to `af_alg_sendmsg'
Message-ID: <202302031103.ZwX8n9ht-lkp@intel.com>
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

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/xilinx/api-updates
head:   4d84aca55464a5384ebfc09558bbc965f6eb5218
commit: b5823a600d05ca886cfea66e926d74f1c143484f [13338/14420] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: parisc-randconfig-r026-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031103.ZwX8n9ht-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/xilinx/api-updates
        git checkout b5823a600d05ca886cfea66e926d74f1c143484f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   hppa-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg':
>> (.text+0x12c): undefined reference to `af_alg_sendmsg'
   hppa-linux-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> (.text+0x1d4): undefined reference to `af_alg_pull_tsgl'
   hppa-linux-ld: (.text+0x1e4): undefined reference to `sock_kzfree_s'
   hppa-linux-ld: (.text+0x1f4): undefined reference to `sock_kfree_s'
   hppa-linux-ld: (.text+0x1fc): undefined reference to `af_alg_release_parent'
   hppa-linux-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
>> (.text+0x26c): undefined reference to `sock_kmalloc'
   hppa-linux-ld: (.text+0x294): undefined reference to `sock_kmalloc'
   hppa-linux-ld: (.text+0x2b0): undefined reference to `sock_kfree_s'
   hppa-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg.constprop.0.isra.0':
>> (.text+0x594): undefined reference to `af_alg_wait_for_data'
   hppa-linux-ld: (.text+0x608): undefined reference to `af_alg_alloc_areq'
   hppa-linux-ld: (.text+0x640): undefined reference to `af_alg_get_rsgl'
   hppa-linux-ld: (.text+0x650): undefined reference to `af_alg_free_resources'
   hppa-linux-ld: (.text+0x678): undefined reference to `af_alg_free_resources'
   hppa-linux-ld: (.text+0x718): undefined reference to `af_alg_pull_tsgl'
   hppa-linux-ld: (.text+0x7b0): undefined reference to `af_alg_free_resources'
   hppa-linux-ld: (.text+0x7e0): undefined reference to `af_alg_count_tsgl'
   hppa-linux-ld: (.text+0x844): undefined reference to `sock_kmalloc'
   hppa-linux-ld: (.text+0x85c): undefined reference to `af_alg_free_resources'
   hppa-linux-ld: (.text+0x880): undefined reference to `af_alg_pull_tsgl'
   hppa-linux-ld: (.text+0x9a8): undefined reference to `sk_free'
   hppa-linux-ld: (.text+0x9b8): undefined reference to `af_alg_free_resources'
   hppa-linux-ld: crypto/algif_aead.o: in function `aead_check_key.isra.0':
>> (.text+0xadc): undefined reference to `lock_sock_nested'
   hppa-linux-ld: (.text+0xaf8): undefined reference to `lock_sock_nested'
   hppa-linux-ld: (.text+0xb58): undefined reference to `release_sock'
   hppa-linux-ld: (.text+0xb60): undefined reference to `release_sock'
   hppa-linux-ld: crypto/algif_aead.o: in function `aead_sendpage_nokey':
>> (.text+0xc90): undefined reference to `af_alg_sendpage'
   hppa-linux-ld: crypto/algif_aead.o: in function `aead_recvmsg':
   (.text+0xd68): undefined reference to `lock_sock_nested'
   hppa-linux-ld: (.text+0xdb4): undefined reference to `af_alg_wmem_wakeup'
   hppa-linux-ld: (.text+0xdbc): undefined reference to `release_sock'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x8): undefined reference to `af_alg_release'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0xc): undefined reference to `sock_no_bind'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `sock_no_connect'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x14): undefined reference to `sock_no_socketpair'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_accept'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x1c): undefined reference to `sock_no_getname'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `af_alg_poll'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x24): undefined reference to `sock_no_ioctl'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x2c): undefined reference to `sock_no_listen'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_shutdown'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_mmap'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x74): undefined reference to `af_alg_release'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x78): undefined reference to `sock_no_bind'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x7c): undefined reference to `sock_no_connect'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x80): undefined reference to `sock_no_socketpair'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x84): undefined reference to `sock_no_accept'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `sock_no_getname'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x8c): undefined reference to `af_alg_poll'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `sock_no_ioctl'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x98): undefined reference to `sock_no_listen'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0x9c): undefined reference to `sock_no_shutdown'
   hppa-linux-ld: crypto/algif_aead.o:(.data+0xb4): undefined reference to `sock_no_mmap'
>> hppa-linux-ld: crypto/algif_aead.o:(.data+0xb8): undefined reference to `af_alg_sendpage'
   hppa-linux-ld: crypto/algif_aead.o: in function `algif_aead_exit':
>> (.exit.text+0x1c): undefined reference to `af_alg_unregister_type'
   hppa-linux-ld: crypto/algif_aead.o: in function `.LC6':
>> (.rodata.cst4+0x4): undefined reference to `af_alg_async_cb'
   hppa-linux-ld: crypto/algif_aead.o: in function `algif_aead_init':
   (.init.text+0x2c): undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
