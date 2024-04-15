Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1865234
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 05:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713160389; cv=none; b=qkxehT0gzxxXulesKqVmNAue6YnjTR7ZAJNTIm7gVXdL223uvIPrEJJDzhzU7POL8dYrQfOTwVrRrG6FKbbY2uuUqYRTCJUWrYjsQkqa9NmsIec6ixoKblJKkBLhZa0USugUi3Vw4az63s4LtPFnYfR1XrjbcgNK3QtpM+3BCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713160389; c=relaxed/simple;
	bh=LiuBbZAMnTQAfQuZ5hD9HDUrDri3yERiFiwwePw2kJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDQg/U5TFIYkNedTBya9Yf6Fo1BpbGcsjPZ46vj5j1/heDaQezKqTzxyDmlDX10gdkXJ60AkY1GV5u5vt+lM8/d3jr+lHDKyM6SlfLz4P0vxR0ZmNRvd1KhA1302kxHua4MzhEWqtEhuq03EXbkNn6A9E4jwoOU4yJB69IplOv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrsknZyD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrsknZyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713160388; x=1744696388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LiuBbZAMnTQAfQuZ5hD9HDUrDri3yERiFiwwePw2kJg=;
  b=CrsknZyDDEOYo/JITdSs4SY6XdsK0qsCY6l/6MM4ibLKEdfv8dapX8aL
   P3qqjKloJW1Kp6iV7Uy31sNBAwW6iOdIGWMaEy9RbtyK8z6aqdKAaKC0l
   jdfs49X8VgvYTZbmb80QrS9KlqeOxTQ9LMC77MXPCp5DxRl6nqhFE+MMO
   UQdyYRWFvagjSeibypzhpUpCGmO3ebna1cxgLQDyvu7JVdjP9a3U8KsLo
   3N/WcoSM7QtBqFhqBflXy7OZZt0XI54emSNKuiBejKXoKwEBL4B+3IbCF
   b2P19393h6lLKsrWJQ7UG+aN8RiV2S+739azl7brnVHF3+biUsIKcUhco
   g==;
X-CSE-ConnectionGUID: AOgcy4ZGRXKVwTGs3BMRlw==
X-CSE-MsgGUID: 1uW4zckiQyicQEaBmOUvlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19679046"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="19679046"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 22:53:07 -0700
X-CSE-ConnectionGUID: KvFTezTyTx+xao32zJwI9Q==
X-CSE-MsgGUID: rVtvQ+zeQUKeKmZETAEArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="26482733"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Apr 2024 22:53:05 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwFH3-00040C-2m;
	Mon, 15 Apr 2024 05:53:02 +0000
Date: Mon, 15 Apr 2024 13:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v3 1/2] net: Rename mono_delivery_time to
 tstamp_type for scalabilty
Message-ID: <202404151320.OKgzxL7H-lkp@intel.com>
References: <20240412210125.1780574-2-quic_abchauha@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412210125.1780574-2-quic_abchauha@quicinc.com>

Hi Abhishek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Chauhan/net-Rename-mono_delivery_time-to-tstamp_type-for-scalabilty/20240415-094415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240412210125.1780574-2-quic_abchauha%40quicinc.com
patch subject: [RFC PATCH bpf-next v3 1/2] net: Rename mono_delivery_time to tstamp_type for scalabilty
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240415/202404151320.OKgzxL7H-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151320.OKgzxL7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151320.OKgzxL7H-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ieee802154/6lowpan/reassembly.c: In function 'lowpan_frag_queue':
>> net/ieee802154/6lowpan/reassembly.c:133:14: error: 'struct inet_frag_queue' has no member named 'mono_delivery_time'
     133 |         fq->q.mono_delivery_time = skb->mono_delivery_time;
         |              ^
>> net/ieee802154/6lowpan/reassembly.c:133:39: error: 'struct sk_buff' has no member named 'mono_delivery_time'
     133 |         fq->q.mono_delivery_time = skb->mono_delivery_time;
         |                                       ^~


vim +133 net/ieee802154/6lowpan/reassembly.c

7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   83  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   84  static int lowpan_frag_queue(struct lowpan_frag_queue *fq,
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02   85  			     struct sk_buff *skb, u8 frag_type)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   86  {
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   87  	struct sk_buff *prev_tail;
f4606583fd8dcf net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02   88  	struct net_device *ldev;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   89  	int end, offset, err;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   90  
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   91  	/* inet_frag_queue_* functions use skb->cb; see struct ipfrag_skb_cb
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   92  	 * in inet_fragment.c
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   93  	 */
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   94  	BUILD_BUG_ON(sizeof(struct lowpan_802154_cb) > sizeof(struct inet_skb_parm));
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14   95  	BUILD_BUG_ON(sizeof(struct lowpan_802154_cb) > sizeof(struct inet6_skb_parm));
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   96  
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01   97  	if (fq->q.flags & INET_FRAG_COMPLETE)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   98  		goto err;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28   99  
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  100  	offset = lowpan_802154_cb(skb)->d_offset << 3;
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  101  	end = lowpan_802154_cb(skb)->d_size;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  102  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  103  	/* Is this the final fragment? */
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  104  	if (offset + skb->len == end) {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  105  		/* If we already have some bits beyond end
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  106  		 * or have different end, the segment is corrupted.
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  107  		 */
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  108  		if (end < fq->q.len ||
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  109  		    ((fq->q.flags & INET_FRAG_LAST_IN) && end != fq->q.len))
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  110  			goto err;
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  111  		fq->q.flags |= INET_FRAG_LAST_IN;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  112  		fq->q.len = end;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  113  	} else {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  114  		if (end > fq->q.len) {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  115  			/* Some bits beyond end -> corruption. */
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  116  			if (fq->q.flags & INET_FRAG_LAST_IN)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  117  				goto err;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  118  			fq->q.len = end;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  119  		}
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  120  	}
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  121  
f4606583fd8dcf net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  122  	ldev = skb->dev;
f4606583fd8dcf net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  123  	if (ldev)
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  124  		skb->dev = NULL;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  125  	barrier();
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  126  
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  127  	prev_tail = fq->q.fragments_tail;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  128  	err = inet_frag_queue_insert(&fq->q, skb, offset, end);
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  129  	if (err)
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  130  		goto err;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  131  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  132  	fq->q.stamp = skb->tstamp;
335c8cf3b53760 net/ieee802154/6lowpan/reassembly.c Martin KaFai Lau    2022-03-02 @133  	fq->q.mono_delivery_time = skb->mono_delivery_time;
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  134  	if (frag_type == LOWPAN_DISPATCH_FRAG1)
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  135  		fq->q.flags |= INET_FRAG_FIRST_IN;
72a5e6bb5120d6 net/ieee802154/6lowpan/reassembly.c Alexander Aring     2015-09-02  136  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  137  	fq->q.meat += skb->len;
6ce3b4dcee4f96 net/ieee802154/6lowpan/reassembly.c Eric Dumazet        2019-05-24  138  	add_frag_mem_limit(fq->q.fqdir, skb->truesize);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  139  
06aa8b8a0345c7 net/ieee802154/reassembly.c         Nikolay Aleksandrov 2014-08-01  140  	if (fq->q.flags == (INET_FRAG_FIRST_IN | INET_FRAG_LAST_IN) &&
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  141  	    fq->q.meat == fq->q.len) {
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  142  		int res;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  143  		unsigned long orefdst = skb->_skb_refdst;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  144  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  145  		skb->_skb_refdst = 0UL;
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  146  		res = lowpan_frag_reasm(fq, skb, prev_tail, ldev);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  147  		skb->_skb_refdst = orefdst;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  148  		return res;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  149  	}
254c5dbe15d44c net/ieee802154/6lowpan/reassembly.c Peter Oskolkov      2019-02-14  150  	skb_dst_drop(skb);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  151  
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  152  	return -1;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  153  err:
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  154  	kfree_skb(skb);
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  155  	return -1;
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  156  }
7240cdec60b136 net/ieee802154/reassembly.c         Alexander Aring     2014-02-28  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
