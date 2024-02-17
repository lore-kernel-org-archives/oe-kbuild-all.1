Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A011B7F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708159659; cv=none; b=K5Y/aSByuL/+CzdlMtxviTMr2UDMhHklKcgvJrn6tfhgNFgV/sEZqs/fbGwERYeTVF/L8jnt2CJp73M//ZPBmu4OuHdjPOXcJA9Q8RshKtbESDUqfa4Fok+usngX7vGUT7d5md89jbl2bN+jv9sIEjSPH/+/4n9pOkwSchEKIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708159659; c=relaxed/simple;
	bh=PP7gkHdRkE41uohAKEedNOS43tEB8dF47rK8Ml9zzb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvEAJUufM/n3OzCynvHtTS2mWg/VyMT/jXs92pVLsg4f4oPTEBqvIAndgmfForUglyGb9C/9jWkoJmd6ijUh4CqyYY/cph5O7mslvonmr2/95+rSC5JgdsG7OiqEgECiFsYo/ZxxVtRmzyi69yRg8AQrXOlUdfzXU4jUII9pVV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=medyfTsl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="medyfTsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708159657; x=1739695657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PP7gkHdRkE41uohAKEedNOS43tEB8dF47rK8Ml9zzb8=;
  b=medyfTslAqzBqXaPi9OaGRwnuqF+TIUsDlpdTjhDxLKu1zH8CvkZSkv6
   CcpUIydHB3TqwH+gVr/LvJGUvaHtG+9IYWyeWjOtKyCgHWP+VPNsHmclA
   +oYznZ6Oejmamr4SMBhWTZyJVr4ie9ckWb9JdXqLEwkN+2b3mJ3C1UhX+
   IZzGxP+dkgS4ggLjKNysBRCClhdPJTt6/tOCjk9iUZXaiv8yPnY4zzrqR
   bGf67yc333xbgHmaSANC85aGBrKDN2Vu0eNCSUohZ7kyZwCze3WjK06wp
   j6fOSBERlzMeyhw2wBkYqad6kTxFq+duFYw3O9EvUwemXDxzTr8ksNt0g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27743829"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="27743829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 00:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="41536915"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2024 00:47:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbGM8-0001yC-13;
	Sat, 17 Feb 2024 08:47:32 +0000
Date: Sat, 17 Feb 2024 16:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 22/35] mm/slab: enable slab allocation tagging for
 kmalloc and friends
Message-ID: <202402171609.lm2hShEp-lkp@intel.com>
References: <20240212213922.783301-23-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212213922.783301-23-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-23-surenb%40google.com
patch subject: [PATCH v3 22/35] mm/slab: enable slab allocation tagging for kmalloc and friends
config: x86_64-randconfig-121-20240214 (https://download.01.org/0day-ci/archive/20240217/202402171609.lm2hShEp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402171609.lm2hShEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171609.lm2hShEp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv6/seg6.c:254:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct in6_addr *t_old @@     got struct in6_addr [noderef] __rcu *tun_src @@
   net/ipv6/seg6.c:254:15: sparse:     expected struct in6_addr *t_old
   net/ipv6/seg6.c:254:15: sparse:     got struct in6_addr [noderef] __rcu *tun_src
>> net/ipv6/seg6.c:432:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct in6_addr [noderef] __rcu *tun_src @@     got void *[assigned] _res @@
   net/ipv6/seg6.c:432:24: sparse:     expected struct in6_addr [noderef] __rcu *tun_src
   net/ipv6/seg6.c:432:24: sparse:     got void *[assigned] _res

vim +432 net/ipv6/seg6.c

4f4853dc1c9c19 David Lebrun 2016-11-08  421  
915d7e5e5930b4 David Lebrun 2016-11-08  422  static int __net_init seg6_net_init(struct net *net)
915d7e5e5930b4 David Lebrun 2016-11-08  423  {
915d7e5e5930b4 David Lebrun 2016-11-08  424  	struct seg6_pernet_data *sdata;
915d7e5e5930b4 David Lebrun 2016-11-08  425  
915d7e5e5930b4 David Lebrun 2016-11-08  426  	sdata = kzalloc(sizeof(*sdata), GFP_KERNEL);
915d7e5e5930b4 David Lebrun 2016-11-08  427  	if (!sdata)
915d7e5e5930b4 David Lebrun 2016-11-08  428  		return -ENOMEM;
915d7e5e5930b4 David Lebrun 2016-11-08  429  
915d7e5e5930b4 David Lebrun 2016-11-08  430  	mutex_init(&sdata->lock);
915d7e5e5930b4 David Lebrun 2016-11-08  431  
915d7e5e5930b4 David Lebrun 2016-11-08 @432  	sdata->tun_src = kzalloc(sizeof(*sdata->tun_src), GFP_KERNEL);
915d7e5e5930b4 David Lebrun 2016-11-08  433  	if (!sdata->tun_src) {
915d7e5e5930b4 David Lebrun 2016-11-08  434  		kfree(sdata);
915d7e5e5930b4 David Lebrun 2016-11-08  435  		return -ENOMEM;
915d7e5e5930b4 David Lebrun 2016-11-08  436  	}
915d7e5e5930b4 David Lebrun 2016-11-08  437  
915d7e5e5930b4 David Lebrun 2016-11-08  438  	net->ipv6.seg6_data = sdata;
915d7e5e5930b4 David Lebrun 2016-11-08  439  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
