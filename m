Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321F47E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 03:48:09 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4P6l4f1VSSzJqsb;
	Thu,  2 Feb 2023 11:43:30 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 2 Feb 2023 11:48:00 +0800
Subject: Re: [linux-stable-rc:queue/4.19 2/66]
 drivers/memory/mvebu-devbus.c:297:15: error: implicit declaration of function
 'devm_clk_get_enabled'
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
References: <202302020048.ZsmUJDHo-lkp@intel.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <e2f768f7-6e4a-f7ba-d420-dd3242b3c984@huawei.com>
Date: Thu, 2 Feb 2023 11:47:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202302020048.ZsmUJDHo-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

Thanks for reporting the issue, this patch depends on the following patches:
   7ef9651e9792 clk: Provide new devm_clk helpers for prepared and enabled clocks
   abae8e57e49a clk: generalize devm_clk_get() a bit
we can fix the issue by applying them, thanks for Sasha's work!

Gaosheng.

On 2023/2/2 0:09, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.19
> head:   923e939ad273761d537bc8b4e314e7fbac1d975d
> commit: b02522d25ad5cbfe50424dd99a85f5486f407fa6 [2/66] memory: mvebu-devbus: Fix missing clk_disable_unprepare in mvebu_devbus_probe()
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20230202/202302020048.ZsmUJDHo-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=b02522d25ad5cbfe50424dd99a85f5486f407fa6
>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>          git fetch --no-tags linux-stable-rc queue/4.19
>          git checkout b02522d25ad5cbfe50424dd99a85f5486f407fa6
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
>     drivers/memory/mvebu-devbus.c: In function 'mvebu_devbus_probe':
>>> drivers/memory/mvebu-devbus.c:297:15: error: implicit declaration of function 'devm_clk_get_enabled' [-Werror=implicit-function-declaration]
>       297 |         clk = devm_clk_get_enabled(&pdev->dev, NULL);
>           |               ^~~~~~~~~~~~~~~~~~~~
>     drivers/memory/mvebu-devbus.c:297:13: warning: assignment to 'struct clk *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       297 |         clk = devm_clk_get_enabled(&pdev->dev, NULL);
>           |             ^
>     cc1: some warnings being treated as errors
>
>
> vim +/devm_clk_get_enabled +297 drivers/memory/mvebu-devbus.c
>
>     274	
>     275	static int mvebu_devbus_probe(struct platform_device *pdev)
>     276	{
>     277		struct device *dev = &pdev->dev;
>     278		struct device_node *node = pdev->dev.of_node;
>     279		struct devbus_read_params r;
>     280		struct devbus_write_params w;
>     281		struct devbus *devbus;
>     282		struct resource *res;
>     283		struct clk *clk;
>     284		unsigned long rate;
>     285		int err;
>     286	
>     287		devbus = devm_kzalloc(&pdev->dev, sizeof(struct devbus), GFP_KERNEL);
>     288		if (!devbus)
>     289			return -ENOMEM;
>     290	
>     291		devbus->dev = dev;
>     292		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>     293		devbus->base = devm_ioremap_resource(&pdev->dev, res);
>     294		if (IS_ERR(devbus->base))
>     295			return PTR_ERR(devbus->base);
>     296	
>   > 297		clk = devm_clk_get_enabled(&pdev->dev, NULL);
>     298		if (IS_ERR(clk))
>     299			return PTR_ERR(clk);
>     300	
>     301		/*
>     302		 * Obtain clock period in picoseconds,
>     303		 * we need this in order to convert timing
>     304		 * parameters from cycles to picoseconds.
>     305		 */
>     306		rate = clk_get_rate(clk) / 1000;
>     307		devbus->tick_ps = 1000000000 / rate;
>     308	
>     309		dev_dbg(devbus->dev, "Setting timing parameter, tick is %lu ps\n",
>     310			devbus->tick_ps);
>     311	
>     312		if (!of_property_read_bool(node, "devbus,keep-config")) {
>     313			/* Read the Device Tree node */
>     314			err = devbus_get_timing_params(devbus, node, &r, &w);
>     315			if (err < 0)
>     316				return err;
>     317	
>     318			/* Set the new timing parameters */
>     319			if (of_device_is_compatible(node, "marvell,orion-devbus"))
>     320				devbus_orion_set_timing_params(devbus, node, &r, &w);
>     321			else
>     322				devbus_armada_set_timing_params(devbus, node, &r, &w);
>     323		}
>     324	
>     325		/*
>     326		 * We need to create a child device explicitly from here to
>     327		 * guarantee that the child will be probed after the timing
>     328		 * parameters for the bus are written.
>     329		 */
>     330		err = of_platform_populate(node, NULL, NULL, dev);
>     331		if (err < 0)
>     332			return err;
>     333	
>     334		return 0;
>     335	}
>     336	
>
