Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E646B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 03:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743047244; cv=none; b=UAZbe5CuoYMwubfRiDMxTI9zIGwqNtbIJ5kHG4LtvLtrNhSIV9UWGI2Z1PonAcA90LtO6i5TasKlNeA7F8NOfzl++Ms15XVqaCmLxSCBXQXq84IL5sy/FbIgpz9O+ROcmDRzgzIFMOIHjBpDvcG3EHPI7YMlG9YcF9aPi7RWOYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743047244; c=relaxed/simple;
	bh=PSkEpKCZvYWWs/D3luDKT/kpj7XSW4wDqT+f67asZ3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rYY/fF4K+xRNdHpeLhpIz1Ds5b52vmnnoxjeoYevquqMR3ZKAjpF8abpMpV2QlT+dEhktdR8+/IQNk2RVTxZyuNdU2zeYB75GsZrS+xYn11m807oFSYWyCaQ65Szs9RAEiemuWMeW9AaEhmdNSB42ZLY1QWnODfPwS7XSeJKXYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUHNAXtB; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUHNAXtB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227a8cdd241so13333055ad.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743047242; x=1743652042; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zl21HJfReBIOWKP9+7DCNBJ2nDhA5sguW+a9S/eIQ1Q=;
        b=ZUHNAXtBenFFeDFktIm60aptxtKSwTJbG+oG8pwLALSHJZU6CkwjBjNvAqPhiUYxFA
         /SBekjycUnjvis8Vo90cFb5Gl/vfOhDOc6A8amM5VBcE29IgI1BDXyBe2+8T5KEEPRis
         SMsKbZL7GcRNBnXRBpA2m/wZeX0yrHgvcWB/tXLm2KMTEWRoU5ot2jR7fHSHUg1KLzxO
         qu0KD4sYPx62mrKE4x3lOtdgz87j6SmpHXiAB4bya2eSfbKFUNqmZLB+lpNE6xdKLUkY
         D6GKB7FpexOxHJs/myDVrzv9A/ywKfzBRCR2+E1CYoBzyaA90c3CvJYeARQtlJ7LI/Vk
         uwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743047242; x=1743652042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl21HJfReBIOWKP9+7DCNBJ2nDhA5sguW+a9S/eIQ1Q=;
        b=qdVqWO3/7S4vxZNbaG5Tpx7nG719LZCbdpNs2BrvEVcHMRY+v0uJ0CQLKEsBuqYFLq
         90xsAVGmLAlBXjhfSSWTFwvuyTBPprkjIip6hjkWEvJwPsEGS8WXqdy9mMJpOPk7yqaC
         Yj4yhYzRCPyrtkzmbUVS5va9IkFvA9piROaJZlxwPgcLDwShr0j8NgBq956Y1ezd19W3
         YWz231i5M5D4i6feTeu45AK8E8vggGa/u+jEgt8EV5lGKXYHemeVQzKxi4SRIbyLHieM
         Nftk8ZraZ09SER15VzMpswuI53aGLZbV78YKKOf9JcSiOYsOPdW2lG0m18e4ZNFa1EXM
         nKcw==
X-Gm-Message-State: AOJu0YzNvMIfAgQg+Z6EELGXExbkg7Bd9jJ/MxFd+kZPzrWu6kh/UMmx
	tzzPSsBu4wlyJsHVugAAjQ8YjvKR6kzL/WaKS0rOqBFeAEY3hFBU
X-Gm-Gg: ASbGncs4NdpUboSkTxSImh7ip3UZ674dyxnwrh1V7Nzx1SKTaPx6R40tDypC0FTf7Im
	iBjXDfdUOxg7ne0cX9N2H8HZScGPndkIw+fo6V/0m90dHq6zyC3KTWk63xa1c+y2q0lID+sfiXe
	btUjAXpx6KeduleyaamC4stQ4hC9FdBQZZBRX/1S+5Y/pgLiahmzRR9aTV0DGKGcJ4f9S81mK1G
	VhKp9HoIlCxP3sPHPQs1gBosJi99W/DtID7zhIhXYM5G09lMSMwd5KP/NIbfQJ2UtmVeCzcn3N9
	5mDsfPBe0FxGbKHc8Xur1W12zHKNiHIZ54aJNml9jG7oI4JBz0tYRoSYbs6wdiRHfqed1vVV2fW
	sLomuHQGa3G/kQ1Zj8v8QOcMtTmY3
X-Google-Smtp-Source: AGHT+IFoEVSWNl2XItqcKTzbglb5lzVyrb7uEUXno6Sq6Ay8oKyDMzvYVkTWfW052hKptAiJdX0IUw==
X-Received: by 2002:a05:6a00:4fd6:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-739610cb5fcmr2829939b3a.21.1743047241717;
        Wed, 26 Mar 2025 20:47:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615654esm13461002b3a.130.2025.03.26.20.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 20:47:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57da66d1-821b-4642-9492-eaed76aba985@roeck-us.net>
Date: Wed, 26 Mar 2025 20:47:19 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12598/12769]
 drivers/hwmon/acpi_power_meter.c:618: undefined reference to `__udivmoddi4'
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <202503210903.kUr36x1C-lkp@intel.com>
 <7973862d-2d11-4679-91ff-d1c7e8955f97@roeck-us.net>
 <aadbbf8a-9ee2-440c-b422-884fdc59f4fd@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <aadbbf8a-9ee2-440c-b422-884fdc59f4fd@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/26/25 20:22, lihuisong (C) wrote:
> 
> 在 2025/3/21 9:31, Guenter Roeck 写道:
>> On 3/20/25 18:08, kernel test robot wrote:
>>> tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   73b8c1dbc2508188e383023080ce6a582ff5f279
>>> commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491 [12598/12769] hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register
>>> config: i386-randconfig-061-20250320 (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202503210903.kUr36x1C-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>     ld: drivers/hwmon/acpi_power_meter.o: in function `power1_accuracy_show':
>>>>> drivers/hwmon/acpi_power_meter.c:618: undefined reference to `__udivmoddi4'
>>>
>>>
>>> vim +618 drivers/hwmon/acpi_power_meter.c
>>>
>>>     610
>>>     611    static ssize_t power1_accuracy_show(struct device *dev,
>>>     612                        struct device_attribute *attr,
>>>     613                        char *buf)
>>>     614    {
>>>     615        struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
>>>     616
>>>     617        return sysfs_emit(buf, "%llu.%llu%%\n",
>>>   > 618                  res->caps.accuracy / 1000, res->caps.accuracy % 1000);
>>>     619    }
>>>     620
>>>
>>
>> Fixed up.
>>
>>
> Hi Guenter,
> 
> How to fix it? I'd like to trace it. But I didn't find your modification.
> 

Problem was that you optimized the local 'acc' variable away.

In upstream commit 16746ce8adf:

[groeck: Fixed some multi-line alignment issues;
      reverted to 32-bit arithmetic in power1_accuracy_show()
      fixed bad return code from power_meter_is_visible()]

...

+static ssize_t power1_accuracy_show(struct device *dev,
+                                   struct device_attribute *attr,
+                                   char *buf)
+{
+       struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
+       unsigned int acc = res->caps.accuracy;
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+       return sysfs_emit(buf, "%u.%u%%\n", acc / 1000, acc % 1000);
                                             ^^^         ^^^
+}

There is no reason to believe that res->caps.accuracy is ever larger
than UINT_MAX. If it is possible, that should have been handled separately
anyway since it would have been a bug fix.

Guenter

