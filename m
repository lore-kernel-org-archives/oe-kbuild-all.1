Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07A19F495
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743859645; cv=none; b=NZnpmJ9G7vAFXRWhpbX02WtZipaG3UdmGduvaJpCXu5COuKEMtGztL7E51n6GaRj0t3/xdj97gYgcHILfZaoiRPxPoJ4K6fzikFeqiuep5DdARsf6NpTbXV5CyQTO/rw3k8kYHKH99+o4khxw2GzEjkvJXVVMakKQ1nRoZfeJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743859645; c=relaxed/simple;
	bh=1IQwDx5e2QyQqkPHEx2qmTbbLraZ7LsEB5sGwUNie1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQZer3i/uUB205+MN6zKOBoOgglkXW7ablVXMza95bxBt1kV7G05ziC6oVEei1YgdDKKkk2Is9CYii6q9DIxtORqh2VOzxVQvigD23zjtLHZFhQnKj3YgPPmbhM+sBx4Wy83DNN05Khq0j8bnAfm4DeQ8inVVo/SHurzkbZM3mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYTHZES1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYTHZES1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743859644; x=1775395644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1IQwDx5e2QyQqkPHEx2qmTbbLraZ7LsEB5sGwUNie1Q=;
  b=fYTHZES1RHvD2QaDaZBTcxj4+ynyPqbtuhqGXj1yT1bjNb/dY/qKnuP8
   X9MuWcek3t30+ncfOPYFDuPtjREa+VHjNAapYmpFExTk7o5hmXhvpAY8G
   29xA6HEgVLTd37eqfGDNSzN9IVXv4/fdp3crQXWKU9DBatevkjDr1KxB+
   eZ666XhTWOp9IQ9zwzd/3Me+7U2EYZ/7CnIapm/L7ARNsATlWsW0WGzo4
   t5205O2IKkThV48mroTUvdH2EANLY+xzYfTCnuPP+oppGN1ezT0tuebqo
   Q88psMbAsgs4QtKKO95LdhVmlBO01Jjg/NRzGiWqEc7lFyA6oXhOQ1bKZ
   w==;
X-CSE-ConnectionGUID: p8ciu2ffRDqrblr9fj1geQ==
X-CSE-MsgGUID: 6AQ0VjsBTG29cR1I8GShVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="70666761"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="70666761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 06:27:23 -0700
X-CSE-ConnectionGUID: AQ47wcu7QWatBn3s6RPoTQ==
X-CSE-MsgGUID: uyFZ5LNhS8WfEvLS6j6lbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="128035038"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2025 06:27:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u13YO-00022l-0I;
	Sat, 05 Apr 2025 13:27:20 +0000
Date: Sat, 5 Apr 2025 21:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next] veth: apply qdisc backpressure on full
 ptr_ring to reduce TX drops
Message-ID: <202504052142.TGI9fCwf-lkp@intel.com>
References: <174377814192.3376479.16481605648460889310.stgit@firesoul>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174377814192.3376479.16481605648460889310.stgit@firesoul>

Hi Jesper,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesper-Dangaard-Brouer/veth-apply-qdisc-backpressure-on-full-ptr_ring-to-reduce-TX-drops/20250404-225209
base:   net-next/main
patch link:    https://lore.kernel.org/r/174377814192.3376479.16481605648460889310.stgit%40firesoul
patch subject: [RFC PATCH net-next] veth: apply qdisc backpressure on full ptr_ring to reduce TX drops
config: arm64-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052142.TGI9fCwf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052142.TGI9fCwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052142.TGI9fCwf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_xmit':
>> drivers/net/veth.c:399:3: error: a label can only be part of a statement and a declaration is not a statement
      struct netdev_queue *txq = netdev_get_tx_queue(dev, rxq);
      ^~~~~~


vim +399 drivers/net/veth.c

   355	
   356	static netdev_tx_t veth_xmit(struct sk_buff *skb, struct net_device *dev)
   357	{
   358		struct veth_priv *rcv_priv, *priv = netdev_priv(dev);
   359		struct veth_rq *rq = NULL;
   360		struct net_device *rcv;
   361		int length = skb->len;
   362		bool use_napi = false;
   363		int ret, rxq;
   364	
   365		rcu_read_lock();
   366		rcv = rcu_dereference(priv->peer);
   367		if (unlikely(!rcv) || !pskb_may_pull(skb, ETH_HLEN)) {
   368			kfree_skb(skb);
   369			goto drop;
   370		}
   371	
   372		rcv_priv = netdev_priv(rcv);
   373		rxq = skb_get_queue_mapping(skb);
   374		if (rxq < rcv->real_num_rx_queues) {
   375			rq = &rcv_priv->rq[rxq];
   376	
   377			/* The napi pointer is available when an XDP program is
   378			 * attached or when GRO is enabled
   379			 * Don't bother with napi/GRO if the skb can't be aggregated
   380			 */
   381			use_napi = rcu_access_pointer(rq->napi) &&
   382				   veth_skb_is_eligible_for_gro(dev, rcv, skb);
   383		}
   384	
   385		skb_tx_timestamp(skb);
   386	
   387		ret = veth_forward_skb(rcv, skb, rq, use_napi);
   388		switch(ret) {
   389		case NET_RX_SUCCESS: /* same as NETDEV_TX_OK */
   390			if (!use_napi)
   391				dev_sw_netstats_tx_add(dev, 1, length);
   392			else
   393				__veth_xdp_flush(rq);
   394			break;
   395		case NETDEV_TX_BUSY:
   396			/* If a qdisc is attached to our virtual device, returning
   397			 * NETDEV_TX_BUSY is allowed.
   398			 */
 > 399			struct netdev_queue *txq = netdev_get_tx_queue(dev, rxq);
   400	
   401			if (!txq_has_qdisc(txq)) {
   402				dev_kfree_skb_any(skb);
   403				goto drop;
   404			}
   405			netif_tx_stop_queue(txq); /* Unconditional netif_txq_try_stop */
   406			if (use_napi)
   407				__veth_xdp_flush(rq);
   408	
   409			break;
   410		case NET_RX_DROP: /* same as NET_XMIT_DROP */
   411	drop:
   412			atomic64_inc(&priv->dropped);
   413			ret = NET_XMIT_DROP;
   414			break;
   415		default:
   416			net_crit_ratelimited("veth_xmit(%s): Invalid return code(%d)",
   417					     dev->name, ret);
   418		}
   419		rcu_read_unlock();
   420	
   421		return ret;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
