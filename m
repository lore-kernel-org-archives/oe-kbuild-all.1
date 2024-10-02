Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913151FBA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727852643; cv=none; b=ODhxpXmtgPJU9kPyOycZaY/ViufFIK0+oz8VtBwdJarTvI5ccZRitA33GgcLnLRsN4hhUO1iBLwd7bFJuAoheDfLIsGuBEfOY/cjin40MvX5tLEZWNUFv1IVv6kD6RmpIi/pOXbCttzvkM/bJVfGOyHzi5v8V9cIVo9/dSE1xao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727852643; c=relaxed/simple;
	bh=Uj0IAM89efPEHzNKPafDKvOZwknsbqlnkFUHf+1/toc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aAHJl5HELOfI7mH+8JCpC8Mw7C2RhjRSjiDMfJkQEbAtriPBpuq9Rj69JwE0FgsYhivMSDz8DmZlx3EH+4fC/PH9RWwclwvtKxWb+xbKcKPglhKA/BxXhWXfsM/YAjfaw5dOfueL3IMrCr6iHBlVSWiaqCIQSxRUec/4OMQoGdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2YYiGnN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2YYiGnN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a843bef98so917888066b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Oct 2024 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727852639; x=1728457439; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MfLgbZ0lerkvVmlCA7Ez4P7ScBhB9oBdGhXV/eW+jqc=;
        b=h2YYiGnNZcr53UMWZRZwIyXvMVL44HXi9R8+QYPvveJyWN+QturCyGx3KNtBsfdEQ5
         OQFQVqLU6O/iXvnP78yenBkiK4sljEMoufuv/hiZRDIaQHz6Q98L28tWUnY3G3Q86NhU
         f63vAt7W9Swx6mtv5bjpWr6xQclIjn7IT2I7P0vTdJHWnfJT5M4JSXWQlmk7xsKxbBMB
         IDUip/WKYseRUUT6wkP775Iia5KqEVZokgpwQc+yn+kbou/lIC6gLH1pAYUm9p403kO7
         xuoKON4nZ6f6F36rHi4jY1PQ1beJPEBrnWWZWEIFrzjfFQMeqXhKjo4NZjomARoxrn6R
         AH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727852639; x=1728457439;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfLgbZ0lerkvVmlCA7Ez4P7ScBhB9oBdGhXV/eW+jqc=;
        b=vGueHK1cU7ryUfkKMyM0yScqPms39/YBfhAnoILhqEMuay9lT8C8OMKzvu7ejFuG3S
         rAtJXts3rwy/zUH8qEHSPpCanHkcifrPNWpdygorcDo7t4XD8jqKjWO99YlA/vUQJhae
         xPdVKxYt1e/kfIadft5S7P32iAmWJMbipLfZJrVz8gp9DqYiU1K3FZ09YYaGqJEf5wXO
         Gw6bV9g1RJ9DbSu+g2Dlqrko6DiryXXKSTGBAXQw9t8Rn4jkSuxDpHoeelXvGp/uKD9j
         GNx4TxvUuc9op8Ax/YPfxyekOzZ+fmobcT28rcJcPAlfloaeETK0sJV9Gh5GdZ7zZZgn
         elfA==
X-Gm-Message-State: AOJu0Yz2bz4ALfX2HuPAHbgkPGgo8XpZomJ1P7XbNq41iRoawuOF4+XF
	rWjViQAL5diptqft0sd2XJ8cm5aATegAo5ZdPtrJ4okIx84aPBoCAQb3LLQL
X-Google-Smtp-Source: AGHT+IG3SGDzcIWyBeu3ujrWa6jXxaLSF/GLQwv451kIIZCTw28o7u8cx1bH9cADQ2tZx/vxEgSo2A==
X-Received: by 2002:a17:906:dac3:b0:a86:6a26:fec7 with SMTP id a640c23a62f3a-a98f827a28amr177189466b.30.1727852638606;
        Wed, 02 Oct 2024 00:03:58 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c70dfsm825384466b.52.2024.10.02.00.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 00:03:57 -0700 (PDT)
Message-ID: <1941443e-7685-48b7-8201-7700877d9ec7@gmail.com>
Date: Wed, 2 Oct 2024 09:03:57 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/iio/accel/adxl367_spi.c:76:10: error: 'const struct
 regmap_bus' has no member named 'read'
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <202410021111.LknEX9ne-lkp@intel.com>
 <6e935f30-6dc5-4422-842d-068c08d31333@gmail.com>
Content-Language: en-US, de-AT
In-Reply-To: <6e935f30-6dc5-4422-842d-068c08d31333@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/10/2024 09:01, Javier Carrasco wrote:
> On 02/10/2024 05:21, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
>> commit: c922c634bd926d84967275efbb7275b8645aa343 iio: accel: adxl367: Constify struct regmap_bus
>> date:   9 weeks ago
>> config: x86_64-randconfig-001-20231120 (https://download.01.org/0day-ci/archive/20241002/202410021111.LknEX9ne-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021111.LknEX9ne-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410021111.LknEX9ne-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from include/linux/sched.h:38,
>>                     from include/linux/percpu.h:12,
>>                     from arch/x86/include/asm/msr.h:15,
>>                     from arch/x86/include/asm/tsc.h:10,
>>                     from arch/x86/include/asm/timex.h:6,
>>                     from include/linux/timex.h:67,
>>                     from include/linux/time32.h:13,
>>                     from include/linux/time.h:60,
>>                     from include/linux/stat.h:19,
>>                     from include/linux/module.h:13,
>>                     from drivers/iio/accel/adxl367_spi.c:8:
>>    include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
>>       19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
>>          |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/mm.h:2888:5: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
>>     2888 | #if USE_SPLIT_PTE_PTLOCKS
>>          |     ^~~~~~~~~~~~~~~~~~~~~
>>    include/linux/mm_types_task.h:19:45: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not defined, evaluates to 0 [-Wundef]
>>       19 | #define USE_SPLIT_PTE_PTLOCKS   (NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
>>          |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/mm_types_task.h:20:34: note: in expansion of macro 'USE_SPLIT_PTE_PTLOCKS'
>>       20 | #define USE_SPLIT_PMD_PTLOCKS   (USE_SPLIT_PTE_PTLOCKS && \
>>          |                                  ^~~~~~~~~~~~~~~~~~~~~
>>    include/linux/mm.h:3010:5: note: in expansion of macro 'USE_SPLIT_PMD_PTLOCKS'
>>     3010 | #if USE_SPLIT_PMD_PTLOCKS
>>          |     ^~~~~~~~~~~~~~~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:75:21: error: variable 'adxl367_spi_regmap_bus' has initializer but incomplete type
>>       75 | static const struct regmap_bus adxl367_spi_regmap_bus = {
>>          |                     ^~~~~~~~~~
>>>> drivers/iio/accel/adxl367_spi.c:76:10: error: 'const struct regmap_bus' has no member named 'read'
>>       76 |         .read = adxl367_read,
>>          |          ^~~~
>>    drivers/iio/accel/adxl367_spi.c:76:17: warning: excess elements in struct initializer
>>       76 |         .read = adxl367_read,
>>          |                 ^~~~~~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:76:17: note: (near initialization for 'adxl367_spi_regmap_bus')
>>>> drivers/iio/accel/adxl367_spi.c:77:10: error: 'const struct regmap_bus' has no member named 'write'
>>       77 |         .write = adxl367_write,
>>          |          ^~~~~
>>    drivers/iio/accel/adxl367_spi.c:77:18: warning: excess elements in struct initializer
>>       77 |         .write = adxl367_write,
>>          |                  ^~~~~~~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:77:18: note: (near initialization for 'adxl367_spi_regmap_bus')
>>    drivers/iio/accel/adxl367_spi.c:80:21: error: variable 'adxl367_spi_regmap_config' has initializer but incomplete type
>>       80 | static const struct regmap_config adxl367_spi_regmap_config = {
>>          |                     ^~~~~~~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:81:10: error: 'const struct regmap_config' has no member named 'reg_bits'
>>       81 |         .reg_bits = 8,
>>          |          ^~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:81:21: warning: excess elements in struct initializer
>>       81 |         .reg_bits = 8,
>>          |                     ^
>>    drivers/iio/accel/adxl367_spi.c:81:21: note: (near initialization for 'adxl367_spi_regmap_config')
>>    drivers/iio/accel/adxl367_spi.c:82:10: error: 'const struct regmap_config' has no member named 'val_bits'
>>       82 |         .val_bits = 8,
>>          |          ^~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:82:21: warning: excess elements in struct initializer
>>       82 |         .val_bits = 8,
>>          |                     ^
>>    drivers/iio/accel/adxl367_spi.c:82:21: note: (near initialization for 'adxl367_spi_regmap_config')
>>    drivers/iio/accel/adxl367_spi.c: In function 'adxl367_spi_probe':
>>    drivers/iio/accel/adxl367_spi.c:132:18: error: implicit declaration of function 'devm_regmap_init' [-Werror=implicit-function-declaration]
>>      132 |         regmap = devm_regmap_init(&spi->dev, &adxl367_spi_regmap_bus, st,
>>          |                  ^~~~~~~~~~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:132:16: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>      132 |         regmap = devm_regmap_init(&spi->dev, &adxl367_spi_regmap_bus, st,
>>          |                ^
>>    drivers/iio/accel/adxl367_spi.c: At top level:
>>    drivers/iio/accel/adxl367_spi.c:75:32: error: storage size of 'adxl367_spi_regmap_bus' isn't known
>>       75 | static const struct regmap_bus adxl367_spi_regmap_bus = {
>>          |                                ^~~~~~~~~~~~~~~~~~~~~~
>>    drivers/iio/accel/adxl367_spi.c:80:35: error: storage size of 'adxl367_spi_regmap_config' isn't known
>>       80 | static const struct regmap_config adxl367_spi_regmap_config = {
>>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
>>    cc1: some warnings being treated as errors
>>
>>
>> vim +76 drivers/iio/accel/adxl367_spi.c
>>
>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14  74  
>> c922c634bd926d Javier Carrasco 2024-07-03  75  static const struct regmap_bus adxl367_spi_regmap_bus = {
>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14 @76  	.read = adxl367_read,
>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14 @77  	.write = adxl367_write,
>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14  78  };
>> cbab791c5e2a58 Cosmin Tanislav 2022-02-14  79  
>>
>> :::::: The code at line 76 was first introduced by commit
>> :::::: cbab791c5e2a58c123d84bd9202c054e5449bc96 iio: accel: add ADXL367 driver
>>
>> :::::: TO: Cosmin Tanislav <demonsingur@gmail.com>
>> :::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>
> 
> Strange. I followed the "how to reproduce" guide step by step, but it
> compiled just fine (gcc-12.3.0 instead of 12.2.0, though).
> 
> On the other hand, there has been a similar bug in hwmon[1] and it had
> nothing to do with making the struct const, which actually uncovered a
> missing select (in that case REGMAP_I2C).
> 
> In this particular case, 'select REGMAP_SPI' is present in the Kconfig
> entry for the driver, and the header is included in adxl367_spi.c. The
> only thing is that the driver uses devm_regmap_init() instead of
> devm_regmap_init_spi(), and other drivers that include REGMAP_SPI use
> that one. Does that make sense?
> 
> Best regards,
> Javier Carrasco

Link:
https://lore.kernel.org/oe-kbuild-all/202410020246.2cTDDx0X-lkp@intel.com/
[1]
