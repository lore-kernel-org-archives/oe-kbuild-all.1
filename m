Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF3F1D2FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690313175; x=1721849175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKWa6TonFaRJ7c3NOExpCkmLsFbhGgZOxgNVbTm0bnI=;
  b=i9rCQKwt4QUg/DjzMpJttYr+YGDTsrvHEkuCLFFad0mGT/drcpkuqiJW
   ZgeWsB94jAi26lngjG2E5ZMKOzWFldSikQgYOJ5bO9+CR8WYQrkD+7Hkc
   F+NEAne3PCp8F6WZDrHI48tmBPUc592hZgGqmYgj3M2KxKpE6qV2XWhF1
   Zzje3Tx0zxVbncwcv4ddFBcajpR3e1M6DX9+ORpycpw8P9KfEKcLr1jXW
   IihaRR1xkPhSyyYSA6ekyUavYx2QCdBAKyKQJ/8tg8ce3p1YvI3MagtvR
   yhoyYBEmX1l3QEPLu2w9KdRHr3Rrr0pT6JVkzwKl0g+eoszJCmR/Ghj60
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="365287460"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="365287460"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816367694"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="816367694"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 12:26:13 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qONfg-0000Hf-1B;
	Tue, 25 Jul 2023 19:26:12 +0000
Date: Wed, 26 Jul 2023 03:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6125/27201]
 drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for function
 'mmc_crypto_setup_queue'
Message-ID: <202307260342.pj4F7d41-lkp@intel.com>
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
head:   07452ef620d930ec54a5bba4af41ef219d861787
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [6125/27201] ANDROID: mmc: MMC crypto API
config: x86_64-randconfig-x014-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260342.pj4F7d41-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260342.pj4F7d41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260342.pj4F7d41-lkp@intel.com/

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
