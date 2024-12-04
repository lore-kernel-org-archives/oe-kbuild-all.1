Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D08218FC85
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733347426; cv=none; b=kkJgIWughKRyUpsLhOTFVikOVZYMR7bT2SU6RHeTjJDYP4wI9rKkBqNnRCt+Sb4nl9ffCGynYraryCBd9opFoHzNIN6OHi99dd6CCsooK42lKnaNxGGiowXTXF3PuheOtxuPwg0kVwQYDJquhNBx83c4fpWyRByzwgyOyg8U80w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733347426; c=relaxed/simple;
	bh=i2UbiTAcKvSuF+NRq71aZjPrwJ+v+shSr3GpKVOWIus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGEpH72yl3SJrhggoFy1Zm88USRrDVeyb3t7Wn1A6rpA61KJnaF4qcAADLZx7SH+RJKbQ2kMMUXVeVKlqmznyKpo4GFnCHmAEzY/AWnFLkGRZPxaDQ8yeaAkxYKgBapt+80YBTtfrTWlvryMk1TyP4J7fcUIoZTj9Im41QQOj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an1ZXMJ4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an1ZXMJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733347425; x=1764883425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2UbiTAcKvSuF+NRq71aZjPrwJ+v+shSr3GpKVOWIus=;
  b=an1ZXMJ4h1AGmO2nM2JiMJc66XC9ePQeSDSpzKpdV/pgwRD6xQ8xV5Ot
   FiMcUKQeTRZQjWCOcbEnK8OCn21NSHqRoAKx399iDh7Bc52GoWGRD2McP
   2DsBSpNe3T3lnmxySNjgTd9fwDycG/vlH8XJjO1EjuEUzl3b4pGKHxSxn
   Vy/xSS0Bgvwsx7kP0nHTyN5s758JSQrBvpteGuMkP1ylJ51nFL2ndUflk
   ZXpUF+11Xc02Z2fiQp3kv12/ChMPq8XPq7ckNZ4jhhZB0e8Ti6esjibSo
   AArm5Rt4F1g5h0CUmAvAIyB+uOhWIQtmk1GtqCXW6tJT/64nMJ1/iEH4b
   w==;
X-CSE-ConnectionGUID: qGu+F0dYQGmAimS53Gg7TA==
X-CSE-MsgGUID: JJsNifMcTCOSalft1QmkJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36480153"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="36480153"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 13:23:45 -0800
X-CSE-ConnectionGUID: qsxn805VSOWYY9lRXGXCuw==
X-CSE-MsgGUID: joXgk/4PSq+/2HfHqP/wlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="94714579"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 13:23:44 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIwqO-0003Vu-2v;
	Wed, 04 Dec 2024 21:23:38 +0000
Date: Thu, 5 Dec 2024 05:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v8-crutched-refs+fallback-v2 22/24]
 drivers/net/veth.c:831:22: error: assignment to 'struct page *' from 'int'
 makes pointer from integer without a cast
Message-ID: <202412050548.Xlbs73Hg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v8-crutched-refs+fallback-v2
head:   0405915fd7cd8cad25f58acd1fa1b6b3b3bdae4b
commit: 882efade90a8967778593fff22a8d7b57c1bbaf3 [22/24] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: arm64-randconfig-r051-20241204 (https://download.01.org/0day-ci/archive/20241205/202412050548.Xlbs73Hg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050548.Xlbs73Hg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050548.Xlbs73Hg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_iou_rcv_skb':
   drivers/net/veth.c:831:24: error: implicit declaration of function 'io_iov_get_page' [-Wimplicit-function-declaration]
     831 |                 page = io_iov_get_page(netmem);
         |                        ^~~~~~~~~~~~~~~
>> drivers/net/veth.c:831:22: error: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     831 |                 page = io_iov_get_page(netmem);
         |                      ^


vim +831 drivers/net/veth.c

   771	
   772	static noinline struct sk_buff *veth_iou_rcv_skb(struct veth_rq *rq,
   773						struct sk_buff *skb)
   774	{
   775		struct sk_buff *nskb;
   776		u32 size, len, off, max_head_size;
   777		struct page *page;
   778		int ret, i, head_off;
   779		void *vaddr;
   780	
   781		/* Testing only, randomly send normal pages to test copy fallback */
   782		if (ktime_get_ns() % 16 == 0)
   783			return skb;
   784	
   785		skb_prepare_for_gro(skb);
   786		max_head_size = skb_headlen(skb);
   787	
   788		rcu_read_lock();
   789		nskb = napi_alloc_skb(&rq->xdp_napi, max_head_size);
   790		if (!nskb)
   791			goto drop;
   792	
   793		skb_copy_header(nskb, skb);
   794		skb_mark_for_recycle(nskb);
   795	
   796		size = max_head_size;
   797		if (skb_copy_bits(skb, 0, nskb->data, size)) {
   798		consume_skb(nskb);
   799			goto drop;
   800		}
   801		skb_put(nskb, size);
   802		head_off = skb_headroom(nskb) - skb_headroom(skb);
   803		skb_headers_offset_update(nskb, head_off);
   804	
   805		/* Allocate paged area of new skb */
   806		off = size;
   807		len = skb->len - off;
   808	
   809		for (i = 0; i < MAX_SKB_FRAGS && off < skb->len; i++) {
   810			netmem_ref netmem;
   811			unsigned frag_offset;
   812	
   813			size = min_t(u32, len, PAGE_SIZE);
   814			// netmem = page_pool_alloc_frag_netmem(rq->page_pool,
   815			// 				     &frag_offset, size,
   816			// 				     GFP_ATOMIC | __GFP_NOWARN);
   817	
   818			printk("alloc frag %p size %i off %i\n", (void*)netmem,
   819								  (int)size, (int)frag_offset);
   820	
   821			netmem = page_pool_alloc_netmem(rq->page_pool, GFP_ATOMIC | __GFP_NOWARN);
   822			if (!netmem) {
   823				consume_skb(nskb);
   824				goto drop;
   825			}
   826			if (WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
   827				consume_skb(nskb);
   828				goto drop;
   829			}
   830	
 > 831			page = io_iov_get_page(netmem);
   832			if (WARN_ON_ONCE(!page))
   833				goto drop;
   834	
   835			skb_add_rx_frag_netmem(nskb, i, netmem, frag_offset, size,
   836						PAGE_SIZE);
   837	
   838			vaddr = kmap_atomic(page);
   839			ret = skb_copy_bits(skb, off, vaddr + frag_offset, size);
   840			kunmap_atomic(vaddr);
   841	
   842			if (ret) {
   843				consume_skb(nskb);
   844				goto drop;
   845			}
   846			len -= size;
   847			off += size;
   848		}
   849		rcu_read_unlock();
   850	
   851		consume_skb(skb);
   852		skb = nskb;
   853		return skb;
   854	drop:
   855		rcu_read_unlock();
   856		kfree_skb(skb);
   857		return NULL;
   858	}
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
