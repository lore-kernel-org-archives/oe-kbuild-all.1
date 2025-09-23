Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA22626B747
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 01:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758592100; cv=none; b=TtvNqdNVWi34wzV5LO4Nkom6kYjuY0k180CB7pZy/l01DMspHBGgE8rZ/3RbTfc9jk+pMR+5v3gP5GUzNg41ssVIRQ9ATnKJ8AdaUya2WKbACxKWNprPnOSCSyRxQmCM+IPp9Em7YZ+8OLnkZ5aoO1V57DQtYpU1BUgrHYzpev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758592100; c=relaxed/simple;
	bh=BcFcJDTcBgucjpYRyDfOL2moYnE1xG1qW2d64T5a4UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCvp4HkgAhHNJFWKFnLDyJ1M8lPOdfG1RG9hX4MNk87ghl9unnq8r8wJAKrgjyPqnqIlHpdpBShkWQX/bGUsb/7xogTYqwpFD4XJ0NlMObqHvSTBWO5xQmW/Nc1KQOJ6ei1/5gDu2TFG80W80Scoposc8Z/dXoiDs0cQ5mZW4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GegHG8jg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GegHG8jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758592099; x=1790128099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BcFcJDTcBgucjpYRyDfOL2moYnE1xG1qW2d64T5a4UE=;
  b=GegHG8jgB/al3cMiFXV7QKf9jDpBIqfFKvykHqp3BrgJkSZcuabvGreI
   0dPQgZiYLby1SVpj0bynKmI+ulywfR+y5Wmdt2CX5fBYhFOsnCZYWLQSF
   Eoh0JUbqz3ZW43Sy4197oP7TVfiKlCFSO/KXuJxfuCl6sT78EcvgOZ4lf
   YJHwI4evmDsScI3wGzuk6+AnFFROCp42zxRiMrT4rBUemF872B5wP+rKa
   GsIIk2Ts61LfbaD5+A172clnacYUCoFEgrqikjMa51CBcZSNeKSzNffwb
   yWIUB0wXBczzNvd7AxUqbyST2fPAwI/AnepkH/PdNrfAGtJUSeSbylqxl
   Q==;
X-CSE-ConnectionGUID: MUUFuFd9TlOezTKM6E3ytA==
X-CSE-MsgGUID: mCFMG5bAR9+EWIHnr51HeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78307658"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="78307658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:48:18 -0700
X-CSE-ConnectionGUID: FQETIwyIRxyNSQmdE90jCw==
X-CSE-MsgGUID: 2tf+96XxT5Wg4tniOfUQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="177411315"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2025 18:48:17 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0s8d-0002dU-0T;
	Tue, 23 Sep 2025 01:48:15 +0000
Date: Tue, 23 Sep 2025 09:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Liang <wangliang74@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2909/2909] net/oenetcls/oenetcls_flow.c:140:43:
 error: no member named 'rx_cpu_rmap' in 'struct net_device'
Message-ID: <202509230929.GGNlyoj3-lkp@intel.com>
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
head:   a159deb279dfe156316d8c3957dc7f253686ff83
commit: 22d4075bf5ef29ba4b329f954ac28a7de1d69a65 [2909/2909] net/oenetcls: remove oenetcls trace hook
config: x86_64-randconfig-r123-20250923 (https://download.01.org/0day-ci/archive/20250923/202509230929.GGNlyoj3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230929.GGNlyoj3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509230929.GGNlyoj3-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/oenetcls/oenetcls_flow.c:18:6: warning: no previous prototype for function 'is_oecls_config_netdev' [-Wmissing-prototypes]
      18 | bool is_oecls_config_netdev(const char *name)
         |      ^
   net/oenetcls/oenetcls_flow.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      18 | bool is_oecls_config_netdev(const char *name)
         | ^
         | static 
>> net/oenetcls/oenetcls_flow.c:140:43: error: no member named 'rx_cpu_rmap' in 'struct net_device'
     140 |         if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
         |                                             ~~~  ^
>> net/oenetcls/oenetcls_flow.c:161:24: error: no member named 'ndo_rx_flow_steer' in 'struct net_device_ops'
     161 |         rc = dev->netdev_ops->ndo_rx_flow_steer(dev, skb, rxq_index, flow_id);
         |              ~~~~~~~~~~~~~~~  ^
   1 warning and 2 errors generated.


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
