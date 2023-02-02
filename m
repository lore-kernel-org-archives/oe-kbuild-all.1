Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5118F7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 03:48:50 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P6l8L1t5MznTV9;
	Thu,  2 Feb 2023 11:46:42 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 2 Feb 2023 11:48:45 +0800
Subject: Re: [linux-stable-rc:queue/4.19 1/66]
 drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function
 'devm_clk_get_enabled'
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
References: <202302012152.IA9WllvH-lkp@intel.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <010464e4-e8a6-0c23-715e-8aef45c30d26@huawei.com>
Date: Thu, 2 Feb 2023 11:48:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202302012152.IA9WllvH-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

Thanks for reporting the issue, this patch depends on the following patches:
   7ef9651e9792 clk: Provide new devm_clk helpers for prepared and enabled clocks
   abae8e57e49a clk: generalize devm_clk_get() a bit
we can fix the issue by applying them, thanks for Sasha's work again!

Gaosheng.

On 2023/2/1 21:35, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.19
> head:   923e939ad273761d537bc8b4e314e7fbac1d975d
> commit: e283c92e9ef8852a075bed84d3427a0704159f9c [1/66] memory: atmel-sdramc: Fix missing clk_disable_unprepare in atmel_ramc_probe()
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20230201/202302012152.IA9WllvH-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=e283c92e9ef8852a075bed84d3427a0704159f9c
>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>          git fetch --no-tags linux-stable-rc queue/4.19
>          git checkout e283c92e9ef8852a075bed84d3427a0704159f9c
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     drivers/memory/atmel-sdramc.c: In function 'atmel_ramc_probe':
>>> drivers/memory/atmel-sdramc.c:62:23: error: implicit declaration of function 'devm_clk_get_enabled' [-Werror=implicit-function-declaration]
>        62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
>           |                       ^~~~~~~~~~~~~~~~~~~~
>     drivers/memory/atmel-sdramc.c:62:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>        62 |                 clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
>           |                     ^
>     drivers/memory/atmel-sdramc.c:68:21: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>        68 |                 clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
>           |                     ^
>     cc1: some warnings being treated as errors
>
>
> vim +/devm_clk_get_enabled +62 drivers/memory/atmel-sdramc.c
>
>      53	
>      54	static int atmel_ramc_probe(struct platform_device *pdev)
>      55	{
>      56		const struct at91_ramc_caps *caps;
>      57		struct clk *clk;
>      58	
>      59		caps = of_device_get_match_data(&pdev->dev);
>      60	
>      61		if (caps->has_ddrck) {
>    > 62			clk = devm_clk_get_enabled(&pdev->dev, "ddrck");
>      63			if (IS_ERR(clk))
>      64				return PTR_ERR(clk);
>      65		}
>      66	
>      67		if (caps->has_mpddr_clk) {
>      68			clk = devm_clk_get_enabled(&pdev->dev, "mpddr");
>      69			if (IS_ERR(clk)) {
>      70				pr_err("AT91 RAMC: couldn't get mpddr clock\n");
>      71				return PTR_ERR(clk);
>      72			}
>      73		}
>      74	
>      75		return 0;
>      76	}
>      77	
>
