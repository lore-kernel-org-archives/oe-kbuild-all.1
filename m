Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF11A705F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974429; cv=none; b=Deuh4bb1dEvWBqDk1nv5XvAHBuuRLDxNwkd9f+CGIHk6Mt8UQec2sDH92xogpOJKJbwU6xsU50Te+dOqjgZvO8F/jNyDj752p0wNg0a2bFagOPn3/+PuMeRc+mmA/ByoMvlKNPydjS2oeOMq2rVF1hlNGjZEhZMPCaIWX0+8c5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974429; c=relaxed/simple;
	bh=LxF46EDoaznY4F1zahJAqtHW2kF9JxWtY6qntfvLWNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzOTvAbVhEarV3tCF5qVE4ZrwfvaiglPmeHBCApBht/1L2nznx64UdRJ9724oYplMA1lzj+IP2jVg3BI0PqE7wItSniWwQqme4SBOBSXVaukNZUXx9HnAELy1hAg6PEG70BzLDdA/MEYW2+TUKYnKmr1pKe0SE0s1yl06CGJJjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DckuGzg9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DckuGzg9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb2191107so11120345e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 03 Oct 2024 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727974425; x=1728579225; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5HCKrPV5sNaAbW+wmhASj2RNr6HhB9DqF90Z83CNHQ=;
        b=DckuGzg9Xzu8hXEbDArP+YNBKb23QydCSSxVe6/aiHFj5KI6SR++s/LlD/nNTZTALM
         9M62fDgt4FEebnDXB4/YT28oUXNspdclnxQ5lnvuu09yipFRYy09zjjRnUunPI7WTVPu
         YSKV0qJigwpnrvwHqXFsigtFedJA+C3Mr0f+spCitcRjGKW1D3FE0n7MYDcnefFY/hy2
         N5E48GGhszbgE6yFjB/OImeZWj7ZcXxYm73z9NRGsVscmAzZx7PqooQxRYNEgjEtddqK
         iS2Ae5lwYSOdSvc6rczHrtxZvq+GNsxjxgaypYBP32aMNFwldZURiGB4mU1BTqlPNZSX
         lY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727974425; x=1728579225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5HCKrPV5sNaAbW+wmhASj2RNr6HhB9DqF90Z83CNHQ=;
        b=n2wvNap9CBbwj3f3JAoTm/JBEWn4n75AJhXwDJtQLKb8mV/UFQca/TdPEbSJ9Sb5fV
         d8hDAZe6TuiOzVtqvHCS8ohrEJs9o/J1ocvKyXD+YBKDEi664LsUsEyVYYJ+DyFPwHyI
         2y0b/ehE62u8GfdWJfMv2tMNd/pyUEFnNZYS6NDIhFCceYtyYe5VgJutImalY9lA56fq
         Cvp1cuE6NmzqRTEMRzbGA31Wn7cmXGONfxeG9P3mJ0jA7vRS+WPEiNtT92xIEUJjm3TZ
         XhYk7v49lLO9x6hfDHga73s5A01UBhKBwIGXYv5i81pWLsK9HxjYLlA21L3ZutZ0o5eG
         6fWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSWlhjxlfLXpJaSPttEJMpBLVHuJF5wIgD0rayYA35QR81QJo17bR5wRNHPVEIa5w5V3s/23KmW4xaLr9Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzFb3WP1c8ctoWZ35MfrAYUFsbleLKNwmF2EvLWDgJcQ4lrMRTt
	C+agQAhQmAJmNNKznE2rYHPCvGWpPCJ2GViIlY6XI77o7ZyoHPv+Sr1cLw==
X-Google-Smtp-Source: AGHT+IHBgIOzP/Suz1ksfCig2PKcbBrf7U15buBve6E9PK/UpBkTlfx0YdwrE2QARYX/dmtEPdvnmA==
X-Received: by 2002:a05:600c:1c04:b0:42b:a88f:f872 with SMTP id 5b1f17b1804b1-42f778f13d3mr56789095e9.32.1727974425421;
        Thu, 03 Oct 2024 09:53:45 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3ec5:11f2:e453:20e3? (2a02-8389-41cf-e200-3ec5-11f2-e453-20e3.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3ec5:11f2:e453:20e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082a6b75sm1660996f8f.81.2024.10.03.09.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 09:53:44 -0700 (PDT)
Message-ID: <5d666bc8-203f-44c7-b4e5-a5342b1bc38b@gmail.com>
Date: Thu, 3 Oct 2024 18:53:42 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/iio/accel/adxl367_spi.c:76:10: error: 'const struct
 regmap_bus' has no member named 'read'
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <202410021111.LknEX9ne-lkp@intel.com>
 <6e935f30-6dc5-4422-842d-068c08d31333@gmail.com> <Zv60l6y4ij6C6U2J@rli9-mobl>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <Zv60l6y4ij6C6U2J@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2024 17:13, Philip Li wrote:
> On Wed, Oct 02, 2024 at 09:01:50AM +0200, Javier Carrasco wrote:
>> On 02/10/2024 05:21, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
>>> commit: c922c634bd926d84967275efbb7275b8645aa343 iio: accel: adxl367: Constify struct regmap_bus
>>> date:   9 weeks ago
>>> config: x86_64-randconfig-001-20231120 (https://download.01.org/0day-ci/archive/20241002/202410021111.LknEX9ne-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021111.LknEX9ne-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410021111.LknEX9ne-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    In file included from include/linux/sched.h:38,
>>>                     from include/linux/percpu.h:12,
>>>                     from arch/x86/include/asm/msr.h:15,
>>>                     from arch/x86/include/asm/tsc.h:10,
>>>                     from arch/x86/include/asm/timex.h:6,
>>>                     from include/linux/timex.h:67,
>>>                     from include/linux/time32.h:13,
>>>                     from include/linux/time.h:60,
>>>                     from include/linux/stat.h:19,
>>>                     from include/linux/module.h:13,
>>>                     from drivers/iio/accel/adxl367_spi.c:8:
>>>    include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
>>>       19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
>>>          |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
>>>    include/linux/mm.h:2888:5: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
>>>     2888 | #if USE_SPLIT_PTE_PTLOCKS
>>>          |     ^~~~~~~~~~~~~~~~~~~~~
>>>    include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
>>>       19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
>>>          |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
>>>    include/linux/mm_types_task.h:20:34: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
>>>       20 | #define USE_SPLIT_PMD_PTLOCKS   (USE_SPLIT_PTE_PTLOCKS && \
>>>          |                                  ^~~~~~~~~~~~~~~~~~~~~
>>>    include/linux/mm.h:3010:5: note: in expansion of macro 'USE_SPLIT_PMD_PTLOCKS'
>>>     3010 | #if USE_SPLIT_PMD_PTLOCKS
>>>          |     ^~~~~~~~~~~~~~~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:75:21: error: variable 'adxl367_spi_regmap_bus' has initializer but incomplete type
>>>       75 | static const struct regmap_bus adxl367_spi_regmap_bus = {
>>>          |                     ^~~~~~~~~~
>>>>> drivers/iio/accel/adxl367_spi.c:76:10: error: 'const struct regmap_bus' has no member named 'read'
>>>       76 |         .read = adxl367_read,
>>>          |          ^~~~
>>>    drivers/iio/accel/adxl367_spi.c:76:17: warning: excess elements in struct initializer
>>>       76 |         .read = adxl367_read,
>>>          |                 ^~~~~~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:76:17: note: (near initialization for 'adxl367_spi_regmap_bus')
>>>>> drivers/iio/accel/adxl367_spi.c:77:10: error: 'const struct regmap_bus' has no member named 'write'
>>>       77 |         .write = adxl367_write,
>>>          |          ^~~~~
>>>    drivers/iio/accel/adxl367_spi.c:77:18: warning: excess elements in struct initializer
>>>       77 |         .write = adxl367_write,
>>>          |                  ^~~~~~~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:77:18: note: (near initialization for 'adxl367_spi_regmap_bus')
>>>    drivers/iio/accel/adxl367_spi.c:80:21: error: variable 'adxl367_spi_regmap_config' has initializer but incomplete type
>>>       80 | static const struct regmap_config adxl367_spi_regmap_config = {
>>>          |                     ^~~~~~~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:81:10: error: 'const struct regmap_config' has no member named 'reg_bits'
>>>       81 |         .reg_bits = 8,
>>>          |          ^~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:81:21: warning: excess elements in struct initializer
>>>       81 |         .reg_bits = 8,
>>>          |                     ^
>>>    drivers/iio/accel/adxl367_spi.c:81:21: note: (near initialization for 'adxl367_spi_regmap_config')
>>>    drivers/iio/accel/adxl367_spi.c:82:10: error: 'const struct regmap_config' has no member named 'val_bits'
>>>       82 |         .val_bits = 8,
>>>          |          ^~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:82:21: warning: excess elements in struct initializer
>>>       82 |         .val_bits = 8,
>>>          |                     ^
>>>    drivers/iio/accel/adxl367_spi.c:82:21: note: (near initialization for 'adxl367_spi_regmap_config')
>>>    drivers/iio/accel/adxl367_spi.c: In function 'adxl367_spi_probe':
>>>    drivers/iio/accel/adxl367_spi.c:132:18: error: implicit declaration of function 'devm_regmap_init' [-Werror=implicit-function-declaration]
>>>      132 |         regmap = devm_regmap_init(&spi->dev, &adxl367_spi_regmap_bus, st,
>>>          |                  ^~~~~~~~~~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:132:16: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>>      132 |         regmap = devm_regmap_init(&spi->dev, &adxl367_spi_regmap_bus, st,
>>>          |                ^
>>>    drivers/iio/accel/adxl367_spi.c: At top level:
>>>    drivers/iio/accel/adxl367_spi.c:75:32: error: storage size of 'adxl367_spi_regmap_bus' isn't known
>>>       75 | static const struct regmap_bus adxl367_spi_regmap_bus = {
>>>          |                                ^~~~~~~~~~~~~~~~~~~~~~
>>>    drivers/iio/accel/adxl367_spi.c:80:35: error: storage size of 'adxl367_spi_regmap_config' isn't known
>>>       80 | static const struct regmap_config adxl367_spi_regmap_config = {
>>>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>    cc1: some warnings being treated as errors
>>>
>>>
>>> vim +76 drivers/iio/accel/adxl367_spi.c
>>>
>>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14  74  
>>> c922c634bd926d Javier Carrasco 2024-07-03  75  static const struct regmap_bus adxl367_spi_regmap_bus = {
>>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14 @76  	.read = adxl367_read,
>>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14 @77  	.write = adxl367_write,
>>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14  78  };
>>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14  79  
>>>
>>> :::::: The code at line 76 was first introduced by commit
>>> :::::: cbab791c5e2a58c123d84bd9202c054e5449bc96 iio: accel: add ADXL367 driver
>>>
>>> :::::: TO: Cosmin Tanislav <demonsingur@gmail.com>
>>> :::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>
>>
>> Strange. I followed the "how to reproduce" guide step by step, but it
>> compiled just fine (gcc-12.3.0 instead of 12.2.0, though).
> 
> Sorry about false report, kindly ignore this. The bot side will look
> into the detail to resolve the issue asap.
> 

No worries. As I already mentioned, the bot has recently found cases
where the dependency was indeed missing, I am glad that it found those
even if it comes with a couple of false positives, which are easy to
verify anyway.

Best regards,
Javier Carrasco
