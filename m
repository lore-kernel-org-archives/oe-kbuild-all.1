Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD307CA6B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 11:51:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.201])
	by gateway (Coremail) with SMTP id _____8BxY_BAFvdkcI4fAA--.63692S3;
	Tue, 05 Sep 2023 19:51:28 +0800 (CST)
Received: from [10.20.42.201] (unknown [10.20.42.201])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx3yM8FvdkV9dsAA--.25045S3;
	Tue, 05 Sep 2023 19:51:24 +0800 (CST)
Subject: Re: loongson2_pm.c:undefined reference to `input_free_device'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Liu Yun <liuyun@loongson.cn>,
 zhuyinbo@loongson.cn
References: <202309030751.pDnTZX4E-lkp@intel.com>
 <92ae0927-de68-2245-954f-5dd37d6f1491@loongson.cn>
From: Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <261a865e-0abb-cb4c-72a1-eef70bde18d4@loongson.cn>
Date: Tue, 5 Sep 2023 19:51:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <92ae0927-de68-2245-954f-5dd37d6f1491@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx3yM8FvdkV9dsAA--.25045S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==



在 2023/9/5 下午7:12, Yinbo Zhu 写道:
> 
> 
> 在 2023/9/3 上午7:17, kernel test robot 写道:
>> tree:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   b89b029377c8c441649c7a6be908386e74ea9420
>> commit: 67694c076bd7d6b8b73c59d4881822f0493caf35 soc: loongson2_pm: 
>> add power management support
>> date:   12 days ago
>> config: loongarch-randconfig-r014-20230903 
>> (https://download.01.org/0day-ci/archive/20230903/202309030751.pDnTZX4E-lkp@intel.com/config) 
>>
>> compiler: loongarch64-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): 
>> (https://download.01.org/0day-ci/archive/20230903/202309030751.pDnTZX4E-lkp@intel.com/reproduce) 
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202309030751.pDnTZX4E-lkp@intel.com/ 
>>
>>
>> All errors (new ones prefixed by >>): >
>>     loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in 
>> function `.LBB191':
>>     loongson2_pm.c:(.text+0x10c): undefined reference to 
>> `input_allocate_device'
>>     loongarch64-linux-ld: loongson2_pm.c:(.text+0x144): undefined 
>> reference to `input_set_capability'
>>     loongarch64-linux-ld: loongson2_pm.c:(.text+0x14c): undefined 
>> reference to `input_register_device'
> 
> 
> I will add linux/input.h to fix this issue.
> 


Sorry, what I said earlier was incorrect.  It needs to add an "INPUT"
dependency.

  config LOONGSON2_PM
         bool "Loongson-2 SoC Power Management Controller Driver"
         depends on LOONGARCH && OF
+       depends on INPUT

Thanks,
Yinbo

>>     loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in 
>> function `.LBB240':
>>>> loongson2_pm.c:(.text+0x25c): undefined reference to 
>>>> `input_free_device'
>>     loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in 
>> function `.LBB387':
>>     loongson2_pm.c:(.text+0x390): undefined reference to `input_event'
>>     loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in 
>> function `.LBE387':
>>     loongson2_pm.c:(.text+0x3a4): undefined reference to `input_event'
>>     loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in 
>> function `.LBE389':
>>     loongson2_pm.c:(.text+0x3b8): undefined reference to `input_event'
>>     loongarch64-linux-ld: drivers/soc/loongson/loongson2_pm.o: in 
>> function `.LBE391':
>>     loongson2_pm.c:(.text+0x3cc): undefined reference to `input_event'
>>

