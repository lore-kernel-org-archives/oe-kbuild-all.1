Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8811CD1FB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 16:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733503919; cv=none; b=jxiJ3bWu7TxgW9Hg44ZaytBTrtdnrpR+LR5Wg6hiu/Q8UndPYFci7v1NIirNotjyCAEkU9IJ4RNNg7HHTJ29OInB677Oy5BzlHQ8wCFoKA6NLGJE7v3MsZeM3KBkF/uBnEXo0/DrSVXIXBuiHr8wjvYcxZAV8vfsZ5YEjmdlvUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733503919; c=relaxed/simple;
	bh=c8SK7d9EShWRzfJCsSDpefN6sk05dSCp9GIGUfm+lTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uO7GLwt082wVKmxpJaj/sIo3la5G9ZKQ4yFbfVjtMR8//p4uFsVOEkxBgm4Ixz+rbE4Q/vNwGQxCU8VIThwTcbrmz3+Anh5SdGNWnI4P1TJWiyEqOn6WFn9vuPqJ6m3E1KwAEHLkLOs9oHswbMnss5gT9hwdTA9tV6X7CWpzgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iciEloOc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iciEloOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733503918; x=1765039918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c8SK7d9EShWRzfJCsSDpefN6sk05dSCp9GIGUfm+lTc=;
  b=iciEloOcHLd2BnEndwyLJ+o4sq68AxPkYdbvUqcO+GcPWAmgP+drVGWu
   +IM4yV4Sa70zxIjKTqPkHf74uZ1utpBG/bQ0temEy2BvWNNvvLkKhN53K
   kjV7+sMxkNSGcPOGpSJT1CG9b3UHCHdqArRWg75G3ODWd1qzDno6XwQTd
   0F0ZV1UJnXUHCfn4dttON169CvY4aLm7h7pyl1VsEa8n05NZrlh/nZgb6
   rQkMY2SfAxEMVxpeQunkpRE0MC0IyMn2OYqyJFBDe3X2E83G8tt8jipNy
   CCb1SfxowwVjq3BMigR8xVjZbuQ3VyYQNT9C3RAv21e+gtzzhKvdm/s8i
   A==;
X-CSE-ConnectionGUID: FKWQCBsmS76IzIkqq+jryw==
X-CSE-MsgGUID: LdzsaDQBTRSkSFrgV6rKQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33746614"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33746614"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 08:51:56 -0800
X-CSE-ConnectionGUID: Ce9ulhLaRZWJfelSGXjQfw==
X-CSE-MsgGUID: uiWY02WDThWplwS1t6RV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="125292397"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2024 08:51:55 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJbYW-00025p-0A;
	Fri, 06 Dec 2024 16:51:52 +0000
Date: Sat, 7 Dec 2024 00:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v9-wip 21/22] drivers/net/veth.c:831:24: error:
 implicit declaration of function 'io_iov_get_page'
Message-ID: <202412070033.pIZAqCu2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v9-wip
head:   265a57e2057eabebef11b4b533a65ecf75284489
commit: 72118a096b5f2056c9fa57009c90c7d7ecd2e208 [21/22] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: i386-buildonly-randconfig-004 (https://download.01.org/0day-ci/archive/20241207/202412070033.pIZAqCu2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070033.pIZAqCu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070033.pIZAqCu2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_iou_rcv_skb':
>> drivers/net/veth.c:831:24: error: implicit declaration of function 'io_iov_get_page' [-Werror=implicit-function-declaration]
     831 |                 page = io_iov_get_page(netmem);
         |                        ^~~~~~~~~~~~~~~
   drivers/net/veth.c:831:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
