Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEA7D299
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 23:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732665370; cv=none; b=l3niQxjn47AFTojP91yTQ1VnbW95NP3FHGRjSzSyYSWIxk+Rgp5CXnug8CexgngVw9R/LMXEEfnqZIXNN7zu3dTwKjGwNs0MeR/uZGwQA50+6nYdIcItWMOEoTCtfC6E8N/Sa0HKi31GZweW0v3e4ovzxozbUnXtRla5AnxeXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732665370; c=relaxed/simple;
	bh=ttVJpm8WWg8QnhSyYFdIOB98IXEAPFiOK0dI3eeHICo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYeH5E10s6TaL+Sz3dkH0iMjX5YXoAx6K8u9jKUGPShkASBWogkXQcLHm//+VuU62R6yVpD6VfByzb2YbQvZhew3SXlc7r03UvROxJGbjWO1HpeHCncmF7CbtgKgXPlu0lNbN2RF1mBL8Y79PLd9GqBv69u3SFiQHtGbAlrpsns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuOz2WjX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuOz2WjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732665369; x=1764201369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ttVJpm8WWg8QnhSyYFdIOB98IXEAPFiOK0dI3eeHICo=;
  b=kuOz2WjX9/aDryGev2VzrN2HxKLINWa0HkUAVU4bN6k955QzGMm83560
   TVBMj24K5tfEd4c4UOfnGFhHrDAfPMO3bEq0E610f1eVmsA9F6QUQt/U0
   HpyjTcI6KB31QA+xcjo2JAF34pe0fApm2TAc++AsYm28GB2x0OYWJW5Ny
   C8jYCkYn0biD74LuWb8cY9lv+GlRtSq0No9lS4/k8ijqezzWyP2nnP4n/
   0u2vGJt516rVPGcjLZItH2HH3HJLPsxldhJpX+56LZceO/U9Xc2Oj5/vR
   re/JzkdjqTHsbbFcHrBBAf4lZ6i4ONsGkgu5N1m+BNXqTF8cWkxmAVMRH
   w==;
X-CSE-ConnectionGUID: nPstoZYkR8qxB8o9VhF87Q==
X-CSE-MsgGUID: oacV/oJqRmy2Zr5FDE55og==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36641418"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="36641418"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 15:56:08 -0800
X-CSE-ConnectionGUID: g2VLiR76SM+CP3jyJfs7Lg==
X-CSE-MsgGUID: njy2TnVBR2OV+u8kqoileQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="91384582"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2024 15:56:08 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG5PY-0007br-1i;
	Tue, 26 Nov 2024 23:56:04 +0000
Date: Wed, 27 Nov 2024 07:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v8-crutched-refs+fallback 22/24]
 drivers/net/veth.c:835:43: warning: variable 'frag_offset' is uninitialized
 when used here
Message-ID: <202411270718.Io42Zc3E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v8-crutched-refs+fallback
head:   6e979a2d2fc5d6612d460184427d65fffe6b7c8e
commit: 0655c3486db7c28d14f0dd70fe5c7904030d7407 [22/24] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241127/202411270718.Io42Zc3E-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270718.Io42Zc3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270718.Io42Zc3E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/veth.c:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/veth.c:835:43: warning: variable 'frag_offset' is uninitialized when used here [-Wuninitialized]
     835 |                 skb_add_rx_frag_netmem(nskb, i, netmem, frag_offset, size,
         |                                                         ^~~~~~~~~~~
   drivers/net/veth.c:811:23: note: initialize the variable 'frag_offset' to silence this warning
     811 |                 unsigned frag_offset;
         |                                     ^
         |                                      = 0
>> drivers/net/veth.c:818:51: warning: variable 'netmem' is uninitialized when used here [-Wuninitialized]
     818 |                 printk("alloc frag %p size %i off %i\n", (void*)netmem,
         |                                                                 ^~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/net/veth.c:810:20: note: initialize the variable 'netmem' to silence this warning
     810 |                 netmem_ref netmem;
         |                                  ^
         |                                   = 0
   drivers/net/veth.c:1164:7: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
    1164 |                 int nr = 0;
         |                     ^
   7 warnings generated.


vim +/frag_offset +835 drivers/net/veth.c

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
 > 818			printk("alloc frag %p size %i off %i\n", (void*)netmem,
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
   831			page = io_iov_get_page(netmem);
   832			if (WARN_ON_ONCE(!page))
   833				goto drop;
   834	
 > 835			skb_add_rx_frag_netmem(nskb, i, netmem, frag_offset, size,
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
