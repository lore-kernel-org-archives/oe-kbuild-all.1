Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E26A225409
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807213; cv=none; b=kMR7K97I0a1wv/Xl59c1kxH7yWkb9h7nTP3uz5WmjCYosWNTJiUMDQfZt5UsKZYTZhZuyCdAg9MyZxVTqR9/JpfMMhlYlfELnwOwsig6DjyWmz8i5YSGLaAcCzYPfOw7/J5AHLoOtwIvrsK1IIDjSSLCFvk/fTPScU2uUq58ojk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807213; c=relaxed/simple;
	bh=4eo96dvYCOQzl+6HbZ2l9J7GddfD+O7sDIJB+hV3N08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0KU4JsK9lw9zzytL9O8gyxb2XRoyuCUwPv//nmygNb1bbL4PsL8dqMEm9W2riomXVL2AaYRB4LrG9GSrCz+sdi3ZWzSWIcQPmGdMYdovfn3KdLNxO4JdHvvBSDtv6HyfY9DEmHnFRLRvmj/KIRZQzf9Mo2MLkOoEQ1ts5ojQQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UwMdDycN; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UwMdDycN"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5fcb3ee41c5so1092635eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739807209; x=1740412009; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6N6A5Gpd7y+fhzZMMDHyG3nf9n//RySeOEbIKNExD8k=;
        b=UwMdDycNS/fqGUVrpq9FLk1WpiuEGCObNToti/JXv4/nlNvts+Hw5an1M8RhNRgz7+
         iLSjepnUHZkCxnBjc+kJlNhuLgYgMjqdN94XEwEwgEa41JUsux3zDLpgQT9ToarP5RSV
         hZ+tpJTaCbOUxJFKVznXy2BQLE55yTWuS0BtM6AshdwUhsNVGQo5Qu/dd8dZNOmPr27s
         HkDahs9ThfXwAuTnFeCKyh6G1jTLIrY3uML24iV3alGSgDMv59tKprwvadeydkDMy1SE
         5/ABsjFbSZiCYLbXKxVbzCraeQ64VewLCSxAAgRFIT3jg3G2mEcOGGcSoO/aazd0FinB
         ZS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807209; x=1740412009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6N6A5Gpd7y+fhzZMMDHyG3nf9n//RySeOEbIKNExD8k=;
        b=wNqmXzcOB4tehHW5eci3bWeTnOAnuGX8eAfLlB45Zj58ZAY9Z1Q0bnsqjcleyT9dXb
         qAYZtsxRQwhkHsiYkcRVo40HP+BVMMDYDJSbPTj/n4mDr3xfmp4ChipnroFPV6pJ27br
         5Ew89hSGb4jUI0RnibFkozaCcNmRFsYGlRp3nMQX4MpMLvbBYq7hJQ0MoFfhPFLQZOFG
         GXpvRDIU7wwrk1ZE6ahi9guynHMa86VIVAf+7SLNdaOWB9QQpwT314UyV6UcdVlTTgm/
         bUThXOC0t096FqCeDHfpDchE8ObCOBJhhkhsteLlFwqhjuw9Ude0PCsC19ddlBDwHmrS
         /9mg==
X-Forwarded-Encrypted: i=1; AJvYcCWkWagCR08rrX6HjSsXRDL5q/aNYrvwLjx75XxzQYuhtka/gwvaY6bv7b9rr0DEjO1uxX3IqQxX4/NcHLzA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7K/jK9yHrkKpHYRDeJINat1PSmSucpokdXBMifN36lftyvzVJ
	7fdBeMGWBY3TLQTnweNvqMxUm8aNIWvXhBCoIa/X2u0sH0NRdvG08ujyD7rwMkg=
X-Gm-Gg: ASbGncu2P65sLlCYncCk+mt9aYrvcuRYxBby8aezocol8Q5TmZoBn99ySJ4Dr/z2WcB
	lK1180eCkE5V8S0ZyjWBBTR8gzWkAnqFfgs9ywnl8fH2mVa2x2xU9tRm6FLJEt6Fy7FP74ONf3R
	8RESZyly+V/C/C/bcNztOX1h5N0Amzq1Sfu96VjJh+Z/XEI/vagmp5DuaJMCbXj1C3fwYOFQhud
	gDKEphRdqYB0SZ0szHFkG47Tc44DvUKKpoipUJn6zJy4z1u2aNXztCD5sQ9cFQ08W8mHtxKH4hu
	+WZhjSGDo/d0ELM58XyQmefV3N8bZkPBfRlxW3UJWIznuzlSpjW3
X-Google-Smtp-Source: AGHT+IF/XXF+oZeDXMk3LXkQziPDlET6Mi5NTVTnZ8+GlbiKZFRfMpUIYDY8YiZOgYLF+Q/VZYoq9Q==
X-Received: by 2002:a05:6820:2290:b0:5fc:98ab:2b27 with SMTP id 006d021491bc7-5fcc56c621fmr5318508eaf.6.1739807208894;
        Mon, 17 Feb 2025 07:46:48 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fce4c93aaasm271586eaf.40.2025.02.17.07.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:46:48 -0800 (PST)
Message-ID: <a68937a2-1e35-4421-81e2-343c1c6a8b85@baylibre.com>
Date: Mon, 17 Feb 2025 09:46:47 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 2779/4577] drivers/spi/spi-offload.c:127:9-17:
 ERROR: reference preceded by free on line 126 (fwd)
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nuno Sa <nuno.sa@analog.com>, oe-kbuild-all@lists.linux.dev
References: <ddd17670-106b-a491-2bb0-658ce193a9a@inria.fr>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <ddd17670-106b-a491-2bb0-658ce193a9a@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/17/25 6:44 AM, Julia Lawall wrote:
> See line 126.
> 
> julia
> 

...

> 8e02d188698851 David Lechner 2025-02-07  123  	resource->controller = spi->controller;
> 8e02d188698851 David Lechner 2025-02-07  124  	resource->offload = spi->controller->get_offload(spi, config);
> 8e02d188698851 David Lechner 2025-02-07  125  	if (IS_ERR(resource->offload)) {
> 8e02d188698851 David Lechner 2025-02-07 @126  		kfree(resource);
> 8e02d188698851 David Lechner 2025-02-07 @127  		return resource->offload;
> 8e02d188698851 David Lechner 2025-02-07  128  	}
> 8e02d188698851 David Lechner 2025-02-07  129
Thanks. This already got spotted and fixed.

https://lore.kernel.org/linux-spi/20250212-spi-offload-fixes-v1-2-e192c69e3bb3@baylibre.com/
