Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB02701D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080222; cv=none; b=GiJ5gZiA6o9Wn+w6Hn+y1Zv51LYnSKyGsDoqgTrDIHvkomLcaiJRuOfaI8zWQicxrUCTEdSFggQoyG1LtlRIgbzGqHT5PTD1OQZ5uOoujYEPbBrfCJyQCg/X6q9hEdbVcYGvPMPpmxcsAOmUXt1GIlVwXxuk7fj2zL/zUcYBXDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080222; c=relaxed/simple;
	bh=cyawNk1X0Zi/5eV0YddzR83paiy0w8sFEtP0KMTHO+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSlapzHYY1l9+GQpqzRI9x+erpvKkDjPxPbxuO/CKhbjgn0A5qRSn3kIbHEmZIAqnLgfyJQ8tUldL4oTWMRYcEt0JDlOTsws1I2ZxxErmsZfBKfByQJbDoiMnYSwb7MzgSkndUWy+xp+dfNIC6TKbKSiKM7C1i8U/pxtuof5PIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0lIPrRX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0lIPrRX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45347d6cba3so2840005e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 06:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080219; x=1750685019; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/qEWpHoeWIO3tFYAF9CvYNghxJJaKn+YeJWG4YUN/nk=;
        b=g0lIPrRXeBkCdieZow4owicA0RwudmCxRTS/s1Q0+cxQEH0h09BhcKTdRn5mcSUkxf
         ww/7zrlzrbuTKNtCBRv7lFm6gPC2KMHfbgjyovgDJ7TUJb/jzLNlJINDoUiPfIl7JA1G
         TQALTbeI67RRszJhaLcwOz6CtcfLYAOAU9k1ydtLog5eVULZXEvV58K7rMWqvYeNZxts
         S5XO552SJbpIxzybVATjac8DeZTpHok9vyEpAHhPhZkqB6f32bV0WVVy0WUp2jJgf/ZM
         mFd0guyNm3so2Pj6HXcncuEsNPhJuZCRVJ/LKS/j4VoNDLI4jNIS2AkjhIq1N62eSLbE
         4C3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080219; x=1750685019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qEWpHoeWIO3tFYAF9CvYNghxJJaKn+YeJWG4YUN/nk=;
        b=kkCUmvu3dhkfTqDDXjVjuFqtKDoABGUXCmvN24r2ENY/qYbDm+N9z5cXeL+cPiSYrL
         pGtXNIAAqQfs/QoLGN9nRDRqDD59tGNzfWhsOu0OmV/ZOqziMdjdhpr6fe8Yrsb6k6V3
         +UrlATw7jgSW0wzL/3ORQwg/m94QYhVvSYJ5jo34rlhJ/FnXfgKtoJ+l/Apho0Y1Wd69
         LIRRB22jY5uEa6OKz3v7WzRvwKi7k/77uXxBKiZTaLxOuWrmZQ8d6QaKSMNSCGO9MC3b
         gStF8bw1VDSP2LUe2Qr6qEPrTGYqZuc4JD8shzlWaHnUQ9WVrHEB0RMARfJF8HonqNXQ
         XNWA==
X-Forwarded-Encrypted: i=1; AJvYcCVxDav7LNKToWFaJX2Rg2je3cfJc6KO+FTTjxPPrvFOuc6hvqhx354gF22ye8GBTlaiLr23EnHZxIEMwHaV@lists.linux.dev
X-Gm-Message-State: AOJu0YyN5B6YZ4RbCBzlOqupdR2tkYrQt2b/z6X9o4DyazI8c7Nzlkrm
	aTxkCNJchFMq5tvy7VPd8AufBJX/WEEmlP+dhP+Y8+WAf+QgSNlpq74MGb6W5eyjKNc=
X-Gm-Gg: ASbGncspGig+s80pyzbEOdct1tQUcDKjTrM/gDvbmG5ZZVUf6bq8yDhd4hi+uyNWEk9
	Z3LUFhp6fNC6ixWoPjdZdQRXYcgPHG7pPa6EQNoIpJ4xtDkdYca34/S/T8z+b0hQl+vSUmhUMc6
	RBtXPrzg4GkkVpvoppo0/bn7seVNITLRzq/fy3Xjk6otgOAi7Dnw+KMjFdj0qzGfijnz+cbMBKb
	b4mohiin+PWtKLS4LIbKxgyOkKtXgtMo2OmWaDaB+b2TLoz1vuXSdREaudE8UM8/CpUwZMctZCM
	mGy+x88Z8FpqW1sMV0WC89zmy6bMhQS0Ms2dlCZ9soKP3RuW1R2g8oo26fx07AL3N+A=
X-Google-Smtp-Source: AGHT+IERCtaWBolBNjDrXYPOFWEd3Y/yA2ERjVGzzTRMp9TUI6iIxEBCxIQatiSsuRqkKHIXYBVg9A==
X-Received: by 2002:a05:600c:1d1f:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-4534f9f165amr12231765e9.20.1750080218851;
        Mon, 16 Jun 2025 06:23:38 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e241b70sm142753815e9.18.2025.06.16.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:23:38 -0700 (PDT)
Message-ID: <f723d490-c228-42d5-9f9f-158df54a092d@linaro.org>
Date: Mon, 16 Jun 2025 14:23:37 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Brown <broonie@kernel.org>, olteanv@gmail.com,
 oe-kbuild-all@lists.linux.dev, arnd@arndb.de, larisa.grigore@nxp.com,
 Frank.li@nxp.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <20250616111749.316413-1-james.clark@linaro.org>
 <20250616112927.GA21689@lst.de>
 <5f1ca0ac-b66c-4b92-8f69-027c2468b117@sirena.org.uk>
 <20250616120832.GA24959@lst.de>
 <2d62254e-5cbe-4174-95d8-e80cae4f4543@sirena.org.uk>
 <20250616121444.GA25443@lst.de>
 <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
 <20250616131346.GB29838@lst.de>
 <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
 <d16bdc40-20d6-49db-bf41-18bb9b8e01fd@linaro.org>
 <20250616131944.GA30260@lst.de>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250616131944.GA30260@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 2:19 pm, Christoph Hellwig wrote:
> On Mon, Jun 16, 2025 at 02:15:56PM +0100, James Clark wrote:
>>> Yes it does, it has a few modes that don't require it. Presumably we can't
>>> just add a depends into the kconfig for all devices because they might not
>>> be using DMA.
>>
>> *for all the different variants of spi-fsl-dpsi devices I mean
> 
> This is drivers/spi/spi-fsl-dspi.c?
> 
> Yes, looks like it is one of those rare devices supporting a DMA and
> non-DMA mode.  But everything seems nicely guarded off using
> "dspi->devtype_data->trans_mode == DSPI_DMA_MODE" checks there.  So
> wrap them into a little helper using IS_ENABLED(CONFIG_HAS_DMA) and
> everything should be sorted out.

Sure, I don't mind doing it.

But separately to that, I still think making the stubs consistent would 
save people a lot of time diagnosing build failures if they switch 
existing code to any of those 3 functions. Principle of Least 
Astonishment and all that.

