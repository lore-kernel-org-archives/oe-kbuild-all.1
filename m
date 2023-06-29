Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396F13AC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688058216; x=1719594216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2tuj6lbDiBThTQqnOfTcF0neyi4ca9Hd2P26Ygj+XU=;
  b=WB3BSAVcVbJiPgt3gf3OE+do+JwyGoZVEj6OozgdTUMUgV3wZdp+Lzf4
   eygPx7sE61sMXCJJXsNkZmid4DaSA7a9tsS9dRHFckQi58xfe1yqqA9zo
   XfLrrAuKH0fkX+AG9mSoAs8oA/8Q0HbN/KSIWluwV+39k98vHmDWpXu2X
   fy9ntMzGW8ntlQfMx17Xwo6Qeslxj63ShxNHjgHOQMf+ZxNhRu0RWIzwT
   vUp2+cju1fJ+jjFAPnojRkY7mbSGVV86WNqx31La3Agjd9XbvubIVV2vi
   FIc61WJKx3QkC+2BOZj8/mOsTjhqtdbqXXpMuhvMxrVkpopyfc016azlO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="428208027"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="428208027"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 10:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="747102368"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="747102368"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Jun 2023 10:03:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEv3N-000EHN-0N;
	Thu, 29 Jun 2023 17:03:33 +0000
Date: Fri, 30 Jun 2023 01:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] drivers/mmc/core/mmc.c:978:6:
 sparse: sparse: symbol 'mmc_set_bus_speed' was not declared. Should it be
 static?
Message-ID: <202306300026.nKtx7Kmm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a77c2b7ef728e884d5b9d721f5bf060364a06e4f
commit: 5bcf8db7706a21860890cfe88688e002ccd76352 [1/1] ANDROID: mmc: core: Export core functions required for clk scaling
config: i386-randconfig-i063-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300026.nKtx7Kmm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300026.nKtx7Kmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300026.nKtx7Kmm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/core/mmc.c:978:6: sparse: sparse: symbol 'mmc_set_bus_speed' was not declared. Should it be static?

vim +/mmc_set_bus_speed +978 drivers/mmc/core/mmc.c

   974	
   975	/*
   976	 * Set the bus speed for the selected speed mode.
   977	 */
 > 978	void mmc_set_bus_speed(struct mmc_card *card)
   979	{
   980		unsigned int max_dtr = (unsigned int)-1;
   981	
   982		if ((mmc_card_hs200(card) || mmc_card_hs400(card)) &&
   983		     max_dtr > card->ext_csd.hs200_max_dtr)
   984			max_dtr = card->ext_csd.hs200_max_dtr;
   985		else if (mmc_card_hs(card) && max_dtr > card->ext_csd.hs_max_dtr)
   986			max_dtr = card->ext_csd.hs_max_dtr;
   987		else if (max_dtr > card->csd.max_dtr)
   988			max_dtr = card->csd.max_dtr;
   989	
   990		mmc_set_clock(card->host, max_dtr);
   991	}
   992	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
