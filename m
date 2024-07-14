Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1817F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 01:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720922037; cv=none; b=RppAcPe+48v2txHGg8gwQC4NieTbMtmGM1rY5aQXcoaI1KbEWknKfWvwLnQdOBXwVMhqvMq5iSLfn4IUTthGFoarqCfMQnkpHusNc4vW44btZ9Bv+Kcwye722njZTKyosRFm2rxjglGGOCkhn3DnD1juvbNwa2Nxx8S0uw6w2cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720922037; c=relaxed/simple;
	bh=gwl22JhkA7hnL4HU1qT266PwOLd/kfOekN7d7OHyYWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ah9wy9/5tY0ROi2Sw8uKjDY5eixg3h2wz8K5NniOuTTisLy211LFwnlfiPoLGS4VXzAlNgHxkpewM8qVle0AghB9rsi5aIfgfxzjUm1D7wXIGogf8MC3TmKa8KgQ1OU6cm2I2L+6jer83zeBGGl00qAA4EReHLLn6liiuupvBZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jc7rl0q5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jc7rl0q5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720922035; x=1752458035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwl22JhkA7hnL4HU1qT266PwOLd/kfOekN7d7OHyYWM=;
  b=jc7rl0q5OAPn0XWJE9wOx8yuxQVrmCVcsmCmGOvDjh/t1SfcOHP9gVwC
   xQ836EOqJLQM8+mEDXxOK/h2SPk0gen91pmUjd3FvDor1n338XzmGJU+y
   Ukp9RKJBAkw7kHm8Nqp9kjMuydDnatUpe29ysPLvUAJyi9dUwN0w9HehE
   8OjprL8ZyXqfJHnQ6mev1gWd9t42BrXsiKzmFcAYSkZj5i7wypQvok78G
   ByIrpc19fCqLNBQjQykJkZkBpo8eX9l5x6qQUTU2wovbYd6L+NjOFKDAF
   pIRgYH14gjXv5uOvaUZgGpSP3l57cAAl5kSYInz9BlccQh6Bc6U+fLA77
   A==;
X-CSE-ConnectionGUID: 5u4TPqIsShSsgSnV3b+KuQ==
X-CSE-MsgGUID: gKnkHEn0TeWZUJmymuM9Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="21245128"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="21245128"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 18:53:55 -0700
X-CSE-ConnectionGUID: I62D7gxIQSy6FVRhLma0qw==
X-CSE-MsgGUID: cP1D8p7AQ2iaTdVHyBb01Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="53645606"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2024 18:53:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSoQy-000cvq-15;
	Sun, 14 Jul 2024 01:53:52 +0000
Date: Sun, 14 Jul 2024 09:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v5-dirty 35/35] drivers/net/veth.c:822:22: error:
 assignment to 'struct page *' from 'int' makes pointer from integer without
 a cast
Message-ID: <202407140911.ytU8p1hX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v5-dirty
head:   458c2a5b1a3fbfa392ef5622b34f2455f234c6ea
commit: 458c2a5b1a3fbfa392ef5622b34f2455f234c6ea [35/35] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: powerpc-randconfig-003-20240714 (https://download.01.org/0day-ci/archive/20240714/202407140911.ytU8p1hX-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140911.ytU8p1hX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140911.ytU8p1hX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_iou_rcv_skb':
   drivers/net/veth.c:822:24: error: implicit declaration of function 'io_iov_get_page' [-Wimplicit-function-declaration]
     822 |                 page = io_iov_get_page(netmem);
         |                        ^~~~~~~~~~~~~~~
>> drivers/net/veth.c:822:22: error: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     822 |                 page = io_iov_get_page(netmem);
         |                      ^
   drivers/net/veth.c: In function 'veth_xdp_rcv':
   drivers/net/veth.c:995:55: error: 'io_uring_pp_zc_ops' undeclared (first use in this function)
     995 |                         if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
         |                                                       ^~~~~~~~~~~~~~~~~~
   drivers/net/veth.c:995:55: note: each undeclared identifier is reported only once for each function it appears in


vim +822 drivers/net/veth.c

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
   811	
   812			netmem = page_pool_alloc_netmem(rq->page_pool, GFP_ATOMIC | __GFP_NOWARN);
   813			if (!netmem) {
   814				consume_skb(nskb);
   815				goto drop;
   816			}
   817			if (WARN_ON_ONCE(!netmem_is_net_iov(netmem))) {
   818				consume_skb(nskb);
   819				goto drop;
   820			}
   821	
 > 822			page = io_iov_get_page(netmem);
   823			if (WARN_ON_ONCE(!page))
   824				goto drop;
   825	
   826			size = min_t(u32, len, PAGE_SIZE);
   827			skb_add_rx_frag_netmem(nskb, i, netmem, 0, size, PAGE_SIZE);
   828	
   829			vaddr = kmap_atomic(page);
   830			ret = skb_copy_bits(skb, off, vaddr, size);
   831			kunmap_atomic(vaddr);
   832	
   833			if (ret) {
   834				consume_skb(nskb);
   835				goto drop;
   836			}
   837			len -= size;
   838			off += size;
   839		}
   840		rcu_read_unlock();
   841	
   842		consume_skb(skb);
   843		skb = nskb;
   844		return skb;
   845	drop:
   846		rcu_read_unlock();
   847		kfree_skb(skb);
   848		return NULL;
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
