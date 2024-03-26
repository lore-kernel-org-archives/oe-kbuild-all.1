Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5F6D1AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711457594; cv=none; b=Bh6xXPBPwcDhHN/fw6TdPa2nBFsMBqCe12MbuSQpwRMTt3biFpC4qP6LEZyrVHPDOcJ3A5lvJ/Zd3PUYjsHsfTT59NZ+jwwnk2PHFlLHHrBScbXcjQYJv8RGRl9DTlIHwdRDTjD9+3aOTa1pbaPSsJzAIxrFc66UAL7rg+9mfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711457594; c=relaxed/simple;
	bh=D0gf/IIiOdRrTzQPmEqs6dw22YmfE35wanB04bQzG/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPl2uXjRu6U5K0Fvk/tp+xw+ouM0NmL88jYilG7111XngcAayL9xYnmTpIjUas22RR0H1xh09Y84e+XKDgzefNxok9uBOUbYxvMnV3A1hbqGlx7CWr36t/Yd/ELd6V9S3mju/petYiQEAaEUzIQkKAeSmPuMFxTpzfhjYMTUN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YfWGyLpA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfWGyLpA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a468004667aso741824366b.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711457591; x=1712062391; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jqY7dtezuqLgE8Dj4vNtSyeNX5nIll55/bWPSb26Glw=;
        b=YfWGyLpAcbfW3Uxb+NAnGwY2uaVM6RbWWHu0UWO06MFvz92J8jbdnl8NHZhgmBiwWl
         vMDOuybjcxeizyx4Sq2dUXB2s4iyLl4x8LIBKs1oN86Lt69dirEjcLxF4iuW4Mxp6SP5
         5YXpzyTfaNJaV9QkpT9gxiobebQxL3ea0J/42BotZ/LFzZksOQH+b3Hg/SOF4m6E9ol1
         QaopaV1p7OQ6kfFggWxiOsMjK9mX3+VC7HzdGdIKXJtUoXcQH1Pymy+wnU2cHYnaaNSM
         TrtQXIZJiXTkltGa1qpBAZOVbyUu7AUAh8Svd59/+FM+s3+UQDbz04AS4vd3QMQEndOZ
         ppRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711457591; x=1712062391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqY7dtezuqLgE8Dj4vNtSyeNX5nIll55/bWPSb26Glw=;
        b=vNQC9+M8weCcj4izUPahcAhoZgKG0C76qANQNZSb4q2kIuo7jjQ+xWBO1BbDCdWazk
         QtkCyyMPb/gPruuXxrxMdHhscOuqZR3Rvd25nuSf0PSTCuZJYfl98o/Z3Lh6DIaa4QYm
         5rdVssLE25HTD5H9/TKxrcnRgKZKWHywEpn2b3cldSpXQRyK02KyqYYGwTiNxVPg9bye
         wSGr9rLzBD2Emk8VgJWyvPCCH1Fjx05sQsf1agC+bKos4iWS6NbrYaDBrnVLDvEkn2X/
         LyOAa7PleHXhmoXdgEQcWLBcQLiw2IFKHJKLC3942FCQpp6xLrSCa8ANoVeGBgHzFEx5
         FwEg==
X-Gm-Message-State: AOJu0YzR5FFZlN/E1RXTNFtxM0n+yjXjWrEE+hilyUo0YXrlSo130YjG
	O8JwDuzYTj2W2PZ/1gWXhAL4fhD+9FKqhVOSEvuBFPAVmt6WC+FGsW5Jvbk/r2s=
X-Google-Smtp-Source: AGHT+IHvGrE9FCVBLaz0A22qY2bJudIEne42Hu5s+1uin/aDnnu0wMnBjHUI5mUImBPH6muq7dWg8g==
X-Received: by 2002:a17:907:7ea7:b0:a47:31c8:81f5 with SMTP id qb39-20020a1709077ea700b00a4731c881f5mr1049303ejc.47.1711457591158;
        Tue, 26 Mar 2024 05:53:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090622cb00b00a4655513f0bsm4171767eja.88.2024.03.26.05.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 05:53:10 -0700 (PDT)
Message-ID: <727c3a30-d704-4d28-af40-a01e28ca042e@linaro.org>
Date: Tue, 26 Mar 2024 13:53:08 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] virt: vmgenid: add support for devicetree bindings
To: kernel test robot <lkp@intel.com>, Sudan Landge <sudanl@amazon.com>,
 tytso@mit.edu, Jason@zx2c4.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, thomas.lendacky@amd.com,
 dan.j.williams@intel.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, graf@amazon.de, dwmw@amazon.co.uk,
 bchalios@amazon.es, xmarcalx@amazon.co.uk
References: <20240325195306.13133-5-sudanl@amazon.com>
 <202403262047.aZVjmDY5-lkp@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <202403262047.aZVjmDY5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/03/2024 13:48, kernel test robot wrote:
> Hi Sudan,
> 
> kernel test robot noticed the following build errors:

...

>    134		ret = setup_vmgenid_state(state, remapped_ptr);
>    135		if (ret)
>    136			goto out;
>    137	
>    138		state->irq = platform_get_irq(pdev, 0);
>    139		if (state->irq < 0) {
>    140			ret = state->irq;
>    141			goto out;
>    142		}
>    143		pdev->dev.driver_data = state;
>    144	
>    145		ret =  devm_request_irq(&pdev->dev, state->irq,
>    146					vmgenid_of_irq_handler,
>    147					IRQF_SHARED, "vmgenid", &pdev->dev);
>    148		if (ret)
>    149			pdev->dev.driver_data = NULL;
>    150	
>    151	out:
>    152		return ret;
>    153	#else
>  > 154		(void)dev;

So this code was not even built...

Best regards,
Krzysztof

