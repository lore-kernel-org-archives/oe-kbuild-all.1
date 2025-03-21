Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A22F5E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742520698; cv=none; b=GeOFMuay08uoTV5eiyFH+eVxrEJ7JlQ8XbCijb2g1rtxQ7hhiPWJn+OD2Q0a9DOEb0YzCs4rlEYWOTmlz04JdBSNfgI2NvIECBbOdQKSNXuKFWC+rdne8phaBx2KMOx6FTv4a99Pkn3X9ElEPXjGNCmoctWVyBkf5u0WPohumko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742520698; c=relaxed/simple;
	bh=19QqrINACnk2OCICLMSxlcViyuahXKToQjY0ZqM9OF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/ulktwKMDIvdWEvcF1BhgPY7suyG8aIv+4jchq3/jkIgSPJEZAa+6FlAUmRdKt7N4x4ro3kEjBahQThlv+cwtQXncIwSL8yVLxifMgTlKd1BNBirrwcMe2P1nsn1dVTmEILH7N6RMOzTm4iE78G79RzrMAhfclwUjLB995K1iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEr2kukE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEr2kukE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22403cbb47fso27351775ad.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 18:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742520694; x=1743125494; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CnMhgNmdETNtUbU+oEoP1zlzA4T8nTPVEP8ZcIH7Tz0=;
        b=ZEr2kukEglLbQSHYm+G0rvlVZ3UlvmN24ty511rAIAQKzE750sFCh2bhiPHCkltyXg
         PVD0Cg0VmP9mBv7eyRHJvO9AxxdOcStoRkv26ZW4opCbdZsVZAcGoCeMgvtn8VTOamF+
         EzvbUer+30teBZaoSsSYj+C32Ura4NVbMwCqoz9ajNCRsMIvzbQ5FCftornxorRbX7G8
         ZpHzfYqoIlYGKbCeTj3x25MYM2sbHFZdDHQ/WHhZ8NeMqpAuuDMiylcHUyIMUPga9IbK
         1HK7oGuLAh6JscUgY4+R2mN1QIGcY4/y0HaPPfWY6kU8YtFTNjV0qZNW8YQYMYYuGDcJ
         c3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742520694; x=1743125494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnMhgNmdETNtUbU+oEoP1zlzA4T8nTPVEP8ZcIH7Tz0=;
        b=prF0Qdn7m2/M5aFK5ytyhoA/tIMssWNSJCSTSELvgWmkDgUQgSuHjzwawQ7uIe6Lcg
         0qvfhn7/7ihdU36PMtayelnZ9NIJy1xqqQwJ9Mv75CM3FzCuRO+SvJHrzvSTv3kEHU7p
         lfUV+xM5QvKyyjJ9P6Vv7gIuu3+lC0NN/ifv0RS14SfFyuEPZcRfCJbD5psChgmgbpWn
         z+kDQkXJcux+A2hvX2IeDRnNsobcI4AQ1OGiZx67V5qc7LNqGLOZ5Hiy3Ynqp4+OyULF
         uG9XBLFcsbbzqNHtjduwHhrVXn1ILnhqsHP4uiY5InqVfRREwlOm3RshJnL3bP0h9+EQ
         8Q5g==
X-Gm-Message-State: AOJu0Yy/IMxBxzMAVrAQYHCgEj8adwMmMP/HCtRx+pJhLPcRPbotPlFQ
	P6hV9xQ+7pCwVCC8Drj8143/YLaLLt2T/RjRXMPPjY9GfBd31icd3dzj9g==
X-Gm-Gg: ASbGncvUM61jinggh8NMsGyMIF6M4Dr+VU8A+7ikyqPorsiQBcR4DnVVU2u48MmpzYI
	fQpr6fhnVmWiMGmRMFf6b84Ghiev6W7vIsgzA7OBhXTyFEBvt15wb5smp4/Q6luawAcXECZWLK6
	Gc0+FAkyyChqUoL71qn1CWN3DfVw9ivG25PTmy3s25CLLGNUyCY+w7g73fBgAWZNFKg5Qv4DhYd
	bNGO46vLfPxABlOFLYEcenl7hyDBlzS2/j/SWchFLov2v9NAtvte5yQ9Ggb5VXBmyG81mW1H4tF
	LwyacIlTFkdZnSDEmWI3Mf7psU8VifAPgM6VD0/lNUL1nMMylIqXBgK1WLB0VYt9enQufXyMUlF
	N4ov7rsxIwlkbMhmZbQ==
X-Google-Smtp-Source: AGHT+IHAteCbpzkwb8Z8vsznkdVOuodQzx3Thb8JJyGMsg5FntowYENi0bYLGy1Akvw6blAPXQxZFA==
X-Received: by 2002:a05:6a21:6e48:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-1fe42f358femr2650582637.10.1742520694122;
        Thu, 20 Mar 2025 18:31:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a233a8sm572185a12.52.2025.03.20.18.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 18:31:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7973862d-2d11-4679-91ff-d1c7e8955f97@roeck-us.net>
Date: Thu, 20 Mar 2025 18:31:32 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12598/12769]
 drivers/hwmon/acpi_power_meter.c:618: undefined reference to `__udivmoddi4'
To: kernel test robot <lkp@intel.com>, Huisong Li <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202503210903.kUr36x1C-lkp@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <202503210903.kUr36x1C-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/25 18:08, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   73b8c1dbc2508188e383023080ce6a582ff5f279
> commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491 [12598/12769] hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register
> config: i386-randconfig-061-20250320 (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503210903.kUr36x1C-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     ld: drivers/hwmon/acpi_power_meter.o: in function `power1_accuracy_show':
>>> drivers/hwmon/acpi_power_meter.c:618: undefined reference to `__udivmoddi4'
> 
> 
> vim +618 drivers/hwmon/acpi_power_meter.c
> 
>     610	
>     611	static ssize_t power1_accuracy_show(struct device *dev,
>     612					    struct device_attribute *attr,
>     613					    char *buf)
>     614	{
>     615		struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
>     616	
>     617		return sysfs_emit(buf, "%llu.%llu%%\n",
>   > 618				  res->caps.accuracy / 1000, res->caps.accuracy % 1000);
>     619	}
>     620	
> 

Fixed up.

Thanks,
Guenter

