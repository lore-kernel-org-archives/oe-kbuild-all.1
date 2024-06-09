Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1A11BF24
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717932729; cv=none; b=u2N0CGl8VMvwR1bOw2VC0crL0/Habfkys3BX0wFGFF9wxNx0ngAfvA+SdL4U9QBy/EamGrzzHwskN1gG432dHVbyJR2D/dUwjn7IkEbQBsqpLvK7hesn1ESRCU0qgoT4rcs4xFQVR9d85RnicvAk8mC1gS4KBBkvG4KrpqBcMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717932729; c=relaxed/simple;
	bh=3d3nZrjOYj158OPLTkgCjQSOYs+zviJv72wdHF6RGTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NG+fOZYpHkP639mbM4iXJhKm1xce0ivZgJuxTA2LL+jWx1iVBzVfOHYnRCfx6fJ8DTFscp+dG1pNjmeDghaD1rSukSDTmkJTOeJQhCXJ2d6d3oqGxoEb8nGIcoHsQDsQP1VK4dwbns3IA9fNhBvv1gTlH3XQLGq3SdSklmElTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WT1Z3f3P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WT1Z3f3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717932727; x=1749468727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3d3nZrjOYj158OPLTkgCjQSOYs+zviJv72wdHF6RGTE=;
  b=WT1Z3f3Py/7d+PW11PcLHrZdXnH2WlheVlbdzoi26gK8rCTY3w0Y914Q
   KZ/sVAt/oygVo1XKm/xqc0pTEAHdnltFJ0XrtzrIu3P/SgQPDME4cO47w
   1MSdC2PQX/bS2RmZgYJP+8pfO1cCWBOqzx582YVMV6BDDvtmAcHY+Q9cS
   54gGwRML5JbZSTiwyKhc/iZgcuxa/ENZULQhgahxbtrQ8Nc1sd2+g9Bqe
   pmKF0PE9KNb+yHMRNQ30iT4nwOICyozzvB/QUdX4Sg5TgYSkxXAfWD5gl
   pIYkH+OxAJdK+2ktZgG6BN8C2byWUdyhTFhm+cM76BkFWk1Fu2fnLDEQs
   g==;
X-CSE-ConnectionGUID: 2k0dbHq2RJCsDGMaACZg0w==
X-CSE-MsgGUID: bB11pYgWStygQFg+HQYJPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="18393438"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="18393438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 04:32:07 -0700
X-CSE-ConnectionGUID: 9zuwhdIsRYSSKyd0+aF3wA==
X-CSE-MsgGUID: Jmelufl+R6K3rEClnfVNyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="38715691"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2024 04:32:05 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGGmJ-00018o-0a;
	Sun, 09 Jun 2024 11:32:03 +0000
Date: Sun, 9 Jun 2024 19:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Xing <kernelxing@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 4263/4582] net/core/dev.c:4551:17: error: 'head'
 undeclared
Message-ID: <202406091927.iEkVpYSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
commit: 9b6a30febddf4857cb4c367f5294bb6118340e30 [4263/4582] net: allow rps/rfs related configs to be switched
config: arm64-randconfig-r111-20240609 (https://download.01.org/0day-ci/archive/20240609/202406091927.iEkVpYSa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240609/202406091927.iEkVpYSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091927.iEkVpYSa-lkp@intel.com/

Note: the linux-next/master HEAD d35b2284e966c0bef3e2182a5c5ea02177dd32e4 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   net/core/dev.c: In function 'set_rps_cpu':
>> net/core/dev.c:4551:17: error: 'head' undeclared (first use in this function)
    4551 |                 head = READ_ONCE(per_cpu(softnet_data, next_cpu).input_queue_head);
         |                 ^~~~
   net/core/dev.c:4551:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/head +4551 net/core/dev.c

adc9300e78e609 Eric Dumazet  2011-11-17  4513  
c445477d74ab37 Ben Hutchings 2011-01-19  4514  static struct rps_dev_flow *
c445477d74ab37 Ben Hutchings 2011-01-19  4515  set_rps_cpu(struct net_device *dev, struct sk_buff *skb,
c445477d74ab37 Ben Hutchings 2011-01-19  4516  	    struct rps_dev_flow *rflow, u16 next_cpu)
c445477d74ab37 Ben Hutchings 2011-01-19  4517  {
a31196b07f8034 Eric Dumazet  2015-04-25  4518  	if (next_cpu < nr_cpu_ids) {
c445477d74ab37 Ben Hutchings 2011-01-19  4519  #ifdef CONFIG_RFS_ACCEL
c445477d74ab37 Ben Hutchings 2011-01-19  4520  		struct netdev_rx_queue *rxqueue;
c445477d74ab37 Ben Hutchings 2011-01-19  4521  		struct rps_dev_flow_table *flow_table;
c445477d74ab37 Ben Hutchings 2011-01-19  4522  		struct rps_dev_flow *old_rflow;
84b6823cd96b38 Jason Xing    2024-04-18  4523  		u32 flow_id, head;
c445477d74ab37 Ben Hutchings 2011-01-19  4524  		u16 rxq_index;
c445477d74ab37 Ben Hutchings 2011-01-19  4525  		int rc;
c445477d74ab37 Ben Hutchings 2011-01-19  4526  
c445477d74ab37 Ben Hutchings 2011-01-19  4527  		/* Should we steer this flow to a different hardware queue? */
69a19ee60d5d5a Ben Hutchings 2011-02-15  4528  		if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
69a19ee60d5d5a Ben Hutchings 2011-02-15  4529  		    !(dev->features & NETIF_F_NTUPLE))
c445477d74ab37 Ben Hutchings 2011-01-19  4530  			goto out;
c445477d74ab37 Ben Hutchings 2011-01-19  4531  		rxq_index = cpu_rmap_lookup_index(dev->rx_cpu_rmap, next_cpu);
c445477d74ab37 Ben Hutchings 2011-01-19  4532  		if (rxq_index == skb_get_rx_queue(skb))
c445477d74ab37 Ben Hutchings 2011-01-19  4533  			goto out;
c445477d74ab37 Ben Hutchings 2011-01-19  4534  
c445477d74ab37 Ben Hutchings 2011-01-19  4535  		rxqueue = dev->_rx + rxq_index;
c445477d74ab37 Ben Hutchings 2011-01-19  4536  		flow_table = rcu_dereference(rxqueue->rps_flow_table);
c445477d74ab37 Ben Hutchings 2011-01-19  4537  		if (!flow_table)
c445477d74ab37 Ben Hutchings 2011-01-19  4538  			goto out;
61b905da33ae25 Tom Herbert   2014-03-24  4539  		flow_id = skb_get_hash(skb) & flow_table->mask;
c445477d74ab37 Ben Hutchings 2011-01-19  4540  		rc = dev->netdev_ops->ndo_rx_flow_steer(dev, skb,
c445477d74ab37 Ben Hutchings 2011-01-19  4541  							rxq_index, flow_id);
c445477d74ab37 Ben Hutchings 2011-01-19  4542  		if (rc < 0)
c445477d74ab37 Ben Hutchings 2011-01-19  4543  			goto out;
c445477d74ab37 Ben Hutchings 2011-01-19  4544  		old_rflow = rflow;
c445477d74ab37 Ben Hutchings 2011-01-19  4545  		rflow = &flow_table->flows[flow_id];
f00bf5dc83202f Jason Xing    2024-04-18  4546  		WRITE_ONCE(rflow->filter, rc);
f00bf5dc83202f Jason Xing    2024-04-18  4547  		if (old_rflow->filter == rc)
f00bf5dc83202f Jason Xing    2024-04-18  4548  			WRITE_ONCE(old_rflow->filter, RPS_NO_FILTER);
c445477d74ab37 Ben Hutchings 2011-01-19  4549  	out:
c445477d74ab37 Ben Hutchings 2011-01-19  4550  #endif
84b6823cd96b38 Jason Xing    2024-04-18 @4551  		head = READ_ONCE(per_cpu(softnet_data, next_cpu).input_queue_head);
84b6823cd96b38 Jason Xing    2024-04-18  4552  		rps_input_queue_tail_save(&rflow->last_qtail, head);
c445477d74ab37 Ben Hutchings 2011-01-19  4553  	}
c445477d74ab37 Ben Hutchings 2011-01-19  4554  
f7b60cce847036 Jason Xing    2024-04-18  4555  	WRITE_ONCE(rflow->cpu, next_cpu);
c445477d74ab37 Ben Hutchings 2011-01-19  4556  	return rflow;
c445477d74ab37 Ben Hutchings 2011-01-19  4557  }
c445477d74ab37 Ben Hutchings 2011-01-19  4558  

:::::: The code at line 4551 was first introduced by commit
:::::: 84b6823cd96b38c40b3b30beabbfa48d92990e1a net: rps: protect last_qtail with rps_input_queue_tail_save() helper

:::::: TO: Jason Xing <kernelxing@tencent.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
