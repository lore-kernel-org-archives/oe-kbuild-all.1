Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C82523D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719131501; cv=none; b=gfM4KOKD3+3HkluWKcQJ7a9kMfQla7pqw4qCVwL/CqczEzG0PKsAaod3zOfMmh/CU0oIBVjS601pt76W4Pzr3n9oeWcJuCXn9gGnM5z+d7TJ5Q4GYDx30l6PTQ4LZHR20CPEpP9IobdplIKuThO8k1XDhvOkfxqne4tWU+KyO2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719131501; c=relaxed/simple;
	bh=v7qG2+wmVcKP3bikUjkdlHeVprJrpA6Qa37pLUSYULI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a82nvO98mehULvHC6hPdthUbs4+3WZn/Y2yNTaH/a4ugk7xdouEA1HWsKB2LC14LAT+ZBQiRastRFOOyvvTVNMIQZ8HTBbD2/ZiI4oHl831NXNqrBVp8xOFddQpuArTguI3kgG6i2YVAntnWBxYfck+VpXtnl2Fepi2I9UHbckE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UBRs0DU3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UBRs0DU3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424900a9b05so426885e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 01:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719131497; x=1719736297; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jsqj1mnPFmZ4HtpCEpmJpbwJCPM7vnJK8NGNkvKmkbY=;
        b=UBRs0DU3xpcwOx1tNXmw4bJLdhz4yTslYOGGzA5dz4jtMlQuQhoJ5cz6RqEQ8ABS0H
         8Zt0uU7K8VmDud5D+aaWlCnbajOhcLs35/DD4mYE1q3P/C0+KQNiGtbAM3njFnTPyP9d
         wy6vKT2N7GiGqV3Du5J+y1M6oM6/JmHK6B4P+QqSB0ZBycs+UgbUrXYztCRdzKVwccnZ
         biHSt0KyOQ96LIzj1Nq4eKTpiBt2lqc+2qmsZqXpOwag7AvvPiCp7H9rWdPjIVipq8mX
         lpep0GNJCu5s7vrZad1tS9wXxa3OoWm7SxpALsbVoeko7Sgvj6z+/8PHmYdyqYf2+74z
         o8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719131497; x=1719736297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jsqj1mnPFmZ4HtpCEpmJpbwJCPM7vnJK8NGNkvKmkbY=;
        b=QPyHGtG7sA6XDMAZwUriebFkf+DTIxr7kEaf+72zGihtLzXGG+3QTm7AUni50lLUqq
         U1NBNsyUOzzw2PTbo0Jqe+1C5gNYJ931UKyOBl8pyL8LW4cF0Ao0PTwMS267fwX9M5p4
         r4ELXjlT53ZGelzdeQwEInXVmmumA/Aw7I54YwBocvZUn76FKjwDWWVkdW9pEzQh9kMF
         j/+bk+B3+oZSy+/5DQorvVr4+pXqMeyhnUAdLJXe+lyYX7z3YB85wE2ila1fydgP1jVG
         zg78U43VWJFfd7nPUkSJ9+4yAAKBEIcejlGeMoOMwzikrbC9BF67Z+yy8T9TbBHbWPTn
         1Gng==
X-Forwarded-Encrypted: i=1; AJvYcCV48jpaDRK4F/xkIWXOiIWWsdmcdWZl0l8NTQjQM3shwulCeB07UsOYaLCGc4786ExSGQ9gYZixaUCGs5o3QfnTWcWMRZ/wFTzMtjCXqg==
X-Gm-Message-State: AOJu0YzisAK6OTVe40EL8zGbQDrt75oBGwwwn/vMQnqWM+vGiCxsvy78
	V5rtI7/5GecU/C41OMzmfqJMEXwLG+oOfBQCv+Ip1LuI9lOMors2FrludGuzDgo=
X-Google-Smtp-Source: AGHT+IEJILTYt6PUgSjJwIqaKmF0untmUoZHcR9xfPOGbEzHRUI7QzpaSDWIbCleTE9FtfZKsiybyg==
X-Received: by 2002:a05:600c:4f4d:b0:424:8f0d:c07f with SMTP id 5b1f17b1804b1-4248f0dce13mr3752945e9.4.1719131496800;
        Sun, 23 Jun 2024 01:31:36 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4248179d3basm100098475e9.4.2024.06.23.01.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 01:31:36 -0700 (PDT)
Message-ID: <611ba3b3-3804-4dd1-bb11-0ba206a789cf@linaro.org>
Date: Sun, 23 Jun 2024 09:31:35 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [srini-nvmem:for-next 9/12] drivers/nvmem/core.c:400:42: error:
 cannot assign to variable 'bin_attr_nvmem_eeprom_compat' with const-qualified
 type 'const struct bin_attribute'
To: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202406231219.Rw6IC4E6-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <202406231219.Rw6IC4E6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/06/2024 05:51, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
> head:   050e51c214c5bbe5ffd9e7f5927ccdcd2da18fe3
> commit: 178a9aea2c5db8328757fdea66922bda0236e95c [9/12] nvmem: core: mark bin_attr_nvmem_eeprom_compat as const
> config: i386-buildonly-randconfig-003-20240623 (https://download.01.org/0day-ci/archive/20240623/202406231219.Rw6IC4E6-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406231219.Rw6IC4E6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406231219.Rw6IC4E6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 

Thanks for reporting this,
Changes required to address this are now in nvmem for-next.

--srini
>>> drivers/nvmem/core.c:400:42: error: cannot assign to variable 'bin_attr_nvmem_eeprom_compat' with const-qualified type 'const struct bin_attribute'
>       400 |                 bin_attr_nvmem_eeprom_compat.attr.name = "fram";
>           |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>     drivers/nvmem/core.c:375:35: note: variable 'bin_attr_nvmem_eeprom_compat' declared const here
>       375 | static const struct bin_attribute bin_attr_nvmem_eeprom_compat = {
>           | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       376 |         .attr   = {
>           |         ~~~~~~~~~~~
>       377 |                 .name   = "eeprom",
>           |                 ~~~~~~~~~~~~~~~~~~~
>       378 |         },
>           |         ~~
>       379 |         .read   = bin_attr_nvmem_read,
>           |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       380 |         .write  = bin_attr_nvmem_write,
>           |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       381 | };
>           | ~
>     1 error generated.
> 
> 
> vim +400 drivers/nvmem/core.c
> 
> 844003052719375 Srinivas Kandagatla 2020-03-25  382
> 844003052719375 Srinivas Kandagatla 2020-03-25  383  /*
> 844003052719375 Srinivas Kandagatla 2020-03-25  384   * nvmem_setup_compat() - Create an additional binary entry in
> 844003052719375 Srinivas Kandagatla 2020-03-25  385   * drivers sys directory, to be backwards compatible with the older
> 844003052719375 Srinivas Kandagatla 2020-03-25  386   * drivers/misc/eeprom drivers.
> 844003052719375 Srinivas Kandagatla 2020-03-25  387   */
> 844003052719375 Srinivas Kandagatla 2020-03-25  388  static int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
> 844003052719375 Srinivas Kandagatla 2020-03-25  389  				    const struct nvmem_config *config)
> 844003052719375 Srinivas Kandagatla 2020-03-25  390  {
> 844003052719375 Srinivas Kandagatla 2020-03-25  391  	int rval;
> 844003052719375 Srinivas Kandagatla 2020-03-25  392
> 844003052719375 Srinivas Kandagatla 2020-03-25  393  	if (!config->compat)
> 844003052719375 Srinivas Kandagatla 2020-03-25  394  		return 0;
> 844003052719375 Srinivas Kandagatla 2020-03-25  395
> 844003052719375 Srinivas Kandagatla 2020-03-25  396  	if (!config->base_dev)
> 844003052719375 Srinivas Kandagatla 2020-03-25  397  		return -EINVAL;
> 844003052719375 Srinivas Kandagatla 2020-03-25  398
> fd307a4ad332ef5 Jiri Prchal         2021-06-11  399  	if (config->type == NVMEM_TYPE_FRAM)
> fd307a4ad332ef5 Jiri Prchal         2021-06-11 @400  		bin_attr_nvmem_eeprom_compat.attr.name = "fram";
> fd307a4ad332ef5 Jiri Prchal         2021-06-11  401
> 2a4542e55f1b592 Srinivas Kandagatla 2020-04-17  402  	nvmem->eeprom = bin_attr_nvmem_eeprom_compat;
> 2a4542e55f1b592 Srinivas Kandagatla 2020-04-17  403  	nvmem->eeprom.attr.mode = nvmem_bin_attr_get_umode(nvmem);
> 844003052719375 Srinivas Kandagatla 2020-03-25  404  	nvmem->eeprom.size = nvmem->size;
> 844003052719375 Srinivas Kandagatla 2020-03-25  405  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> 844003052719375 Srinivas Kandagatla 2020-03-25  406  	nvmem->eeprom.attr.key = &eeprom_lock_key;
> 844003052719375 Srinivas Kandagatla 2020-03-25  407  #endif
> 844003052719375 Srinivas Kandagatla 2020-03-25  408  	nvmem->eeprom.private = &nvmem->dev;
> 844003052719375 Srinivas Kandagatla 2020-03-25  409  	nvmem->base_dev = config->base_dev;
> 844003052719375 Srinivas Kandagatla 2020-03-25  410
> 844003052719375 Srinivas Kandagatla 2020-03-25  411  	rval = device_create_bin_file(nvmem->base_dev, &nvmem->eeprom);
> 844003052719375 Srinivas Kandagatla 2020-03-25  412  	if (rval) {
> 844003052719375 Srinivas Kandagatla 2020-03-25  413  		dev_err(&nvmem->dev,
> 844003052719375 Srinivas Kandagatla 2020-03-25  414  			"Failed to create eeprom binary file %d\n", rval);
> 844003052719375 Srinivas Kandagatla 2020-03-25  415  		return rval;
> 844003052719375 Srinivas Kandagatla 2020-03-25  416  	}
> 844003052719375 Srinivas Kandagatla 2020-03-25  417
> 844003052719375 Srinivas Kandagatla 2020-03-25  418  	nvmem->flags |= FLAG_COMPAT;
> 844003052719375 Srinivas Kandagatla 2020-03-25  419
> 844003052719375 Srinivas Kandagatla 2020-03-25  420  	return 0;
> 844003052719375 Srinivas Kandagatla 2020-03-25  421  }
> 844003052719375 Srinivas Kandagatla 2020-03-25  422
> 
> :::::: The code at line 400 was first introduced by commit
> :::::: fd307a4ad332ef50be5569c92490219e7cd84ce5 nvmem: prepare basics for FRAM support
> 
> :::::: TO: Jiri Prchal <jiri.prchal@aksignal.cz>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
