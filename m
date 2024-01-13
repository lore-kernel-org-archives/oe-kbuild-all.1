Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721E12E65
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 01:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dtrd/7+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705109912; x=1736645912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JsfN++GeV+lIpUCWvqvYgZEkm/hKh9VW2H+7ZG+rPnw=;
  b=Dtrd/7+YoSH4o1PWD8i5p9IZGIw3lGeVgro0p+DDQxrJmsUDZW1OgJ5I
   xLmQxyt5UgV7maoxd5+XKGFBavoGftFPFqojpUxTYUI1ebx7DGrSBGRjs
   KdSzO4otVW/qLfPVbFxgMG5hcACHHtNgGK1mfQ4TpAbh3Tax+Vjqf+rh7
   Ce+mrDXACzq+us9YrBEv5gwDcqS73R5XBSnnvZRKbzCiOEKRLuPcqcjJH
   hq3WHD4YbheqJuYMDK1i4E+nG34Oo54viDc8+xTf5Ed8LsastAf+Afhkz
   ef965vEA5iYd15kgHxlRHSVQ+DCsjBNpr+MIKKlBGwn3BP5aJIGMWFYNr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6090147"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="6090147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 17:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="24898388"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2024 17:38:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOSyh-0009y8-2W;
	Sat, 13 Jan 2024 01:38:27 +0000
Date: Sat, 13 Jan 2024 09:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20863/21544]
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:3139:23: warning: unused
 variable 'handle'
Message-ID: <202401130942.KAnMSYAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 447625d22d93951e16bfa3b4b53387873a852406 [20863/21544] net: hns3: fix incorrect hw rss hash type of rx packet
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240113/202401130942.KAnMSYAG-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401130942.KAnMSYAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401130942.KAnMSYAG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3_enet.c:3139:23: warning: unused variable 'handle' [-Wunused-variable]
    3139 |         struct hnae3_handle *handle = ring->tqp->handle;
         |                              ^~~~~~
   1 warning generated.


vim +/handle +3139 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c

76ad4f0ee74758 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_enet.c Salil        2017-08-02  3133  
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23  3134  static void hns3_set_rx_skb_rss_type(struct hns3_enet_ring *ring,
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3135  				     struct sk_buff *skb, u32 rss_hash,
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3136  				     u32 l234info)
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23  3137  {
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3138  	enum pkt_hash_types rss_type = PKT_HASH_TYPE_NONE;
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23 @3139  	struct hnae3_handle *handle = ring->tqp->handle;
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3140  	int l3_type;
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3141  	int l4_type;
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23  3142  
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3143  	l3_type = hnae3_get_field(l234info, HNS3_RXD_L3ID_M, HNS3_RXD_L3ID_S);
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3144  	l4_type = hnae3_get_field(l234info, HNS3_RXD_L4ID_M, HNS3_RXD_L4ID_S);
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3145  	if (l3_type == HNS3_L3_TYPE_IPV4 ||
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3146  	    l3_type == HNS3_L3_TYPE_IPV6) {
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3147  		if (l4_type == HNS3_L4_TYPE_UDP ||
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3148  		    l4_type == HNS3_L4_TYPE_TCP ||
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3149  		    l4_type == HNS3_L4_TYPE_SCTP)
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3150  			rss_type = PKT_HASH_TYPE_L4;
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3151  		else if (l4_type == HNS3_L4_TYPE_IGMP ||
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3152  			 l4_type == HNS3_L4_TYPE_ICMP)
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3153  			rss_type = PKT_HASH_TYPE_L3;
447625d22d9395 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yonglong Liu 2023-04-21  3154  	}
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23  3155  
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23  3156  	skb_set_hash(skb, rss_hash, rss_type);
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23  3157  }
fd757a27ab18c7 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        Yunsheng Lin 2019-04-23  3158  

:::::: The code at line 3139 was first introduced by commit
:::::: fd757a27ab18c72be22c159061583d946ad9ddc7 net: hns3: modify kernel-module hns3 to be the same with kernel 5.1

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
