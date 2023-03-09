Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB57863A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 09:49:49 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8DxE4S6qwlkYlkKAA--.13647S3;
	Thu, 09 Mar 2023 17:49:46 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axur23qwlka3JQAA--.8637S3;
	Thu, 09 Mar 2023 17:49:43 +0800 (CST)
Subject: Re: [linux-next:master 995/2428] kismet: WARNING: unmet direct
 dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jianmin Lv <lvjianmin@loongson.cn>,
 Hongchen Zhang <zhanghongchen@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>, Juxin Gao <gaojuxin@loongson.cn>,
 Linus Walleij <linus.walleij@linaro.org>, zhuyinbo@loongson.cn
References: <202303091430.hbWEMt4b-lkp@intel.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <cdf7c3b8-b538-1666-18e2-63a3d0ae3e4f@loongson.cn>
Date: Thu, 9 Mar 2023 17:49:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202303091430.hbWEMt4b-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Axur23qwlka3JQAA--.8637S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZr18Gw13GFyruw1DXr4ruFg_yoW5GF43pF
	W0yF4v9r18XF109ayj9F17uF40qr1DC3y5ZrZ7Gr1Fvay7ArykXrn3ur43ZFyqyrn8Cw43
	KFy5ur98G3y8ua7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bx8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM2
	8EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAq
	jxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz4
	8v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8pnQUUUUU=


在 2023/3/9 下午2:44, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
> commit: 7944d3b7fe86067509751473aa917fdfd662d92c [995/2428] gpio: loongson: add gpio driver support
> config: x86_64-kismet-CONFIG_GPIO_SYSCON-CONFIG_GPIO_SAMA5D2_PIOBU-0-0 (https://download.01.org/0day-ci/archive/20230309/202303091430.hbWEMt4b-lkp@intel.com/config)
> reproduce:
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7944d3b7fe86067509751473aa917fdfd662d92c
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 7944d3b7fe86067509751473aa917fdfd662d92c
>          # 1. reproduce by kismet
>             # install kmax per https://github.com/paulgazz/kmax/blob/master/README.md
>             kismet --linux-ksrc=linux --selectees CONFIG_GPIO_SYSCON --selectors CONFIG_GPIO_SAMA5D2_PIOBU -a=x86_64
>          # 2. reproduce by make
>             # save the config file to linux source tree
>             cd linux
>             make ARCH=x86_64 olddefconfig
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303091430.hbWEMt4b-lkp@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for GPIO_SYSCON when selected by GPIO_SAMA5D2_PIOBU
>     .config:5169:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
>     .config:12935:warning: symbol value 'ONFIG_NR_CPUS_DEFAUL' invalid for NR_CPUS
>     
>     WARNING: unmet direct dependencies detected for OF_GPIO
>       Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
>       Selected by [y]:
>       - GPIO_LOONGSON_64BIT [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (LOONGARCH || COMPILE_TEST [=y])

This warning  is "unmet direct dependencies detected for OF_GPIO ",  it 
should be GPIO_LOONGSON_64BIT not depend  OF_GPIO  rather than select 
OF_GPIO,

I will add a depend on "OF_GPIO" replace select "OF_GPIO"  for loongson 
gpio driver to fix this warning.

>     
>     WARNING: unmet direct dependencies detected for GPIO_SYSCON
>       Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
>       Selected by [y]:
>       - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
>

