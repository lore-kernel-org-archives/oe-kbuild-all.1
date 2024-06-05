Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1828161930
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 21:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717621270; cv=none; b=QJoa3EnxEMNMHmQxDPuDJiL8XZOum7BMDdsz/1F4rTDeIS6K9yO4/j3fUmEDldObFXUfaovhJ+lF5MQl0VAGCjpKjc0mYlzqyB/18MB53Ye0eVjpoQ3qxnYQjlP8YSLd8txCTS5z7o2Ua9/MkPdT/K62+xonKqteK+bXgxkRrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717621270; c=relaxed/simple;
	bh=IaZnPXCtcD0nGhckQNwmFEZPwCkw9yymsfdmJJjF6og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4cRFIS2NRMSortHd9rf/re5EpghIsnZel0E2LoLG59oJwxfhKIpi2crlnwiipRKt9u47k7J9vKibzVWXUzO2IJReF5C0PleSrzubg+sO5max8kHJ5h8y2wxhSxwY2VKyj5c3SKFOILstb5RwAL8fWe0XKGd+r7aC2fYOQVimSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ds38JSOX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ds38JSOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717621269; x=1749157269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaZnPXCtcD0nGhckQNwmFEZPwCkw9yymsfdmJJjF6og=;
  b=Ds38JSOXWF728CSmQHWxp3h0TPS9oHQatoof78ySGhpzX1lTFAsTbFkR
   lBNPeeV7/fVMtCcJndgLU6FdYiKmGsb9xEIPDeqJp8vypIqP0luV/e0IQ
   fBNDGkg4cW7WRzKmxXXoh6ArVz8EswS5YMAiU4gOuUvlE8c2YYUsCGqJH
   OU3C2sceHtVJa54+TlfWdO3tBfrCYUbRO9DnVqFAGZJOKFi+e2P6us6Ou
   CdXcptW7XrJ51Ccg+wui6Gfsf6oV9cn47nZx9qbW2Rg8y9PV8YkXBOe1/
   7UIaw6SUEl90gDB0Gfn4edsR8+WS4AJrdxywOb27L0quXrqcMdZQW8wX4
   g==;
X-CSE-ConnectionGUID: TNoDWY6mTBKZ8dkRq4+jcg==
X-CSE-MsgGUID: fUsGS4joQjubRgshmqH+CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14392937"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14392937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 14:01:09 -0700
X-CSE-ConnectionGUID: ApQqoc/IQ8eeQ2O4DtQ0Ow==
X-CSE-MsgGUID: Qer1XMT+RjWpThoaL+dlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="42829387"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Jun 2024 14:01:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sExkn-0002G0-0E;
	Wed, 05 Jun 2024 21:01:05 +0000
Date: Thu, 6 Jun 2024 05:01:02 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:combined_queue 23/32]
 net/ipv4/sysctl_net_ipv4.c:1599:9: error: implicit declaration of function
 'proc_fib_multipath_hash_set_seed'
Message-ID: <202406060420.ikN17yQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   f100b130c290d783d1945ed8b6a6a0d6baec69b9
commit: ed9843cdfe0f43d76a86776b998a5f78ecedc3c0 [23/32] net: ipv4: Add a sysctl to set multipath hash seed
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240606/202406060420.ikN17yQg-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060420.ikN17yQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060420.ikN17yQg-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/sysctl_net_ipv4.c: In function 'ipv4_sysctl_init_net':
>> net/ipv4/sysctl_net_ipv4.c:1599:9: error: implicit declaration of function 'proc_fib_multipath_hash_set_seed' [-Werror=implicit-function-declaration]
    1599 |         proc_fib_multipath_hash_set_seed(net, 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c: In function 'sysctl_ipv4_init':
>> net/ipv4/sysctl_net_ipv4.c:1635:27: error: 'proc_fib_multipath_hash_rand_seed' undeclared (first use in this function)
    1635 |         get_random_bytes(&proc_fib_multipath_hash_rand_seed,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:1635:27: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/proc_fib_multipath_hash_set_seed +1599 net/ipv4/sysctl_net_ipv4.c

  1561	
  1562	static __net_init int ipv4_sysctl_init_net(struct net *net)
  1563	{
  1564		size_t table_size = ARRAY_SIZE(ipv4_net_table);
  1565		struct ctl_table *table;
  1566	
  1567		table = ipv4_net_table;
  1568		if (!net_eq(net, &init_net)) {
  1569			int i;
  1570	
  1571			table = kmemdup(table, sizeof(ipv4_net_table), GFP_KERNEL);
  1572			if (!table)
  1573				goto err_alloc;
  1574	
  1575			for (i = 0; i < table_size; i++) {
  1576				if (table[i].data) {
  1577					/* Update the variables to point into
  1578					 * the current struct net
  1579					 */
  1580					table[i].data += (void *)net - (void *)&init_net;
  1581				} else {
  1582					/* Entries without data pointer are global;
  1583					 * Make them read-only in non-init_net ns
  1584					 */
  1585					table[i].mode &= ~0222;
  1586				}
  1587			}
  1588		}
  1589	
  1590		net->ipv4.ipv4_hdr = register_net_sysctl_sz(net, "net/ipv4", table,
  1591							    table_size);
  1592		if (!net->ipv4.ipv4_hdr)
  1593			goto err_reg;
  1594	
  1595		net->ipv4.sysctl_local_reserved_ports = kzalloc(65536 / 8, GFP_KERNEL);
  1596		if (!net->ipv4.sysctl_local_reserved_ports)
  1597			goto err_ports;
  1598	
> 1599		proc_fib_multipath_hash_set_seed(net, 0);
  1600	
  1601		return 0;
  1602	
  1603	err_ports:
  1604		unregister_net_sysctl_table(net->ipv4.ipv4_hdr);
  1605	err_reg:
  1606		if (!net_eq(net, &init_net))
  1607			kfree(table);
  1608	err_alloc:
  1609		return -ENOMEM;
  1610	}
  1611	
  1612	static __net_exit void ipv4_sysctl_exit_net(struct net *net)
  1613	{
  1614		const struct ctl_table *table;
  1615	
  1616		kfree(net->ipv4.sysctl_local_reserved_ports);
  1617		table = net->ipv4.ipv4_hdr->ctl_table_arg;
  1618		unregister_net_sysctl_table(net->ipv4.ipv4_hdr);
  1619		kfree(table);
  1620	}
  1621	
  1622	static __net_initdata struct pernet_operations ipv4_sysctl_ops = {
  1623		.init = ipv4_sysctl_init_net,
  1624		.exit = ipv4_sysctl_exit_net,
  1625	};
  1626	
  1627	static __init int sysctl_ipv4_init(void)
  1628	{
  1629		struct ctl_table_header *hdr;
  1630	
  1631		hdr = register_net_sysctl(&init_net, "net/ipv4", ipv4_table);
  1632		if (!hdr)
  1633			return -ENOMEM;
  1634	
> 1635		get_random_bytes(&proc_fib_multipath_hash_rand_seed,
  1636				 sizeof(proc_fib_multipath_hash_rand_seed));
  1637	
  1638		if (register_pernet_subsys(&ipv4_sysctl_ops)) {
  1639			unregister_net_sysctl_table(hdr);
  1640			return -ENOMEM;
  1641		}
  1642	
  1643		return 0;
  1644	}
  1645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
