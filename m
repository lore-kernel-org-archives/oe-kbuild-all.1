Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15524B4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726834970; cv=none; b=Kxlir/InvmHK7Vi5BNkJM+bxCzO7jXmGpy4KE6d8UD7lOftZp3opAxe/CKSl+VoSLC5+xASkAK9P9JRCwkt7MXQI1Ok4FqBSwOPzeYREBIVtp5EHmGIUmHAJk51hO4GGgWCawx34QrxJgiIfKrRtKYeoTTHuTwbDB6B2U52WESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726834970; c=relaxed/simple;
	bh=HMWW2sLwFdiqJVrNS3cHK9xqZmCqHq8A/g+IcxBpYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcG6AC6YSBPHL4La2JnQ0vPp1wMp5kFlObOQb8mOGgqbwm7aBeLc/pq5/oEfHYPhuu3+JGriejG6F9RMlJ4nfne+2P8BO0obNXhuaskQ6bHYv+wSpTpzE+xar/Yldwr2sBebJ9NKjFKB/Wwg7I2GofebZsHGze1WS7xL7gRbod4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkLqDndF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkLqDndF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726834969; x=1758370969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HMWW2sLwFdiqJVrNS3cHK9xqZmCqHq8A/g+IcxBpYwY=;
  b=gkLqDndF8xW0cZPuYT6+NzSi0sUmuuGbLOPd9i3uXPbE046a/3z4m3IZ
   LSq1iAgENZ7/eHly144Zp7ni0lOvcIpTijOCVXhUFGSuktKGjki3S9Ly4
   lpkjwRRDKZjP8NIuZaD8mm1K8Xhg7KiKfXEKohGS70CquMKnDKblsy576
   86qDJuka0z2ycRXE9vzJO0orVkh1pka6qZw/1pi1VhPl8eViLRzy3HiQO
   J7I2qlG8enAZ2zpyybykIt4PJZnR2XxyU/AkKZTQLF30xi8sd2mSVNOkE
   yW+RAqioDgFFHWdlLRHQ138qrNNSFlxtBJgXpD4rpIESqGKlh2BdPxsi/
   A==;
X-CSE-ConnectionGUID: 1A4Lqqy3RyaTwlVFhKV65w==
X-CSE-MsgGUID: mDLXmGSwQJa88C0go4kfTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="37211591"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="37211591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 05:22:48 -0700
X-CSE-ConnectionGUID: SymLz1ELRPu3GVNLTQU3ag==
X-CSE-MsgGUID: 85RSuJgkT8m5UiHjRbktpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="74395896"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Sep 2024 05:22:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srceq-000EMX-2C;
	Fri, 20 Sep 2024 12:22:44 +0000
Date: Fri, 20 Sep 2024 20:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
Message-ID: <202409202015.m6CpfKx0-lkp@intel.com>
References: <20240918111826.863596-3-linyunsheng@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918111826.863596-3-linyunsheng@huawei.com>

Hi Yunsheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunsheng-Lin/page_pool-fix-timing-for-checking-and-disabling-napi_local/20240918-192701
base:   net/main
patch link:    https://lore.kernel.org/r/20240918111826.863596-3-linyunsheng%40huawei.com
patch subject: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has already unbound
config: x86_64-randconfig-123-20240920 (https://download.01.org/0day-ci/archive/20240920/202409202015.m6CpfKx0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409202015.m6CpfKx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409202015.m6CpfKx0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/page_pool.c:394:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted netmem_ref volatile @@     got restricted unsigned long @@
   net/core/page_pool.c:394:9: sparse:     expected restricted netmem_ref volatile
   net/core/page_pool.c:394:9: sparse:     got restricted unsigned long
   net/core/page_pool.c:798:9: sparse: sparse: context imbalance in 'page_pool_return_page' - different lock contexts for basic block
   net/core/page_pool.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:869:25: sparse: sparse: context imbalance in 'page_pool_put_unrefed_netmem' - unexpected unlock

vim +394 net/core/page_pool.c

   386	
   387	static void page_pool_item_del(struct page_pool *pool, netmem_ref netmem)
   388	{
   389		struct page_pool_item *item = netmem_to_page(netmem)->pp_item;
   390		struct page_pool_item *items = pool->items;
   391		unsigned int idx = item->pp_idx;
   392	
   393		DEBUG_NET_WARN_ON_ONCE(items[idx].pp_netmem != netmem);
 > 394		WRITE_ONCE(items[idx].pp_netmem, (unsigned long __bitwise)NULL);
   395		netmem_set_pp_item(netmem, NULL);
   396	}
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
