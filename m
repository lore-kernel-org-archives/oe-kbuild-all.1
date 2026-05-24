Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26375331237
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779631871; cv=none; b=RBlyczuGjgq1kSmgVwXRfmAtbofxH+PisPHtHkBLb2l62BaE2xUKJTGhVTwqNfsoMyIF5cNRi+UlSP/ElTrWlkzfG9Sj4/KGmGfN8zn3TqVb3fUc5VoLopH7rAGJVnbVT39RmmftmNoK8Lwzz63O65JCnkdpjmmmec+eP+NlsWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779631871; c=relaxed/simple;
	bh=dW4Ba542hbe2cczqRcbTgO5i5A5ph0eJo5HIV9cRIhY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y6T3OZT0TV2tXu9csO1IMCQ4xtJX+TghUGxSfDxHbC9VA+tbjBFRsWq/70FxBSuV6DyJalmW050uc1jaYqnU6NneuNaEf3zzfpSaQw7bWZHMzufkAqvXzmVLPXmNzz2fPLogQ/DhDBD5rpW3MxTj3WFnkq+H0wltFZu4RpJubo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElJ0BQn/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElJ0BQn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779631868; x=1811167868;
  h=date:from:to:cc:subject:message-id;
  bh=dW4Ba542hbe2cczqRcbTgO5i5A5ph0eJo5HIV9cRIhY=;
  b=ElJ0BQn/L5EYrhGiOVaGx0wt9mTyUKdjUd+tNXWYhiBLoaDrX5IQ877C
   TfyciGhia4zKVwawVAj8itJ/MGz4n/HfETHkRWYl0TpIkNnj8cTgJo+C7
   ssGoFBHKpl+M/5E1FhMddjWkFOMRNCSoUk4X6434y/y2HPOjGkZFM4Hs5
   5V9IKLc3zexlZrFFHPeKAKwRacJAiiENBBUqZMTddEActqxNLlBn/tp4V
   zJN7QzeenVQtM9um0wLstn+Y88g00MLozf0xRMN1HTMkW46K4zbVNNwac
   ZoVMQd8jMMYe5NF0oOjMOgd1+V5VWCdikDcBXag40wIEotiedqaG/qatx
   g==;
X-CSE-ConnectionGUID: uv7A0uT3Slanl85LjxQ/Ew==
X-CSE-MsgGUID: tqbfo+DSSE+OSniPYjExYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80387126"
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="80387126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 07:11:07 -0700
X-CSE-ConnectionGUID: R6NylBw3QE2QiMgbRwLwGw==
X-CSE-MsgGUID: Vn5nvbWVTkKjkJtpU8qjhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,166,1774335600"; 
   d="scan'208";a="265217123"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2026 07:11:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR9Xj-000000000I5-0i0W;
	Sun, 24 May 2026 14:11:03 +0000
Date: Sun, 24 May 2026 22:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:bvec-iter-cleanups 1/1] io_uring/net.c:1434:58:
 warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier
 from pointer target type
Message-ID: <202605242211.tCaQHdiI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git bvec-iter-cleanups
head:   f63858e85ce2b2cc55d98747311fd65088d1577d
commit: f63858e85ce2b2cc55d98747311fd65088d1577d [1/1] bvec: make the bvec_iter helpers inline functions
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605242211.tCaQHdiI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605242211.tCaQHdiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605242211.tCaQHdiI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/net.c: In function 'io_sg_from_iter':
>> io_uring/net.c:1434:58: warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1434 |                 struct bio_vec v = mp_bvec_iter_bvec(from->bvec, bi);
         |                                                      ~~~~^~~~~~
   In file included from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from include/linux/io_uring_types.h:4,
                    from io_uring/filetable.h:5,
                    from io_uring/net.c:13:
   include/linux/bvec.h:140:35: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                   ~~~~~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:44,
                    from include/linux/netdevice.h:38,
                    from include/net/inet_sock.h:19,
                    from include/linux/udp.h:16,
                    from net/sunrpc/xprtsock.c:34:
   net/sunrpc/xprtsock.c: In function 'xs_flush_bvec':
>> include/linux/bvec.h:224:40: warning: passing argument 1 of 'bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     224 |                 ((bvl = bvec_iter_bvec((bio_vec), (iter))), 1); \
         |                                        ^~~~~~~~~
   net/sunrpc/xprtsock.c:470:9: note: in expansion of macro 'for_each_bvec'
     470 |         for_each_bvec(bv, bvec, bi, bi)
         |         ^~~~~~~~~~~~~
   include/linux/bvec.h:171:32: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     171 | bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                ~~~~~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:44,
                    from include/linux/inet.h:42,
                    from net/sunrpc/svcsock.c:30:
   net/sunrpc/svcsock.c: In function 'svc_flush_bvec':
>> include/linux/bvec.h:224:40: warning: passing argument 1 of 'bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     224 |                 ((bvl = bvec_iter_bvec((bio_vec), (iter))), 1); \
         |                                        ^~~~~~~~~
   net/sunrpc/svcsock.c:324:9: note: in expansion of macro 'for_each_bvec'
     324 |         for_each_bvec(bv, bvec, bi, bi)
         |         ^~~~~~~~~~~~~
   include/linux/bvec.h:171:32: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     171 | bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                ~~~~~~~~~~~~~~~~^~~~~
--
   drivers/infiniband/core/rw.c: In function 'rdma_rw_init_mr_wrs_bvec':
>> drivers/infiniband/core/rw.c:232:55: warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     232 |                 struct bio_vec bv = mp_bvec_iter_bvec(bvecs, *iter);
         |                                                       ^~~~~
   In file included from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from include/linux/ethtool.h:18,
                    from include/rdma/ib_verbs.h:15,
                    from include/rdma/mr_pool.h:8,
                    from drivers/infiniband/core/rw.c:9:
   include/linux/bvec.h:140:35: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                   ~~~~~~~~~~~~~~~~^~~~~
   drivers/infiniband/core/rw.c: In function 'rdma_rw_init_single_wr_bvec':
   drivers/infiniband/core/rw.c:376:47: warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     376 |         struct bio_vec bv = mp_bvec_iter_bvec(bvecs, *iter);
         |                                               ^~~~~
   include/linux/bvec.h:140:35: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                   ~~~~~~~~~~~~~~~~^~~~~
   drivers/infiniband/core/rw.c: In function 'rdma_rw_init_map_wrs_bvec':
   drivers/infiniband/core/rw.c:444:63: warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     444 |                         struct bio_vec bv = mp_bvec_iter_bvec(bvecs, *iter);
         |                                                               ^~~~~
   include/linux/bvec.h:140:35: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                   ~~~~~~~~~~~~~~~~^~~~~
   drivers/infiniband/core/rw.c: In function 'rdma_rw_init_iova_wrs_bvec':
   drivers/infiniband/core/rw.c:504:38: warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     504 |         first_bv = mp_bvec_iter_bvec(bvec, *iter);
         |                                      ^~~~
   include/linux/bvec.h:140:35: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                   ~~~~~~~~~~~~~~~~^~~~~
   drivers/infiniband/core/rw.c:511:55: warning: passing argument 1 of 'mp_bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     511 |                 struct bio_vec bv = mp_bvec_iter_bvec(bvec, *iter);
         |                                                       ^~~~
   include/linux/bvec.h:140:35: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     140 | mp_bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                   ~~~~~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:44,
                    from include/linux/netdevice.h:38,
                    from include/net/inet_sock.h:19,
                    from include/linux/udp.h:16,
                    from xprtsock.c:34:
   xprtsock.c: In function 'xs_flush_bvec':
>> include/linux/bvec.h:224:40: warning: passing argument 1 of 'bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     224 |                 ((bvl = bvec_iter_bvec((bio_vec), (iter))), 1); \
         |                                        ^~~~~~~~~
   xprtsock.c:470:9: note: in expansion of macro 'for_each_bvec'
     470 |         for_each_bvec(bv, bvec, bi, bi)
         |         ^~~~~~~~~~~~~
   include/linux/bvec.h:171:32: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     171 | bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                ~~~~~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/skbuff.h:17,
                    from include/net/net_namespace.h:44,
                    from include/linux/inet.h:42,
                    from svcsock.c:30:
   svcsock.c: In function 'svc_flush_bvec':
>> include/linux/bvec.h:224:40: warning: passing argument 1 of 'bvec_iter_bvec' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     224 |                 ((bvl = bvec_iter_bvec((bio_vec), (iter))), 1); \
         |                                        ^~~~~~~~~
   svcsock.c:324:9: note: in expansion of macro 'for_each_bvec'
     324 |         for_each_bvec(bv, bvec, bi, bi)
         |         ^~~~~~~~~~~~~
   include/linux/bvec.h:171:32: note: expected 'struct bio_vec *' but argument is of type 'const struct bio_vec *'
     171 | bvec_iter_bvec(struct bio_vec *bvecs, struct bvec_iter iter)
         |                ~~~~~~~~~~~~~~~~^~~~~


vim +1434 io_uring/net.c

cd9021e88fddf0d Pavel Begunkov 2022-09-08  1413  
060f4ba6e40338a Pavel Begunkov 2024-06-27  1414  static int io_sg_from_iter(struct sk_buff *skb,
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1415  			   struct iov_iter *from, size_t length)
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1416  {
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1417  	struct skb_shared_info *shinfo = skb_shinfo(skb);
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1418  	int frag = shinfo->nr_frags;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1419  	int ret = 0;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1420  	struct bvec_iter bi;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1421  	ssize_t copied = 0;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1422  	unsigned long truesize = 0;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1423  
cd9021e88fddf0d Pavel Begunkov 2022-09-08  1424  	if (!frag)
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1425  		shinfo->flags |= SKBFL_MANAGED_FRAG_REFS;
cd9021e88fddf0d Pavel Begunkov 2022-09-08  1426  	else if (unlikely(!skb_zcopy_managed(skb)))
060f4ba6e40338a Pavel Begunkov 2024-06-27  1427  		return zerocopy_fill_skb_from_iter(skb, from, length);
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1428  
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1429  	bi.bi_size = min(from->count, length);
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1430  	bi.bi_bvec_done = from->iov_offset;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1431  	bi.bi_idx = 0;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1432  
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1433  	while (bi.bi_size && frag < MAX_SKB_FRAGS) {
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12 @1434  		struct bio_vec v = mp_bvec_iter_bvec(from->bvec, bi);
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1435  
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1436  		copied += v.bv_len;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1437  		truesize += PAGE_ALIGN(v.bv_len + v.bv_offset);
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1438  		__skb_fill_page_desc_noacc(shinfo, frag++, v.bv_page,
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1439  					   v.bv_offset, v.bv_len);
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1440  		bvec_iter_advance_single(from->bvec, &bi, v.bv_len);
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1441  	}
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1442  	if (bi.bi_size)
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1443  		ret = -EMSGSIZE;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1444  
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1445  	shinfo->nr_frags = frag;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1446  	from->bvec += bi.bi_idx;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1447  	from->nr_segs -= bi.bi_idx;
dfb58b1796d19c8 Pavel Begunkov 2022-08-26  1448  	from->count -= copied;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1449  	from->iov_offset = bi.bi_bvec_done;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1450  
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1451  	skb->data_len += copied;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1452  	skb->len += copied;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1453  	skb->truesize += truesize;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1454  	return ret;
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1455  }
3ff1a0d395c00e4 Pavel Begunkov 2022-07-12  1456  

:::::: The code at line 1434 was first introduced by commit
:::::: 3ff1a0d395c00e42ee15f561431e0c04097595b9 io_uring: enable managed frags with register buffers

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
