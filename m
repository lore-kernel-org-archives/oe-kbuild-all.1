Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3F3A8736
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542938; cv=none; b=LKscdHuvEppYOLa36MJUS/RrWH79CrUMzFFcSWqlhN7LWxEg5rxQQixlP8BETbUDYcOxu5rS5aLIjrpGoE0jVwy5N/D3qDbu47+paL3ryPH6XS/gEc2RnMgwne1Akn+7la5EUhoRNph7qYUgN5hBzJtD0GzzMb+xjGZOYDx7D0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542938; c=relaxed/simple;
	bh=npVlwqN7F2F6TbVEj8IrKzE2qZgKFn1fGBTyy/bAoBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ITChoiGB6pdKkIDmp12mBzaORZEZGNlUljiXzxt4ewL/u+Ocp+52nfHKy4oXfbGx5Ha3X3OvDZcyNeKq0HoaTEfsVxl41nCopcK82Cd32SLSQ8vfZ6Itd+MCrG7qiwzDnMw3xRVwhAZmNBH21ULgzbJhak4Vx9HhnJkAI6WWf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uhaq2eql; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uhaq2eql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777542937; x=1809078937;
  h=date:from:to:cc:subject:message-id;
  bh=npVlwqN7F2F6TbVEj8IrKzE2qZgKFn1fGBTyy/bAoBw=;
  b=Uhaq2eqlgoSiQDdEuIzq1CDxPUhCh6DtPa89vG0BULhF84MlNZU1Dylk
   mSPzjmWEQC9XtjPjc+svftfcalwfB/2XN0wTuaPvD2pYmfepfULHvyeU3
   0SN3/k8hby+PsvkZGrE7Y0OFhbINXJMMCAyIj0qR6UN8BtEisywPPzBk4
   Ig1BSv00Sbu118ggtosO6UCN6rw+AtD8gaYrAXbQBy28htmDPNo/bSaGn
   UbNQlBuEh7lor4eLoW1n9f3Xq8dMkL3CLlRqs4x3edM0dp+GyNkCvGvS4
   V3N8sZ3/4fFWU1P6jmpu01NMcAq65TezYESrdVSuWsl+9C9Vj4CV1Sul+
   A==;
X-CSE-ConnectionGUID: f7SEsTYMRRKVqT6ykwSd4w==
X-CSE-MsgGUID: M6RoBdZmSJmoC2PUCdUFjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81065526"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="81065526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 02:55:36 -0700
X-CSE-ConnectionGUID: J3SXjjh/RTihRT0cb9lI3Q==
X-CSE-MsgGUID: p1VMTUztRmSAbFfV7tjRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234428210"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2026 02:55:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIO7I-000000004nJ-1sHx;
	Thu, 30 Apr 2026 09:55:32 +0000
Date: Thu, 30 Apr 2026 11:55:07 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/netfilter/nf_flow_table_offload.c:1080:60: error:
 incompatible type for argument 1 of 'dev_net'
Message-ID: <202604301130.yR12CSul-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-flow_offload-let-drivers-report-byte-counter-semantics/20260416-222603
head:   dcabaf6b4b67a90cc0e0a91709c382a82c29f182
commit: 73b3a08b530034da560fff6b3270293990e1110d nf_flow_table: convert hw byte counts and update sub-interface stats
date:   2 weeks ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260430/202604301130.yR12CSul-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301130.yR12CSul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301130.yR12CSul-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/nf_flow_table_offload.c: In function 'flow_offload_update_encap_stats':
>> net/netfilter/nf_flow_table_offload.c:1080:60: error: incompatible type for argument 1 of 'dev_net'
    1080 |                 dev = dev_get_by_index_rcu(dev_net(flow->ct->ct_net),
         |                                                    ~~~~~~~~^~~~~~~~
         |                                                            |
         |                                                            possible_net_t
   In file included from include/linux/netfilter.h:16,
                    from net/netfilter/nf_flow_table_offload.c:5:
   include/linux/netdevice.h:2745:46: note: expected 'const struct net_device *' but argument is of type 'possible_net_t'
    2745 | struct net *dev_net(const struct net_device *dev)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   net/netfilter/nf_flow_table_offload.c:1095:60: error: incompatible type for argument 1 of 'dev_net'
    1095 |                 dev = dev_get_by_index_rcu(dev_net(flow->ct->ct_net),
         |                                                    ~~~~~~~~^~~~~~~~
         |                                                            |
         |                                                            possible_net_t
   include/linux/netdevice.h:2745:46: note: expected 'const struct net_device *' but argument is of type 'possible_net_t'
    2745 | struct net *dev_net(const struct net_device *dev)
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~~


vim +/dev_net +1080 net/netfilter/nf_flow_table_offload.c

  1058	
  1059	/* Update sub-interface (VLAN, PPPoE) stats for hw-offloaded flows.
  1060	 *
  1061	 * The driver reports L3 (IP) bytes. Each sub-interface in the
  1062	 * software path sees the frame with the headers of all layers
  1063	 * BELOW it still present, so we add back inner-layer overhead.
  1064	 *
  1065	 * encap[] is ordered outermost to innermost, so walk from the
  1066	 * innermost layer outward, accumulating overhead as we go.
  1067	 */
  1068	static void flow_offload_update_encap_stats(struct flow_offload *flow,
  1069						    struct flow_offload_tuple *tuple,
  1070						    bool rx, u64 pkts, u64 bytes)
  1071	{
  1072		struct net_device *dev;
  1073		int inner_hlen = 0;
  1074		int i;
  1075	
  1076		for (i = tuple->encap_num - 1; i >= 0; i--) {
  1077			if (tuple->in_vlan_ingress & BIT(i))
  1078				continue;
  1079	
> 1080			dev = dev_get_by_index_rcu(dev_net(flow->ct->ct_net),
  1081						   tuple->encap_ifidx[i]);
  1082			if (dev)
  1083				flow_offload_encap_netstats(dev,
  1084							    tuple->encap[i].proto, rx,
  1085							    pkts,
  1086							    bytes + inner_hlen * pkts);
  1087	
  1088			inner_hlen += flow_offload_encap_hlen(tuple, i);
  1089		}
  1090	
  1091		/* Bridge device sits outside all encap layers -- it sees
  1092		 * L3 bytes plus the full encap overhead.
  1093		 */
  1094		if (tuple->bridge_ifidx) {
  1095			dev = dev_get_by_index_rcu(dev_net(flow->ct->ct_net),
  1096						   tuple->bridge_ifidx);
  1097			if (dev && dev->tstats)
  1098				flow_offload_encap_netstats(dev, 0, rx, pkts,
  1099							    bytes + inner_hlen * pkts);
  1100		}
  1101	}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
