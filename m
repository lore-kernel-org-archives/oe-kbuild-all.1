Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9D62EAE5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711839332; cv=none; b=LQqsInT0x9NNd4x81OMbsmg2MZ0OrJBSxqJuiDhhSo3GjwyA6pEjy9BOThlbYeKmWja24R8JSVvRfS/DQ8nBtJ5cuNb5cebfD4sFrPOBMX9Er/5fNPdOm6FhXTkBKHC5lxSK9l9UwwUxtHSdar6RPt3rOpJZjXCZvf0HwPijCIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711839332; c=relaxed/simple;
	bh=baECERpdsr145GuNGzO5VgRbJDUXMi1CZuWV4Hio1QA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=s6HRV999IgDC8Klvw4QXO1HsvjZq42sxK2sXKW94/vt3UTHncunlEsEpOc5R/ipmP/tlajpMuc1ZB0WiIVaGXtP4nzQ3G5lCuXcGtBOX/bcGTVPp6E0gUqnlmHzC6h7WBK2A5R3/U98B45i4c3nZuUMzjNIl9UST3fCWjsJbDws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=r9NWeroj; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="r9NWeroj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EtAo8uQyR30PtI03AYyA3qSzdl1DAIgP8IfyzB8UMHg=;
  b=r9NWerojb8X2Q73GDFth22B7q3+tdOfyItFdEY3BEviWFoosMomm7U9t
   WAqyOujrz40AikqwlQLJ51e0tNAq8UdBHPqT3tKEFHt58eDxhbLC3Umib
   7GxxU9JIJbuiZAwYYG5Txos4ihVorzbmuor4ZNGYfKUI9bfJya/SCwzrU
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,168,1708383600"; 
   d="scan'208";a="83513855"
Received: from 71-51-181-183.chvl.centurylink.net (HELO hadrien) ([71.51.181.183])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 23:55:06 +0100
Date: Sat, 30 Mar 2024 18:54:52 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 60/74] drivers/net/ethernet/intel/libeth/rx.c:180:11-12:
 WARNING kvmalloc is used to allocate this memory at line 164 (fwd)
Message-ID: <8bcbdfc-9be5-e1ae-c1e5-43ddec4451e5@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

It looks like kvfree should be used.

---------- Forwarded message ----------
Date: Sun, 31 Mar 2024 06:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [alobakin:idpf-libie-new 60/74]
    drivers/net/ethernet/intel/libeth/rx.c:180:11-12: WARNING kvmalloc is used
    to allocate this memory at line 164

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexander Lobakin <aleksander.lobakin@intel.com>

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   f7e5ff9972ee9afd57afebedbc55c37173d39dd3
commit: 1529de47fcee1dc7805a0ddfd8c8d75bd4a99c36 [60/74] libie: support native XDP and register memory model
:::::: branch date: 29 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-052-20240329 (https://download.01.org/0day-ci/archive/20240331/202403310626.XY01b0CL-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403310626.XY01b0CL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/libeth/rx.c:180:11-12: WARNING kvmalloc is used to allocate this memory at line 164

vim +180 drivers/net/ethernet/intel/libeth/rx.c

e5e39cdea755af Alexander Lobakin 2023-12-04  128
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  129  /**
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  130   * libeth_rx_fq_create - create a PP with the default libeth settings
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  131   * @fq: buffer queue struct to fill
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  132   * @napi: &napi_struct covering this PP (no usage outside its poll loops)
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  133   *
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  134   * Return: %0 on success, -%errno on failure.
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  135   */
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  136  int libeth_rx_fq_create(struct libeth_fq *fq, struct napi_struct *napi)
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  137  {
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  138  	struct page_pool_params pp = {
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  139  		.flags		= PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  140  		.order		= LIBETH_RX_PAGE_ORDER,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  141  		.pool_size	= fq->count,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  142  		.nid		= NUMA_NO_NODE,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  143  		.dev		= napi->dev->dev.parent,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  144  		.netdev		= napi->dev,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  145  		.napi		= napi,
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  146  	};
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  147  	struct libeth_fqe *fqes;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  148  	struct page_pool *pool;
1529de47fcee1d Alexander Lobakin 2023-12-08  149  	int ret;
1529de47fcee1d Alexander Lobakin 2023-12-08  150
1529de47fcee1d Alexander Lobakin 2023-12-08  151  	pp.dma_dir = fq->xdp ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  152
e5e39cdea755af Alexander Lobakin 2023-12-04  153  	if (!fq->hsplit)
e5e39cdea755af Alexander Lobakin 2023-12-04  154  		ret = libeth_rx_page_pool_params(fq, &pp);
e5e39cdea755af Alexander Lobakin 2023-12-04  155  	else
e5e39cdea755af Alexander Lobakin 2023-12-04  156  		ret = libeth_rx_page_pool_params_zc(fq, &pp);
e5e39cdea755af Alexander Lobakin 2023-12-04  157  	if (!ret)
e5e39cdea755af Alexander Lobakin 2023-12-04  158  		return -EINVAL;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  159
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  160  	pool = page_pool_create(&pp);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  161  	if (IS_ERR(pool))
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  162  		return PTR_ERR(pool);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  163
4fe2fda36b31e0 Alexander Lobakin 2023-06-20 @164  	fqes = kvcalloc(fq->count, sizeof(*fqes), GFP_KERNEL);
1529de47fcee1d Alexander Lobakin 2023-12-08  165  	if (!fqes) {
1529de47fcee1d Alexander Lobakin 2023-12-08  166  		ret = -ENOMEM;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  167  		goto err_buf;
1529de47fcee1d Alexander Lobakin 2023-12-08  168  	}
1529de47fcee1d Alexander Lobakin 2023-12-08  169
1529de47fcee1d Alexander Lobakin 2023-12-08  170  	ret = xdp_reg_page_pool(pool);
1529de47fcee1d Alexander Lobakin 2023-12-08  171  	if (ret)
1529de47fcee1d Alexander Lobakin 2023-12-08  172  		goto err_mem;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  173
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  174  	fq->fqes = fqes;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  175  	fq->pp = pool;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  176
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  177  	return 0;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  178
1529de47fcee1d Alexander Lobakin 2023-12-08  179  err_mem:
1529de47fcee1d Alexander Lobakin 2023-12-08 @180  	kfree(fqes);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  181  err_buf:
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  182  	page_pool_destroy(pool);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  183
1529de47fcee1d Alexander Lobakin 2023-12-08  184  	return ret;
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  185  }
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  186  EXPORT_SYMBOL_NS_GPL(libeth_rx_fq_create, LIBETH);
4fe2fda36b31e0 Alexander Lobakin 2023-06-20  187

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
