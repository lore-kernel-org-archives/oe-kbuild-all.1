Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CC9807
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 08:24:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8AxlF29UiFkLEMSAA--.27716S3;
	Mon, 27 Mar 2023 16:24:29 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxtry2UiFkvAYOAA--.7064S3;
	Mon, 27 Mar 2023 16:24:24 +0800 (CST)
Subject: Re: [PATCH v3 2/2] spi: loongson: add bus driver for the loongson spi
 controller
To: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 wanghongliang@loongson.cn, Liu Peibao <liupeibao@loongson.cn>,
 loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230324063317.14664-3-zhuyinbo@loongson.cn>
 <202303241811.OXj9KxAr-lkp@intel.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <5f336b5f-3c6f-f215-d974-0460598f06ae@loongson.cn>
Date: Mon, 27 Mar 2023 16:24:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202303241811.OXj9KxAr-lkp@intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxtry2UiFkvAYOAA--.7064S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZw1xWFykCw17CF4xZFWrZrb_yoWrKFyUpa
	y8CF45Crs5Xr4kCFs7GayUZF1YqrZ5J3srJFW7tr48C3yDA34jqF1jkry7XrZxCF1q9a48
	Xr48uayvga4rCa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxUFAwIDUUUU



ÔÚ 2023/3/24 ÏÂÎç6:15, kernel test robot Ð´µÀ:
> Hi Yinbo,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on broonie-spi/for-next]
> [also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.3-rc3 next-20230324]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230324-143432
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> patch link:    https://lore.kernel.org/r/20230324063317.14664-3-zhuyinbo%40loongson.cn
> patch subject: [PATCH v3 2/2] spi: loongson: add bus driver for the loongson spi controller
> config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230324/202303241811.OXj9KxAr-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/3742622c455d25c4a110d2caf2f5b2ceefe88f91
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230324-143432
>          git checkout 3742622c455d25c4a110d2caf2f5b2ceefe88f91
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303241811.OXj9KxAr-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>     drivers/spi/spi-loongson-core.c: In function 'loongson_spi_init_master':
>>> drivers/spi/spi-loongson-core.c:229:21: error: implicit declaration of function 'devm_ioremap'; did you mean 'of_ioremap'? [-Werror=implicit-function-declaration]
>       229 |         spi->base = devm_ioremap(dev, res->start, resource_size(res));
>           |                     ^~~~~~~~~~~~
>           |                     of_ioremap
>>> drivers/spi/spi-loongson-core.c:229:19: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       229 |         spi->base = devm_ioremap(dev, res->start, resource_size(res));
>           |                   ^
>     cc1: some warnings being treated as errorThe devm_ioremap was declared in linux/io.h, and I think add include 
<linux/io.h> in spi-loongson-core.c that compile issue will be fixed.
> 
> 
> vim +229 drivers/spi/spi-loongson-core.c
> 
>     201	
>     202	int loongson_spi_init_master(struct device *dev, struct resource *res)
>     203	{
>     204		struct spi_master *master;
>     205		struct loongson_spi *spi;
>     206		struct clk *clk;
>     207		int ret;
>     208	
>     209		master = spi_alloc_master(dev, sizeof(struct loongson_spi));
>     210		if (master == NULL) {
>     211			dev_dbg(dev, "master allocation failed\n");
>     212			return -ENOMEM;
>     213		}
>     214	
>     215		master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
>     216		master->setup = loongson_spi_setup;
>     217		master->prepare_message = loongson_spi_prepare_message;
>     218		master->transfer_one = loongson_spi_transfer_one;
>     219		master->unprepare_message = loongson_spi_unprepare_message;
>     220		master->set_cs = loongson_spi_set_cs;
>     221		master->num_chipselect = 4;
>     222		master->dev.of_node = of_node_get(dev->of_node);
>     223		dev_set_drvdata(dev, master);
>     224	
>     225		spi = spi_master_get_devdata(master);
>     226	
>     227		spi->master = master;
>     228	
>   > 229		spi->base = devm_ioremap(dev, res->start, resource_size(res));
>     230		if (spi->base == NULL) {
>     231			dev_err(dev, "cannot map io\n");
>     232			ret = -ENXIO;
>     233			goto free_master;
>     234		}
>     235	
>     236		clk = devm_clk_get(dev, NULL);
>     237		if (!IS_ERR(clk))
>     238			spi->clk_rate = clk_get_rate(clk);
>     239	
>     240		loongson_spi_reginit(spi);
>     241	
>     242		spi->mode = 0;
>     243		if (of_get_property(dev->of_node, "spi-nocs", NULL))
>     244			spi->mode |= SPI_NO_CS;
>     245	
>     246		ret = spi_register_master(master);
>     247		if (ret < 0)
>     248			goto free_master;
>     249	
>     250		return ret;
>     251	
>     252	free_master:
>     253		kfree(master);
>     254		spi_master_put(master);
>     255	
>     256		return ret;
>     257	}
>     258	EXPORT_SYMBOL_GPL(loongson_spi_init_master);
>     259	
> 

