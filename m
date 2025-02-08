Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F88C1F1815
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032734; cv=none; b=jpF6VT3irlxpRyqOzF5QZn6LeYXf1m5/lVSapjHTRUvKXM3kjII+Kr53iqUN/i9RzVILHFftyxgrZR83s8f0MyhOXRiO75cneSJtbykXzJ7m2MeKVIOxz0B958W9XBvGQl2dxEwYAi5agdEl+iQsggf3DkSwQRezPIlgj6R9w8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032734; c=relaxed/simple;
	bh=YpkTpeRswZo6Mde3j0ZQLP8wwKuziA1iVTHbU5Zfn3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYerL2FcNz+osKTCK636AEA7277WrO7yJNc7pBepDRn6iQHW2uuXB79Ko4gCR72l7rkaalLM++V5sqFwUQZrLYfefqO8eYBTCXg64dCduez4rof1kio9A2GvCssx+mZ9pc2XOwAj5W5qsu9yzgECg/H3Bbbks1RH/DCvwoMhp4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tOkFSfNV; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tOkFSfNV"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5fa8fa48ee5so986818eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 08 Feb 2025 08:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739032730; x=1739637530; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXu1OXj5AAUAJltqAxEpsuQsxoVvpDoEju9qNHItO2k=;
        b=tOkFSfNVkyEWjGY3LuZFYbA9Nh8d5DhKwKJfmWTPq+JECT5S2ZXQYjd7DR3xWqh+rh
         QYbLIWLRqX34IwUvyb7cFKh0hqCxgAvVNK8GCP8dn9rMXzHK+Ir4cOTrMzWwl4LHG39/
         4UeYd1FncT4061SBusLRPociQ3wuz02PcPdHZsoyQXIyAFmwTDAS0Mx5ifXl4Wqjf/aJ
         97jg1CgHWnABMm7TzDq3tjjOf8hCrSqIf3lKelSbTJYxUb5cOWyPlSNmZ0iOhcTQ+eao
         5oRLZZUaBQqpQnPoV36jeloLzMw+M8HRXU6F9kskZSyhUUF3115EyiRN7BKDShbeCvwt
         1PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032730; x=1739637530;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXu1OXj5AAUAJltqAxEpsuQsxoVvpDoEju9qNHItO2k=;
        b=AOYvRxB7w+GpMf/mE1m2aHa/Lu62O/5td86bLycbH7LXlUV+Klp160hEoaVjUrGUjx
         rrwWNltPXtEb3nY9Fswu6z0LFG4Ck5YFcKfnyMQR1RUHpFMh06GpOc9WbLe8ioAmHdvk
         3et+tEOnKw2urKbWGNUt8wICpfpWQ8IERIv+7r1HzreIYqRim27896XGl+rnifQ/7XN1
         Lqn+umqxlCYKz2Q5BN8jjWnGnp/gTv/QObwUOcG/3sybUPuRzKFsb+/5hEVqcEkuGirl
         bc7ZLEUsnZEyDNsN709/CQtwDUkNgoyuvxcQ3ugfGXMuuVJjvkRYIr3HtrOKr5UUKYn2
         uJBg==
X-Gm-Message-State: AOJu0Yx5rTO//F090AjxHxzJfCr9UE3eILlo6dbhVho9wYKtx4/Qt6vo
	nfB+Qijin6GqfxCqpYtHMyeBTWIMUtbBcDJh5FNVsZMkGbRwOKtAUO0pauMaRL0=
X-Gm-Gg: ASbGncsbFl8bM4E03cuWLnplw41bkzlkz9s7dZTWzZEsvaMMCp67FAPouGX918Gd6Rq
	3W5WpSb4iT0MLq/S7nanyfcEuXsI/ITVig02hBHktnoxeibdJQQ5zJnSOJAHByVxDRG3VQdeZ+o
	J07dFCTGOvVipHYziIyFQqwdA0iW5iKuzoZk0tz379h3sclqY3/14vMs2t4+3NgvpvvSG2YKFvg
	gu68Q11hNeZvlyvti+ZzWm7uFdgM7Y62mFTYoi7pDQ94AknbL8W+nH41I5rjzUHfiyh+jCtzyv9
	HjuhF3iVJsAgTKpuTiswhUYoDqKKP1xv8kfxlSwOMy1HHa8Zb7qi
X-Google-Smtp-Source: AGHT+IEKD+p3KCgLIVN6iRgMeJDSr0cDciYYOlalpCFtBkmfmUB0DURbhvc7trZTKbU9wAOBlzuKsQ==
X-Received: by 2002:a05:6870:55d0:b0:2b7:f2dc:a4c2 with SMTP id 586e51a60fabf-2b83ec89b9fmr4851863fac.18.1739032730368;
        Sat, 08 Feb 2025 08:38:50 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af950fcdsm1432491a34.36.2025.02.08.08.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 08:38:49 -0800 (PST)
Message-ID: <5007139c-c969-49a1-8568-22b4044386ed@baylibre.com>
Date: Sat, 8 Feb 2025 10:38:49 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/17] iio: adc: ad7944: add support for SPI offload
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20250207-dlech-mainline-spi-engine-offload-2-v8-11-e48a489be48c@baylibre.com>
 <202502082251.NuHT15R7-lkp@intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <202502082251.NuHT15R7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/8/25 9:00 AM, kernel test robot wrote:
> Hi David,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 884697cc74d9fea0a8628c2794d0b80065ac95d1]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/spi-add-basic-support-for-SPI-offloading/20250208-041627
> base:   884697cc74d9fea0a8628c2794d0b80065ac95d1
> patch link:    https://lore.kernel.org/r/20250207-dlech-mainline-spi-engine-offload-2-v8-11-e48a489be48c%40baylibre.com
> patch subject: [PATCH v8 11/17] iio: adc: ad7944: add support for SPI offload
> config: i386-buildonly-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082251.NuHT15R7-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082251.NuHT15R7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502082251.NuHT15R7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>>> ERROR: modpost: "devm_iio_dmaengine_buffer_setup_with_handle" [drivers/iio/adc/ad7944.ko] undefined!
> 

It looks like I missed adding `select IIO_BUFFER_DMAENGINE` to the Kconfg on
this one.
