Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3965D801
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 00:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752797164; cv=none; b=OTkVFSopDJm9kFJJ3Rv5cT3OmAxhNt5ZsAqoqgR1ZN3T+dDxY3zhpfiHI2gw7d89/p3fZ5ShQ9FLQ9hcZtBqLrZB9tVn8geLbrcDaAuOQ6kmq4xINiXJX/z2hshEWiWZRjdIq/+VvrbBKwM62IN4jWCxkYCNp2VScKQIffwJwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752797164; c=relaxed/simple;
	bh=TBzkP/KQQjnS7jbvMr4DLdE8rWHu1UeP5pEVna2xZU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7IEpwPY9T9NLRn3WrQqrpXdf97sPhS0jdA5cSO4r7SDvQFnswiFDrFN0c8jnuYtaGKc28EVT2SS2+0+wndRqwQn9REFcw4dC9nFP/3UDKYQGQJ8Ceybwi6wKqihEBYHihX+Q/mlUw8jS0m8I5OPRtU4SXHIyuFQQ5hynQ+rkxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FVS5QeXc; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FVS5QeXc"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73e58d5108dso782249a34.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 17:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752797159; x=1753401959; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=St8SkLz4MOLrSJrXKd2dasjZ652XtdbuQ+qXkfyFhu8=;
        b=FVS5QeXc3/PVIcCpi8pT/cSrNYHdgyoFuIRhk8ZqizW5D/5PgfEzC3rnwwvKgp47z4
         KYlipEQtfgFLVixpR0ByyAsc9QuzSqWzK3khgd1lAY7TeB5DLpH09f35MsBxJnMDY3SL
         FuUV5dg8P1dNlk5VzyT/sDupBCYJaoyO9DlzcKq/DB267eOSgdi1kfe3XVALQg9ozMi4
         VGcFDx5QHTbQJ24alIaZNe2Jki8XLQ3bNfayVJME39OsOX547BdQZSu2uQeNTW/EOZic
         ibqGGNTFMVKORLi7PISAIcBLlXiGQIf108m1dyUrAz0cZBA2FjpcvTJk8NrOomif/19E
         0mdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752797159; x=1753401959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=St8SkLz4MOLrSJrXKd2dasjZ652XtdbuQ+qXkfyFhu8=;
        b=WXgNQjBD7cxzDgQepqmFTUxtqu0JVqUSR72J8v3wAiyFlWyilAa7q/oupitbTO5SdV
         h9sLP6i2XIwfK2O4spv/N31n3UT1NNBnq20Mg2YZ/3ciwQW6LLViSr/bAB1H9K11HfZD
         O/X3sr+rXlsZE++Wdvh5gKwPVAuzfqV7VoCel3BPM70AAUH5RDLYUezDbAlMEwpDiQHA
         DZws/008JmCGDl5mnkEAWcId4n7iHybb3QWGvHsKYgTMnN52YBKV5ISN26VBO93FUyMf
         wP+TlNNeKDiY1SSzBHCLSYmeQ6VK2y935I8yhOjAdPYY2XM+FW4bEh/pUwK0mNGtfEMe
         0etw==
X-Forwarded-Encrypted: i=1; AJvYcCUbvF+9ZV11dOrSCaEm5fiBL1oD8W/UFcd8PKzLbPxB6OBXmtDSCzfjHGoYtk5S6NaEvM9EMJKqKRXwHTHz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw72nUI7uL5w06NVeDT4RWnyhVIkvOH7+aID7GD8QhZ9ng4ZoQ2
	lOEFVAulEIB1Quyz2HsI+bhcQX8/GCsfo9XWDX/8grBALc9rubCj4J9B282YP678GKLu3gRqOYc
	G3pe8zdc=
X-Gm-Gg: ASbGncuZfw2fXqusru1bRrAJ8lpbvnSgg+tR6/yB3BnPsw4FHzITgPRVqFLIJzhrj8A
	o6uBi23tFoXEBBbnmQ5PW4jJlIYqYElzbw8J5EGt+4FruezyOonCPtDqSUeyYzg3+wjziP2c8e8
	vDSQWmxm7GMAeovejI+egs5jIpVM+tJBooShYQpxjlRAsN5iyl8NDWMnfqUEJ+cITCi0XtSY8iq
	nsXH+UetvGA/TYhSjdUo0rNp6EAq/GnN2B3xPVUoHtpdr1f/RGYaZgtEO9GXxQdgH+mYs6LJrq6
	LZRE9T6Xq3x0DD8nQX5paQglrEwVBl+tQIYwiWeH3y4vISrBnAA/b7izC/UsvsOn0Qs9sRtwHJg
	kMGRZfS/I0kuXmbWmjMwWdjO5P4ZnGn12hyjyA5I+xLur8kVbKTrLYbPW5/RVpb1+Xgwkltql
X-Google-Smtp-Source: AGHT+IEpQzJxWBuzFSfKDSgMT+5zFzNHdoZQaPiHyVcWmSO42hOknfLdI3c/uUKRjPmpTo50HDkFfg==
X-Received: by 2002:a05:6830:2a9e:b0:73a:8bf8:56b9 with SMTP id 46e09a7af769-73e649da15fmr6028856a34.1.1752797159125;
        Thu, 17 Jul 2025 17:05:59 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:b499:5ccf:3f5:ecec? ([2600:8803:e7e4:1d00:b499:5ccf:3f5:ecec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e8354c93dsm200490a34.1.2025.07.17.17.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 17:05:58 -0700 (PDT)
Message-ID: <1cc7453e-7151-4a29-a1d0-d265e5a3426a@baylibre.com>
Date: Thu, 17 Jul 2025 19:05:57 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8663/10823] ld.lld: error: undefined symbol:
 devm_spi_offload_rx_stream_request_dma_chan
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
References: <202507180620.bPnQTVKp-lkp@intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202507180620.bPnQTVKp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/17/25 5:53 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> commit: 219da3ea842a156e5808176e11db256db9798f6c [8663/10823] iio: adc: ad_sigma_delta: add SPI offload support
> config: x86_64-buildonly-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180620.bPnQTVKp-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180620.bPnQTVKp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507180620.bPnQTVKp-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: devm_spi_offload_rx_stream_request_dma_chan
>    >>> referenced by usercopy_64.c
>    >>>               vmlinux.o:(devm_ad_sd_setup_buffer_and_trigger)
> --
>>> ld.lld: error: undefined symbol: devm_iio_dmaengine_buffer_setup_with_handle
>    >>> referenced by usercopy_64.c
>    >>>               vmlinux.o:(devm_ad_sd_setup_buffer_and_trigger)
> --
>>> ld.lld: error: undefined symbol: devm_spi_offload_trigger_get
>    >>> referenced by usercopy_64.c
>    >>>               vmlinux.o:(devm_ad_sd_setup_buffer_and_trigger)
> --
>>> ld.lld: error: undefined symbol: devm_spi_offload_get
>    >>> referenced by usercopy_64.c
>    >>>               vmlinux.o:(ad_sd_init)
> --
>>> ld.lld: error: undefined symbol: spi_offload_trigger_enable
>    >>> referenced by usercopy_64.c
>    >>>               vmlinux.o:(ad_sd_buffer_postenable)
> --
>>> ld.lld: error: undefined symbol: spi_offload_trigger_disable
>    >>> referenced by usercopy_64.c
>    >>>               vmlinux.o:(ad_sd_buffer_postdisable)
> 

Should be fixed by [1].

[1]: https://lore.kernel.org/linux-iio/20250714-iio-ad_sigma_delta-fix-kconfig-selects-v1-1-32e0d6da0423@kernel.org/

