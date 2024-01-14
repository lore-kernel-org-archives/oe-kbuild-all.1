Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8222C681
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 23:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U36A/ZdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705274899; x=1736810899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8C6b4MvxiaWW5VbOKg5vdZEFz2a+tnPKC9toja5d8A=;
  b=U36A/ZdRKx1Lyu5z+PlqU7G7SX9+5Vf/4oMFdS7qontWdZl4szIxzyCM
   VZVNYQ0j+urJp/IJA1LMetvWy0YS7oBzwLg23d56V7/0QAy8ZY5zDuAzi
   k1RCLdxzycNJD6Nu2QBvX7q0DQM9/guvPDvqfjC0EJeTMGW1yYRChzfXr
   o34Q8oDfY+Wx7BJI5TUApyQbZEEn0XCswYKcKvRLPlvaGX2P4xff/HL+p
   Uiip7JWzCYKz1iBKRQ4jeYza7iXrffMe7C99XZkZ3FlrfDV6PtzZFjewt
   9sCVgyA8cJ6W3chfRE9xHfW/bQgh/wJok6yep05IpKDP+4gD8ihk4qvey
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="18101097"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="18101097"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 15:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="956664783"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="956664783"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Jan 2024 15:28:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP9tn-000BvF-0C;
	Sun, 14 Jan 2024 23:28:15 +0000
Date: Mon, 15 Jan 2024 07:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20229/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:589:58: warning: '%s'
 directive output may be truncated writing up to 119 bytes into a region of
 size 32
Message-ID: <202401150738.19Xs4gEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d9d4951bf741189c66627715d5ae8a8cf1df85f
commit: 3aa7f186a0ff2a5f104a5a4604c9e524aab0ea32 [20229/30000] net: hns3: add support for queue bonding mode of flow director
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240115/202401150738.19Xs4gEF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150738.19Xs4gEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150738.19Xs4gEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c: In function 'hns3_get_strings':
>> drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:589:58: warning: '%s' directive output may be truncated writing up to 119 bytes into a region of size 32 [-Wformat-truncation=]
     589 |                         snprintf(buff, ETH_GSTRING_LEN, "%s",
         |                                                          ^~
   drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c:589:25: note: 'snprintf' output between 1 and 120 bytes into a destination of size 32
     589 |                         snprintf(buff, ETH_GSTRING_LEN, "%s",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     590 |                                  hns3_priv_flags[i].name);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~


vim +589 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c

496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  568  
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  569  static void hns3_get_strings(struct net_device *netdev, u32 stringset, u8 *data)
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  570  {
9780cb97afd868 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Yunsheng Lin 2017-10-09  571  	struct hnae3_handle *h = hns3_get_handle(netdev);
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  572  	const struct hnae3_ae_ops *ops = h->ae_algo->ops;
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  573  	char *buff = (char *)data;
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16  574  	int i;
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  575  
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  576  	if (!ops->get_strings)
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  577  		return;
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  578  
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  579  	switch (stringset) {
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  580  	case ETH_SS_STATS:
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  581  		buff = hns3_get_strings_tqps(h, buff);
63cbf7a9414291 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Yufeng Mo    2019-06-07  582  		ops->get_strings(h, stringset, (u8 *)buff);
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  583  		break;
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  584  	case ETH_SS_TEST:
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  585  		ops->get_strings(h, stringset, data);
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  586  		break;
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16  587  	case ETH_SS_PRIV_FLAGS:
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16  588  		for (i = 0; i < HNS3_PRIV_FLAGS_LEN; i++) {
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16 @589  			snprintf(buff, ETH_GSTRING_LEN, "%s",
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16  590  				 hns3_priv_flags[i].name);
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16  591  			buff += ETH_GSTRING_LEN;
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16  592  		}
35e7064dbeed04 drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2021-07-16  593  		break;
fa7a4bd564ccca drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2018-09-21  594  	default:
fa7a4bd564ccca drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c        Jian Shen    2018-09-21  595  		break;
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  596  	}
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  597  }
496d03e960ae20 drivers/net/ethernet/hisilicon/hns3/hns3pf/hns3_ethtool.c Salil        2017-08-02  598  

:::::: The code at line 589 was first introduced by commit
:::::: 35e7064dbeed0431575404e80c1c0dcb5a922fb9 net: hns3: add priv flags support to switch limit promisc mode

:::::: TO: Jian Shen <shenjian15@huawei.com>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
