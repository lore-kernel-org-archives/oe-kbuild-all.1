Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F617E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056457; cv=none; b=HyXo04ufIgIr1xPaLLqPvA6Pc6tJF49S5OFZN2I7L9AmrS3XtMbzRRXbghQjpdBybIDO2ta4GUhy5lGqM0tT+J7hEmE95daQCSfWsvmHlG9jIK12DGZriaOQ9THjcpBuN70fLoNkGlpq41t5lk3cckQpq++seUfW5rwOnF5dyFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056457; c=relaxed/simple;
	bh=TsxDDL3cp5eMVeNKXpu+FITlrE/0NE+1eIe0PdRQ79Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NpjQhwOsbPnaGf4iTKrgLKwVPnmZEhCp3uZo+O/pSOZn6v+EeJU+t3G0z8IwSzLqepy1AR49gsby91JwgqTnq4Mq5HJm+J+qhXcGuMh9aaO4ycGBeZfczTzj5EQyqrSEt4VcMz9WB1OEtHGKQ/LOKrHg/S+9m5E4Cs2q1dTj2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZNYQj0tcxztRhV;
	Thu, 27 Mar 2025 14:19:25 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 766C6140382;
	Thu, 27 Mar 2025 14:20:51 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Mar 2025 14:20:47 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 27 Mar
 2025 14:20:46 +0800
Message-ID: <06d4d5a8-fa21-4419-90be-fab91c020260@huawei.com>
Date: Thu, 27 Mar 2025 14:20:46 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12598/12769]
 drivers/hwmon/acpi_power_meter.c:618: undefined reference to `__udivmoddi4'
To: Guenter Roeck <linux@roeck-us.net>
CC: <oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>
References: <202503210903.kUr36x1C-lkp@intel.com>
 <7973862d-2d11-4679-91ff-d1c7e8955f97@roeck-us.net>
 <aadbbf8a-9ee2-440c-b422-884fdc59f4fd@huawei.com>
 <57da66d1-821b-4642-9492-eaed76aba985@roeck-us.net>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <57da66d1-821b-4642-9492-eaed76aba985@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/3/27 11:47, Guenter Roeck 写道:
> On 3/26/25 20:22, lihuisong (C) wrote:
>>
>> 在 2025/3/21 9:31, Guenter Roeck 写道:
>>> On 3/20/25 18:08, kernel test robot wrote:
>>>> tree: 
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>>>> master
>>>> head:   73b8c1dbc2508188e383023080ce6a582ff5f279
>>>> commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491 [12598/12769] 
>>>> hwmon: (acpi_power_meter) Replace the deprecated hwmon_device_register
>>>> config: i386-randconfig-061-20250320 
>>>> (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/config)
>>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>>> reproduce (this is a W=1 build): 
>>>> (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a 
>>>> new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: 
>>>> https://lore.kernel.org/oe-kbuild-all/202503210903.kUr36x1C-lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>     ld: drivers/hwmon/acpi_power_meter.o: in function 
>>>> `power1_accuracy_show':
>>>>>> drivers/hwmon/acpi_power_meter.c:618: undefined reference to 
>>>>>> `__udivmoddi4'
>>>>
>>>>
>>>> vim +618 drivers/hwmon/acpi_power_meter.c
>>>>
>>>>     610
>>>>     611    static ssize_t power1_accuracy_show(struct device *dev,
>>>>     612                        struct device_attribute *attr,
>>>>     613                        char *buf)
>>>>     614    {
>>>>     615        struct acpi_power_meter_resource *res = 
>>>> dev_get_drvdata(dev);
>>>>     616
>>>>     617        return sysfs_emit(buf, "%llu.%llu%%\n",
>>>>   > 618                  res->caps.accuracy / 1000, 
>>>> res->caps.accuracy % 1000);
>>>>     619    }
>>>>     620
>>>>
>>>
>>> Fixed up.
>>>
>>>
>> Hi Guenter,
>>
>> How to fix it? I'd like to trace it. But I didn't find your 
>> modification.
>>
>
> Problem was that you optimized the local 'acc' variable away.
>
> In upstream commit 16746ce8adf:
>
> [groeck: Fixed some multi-line alignment issues;
>      reverted to 32-bit arithmetic in power1_accuracy_show()
>      fixed bad return code from power_meter_is_visible()]
I found them in 16746ce8adf. Thank you very much.
>
> ...
>
> +static ssize_t power1_accuracy_show(struct device *dev,
> +                                   struct device_attribute *attr,
> +                                   char *buf)
> +{
> +       struct acpi_power_meter_resource *res = dev_get_drvdata(dev);
> +       unsigned int acc = res->caps.accuracy;
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +       return sysfs_emit(buf, "%u.%u%%\n", acc / 1000, acc % 1000);
>                                             ^^^         ^^^
> +}
>
> There is no reason to believe that res->caps.accuracy is ever larger
> than UINT_MAX. If it is possible, that should have been handled 
> separately
> anyway since it would have been a bug fix.
>
>
Ack.
