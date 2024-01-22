Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E803D0A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931403; cv=none; b=kQ4i28Laozy7b7XZfhYEoGdAhaL2dltoznhGrY/oBCHaH9v8QrlH2fZcM584wW0iZA0VKCdvkjduzTs/kfnmOerRH+aC+Rv8LmSqgEvvqb9kMQ6wCIOLYh0MLSXtDlZLjfDlpZGefCIpF2oBDZeCZ5Xb/eak66nC4OAs1+4wj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931403; c=relaxed/simple;
	bh=AsR92Qul/kPzWl4F8IsTgCXXpCWXZzhpxlRkzUU9C5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNUiwEiml7hLu94YeuiNoBjKUG54bT/aIdKlXURPUctuVGaCBb8sbfc1GLe387n7Nv1T3E8XzIghcguvyZihFgdKY12y0d6mOvorPb4BTMFUyIbBk/KLRqgVKRgpw6e62XKGidYsxzw/G3C4M6ZChuqpWC3DWmOpI0h97eTYVaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iME5k7KA; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iME5k7KA"
Message-ID: <8f844ac1-eecf-4ace-854e-6d7d7aad9ad6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1705931398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RDkdMirtZyp8HbyqNelbeKkEckAGsYRT6v80Jg0SByQ=;
	b=iME5k7KAW/imH7KHcDV3Z2xsVy9NAV+qsGCly68RrzMCyZnq9KmhI0lmjy/6nubBnzLDVp
	tum9z0GnJgzJAzSnOlYHIjpFme1xtNFKACVR/NBDIbHVFkK2vkx9Tz84lv1YYY+AcOD3qQ
	tLPQQxMiXb0UcmNN11i4L4r1VO5OpNc=
Date: Mon, 22 Jan 2024 21:49:54 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 139/1036]
 drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.
 (fwd)
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>, Lucas Stach <l.stach@pengutronix.de>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 oe-kbuild-all@lists.linux.dev
References: <94afe420-f3b-5620-2380-82c9c62838f0@inria.fr>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui JIngfeng <sui.jingfeng@linux.dev>
In-Reply-To: <94afe420-f3b-5620-2380-82c9c62838f0@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2024/1/22 20:33, Julia Lawall wrote:
> The of_node_put on line 614 does not look useful.

Simply delete that line would solve this problem, what do you think?


>
> ---------- Forwarded message ----------
> Date: Mon, 22 Jan 2024 19:18:22 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [linux-next:master 139/1036]
>      drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.
>
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: Linux Memory Management List <linux-mm@kvack.org>
> TO: Sui Jingfeng <suijingfeng@loongson.cn>
> CC: Lucas Stach <l.stach@pengutronix.de>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   319fbd8fc6d339e0a1c7b067eed870c518a13a02
> commit: 56df40c804fa40712239478355abe265aeda2197 [139/1036] drm/etnaviv: Add a helper to get the first available GPU device node
> :::::: branch date: 10 hours ago
> :::::: commit date: 3 months ago
> config: x86_64-randconfig-102-20240122 (https://download.01.org/0day-ci/archive/20240122/202401221903.GjEKVu8R-lkp@intel.com/config)
> compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202401221903.GjEKVu8R-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/etnaviv/etnaviv_drv.c:614:3-14: ERROR: probable double put.
> vim +614 drivers/gpu/drm/etnaviv/etnaviv_drv.c
>
> a8c21a5451d831 The etnaviv authors 2015-12-03  597
> a8c21a5451d831 The etnaviv authors 2015-12-03  598  static int etnaviv_pdev_probe(struct platform_device *pdev)
> a8c21a5451d831 The etnaviv authors 2015-12-03  599  {
> a8c21a5451d831 The etnaviv authors 2015-12-03  600  	struct device *dev = &pdev->dev;
> 0ea057a9cb2be4 Michael Walle       2021-09-07  601  	struct device_node *first_node = NULL;
> a8c21a5451d831 The etnaviv authors 2015-12-03  602  	struct component_match *match = NULL;
> a8c21a5451d831 The etnaviv authors 2015-12-03  603
> 246774d17fc05a Lucas Stach         2018-01-24  604  	if (!dev->platform_data) {
> a8c21a5451d831 The etnaviv authors 2015-12-03  605  		struct device_node *core_node;
> a8c21a5451d831 The etnaviv authors 2015-12-03  606
> 246774d17fc05a Lucas Stach         2018-01-24  607  		for_each_compatible_node(core_node, NULL, "vivante,gc") {
> 246774d17fc05a Lucas Stach         2018-01-24  608  			if (!of_device_is_available(core_node))
> 246774d17fc05a Lucas Stach         2018-01-24  609  				continue;
> a8c21a5451d831 The etnaviv authors 2015-12-03  610
> 97ac0e47aed5f6 Russell King        2016-10-19  611  			drm_of_component_match_add(&pdev->dev, &match,
> 0a522394202f1f Yong Wu             2022-02-14  612  						   component_compare_of, core_node);
> 56df40c804fa40 Sui Jingfeng        2023-10-02  613
> 56df40c804fa40 Sui Jingfeng        2023-10-02 @614  			of_node_put(core_node);
> a8c21a5451d831 The etnaviv authors 2015-12-03  615  		}
> 246774d17fc05a Lucas Stach         2018-01-24  616  	} else {
> a8c21a5451d831 The etnaviv authors 2015-12-03  617  		char **names = dev->platform_data;
> a8c21a5451d831 The etnaviv authors 2015-12-03  618  		unsigned i;
> a8c21a5451d831 The etnaviv authors 2015-12-03  619
> a8c21a5451d831 The etnaviv authors 2015-12-03  620  		for (i = 0; names[i]; i++)
> 0a522394202f1f Yong Wu             2022-02-14  621  			component_match_add(dev, &match, component_compare_dev_name, names[i]);
> a8c21a5451d831 The etnaviv authors 2015-12-03  622  	}
> a8c21a5451d831 The etnaviv authors 2015-12-03  623
> f5be833dc86f49 Michael Walle       2021-09-07  624  	/*
> f5be833dc86f49 Michael Walle       2021-09-07  625  	 * PTA and MTLB can have 40 bit base addresses, but
> f5be833dc86f49 Michael Walle       2021-09-07  626  	 * unfortunately, an entry in the MTLB can only point to a
> f5be833dc86f49 Michael Walle       2021-09-07  627  	 * 32 bit base address of a STLB. Moreover, to initialize the
> f5be833dc86f49 Michael Walle       2021-09-07  628  	 * MMU we need a command buffer with a 32 bit address because
> f5be833dc86f49 Michael Walle       2021-09-07  629  	 * without an MMU there is only an indentity mapping between
> f5be833dc86f49 Michael Walle       2021-09-07  630  	 * the internal 32 bit addresses and the bus addresses.
> f5be833dc86f49 Michael Walle       2021-09-07  631  	 *
> f5be833dc86f49 Michael Walle       2021-09-07  632  	 * To make things easy, we set the dma_coherent_mask to 32
> f5be833dc86f49 Michael Walle       2021-09-07  633  	 * bit to make sure we are allocating the command buffers and
> f5be833dc86f49 Michael Walle       2021-09-07  634  	 * TLBs in the lower 4 GiB address space.
> f5be833dc86f49 Michael Walle       2021-09-07  635  	 */
> f5be833dc86f49 Michael Walle       2021-09-07  636  	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
> f5be833dc86f49 Michael Walle       2021-09-07  637  	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
> f5be833dc86f49 Michael Walle       2021-09-07  638  		dev_dbg(&pdev->dev, "No suitable DMA available\n");
> f5be833dc86f49 Michael Walle       2021-09-07  639  		return -ENODEV;
> f5be833dc86f49 Michael Walle       2021-09-07  640  	}
> f5be833dc86f49 Michael Walle       2021-09-07  641
> 0ea057a9cb2be4 Michael Walle       2021-09-07  642  	/*
> 0ea057a9cb2be4 Michael Walle       2021-09-07  643  	 * Apply the same DMA configuration to the virtual etnaviv
> 0ea057a9cb2be4 Michael Walle       2021-09-07  644  	 * device as the GPU we found. This assumes that all Vivante
> 0ea057a9cb2be4 Michael Walle       2021-09-07  645  	 * GPUs in the system share the same DMA constraints.
> 0ea057a9cb2be4 Michael Walle       2021-09-07  646  	 */
> 56df40c804fa40 Sui Jingfeng        2023-10-02  647  	first_node = etnaviv_of_first_available_node();
> 56df40c804fa40 Sui Jingfeng        2023-10-02  648  	if (first_node) {
> 0ea057a9cb2be4 Michael Walle       2021-09-07  649  		of_dma_configure(&pdev->dev, first_node, true);
> 56df40c804fa40 Sui Jingfeng        2023-10-02  650  		of_node_put(first_node);
> 56df40c804fa40 Sui Jingfeng        2023-10-02  651  	}
> 0ea057a9cb2be4 Michael Walle       2021-09-07  652
> a8c21a5451d831 The etnaviv authors 2015-12-03  653  	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
> a8c21a5451d831 The etnaviv authors 2015-12-03  654  }
> a8c21a5451d831 The etnaviv authors 2015-12-03  655
>
