Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F52DBF7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079761; cv=none; b=Nq6y4bBxpFtbFwXEcy32G2vJDuBq4qLl1G+6i2I1DzHHAhBnyLvjmxwKk2Y1cipddUQuBzR0ebvnJelrOI0+PHBW/qK6JXgvgQna+0UXCqmxPsRl9KE7bxMnpkLluDmQUbC8TBCW6UO4NKT9xUhjN0P3TB0AmDwf01NDMVoMx5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079761; c=relaxed/simple;
	bh=5hRzPTtmBcuXKvnr1u8SKXzEFc7yHR0Ah2bvFxcA2o8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WbToxIO59CuWrveNvP4aRKni6Y9g1MKOx8xPPnEvmi/Yxo4wuu5Wk0FeWmaFA4juUJfKAncCQHnkAwl4vehmLnxRLffQanNQwbPrgBDxZnjkNJZCb4aYgPR/VMX59XKwY2gcaus+jeVpd+4nfMrPRS/2KD5MOnISvbR8FtHT4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g85R3KON; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g85R3KON"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso14301725e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079758; x=1750684558; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MRJ1d1h4wdrkCI/v3DN5wRcdUPl+ITQvSsG/x26pFEQ=;
        b=g85R3KONidtVyh1PNaw+Trmt8LWv1hpuUfxiKWq8tnTJ+VbHdviPMx81ENIUgNAKBk
         LixRebdL9F5qISswwEN4Uix0K5Wc3/Y/BcHq1VUSApjPC5tTOptL58KbOra8ztEwdrcP
         udGvGhW0NyYXj50NHHE7cRMBj8Rp2lINRVGKGq6GalR00pbBNWFQ9M4PBwiG8WNTwv+E
         ruP2wrTakXfkWfspILfczdkK7LWIaaw7djmY98uacpVC7P21oVBCDQ8vytLH/sxQ5/iY
         H4CZoQdISENAwNP2zfbO0RnYN1W9kPzqvJA/bPp6wlu9Z3LChu/6JkW/oEI9sUi+rIJA
         cJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079758; x=1750684558;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRJ1d1h4wdrkCI/v3DN5wRcdUPl+ITQvSsG/x26pFEQ=;
        b=ZpE3dfcJEdLaoqmBCUpEV7QJN8x37uHrkw55m2jqRDwr/X7NUNvSERzCfv+pMFperk
         IkyyRTX11iQ/mtCFyPTYauGaCpAB6+dhZiNAqZRf1ElRqmm5mnYIJIYzoH22T2SXrBtD
         +5fB097cTmkq25z30NEWJ2ILafUvyhXxhxF+OWFqhWXSng4zpyxzqwkfO0ImDs68ttJZ
         JvCACQQNnODz5DZOTiK9pDeTr2wgJh3tJ7C+yBegJJVjHNLPQduTjGG36F8elNBwn/gv
         uyGTTNW0boB3ILqahqTYl6aeg0pUIA64yikUglhzJu5iHrRmu/hxPorGZrpYSju8pkQ/
         AlDA==
X-Forwarded-Encrypted: i=1; AJvYcCXIxBqGywrIzEQ/Gd3E1u8n8IAtTOavSOkVIIL7lSxMa/2Jlk30SNRB1RENZydCiztUpEm+FnviZR9+WZmQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu62oTdcSRg8qgSWq88etNahXu03kAGLf+U4+jXsXiykJRRecm
	Svryp/WBR/gxXxRuKoGNi3w+7OMyfsxuK9C6GwQgc6GOpWsSCQB34O4RaaeEwS5JXfY=
X-Gm-Gg: ASbGncsmpDnwnNE/ODosqbkS2+ZtinqMrb/DN25AOSkgJtjLdtn8qs08w3GiwTiSVKz
	Mm79G6V0A/teAmNHOUEovTkBlN0QKWgBtHgLTb79Ec12/VXA7JDJHyA/ZARP6ZLD8Bknk38gYs2
	LJHcu3rzq2107YTfEXJtnj5fwaZs6ShfScSEjo5pbWOce4vwk/Gy7B3GKA5oAhabRbHZ+tseDVy
	JP+pkYZsy/FIzg7wsDSNNXHCidHB8dqT0ZHt3wT4JbLRLcgjDcpJzg1qAbt7XU4sFyg4SEfFO53
	6o4AY9h7nor5y9e+koGGJnvcZ8d61/MbM+lG1EDRhdFtE7IFgzEUH3GiASI+FyTri6g=
X-Google-Smtp-Source: AGHT+IGAmjzfqrOCVqwqF8zQeuRiuJlPPFK6JjwkpluH+DPJPa87BVcnTa2cfcWuNNx592BuRyZiZA==
X-Received: by 2002:a05:6000:2585:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a572e99648mr7009457f8f.49.1750079758052;
        Mon, 16 Jun 2025 06:15:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm152625665e9.1.2025.06.16.06.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:15:57 -0700 (PDT)
Message-ID: <d16bdc40-20d6-49db-bf41-18bb9b8e01fd@linaro.org>
Date: Mon, 16 Jun 2025 14:15:56 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
From: James Clark <james.clark@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Brown <broonie@kernel.org>, olteanv@gmail.com,
 oe-kbuild-all@lists.linux.dev, arnd@arndb.de, larisa.grigore@nxp.com,
 Frank.li@nxp.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <202506160036.t9VDxF6p-lkp@intel.com>
 <20250616111749.316413-1-james.clark@linaro.org>
 <20250616112927.GA21689@lst.de>
 <5f1ca0ac-b66c-4b92-8f69-027c2468b117@sirena.org.uk>
 <20250616120832.GA24959@lst.de>
 <2d62254e-5cbe-4174-95d8-e80cae4f4543@sirena.org.uk>
 <20250616121444.GA25443@lst.de>
 <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
 <20250616131346.GB29838@lst.de>
 <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
Content-Language: en-US
In-Reply-To: <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 2:14 pm, James Clark wrote:
> 
> 
> On 16/06/2025 2:13 pm, Christoph Hellwig wrote:
>> On Mon, Jun 16, 2025 at 02:10:40PM +0100, James Clark wrote:
>>> The change introduces consistency with the existing declarations in
>>> dma-mapping.h. Surely there is value in consistency and it doesn't do 
>>> any
>>> harm to define new ones with stubs the same as the other ones. That way
>>> when you change an existing device that has DMA stuff to use a new 
>>> part of
>>> the API you don't have to predict that it will behave differently to
>>> another part of the API.
>>
>> Well, redoing the rest would definitively be nice, but so far no one
>> has signed up to that.
>>
>>> I suppose it is possible to #ifdef out the DMA stuff in this driver, but
>>> IMO it would be quite messy, and I don't think randomly not stubbing out
>>> some functions is the right way to move towards fixing all the 
>>> dependencies
>>> in all drivers. We should continue with the stubs for now and fix whole
>>> drivers one by one as a proper effort.
>>
>> Does the driver even work at all without DMA support?
>>
> 
> Yes it does, it has a few modes that don't require it. Presumably we 
> can't just add a depends into the kconfig for all devices because they 
> might not be using DMA.

*for all the different variants of spi-fsl-dpsi devices I mean

