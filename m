Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA87FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 03:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683774054; x=1715310054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DuueECz994WssmdbyLkpdHF+qp3ylbXdgHnCEl5fio=;
  b=e6filzwrUPO4Z7de8pTAaGwM7RBSoAX2Ydon+upYXMXaz3ScZ7BWvsCY
   r0moDUnv3xTTIj8cyE7RmtOTa+5zXxhf9K3TSYs4UTgjQo24Dqn2PoVfc
   VNVoXRGToVOM3JXVMLCLbZskjuobOKL1I57szwcRJaVjZXbZR3Be01zRc
   rbO5LRTtmXz273U6O3acXhJX3uBn+sfTrejQFEppMFQZuZPeolZQeEHcC
   vDAytly15OkRrJaQPIOk2yUkMqqY7fL6cHPOQBKr3Jr/TgvMMcnb7tNFd
   xqB6q7YaeIauAHdGIHSxKQQ8uTZ0m6CfTL0rMvxSZQElXbJjUxGnHhWOV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413698480"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="413698480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 20:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="764537967"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="764537967"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 20:00:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwwXz-0003jI-15;
	Thu, 11 May 2023 03:00:51 +0000
Date: Thu, 11 May 2023 11:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/intel/iwlegacy/4965-mac.c:1653:29: warning:
 variable 'out_meta' set but not used
Message-ID: <202305111044.dALqNbL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stafford,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d295b66a7b66ed504a827b58876ad9ea48c0f4a8
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   10 months ago
config: openrisc-buildonly-randconfig-r001-20230511 (https://download.01.org/0day-ci/archive/20230511/202305111044.dALqNbL3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ded2ee36313c941f1a12b6f85cde295b575264ae
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ded2ee36313c941f1a12b6f85cde295b575264ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/wireless/intel/iwlegacy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111044.dALqNbL3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/intel/iwlegacy/4965-mac.c: In function 'il4965_tx_skb':
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:1653:29: warning: variable 'out_meta' set but not used [-Wunused-but-set-variable]
    1653 |         struct il_cmd_meta *out_meta;
         |                             ^~~~~~~~


vim +/out_meta +1653 drivers/net/wireless/intel/iwlegacy/4965-mac.c

a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1638  
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1639  /*
4d69c7521a90cb drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-08-30  1640   * start C_TX command process
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1641   */
e7392364fcd100 drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1642  int
36323f817af037 drivers/net/wireless/iwlegacy/4965-mac.c Thomas Huehn      2012-07-23  1643  il4965_tx_skb(struct il_priv *il,
36323f817af037 drivers/net/wireless/iwlegacy/4965-mac.c Thomas Huehn      2012-07-23  1644  	      struct ieee80211_sta *sta,
36323f817af037 drivers/net/wireless/iwlegacy/4965-mac.c Thomas Huehn      2012-07-23  1645  	      struct sk_buff *skb)
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1646  {
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1647  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1648  	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1649  	struct il_station_priv *sta_priv = NULL;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1650  	struct il_tx_queue *txq;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1651  	struct il_queue *q;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1652  	struct il_device_cmd *out_cmd;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15 @1653  	struct il_cmd_meta *out_meta;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1654  	struct il_tx_cmd *tx_cmd;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1655  	int txq_id;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1656  	dma_addr_t phys_addr;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1657  	dma_addr_t txcmd_phys;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1658  	dma_addr_t scratch_phys;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1659  	u16 len, firstlen, secondlen;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1660  	u16 seq_number = 0;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1661  	__le16 fc;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1662  	u8 hdr_len;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1663  	u8 sta_id;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1664  	u8 wait_write_ptr = 0;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1665  	u8 tid = 0;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1666  	u8 *qc = NULL;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1667  	unsigned long flags;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1668  	bool is_agg = false;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1669  
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1670  	spin_lock_irqsave(&il->lock, flags);
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1671  	if (il_is_rfkill(il)) {
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1672  		D_DROP("Dropping - RF KILL\n");
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1673  		goto drop_unlock;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1674  	}
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1675  
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1676  	fc = hdr->frame_control;
a1751b22a82e6c drivers/net/wireless/iwlegacy/4965-mac.c Stanislaw Gruszka 2011-11-15  1677  

:::::: The code at line 1653 was first introduced by commit
:::::: a1751b22a82e6cd2da6c9e79611cfd6d6aba1d39 iwlegacy: merge iwl-4965-{tx,rx}.c into 4965-mac.c

:::::: TO: Stanislaw Gruszka <sgruszka@redhat.com>
:::::: CC: Stanislaw Gruszka <sgruszka@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
