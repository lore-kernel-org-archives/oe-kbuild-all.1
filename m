Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794B71105
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 02:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680141770; x=1711677770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pmZ5hxungJbZO6DtwdQRXs9DXfhtNEpvEZM3Kql6Hwg=;
  b=fQqLzL5lrpHB0Q/Ipt9vN+LrObDvEz+1GFp3SV8xmNukkviW6g/bpgM/
   PmODqlzA1o6/3y5J12iN2Vkh3KxL+tjnWWOU+K7mkyImJKQ5bF59/wdon
   qmqSm0Tp/fFUCwjpOUrVXQKZED4lWZZtwanU1V3+ED9YYLoHi7pAOxlqz
   5/97DlOM2Fz4iVlluguxBPaK3Pt2H9KgbgjWsOcJe+O6vHPNvE24fgTkM
   R0EfqhRRsn5MpHGVKezOTHyFm0UCb/iRkA/pjjt8IzyHu1nyHmvrmULzC
   xh0u1LRK/kKWiEZn4E9bgi1o03lmv5hUn9ouxqOOfJ9Jf9SSoduqC2fzz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="341066440"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="341066440"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 19:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="687051897"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="687051897"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2023 19:02:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phhcK-000KAG-2I;
	Thu, 30 Mar 2023 02:02:20 +0000
Date: Thu, 30 Mar 2023 10:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: crypto/crypto_engine.c:56:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202303300941.ymDi8OuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffe78bbd512166e0ef1cc4858010b128c510ed7d
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE support
date:   8 months ago
config: loongarch-randconfig-s033-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300941.ymDi8OuQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=93a4fa622eb061f75f87f0cf9609ab4e69c67d01
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 93a4fa622eb061f75f87f0cf9609ab4e69c67d01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/ crypto/ drivers/perf/ kernel/events/ kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300941.ymDi8OuQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/crypto_engine.c:56:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   crypto/crypto_engine.c:56:9: sparse:     expected void *ptr
   crypto/crypto_engine.c:56:9: sparse:     got unsigned int [noderef] __percpu *
>> crypto/crypto_engine.c:56:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   crypto/crypto_engine.c:56:9: sparse:     expected void *ptr
   crypto/crypto_engine.c:56:9: sparse:     got unsigned int [noderef] __percpu *
>> crypto/crypto_engine.c:56:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   crypto/crypto_engine.c:56:9: sparse:     expected void *ptr
   crypto/crypto_engine.c:56:9: sparse:     got unsigned int [noderef] __percpu *
>> crypto/crypto_engine.c:56:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   crypto/crypto_engine.c:56:9: sparse:     expected void *ptr
   crypto/crypto_engine.c:56:9: sparse:     got unsigned int [noderef] __percpu *
--
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got int [noderef] __percpu *
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got int [noderef] __percpu *
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got int [noderef] __percpu *
>> kernel/time/tick-sched.c:289:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:289:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:289:9: sparse:     got int [noderef] __percpu *
   kernel/time/tick-sched.c:490:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/time/tick-sched.c:490:17: sparse:     expected struct lockdep_map const *lock
   kernel/time/tick-sched.c:490:17: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got int [noderef] __percpu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got int [noderef] __percpu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got int [noderef] __percpu *
   kernel/time/tick-sched.c:1151:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/time/tick-sched.c:1151:9: sparse:     expected void *ptr
   kernel/time/tick-sched.c:1151:9: sparse:     got int [noderef] __percpu *

vim +56 crypto/crypto_engine.c

735d37b5424b27a Baolin Wang    2016-01-26  18  
218d1cc1860c45b Corentin LABBE 2018-01-26  19  /**
218d1cc1860c45b Corentin LABBE 2018-01-26  20   * crypto_finalize_request - finalize one request if the request is done
218d1cc1860c45b Corentin LABBE 2018-01-26  21   * @engine: the hardware engine
218d1cc1860c45b Corentin LABBE 2018-01-26  22   * @req: the request need to be finalized
218d1cc1860c45b Corentin LABBE 2018-01-26  23   * @err: error number
218d1cc1860c45b Corentin LABBE 2018-01-26  24   */
218d1cc1860c45b Corentin LABBE 2018-01-26  25  static void crypto_finalize_request(struct crypto_engine *engine,
218d1cc1860c45b Corentin LABBE 2018-01-26  26  				    struct crypto_async_request *req, int err)
218d1cc1860c45b Corentin LABBE 2018-01-26  27  {
218d1cc1860c45b Corentin LABBE 2018-01-26  28  	unsigned long flags;
6a89f492f8e5097 Iuliana Prodan 2020-04-28  29  	bool finalize_req = false;
218d1cc1860c45b Corentin LABBE 2018-01-26  30  	int ret;
218d1cc1860c45b Corentin LABBE 2018-01-26  31  	struct crypto_engine_ctx *enginectx;
218d1cc1860c45b Corentin LABBE 2018-01-26  32  
6a89f492f8e5097 Iuliana Prodan 2020-04-28  33  	/*
6a89f492f8e5097 Iuliana Prodan 2020-04-28  34  	 * If hardware cannot enqueue more requests
6a89f492f8e5097 Iuliana Prodan 2020-04-28  35  	 * and retry mechanism is not supported
6a89f492f8e5097 Iuliana Prodan 2020-04-28  36  	 * make sure we are completing the current request
6a89f492f8e5097 Iuliana Prodan 2020-04-28  37  	 */
6a89f492f8e5097 Iuliana Prodan 2020-04-28  38  	if (!engine->retry_support) {
218d1cc1860c45b Corentin LABBE 2018-01-26  39  		spin_lock_irqsave(&engine->queue_lock, flags);
6a89f492f8e5097 Iuliana Prodan 2020-04-28  40  		if (engine->cur_req == req) {
6a89f492f8e5097 Iuliana Prodan 2020-04-28  41  			finalize_req = true;
6a89f492f8e5097 Iuliana Prodan 2020-04-28  42  			engine->cur_req = NULL;
6a89f492f8e5097 Iuliana Prodan 2020-04-28  43  		}
218d1cc1860c45b Corentin LABBE 2018-01-26  44  		spin_unlock_irqrestore(&engine->queue_lock, flags);
6a89f492f8e5097 Iuliana Prodan 2020-04-28  45  	}
218d1cc1860c45b Corentin LABBE 2018-01-26  46  
6a89f492f8e5097 Iuliana Prodan 2020-04-28  47  	if (finalize_req || engine->retry_support) {
218d1cc1860c45b Corentin LABBE 2018-01-26  48  		enginectx = crypto_tfm_ctx(req->tfm);
6a89f492f8e5097 Iuliana Prodan 2020-04-28  49  		if (enginectx->op.prepare_request &&
218d1cc1860c45b Corentin LABBE 2018-01-26  50  		    enginectx->op.unprepare_request) {
218d1cc1860c45b Corentin LABBE 2018-01-26  51  			ret = enginectx->op.unprepare_request(engine, req);
218d1cc1860c45b Corentin LABBE 2018-01-26  52  			if (ret)
218d1cc1860c45b Corentin LABBE 2018-01-26  53  				dev_err(engine->dev, "failed to unprepare request\n");
218d1cc1860c45b Corentin LABBE 2018-01-26  54  		}
218d1cc1860c45b Corentin LABBE 2018-01-26  55  	}
4058cf08945c18a Corentin Labbe 2022-02-21 @56  	lockdep_assert_in_softirq();
218d1cc1860c45b Corentin LABBE 2018-01-26  57  	req->complete(req, err);
218d1cc1860c45b Corentin LABBE 2018-01-26  58  
218d1cc1860c45b Corentin LABBE 2018-01-26  59  	kthread_queue_work(engine->kworker, &engine->pump_requests);
218d1cc1860c45b Corentin LABBE 2018-01-26  60  }
218d1cc1860c45b Corentin LABBE 2018-01-26  61  

:::::: The code at line 56 was first introduced by commit
:::::: 4058cf08945c18a6de193f4118fd05d83d3d4285 crypto: engine - check if BH is disabled during completion

:::::: TO: Corentin Labbe <clabbe@baylibre.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
