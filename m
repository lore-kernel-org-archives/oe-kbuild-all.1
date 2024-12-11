Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7E22912C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733921057; cv=none; b=GoWu3bzsL33xO/aOKMLJrRYsFFhwNxOkMna57J+ti0yPrKemXqDL19QZmd0IEPbdak7ITvQqgOTc+VbvlFlC3MZ1AleaWqrwHRQgyVkcmOYsD8n9uyAI48OrluK1fIFtaV5THnL8gizVPQPFlXuXptYBUeQ+F++mO8+SVKZBZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733921057; c=relaxed/simple;
	bh=+JUK+gTk/O2CThlR/5lfYtwBXju0DUTQPSj5cblh6fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5nU+0jBP3cSz3HXE86NzxQbXs+yKrd7+lV9VptxjReoEs9XestTukPSFEFymR3F2pX3yCLvhZwolMfYmyIIkSxlhSRIRKvHfYG5BjJuyn+nfReXVMB/2d1BFRrGTnd26xJyixxmHXa8f4Rpa35rAxWh0be42EoEuWuMbfPe3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHH/8J0z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHH/8J0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733921056; x=1765457056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+JUK+gTk/O2CThlR/5lfYtwBXju0DUTQPSj5cblh6fk=;
  b=QHH/8J0zq6j8Eu4spS6DTxxfWkPOviaCdEvU/0aLDuHpxowy9vQ/olxO
   GvBrBOqKn3wul4rNNpl08IEQMPCnp/84KkvG8A5OP+HCgDGyfw1i9BzsS
   rhn3a7nrvQ9HxQUDzpa57biAUogj/3Tcs/jtWJi5D9laXxH8OUOlp3ph3
   wOtrHcK2dtCR6mXlCtX8fuwxhU4uxEjQ02LWCMv2jAi7vn8bM+v075yF7
   3byTQvzX75jH+hUjbuYO8NB3v8R965ORP76bbvMI3AzgDppujXYTVOOh3
   sKJ6zdY48SPTpEuNmGpLhdl6K5hR1I/5DDw98GhFLs9dFCHBsVKIrstyx
   Q==;
X-CSE-ConnectionGUID: Sd1ABHU6Q6yVdxxhKy/9Aw==
X-CSE-MsgGUID: M4hHclt7Qfe/pLHftf9r1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45705847"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45705847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 04:44:15 -0800
X-CSE-ConnectionGUID: Pe2Rv16bSBCVIEhy4LQPNg==
X-CSE-MsgGUID: X46rf1YHQeSLEAB4cfn4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100851404"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2024 04:44:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLM4a-0006ep-0E;
	Wed, 11 Dec 2024 12:44:12 +0000
Date: Wed, 11 Dec 2024 20:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v9-wip 20/21] drivers/net/veth.c:831:undefined
 reference to `io_iov_get_page'
Message-ID: <202412112029.a37Xr6xi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v9-wip
head:   57539d7d0009112e33f2baf7a975d4d2ba2c50cf
commit: 5a2e200685de32ee0c8931b0b094fcccd6c1754a [20/21] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: sparc64-randconfig-001-20241211 (https://download.01.org/0day-ci/archive/20241211/202412112029.a37Xr6xi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412112029.a37Xr6xi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412112029.a37Xr6xi-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/net/veth.o: in function `veth_iou_rcv_skb':
>> drivers/net/veth.c:831:(.text+0x7620): undefined reference to `io_iov_get_page'


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
