Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E217AD9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 22:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692140317; x=1723676317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQ6ax+iq5MhQljVQgGFC20rWlNXMigmv61ebGv8RDas=;
  b=JToFUdDqj9VHeiAfM/cqrVhg7WiHSbPSO6CWdADyRUfXtLGqtk00bs4c
   HnLsGTPspI98QnEzy8QZ1f1kNT4SZUY1N2ZR/ptWXqcoIcif+4IsQdh73
   UFdrccgYMDxI3fusSzY64XpTG6u3zioBpd6G1wxndoZhxrEv0w4wM8dhU
   wQfvavGQvaXwmv26xMUmazQA3EqRsON4vgxRDkIpen3M1H4KJ/HGIYFpH
   B598oiFKLBe3EvH5H7KxWL/3/fbiyLUyQrOOXATfGWci8wav/s4IhSM2E
   Jg8y2yMJRZYQW+pdInLRFoHlRb3PJh/6/vbqb5Q0V859vu/7dVh7QBT0N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376128149"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="376128149"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 15:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="710909136"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="710909136"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Aug 2023 15:58:34 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW2zi-0001Il-0g;
	Tue, 15 Aug 2023 22:58:34 +0000
Date: Wed, 16 Aug 2023 06:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6125/27202]
 drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for
 'mmc_crypto_setup_queue'
Message-ID: <202308160626.yVo0e8HW-lkp@intel.com>
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
head:   f38754f7336474b5be6745c90563e6c32b921793
commit: 555cf12eb672727979bc7b7840c7503f3de27220 [6125/27202] ANDROID: mmc: MMC crypto API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230816/202308160626.yVo0e8HW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160626.yVo0e8HW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160626.yVo0e8HW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/crypto.c:14:6: warning: no previous prototype for 'mmc_crypto_setup_queue' [-Wmissing-prototypes]
      14 | void mmc_crypto_setup_queue(struct mmc_host *host, struct request_queue *q)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/core/crypto.c:21:6: warning: no previous prototype for 'mmc_crypto_free_host' [-Wmissing-prototypes]
      21 | void mmc_crypto_free_host(struct mmc_host *host)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/core/crypto.c:26:6: warning: no previous prototype for 'mmc_crypto_prepare_req' [-Wmissing-prototypes]
      26 | void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
         |      ^~~~~~~~~~~~~~~~~~~~~~


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
