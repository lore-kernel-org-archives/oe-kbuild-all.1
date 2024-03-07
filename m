Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648D1130E3B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 18:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709835738; cv=none; b=bEUUaMzSeyWiOxuJ36iL3k2LO4N2oxs6J34U4Hw+aHbBmxuRg38g36u8UFW+qwmMD4EVNR2wwtCbTBb8NpJ4TgFcYiYsSHGiDe1JmWp7fPrc/n8L7XDMaYZnJgvvAGtm33NeOKsPqcKCwv8RRkRlZXUNr4bdfvz75G5zYE5tWoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709835738; c=relaxed/simple;
	bh=j/Msi3iTiKoPCS7ogeSn6UKsnWMTWUlLYKmWfer3FGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4cOJ9J7PDXfoQ7HtogUV/WN9k0AiAcmxuQ/3kxeHj/MHE26UCFoVyBN2d6pl5zi/ksmWRo+TzgHgWkXWXgsr7DzolkVK3odcMzPkJcE5abkuPzRb1jxJn+6VRTRGd2wrYtpxYr1Y6i/PRN58KqnDP/ZvUWokkgYKObDyg7QvLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I47cWjD0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I47cWjD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709835736; x=1741371736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/Msi3iTiKoPCS7ogeSn6UKsnWMTWUlLYKmWfer3FGI=;
  b=I47cWjD0NxgSIRbPi6MyYeYkpJzdCoKyDSW2UIRw745v3KVlJm/+nvSJ
   7kArgV/xl1F0k1bs3x2zRm7dfmyfIfxEgOrvdZmWiQ3WOuxanOvuJLup2
   TfW0OqR7S35bBAaKB0/Mv12oPLA1+pApQRWe2SGhk98tx9OZyEeEYftrY
   6dqR+vACYcdqqkQPLKR+Z5wGIRfu5KgEt3/aLEyUkxDo61L64vOMJWxcD
   6LTYvt+/tLZ6UCTb2VlQlgdqrLa6XhABPLTCE8lkR4TV7kxAL+JU1xHcW
   wkpIpmGNAEcfQGrP6rRU/n/7gHvQJVmBehCNyujQdDUx5no5B40yB4ciz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15933179"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="15933179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 10:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14693760"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2024 10:22:12 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riINe-0005UT-12;
	Thu, 07 Mar 2024 18:22:10 +0000
Date: Fri, 8 Mar 2024 02:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24954/27434]
 drivers/net/bonding/bond_main.c:4259:26: sparse: sparse: incompatible types
 in comparison expression (different address spaces):
Message-ID: <202403080233.0Qw3xVUt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: de86dfa67b19a260c504f7b5b7ca00ba85975b23 [24954/27434] bonding:add the ability to xmit through the local node slaves first
config: x86_64-randconfig-r113-20240305 (https://download.01.org/0day-ci/archive/20240308/202403080233.0Qw3xVUt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080233.0Qw3xVUt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080233.0Qw3xVUt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/bonding/bond_main.c:2451:26: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/bonding/bond_main.c:2457:20: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/bonding/bond_main.c:2504:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] vlan_proto @@     got int @@
   drivers/net/bonding/bond_main.c:2504:40: sparse:     expected restricted __be16 [usertype] vlan_proto
   drivers/net/bonding/bond_main.c:2504:40: sparse:     got int
>> drivers/net/bonding/bond_main.c:4259:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/net/bonding/bond_main.c:4259:26: sparse:    struct bond_up_slave [noderef] __rcu *
   drivers/net/bonding/bond_main.c:4259:26: sparse:    struct bond_up_slave *
   drivers/net/bonding/bond_main.c:3332:60: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/bonding/bond_main.c:3332:60: sparse: sparse: restricted __be16 degrades to integer

vim +4259 drivers/net/bonding/bond_main.c

  4221	
  4222	static netdev_tx_t bond_xmit_broadcast(struct sk_buff *skb,
  4223					       struct net_device *bond_dev);
  4224	/* Use this Xmit function for 3AD as well as XOR modes. The current
  4225	 * usable slave array is formed in the control path. The xmit function
  4226	 * just calculates hash and sends the packet out.
  4227	 */
  4228	static netdev_tx_t bond_3ad_xor_xmit(struct sk_buff *skb,
  4229					     struct net_device *dev)
  4230	{
  4231		struct bonding *bond = netdev_priv(dev);
  4232		struct slave *slave;
  4233		struct bond_up_slave *slaves;
  4234		unsigned int count;
  4235		struct bond_up_bynd *slaves_bynd;
  4236	
  4237		/* Broadcast arp or nd to all slaves. */
  4238		if (bond->params.broadcast_arp && ntohs(skb->protocol) == ETH_P_ARP)
  4239			return bond_xmit_broadcast(skb, dev);
  4240	
  4241		if (bond->params.broadcast_nd && ntohs(skb->protocol) == ETH_P_IPV6 &&
  4242		    pskb_may_pull(skb,
  4243			sizeof(struct ipv6hdr) + sizeof(struct icmp6hdr)) &&
  4244		    ipv6_hdr(skb)->nexthdr == IPPROTO_ICMPV6) {
  4245			struct icmp6hdr *icmph = icmp6_hdr(skb);
  4246	
  4247			if ((icmph->icmp6_type ==
  4248			     NDISC_NEIGHBOUR_SOLICITATION) ||
  4249			    (icmph->icmp6_type ==
  4250			     NDISC_NEIGHBOUR_ADVERTISEMENT))
  4251				return bond_xmit_broadcast(skb, dev);
  4252		}
  4253	
  4254		if (!bond_localnodefirst || !bond_localnodefirst_support) {
  4255			slaves = rcu_dereference(bond->usable_slaves);
  4256		} else {
  4257			/* select local slave first*/
  4258			slaves_bynd = rcu_dereference(bond->slave_arr_bynd);
> 4259			slaves = rcu_dereference(slaves_bynd->arr[numa_node_id()]);
  4260			if (!slaves || !slaves->count)
  4261				slaves = rcu_dereference(bond->usable_slaves);
  4262		}
  4263		count = slaves ? READ_ONCE(slaves->count) : 0;
  4264		if (likely(count)) {
  4265			slave = slaves->arr[bond_xmit_hash(bond, skb) % count];
  4266			bond_dev_queue_xmit(bond, skb, slave->dev);
  4267		} else {
  4268			bond_tx_drop(dev, skb);
  4269		}
  4270	
  4271		return NETDEV_TX_OK;
  4272	}
  4273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
