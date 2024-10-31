Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440D127B56
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388095; cv=none; b=mwxA8jAwnx8zCNr/QIXCV7lHz9EdELTiN5/0fF1ovhsGJB8Ao1tANshm6Iq1EyX3ZLt7PUFSSD7pp/twz6/6t1CZrrOQO6LH7d/Da7XR+KblsGWo0uj//dWsD8z/evgIQaZdyMkuPakp/0pR6uu2cOX0Tj44wtZnIkxKQxx5kKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388095; c=relaxed/simple;
	bh=fkK/comtrYPyu6lObxww/VPHgom9K47JX4fDYzdUUrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LloPpM2QHSTpd/9ksYvryYTEzI4vL0qY0pnRnmz5TlyZSkHu7GJHXO6wfj2kfFcfEY+fr2t8Pg0yY2pZkqtQJHFXPadEf8GLvm6k2KHBSN2mL5Vk+13RGT5NQ2vciq8pJ8jjq2aKxsgpyRPnlgsNcKZcpy8LvML1LE/4LFpZ2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kiAcNlx7; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kiAcNlx7"
Message-ID: <4a82fc29-f61b-46c2-82de-680a5671aa19@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730388089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swRVArudOaXLMM8wepovsReKpla43nKCn0Z88LSsG9Y=;
	b=kiAcNlx7Hbj4MPr/7T9OV0YyucKHsjZ/ak7KWr+Gy+uBG6OPLGRq9+78qnMWKuND5hqvN7
	QR7uCph73E4drpmn6iKYEr9wAN64bA579cGzvnSFF+U2i/CTkMxwqUX8fQTOkJdaTZxOt/
	N/zsKVB7fwMhQ6L0LVgI2UbQL24EWOc=
Date: Thu, 31 Oct 2024 11:21:25 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 7444/8186] kernel/dma/mapping.c:785:61:
 sparse: sparse: incorrect type in argument 5 (different base types)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>
References: <202410302243.1wnTlPk3-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <202410302243.1wnTlPk3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 10/30/24 10:52, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
> commit: 68b6dbf1f441c4eba3b8511728a41cf9b01dca35 [7444/8186] dma-mapping: trace more error paths
> config: csky-randconfig-r111-20241030 (https://download.01.org/0day-ci/archive/20241030/202410302243.1wnTlPk3-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
> reproduce: (https://download.01.org/0day-ci/archive/20241030/202410302243.1wnTlPk3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410302243.1wnTlPk3-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> kernel/dma/mapping.c:785:61: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int enum dma_data_direction dir @@     got restricted gfp_t [usertype] gfp @@
>    kernel/dma/mapping.c:785:61: sparse:     expected unsigned int enum dma_data_direction dir
>    kernel/dma/mapping.c:785:61: sparse:     got restricted gfp_t [usertype] gfp
>>> kernel/dma/mapping.c:785:66: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned int enum dma_data_direction dir @@
>    kernel/dma/mapping.c:785:66: sparse:     expected restricted gfp_t [usertype] flags
>    kernel/dma/mapping.c:785:66: sparse:     got unsigned int enum dma_data_direction dir
> 
> vim +785 kernel/dma/mapping.c
> 
>    764	
>    765	struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t size,
>    766			enum dma_data_direction dir, gfp_t gfp, unsigned long attrs)
>    767	{
>    768		struct sg_table *sgt;
>    769	
>    770		if (WARN_ON_ONCE(attrs & ~DMA_ATTR_ALLOC_SINGLE_PAGES))
>    771			return NULL;
>    772		if (WARN_ON_ONCE(gfp & __GFP_COMP))
>    773			return NULL;
>    774	
>    775		if (use_dma_iommu(dev))
>    776			sgt = iommu_dma_alloc_noncontiguous(dev, size, dir, gfp, attrs);
>    777		else
>    778			sgt = alloc_single_sgt(dev, size, dir, gfp);
>    779	
>    780		if (sgt) {
>    781			sgt->nents = 1;
>    782			trace_dma_alloc_sgt(dev, sgt, size, dir, gfp, attrs);
>    783			debug_dma_map_sg(dev, sgt->sgl, sgt->orig_nents, 1, dir, attrs);
>    784		} else {
>  > 785			trace_dma_alloc_sgt_err(dev, NULL, 0, size, gfp, dir, attrs);
>    786		}
>    787		return sgt;
>    788	}
>    789	EXPORT_SYMBOL_GPL(dma_alloc_noncontiguous);
>    790	
> 

I'll send a patch for this, but oddly enough I don't see this error with C=1:

  CHECK   ../kernel/dma/mapping.c
../kernel/dma/mapping.c: note: in included file (through ../include/trace/trace_events.h, ../include/trace/define_trace.h, ../include/trace/events/dma.h):
../include/trace/events/dma.h:115:1: sparse: error: too long token expansion
../include/trace/events/dma.h:161:1: sparse: error: too long token expansion

I'm using sparse 0.6.4, which seems to be the same as the bot.

--Sean
