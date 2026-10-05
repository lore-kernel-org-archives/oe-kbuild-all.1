Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5964B0CB5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211895; cv=none; b=LjC67i9zNdWUk7VOpBp5MLbknGvgCMhYJzt4jix1MSojFOvuPhXb+Pw9S9dhjsRbmitgpkAhjPdv6+zJoOSpTPBhYYNEeoIrmxKFI4Fk0MxJKBguGsRx8luAVVp7yfKiv5o6JKie/qdbLF7pMU5CvDVmUTmQfBfqFjVNBMc5ADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211895; c=relaxed/simple;
	bh=PXjIMmPSTpW+48wEQ/nEWBlDBYc9w8+UcsPj4n+Af1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cBn/LX4272O00V6MaPf34WgaQm9PjG24jyj2rs+bTRpwvouBYp6Cvh53qI5fYFPCSEgxzhQoqmebw67xFtP5EV/miWXrUdwQwXfPyZ2ynHKBi1My/BOurTJN7UBRTOvQFBp8XlSrEuc4i9jxaXZ/EbMDMb4tk7c6dUyFm9qFQ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLER2Y5G; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLER2Y5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791211892; x=1822747892;
  h=date:from:to:cc:subject:message-id;
  bh=PXjIMmPSTpW+48wEQ/nEWBlDBYc9w8+UcsPj4n+Af1U=;
  b=jLER2Y5GFW7euSUF3w1HxxoDbvZu6KorZzdKOulJhr600bYNylGdcRbm
   WcQ2t02MYCzaBOU8HyfmPMa+S7jkOPpPYLrm8d24xqFa+g9xOr1AS+7a2
   l/8TJFoBu6E3qgpVHwYcf7eSfNE8IeUdBJX///ODmFfqxSWciN0L6NYUF
   JHAxL6Idwzlf7LPewZHgwfW/+gzTdAe6/upPaptS33qhqszNk4hWKZD7n
   RUCCxAcOPBa8S2uzfzaOzq7HEoSAAlKNLl4spGqGt+v++OJB5oR2uLatI
   8iFTqM3brJTedgmbDF+6OC8ccHKiNH4K9IayQararpm3L66kTtHJdUof5
   A==;
X-CSE-ConnectionGUID: wNoUg7TbTcqKTBUbrkuFcw==
X-CSE-MsgGUID: tqqZ4QmHRJGiM8rFuXiefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90653397"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90653397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:51:30 -0700
X-CSE-ConnectionGUID: nDnN+BQ8Q9q+5oH3x2pSJw==
X-CSE-MsgGUID: LiMvk1VjSVWK0Zf4AIf5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="284716229"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2026 07:51:28 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDk2H-000000000Bz-3nLn;
	Mon, 05 Oct 2026 14:51:25 +0000
Date: Mon, 05 Oct 2026 16:50:34 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Willem de Bruijn <willemb@google.com>
Subject: drivers/net/tun.c:2375:24: sparse: sparse: cast to
 non-scalar
Message-ID: <202610051613.beLfY9SJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: 23dad2d088dfc82cae1f5a936f8ff7ffebb38dd9 tun: no longer rely on RTNL in tun_fill_info()
date:   3 months ago
config: alpha-randconfig-r2300-20261005 (https://download.01.org/0day-ci/archive/20261005/202610051613.beLfY9SJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051613.beLfY9SJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 23dad2d088df ("tun: no longer rely on RTNL in tun_fill_info()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051613.beLfY9SJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/tun.c:2375:24: sparse: sparse: cast to non-scalar
>> drivers/net/tun.c:2375:24: sparse: sparse: cast from non-scalar
   drivers/net/tun.c:2376:24: sparse: sparse: cast to non-scalar
   drivers/net/tun.c:2376:24: sparse: sparse: cast from non-scalar

vim +2375 drivers/net/tun.c

  2370	
  2371	static int tun_fill_info(struct sk_buff *skb, const struct net_device *dev)
  2372	{
  2373		const struct tun_struct *tun = netdev_priv(dev);
  2374		unsigned int flags = READ_ONCE(tun->flags);
> 2375		kuid_t owner = READ_ONCE(tun->owner);
  2376		kgid_t group = READ_ONCE(tun->group);
  2377	
  2378		if (nla_put_u8(skb, IFLA_TUN_TYPE, flags & TUN_TYPE_MASK))
  2379			goto nla_put_failure;
  2380		if (uid_valid(owner) &&
  2381		    nla_put_u32(skb, IFLA_TUN_OWNER,
  2382				from_kuid_munged(current_user_ns(), owner)))
  2383			goto nla_put_failure;
  2384		if (gid_valid(group) &&
  2385		    nla_put_u32(skb, IFLA_TUN_GROUP,
  2386				from_kgid_munged(current_user_ns(), group)))
  2387			goto nla_put_failure;
  2388		if (nla_put_u8(skb, IFLA_TUN_PI, !(flags & IFF_NO_PI)))
  2389			goto nla_put_failure;
  2390		if (nla_put_u8(skb, IFLA_TUN_VNET_HDR, !!(flags & IFF_VNET_HDR)))
  2391			goto nla_put_failure;
  2392		if (nla_put_u8(skb, IFLA_TUN_PERSIST, !!(flags & IFF_PERSIST)))
  2393			goto nla_put_failure;
  2394		if (nla_put_u8(skb, IFLA_TUN_MULTI_QUEUE,
  2395			       !!(flags & IFF_MULTI_QUEUE)))
  2396			goto nla_put_failure;
  2397		if (flags & IFF_MULTI_QUEUE) {
  2398			if (nla_put_u32(skb, IFLA_TUN_NUM_QUEUES,
  2399					READ_ONCE(tun->numqueues)))
  2400				goto nla_put_failure;
  2401			if (nla_put_u32(skb, IFLA_TUN_NUM_DISABLED_QUEUES,
  2402					READ_ONCE(tun->numdisabled)))
  2403				goto nla_put_failure;
  2404		}
  2405	
  2406		return 0;
  2407	
  2408	nla_put_failure:
  2409		return -EMSGSIZE;
  2410	}
  2411	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
