Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92C23D43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 19:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683918536; x=1715454536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jidtpb4JSDY9nJ/nFVtYYd1n4u7Y8SEh2MBHIOyG+Jo=;
  b=DthLhqLNSKoDfTcUurT8kd1XV7x4CKQxRlEx0P9j9RMsxOS5fNA5rj+W
   qyoXp3K3WinihJgoAUgI76nL2w39rOAQpG4B08y7Rn+1Jbr8tYKmc9mMF
   XkKMPD/Z0w1vdK32Uo8V7RJw+A/ru8JkGq8eFIh1TBDmAYGCYRyJnb1eR
   C5EbPt7gVN8YtA9EAbu714Ax1Xu8JoEeyGThvLDeT0+g98dNUWt9ArcgM
   X4h6VtSdleW9KikrKJ1xwlRVNW2ct9GtjV61qWoPZAJhG3SZx8ATSYTUp
   Qhkjn+F6WMA7E1FwDnABLvk9Lmu9T/zAQeOLIOaW9hxgLjitXXqTkpc9k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335390477"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="335390477"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769910259"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="769910259"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2023 12:08:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxY8L-00053E-1i;
	Fri, 12 May 2023 19:08:53 +0000
Date: Sat, 13 May 2023 03:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
 176/453] drivers/net/mhi_ep_net.c:133:25: error: implicit declaration of
 function 'u64_stats_fetch_begin_irq'; did you mean 'u64_stats_fetch_begin'?
Message-ID: <202305130323.bY9T4evd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manivannan,

FYI, the error/warning still remains.

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
head:   255ec801b7a09e914735a942f27f3c74f5e8e810
commit: 9d7ea5395ac57ab016fc4a250edc41db9f212fe2 [176/453] net: Add MHI Endpoint network driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230513/202305130323.bY9T4evd-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/9d7ea5395ac57ab016fc4a250edc41db9f212fe2
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-wip-sm8450-hdmi-audio-on-qcomlt
        git checkout 9d7ea5395ac57ab016fc4a250edc41db9f212fe2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130323.bY9T4evd-lkp@intel.com/

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
