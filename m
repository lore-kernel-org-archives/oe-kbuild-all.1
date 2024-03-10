Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C363224
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 13:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710078316; cv=none; b=GzTngh9Cezyod4/XwKvjLMdYewMv27CZez0th5VRS2MG/lAme/IZPTzIu3qEJ1Jv/P2CcRw0ur8llouSMvJ+fWax+U1Z+KFTMM17udKxYopk5U9mME3ASsdc7aq596/iMx4/T3YqsmZKKsc5wuEtwAlDhQHEoEqjtK3jPDi78uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710078316; c=relaxed/simple;
	bh=uvfXNba/olt5FLxcRHbuyCO+g76fVbdLDM6odfx+CGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XVveSVZFwwsrJ2blRzTjbahybf16Ofd7VFNEDHvAKK3Pk3tnAINi6L/yhmweaxcw6u6WIHAqWseVtH20x82mzEFNVV1KU1W2ngcp5/L0h0QFtJ6ihAcxGyuYnSzLBA864wkgTGfqh87mH3DLYfPtcZhKHy+zhqYfnbwxQaQW4po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njaCTtix; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njaCTtix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710078314; x=1741614314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvfXNba/olt5FLxcRHbuyCO+g76fVbdLDM6odfx+CGI=;
  b=njaCTtixf9IDkB5z1rRBQU7Jr8Pd2SNhFuQbymcgxZKs8IRR/w4V8mOc
   Xz2QRUc7zasIlPxfxMDkq9jItYIMmk71EPNktFrdtMawGoTkNSgaSNTEB
   5GlE+TieFJHOmXsQhZg53F8Q9XPXZIjQZZpDr7/N5AdAJ+mfOXd7iGkwu
   ExwZMvFCfRkW0AQu6fOzcrF2GReqSuEo32egIH3sP4TnicW7Dh0dFBdL4
   q0pbSVQGKowmV6RrJ/8dX9KUMyK0/z0mP0J0tolSBmA6syEI//19Bdlvk
   6fgVs6U4SAT9AQLdeHJDrhL8vN0y9OAqgmYHhnEjLp1L+3O7RMPQM0M78
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="30190800"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="30190800"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 06:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="41901722"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Mar 2024 06:45:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjJUA-0008Hb-2M;
	Sun, 10 Mar 2024 13:45:06 +0000
Date: Sun, 10 Mar 2024 21:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24954/27506]
 drivers/net/bonding/bond_main.c:4259:26: sparse: sparse: incompatible types
 in comparison expression (different address spaces):
Message-ID: <202403102138.yzG2hUVw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: de86dfa67b19a260c504f7b5b7ca00ba85975b23 [24954/27506] bonding:add the ability to xmit through the local node slaves first
config: x86_64-randconfig-r113-20240305 (https://download.01.org/0day-ci/archive/20240310/202403102138.yzG2hUVw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403102138.yzG2hUVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403102138.yzG2hUVw-lkp@intel.com/

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
