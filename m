Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DDC3C22
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 09:04:13 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8AxmOkEu1hk_IIGAA--.10702S3;
	Mon, 08 May 2023 17:04:05 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax2L34ulhkd9lQAA--.14998S3;
	Mon, 08 May 2023 17:03:59 +0800 (CST)
Subject: Re:
 [broonie-ci:v9_20230426_zhuyinbo_spi_loongson_add_bus_driver_for_the_loongson_spi
 1/2] drivers/spi/spi-loongson-core.c:222:31: error: implicit declaration of
 function 'of_node_get'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 zhuyinbo@loongson.cn
References: <202305081401.ePsG2Yim-lkp@intel.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <adffecd8-7567-a2d2-d2b8-c56e54e0b0c6@loongson.cn>
Date: Mon, 8 May 2023 17:03:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202305081401.ePsG2Yim-lkp@intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax2L34ulhkd9lQAA--.14998S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAw48ZF15Kr4rWFyxZr18Xwb_yoWrZrW7pa
	y5CFW3Crs7Xr4kCws7G3y8CF1jqr95J3srJa17Jw4j9rWqq34jq3WUur13uwsIkF1Dua4Y
	qry09a1vg3WrCFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b4AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM2
	8EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAq
	jxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz4
	8v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU189N3UUUUU==



ÔÚ 2023/5/8 ÏÂÎç2:47, kernel test robot Ð´µÀ:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v9_20230426_zhuyinbo_spi_loongson_add_bus_driver_for_the_loongson_spi
> head:   45991d67ae06843705fece64fc304aee0e8e360b
> commit: 31d0b163bc42e0d717788c1718e42c7d83763307 [1/2] spi: loongson: add bus driver for the loongson spi controller
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230508/202305081401.ePsG2Yim-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=31d0b163bc42e0d717788c1718e42c7d83763307
>          git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
>          git fetch --no-tags broonie-ci v9_20230426_zhuyinbo_spi_loongson_add_bus_driver_for_the_loongson_spi
>          git checkout 31d0b163bc42e0d717788c1718e42c7d83763307
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/spi/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305081401.ePsG2Yim-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/spi/spi-loongson-core.c: In function 'loongson_spi_init_master':
>>> drivers/spi/spi-loongson-core.c:222:31: error: implicit declaration of function 'of_node_get' [-Werror=implicit-function-declaration]
>       222 |         master->dev.of_node = of_node_get(dev->of_node);
>           |                               ^~~~~~~~~~~
>     drivers/spi/spi-loongson-core.c:222:29: warning: assignment to 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       222 |         master->dev.of_node = of_node_get(dev->of_node);
>           |                             ^
>>> drivers/spi/spi-loongson-core.c:242:13: error: implicit declaration of function 'of_get_property' [-Werror=implicit-function-declaration]
>       242 |         if (of_get_property(dev->of_node, "spi-nocs", NULL))
>           |             ^~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors


These errors was due to the function of_node_get and of_get_property
loss a declaration and I will add "#include <linux/of.h>" in
spi-loongson-core.c to fix it.

Thanks.
> 
> 
> vim +/of_node_get +222 drivers/spi/spi-loongson-core.c
> 
>     202	
>     203	int loongson_spi_init_master(struct device *dev, struct resource *res)
>     204	{
>     205		struct spi_master *master;
>     206		struct loongson_spi *spi;
>     207		struct clk *clk;
>     208	
>     209		master = devm_spi_alloc_master(dev, sizeof(struct loongson_spi));
>     210		if (master == NULL) {
>     211			dev_info(dev, "master allocation failed\n");
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
>   > 222		master->dev.of_node = of_node_get(dev->of_node);
>     223		dev_set_drvdata(dev, master);
>     224	
>     225		spi = spi_master_get_devdata(master);
>     226	
>     227		spi->master = master;
>     228	
>     229		spi->base = devm_ioremap(dev, res->start, resource_size(res));
>     230		if (spi->base == NULL) {
>     231			dev_err(dev, "cannot map io\n");
>     232			return -ENXIO;
>     233		}
>     234	
>     235		clk = devm_clk_get(dev, NULL);
>     236		if (!IS_ERR(clk))
>     237			spi->clk_rate = clk_get_rate(clk);
>     238	
>     239		loongson_spi_reginit(spi);
>     240	
>     241		spi->mode = 0;
>   > 242		if (of_get_property(dev->of_node, "spi-nocs", NULL))
>     243			spi->mode |= SPI_NO_CS;
>     244	
>     245		return devm_spi_register_master(dev, master);
>     246	}
>     247	EXPORT_SYMBOL_GPL(loongson_spi_init_master);
>     248	
> 

