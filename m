Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E80B1917E4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 09:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698644; cv=none; b=phKj+2c1r6dJekVlML2QdmJdxXTdxBNCmga2k7f0B3eUQL+OwIQOiqmu6SZBWTnj02o569KvMJoEKC73w9VQS3JlafH0ScEqkOmdJdhX+vx5+frqGtqQVI+rYp1qO7UqJNjIpiENMaio1McUFrKdd5mk6cDDbS/MxOzDEXucZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698644; c=relaxed/simple;
	bh=5skvH+gdVifpG3a+lDYEbeC2a7XARaXitaruwBcF42g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssBOEhhJjQwNuJtsXFRwX/hA9e50O5TgfkB7bYdyDALuM/1+47Ke9Vlvo0MtxJ1ywVXL6OCz638g752RMvn28/CBunOJU/sqbskC/PaowUaFPOs7qpQ+UgUFdA5rPp3LQWws5dkKeexLuFzE25tL50r1ObuWT7Ub28t/Ek8dTmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM5eLkPV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM5eLkPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732698642; x=1764234642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5skvH+gdVifpG3a+lDYEbeC2a7XARaXitaruwBcF42g=;
  b=RM5eLkPVaS0EHAEGd1OraamhaTblQhxZ7sZ9Qwa5z6SF4oO9IaTiHWLx
   1EomaBzU2d6GC6Nrwp8iyy/Nuzskd/Ickh+/lox9RAPdU7vKHu9tKQ8nb
   iGqTKhRsMTTrN/0rx1bsBuJfeXdtXJ0pqpgxFknIUTXpsoR6+zhKOc8Jg
   MX9tfDkJ4IHQX/banbyivVvlQ70HG96TdssEELMzn5iV9sZQ3Io381Epx
   OgrZTyjKh41RFGl3gDPa2meKu3F+vZVQwq4o21stBZ5qrGa9DUym9poXY
   YhpF4SW9lCE/WgkBeG4SBSiPzcaMhnIt5VIRbrDi4K3y0kVGRxX9D0pIT
   A==;
X-CSE-ConnectionGUID: /5/fx8vtTkComDXoQZUPAQ==
X-CSE-MsgGUID: vsH/2XcwSP+pHBpess0WKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36556850"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36556850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 01:10:41 -0800
X-CSE-ConnectionGUID: CQ0TbAlCTYmgHrU7dEsXCQ==
X-CSE-MsgGUID: n/zU7Hh8RHOH/nhLuk/zcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91767817"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2024 01:10:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGE4D-0007rZ-2F;
	Wed, 27 Nov 2024 09:10:37 +0000
Date: Wed, 27 Nov 2024 17:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v8-crutched-refs+fallback 22/24]
 drivers/net/veth.c:831:10: error: call to undeclared function
 'io_iov_get_page'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202411271731.2s0TmnGA-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271731.2s0TmnGA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271731.2s0TmnGA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271731.2s0TmnGA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/veth.c:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/veth.c:831:10: error: call to undeclared function 'io_iov_get_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     831 |                 page = io_iov_get_page(netmem);
         |                        ^
>> drivers/net/veth.c:831:8: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
     831 |                 page = io_iov_get_page(netmem);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/veth.c:1164:7: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
    1164 |                 int nr = 0;
         |                     ^
   2 warnings and 2 errors generated.


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
