Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE77101EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 13:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694785384; x=1726321384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dyAg0/wYeK2OfoJGzQtnKnv98fgECYj2X/vGbrBRzE=;
  b=Gkon1vnep5PsOG6gm1IDyzAH307b2IR5acW17+huR02OiyzBFBhRnT0j
   EegY6SK1tFOLdnMcPhdOUwrlMjZumS5f2mB7b3aGpOHXzgOwC0o3TEyia
   nTzAmaQY5SSqyVu2w3f5zkDvJoKZVX8VGgxBA8aTgjfBPG/aIf25JLPEP
   mjvdK/7g3o/NfM7leKxc0RFnFXXIP2BCpDaYI4+GCBksBzSxnKxVHC1aW
   RsVLsZMPJyoeIVLEDZglLMB73Hvh93R5dYyUgwCwXobmzFxbEhWFRBnrk
   zzijtzZEr2IPOSTD4963MzAknxHf59H1I0chQCURegfxVnJO2dh5q51Du
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369566531"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="369566531"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 06:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868708135"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="868708135"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Sep 2023 06:43:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh964-00031N-0k;
	Fri, 15 Sep 2023 13:43:00 +0000
Date: Fri, 15 Sep 2023 21:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6125/27213]
 drivers/mmc/core/crypto.c:14:6: warning: no previous declaration for
 'mmc_crypto_setup_queue'
Message-ID: <202309152157.gtVXr2WL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   e749a1dff657e84c9e2b073e8bf75faa1732ee72
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [6125/27213] ANDROID: mmc: MMC crypto API
config: i386-buildonly-randconfig-004-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152157.gtVXr2WL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152157.gtVXr2WL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309152157.gtVXr2WL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/crypto.c:14:6: warning: no previous declaration for 'mmc_crypto_setup_queue' [-Wmissing-declarations]
    void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/core/crypto.c:21:6: warning: no previous declaration for 'mmc_crypto_free_host' [-Wmissing-declarations]
    void mmc_crypto_free_host(struct mmc_host *host)
         ^~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/core/crypto.c:26:6: warning: no previous declaration for 'mmc_crypto_prepare_req' [-Wmissing-declarations]
    void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
         ^~~~~~~~~~~~~~~~~~~~~~


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
