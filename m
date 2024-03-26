Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395A13DDAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711493768; cv=none; b=mlls283wkij6Oi1mT5HiJzos0Q2KA4m7lFvzINoyK9s7Bprpz6/Bx1tW8W+zj1nhgkBMDehkTv9CrYJK3qHPFLJIoj3erokhBtTcChiBB3A5j5IqJE3T5eZ/mSe/8QU7DXHJLIxf8vqsVPOWH+H8H9iVq0zg8Yqk0iVeaTSgJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711493768; c=relaxed/simple;
	bh=+SxxdD+rXODRmMSONVfDLMqlL2PM3qrW1PYyukWVYSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cu39svxcIioVsCWH2YdEw2MEyq0Ap3YFO0W6WaguOcCWvo5O4ABFr99Cy+QDM0r9EOcz0khmSbM5n9bokl5OOO1OL3DR3Vq2+IjzttPESOIl5/5Rh7IhBfo7AG3Ib++uj2kxiyZIc7SJv81JWU6J8oBWCYIczpwG23lY26Cr+P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxwiqkxn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxwiqkxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711493766; x=1743029766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+SxxdD+rXODRmMSONVfDLMqlL2PM3qrW1PYyukWVYSY=;
  b=mxwiqkxnGcVJGTBZeLcZpcyHdGEr8/E+bGSP4t+7+3CgzGR1n65zLy6e
   0B0ndfRKUh0cU3oQgiXUl8SBWfJU0AO1iuWTnBkQG3bZkaCrSPPc2AR5i
   PHAuD6mKl94mmH2qTGnZjoZZRLn/E7iOqut3OihkyoUJdXY6QOsyZqNpy
   QTEbk+0+Kt9GN3ovdCf+FatcEGrFpLDAHiRHVUPMk8MXUNmQnJa1io0j3
   b+KvVKKmRESu9l1ipV8gW+fxvSGDUz0pi4fqh8UEc9bPplk8oyMyWDLKc
   dAbOLuVsYU9gCJ/YPT88OfM13QzIp2NT7RYfxouju1+tOCQLSQrwdDkyp
   Q==;
X-CSE-ConnectionGUID: gasjyPPbRgStET7UQc3ovg==
X-CSE-MsgGUID: uaHu1hr0T9ORPs8pkHYFMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17716335"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17716335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16195365"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2024 15:56:04 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpFi5-0000Ve-2v;
	Tue, 26 Mar 2024 22:56:01 +0000
Date: Wed, 27 Mar 2024 06:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 1/72] net/core/skbuff.c:791: warning:
 Excess function parameter 'gfp_mask' description in 'napi_alloc_skb'
Message-ID: <202403270635.UgPHlsiM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   fa6deedc5b0f3dc6af2529ba87201a52c61c7d90
commit: 9987d77a593bcd386c2902d4f2fbb764eadf6c31 [1/72] net: remove gfp_mask from napi_alloc_skb()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240327/202403270635.UgPHlsiM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270635.UgPHlsiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270635.UgPHlsiM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/skbuff.c:791: warning: Excess function parameter 'gfp_mask' description in 'napi_alloc_skb'


vim +791 net/core/skbuff.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  776  
fd11a83dd3630e Alexander Duyck   2014-12-09  777  /**
9987d77a593bcd Jakub Kicinski    2024-03-25  778   *	napi_alloc_skb - allocate skbuff for rx in a specific NAPI instance
fd11a83dd3630e Alexander Duyck   2014-12-09  779   *	@napi: napi instance this buffer was allocated for
d7499160107dd1 Masanari Iida     2015-08-24  780   *	@len: length to allocate
fd11a83dd3630e Alexander Duyck   2014-12-09  781   *	@gfp_mask: get_free_pages mask, passed to alloc_skb and alloc_pages
fd11a83dd3630e Alexander Duyck   2014-12-09  782   *
fd11a83dd3630e Alexander Duyck   2014-12-09  783   *	Allocate a new sk_buff for use in NAPI receive.  This buffer will
fd11a83dd3630e Alexander Duyck   2014-12-09  784   *	attempt to allocate the head from a special reserved region used
fd11a83dd3630e Alexander Duyck   2014-12-09  785   *	only for NAPI Rx allocation.  By doing this we can save several
fd11a83dd3630e Alexander Duyck   2014-12-09  786   *	CPU cycles by avoiding having to disable and re-enable IRQs.
fd11a83dd3630e Alexander Duyck   2014-12-09  787   *
fd11a83dd3630e Alexander Duyck   2014-12-09  788   *	%NULL is returned if there is no free memory.
fd11a83dd3630e Alexander Duyck   2014-12-09  789   */
9987d77a593bcd Jakub Kicinski    2024-03-25  790  struct sk_buff *napi_alloc_skb(struct napi_struct *napi, unsigned int len)
fd11a83dd3630e Alexander Duyck   2014-12-09 @791  {
9987d77a593bcd Jakub Kicinski    2024-03-25  792  	gfp_t gfp_mask = GFP_ATOMIC | __GFP_NOWARN;
3226b158e67cfa Eric Dumazet      2021-01-13  793  	struct napi_alloc_cache *nc;
fd11a83dd3630e Alexander Duyck   2014-12-09  794  	struct sk_buff *skb;
dbae2b062824fc Paolo Abeni       2022-09-28  795  	bool pfmemalloc;
9451980a6646ed Alexander Duyck   2015-05-06  796  	void *data;
fd11a83dd3630e Alexander Duyck   2014-12-09  797  
ee2640df239314 Eric Dumazet      2022-06-08  798  	DEBUG_NET_WARN_ON_ONCE(!in_softirq());
9451980a6646ed Alexander Duyck   2015-05-06  799  	len += NET_SKB_PAD + NET_IP_ALIGN;
9451980a6646ed Alexander Duyck   2015-05-06  800  
3226b158e67cfa Eric Dumazet      2021-01-13  801  	/* If requested length is either too small or too big,
3226b158e67cfa Eric Dumazet      2021-01-13  802  	 * we use kmalloc() for skb->head allocation.
dbae2b062824fc Paolo Abeni       2022-09-28  803  	 * When the small frag allocator is available, prefer it over kmalloc
dbae2b062824fc Paolo Abeni       2022-09-28  804  	 * for small fragments
3226b158e67cfa Eric Dumazet      2021-01-13  805  	 */
dbae2b062824fc Paolo Abeni       2022-09-28  806  	if ((!NAPI_HAS_SMALL_PAGE_FRAG && len <= SKB_WITH_OVERHEAD(1024)) ||
3226b158e67cfa Eric Dumazet      2021-01-13  807  	    len > SKB_WITH_OVERHEAD(PAGE_SIZE) ||
d0164adc89f6bb Mel Gorman        2015-11-06  808  	    (gfp_mask & (__GFP_DIRECT_RECLAIM | GFP_DMA))) {
cfb8ec65952174 Alexander Lobakin 2021-02-13  809  		skb = __alloc_skb(len, gfp_mask, SKB_ALLOC_RX | SKB_ALLOC_NAPI,
cfb8ec65952174 Alexander Lobakin 2021-02-13  810  				  NUMA_NO_NODE);
a080e7bd0a8e56 Alexander Duyck   2015-05-13  811  		if (!skb)
a080e7bd0a8e56 Alexander Duyck   2015-05-13  812  			goto skb_fail;
a080e7bd0a8e56 Alexander Duyck   2015-05-13  813  		goto skb_success;
a080e7bd0a8e56 Alexander Duyck   2015-05-13  814  	}
9451980a6646ed Alexander Duyck   2015-05-06  815  
3226b158e67cfa Eric Dumazet      2021-01-13  816  	nc = this_cpu_ptr(&napi_alloc_cache);
9451980a6646ed Alexander Duyck   2015-05-06  817  
9451980a6646ed Alexander Duyck   2015-05-06  818  	if (sk_memalloc_socks())
9451980a6646ed Alexander Duyck   2015-05-06  819  		gfp_mask |= __GFP_MEMALLOC;
9451980a6646ed Alexander Duyck   2015-05-06  820  
dbae2b062824fc Paolo Abeni       2022-09-28  821  	if (NAPI_HAS_SMALL_PAGE_FRAG && len <= SKB_WITH_OVERHEAD(1024)) {
dbae2b062824fc Paolo Abeni       2022-09-28  822  		/* we are artificially inflating the allocation size, but
dbae2b062824fc Paolo Abeni       2022-09-28  823  		 * that is not as bad as it may look like, as:
dbae2b062824fc Paolo Abeni       2022-09-28  824  		 * - 'len' less than GRO_MAX_HEAD makes little sense
dbae2b062824fc Paolo Abeni       2022-09-28  825  		 * - On most systems, larger 'len' values lead to fragment
dbae2b062824fc Paolo Abeni       2022-09-28  826  		 *   size above 512 bytes
dbae2b062824fc Paolo Abeni       2022-09-28  827  		 * - kmalloc would use the kmalloc-1k slab for such values
dbae2b062824fc Paolo Abeni       2022-09-28  828  		 * - Builds with smaller GRO_MAX_HEAD will very likely do
dbae2b062824fc Paolo Abeni       2022-09-28  829  		 *   little networking, as that implies no WiFi and no
dbae2b062824fc Paolo Abeni       2022-09-28  830  		 *   tunnels support, and 32 bits arches.
dbae2b062824fc Paolo Abeni       2022-09-28  831  		 */
dbae2b062824fc Paolo Abeni       2022-09-28  832  		len = SZ_1K;
dbae2b062824fc Paolo Abeni       2022-09-28  833  
dbae2b062824fc Paolo Abeni       2022-09-28  834  		data = page_frag_alloc_1k(&nc->page_small, gfp_mask);
dbae2b062824fc Paolo Abeni       2022-09-28  835  		pfmemalloc = NAPI_SMALL_PAGE_PFMEMALLOC(nc->page_small);
dbae2b062824fc Paolo Abeni       2022-09-28  836  	} else {
115f1a5c42bdad Eric Dumazet      2023-02-06  837  		len = SKB_HEAD_ALIGN(len);
dbae2b062824fc Paolo Abeni       2022-09-28  838  
8c2dd3e4a4bae7 Alexander Duyck   2017-01-10  839  		data = page_frag_alloc(&nc->page, len, gfp_mask);
dbae2b062824fc Paolo Abeni       2022-09-28  840  		pfmemalloc = nc->page.pfmemalloc;
dbae2b062824fc Paolo Abeni       2022-09-28  841  	}
dbae2b062824fc Paolo Abeni       2022-09-28  842  
9451980a6646ed Alexander Duyck   2015-05-06  843  	if (unlikely(!data))
9451980a6646ed Alexander Duyck   2015-05-06  844  		return NULL;
9451980a6646ed Alexander Duyck   2015-05-06  845  
cfb8ec65952174 Alexander Lobakin 2021-02-13  846  	skb = __napi_build_skb(data, len);
9451980a6646ed Alexander Duyck   2015-05-06  847  	if (unlikely(!skb)) {
181edb2bfa22b5 Alexander Duyck   2015-05-06  848  		skb_free_frag(data);
9451980a6646ed Alexander Duyck   2015-05-06  849  		return NULL;
9451980a6646ed Alexander Duyck   2015-05-06  850  	}
9451980a6646ed Alexander Duyck   2015-05-06  851  
dbae2b062824fc Paolo Abeni       2022-09-28  852  	if (pfmemalloc)
9451980a6646ed Alexander Duyck   2015-05-06  853  		skb->pfmemalloc = 1;
9451980a6646ed Alexander Duyck   2015-05-06  854  	skb->head_frag = 1;
fd11a83dd3630e Alexander Duyck   2014-12-09  855  
a080e7bd0a8e56 Alexander Duyck   2015-05-13  856  skb_success:
fd11a83dd3630e Alexander Duyck   2014-12-09  857  	skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
fd11a83dd3630e Alexander Duyck   2014-12-09  858  	skb->dev = napi->dev;
fd11a83dd3630e Alexander Duyck   2014-12-09  859  
a080e7bd0a8e56 Alexander Duyck   2015-05-13  860  skb_fail:
fd11a83dd3630e Alexander Duyck   2014-12-09  861  	return skb;
fd11a83dd3630e Alexander Duyck   2014-12-09  862  }
9987d77a593bcd Jakub Kicinski    2024-03-25  863  EXPORT_SYMBOL(napi_alloc_skb);
fd11a83dd3630e Alexander Duyck   2014-12-09  864  

:::::: The code at line 791 was first introduced by commit
:::::: fd11a83dd3630ec6a60f8a702446532c5c7e1991 net: Pull out core bits of __netdev_alloc_skb and add __napi_alloc_skb

:::::: TO: Alexander Duyck <alexander.h.duyck@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
