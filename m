Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944A384A2B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 04:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737348947; cv=none; b=doDKY4A5bRuPyaVOg/HJ+1k2coQk+IexS99uUsnoQVS9MXfuZCY8/6BERne8pFVahnxueGTOm9P3GqKKmzQPkpO1v4OpE+Tke/CtHtWbTEUoAytXNiD4RAXwDPeQMvxYPmaAHHdxxotCATzQNIAwCOEfyvqFJouv5BPdIc3uacQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737348947; c=relaxed/simple;
	bh=nswe2kw9ES6+Jc/f2hXg9oDJiB3tnR84jdyVj+cccos=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FYnrpt9VtsMBui7Add8mgsnZzxiXqLu0ByOwnTF2cOka3oZceXwg+P3DeYg8DoYu5Gjfz9JSQrjmz3lBXZ9l/N7fiLthX2xUuzTDuU2G+OB3J1eCJmkmHJdz7SCgzjDG+qCyegTs0pXeDV6BugY3LCJcmb2IvBlS41PY7Zv3bLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YbygQ3hkmz1JHk2;
	Mon, 20 Jan 2025 12:54:42 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 808B51402C7;
	Mon, 20 Jan 2025 12:55:40 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Jan 2025 12:55:39 +0800
Subject: Re: [rw-ubifs:next 7/7] arch/riscv/include/asm/uaccess.h:33:9: error:
 cast specifies array type
To: Richard Weinberger <richard@nod.at>, kernel test robot <lkp@intel.com>
CC: Rickard X Andersson <rickard.andersson@axis.com>, oe-kbuild-all
	<oe-kbuild-all@lists.linux.dev>
References: <202501191405.WYnmdL0U-lkp@intel.com>
 <304509708.249444175.1737297579621.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <dc4471c5-4181-2c0b-1232-b588c962da93@huawei.com>
Date: Mon, 20 Jan 2025 12:55:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <304509708.249444175.1737297579621.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)

在 2025/1/19 22:39, Richard Weinberger 写道:
> ----- Ursprüngliche Mail -----
>> Von: "kernel test robot" <lkp@intel.com>
>> An: "Rickard X Andersson" <rickard.andersson@axis.com>
>> CC: "oe-kbuild-all" <oe-kbuild-all@lists.linux.dev>, "richard" <richard@nod.at>, "chengzhihao1"
>> <chengzhihao1@huawei.com>
>> Gesendet: Sonntag, 19. Januar 2025 07:29:22
>> Betreff: [rw-ubifs:next 7/7] arch/riscv/include/asm/uaccess.h:33:9: error: cast specifies array type
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
>> head:   01099f635a4c68b8574d350a972ba062dd5142e9
>> commit: 01099f635a4c68b8574d350a972ba062dd5142e9 [7/7] ubi: Implement ioctl for
>> detailed erase counters
>> config: riscv-randconfig-001-20250119
>> (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U-lkp@intel.com/config)
>> compiler: riscv64-linux-gcc (GCC) 14.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20250119/202501191405.WYnmdL0U-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>> | https://lore.kernel.org/oe-kbuild-all/202501191405.WYnmdL0U-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from include/linux/build_bug.h:5,
>>                     from include/linux/container_of.h:5,
>>                     from include/linux/list.h:5,
>>                     from include/linux/module.h:12,
>>                     from drivers/mtd/ubi/cdev.c:25:
>>    drivers/mtd/ubi/cdev.c: In function 'ubi_get_ec_info':
>>>> arch/riscv/include/asm/uaccess.h:33:9: error: cast specifies array type
>>       33 |         (__force __typeof__(addr))__untagged_addr_remote(current->mm,
>>       __addr);  \
>>          |         ^
>>    include/linux/compiler.h:76:45: note: in definition of macro 'likely'
>>       76 | # define likely(x)      __builtin_expect(!!(x), 1)
>>          |                                             ^
>>    arch/riscv/include/asm/uaccess.h:42:50: note: in expansion of macro
>>    'untagged_addr'
>>       42 | #define access_ok(addr, size) likely(__access_ok(untagged_addr(addr),
>>       size))
>>          |                                                  ^~~~~~~~~~~~~
>>    drivers/mtd/ubi/cdev.c:854:14: note: in expansion of macro 'access_ok'
>>      854 |         if (!access_ok(ureq->erase_counters, (end_peb-req.start) *
>>      sizeof(int32_t)))
> 
> I think we need a cast to (void __user *) here.

Right, the root cause is that return value(unsigned long type) of 
funtion __untagged_addr_remote() is converted to the array type, so 
making a cast for the input parameter in advance is a solution. I sent a 
fix patch in 
https://lore.kernel.org/linux-mtd/20250120043824.128102-1-chengzhihao1@huawei.com/T/#u

