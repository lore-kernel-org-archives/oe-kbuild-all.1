Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB39E557
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687452203; x=1718988203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y6vDTdkuslRBNW+Rfs2oBxbQ8aTcwlPs8ndExLmrHCI=;
  b=LS+k3oY5jdR+b2CPKZ/uPRiEL0WPsPmPeWHQC5v7sZw3x4CQt53qJDxW
   hX3WUiDu5We0b/RULsG3RXk6ladmmh7sAM7+kiyhOZ+zg4897jEDBUndv
   Tjb0ytt8q+v2uW03F1xOg4gXDSXY2duqu8eb6leJ6nPljbmrk5gN2+omR
   JDZwBcLL5lRoiTshlIe/iyxnfWbNbS8I1XOJUeuKEhY0b0BkZNVyRgDEK
   2sev3lmH2tFudEZUdM2EdE4UL4yb7XB/ANX0b5PRG4X6f5ut0M4Wb3e/0
   paY4ZdcU868xH8FBckLo63YY7R7k0pIlZEHhY6he9bXV+I1OSx27JYbAW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340146674"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="340146674"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 09:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="714963694"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="714963694"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jun 2023 09:42:44 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCNON-0007h3-1z;
	Thu, 22 Jun 2023 16:42:43 +0000
Date: Fri, 23 Jun 2023 00:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
	intel-wired-lan@osuosl.org
Cc: oe-kbuild-all@lists.linux.dev, anthony.l.nguyen@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-net v2] igc: Fix Kernel Panic
 during ndo_tx_timeout callback
Message-ID: <202306230056.OGrsvyKV-lkp@intel.com>
References: <20230622133544.5531-1-muhammad.husaini.zulkifli@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622133544.5531-1-muhammad.husaini.zulkifli@intel.com>

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-net-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Husaini-Zulkifli/igc-Fix-Kernel-Panic-during-ndo_tx_timeout-callback/20230622-224252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230622133544.5531-1-muhammad.husaini.zulkifli%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-net v2] igc: Fix Kernel Panic during ndo_tx_timeout callback
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230056.OGrsvyKV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230056.OGrsvyKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230056.OGrsvyKV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/igc/igc_main.c:319:6: warning: no previous prototype for 'igc_disable_tx_ring_hw' [-Wmissing-prototypes]
     319 | void igc_disable_tx_ring_hw(struct igc_ring *ring)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/igc_disable_tx_ring_hw +319 drivers/net/ethernet/intel/igc/igc_main.c

   318	
 > 319	void igc_disable_tx_ring_hw(struct igc_ring *ring)
   320	{
   321		struct igc_hw *hw = &ring->q_vector->adapter->hw;
   322		u8 idx = ring->reg_idx;
   323		u32 txdctl;
   324	
   325		txdctl = rd32(IGC_TXDCTL(idx));
   326		txdctl &= ~IGC_TXDCTL_QUEUE_ENABLE;
   327		txdctl |= IGC_TXDCTL_SWFLUSH;
   328		wr32(IGC_TXDCTL(idx), txdctl);
   329	}
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
