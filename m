Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E1BEA0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 23:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691104016; x=1722640016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3U1jXeAiS/x9Y6Yr4AnZquBS+p4hZCWihmGx5WZ2ryk=;
  b=Yzef/an/l4kG6Fn2hxHSKhj7nGxXxphIfnaXJLp7imyEldVf5CprmlKL
   ejbEtyEg/dHeb6dDIZVgmCZm81EmML5YRFebEW1/o0KqF+J15V4ayl9TN
   n99bD0AOPcg7inxY7RXxDIIvSKjhp4PDxTCKvq/TFivil6yr9EXtX81hn
   miz5RU+ViJ7XQrzq0Ik8OolGZacdXjlTVhbxSE+yHsVEy+dRhhIB5+Zqi
   H4Oeyta+nwD3BINf7S1j4rwoaY7yowh3bqPwk5VbqkKn1hUpF0OlTyVcp
   hrWSkUAycx/0TlQ1jdYsIuoNYV2Fyys2YGTGbHij8hSZoG1+0fX9Gp2S8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456389436"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="456389436"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 16:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819861966"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="819861966"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 16:06:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRhPA-0002Qv-37;
	Thu, 03 Aug 2023 23:06:52 +0000
Date: Fri, 4 Aug 2023 07:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Child <nnac123@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Dany Madden <drt@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>
Subject: drivers/net/ethernet/ibm/ibmvnic.c:194:13: warning: variable 'rc'
 set but not used
Message-ID: <202308040609.zQsSXWXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   999f6631866e9ea81add935b9c6ebaab0579d259
commit: 44fbc1b6e0e291df1d31f5080777ce66a72ef37a ibmvnic: Assign IRQ affinity hints to device queues
date:   9 months ago
config: powerpc-ppc64_defconfig (https://download.01.org/0day-ci/archive/20230804/202308040609.zQsSXWXI-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040609.zQsSXWXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040609.zQsSXWXI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ibm/ibmvnic.c: In function 'ibmvnic_clean_affinity':
>> drivers/net/ethernet/ibm/ibmvnic.c:194:13: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     194 |         int rc, i;
         |             ^~


vim +/rc +194 drivers/net/ethernet/ibm/ibmvnic.c

   188	
   189	static void ibmvnic_clean_affinity(struct ibmvnic_adapter *adapter)
   190	{
   191		struct ibmvnic_sub_crq_queue **rxqs;
   192		struct ibmvnic_sub_crq_queue **txqs;
   193		int num_rxqs, num_txqs;
 > 194		int rc, i;
   195	
   196		rc = 0;
   197		rxqs = adapter->rx_scrq;
   198		txqs = adapter->tx_scrq;
   199		num_txqs = adapter->num_active_tx_scrqs;
   200		num_rxqs = adapter->num_active_rx_scrqs;
   201	
   202		netdev_dbg(adapter->netdev, "%s: Cleaning irq affinity hints", __func__);
   203		if (txqs) {
   204			for (i = 0; i < num_txqs; i++)
   205				ibmvnic_clean_queue_affinity(adapter, txqs[i]);
   206		}
   207		if (rxqs) {
   208			for (i = 0; i < num_rxqs; i++)
   209				ibmvnic_clean_queue_affinity(adapter, rxqs[i]);
   210		}
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
