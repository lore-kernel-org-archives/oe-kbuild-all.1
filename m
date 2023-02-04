Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56803322A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675528072; x=1707064072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2SVlxob9YKzy+s/bqF/Qijh6C0jODsj8rl4EKtEbK3w=;
  b=i0aZK7NzU1OVQi6URjszJ9LX1Z/uqDYW/SsOPUzsi19f0lhYl4uzG8gO
   pcO2ubf1qmTZGcDzH60oSx5U5cPFmJHdsvI1gIaTIWN7HNjbMoJeownU+
   I/exxZsSsQydAJaObMxmkGW65Gn/9FYSAsICiKJpEchxBrTxGSNrZuNXm
   FwHgCK2FHQxDfvjs/DFkB3lTOAGGjAPA2DMe7ECpmLYJLUZfVE3dKzyF8
   dm1sGHN/v0p6Z8zEv9b7i+/R01Z9zhHmfiq7ngQ9DqEPzzz0yMjggFRsK
   zTd10ImEkMOKO7rUP0oXWypIZ/KF0bNb702NRHKrrDvb1yX5F9uDgpuRB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="326651748"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="326651748"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 08:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="994827398"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="994827398"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Feb 2023 08:27:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOLOH-0001QS-0s;
	Sat, 04 Feb 2023 16:27:49 +0000
Date: Sun, 5 Feb 2023 00:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [pinchartl-media:muxed/2023.1/base 775/929]
 include/crypto/aead.h:470: undefined reference to `af_alg_async_cb'
Message-ID: <202302050038.ngMPMRO2-lkp@intel.com>
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

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/base
head:   f9c8e14ae03c937a79e1c904d004d80a0db3647e
commit: 14a9452bc2885ae18d4f51e0fe4f4e95233dfb0d [775/929] crypto: xilinx: select AES GCM fallback and userspace kernel config
config: m68k-randconfig-r012-20230204 (https://download.01.org/0day-ci/archive/20230205/202302050038.ngMPMRO2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/base
        git checkout 14a9452bc2885ae18d4f51e0fe4f4e95233dfb0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: crypto/algif_aead.o: in function `aead_request_set_callback':
>> include/crypto/aead.h:470: undefined reference to `af_alg_async_cb'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_sendmsg':
   crypto/algif_aead.c:71: undefined reference to `af_alg_sendmsg'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
   crypto/algif_aead.c:529: undefined reference to `af_alg_pull_tsgl'
>> m68k-linux-ld: crypto/algif_aead.c:530: undefined reference to `sock_kzfree_s'
>> m68k-linux-ld: crypto/algif_aead.c:531: undefined reference to `sock_kfree_s'
>> m68k-linux-ld: crypto/algif_aead.c:532: undefined reference to `af_alg_release_parent'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
   crypto/algif_aead.c:544: undefined reference to `sock_kmalloc'
   m68k-linux-ld: crypto/algif_aead.c:551: undefined reference to `sock_kfree_s'
   m68k-linux-ld: crypto/algif_aead.o: in function `lock_sock':
   include/net/sock.h:1721: undefined reference to `lock_sock_nested'
>> m68k-linux-ld: include/net/sock.h:1721: undefined reference to `release_sock'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_sendpage_nokey':
   crypto/algif_aead.c:432: undefined reference to `af_alg_sendpage'
   m68k-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg':
   crypto/algif_aead.c:110: undefined reference to `af_alg_wait_for_data'
>> m68k-linux-ld: crypto/algif_aead.c:153: undefined reference to `af_alg_alloc_areq'
>> m68k-linux-ld: crypto/algif_aead.c:159: undefined reference to `af_alg_get_rsgl'
>> m68k-linux-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
>> m68k-linux-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
>> m68k-linux-ld: crypto/algif_aead.c:230: undefined reference to `af_alg_pull_tsgl'
>> m68k-linux-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
>> m68k-linux-ld: crypto/algif_aead.c:250: undefined reference to `af_alg_count_tsgl'
>> m68k-linux-ld: crypto/algif_aead.c:254: undefined reference to `sock_kmalloc'
>> m68k-linux-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
   m68k-linux-ld: crypto/algif_aead.c:264: undefined reference to `af_alg_pull_tsgl'
   m68k-linux-ld: crypto/algif_aead.o: in function `sock_put':
   include/net/sock.h:1987: undefined reference to `sk_free'
   m68k-linux-ld: crypto/algif_aead.o: in function `_aead_recvmsg':
   crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
   m68k-linux-ld: crypto/algif_aead.o: in function `lock_sock':
   include/net/sock.h:1721: undefined reference to `lock_sock_nested'
   m68k-linux-ld: crypto/algif_aead.o: in function `aead_recvmsg':
   crypto/algif_aead.c:351: undefined reference to `af_alg_wmem_wakeup'
>> m68k-linux-ld: crypto/algif_aead.c:352: undefined reference to `release_sock'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x8): undefined reference to `af_alg_release'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0xc): undefined reference to `sock_no_bind'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x10): undefined reference to `sock_no_connect'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x14): undefined reference to `sock_no_socketpair'
>> m68k-linux-ld: crypto/algif_aead.o:(.data+0x18): undefined reference to `sock_no_accept'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x1c): undefined reference to `sock_no_getname'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x20): undefined reference to `af_alg_poll'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x24): undefined reference to `sock_no_ioctl'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x2c): undefined reference to `sock_no_listen'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x30): undefined reference to `sock_no_shutdown'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x48): undefined reference to `sock_no_mmap'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x78): undefined reference to `af_alg_release'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x7c): undefined reference to `sock_no_bind'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x80): undefined reference to `sock_no_connect'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x84): undefined reference to `sock_no_socketpair'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `sock_no_accept'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x8c): undefined reference to `sock_no_getname'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `af_alg_poll'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x94): undefined reference to `sock_no_ioctl'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0x9c): undefined reference to `sock_no_listen'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0xa0): undefined reference to `sock_no_shutdown'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0xb8): undefined reference to `sock_no_mmap'
   m68k-linux-ld: crypto/algif_aead.o:(.data+0xbc): undefined reference to `af_alg_sendpage'
   m68k-linux-ld: crypto/algif_aead.o: in function `algif_aead_init':
   crypto/algif_aead.c:592: undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])


vim +470 include/crypto/aead.h

5d1d65f8bea6de Herbert Xu      2015-05-11  439  
5d1d65f8bea6de Herbert Xu      2015-05-11  440  /**
5d1d65f8bea6de Herbert Xu      2015-05-11  441   * aead_request_set_callback() - set asynchronous callback function
5d1d65f8bea6de Herbert Xu      2015-05-11  442   * @req: request handle
5d1d65f8bea6de Herbert Xu      2015-05-11  443   * @flags: specify zero or an ORing of the flags
5d1d65f8bea6de Herbert Xu      2015-05-11  444   *	   CRYPTO_TFM_REQ_MAY_BACKLOG the request queue may back log and
5d1d65f8bea6de Herbert Xu      2015-05-11  445   *	   increase the wait queue beyond the initial maximum size;
5d1d65f8bea6de Herbert Xu      2015-05-11  446   *	   CRYPTO_TFM_REQ_MAY_SLEEP the request processing may sleep
5d1d65f8bea6de Herbert Xu      2015-05-11  447   * @compl: callback function pointer to be registered with the request handle
5d1d65f8bea6de Herbert Xu      2015-05-11  448   * @data: The data pointer refers to memory that is not used by the kernel
5d1d65f8bea6de Herbert Xu      2015-05-11  449   *	  crypto API, but provided to the callback function for it to use. Here,
5d1d65f8bea6de Herbert Xu      2015-05-11  450   *	  the caller can provide a reference to memory the callback function can
5d1d65f8bea6de Herbert Xu      2015-05-11  451   *	  operate on. As the callback function is invoked asynchronously to the
5d1d65f8bea6de Herbert Xu      2015-05-11  452   *	  related functionality, it may need to access data structures of the
5d1d65f8bea6de Herbert Xu      2015-05-11  453   *	  related functionality which can be referenced using this pointer. The
5d1d65f8bea6de Herbert Xu      2015-05-11  454   *	  callback function can access the memory via the "data" field in the
5d1d65f8bea6de Herbert Xu      2015-05-11  455   *	  crypto_async_request data structure provided to the callback function.
5d1d65f8bea6de Herbert Xu      2015-05-11  456   *
5d1d65f8bea6de Herbert Xu      2015-05-11  457   * Setting the callback function that is triggered once the cipher operation
5d1d65f8bea6de Herbert Xu      2015-05-11  458   * completes
5d1d65f8bea6de Herbert Xu      2015-05-11  459   *
5d1d65f8bea6de Herbert Xu      2015-05-11  460   * The callback function is registered with the aead_request handle and
0184cfe72d2f13 Stephan Mueller 2016-10-21  461   * must comply with the following template::
5d1d65f8bea6de Herbert Xu      2015-05-11  462   *
5d1d65f8bea6de Herbert Xu      2015-05-11  463   *	void callback_function(struct crypto_async_request *req, int error)
5d1d65f8bea6de Herbert Xu      2015-05-11  464   */
5d1d65f8bea6de Herbert Xu      2015-05-11  465  static inline void aead_request_set_callback(struct aead_request *req,
5d1d65f8bea6de Herbert Xu      2015-05-11  466  					     u32 flags,
5d1d65f8bea6de Herbert Xu      2015-05-11  467  					     crypto_completion_t compl,
5d1d65f8bea6de Herbert Xu      2015-05-11  468  					     void *data)
5d1d65f8bea6de Herbert Xu      2015-05-11  469  {
5d1d65f8bea6de Herbert Xu      2015-05-11 @470  	req->base.complete = compl;
5d1d65f8bea6de Herbert Xu      2015-05-11  471  	req->base.data = data;
5d1d65f8bea6de Herbert Xu      2015-05-11  472  	req->base.flags = flags;
5d1d65f8bea6de Herbert Xu      2015-05-11  473  }
5d1d65f8bea6de Herbert Xu      2015-05-11  474  

:::::: The code at line 470 was first introduced by commit
:::::: 5d1d65f8bea6de3d9c2c60fdfdd2da02da5ea672 crypto: aead - Convert top level interface to new style

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
