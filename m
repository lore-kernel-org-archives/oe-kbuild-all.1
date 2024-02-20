Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137D6763E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708446487; cv=none; b=fJBr7NSZN1IfLi7t7f3LWonGLmE52x+QjssaUW7si3TGY2YD4dO06hAbIqPuas3ZOIF6ZcFChvSippeKoQCKczKey+v552Ey8iJ7asqwM4lJHtzIXAC6Iy25SVH9oY4Q0ygeLUuhnQIfkv2iRy5zkWVbpbShKY+oW/zTosThoC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708446487; c=relaxed/simple;
	bh=hLhDzz1u4d8/DIKfZ+o1sxdWKkA9svzQSpaqYI6NF8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erQiJREAJLOqK9g0B8oxvtVYp7FCsGOrrnoph86kNQehniQzTlAXdLOLS/uIVTaW1SWU2h1UIznzHnqowxYFl942T7W5DfBHfueHJvt0BkFVAdssyEiz42wqxOwHjSzCEpZAPa1l2pxXEwNbxEO3+n9UpsKXgxgK05MEVNl+1cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ND6ZoULX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ND6ZoULX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708446486; x=1739982486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLhDzz1u4d8/DIKfZ+o1sxdWKkA9svzQSpaqYI6NF8Q=;
  b=ND6ZoULXih4sgQ0MiLVy32Io9GJGckJUUcVl3l3EsYcl7pG8OoTdQ4X1
   2cbyr/GVM/CKpbl1yykOZIksiadrkw+KG6SBHpZHviAYdfC4GCPQbL0tH
   9ra6frX2Ld3c0o3ZiYDN8ra7iU2TC/FD5WlIIryFv5lo3NthH1XWAd/3t
   TQ7mM1V3exXQWW2qRPm8dXBNRvE6QKg/Nk01n0qKx+61+mE4jOG+4Rzne
   BScnxto/SuQYiESoKlJ3gZOWqgmLVrOG6FvJ8rogROtle01OAtrBQxaPr
   gtIF4M+31fqTjvbQ5F0exvHKks9Drt6YSPqyHCgjAMrsd2nSWpzSif0FQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5514322"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5514322"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 08:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9532370"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Feb 2024 08:28:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcSyP-0004fM-1t;
	Tue, 20 Feb 2024 16:28:01 +0000
Date: Wed, 21 Feb 2024 00:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 56/68] net/core/xdp.c:707:14: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202402210024.pBroVuIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   1798281dc80d8b04af2d0e2adbbe43ce74afac43
commit: 26b6f719a50824efd0bc100673ff7fab78346b5d [56/68] xsk: add generic XSk xdp_buff -> skb conversion
config: x86_64-randconfig-122-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210024.pBroVuIA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210024.pBroVuIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402210024.pBroVuIA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/xdp.c:707:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct page_pool * @@
   net/core/xdp.c:707:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/core/xdp.c:707:14: sparse:     got struct page_pool *
   net/core/xdp.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> net/core/xdp.c:707:14: sparse: sparse: dereference of noderef expression

vim +707 net/core/xdp.c

   695	
   696	struct sk_buff *xdp_build_skb_from_zc(struct napi_struct *napi,
   697					      struct xdp_buff *xdp)
   698	{
   699		const struct xdp_rxq_info *rxq = xdp->rxq;
   700		struct page_pool *pp;
   701		struct sk_buff *skb;
   702		int metalen;
   703	#if IS_ENABLED(CONFIG_PAGE_POOL)
   704		u32 truesize;
   705		void *data;
   706	
 > 707		pp = this_cpu_ptr(system_page_pool);
   708		truesize = xdp->frame_sz;
   709	
   710		data = page_pool_dev_alloc_va(pp, &truesize);
   711		if (unlikely(!data))
   712			return NULL;
   713	
   714		skb = napi_build_skb(data, truesize);
   715		if (unlikely(!skb)) {
   716			page_pool_free_va(pp, data, true);
   717			return NULL;
   718		}
   719	
   720		skb_mark_for_recycle(skb);
   721		skb_reserve(skb, xdp->data_meta - xdp->data_hard_start);
   722	#else /* !CONFIG_PAGE_POOL */
   723		pp = NULL;
   724	
   725		skb = __napi_alloc_skb(napi, xdp->data_end - xdp->data_meta,
   726				       GFP_ATOMIC | __GFP_NOWARN);
   727		if (unlikely(!skb))
   728			return NULL;
   729	#endif /* !CONFIG_PAGE_POOL */
   730	
   731		__skb_put_data(skb, xdp->data_meta, xdp->data_end - xdp->data_meta);
   732	
   733		metalen = xdp->data - xdp->data_meta;
   734		if (metalen > 0) {
   735			skb_metadata_set(skb, metalen);
   736			__skb_pull(skb, metalen);
   737		}
   738	
   739		skb_record_rx_queue(skb, rxq->queue_index);
   740	
   741		if (unlikely(xdp_buff_has_frags(xdp)) &&
   742		    !xdp_copy_frags_from_zc(skb, xdp, pp)) {
   743			napi_consume_skb(skb, 1);
   744			return NULL;
   745		}
   746	
   747		xsk_buff_free(xdp);
   748	
   749		skb->protocol = eth_type_trans(skb, rxq->dev);
   750	
   751		return skb;
   752	}
   753	EXPORT_SYMBOL_GPL(xdp_build_skb_from_zc);
   754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
