Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23228362
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 01:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683683408; x=1715219408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8P5avWG5rTNz1pi+pLt7uIYqfMr+0FOtqO+wQu7LPWI=;
  b=S0b9NXB3TEuAqw28TriJ2zMLVEkkLcpKU0ABzE4109iJFoEcT1AjhiQr
   5VLfEGN0ur8AcHQpeY/ADXOUDy6zSzP+da1viSBU6cRecRK2pUaNqzzG5
   zYUWnxezwoBwqlGs0/cyM5xM5lKxoX6KrlkK6Ih2ro41b2S5RpTfipBHi
   e+RRtNkX+BQSnQSQ7mLf0e2pUKEyQgLRS+ESRw1devk/LMH1AVqKUo1HO
   WEob3pxsr7PoT6Qg7UQK06FBkiVX8qA58aH1IyTBGU+V3Br2Bir0b7zoS
   FH1ARNvAE827aI/8bPsIRVKm06GUUJjsVuiIPNoaW39VJE6jgow+uHq1b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="378197503"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="378197503"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 18:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873406354"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="873406354"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 May 2023 18:50:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwYxx-0002m8-1Y;
	Wed, 10 May 2023 01:50:05 +0000
Date: Wed, 10 May 2023 09:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6125/25680]
 drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for function
 'mmc_crypto_setup_queue'
Message-ID: <202305100902.fYSKF6mz-lkp@intel.com>
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
head:   6d5e0c7837af8f05f7da31f9204e36185069c6af
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [6125/25680] ANDROID: mmc: MMC crypto API
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230510/202305100902.fYSKF6mz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 555cf12eb672727979bc7b7840c7503f3de27220
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mmc/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100902.fYSKF6mz-lkp@intel.com/

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
https://github.com/intel/lkp-tests
