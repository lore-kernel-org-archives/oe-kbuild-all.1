Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C55136658
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 01:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762134331; cv=none; b=eB+RNJqrBb6Rvx3UiZMuoU5e089Cm8XUjCl/+GGkijaZO5GoEc6udQFWkf0GVX8kVxFa2hOU6icm/uodsfQKxGVrhL9wnF6rDAsMOCdUlVxjuLxw7MGqmPyT4j5JIULLK0LROtp+j0hQKrMxzoFSS1w33U1GYDGCZ3Fis9usC0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762134331; c=relaxed/simple;
	bh=KvPMeHtk7J/U32y1QgHVo1Rhc9nlAP+csZP5Y85b/V0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUyVCss0pJb42l3rua6pkC80TZR4TT8ZQsChL8IIxZ51F4LrqX5m9A2Dd/pJZ0zFkISVkj2FUYSAXOXWUM7nYxxW/7AY77dWzKyBD67nRzha3Feo1ncpqHNUnAghfmK8bS9P4bmM+GEoUgDWAb+CYl1DruhTlWWAy3DEwsLgeG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtlN5HCl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtlN5HCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762134330; x=1793670330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KvPMeHtk7J/U32y1QgHVo1Rhc9nlAP+csZP5Y85b/V0=;
  b=YtlN5HClhmNZTnhkRULFpHAmuNkiBo/F0kgzeYV4L117g8nyCKy7WUOo
   GRpm1cx+BdwhtVFn0sOUepJNE1TRVXgU4KfwgZ2mDZfCSjLB7ZkI8Izsi
   7sCZnkFI1+rtB8WYseXf1hU6Sa3Ru5N7ggNL1L1GZrxYXhgz9ZrtAyELc
   gtft1t8GKDaZRyBElRGoaMsnbVN+Xv9ep1SV3CWdEeJTQP9hSnb8SwCl4
   8mt89J4/WAc/cfxj1dOBombpDkApyBc8xTG2o/RIaN2JQotqFhv0F5+D3
   eJHEOEpn/YBZmXan5hCrGOEbLwX4p86COinRfT3HrrAOutpk96MUAyJNx
   A==;
X-CSE-ConnectionGUID: 2ow61j9YTjq0FO0hFgJvIg==
X-CSE-MsgGUID: YvV8c6v0Qi2HPYpLICr8Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="86831963"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="86831963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 17:45:29 -0800
X-CSE-ConnectionGUID: mDn5tdkFRNuhDiwXvrvHNA==
X-CSE-MsgGUID: PWCNiEcXTbCrww2UwRQ/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187188344"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2025 17:45:27 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFjct-000Piu-1x;
	Mon, 03 Nov 2025 01:45:00 +0000
Date: Mon, 3 Nov 2025 09:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3083/3083] net/core/filter.c:12101:17: sparse:
 sparse: symbol 'bpf_xdp_change_dev' was not declared. Should it be static?
Message-ID: <202511030954.SJ0Hsr2z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5394cae209c4a4990d81be436ba17ae56fb09d16
commit: 94ac90c1b608e26cfd82703606d5e13667983b96 [3083/3083] bpf: Add bpf_*_change_dev kfunc
config: x86_64-randconfig-123-20251103 (https://download.01.org/0day-ci/archive/20251103/202511030954.SJ0Hsr2z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030954.SJ0Hsr2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030954.SJ0Hsr2z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/filter.c:1416:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1416:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1416:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:1494:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1494:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1494:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:2325:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] daddr @@     got unsigned int [usertype] ipv4_nh @@
   net/core/filter.c:2325:45: sparse:     expected restricted __be32 [usertype] daddr
   net/core/filter.c:2325:45: sparse:     got unsigned int [usertype] ipv4_nh
>> net/core/filter.c:12101:17: sparse: sparse: symbol 'bpf_xdp_change_dev' was not declared. Should it be static?
   net/core/filter.c:1931:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1931:43: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1931:43: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1934:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] old @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1934:36: sparse:     expected restricted __be16 [usertype] old
   net/core/filter.c:1934:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1934:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] new @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1934:42: sparse:     expected restricted __be16 [usertype] new
   net/core/filter.c:1934:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1937:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1937:36: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1937:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1937:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1937:42: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1937:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1982:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1982:59: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1982:59: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1985:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1985:52: sparse:     expected restricted __be16 [usertype] from
   net/core/filter.c:1985:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1985:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1985:58: sparse:     expected restricted __be16 [usertype] to
   net/core/filter.c:1985:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1988:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1988:52: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1988:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1988:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1988:58: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1988:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:2034:28: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum @@
   net/core/filter.c:2034:28: sparse:     expected unsigned long long
   net/core/filter.c:2034:28: sparse:     got restricted __wsum
   net/core/filter.c:2056:35: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] csum @@
   net/core/filter.c:2056:35: sparse:     expected unsigned long long
   net/core/filter.c:2056:35: sparse:     got restricted __wsum [usertype] csum
   net/core/filter.c:5895:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] spi @@     got restricted __be32 const [usertype] spi @@
   net/core/filter.c:5895:17: sparse:     expected unsigned int [usertype] spi
   net/core/filter.c:5895:17: sparse:     got restricted __be32 const [usertype] spi
   net/core/filter.c:5903:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] remote_ipv4 @@     got restricted __be32 const [usertype] a4 @@
   net/core/filter.c:5903:33: sparse:     expected unsigned int [usertype] remote_ipv4
   net/core/filter.c:5903:33: sparse:     got restricted __be32 const [usertype] a4

vim +/bpf_xdp_change_dev +12101 net/core/filter.c

 12100	
 12101	__bpf_kfunc int bpf_xdp_change_dev(struct xdp_md *xdp_ctx, u32 ifindex)
 12102	{
 12103		struct xdp_buff *xdp = (struct xdp_buff *)xdp_ctx;
 12104		struct hisock_xdp_buff *hxdp = (void *)xdp;
 12105		struct net_device *dev;
 12106	
 12107		WARN_ON_ONCE(!rcu_read_lock_held());
 12108	
 12109		if (!hxdp->skb)
 12110			return -EOPNOTSUPP;
 12111	
 12112		dev = dev_get_by_index_rcu(&init_net, ifindex);
 12113		if (!dev)
 12114			return -ENODEV;
 12115	
 12116		hxdp->skb->dev = dev;
 12117		return 0;
 12118	}
 12119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
