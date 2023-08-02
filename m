Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527035224
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690962685; x=1722498685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OjVi6oAFwGDJrW+uaOJzko/OOgjU1MnWnooOVf6WufE=;
  b=QerNAELRbBdhpzoyXJJOl/mz/82yp9cCnKx79fdBKQ1rb9qLPPol1xr2
   m+7O39yK9wJylKhf53HYoyMrXWo1mtR4H2vo+fl6kPih4lVHSWCYP2yGu
   fKEYJoqZs8vKSRLNp85eT+Lva1LaYczK569inKFExTu8k0cgjE7m18kZp
   e/Fg7wh/5WxFQo370dvHOJ09mTgGcE1MDS8NV6xmcdWAXZKF+oKdhDPLG
   vF+uJs6rJq33qk1VMEf7CC1djdI00StCbdWQ/S47DFB12ahYNUU+uSu8O
   Y2bsfeRLb/5mPdLOA8ACD78qStdMtIsmtG30k24gO8Zd0dFQVSsSBDN7C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369506960"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="369506960"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 00:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="819099480"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="819099480"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Aug 2023 00:51:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR6da-00010l-1x;
	Wed, 02 Aug 2023 07:51:18 +0000
Date: Wed, 2 Aug 2023 15:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, longli@microsoft.com,
	sharmaajay@microsoft.com, leon@kernel.org, cai.huoqing@linux.dev,
	ssengar@linux.microsoft.com, vkuznets@redhat.com,
	tglx@linutronix.de, linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, schakrabarti@microsoft.com,
	Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V7 net] net: mana: Fix MANA VF unload when hardware is
Message-ID: <202308021532.8iYkExDh-lkp@intel.com>
References: <1690892953-25201-1-git-send-email-schakrabarti@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1690892953-25201-1-git-send-email-schakrabarti@linux.microsoft.com>

Hi Souradeep,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Souradeep-Chakrabarti/net-mana-Fix-MANA-VF-unload-when-hardware-is/20230801-203141
base:   net/main
patch link:    https://lore.kernel.org/r/1690892953-25201-1-git-send-email-schakrabarti%40linux.microsoft.com
patch subject: [PATCH V7 net] net: mana: Fix MANA VF unload when hardware is
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230802/202308021532.8iYkExDh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021532.8iYkExDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021532.8iYkExDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/microsoft/mana/mana_en.c: In function 'mana_dealloc_queues':
>> drivers/net/ethernet/microsoft/mana/mana_en.c:2398:24: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
    2398 |                 while (skb = skb_dequeue(&txq->pending_skbs)) {
         |                        ^~~


vim +2398 drivers/net/ethernet/microsoft/mana/mana_en.c

  2345	
  2346	static int mana_dealloc_queues(struct net_device *ndev)
  2347	{
  2348		struct mana_port_context *apc = netdev_priv(ndev);
  2349		unsigned long timeout = jiffies + 120 * HZ;
  2350		struct gdma_dev *gd = apc->ac->gdma_dev;
  2351		struct mana_txq *txq;
  2352		struct sk_buff *skb;
  2353		int i, err;
  2354		u32 tsleep;
  2355	
  2356		if (apc->port_is_up)
  2357			return -EINVAL;
  2358	
  2359		mana_chn_setxdp(apc, NULL);
  2360	
  2361		if (gd->gdma_context->is_pf)
  2362			mana_pf_deregister_filter(apc);
  2363	
  2364		/* No packet can be transmitted now since apc->port_is_up is false.
  2365		 * There is still a tiny chance that mana_poll_tx_cq() can re-enable
  2366		 * a txq because it may not timely see apc->port_is_up being cleared
  2367		 * to false, but it doesn't matter since mana_start_xmit() drops any
  2368		 * new packets due to apc->port_is_up being false.
  2369		 *
  2370		 * Drain all the in-flight TX packets.
  2371		 * A timeout of 120 seconds for all the queues is used.
  2372		 * This will break the while loop when h/w is not responding.
  2373		 * This value of 120 has been decided here considering max
  2374		 * number of queues.
  2375		 */
  2376	
  2377		for (i = 0; i < apc->num_queues; i++) {
  2378			txq = &apc->tx_qp[i].txq;
  2379			tsleep = 1000;
  2380			while (atomic_read(&txq->pending_sends) > 0 &&
  2381			       time_before(jiffies, timeout)) {
  2382				usleep_range(tsleep, tsleep + 1000);
  2383				tsleep <<= 1;
  2384			}
  2385			if (atomic_read(&txq->pending_sends)) {
  2386				err = pcie_flr(to_pci_dev(gd->gdma_context->dev));
  2387				if (err) {
  2388					netdev_err(ndev, "flr failed %d with %d pkts pending in txq %u\n",
  2389						   err, atomic_read(&txq->pending_sends),
  2390						   txq->gdma_txq_id);
  2391				}
  2392				break;
  2393			}
  2394		}
  2395	
  2396		for (i = 0; i < apc->num_queues; i++) {
  2397			txq = &apc->tx_qp[i].txq;
> 2398			while (skb = skb_dequeue(&txq->pending_skbs)) {
  2399				mana_unmap_skb(skb, apc);
  2400				dev_consume_skb_any(skb);
  2401			}
  2402			atomic_set(&txq->pending_sends, 0);
  2403		}
  2404		/* We're 100% sure the queues can no longer be woken up, because
  2405		 * we're sure now mana_poll_tx_cq() can't be running.
  2406		 */
  2407	
  2408		apc->rss_state = TRI_STATE_FALSE;
  2409		err = mana_config_rss(apc, TRI_STATE_FALSE, false, false);
  2410		if (err) {
  2411			netdev_err(ndev, "Failed to disable vPort: %d\n", err);
  2412			return err;
  2413		}
  2414	
  2415		mana_destroy_vport(apc);
  2416	
  2417		return 0;
  2418	}
  2419	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
