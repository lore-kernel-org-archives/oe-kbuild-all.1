Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B0626
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681405393; x=1712941393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0gWVA0k+K0OKUKZO6TU1AfMyoWpb9bTrd72UOUYhdE=;
  b=iuRiriHyv8rdewPQE+R1H/Z+5vcY4fy97XtnPD1BRg3A8G2x77ZM/neO
   jmK5KFfnG5RFq6hXsbi1R7eDnnjSLeD89qcLPUzMnKGTN9DYNpBrcuXxw
   eXuE9gU39LDvYPf4Uy4HwxyEDRPQHlPTOj60Xc2zQF0R6GF5bkl/tHtDV
   O7vXmq1mOBbRRMQSvcFhZ3HyQen1tPb8Li82i2R4+5eUw0QNXISpSkOy0
   SedwZCX8LO45UWUoSHKOWo1EHy2P9X/yTumHCNHsNVPSal07ZNuhBfpOo
   8MWbpUOll7yg1ckvz1TakOY0QPu/hoZr1XRrnCp3ew0p+erA8sT5xxZFE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341739945"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="341739945"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 10:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689424395"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="689424395"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 10:01:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn0Kb-000Ypd-1c;
	Thu, 13 Apr 2023 17:01:57 +0000
Date: Fri, 14 Apr 2023 01:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt-temp-working
 176/324] drivers/net/mhi_ep_net.c:133:25: error: implicit declaration of
 function 'u64_stats_fetch_begin_irq'; did you mean 'u64_stats_fetch_begin'?
Message-ID: <202304140002.LsZdG35c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt-temp-working
head:   6d3957bec671279b13cba72c95513c24b9a082b6
commit: 9d7ea5395ac57ab016fc4a250edc41db9f212fe2 [176/324] net: Add MHI Endpoint network driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230414/202304140002.LsZdG35c-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/9d7ea5395ac57ab016fc4a250edc41db9f212fe2
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt-temp-working
        git checkout 9d7ea5395ac57ab016fc4a250edc41db9f212fe2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140002.LsZdG35c-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/mhi_ep_net.c: In function 'mhi_ndo_get_stats64':
>> drivers/net/mhi_ep_net.c:133:25: error: implicit declaration of function 'u64_stats_fetch_begin_irq'; did you mean 'u64_stats_fetch_begin'? [-Werror=implicit-function-declaration]
     133 |                 start = u64_stats_fetch_begin_irq(&mhi_ep_netdev->stats.rx_syncp);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         u64_stats_fetch_begin
>> drivers/net/mhi_ep_net.c:137:18: error: implicit declaration of function 'u64_stats_fetch_retry_irq'; did you mean 'u64_stats_fetch_retry'? [-Werror=implicit-function-declaration]
     137 |         } while (u64_stats_fetch_retry_irq(&mhi_ep_netdev->stats.rx_syncp, start));
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                  u64_stats_fetch_retry
   cc1: some warnings being treated as errors


vim +133 drivers/net/mhi_ep_net.c

   125	
   126	static void mhi_ndo_get_stats64(struct net_device *ndev,
   127					struct rtnl_link_stats64 *stats)
   128	{
   129		struct mhi_ep_net_dev *mhi_ep_netdev = netdev_priv(ndev);
   130		unsigned int start;
   131	
   132		do {
 > 133			start = u64_stats_fetch_begin_irq(&mhi_ep_netdev->stats.rx_syncp);
   134			stats->rx_packets = u64_stats_read(&mhi_ep_netdev->stats.rx_packets);
   135			stats->rx_bytes = u64_stats_read(&mhi_ep_netdev->stats.rx_bytes);
   136			stats->rx_errors = u64_stats_read(&mhi_ep_netdev->stats.rx_errors);
 > 137		} while (u64_stats_fetch_retry_irq(&mhi_ep_netdev->stats.rx_syncp, start));
   138	
   139		do {
   140			start = u64_stats_fetch_begin_irq(&mhi_ep_netdev->stats.tx_syncp);
   141			stats->tx_packets = u64_stats_read(&mhi_ep_netdev->stats.tx_packets);
   142			stats->tx_bytes = u64_stats_read(&mhi_ep_netdev->stats.tx_bytes);
   143			stats->tx_errors = u64_stats_read(&mhi_ep_netdev->stats.tx_errors);
   144			stats->tx_dropped = u64_stats_read(&mhi_ep_netdev->stats.tx_dropped);
   145		} while (u64_stats_fetch_retry_irq(&mhi_ep_netdev->stats.tx_syncp, start));
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
