Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3BA32
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 03:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045794; cv=none; b=cVSFfzBctaKdNz0oqtcaNYwFOSJP6n02LaFH9Rju5c1OUgdfAz+RxRS9BuPZRP5Ejug8ALWmCXqiH4XdYs83FfKsHXBjCuIwow7wJ254tID6/hSKU1Pm6D8wNPqAh7OUnD6NH61CEAzjzgq9MQHNFEcrIMQUV+FqdvCGnx/wENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045794; c=relaxed/simple;
	bh=YmaYW5dSIBQjpjo+2/qzzynlo+7vju+tO+f7B/b8Ayo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bap5oxrrOm1xyZmPozt3318akMwLaOesAB5d/UUINrHJnO+AwaxYtGH4tqFNc3XqDOsw4u5hF+z3X1nrF44t61ctrc8UHylmqli72bLwHehVZk6C+xUAeLV0HkhZhBZ8bUF/1/2WO6gH/QoLJd6uRySS1aXX1JmPHPHRTt7DlgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZNTRB27BTz2CdKC;
	Thu, 27 Mar 2025 11:19:34 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 98986140340;
	Thu, 27 Mar 2025 11:22:51 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Mar 2025 11:22:51 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 27 Mar
 2025 11:22:50 +0800
Message-ID: <aadbbf8a-9ee2-440c-b422-884fdc59f4fd@huawei.com>
Date: Thu, 27 Mar 2025 11:22:50 +0800
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
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <7973862d-2d11-4679-91ff-d1c7e8955f97@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100009.china.huawei.com (7.202.194.112)


在 2025/3/21 9:31, Guenter Roeck 写道:
> On 3/20/25 18:08, kernel test robot wrote:
>> tree: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>> master
>> head:   73b8c1dbc2508188e383023080ce6a582ff5f279
>> commit: c812cc42f92d3d0b17c01b5db9a1dee5793a1491 [12598/12769] hwmon: 
>> (acpi_power_meter) Replace the deprecated hwmon_device_register
>> config: i386-randconfig-061-20250320 
>> (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): 
>> (https://download.01.org/0day-ci/archive/20250321/202503210903.kUr36x1C-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202503210903.kUr36x1C-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     ld: drivers/hwmon/acpi_power_meter.o: in function 
>> `power1_accuracy_show':
>>>> drivers/hwmon/acpi_power_meter.c:618: undefined reference to 
>>>> `__udivmoddi4'
>>
>>
>> vim +618 drivers/hwmon/acpi_power_meter.c
>>
>>     610
>>     611    static ssize_t power1_accuracy_show(struct device *dev,
>>     612                        struct device_attribute *attr,
>>     613                        char *buf)
>>     614    {
>>     615        struct acpi_power_meter_resource *res = 
>> dev_get_drvdata(dev);
>>     616
>>     617        return sysfs_emit(buf, "%llu.%llu%%\n",
>>   > 618                  res->caps.accuracy / 1000, 
>> res->caps.accuracy % 1000);
>>     619    }
>>     620
>>
>
> Fixed up.
>
>
Hi Guenter,

How to fix it? I'd like to trace it. But I didn't find your modification.

/Huisong
