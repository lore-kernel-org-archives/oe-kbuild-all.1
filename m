Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1641D6AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735309103; cv=none; b=XtRGw/hpRttOzC47VDcioeg15PdqxRnKlCPmwtHfpC5Nfoxl5ncpiPCVMjOD6oyl/9DkBYfnChLcQyKuB6Y0LyvU/tRvsOmjs2VXlG2V/SCNahQiqTIE7KJ2wyvEiWcpD1P7YszMMU1T852SuEpr1a+z5Ly1S6QdzXVN1N5FyG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735309103; c=relaxed/simple;
	bh=b/+RRYrWXj0vmTjDLr319PuiJqHJYUynjslLWEkBSnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QN70VUH6wTZKmNcohuXGdkfNP2T1XEIPZdIuwQFNTBvNdBCKYKJMPI6CmyxfCGPpluDV46/YDGYkepxRWM3PRdA62m08i2jXcrRnpvW9GuzzemTd3dyzSwuf8qNXtXdYt6rRIIm86iUmGMgpW1q355gNsQbT8KuXdZM784hc94k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRMjBJ0q; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRMjBJ0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735309102; x=1766845102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b/+RRYrWXj0vmTjDLr319PuiJqHJYUynjslLWEkBSnA=;
  b=ZRMjBJ0qrwD5PJ3ho7MjzUQ1Yqw48c/upf4EXLTqZLT1ZAaGwznTX0Vr
   tS2c2aLQPQLqWFUo7sK3WBaxa/QcyhdNzvomXN014dIQxKwETUrGGWAq4
   hldft6qgPUEUgD+sU8rN/OzPsTYvpCNet66iECwNF8mXnqJ+nlnlbvT2X
   CXO3TJspfJEbWZPLKeQoimGx+v3M/+lt3BNyUR29DHjzKKvvDpOXl/Ftj
   XE5U5ILxtWKB2XWspxiPmPxO7DjP7iORSKjnk/0i2/OPzw+w8001iJ7Ew
   BSTHQQ8LvFEsJO+j3FAqKvXqtNey7MOa4czzuTMdYt8Ri6I/Kux28OCcd
   g==;
X-CSE-ConnectionGUID: SjiP7RO0SMisbpromeSKnw==
X-CSE-MsgGUID: TveiZTdORwuXxc3ODgP9Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46708481"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="46708481"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:18:21 -0800
X-CSE-ConnectionGUID: tNj04LN4Th+EbQ7CRSYCrQ==
X-CSE-MsgGUID: NJBgXSkQS9qx77tV0+96fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104791970"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Dec 2024 06:18:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRBAP-0003EM-2n;
	Fri, 27 Dec 2024 14:18:17 +0000
Date: Fri, 27 Dec 2024 22:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] alloc_tag: avoid current->alloc_tag manipulations
 when profiling is disabled
Message-ID: <202412272211.QSKlTw3B-lkp@intel.com>
References: <20241226211639.1357704-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226211639.1357704-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 431614f1580a03c1a653340c55ea76bd12a9403f]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/alloc_tag-skip-pgalloc_tag_swap-if-profiling-is-disabled/20241227-051744
base:   431614f1580a03c1a653340c55ea76bd12a9403f
patch link:    https://lore.kernel.org/r/20241226211639.1357704-1-surenb%40google.com
patch subject: [PATCH 1/2] alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
config: x86_64-randconfig-122-20241227 (https://download.01.org/0day-ci/archive/20241227/202412272211.QSKlTw3B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272211.QSKlTw3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272211.QSKlTw3B-lkp@intel.com/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
