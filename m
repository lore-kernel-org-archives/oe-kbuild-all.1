Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA531DA55
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 00:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762214818; cv=none; b=I4kf4YRakdYfQsV9/tE0lwVR442I3Ee/pVhmHlYLJH315m9TlrOY1gIiR977hh6Erc/DPpqrT7daY0T+SfGnjSZW26hhLGJJsgebb2J7a1RRzgVi9AaRRDRoAUaqIQx5mcIfOGrhJbBWhUABo6UxaKqFWUhJltIKKbVqHBAYmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762214818; c=relaxed/simple;
	bh=7TCcS2H7MfZ4Mvy33mfuXTP243caEzBm0t4Hq19jK50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E9t9fyoj8+FHRJWI2LV0HwytfqfFSicab1lRhTSLZ/+jzyfzFj7c48iWlYfh8qqUJuah3/WqKGypC5jWkkRxARtaX7cb5ngO4a190Nn1VSTRBkBwIpihBRrqV6XKYY2MNWxHR7VDSn4Wnhbxn9pWU63n6OwT9T8jvvQAuzCVYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGcq+w61; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGcq+w61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762214816; x=1793750816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7TCcS2H7MfZ4Mvy33mfuXTP243caEzBm0t4Hq19jK50=;
  b=LGcq+w61wfaEaJNMq3PS6iSqqT6eltzhA0iPF/OehXAn0PbvtLT6lbqe
   ElpjrxXbKoilU/mWQIwdPYp+C9osmRLu8FoeLKzZhSfiD1z1UBcNlRV84
   awV9EQQyFfsQomojJCfKiJqtrjhxBF9FcvqafJfNZYq7H3vFgj1+8VJku
   f5PQ4d+FbhVUb/C81FzL6zuSZ9BYw8sNfFyI/XwgxkDL96y/F4QYFiUEX
   6bAr20d657/K4UqoZuUjZTVVVce0Xdjz8UbPBVWEJO3S4H3NLEBo7+yWn
   quXizLAB6hX/R9JPPxxZV2km4NI87PvqcL1tzvBiKqY63hAcDpVAH5BIy
   g==;
X-CSE-ConnectionGUID: VfMSYedrR3e2YUOhOFlqkw==
X-CSE-MsgGUID: NlvOD+wQTkSHjnBbTkfPfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64453062"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="64453062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 16:06:56 -0800
X-CSE-ConnectionGUID: AN7GlyngTFO2LcbG1DvV8Q==
X-CSE-MsgGUID: 4zbZgkuwRkGx62KtNbnr1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="192165779"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Nov 2025 16:06:55 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG4Y5-000QeR-21;
	Tue, 04 Nov 2025 00:05:58 +0000
Date: Tue, 4 Nov 2025 08:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Liang <wangliang74@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] net/oenetcls/oenetcls_flow.c:140:48:
 error: 'struct net_device' has no member named 'rx_cpu_rmap'
Message-ID: <202511040811.Ogiq35Kv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a29fc03bd0ddaf7388cf31604ef5bd9807585109
commit: 22d4075bf5ef29ba4b329f954ac28a7de1d69a65 [3098/3098] net/oenetcls: remove oenetcls trace hook
config: x86_64-randconfig-121-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040811.Ogiq35Kv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040811.Ogiq35Kv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040811.Ogiq35Kv-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/oenetcls/oenetcls_flow.c:18:6: warning: no previous prototype for 'is_oecls_config_netdev' [-Wmissing-prototypes]
      18 | bool is_oecls_config_netdev(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   net/oenetcls/oenetcls_flow.c: In function 'set_oecls_cpu':
>> net/oenetcls/oenetcls_flow.c:140:48: error: 'struct net_device' has no member named 'rx_cpu_rmap'
     140 |         if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
         |                                                ^~
>> net/oenetcls/oenetcls_flow.c:161:29: error: 'const struct net_device_ops' has no member named 'ndo_rx_flow_steer'
     161 |         rc = dev->netdev_ops->ndo_rx_flow_steer(dev, skb, rxq_index, flow_id);
         |                             ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +140 net/oenetcls/oenetcls_flow.c

4bed6ba0e88f50 Wang Liang 2025-08-26   17  
4bed6ba0e88f50 Wang Liang 2025-08-26  @18  bool is_oecls_config_netdev(const char *name)
4bed6ba0e88f50 Wang Liang 2025-08-26   19  {
4bed6ba0e88f50 Wang Liang 2025-08-26   20  	struct oecls_netdev_info *netdev_info;
4bed6ba0e88f50 Wang Liang 2025-08-26   21  	int netdev_loop;
4bed6ba0e88f50 Wang Liang 2025-08-26   22  
4bed6ba0e88f50 Wang Liang 2025-08-26   23  	for_each_oecls_netdev(netdev_loop, netdev_info)
4bed6ba0e88f50 Wang Liang 2025-08-26   24  		if (strcmp(netdev_info->dev_name, name) == 0)
4bed6ba0e88f50 Wang Liang 2025-08-26   25  			return true;
4bed6ba0e88f50 Wang Liang 2025-08-26   26  
4bed6ba0e88f50 Wang Liang 2025-08-26   27  	return false;
4bed6ba0e88f50 Wang Liang 2025-08-26   28  }
4bed6ba0e88f50 Wang Liang 2025-08-26   29  
22d4075bf5ef29 Wang Liang 2025-09-12   30  static bool _oecls_timeout(struct net_device *dev, u16 rxq_index,
22d4075bf5ef29 Wang Liang 2025-09-12   31  			   u32 flow_id, u16 filter_id)
4bed6ba0e88f50 Wang Liang 2025-08-26   32  {
4bed6ba0e88f50 Wang Liang 2025-08-26   33  	struct netdev_rx_queue *rxqueue = dev->_rx + rxq_index;
4bed6ba0e88f50 Wang Liang 2025-08-26   34  	struct oecls_dev_flow_table *flow_table;
4bed6ba0e88f50 Wang Liang 2025-08-26   35  	struct oecls_dev_flow *rflow;
4bed6ba0e88f50 Wang Liang 2025-08-26   36  	bool expire = true;
4bed6ba0e88f50 Wang Liang 2025-08-26   37  	unsigned int cpu;
4bed6ba0e88f50 Wang Liang 2025-08-26   38  
4bed6ba0e88f50 Wang Liang 2025-08-26   39  	rcu_read_lock();
4bed6ba0e88f50 Wang Liang 2025-08-26   40  	flow_table = rcu_dereference(rxqueue->oecls_ftb);
4bed6ba0e88f50 Wang Liang 2025-08-26   41  	if (flow_table && flow_id <= flow_table->mask) {
4bed6ba0e88f50 Wang Liang 2025-08-26   42  		rflow = &flow_table->flows[flow_id];
4bed6ba0e88f50 Wang Liang 2025-08-26   43  		cpu = READ_ONCE(rflow->cpu);
4bed6ba0e88f50 Wang Liang 2025-08-26   44  		oecls_debug("dev:%s, rxq:%d, flow_id:%u, filter_id:%d/%d, cpu:%d\n", dev->name,
4bed6ba0e88f50 Wang Liang 2025-08-26   45  			    rxq_index, flow_id, filter_id, rflow->filter, cpu);
4bed6ba0e88f50 Wang Liang 2025-08-26   46  
4bed6ba0e88f50 Wang Liang 2025-08-26   47  		if (rflow->filter == filter_id && cpu < nr_cpu_ids) {
4bed6ba0e88f50 Wang Liang 2025-08-26   48  			if (time_before(jiffies, rflow->timeout + OECLS_TIMEOUT)) {
4bed6ba0e88f50 Wang Liang 2025-08-26   49  				expire = false;
4bed6ba0e88f50 Wang Liang 2025-08-26   50  			} else {
4bed6ba0e88f50 Wang Liang 2025-08-26   51  				rflow->isvalid = 0;
4bed6ba0e88f50 Wang Liang 2025-08-26   52  				WRITE_ONCE(rflow->cpu, OECLS_NO_CPU);
4bed6ba0e88f50 Wang Liang 2025-08-26   53  			}
4bed6ba0e88f50 Wang Liang 2025-08-26   54  		}
4bed6ba0e88f50 Wang Liang 2025-08-26   55  	}
4bed6ba0e88f50 Wang Liang 2025-08-26   56  	rcu_read_unlock();
4bed6ba0e88f50 Wang Liang 2025-08-26   57  	oecls_debug("%s, dev:%s, rxq:%d, flow_id:%u, filter_id:%d, expire:%d\n", __func__,
4bed6ba0e88f50 Wang Liang 2025-08-26   58  		    dev->name, rxq_index, flow_id, filter_id, expire);
22d4075bf5ef29 Wang Liang 2025-09-12   59  	return expire;
4bed6ba0e88f50 Wang Liang 2025-08-26   60  }
4bed6ba0e88f50 Wang Liang 2025-08-26   61  
22d4075bf5ef29 Wang Liang 2025-09-12   62  static void _oecls_flow_update(struct sock *sk)
4bed6ba0e88f50 Wang Liang 2025-08-26   63  {
4bed6ba0e88f50 Wang Liang 2025-08-26   64  	struct oecls_sock_flow_table *tb;
4bed6ba0e88f50 Wang Liang 2025-08-26   65  	unsigned int hash, index;
4bed6ba0e88f50 Wang Liang 2025-08-26   66  	u32 val;
4bed6ba0e88f50 Wang Liang 2025-08-26   67  	u32 cpu = raw_smp_processor_id();
4bed6ba0e88f50 Wang Liang 2025-08-26   68  
4bed6ba0e88f50 Wang Liang 2025-08-26   69  	if (sk->sk_state != TCP_ESTABLISHED)
4bed6ba0e88f50 Wang Liang 2025-08-26   70  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26   71  
4bed6ba0e88f50 Wang Liang 2025-08-26   72  	if (check_appname(current->comm))
4bed6ba0e88f50 Wang Liang 2025-08-26   73  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26   74  
4bed6ba0e88f50 Wang Liang 2025-08-26   75  	rcu_read_lock();
4bed6ba0e88f50 Wang Liang 2025-08-26   76  	tb = rcu_dereference(oecls_sock_flow_table);
4bed6ba0e88f50 Wang Liang 2025-08-26   77  	hash = READ_ONCE(sk->sk_rxhash);
4bed6ba0e88f50 Wang Liang 2025-08-26   78  	if (tb && hash) {
4bed6ba0e88f50 Wang Liang 2025-08-26   79  		index = hash & tb->mask;
4bed6ba0e88f50 Wang Liang 2025-08-26   80  		val = hash & ~oecls_cpu_mask;
4bed6ba0e88f50 Wang Liang 2025-08-26   81  		val |= cpu;
4bed6ba0e88f50 Wang Liang 2025-08-26   82  
4bed6ba0e88f50 Wang Liang 2025-08-26   83  		if (READ_ONCE(tb->ents[index]) != val) {
4bed6ba0e88f50 Wang Liang 2025-08-26   84  			WRITE_ONCE(tb->ents[index], val);
4bed6ba0e88f50 Wang Liang 2025-08-26   85  
4bed6ba0e88f50 Wang Liang 2025-08-26   86  			oecls_debug("[%s] sk:%p, hash:0x%x, index:0x%x, val:0x%x, cpu:%d\n",
4bed6ba0e88f50 Wang Liang 2025-08-26   87  				    current->comm, sk, hash, index, val, cpu);
4bed6ba0e88f50 Wang Liang 2025-08-26   88  		}
4bed6ba0e88f50 Wang Liang 2025-08-26   89  	}
4bed6ba0e88f50 Wang Liang 2025-08-26   90  	rcu_read_unlock();
4bed6ba0e88f50 Wang Liang 2025-08-26   91  }
4bed6ba0e88f50 Wang Liang 2025-08-26   92  
4bed6ba0e88f50 Wang Liang 2025-08-26   93  static int flow_get_queue_idx(struct net_device *dev, int nid, struct sk_buff *skb)
4bed6ba0e88f50 Wang Liang 2025-08-26   94  {
4bed6ba0e88f50 Wang Liang 2025-08-26   95  	struct oecls_netdev_info *netdev_info;
4bed6ba0e88f50 Wang Liang 2025-08-26   96  	int netdev_loop;
4bed6ba0e88f50 Wang Liang 2025-08-26   97  	u32 hash, index;
4bed6ba0e88f50 Wang Liang 2025-08-26   98  	struct oecls_numa_info *numa_info;
4bed6ba0e88f50 Wang Liang 2025-08-26   99  	struct oecls_numa_bound_dev_info *bound_dev = NULL;
4bed6ba0e88f50 Wang Liang 2025-08-26  100  	int rxq_id, rxq_num, i;
4bed6ba0e88f50 Wang Liang 2025-08-26  101  
4bed6ba0e88f50 Wang Liang 2025-08-26  102  	numa_info = get_oecls_numa_info(nid);
4bed6ba0e88f50 Wang Liang 2025-08-26  103  	if (!numa_info)
4bed6ba0e88f50 Wang Liang 2025-08-26  104  		return -1;
4bed6ba0e88f50 Wang Liang 2025-08-26  105  
4bed6ba0e88f50 Wang Liang 2025-08-26  106  	for_each_oecls_netdev(netdev_loop, netdev_info) {
4bed6ba0e88f50 Wang Liang 2025-08-26  107  		if (strcmp(netdev_info->dev_name, dev->name) == 0) {
4bed6ba0e88f50 Wang Liang 2025-08-26  108  			bound_dev = &numa_info->bound_dev[netdev_loop];
4bed6ba0e88f50 Wang Liang 2025-08-26  109  			break;
4bed6ba0e88f50 Wang Liang 2025-08-26  110  		}
4bed6ba0e88f50 Wang Liang 2025-08-26  111  	}
4bed6ba0e88f50 Wang Liang 2025-08-26  112  
4bed6ba0e88f50 Wang Liang 2025-08-26  113  	if (!bound_dev)
4bed6ba0e88f50 Wang Liang 2025-08-26  114  		return -1;
4bed6ba0e88f50 Wang Liang 2025-08-26  115  	rxq_num = bitmap_weight(bound_dev->bitmap_rxq, OECLS_MAX_RXQ_NUM_PER_DEV);
4bed6ba0e88f50 Wang Liang 2025-08-26  116  	if (rxq_num == 0)
4bed6ba0e88f50 Wang Liang 2025-08-26  117  		return -1;
4bed6ba0e88f50 Wang Liang 2025-08-26  118  
4bed6ba0e88f50 Wang Liang 2025-08-26  119  	hash = skb_get_hash(skb);
4bed6ba0e88f50 Wang Liang 2025-08-26  120  	index = hash % rxq_num;
4bed6ba0e88f50 Wang Liang 2025-08-26  121  
4bed6ba0e88f50 Wang Liang 2025-08-26  122  	i = 0;
4bed6ba0e88f50 Wang Liang 2025-08-26  123  	for_each_set_bit(rxq_id, bound_dev->bitmap_rxq, OECLS_MAX_RXQ_NUM_PER_DEV)
4bed6ba0e88f50 Wang Liang 2025-08-26  124  		if (index == i++)
4bed6ba0e88f50 Wang Liang 2025-08-26  125  			return rxq_id;
4bed6ba0e88f50 Wang Liang 2025-08-26  126  
4bed6ba0e88f50 Wang Liang 2025-08-26  127  	return -1;
4bed6ba0e88f50 Wang Liang 2025-08-26  128  }
4bed6ba0e88f50 Wang Liang 2025-08-26  129  
4bed6ba0e88f50 Wang Liang 2025-08-26  130  static void set_oecls_cpu(struct net_device *dev, struct sk_buff *skb,
4bed6ba0e88f50 Wang Liang 2025-08-26  131  			  struct oecls_dev_flow *old_rflow, int old_rxq_id, u16 next_cpu)
4bed6ba0e88f50 Wang Liang 2025-08-26  132  {
4bed6ba0e88f50 Wang Liang 2025-08-26  133  	struct netdev_rx_queue *rxqueue;
4bed6ba0e88f50 Wang Liang 2025-08-26  134  	struct oecls_dev_flow_table *dtb;
4bed6ba0e88f50 Wang Liang 2025-08-26  135  	struct oecls_dev_flow *rflow;
4bed6ba0e88f50 Wang Liang 2025-08-26  136  	u32 flow_id, hash;
4bed6ba0e88f50 Wang Liang 2025-08-26  137  	u16 rxq_index;
4bed6ba0e88f50 Wang Liang 2025-08-26  138  	int rc;
4bed6ba0e88f50 Wang Liang 2025-08-26  139  
4bed6ba0e88f50 Wang Liang 2025-08-26 @140  	if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
4bed6ba0e88f50 Wang Liang 2025-08-26  141  	    !(dev->features & NETIF_F_NTUPLE))
4bed6ba0e88f50 Wang Liang 2025-08-26  142  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26  143  
4bed6ba0e88f50 Wang Liang 2025-08-26  144  	rxq_index = flow_get_queue_idx(dev, cpu_to_node(next_cpu), skb);
4bed6ba0e88f50 Wang Liang 2025-08-26  145  	if (rxq_index == skb_get_rx_queue(skb) || rxq_index < 0)
4bed6ba0e88f50 Wang Liang 2025-08-26  146  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26  147  
4bed6ba0e88f50 Wang Liang 2025-08-26  148  	rxqueue = dev->_rx + rxq_index;
4bed6ba0e88f50 Wang Liang 2025-08-26  149  	dtb = rcu_dereference(rxqueue->oecls_ftb);
4bed6ba0e88f50 Wang Liang 2025-08-26  150  	if (!dtb)
4bed6ba0e88f50 Wang Liang 2025-08-26  151  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26  152  
4bed6ba0e88f50 Wang Liang 2025-08-26  153  	hash = skb_get_hash(skb);
4bed6ba0e88f50 Wang Liang 2025-08-26  154  	flow_id = hash & dtb->mask;
4bed6ba0e88f50 Wang Liang 2025-08-26  155  	rflow = &dtb->flows[flow_id];
4bed6ba0e88f50 Wang Liang 2025-08-26  156  	if (rflow->isvalid && rflow->cpu == next_cpu) {
4bed6ba0e88f50 Wang Liang 2025-08-26  157  		rflow->timeout = jiffies;
4bed6ba0e88f50 Wang Liang 2025-08-26  158  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26  159  	}
4bed6ba0e88f50 Wang Liang 2025-08-26  160  
4bed6ba0e88f50 Wang Liang 2025-08-26 @161  	rc = dev->netdev_ops->ndo_rx_flow_steer(dev, skb, rxq_index, flow_id);
4bed6ba0e88f50 Wang Liang 2025-08-26  162  	oecls_debug("skb:%p, rxq:%d, hash:0x%x, flow_id:%u, old_rxq_id:%d, next_cpu:%d, rc:%d\n",
4bed6ba0e88f50 Wang Liang 2025-08-26  163  		    skb, rxq_index, hash, flow_id, old_rxq_id, next_cpu, rc);
4bed6ba0e88f50 Wang Liang 2025-08-26  164  	if (rc < 0)
4bed6ba0e88f50 Wang Liang 2025-08-26  165  		return;
4bed6ba0e88f50 Wang Liang 2025-08-26  166  
4bed6ba0e88f50 Wang Liang 2025-08-26  167  	rflow->filter = rc;
4bed6ba0e88f50 Wang Liang 2025-08-26  168  	rflow->isvalid = 1;
4bed6ba0e88f50 Wang Liang 2025-08-26  169  	rflow->timeout = jiffies;
4bed6ba0e88f50 Wang Liang 2025-08-26  170  	if (old_rflow->filter == rflow->filter)
4bed6ba0e88f50 Wang Liang 2025-08-26  171  		old_rflow->filter = OECLS_NO_FILTER;
4bed6ba0e88f50 Wang Liang 2025-08-26  172  	rflow->cpu = next_cpu;
4bed6ba0e88f50 Wang Liang 2025-08-26  173  }
4bed6ba0e88f50 Wang Liang 2025-08-26  174  

:::::: The code at line 140 was first introduced by commit
:::::: 4bed6ba0e88f50484fd5fb06bd993727b981b718 net/oenetcls: introduce oenetcls for network optimization

:::::: TO: Wang Liang <wangliang74@huawei.com>
:::::: CC: Wang Liang <wangliang74@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
