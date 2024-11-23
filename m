Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDE824B29
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 04:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732335248; cv=none; b=LNf0r2XJQPPZc11cfX92RUFEM5ceLt7M224LmapHeakkZ4Gq3lDr2IX3oDDJiCjDI9sDNs2NNprfXG1BHzrnAMkYIKrzSbgtbjqezDQ793AmMobl/kVmCych7FskjovIsfyXzpKdCxYNM5Al0HOYaoLjbLe6rvZ8y0Q3mh4RYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732335248; c=relaxed/simple;
	bh=3NDXVmqQoO8ujRLCu0V3RkQ+axj7aRbbFVETLkfyhRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShFMf9yybWW5wg2qieAZlDIKsDhlXpPSFtN8XiuhXxO/ZFaHomxd91/cOkZiacCBeSwcs1w/Pocsyg6/0AshO7aGcH0jcOMFNt0eQpbdN2vEsT4UZuijxU8+aDZTL3MKbrUvDeC0W1gaEBOTOZGIKvPkV44wU2Yny5z0xTGuCps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6JmDXTl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6JmDXTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732335247; x=1763871247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NDXVmqQoO8ujRLCu0V3RkQ+axj7aRbbFVETLkfyhRw=;
  b=X6JmDXTlVvo3NYht7GeyyiQPBVUJNK92F6s7TvI/33Pnv+Fhcj2yxRYh
   90QCZ708Qpo1SAYGnY53bP4cm2HnA3z0mvupCnris5sr/0X/BPKlOz0qD
   Fn99bQZj4gpiGScc3Z9fl6NMxjsSney73oLw1sppkj6Qps5YSPtfjRvNS
   M0dcVlYEuIolzAW4i4+1/kfuJIjDrPyO39mzAmiIsfCdc0V4+QdhstaIx
   KdRkMJ4wpBgeIXx6A5nbuvNv+bnwzBCHgac0E3ZIprb2hrlOaexQzhgkp
   M5lOTDpH9eczJ7x8Uj9/KDTF80qraC9I9QXFx8Nux79Tzn01EQDTzx2x1
   A==;
X-CSE-ConnectionGUID: BnN96R4ISJKXrRyOXGVggA==
X-CSE-MsgGUID: F3GTkgbrRDmlzVCHc/bDyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35356127"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="35356127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 20:14:04 -0800
X-CSE-ConnectionGUID: Y36EU6QKS52tMGRnOJf5Ng==
X-CSE-MsgGUID: DHTUCR8NReKro3MEOc7BNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="114036853"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2024 20:14:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEhWy-0004Pz-34;
	Sat, 23 Nov 2024 04:14:00 +0000
Date: Sat, 23 Nov 2024 12:13:59 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v8-dirty 11/11] drivers/net/veth.c:831:24: error:
 implicit declaration of function 'io_iov_get_page'
Message-ID: <202411231209.qU5rvswY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v8-dirty
head:   6c90859263a88df0e3947a4d138087a63ef878f8
commit: 6c90859263a88df0e3947a4d138087a63ef878f8 [11/11] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: x86_64-randconfig-102-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231209.qU5rvswY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231209.qU5rvswY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231209.qU5rvswY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_iou_rcv_skb':
>> drivers/net/veth.c:831:24: error: implicit declaration of function 'io_iov_get_page' [-Werror=implicit-function-declaration]
     831 |                 page = io_iov_get_page(netmem);
         |                        ^~~~~~~~~~~~~~~
>> drivers/net/veth.c:831:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     831 |                 page = io_iov_get_page(netmem);
         |                      ^
   cc1: some warnings being treated as errors


vim +/io_iov_get_page +831 drivers/net/veth.c

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
   814			netmem = page_pool_alloc_frag_netmem(rq->page_pool,
   815							     &frag_offset, size,
   816							     GFP_ATOMIC | __GFP_NOWARN);
   817	
   818			printk("alloc frag %p size %i off %i\n", (void*)netmem,
   819								  (int)size, (int)frag_offset);
   820	
   821			// netmem = page_pool_alloc_netmem(rq->page_pool, GFP_ATOMIC | __GFP_NOWARN);
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
