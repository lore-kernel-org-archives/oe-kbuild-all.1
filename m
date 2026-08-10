Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2991537E5EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786332797; cv=none; b=FCscqrligVuKkdMs2576qoiP6ehUB7EJoGNyGZPEgn8WXU6gg8cDYBacxt5F+woyjxz5o1VHUJSRwY6BdRoi2l2e2Tw1TFsZP69wKximSG/jLGLLY6CIVs13OhfmJn6fuqmxmP+T0G9jKO75TxxWsu+VvThcWo7WhM3m+I/2hW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786332797; c=relaxed/simple;
	bh=L1qkOFBmZNjGZyT5urumiLAMa6dvuN1uZ+MYO1fVeRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GokUQAqg10fPZpgEgmx4jDUKx+cMXr0iEJbkyiOD8dRTNJA2/+mHZefMdi9dzjFIz05sa0eVsPmYEo6WSbMy7NhKnoz+FBGgMaFtah28UrmYxlM2AKEF0ueJsR1j0W6QBbxs2juCpsIuolQHe5NrhOC1DTjEUT4L+5gqsMAJUHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnUitXni; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnUitXni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786332795; x=1817868795;
  h=date:from:to:cc:subject:message-id;
  bh=L1qkOFBmZNjGZyT5urumiLAMa6dvuN1uZ+MYO1fVeRg=;
  b=dnUitXniXmzethACFzlJapWjVudSNTKkaE326BoQ59JjXmjRd0wC5iFe
   F6iUb2GzcffD70HqR1WUDapmYYUvO27gvbiajNeB4OLMCElbLN6p0sokk
   K4xkpsoUDxytqqGswjjYvftZTpwckbxZxEw0MWbNAAsY3t9LCIYKOk3lx
   xHpd3LQndzz4/MhmHD984lDUwkA63HuyJ6TJQG7daXfJl58hDTJcupV68
   K3TRA46pOThT5Te8Mg+6A0Mu6cIN3+o5CMFb/F4MEQKcfHe8ycj2XnpAc
   CB35XgEoAXOb3Wm8VPvY4HOv07s7NNkDp7g1AgDGQ3pGmD0LiItACAdST
   w==;
X-CSE-ConnectionGUID: jgk3ge3NRWSDg8w9snoc4Q==
X-CSE-MsgGUID: tl/2Kv+uQKClS0QfcMTcVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97493437"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97493437"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 20:33:12 -0700
X-CSE-ConnectionGUID: PjfnkVhfTTGRMpsgPE4RYA==
X-CSE-MsgGUID: a1KoXtEbTymfGYUzEzl+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="260316883"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Aug 2026 20:33:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtGlA-00000000Mhh-01a4;
	Mon, 10 Aug 2026 03:33:08 +0000
Date: Mon, 10 Aug 2026 11:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Willem de Bruijn <willemb@google.com>
Subject: [linux-next:master 4018/13846] drivers/net/tun.c:2375:24:
 sparse: sparse: cast to non-scalar
Message-ID: <202608101002.AO7X3ZCH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 23dad2d088dfc82cae1f5a936f8ff7ffebb38dd9 [4018/13846] tun: no longer rely on RTNL in tun_fill_info()
config: alpha-randconfig-r134-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101002.AO7X3ZCH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608101002.AO7X3ZCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608101002.AO7X3ZCH-lkp@intel.com/

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
