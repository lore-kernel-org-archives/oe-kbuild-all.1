Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A6D632
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 01:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729388654; cv=none; b=RdJMhwB6cl2/okDk8CFCoycHiK1CmpC0xRV2Pp3KAXnE4U4jyAsk9F4EAnXEouGZfkYkelnxvgFnOXRxuL++Mr1iUQjzyShxuBhc3bpWZEjhYZfC6f1pw/b6jX9psGksu3/AvXdY7a4phDlHYYh2wIf9A9VUgD8cVqbuU7IMgDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729388654; c=relaxed/simple;
	bh=f49lddDwro6mBBtf2iNAOtWnaLErlu3URB22fRraok4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ipahc8I/+aureVU3L2xsYm9YiBzVtMxNJSmY7BdPZ9VN694KpVGFAfBWC2sVrBVKzsErbxGDt3BecMSgUxlTkyOg3aOxwSo82KxwgCvIeYZbklBSI5OvEWz3jxJte/Ovbxv+nOTP73B2KXrUXwFZBXGjNraWbhRgcf7I0V4U0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdB+I/Mm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdB+I/Mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729388652; x=1760924652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f49lddDwro6mBBtf2iNAOtWnaLErlu3URB22fRraok4=;
  b=FdB+I/MmgcgTSuvwMdu1jcdVjEIf9Ir7Tx/j7PLiUKUHFSh7F6ZlUhRY
   VPIRLjoETGOSsuBcDfVpQV2SwL6C4rPJrkSyfyY5nTNnrePjjWNwwRBhL
   lAp2a5LPHbZOVicV0W99rS79OUsUjlbVLpTdzP8QpPI5SYAiugR5lePZJ
   p786KsOp6kdKZGq019P/ymLhXGQhQZluJWuuL64JPXOLdDcvw1l9CZ/wo
   Ns9LdXf8CoN2p/qySl/b5ltdBUUhyZb9/KX/9ysAGur4tcoz1lFii4hqS
   wfsLjf4O7s8i2KbH5prYCrec+7kAD3N/Bsp9iK2IaLAnG1JwAjZsC8OgS
   A==;
X-CSE-ConnectionGUID: jpiy6hmeRH2t5O4lx9RCpw==
X-CSE-MsgGUID: cLRg2koRSPCvCx/LQsCQhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28989872"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28989872"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 18:44:11 -0700
X-CSE-ConnectionGUID: oIVqq4eVQwGf6wq8OvHduA==
X-CSE-MsgGUID: CG59e9EwS4Ss1zfvRkxBEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="116666393"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2024 18:44:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2KzH-000PlL-2x;
	Sun, 20 Oct 2024 01:44:07 +0000
Date: Sun, 20 Oct 2024 09:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 19/19] drivers/net/veth.c:831:24: error:
 implicit declaration of function 'io_iov_get_page'
Message-ID: <202410200910.OmCMGlsO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   2ddeede97bba995798be3e7a1ae9ac3340bec129
commit: 2ddeede97bba995798be3e7a1ae9ac3340bec129 [19/19] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: i386-randconfig-006-20241020 (https://download.01.org/0day-ci/archive/20241020/202410200910.OmCMGlsO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200910.OmCMGlsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200910.OmCMGlsO-lkp@intel.com/

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
