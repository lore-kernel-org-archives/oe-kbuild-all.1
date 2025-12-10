Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CBA263F5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 23:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765409953; cv=none; b=CxhbHJf8sPwYQPnxV8jzWWYPeuSIBed7VzdZ2N/wLsxNByrD+Br7tk8gNz6JXtmHrZT6nIszXXIOzyRpkkMm0vmHAf85D4ZnbnDk3SqffkbMcXg7ZevFef85XT0ujyVYjAyGP+C12APiUFFKR6c1PaQNtnIpEPBywOK6G1Xal/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765409953; c=relaxed/simple;
	bh=zkO0pZKAlhPJJKawaGoprcHejdVZs09dRM1SrVJ/MP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXD4z4x7ehRnenCDRTdn4ksQxC1tplNhO+vJywCA7fEAlWZshvXcmZDuRGlSILvizTJvXUFwvFimLE22f9d2BdTkUGtKoJXc0lEbfQNRPpJRT5URlku9Cq13ULZ09cTQ4IUfwROtNkwpBRMNRvnR7ULLuHCbBraLIj2iIOAthV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTQP72Bl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTQP72Bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765409949; x=1796945949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zkO0pZKAlhPJJKawaGoprcHejdVZs09dRM1SrVJ/MP0=;
  b=DTQP72Bl7KhmE61FKND7fR8Xv5ZxHMcMXvHfRSM3HEkHnYsHb+ZzTANU
   Q1sW5kiV6byo1ZL/XZnr6fvRrbKgsv/4AZY9KTlcFCf4qoKi9KIyOez03
   yDJmlFb15XPzweIOpnTqEuehfKk2dhamQcjbFZx7l5XYTHl9riTq+ci05
   KG5pRhKS0b+G/P99c5mb8ZBnGeVjDOYU7P319ePmNOwcvle5FDImN2FhH
   nugSeG+ZIe/5CKmwRV6V6SiBLwIOTkYmoEF7+iL+mpN31sNFjUss7jml5
   1FtXep9ExLb6l9fbmdbqe4vo6enc2OYWIL6rkxy38LxBAetpMK/dnVcW/
   Q==;
X-CSE-ConnectionGUID: /zN9CC45QgyiD/MmAoqgsQ==
X-CSE-MsgGUID: vS2GH1oUQOKRry9mukE1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69975598"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="69975598"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 15:39:06 -0800
X-CSE-ConnectionGUID: bfsQFZOhQJuod1OeOhJLxg==
X-CSE-MsgGUID: KzEwnuQdTiqXD7Mj5FbZ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196930357"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Dec 2025 15:39:04 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTTlu-000000003sL-0yTk;
	Wed, 10 Dec 2025 23:39:02 +0000
Date: Thu, 11 Dec 2025 07:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: net/ipv6/seg6.c:430:24: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202512110721.RFqufwXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   11 months ago
config: i386-randconfig-063-20251211 (https://download.01.org/0day-ci/archive/20251211/202512110721.RFqufwXf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110721.RFqufwXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110721.RFqufwXf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv6/seg6.c:252:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct in6_addr *t_old @@     got struct in6_addr [noderef] __rcu *tun_src @@
   net/ipv6/seg6.c:252:15: sparse:     expected struct in6_addr *t_old
   net/ipv6/seg6.c:252:15: sparse:     got struct in6_addr [noderef] __rcu *tun_src
>> net/ipv6/seg6.c:430:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct in6_addr [noderef] __rcu *tun_src @@     got void *[assigned] _res @@
   net/ipv6/seg6.c:430:24: sparse:     expected struct in6_addr [noderef] __rcu *tun_src
   net/ipv6/seg6.c:430:24: sparse:     got void *[assigned] _res

vim +430 net/ipv6/seg6.c

4f4853dc1c9c19 David Lebrun 2016-11-08  419  
915d7e5e5930b4 David Lebrun 2016-11-08  420  static int __net_init seg6_net_init(struct net *net)
915d7e5e5930b4 David Lebrun 2016-11-08  421  {
915d7e5e5930b4 David Lebrun 2016-11-08  422  	struct seg6_pernet_data *sdata;
915d7e5e5930b4 David Lebrun 2016-11-08  423  
915d7e5e5930b4 David Lebrun 2016-11-08  424  	sdata = kzalloc(sizeof(*sdata), GFP_KERNEL);
915d7e5e5930b4 David Lebrun 2016-11-08  425  	if (!sdata)
915d7e5e5930b4 David Lebrun 2016-11-08  426  		return -ENOMEM;
915d7e5e5930b4 David Lebrun 2016-11-08  427  
915d7e5e5930b4 David Lebrun 2016-11-08  428  	mutex_init(&sdata->lock);
915d7e5e5930b4 David Lebrun 2016-11-08  429  
915d7e5e5930b4 David Lebrun 2016-11-08 @430  	sdata->tun_src = kzalloc(sizeof(*sdata->tun_src), GFP_KERNEL);
915d7e5e5930b4 David Lebrun 2016-11-08  431  	if (!sdata->tun_src) {
915d7e5e5930b4 David Lebrun 2016-11-08  432  		kfree(sdata);
915d7e5e5930b4 David Lebrun 2016-11-08  433  		return -ENOMEM;
915d7e5e5930b4 David Lebrun 2016-11-08  434  	}
915d7e5e5930b4 David Lebrun 2016-11-08  435  
915d7e5e5930b4 David Lebrun 2016-11-08  436  	net->ipv6.seg6_data = sdata;
915d7e5e5930b4 David Lebrun 2016-11-08  437  
f04ed7d277e842 MichelleJin  2021-09-27  438  	if (seg6_hmac_net_init(net)) {
f04ed7d277e842 MichelleJin  2021-09-27  439  		kfree(rcu_dereference_raw(sdata->tun_src));
23b08260481ca5 MichelleJin  2021-10-02  440  		kfree(sdata);
f04ed7d277e842 MichelleJin  2021-09-27  441  		return -ENOMEM;
acaea0d5a63406 Zhang Mingyu 2021-11-03  442  	}
4f4853dc1c9c19 David Lebrun 2016-11-08  443  
915d7e5e5930b4 David Lebrun 2016-11-08  444  	return 0;
915d7e5e5930b4 David Lebrun 2016-11-08  445  }
915d7e5e5930b4 David Lebrun 2016-11-08  446  

:::::: The code at line 430 was first introduced by commit
:::::: 915d7e5e5930b4f01d0971d93b9b25ed17d221aa ipv6: sr: add code base for control plane support of SR-IPv6

:::::: TO: David Lebrun <david.lebrun@uclouvain.be>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
