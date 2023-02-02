Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6122582
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675337811; x=1706873811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHRmvSjR7NZ+IMH28b5FSLZG41lJyZDMbpgxGpqvf7s=;
  b=mDbBIn1MLH4i5cD0kTF8T47y/DNjGJ82YcsOB1vp81HD99Ltj09qcPok
   ihWqUi9V3nZeB1D9ESj4yAgEGeh5omWSyKyH/bC4oU6vEpoRjs5PYSmce
   F5J4SpGfLcLPkRI91W8zRQrG0edAi11QBen2TQkk6489qpLH73zaYQLyJ
   Ns9KnqLMwI2TI+6oH8gNvNUskHDBjDYBaRp9tUggQvA9U9is/kGXdPZQC
   2pp66L6bRVpTuR53jH6WdFC57Zs86oeZW5MvWV7kVQllWgKzLYXPyo4pa
   lIXkrs+MN7RxG5UNk+Z26ijUFl1gak7pmAYLo6yK8xPTI4ApTTSSmpYaW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326119609"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="326119609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 03:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="615240511"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="615240511"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Feb 2023 03:36:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNXtD-0006Sy-20;
	Thu, 02 Feb 2023 11:36:27 +0000
Date: Thu, 2 Feb 2023 19:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: Dhaval Shah <dhaval.r.shah@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [pinchartl-media:muxed/2023.1/base 775/929] crypto/algif_aead.c:529:
 undefined reference to `af_alg_pull_tsgl'
Message-ID: <202302021947.Mftm3KeZ-lkp@intel.com>
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
config: arm-randconfig-r046-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021947.Mftm3KeZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/base
        git checkout 14a9452bc2885ae18d4f51e0fe4f4e95233dfb0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
>> crypto/algif_aead.c:529: undefined reference to `af_alg_pull_tsgl'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:530: undefined reference to `sock_kzfree_s'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:531: undefined reference to `sock_kfree_s'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_accept_parent_nokey':
>> crypto/algif_aead.c:544: undefined reference to `sock_kmalloc'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:549: undefined reference to `sock_kmalloc'
   arm-linux-gnueabi-ld: crypto/algif_aead.c:551: undefined reference to `sock_kfree_s'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `_aead_recvmsg':
>> crypto/algif_aead.c:110: undefined reference to `af_alg_wait_for_data'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:153: undefined reference to `af_alg_alloc_areq'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:159: undefined reference to `af_alg_get_rsgl'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:230: undefined reference to `af_alg_pull_tsgl'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:250: undefined reference to `af_alg_count_tsgl'
   arm-linux-gnueabi-ld: crypto/algif_aead.c:254: undefined reference to `sock_kmalloc'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
   arm-linux-gnueabi-ld: crypto/algif_aead.c:264: undefined reference to `af_alg_pull_tsgl'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `sock_put':
>> include/net/sock.h:1987: undefined reference to `sk_free'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `_aead_recvmsg':
>> crypto/algif_aead.c:318: undefined reference to `af_alg_free_resources'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:321: undefined reference to `af_alg_async_cb'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `lock_sock':
>> include/net/sock.h:1721: undefined reference to `lock_sock_nested'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_recvmsg':
>> crypto/algif_aead.c:351: undefined reference to `af_alg_wmem_wakeup'
>> arm-linux-gnueabi-ld: crypto/algif_aead.c:352: undefined reference to `release_sock'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `lock_sock':
   include/net/sock.h:1721: undefined reference to `lock_sock_nested'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_check_key':
   crypto/algif_aead.c:394: undefined reference to `lock_sock_nested'
   arm-linux-gnueabi-ld: crypto/algif_aead.c:404: undefined reference to `release_sock'
   arm-linux-gnueabi-ld: crypto/algif_aead.c:406: undefined reference to `release_sock'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sendmsg':
   crypto/algif_aead.c:71: undefined reference to `af_alg_sendmsg'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sock_destruct':
   crypto/algif_aead.c:532: undefined reference to `af_alg_release_parent'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `aead_sendpage_nokey':
   crypto/algif_aead.c:432: undefined reference to `af_alg_sendpage'
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
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x78): undefined reference to `af_alg_release'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x7c): undefined reference to `sock_no_bind'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x80): undefined reference to `sock_no_connect'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x84): undefined reference to `sock_no_socketpair'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x88): undefined reference to `sock_no_accept'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x8c): undefined reference to `sock_no_getname'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x90): undefined reference to `af_alg_poll'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x94): undefined reference to `sock_no_ioctl'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0x9c): undefined reference to `sock_no_listen'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xa0): undefined reference to `sock_no_shutdown'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xb8): undefined reference to `sock_no_mmap'
   arm-linux-gnueabi-ld: crypto/algif_aead.o:(.data+0xbc): undefined reference to `af_alg_sendpage'
   arm-linux-gnueabi-ld: crypto/algif_aead.o: in function `algif_aead_init':
   crypto/algif_aead.c:592: undefined reference to `af_alg_register_type'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_USER_API_AEAD
   Depends on [n]: CRYPTO [=y] && NET [=n]
   Selected by [y]:
   - CRYPTO_DEV_ZYNQMP_AES [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && (ZYNQMP_FIRMWARE [=n] || COMPILE_TEST [=y])


vim +529 crypto/algif_aead.c

400c40cf78da00 Stephan Mueller  2015-02-28  322  
d887c52d6ae43a Stephan Mueller  2017-06-25  323  static int aead_recvmsg(struct socket *sock, struct msghdr *msg,
d887c52d6ae43a Stephan Mueller  2017-06-25  324  			size_t ignored, int flags)
83094e5e9e49f8 Tadeusz Struk    2016-03-11  325  {
d887c52d6ae43a Stephan Mueller  2017-06-25  326  	struct sock *sk = sock->sk;
d887c52d6ae43a Stephan Mueller  2017-06-25  327  	int ret = 0;
d887c52d6ae43a Stephan Mueller  2017-06-25  328  
d887c52d6ae43a Stephan Mueller  2017-06-25  329  	lock_sock(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25  330  	while (msg_data_left(msg)) {
d887c52d6ae43a Stephan Mueller  2017-06-25  331  		int err = _aead_recvmsg(sock, msg, ignored, flags);
d887c52d6ae43a Stephan Mueller  2017-06-25  332  
d887c52d6ae43a Stephan Mueller  2017-06-25  333  		/*
d887c52d6ae43a Stephan Mueller  2017-06-25  334  		 * This error covers -EIOCBQUEUED which implies that we can
d887c52d6ae43a Stephan Mueller  2017-06-25  335  		 * only handle one AIO request. If the caller wants to have
d887c52d6ae43a Stephan Mueller  2017-06-25  336  		 * multiple AIO requests in parallel, he must make multiple
d887c52d6ae43a Stephan Mueller  2017-06-25  337  		 * separate AIO calls.
5703c826b758e0 Stephan Mueller  2017-07-30  338  		 *
5703c826b758e0 Stephan Mueller  2017-07-30  339  		 * Also return the error if no data has been processed so far.
d887c52d6ae43a Stephan Mueller  2017-06-25  340  		 */
d887c52d6ae43a Stephan Mueller  2017-06-25  341  		if (err <= 0) {
5703c826b758e0 Stephan Mueller  2017-07-30  342  			if (err == -EIOCBQUEUED || err == -EBADMSG || !ret)
d887c52d6ae43a Stephan Mueller  2017-06-25  343  				ret = err;
d887c52d6ae43a Stephan Mueller  2017-06-25  344  			goto out;
d887c52d6ae43a Stephan Mueller  2017-06-25  345  		}
d887c52d6ae43a Stephan Mueller  2017-06-25  346  
d887c52d6ae43a Stephan Mueller  2017-06-25  347  		ret += err;
d887c52d6ae43a Stephan Mueller  2017-06-25  348  	}
d887c52d6ae43a Stephan Mueller  2017-06-25  349  
d887c52d6ae43a Stephan Mueller  2017-06-25  350  out:
2d97591ef43d05 Stephan Mueller  2017-08-02 @351  	af_alg_wmem_wakeup(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25 @352  	release_sock(sk);
d887c52d6ae43a Stephan Mueller  2017-06-25  353  	return ret;
83094e5e9e49f8 Tadeusz Struk    2016-03-11  354  }
83094e5e9e49f8 Tadeusz Struk    2016-03-11  355  
400c40cf78da00 Stephan Mueller  2015-02-28  356  static struct proto_ops algif_aead_ops = {
400c40cf78da00 Stephan Mueller  2015-02-28  357  	.family		=	PF_ALG,
400c40cf78da00 Stephan Mueller  2015-02-28  358  
400c40cf78da00 Stephan Mueller  2015-02-28  359  	.connect	=	sock_no_connect,
400c40cf78da00 Stephan Mueller  2015-02-28  360  	.socketpair	=	sock_no_socketpair,
400c40cf78da00 Stephan Mueller  2015-02-28  361  	.getname	=	sock_no_getname,
400c40cf78da00 Stephan Mueller  2015-02-28  362  	.ioctl		=	sock_no_ioctl,
400c40cf78da00 Stephan Mueller  2015-02-28  363  	.listen		=	sock_no_listen,
400c40cf78da00 Stephan Mueller  2015-02-28  364  	.shutdown	=	sock_no_shutdown,
400c40cf78da00 Stephan Mueller  2015-02-28  365  	.mmap		=	sock_no_mmap,
400c40cf78da00 Stephan Mueller  2015-02-28  366  	.bind		=	sock_no_bind,
400c40cf78da00 Stephan Mueller  2015-02-28  367  	.accept		=	sock_no_accept,
400c40cf78da00 Stephan Mueller  2015-02-28  368  
400c40cf78da00 Stephan Mueller  2015-02-28  369  	.release	=	af_alg_release,
400c40cf78da00 Stephan Mueller  2015-02-28  370  	.sendmsg	=	aead_sendmsg,
2d97591ef43d05 Stephan Mueller  2017-08-02  371  	.sendpage	=	af_alg_sendpage,
400c40cf78da00 Stephan Mueller  2015-02-28  372  	.recvmsg	=	aead_recvmsg,
a11e1d432b51f6 Linus Torvalds   2018-06-28  373  	.poll		=	af_alg_poll,
400c40cf78da00 Stephan Mueller  2015-02-28  374  };
400c40cf78da00 Stephan Mueller  2015-02-28  375  
2a2a251f110576 Stephan Mueller  2017-04-24  376  static int aead_check_key(struct socket *sock)
2a2a251f110576 Stephan Mueller  2017-04-24  377  {
2a2a251f110576 Stephan Mueller  2017-04-24  378  	int err = 0;
2a2a251f110576 Stephan Mueller  2017-04-24  379  	struct sock *psk;
2a2a251f110576 Stephan Mueller  2017-04-24  380  	struct alg_sock *pask;
2a2a251f110576 Stephan Mueller  2017-04-24  381  	struct aead_tfm *tfm;
2a2a251f110576 Stephan Mueller  2017-04-24  382  	struct sock *sk = sock->sk;
2a2a251f110576 Stephan Mueller  2017-04-24  383  	struct alg_sock *ask = alg_sk(sk);
2a2a251f110576 Stephan Mueller  2017-04-24  384  
2a2a251f110576 Stephan Mueller  2017-04-24  385  	lock_sock(sk);
34c86f4c4a7be3 Herbert Xu       2020-06-08  386  	if (!atomic_read(&ask->nokey_refcnt))
2a2a251f110576 Stephan Mueller  2017-04-24  387  		goto unlock_child;
2a2a251f110576 Stephan Mueller  2017-04-24  388  
2a2a251f110576 Stephan Mueller  2017-04-24  389  	psk = ask->parent;
2a2a251f110576 Stephan Mueller  2017-04-24  390  	pask = alg_sk(ask->parent);
2a2a251f110576 Stephan Mueller  2017-04-24  391  	tfm = pask->private;
2a2a251f110576 Stephan Mueller  2017-04-24  392  
2a2a251f110576 Stephan Mueller  2017-04-24  393  	err = -ENOKEY;
2a2a251f110576 Stephan Mueller  2017-04-24 @394  	lock_sock_nested(psk, SINGLE_DEPTH_NESTING);
dc26c17f743aa8 Eric Biggers     2018-01-03  395  	if (crypto_aead_get_flags(tfm->aead) & CRYPTO_TFM_NEED_KEY)
2a2a251f110576 Stephan Mueller  2017-04-24  396  		goto unlock;
2a2a251f110576 Stephan Mueller  2017-04-24  397  
34c86f4c4a7be3 Herbert Xu       2020-06-08  398  	atomic_dec(&pask->nokey_refcnt);
34c86f4c4a7be3 Herbert Xu       2020-06-08  399  	atomic_set(&ask->nokey_refcnt, 0);
2a2a251f110576 Stephan Mueller  2017-04-24  400  
2a2a251f110576 Stephan Mueller  2017-04-24  401  	err = 0;
2a2a251f110576 Stephan Mueller  2017-04-24  402  
2a2a251f110576 Stephan Mueller  2017-04-24  403  unlock:
2a2a251f110576 Stephan Mueller  2017-04-24  404  	release_sock(psk);
2a2a251f110576 Stephan Mueller  2017-04-24  405  unlock_child:
2a2a251f110576 Stephan Mueller  2017-04-24  406  	release_sock(sk);
2a2a251f110576 Stephan Mueller  2017-04-24  407  
2a2a251f110576 Stephan Mueller  2017-04-24  408  	return err;
2a2a251f110576 Stephan Mueller  2017-04-24  409  }
2a2a251f110576 Stephan Mueller  2017-04-24  410  
2a2a251f110576 Stephan Mueller  2017-04-24  411  static int aead_sendmsg_nokey(struct socket *sock, struct msghdr *msg,
2a2a251f110576 Stephan Mueller  2017-04-24  412  				  size_t size)
2a2a251f110576 Stephan Mueller  2017-04-24  413  {
2a2a251f110576 Stephan Mueller  2017-04-24  414  	int err;
2a2a251f110576 Stephan Mueller  2017-04-24  415  
2a2a251f110576 Stephan Mueller  2017-04-24  416  	err = aead_check_key(sock);
2a2a251f110576 Stephan Mueller  2017-04-24  417  	if (err)
2a2a251f110576 Stephan Mueller  2017-04-24  418  		return err;
2a2a251f110576 Stephan Mueller  2017-04-24  419  
2a2a251f110576 Stephan Mueller  2017-04-24  420  	return aead_sendmsg(sock, msg, size);
2a2a251f110576 Stephan Mueller  2017-04-24  421  }
2a2a251f110576 Stephan Mueller  2017-04-24  422  
2a2a251f110576 Stephan Mueller  2017-04-24  423  static ssize_t aead_sendpage_nokey(struct socket *sock, struct page *page,
2a2a251f110576 Stephan Mueller  2017-04-24  424  				       int offset, size_t size, int flags)
2a2a251f110576 Stephan Mueller  2017-04-24  425  {
2a2a251f110576 Stephan Mueller  2017-04-24  426  	int err;
2a2a251f110576 Stephan Mueller  2017-04-24  427  
2a2a251f110576 Stephan Mueller  2017-04-24  428  	err = aead_check_key(sock);
2a2a251f110576 Stephan Mueller  2017-04-24  429  	if (err)
2a2a251f110576 Stephan Mueller  2017-04-24  430  		return err;
2a2a251f110576 Stephan Mueller  2017-04-24  431  
2d97591ef43d05 Stephan Mueller  2017-08-02 @432  	return af_alg_sendpage(sock, page, offset, size, flags);
2a2a251f110576 Stephan Mueller  2017-04-24  433  }
2a2a251f110576 Stephan Mueller  2017-04-24  434  
2a2a251f110576 Stephan Mueller  2017-04-24  435  static int aead_recvmsg_nokey(struct socket *sock, struct msghdr *msg,
2a2a251f110576 Stephan Mueller  2017-04-24  436  				  size_t ignored, int flags)
2a2a251f110576 Stephan Mueller  2017-04-24  437  {
2a2a251f110576 Stephan Mueller  2017-04-24  438  	int err;
2a2a251f110576 Stephan Mueller  2017-04-24  439  
2a2a251f110576 Stephan Mueller  2017-04-24  440  	err = aead_check_key(sock);
2a2a251f110576 Stephan Mueller  2017-04-24  441  	if (err)
2a2a251f110576 Stephan Mueller  2017-04-24  442  		return err;
2a2a251f110576 Stephan Mueller  2017-04-24  443  
2a2a251f110576 Stephan Mueller  2017-04-24  444  	return aead_recvmsg(sock, msg, ignored, flags);
2a2a251f110576 Stephan Mueller  2017-04-24  445  }
2a2a251f110576 Stephan Mueller  2017-04-24  446  
2a2a251f110576 Stephan Mueller  2017-04-24  447  static struct proto_ops algif_aead_ops_nokey = {
2a2a251f110576 Stephan Mueller  2017-04-24  448  	.family		=	PF_ALG,
2a2a251f110576 Stephan Mueller  2017-04-24  449  
2a2a251f110576 Stephan Mueller  2017-04-24  450  	.connect	=	sock_no_connect,
2a2a251f110576 Stephan Mueller  2017-04-24  451  	.socketpair	=	sock_no_socketpair,
2a2a251f110576 Stephan Mueller  2017-04-24  452  	.getname	=	sock_no_getname,
2a2a251f110576 Stephan Mueller  2017-04-24  453  	.ioctl		=	sock_no_ioctl,
2a2a251f110576 Stephan Mueller  2017-04-24  454  	.listen		=	sock_no_listen,
2a2a251f110576 Stephan Mueller  2017-04-24  455  	.shutdown	=	sock_no_shutdown,
2a2a251f110576 Stephan Mueller  2017-04-24  456  	.mmap		=	sock_no_mmap,
2a2a251f110576 Stephan Mueller  2017-04-24  457  	.bind		=	sock_no_bind,
2a2a251f110576 Stephan Mueller  2017-04-24  458  	.accept		=	sock_no_accept,
2a2a251f110576 Stephan Mueller  2017-04-24  459  
2a2a251f110576 Stephan Mueller  2017-04-24  460  	.release	=	af_alg_release,
2a2a251f110576 Stephan Mueller  2017-04-24  461  	.sendmsg	=	aead_sendmsg_nokey,
2a2a251f110576 Stephan Mueller  2017-04-24  462  	.sendpage	=	aead_sendpage_nokey,
2a2a251f110576 Stephan Mueller  2017-04-24  463  	.recvmsg	=	aead_recvmsg_nokey,
a11e1d432b51f6 Linus Torvalds   2018-06-28  464  	.poll		=	af_alg_poll,
2a2a251f110576 Stephan Mueller  2017-04-24  465  };
2a2a251f110576 Stephan Mueller  2017-04-24  466  
400c40cf78da00 Stephan Mueller  2015-02-28  467  static void *aead_bind(const char *name, u32 type, u32 mask)
400c40cf78da00 Stephan Mueller  2015-02-28  468  {
2a2a251f110576 Stephan Mueller  2017-04-24  469  	struct aead_tfm *tfm;
2a2a251f110576 Stephan Mueller  2017-04-24  470  	struct crypto_aead *aead;
8d605398425843 Kees Cook        2018-09-18  471  	struct crypto_sync_skcipher *null_tfm;
2a2a251f110576 Stephan Mueller  2017-04-24  472  
2a2a251f110576 Stephan Mueller  2017-04-24  473  	tfm = kzalloc(sizeof(*tfm), GFP_KERNEL);
2a2a251f110576 Stephan Mueller  2017-04-24  474  	if (!tfm)
2a2a251f110576 Stephan Mueller  2017-04-24  475  		return ERR_PTR(-ENOMEM);
2a2a251f110576 Stephan Mueller  2017-04-24  476  
2a2a251f110576 Stephan Mueller  2017-04-24  477  	aead = crypto_alloc_aead(name, type, mask);
2a2a251f110576 Stephan Mueller  2017-04-24  478  	if (IS_ERR(aead)) {
2a2a251f110576 Stephan Mueller  2017-04-24  479  		kfree(tfm);
2a2a251f110576 Stephan Mueller  2017-04-24  480  		return ERR_CAST(aead);
2a2a251f110576 Stephan Mueller  2017-04-24  481  	}
2a2a251f110576 Stephan Mueller  2017-04-24  482  
3a2d4fb51e5a96 Eric Biggers     2017-12-07  483  	null_tfm = crypto_get_default_null_skcipher();
72548b093ee38a Stephan Mueller  2017-07-30  484  	if (IS_ERR(null_tfm)) {
72548b093ee38a Stephan Mueller  2017-07-30  485  		crypto_free_aead(aead);
72548b093ee38a Stephan Mueller  2017-07-30  486  		kfree(tfm);
72548b093ee38a Stephan Mueller  2017-07-30  487  		return ERR_CAST(null_tfm);
72548b093ee38a Stephan Mueller  2017-07-30  488  	}
72548b093ee38a Stephan Mueller  2017-07-30  489  
2a2a251f110576 Stephan Mueller  2017-04-24  490  	tfm->aead = aead;
72548b093ee38a Stephan Mueller  2017-07-30  491  	tfm->null_tfm = null_tfm;
2a2a251f110576 Stephan Mueller  2017-04-24  492  
2a2a251f110576 Stephan Mueller  2017-04-24  493  	return tfm;
400c40cf78da00 Stephan Mueller  2015-02-28  494  }
400c40cf78da00 Stephan Mueller  2015-02-28  495  
400c40cf78da00 Stephan Mueller  2015-02-28  496  static void aead_release(void *private)
400c40cf78da00 Stephan Mueller  2015-02-28  497  {
2a2a251f110576 Stephan Mueller  2017-04-24  498  	struct aead_tfm *tfm = private;
2a2a251f110576 Stephan Mueller  2017-04-24  499  
2a2a251f110576 Stephan Mueller  2017-04-24  500  	crypto_free_aead(tfm->aead);
3a2d4fb51e5a96 Eric Biggers     2017-12-07  501  	crypto_put_default_null_skcipher();
2a2a251f110576 Stephan Mueller  2017-04-24  502  	kfree(tfm);
400c40cf78da00 Stephan Mueller  2015-02-28  503  }
400c40cf78da00 Stephan Mueller  2015-02-28  504  
400c40cf78da00 Stephan Mueller  2015-02-28  505  static int aead_setauthsize(void *private, unsigned int authsize)
400c40cf78da00 Stephan Mueller  2015-02-28  506  {
2a2a251f110576 Stephan Mueller  2017-04-24  507  	struct aead_tfm *tfm = private;
2a2a251f110576 Stephan Mueller  2017-04-24  508  
2a2a251f110576 Stephan Mueller  2017-04-24  509  	return crypto_aead_setauthsize(tfm->aead, authsize);
400c40cf78da00 Stephan Mueller  2015-02-28  510  }
400c40cf78da00 Stephan Mueller  2015-02-28  511  
400c40cf78da00 Stephan Mueller  2015-02-28  512  static int aead_setkey(void *private, const u8 *key, unsigned int keylen)
400c40cf78da00 Stephan Mueller  2015-02-28  513  {
2a2a251f110576 Stephan Mueller  2017-04-24  514  	struct aead_tfm *tfm = private;
2a2a251f110576 Stephan Mueller  2017-04-24  515  
dc26c17f743aa8 Eric Biggers     2018-01-03  516  	return crypto_aead_setkey(tfm->aead, key, keylen);
400c40cf78da00 Stephan Mueller  2015-02-28  517  }
400c40cf78da00 Stephan Mueller  2015-02-28  518  
400c40cf78da00 Stephan Mueller  2015-02-28  519  static void aead_sock_destruct(struct sock *sk)
400c40cf78da00 Stephan Mueller  2015-02-28  520  {
400c40cf78da00 Stephan Mueller  2015-02-28  521  	struct alg_sock *ask = alg_sk(sk);
2d97591ef43d05 Stephan Mueller  2017-08-02  522  	struct af_alg_ctx *ctx = ask->private;
d887c52d6ae43a Stephan Mueller  2017-06-25  523  	struct sock *psk = ask->parent;
d887c52d6ae43a Stephan Mueller  2017-06-25  524  	struct alg_sock *pask = alg_sk(psk);
d887c52d6ae43a Stephan Mueller  2017-06-25  525  	struct aead_tfm *aeadc = pask->private;
d887c52d6ae43a Stephan Mueller  2017-06-25  526  	struct crypto_aead *tfm = aeadc->aead;
d887c52d6ae43a Stephan Mueller  2017-06-25  527  	unsigned int ivlen = crypto_aead_ivsize(tfm);
400c40cf78da00 Stephan Mueller  2015-02-28  528  
2d97591ef43d05 Stephan Mueller  2017-08-02 @529  	af_alg_pull_tsgl(sk, ctx->used, NULL, 0);
400c40cf78da00 Stephan Mueller  2015-02-28 @530  	sock_kzfree_s(sk, ctx->iv, ivlen);
400c40cf78da00 Stephan Mueller  2015-02-28 @531  	sock_kfree_s(sk, ctx, ctx->len);
400c40cf78da00 Stephan Mueller  2015-02-28 @532  	af_alg_release_parent(sk);
400c40cf78da00 Stephan Mueller  2015-02-28  533  }
400c40cf78da00 Stephan Mueller  2015-02-28  534  
2a2a251f110576 Stephan Mueller  2017-04-24  535  static int aead_accept_parent_nokey(void *private, struct sock *sk)
400c40cf78da00 Stephan Mueller  2015-02-28  536  {
2d97591ef43d05 Stephan Mueller  2017-08-02  537  	struct af_alg_ctx *ctx;
400c40cf78da00 Stephan Mueller  2015-02-28  538  	struct alg_sock *ask = alg_sk(sk);
2a2a251f110576 Stephan Mueller  2017-04-24  539  	struct aead_tfm *tfm = private;
2a2a251f110576 Stephan Mueller  2017-04-24  540  	struct crypto_aead *aead = tfm->aead;
d887c52d6ae43a Stephan Mueller  2017-06-25  541  	unsigned int len = sizeof(*ctx);
2a2a251f110576 Stephan Mueller  2017-04-24  542  	unsigned int ivlen = crypto_aead_ivsize(aead);
400c40cf78da00 Stephan Mueller  2015-02-28  543  
400c40cf78da00 Stephan Mueller  2015-02-28 @544  	ctx = sock_kmalloc(sk, len, GFP_KERNEL);
400c40cf78da00 Stephan Mueller  2015-02-28  545  	if (!ctx)
400c40cf78da00 Stephan Mueller  2015-02-28  546  		return -ENOMEM;
400c40cf78da00 Stephan Mueller  2015-02-28  547  	memset(ctx, 0, len);
400c40cf78da00 Stephan Mueller  2015-02-28  548  
400c40cf78da00 Stephan Mueller  2015-02-28 @549  	ctx->iv = sock_kmalloc(sk, ivlen, GFP_KERNEL);
400c40cf78da00 Stephan Mueller  2015-02-28  550  	if (!ctx->iv) {
400c40cf78da00 Stephan Mueller  2015-02-28 @551  		sock_kfree_s(sk, ctx, len);
400c40cf78da00 Stephan Mueller  2015-02-28  552  		return -ENOMEM;
400c40cf78da00 Stephan Mueller  2015-02-28  553  	}
400c40cf78da00 Stephan Mueller  2015-02-28  554  	memset(ctx->iv, 0, ivlen);
400c40cf78da00 Stephan Mueller  2015-02-28  555  
d887c52d6ae43a Stephan Mueller  2017-06-25  556  	INIT_LIST_HEAD(&ctx->tsgl_list);
400c40cf78da00 Stephan Mueller  2015-02-28  557  	ctx->len = len;
2c3f8b162106a7 Gilad Ben-Yossef 2017-10-18  558  	crypto_init_wait(&ctx->wait);
400c40cf78da00 Stephan Mueller  2015-02-28  559  
400c40cf78da00 Stephan Mueller  2015-02-28  560  	ask->private = ctx;
400c40cf78da00 Stephan Mueller  2015-02-28  561  
400c40cf78da00 Stephan Mueller  2015-02-28  562  	sk->sk_destruct = aead_sock_destruct;
400c40cf78da00 Stephan Mueller  2015-02-28  563  
400c40cf78da00 Stephan Mueller  2015-02-28  564  	return 0;
400c40cf78da00 Stephan Mueller  2015-02-28  565  }
400c40cf78da00 Stephan Mueller  2015-02-28  566  
2a2a251f110576 Stephan Mueller  2017-04-24  567  static int aead_accept_parent(void *private, struct sock *sk)
2a2a251f110576 Stephan Mueller  2017-04-24  568  {
2a2a251f110576 Stephan Mueller  2017-04-24  569  	struct aead_tfm *tfm = private;
2a2a251f110576 Stephan Mueller  2017-04-24  570  
dc26c17f743aa8 Eric Biggers     2018-01-03  571  	if (crypto_aead_get_flags(tfm->aead) & CRYPTO_TFM_NEED_KEY)
2a2a251f110576 Stephan Mueller  2017-04-24  572  		return -ENOKEY;
2a2a251f110576 Stephan Mueller  2017-04-24  573  
2a2a251f110576 Stephan Mueller  2017-04-24  574  	return aead_accept_parent_nokey(private, sk);
2a2a251f110576 Stephan Mueller  2017-04-24  575  }
2a2a251f110576 Stephan Mueller  2017-04-24  576  
400c40cf78da00 Stephan Mueller  2015-02-28  577  static const struct af_alg_type algif_type_aead = {
400c40cf78da00 Stephan Mueller  2015-02-28  578  	.bind		=	aead_bind,
400c40cf78da00 Stephan Mueller  2015-02-28  579  	.release	=	aead_release,
400c40cf78da00 Stephan Mueller  2015-02-28  580  	.setkey		=	aead_setkey,
400c40cf78da00 Stephan Mueller  2015-02-28  581  	.setauthsize	=	aead_setauthsize,
400c40cf78da00 Stephan Mueller  2015-02-28  582  	.accept		=	aead_accept_parent,
2a2a251f110576 Stephan Mueller  2017-04-24  583  	.accept_nokey	=	aead_accept_parent_nokey,
400c40cf78da00 Stephan Mueller  2015-02-28  584  	.ops		=	&algif_aead_ops,
2a2a251f110576 Stephan Mueller  2017-04-24  585  	.ops_nokey	=	&algif_aead_ops_nokey,
400c40cf78da00 Stephan Mueller  2015-02-28  586  	.name		=	"aead",
400c40cf78da00 Stephan Mueller  2015-02-28  587  	.owner		=	THIS_MODULE
400c40cf78da00 Stephan Mueller  2015-02-28  588  };
400c40cf78da00 Stephan Mueller  2015-02-28  589  
400c40cf78da00 Stephan Mueller  2015-02-28  590  static int __init algif_aead_init(void)
400c40cf78da00 Stephan Mueller  2015-02-28  591  {
400c40cf78da00 Stephan Mueller  2015-02-28 @592  	return af_alg_register_type(&algif_type_aead);
400c40cf78da00 Stephan Mueller  2015-02-28  593  }
400c40cf78da00 Stephan Mueller  2015-02-28  594  

:::::: The code at line 529 was first introduced by commit
:::::: 2d97591ef43d0587be22ad1b0d758d6df4999a0b crypto: af_alg - consolidation of duplicate code

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
