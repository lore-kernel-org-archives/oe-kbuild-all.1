Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061425765
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730031842; cv=none; b=QWBheL8IHYB01UvDt6RQz1RJ31D2lm8QzUWyqv4nFI+1+JHmGVSq+GcmrtHFC6kiuQm7Dl/mXqcb7lcSAoNfIvp6O05GSkibjVxKHHVsi3H5KNF1Zj2CjL5t7lFG81o/nzIDkeufOhNe27fHQqYDthSgspOMkNwaxRyWDCDAW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730031842; c=relaxed/simple;
	bh=8BEcUjVXSgt7ZVdHArbN5cGhrKqtINZ0r1zgZsa29TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGPQnmBwZvXFmZOVsSDdcsekL8+wUrpoymw9LH+MT7Gif0KpuPV8CnuR3VFsRNvUzsFW82zWxAl1Ut462VgDAGWejCcfeerlbmVrmPkCZTd/D2NMExxqfUOXWlxOQn+eYE9iKV56LBC8vWdGsbiMUqOIq+9ekr1oP3qaKKlmOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCdCM/Ym; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCdCM/Ym"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43161c0068bso33555825e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730031839; x=1730636639; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVEQu3tU/qXzrZf1hfF77Y9BaGDuOCVJOekxBG22NJo=;
        b=LCdCM/Ymuka/rC6UUnreWisleNz+NtSWA52SFjPF98revmgmcoUpT0uYEoAnADvgFo
         o5+FtXLLAnp7iR2Yie+0Rk1N0LpujFVDmJu2tvjWBr3F8lFL9ZyB8C0zrpFg/8tl3rc2
         i/Aue/8CxghxAixBdklCkjcHUSr292oB0WRBj50QbQaI6ceCDUtPf+EljzKumWCU7BhD
         oPfQP8OHZpN8UqP+DUciOcVdVH9S7WyCAwCwZA9IBmcMQqtP0O0T+mFGbRaK2A7Va7PB
         MaHAwB7xRd1q7wvWQA5VnWYRqjiLrt8YoJnRDCjebV21q3E2fb/qyl2sbF6d+wn8ImGE
         U+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730031839; x=1730636639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVEQu3tU/qXzrZf1hfF77Y9BaGDuOCVJOekxBG22NJo=;
        b=M2CmadXepID32X0VYQGzJ1TdTERc3C4X3GGnfF6fbTTErT6UsUscMmc6+Qip8CYjLt
         Y/sfta+rrsN+VKHgrYm+FpNylQ0trPutpwxQbk7HIsz++pZHByURvWsIC+Z3xvimGwix
         cLQwQb6607QCi1kvsXM2HpJqs0sDNTOlQSHr4GYx79/DRlkGHbpSmWnc2Qsa8N7oSQkD
         qrwwYwRVyC188EJPn2kE2O7gImDYN1RPYpqNfNJ0jTCtgWzfn3GTPSGbjFdxIe7sqGN1
         Qu8X9HCZN+0Qht5sxyUatOdzi7gKd/hmC+wOGniTuwGr4oJcdkCnQemIUCm7tSNIhBN6
         t8FA==
X-Forwarded-Encrypted: i=1; AJvYcCVGE283/OghcRsy2UsPH4qU5ixlveIqpGpbKBRU6w7SrzrxPKsWR//hGvMHVqskOqZFecowoHYRiareFlGu@lists.linux.dev
X-Gm-Message-State: AOJu0YweIzTzP7tOcYpmj1w35aaUN+4poTDeIigGZ97YbNKId9cLv73c
	AD0oR9wUX95Wtw9kVn0qqsPiB00+o1Kv/3XBY1qN+yktwahAJ2A7
X-Google-Smtp-Source: AGHT+IHpOK+Lv3dg8V4hr4K0sH/2+e+bw1brMh5Xn1jCRU17+3uvBpMz5BcUxkquTXe6UmJDzRQafA==
X-Received: by 2002:a05:600c:5110:b0:431:54f3:11b1 with SMTP id 5b1f17b1804b1-4319ad36874mr48559505e9.34.1730031838825;
        Sun, 27 Oct 2024 05:23:58 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:a7df:fd2d:69ec:cea7? (2a02-8389-41cf-e200-a7df-fd2d-69ec-cea7.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:a7df:fd2d:69ec:cea7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f784sm103866385e9.19.2024.10.27.05.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 05:23:58 -0700 (PDT)
Message-ID: <59d024d4-e27c-4fcc-9007-7622f9fa8bd5@gmail.com>
Date: Sun, 27 Oct 2024 13:23:56 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] iio: light: add support for veml3235
To: Jonathan Cameron <jic23@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241023-veml3235-v3-2-8490f2622f9a@gmail.com>
 <202410251610.kB7u6xMJ-lkp@intel.com>
 <19c8e07f-4b9b-4d4b-aa18-f6766b65b33e@gmail.com>
 <20241026191001.10acd773@jic23-huawei>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241026191001.10acd773@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2024 20:10, Jonathan Cameron wrote:
> Hi Javier,
> 
>>>    222	
>>>    223		return 0;
>>>    224	}
>>>    225	
>>>   
>>
>>
>> Unused as there is no processed values anymore. I will drop them for v4.
> Given I didn't have any other comments I just fixed these up whilst applying.
> 
> Series applied to the togreg branch of iio.git and initially pushed out as
> testing for 0-day to take a first look at it.
> Thanks,
> 
> Jonathan
> 
> p.s. Diff was as follows, shout if I mess it up.
> 
> diff --git a/drivers/iio/light/veml3235.c b/drivers/iio/light/veml3235.c
> index 18ab73f4377c..66361c3012a3 100644
> --- a/drivers/iio/light/veml3235.c
> +++ b/drivers/iio/light/veml3235.c
> @@ -145,7 +145,7 @@ static int veml3235_get_it(struct veml3235_data *data, int *val, int *val2)
>  static int veml3235_set_it(struct iio_dev *indio_dev, int val, int val2)
>  {
>         struct veml3235_data *data = iio_priv(indio_dev);
> -       int ret, new_it, it_idx;
> +       int ret, new_it;
>  
>         if (val)
>                 return -EINVAL;
> @@ -153,23 +153,18 @@ static int veml3235_set_it(struct iio_dev *indio_dev, int val, int val2)
>         switch (val2) {
>         case 50000:
>                 new_it = 0x00;
> -               it_idx = 4;
>                 break;
>         case 100000:
>                 new_it = 0x01;
> -               it_idx = 3;
>                 break;
>         case 200000:
>                 new_it = 0x02;
> -               it_idx = 2;
>                 break;
>         case 400000:
>                 new_it = 0x03;
> -               it_idx = 1;
>                 break;
>         case 800000:
>                 new_it = 0x04;
> -               it_idx = 0;
>                 break;
>         default:
>                 return -EINVAL;
> @@ -188,7 +183,7 @@ static int veml3235_set_it(struct iio_dev *indio_dev, int val, int val2)
>  static int veml3235_set_gain(struct iio_dev *indio_dev, int val, int val2)
>  {
>         struct veml3235_data *data = iio_priv(indio_dev);
> -       int ret, new_gain, gain_idx;
> +       int ret, new_gain;
>  
>         if (val2 != 0)
>                 return -EINVAL;
> @@ -196,19 +191,15 @@ static int veml3235_set_gain(struct iio_dev *indio_dev, int val, int val2)
>         switch (val) {
>         case 1:
>                 new_gain = 0x00;
> -               gain_idx = 3;
>                 break;
>         case 2:
>                 new_gain = 0x01;
> -               gain_idx = 2;
>                 break;
>         case 4:
>                 new_gain = 0x03;
> -               gain_idx = 1;
>                 break;
>         case 8:
>                 new_gain = 0x07;
> -               gain_idx = 0;
>                 break;
>         default:
>                 return -EINVAL;
> 
> 
>>
> 


Hi Jonathan, that is exactly the diff I wanted to add for v4. Thanks for
fixing it.

Best regards,
Javier Carrasco
