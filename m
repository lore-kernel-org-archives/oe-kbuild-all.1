Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97414AAF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693342930; x=1724878930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVk1A+1Ni3pFt1rqce2zpa+cx5K73ZqUXiOBq2VXYTI=;
  b=I8bsO/vRUrCnCSf5melugQzuzYEAj+4Z4Br+FsMGqtUKJD95mreVOGNK
   994lr70tR5ZeBsJw0N3bWEqpY7DYisJtKPnakBqPAQsSTZDx3tSIioNps
   DNolytLuD85avF5Z9qXBIFxdUAlY3un/ao6pL2LmVmsDEchVPxkOe8QXu
   lzfyXI17gaTDibV14x8vY/KQISADQOu8oeWA6+lDWrO3/uGHuamNVq7mj
   YoNn7YLjO3/HnIKP3V+IIvon8R6kRlb2JlW3qfb7skAL5CcWyD/vHf77L
   jbw9FZN7ggFkX+cAxKYlSo4i7ysyt9l4IfZXL+eDzUdGLSC8XwikESMmU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374381191"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="374381191"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 14:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="773848742"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="773848742"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Aug 2023 14:02:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb5qh-000951-2u;
	Tue, 29 Aug 2023 21:02:07 +0000
Date: Wed, 30 Aug 2023 05:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Sit <michael.wei.hong.sit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 1/1]
 drivers/net/ethernet/intel/igb/igb_main.c:10224:13: warning: variable
 'ret_val' set but not used
Message-ID: <202308300415.YvuTjMUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   527e3ce50b7f5010c8c9097b9c1b43cb5d7463c4
commit: 527e3ce50b7f5010c8c9097b9c1b43cb5d7463c4 [1/1] igb_avb: AVB feature enablement
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308300415.YvuTjMUl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300415.YvuTjMUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300415.YvuTjMUl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/igb/igb_main.c: In function 'igb_lookup':
>> drivers/net/ethernet/intel/igb/igb_main.c:10224:13: warning: variable 'ret_val' set but not used [-Wunused-but-set-variable]
   10224 |         int ret_val;
         |             ^~~~~~~


vim +/ret_val +10224 drivers/net/ethernet/intel/igb/igb_main.c

 10220	
 10221	static struct igb_adapter *igb_lookup(char *id)
 10222	{
 10223		struct igb_pci_lookup adapter_lookup;
 10224		int ret_val;
 10225	
 10226		adapter_lookup.adapter = NULL;
 10227		adapter_lookup.pci_info = id;
 10228	
 10229		/* iterate over the loaded intefaces and match on their
 10230		 * pci device ID identifier - e.g. "0000:7:0.0"
 10231		 */
 10232		ret_val = driver_for_each_device(&igb_driver.driver, NULL,
 10233						 &adapter_lookup, __igb_notify_lookup);
 10234	
 10235		return adapter_lookup.adapter;
 10236	}
 10237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
