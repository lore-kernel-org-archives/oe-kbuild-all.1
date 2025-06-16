Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52726D4E6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072876; cv=none; b=Q5+M49S+ZI2HUXFWuNDLEpAJt5Mb0aOQJMUaN8hLPUJR8Ym2k9sdH7GvsaVsuwnNR+VayJUJLRVOPiZvacZ/bAllSU7oLEvEP6ri84jnVRLbHEzQUnvGEvgNRGrHRIefx37fUw/1guAHWvwyaHRTLU89JC509yeKyk8K+yoaFiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072876; c=relaxed/simple;
	bh=qgYShiCICLGlyXPXkMFaa9MBddkYx+zhgvPZouJhpug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhffgOehiPPbBwYok1YvAi4A2l9p7s+TwzQNtBJIgvTT/JXzAPCD4IArPRtmPu0YTi9K96sVT+hIqXABNmAmf2UZMXFWgRV0H6mY9nhxJKBaInM0YdEM+JEUKM8NqKW1EOi+KwqYHC8yfej2vz7NbEAlF/up3aj2+bqydFB87Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lvbQnGuv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvbQnGuv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so24109275e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750072873; x=1750677673; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4euJ7IL/UtIuqUuTsf6umM3mNJN/f7JKsQPFpax4oo=;
        b=lvbQnGuvd2YcR9/6esGAnjWfODxW5l7Qlll99STlNnBcr3wtaNvsldpX2SiGBETLbm
         dbUYfJ8j336mjNV/QNyb3VPAJVT4drL+ILana+7W2TuDUC69HeZCYpGEWvowuujAstFG
         /gGiIIMme/FKYQkbSK5477uIq37JS6Aj23EPh3j4ZFRoxGLe8vUiNEUzQSTCAOggMWNT
         YIKQpPMuIa8RvvwZkKhBcIEe3vE9VhxLdv+3QHb538YxDlkw/gxQK8kxtIbLSmBiMHtJ
         eY0JdpHYe1+quSXWd0JF5OD32CnVeTvdjTVWtkOpojkNnVEm9GjvgzW1vI827AXjDdSx
         nPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072873; x=1750677673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4euJ7IL/UtIuqUuTsf6umM3mNJN/f7JKsQPFpax4oo=;
        b=vgbgm4nBAnutxKFz7qqee+80VhOmupHJkZHcPFmtKi40L1AJwzc1YgE5dn7Iay2PkU
         ApwthF4itPBLyLeFu/33imT0CAURWGA2aI5m5P1U3B23IeuR3ol4u82TeG86habfScRW
         usSHG/33sydrUWMrzsR4iKAwJ5Yt7XKO/zDhX630I7MFHKbNHxOSfy/gLFVK9e7PRVtX
         QRpYAbblu7rJ5Gm64QxYldfWVhbQ+eB5Hrog2Lnn7TnoExsDVAXfbFHSEPI1FfYCBkjV
         Hz/aYLNbw9KNiDwhrY+gHUKa8ewebV386HXbQhkz5PEnIftwebv0YRweQVFSb47Dp+1d
         UzlA==
X-Forwarded-Encrypted: i=1; AJvYcCUjYUXV+mOWriPfJ06akHuxVeercWUrYdF9NbUPaXT5mzpDbf8O7zA1ZSdrQ032ABQgR/EazeNXLVROo9EB@lists.linux.dev
X-Gm-Message-State: AOJu0YyHk4jwUvrCj8eSSlB+huBZsc19/ZGA8NVJ9TO/HYQ0LMKV3zhg
	T7y5pbaLTpb6+du3ehMDWT1qbGXE/swexRsDRGH9eZOhK9ofVAtMYK61VGgm44GZLF4=
X-Gm-Gg: ASbGncuNKZGnr+CGmrBbfuD90thCzSHMopzrBwQtKLdGN2GqkJKgak4tEZOYZwYTuLi
	1nXFhnK32dXcmSf8WKJS1ig2BFXnqLPzC/qUTNs6gupJQYSY1DHLDqIWRriUK8M90zylQnAQCbF
	DF/1fXixk0L4sqmYsW0oIqNB9kkvdoNV6MQJgjlQ/MATXNV9uZhUVv7zQ/q6t6MFQ3L0CNURnoa
	Hz8f1r2Ls7qFh9/FMNhTDb40+MthKVlXHwhQ653cyhDVlktJTtpvHjS+T+RfZLyAv4kqBxI2PrJ
	v7n/BJvTf4n8vtNyxxb/yY8nUgalLN8DVZKkOa/HP81Hj/KMUqhNfmSPUagMzMGqmcc=
X-Google-Smtp-Source: AGHT+IFm7lURtK3nakQke2Eo0A04R9F5ogbYQ5oAvV51pSxGomor7dB0raebWDwLvF03RocQuXgBNA==
X-Received: by 2002:a05:600c:a218:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-4533e57d98dmr39178155e9.32.1750072872918;
        Mon, 16 Jun 2025 04:21:12 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e254396sm145401575e9.28.2025.06.16.04.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:21:12 -0700 (PDT)
Message-ID: <7cf90a89-b381-48ae-98bc-1316022e03b6@linaro.org>
Date: Mon, 16 Jun 2025 12:21:11 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
To: hch@lst.de
Cc: olteanv@gmail.com, broonie@kernel.org, oe-kbuild-all@lists.linux.dev,
 arnd@arndb.de, larisa.grigore@nxp.com, Frank.li@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <202506160036.t9VDxF6p-lkp@intel.com>
 <20250616111749.316413-1-james.clark@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250616111749.316413-1-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 12:17 pm, James Clark wrote:
> The implementations are in mapping.c which requires HAS_DMA so stub them
> out if not present. This is required for some drivers to pass randconfig
> builds.
> 

So the commit message makes it seem like this fixes an existing issue 
and it would need a fixes: tag. But I didn't add one because it seems 
like it would only hit new users like in the linked patchset. It might 
be better to add a tag but it was changed 5 years ago and nobody hit it 
until now so I'm not sure.

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506160036.t9VDxF6p-lkp@intel.com/
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   include/linux/dma-mapping.h | 28 +++++++++++++++++++++-------
>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 55c03e5fe8cb..766f28a0e11f 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -161,6 +161,12 @@ void *dma_vmap_noncontiguous(struct device *dev, size_t size,
>   void dma_vunmap_noncontiguous(struct device *dev, void *vaddr);
>   int dma_mmap_noncontiguous(struct device *dev, struct vm_area_struct *vma,
>   		size_t size, struct sg_table *sgt);
> +struct page *dma_alloc_pages(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
> +void dma_free_pages(struct device *dev, size_t size, struct page *page,
> +		dma_addr_t dma_handle, enum dma_data_direction dir);
> +int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
> +		size_t size, struct page *page);
>   #else /* CONFIG_HAS_DMA */
>   static inline dma_addr_t dma_map_page_attrs(struct device *dev,
>   		struct page *page, size_t offset, size_t size,
> @@ -291,6 +297,21 @@ static inline int dma_mmap_noncontiguous(struct device *dev,
>   {
>   	return -EINVAL;
>   }
> +static inline struct page *dma_alloc_pages(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
> +{
> +	return NULL;
> +}
> +static inline void dma_free_pages(struct device *dev, size_t size,
> +		struct page *page, dma_addr_t dma_handle,
> +		enum dma_data_direction dir)
> +{
> +}
> +static inline int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
> +				 size_t size, struct page *page)
> +{
> +	return -EINVAL;
> +}
>   #endif /* CONFIG_HAS_DMA */
>   
>   #ifdef CONFIG_IOMMU_DMA
> @@ -438,13 +459,6 @@ static inline bool dma_need_unmap(struct device *dev)
>   }
>   #endif /* !CONFIG_HAS_DMA || !CONFIG_DMA_NEED_SYNC */
>   
> -struct page *dma_alloc_pages(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);
> -void dma_free_pages(struct device *dev, size_t size, struct page *page,
> -		dma_addr_t dma_handle, enum dma_data_direction dir);
> -int dma_mmap_pages(struct device *dev, struct vm_area_struct *vma,
> -		size_t size, struct page *page);
> -
>   static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
>   		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
>   {

