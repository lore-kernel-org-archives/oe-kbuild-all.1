Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C8870817
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717714; cv=none; b=rNHjArPg9g8xfveBpZGRGqSDYkGQZOSmecdpzPUZnqnf7w1xKocNI2KxZp9Hubjggiub/IglOOnm6m5A4iGVfhZ+NRmMCUkARFqo64NPzx2quw7mYEudHsv/JyqXxW+K+rPkqNK/d+/hcSdONgARCiYnCqlwDaCXfUmJpOHXaQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717714; c=relaxed/simple;
	bh=1fmST9iQW250EK4xwJEqRp0ejY6lwiQ33GJKs19WgrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQBbT27Gd5GmcmXlQo0XDWvQNZj4vfJ3EpzaNVazT5AWp+Hu7FS5xdzWdCpVNwfuT23Fub60b+YqmhOTJtpAwanYfyMNDhIysgOEzoMQM88YshVi7vQwUBZW3TSYB6nX+RjWR16Zn2g7XnbTg2R1cHRVu9qmM4G8e239dOAPstw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRWMpWxo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRWMpWxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717713; x=1765253713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fmST9iQW250EK4xwJEqRp0ejY6lwiQ33GJKs19WgrE=;
  b=KRWMpWxogS+d6xQQqchHRzBbsFvbn1D7ktivQT4fDYLt1bMMhmj7mlD6
   hO1UdiiTI2vtmhPg24vRLv+PAY2ncDcjcdG5atLlZhnZwp2tIyBJeTVp1
   K+d0yx+w1VfoVJk3HTCEAnsb7Dh8KzJdXQJ5xJszHo8f9DfENdwPEgcKI
   DIHsUVNs2SkhCxMhJ6dnEa2ciOPDS0OvC2QadBFiYPliZ0/JCW4Kb+jqi
   vLmzf4jHgxSheaZiHn7f+hxCke4VQZZbTTP4u0dUbOkav6G1qcCqtbhjU
   owybPuTxt1+Nqr2WiDXJwPrK/TwDL2NTtssEJ7/VpcfzwVkplQQMgwKtb
   g==;
X-CSE-ConnectionGUID: iSj8eMHERv6dEaxawWXtvw==
X-CSE-MsgGUID: o2KROJp6Q+iKP5FcUeVL2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21591489"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="21591489"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:15:10 -0800
X-CSE-ConnectionGUID: WLaEhhMMRfiIi4LEms6ENw==
X-CSE-MsgGUID: qsGcPSjyRVqoKMnrBwXKJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94756355"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 20:15:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVAo-0003op-0O;
	Mon, 09 Dec 2024 04:15:06 +0000
Date: Mon, 9 Dec 2024 12:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v9-wip 21/22] drivers/net/veth.c:818:17: sparse:
 sparse: cast from restricted netmem_ref
Message-ID: <202412071854.TFX4utCB-lkp@intel.com>
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
config: um-randconfig-r122-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071854.TFX4utCB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071854.TFX4utCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071854.TFX4utCB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/veth.c:818:17: sparse: sparse: cast from restricted netmem_ref

vim +818 drivers/net/veth.c

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
