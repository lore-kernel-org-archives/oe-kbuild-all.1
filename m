Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21B20F15
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 03:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692762867; x=1724298867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IEYqTrTDh+BvLPCnLAC5C65s5S4wYoJhOm7ReGlFngw=;
  b=CzajEOfIwTJLmG+HYflkZ0dHaStnFPbEMfgZUc8UoWftMjg+Av/jKODK
   0PWzCw1ypUog/a4XDB5dLytgWJVrsW71VksQBcv3HYpcXfGzviqH5TpWq
   w1oCuezucvo4Qv7oPiX5NFmRlkfvRMbLer8myJZQ7x5Q+LmgVlhU2UMYZ
   eRacsscUWfzyINU4oWxYHi7EF5H3jZiGZf8zKLEdrOaroEr5IgpemtUSO
   VfZC6dpOE+MuLjcZeo2doAEgBGok9XzmU3vFpdLDuSs5s1g61SJhOFUpJ
   D7uUuwFkF3bnhbHe5u67ns3WXOFLApNFY7tr0GwgFh1RSY2TaMMIImFmF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372944833"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="372944833"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 20:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771567109"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="771567109"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Aug 2023 20:54:24 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYewq-0000pE-0X;
	Wed, 23 Aug 2023 03:54:24 +0000
Date: Wed, 23 Aug 2023 11:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6125/27207]
 drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for function
 'mmc_crypto_setup_queue'
Message-ID: <202308231156.vf8OotJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Satya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d62f1fc1623efbeb110e393379097ee39766655d
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [6125/27207] ANDROID: mmc: MMC crypto API
config: x86_64-randconfig-072-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231156.vf8OotJI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231156.vf8OotJI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231156.vf8OotJI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for function 'mmc_crypto_setup_queue' [-Wmissing-prototypes]
   void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
        ^
   drivers/mmc/core/crypto.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
   ^
   static 
>> drivers/mmc/core/crypto.c:21:6: warning: no previous prototype for function 'mmc_crypto_free_host' [-Wmissing-prototypes]
   void mmc_crypto_free_host(struct mmc_host *host)
        ^
   drivers/mmc/core/crypto.c:21:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mmc_crypto_free_host(struct mmc_host *host)
   ^
   static 
>> drivers/mmc/core/crypto.c:26:6: warning: no previous prototype for function 'mmc_crypto_prepare_req' [-Wmissing-prototypes]
   void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
        ^
   drivers/mmc/core/crypto.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
   ^
   static 
   3 warnings generated.


vim +/mmc_crypto_setup_queue +14 drivers/mmc/core/crypto.c

    13	
  > 14	void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
    15	{
    16		if (host->caps2 & MMC_CAP2_CRYPTO)
    17			q->ksm = host->ksm;
    18	}
    19	EXPORT_SYMBOL_GPL(mmc_crypto_setup_queue);
    20	
  > 21	void mmc_crypto_free_host(struct mmc_host *host)
    22	{
    23		keyslot_manager_destroy(host->ksm);
    24	}
    25	
  > 26	void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
