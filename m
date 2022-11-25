Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1978B5C9B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Nov 2022 15:36:30 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id yadIoSwVOgYw1yadIo7Sti; Fri, 25 Nov 2022 16:28:53 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 25 Nov 2022 16:28:53 +0100
X-ME-IP: 86.243.100.34
Message-ID: <7dd4ad9e-02c9-5581-d618-7021f22fa949@wanadoo.fr>
Date: Fri, 25 Nov 2022 16:28:52 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Fwd: [linux-stable-rc:linux-4.19.y 4030/4465]
 drivers/staging/mt7621-spi/spi-mt7621.c:446:24: error: implicit declaration
 of function 'dev_err_probe'; did you mean 'device_reprobe'?
Content-Language: fr, en-GB
To: oe-kbuild-all@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>
References: <202211250439.MK1ZjnUo-lkp@intel.com>
 <3442a79a-854f-bc0b-8fda-ba866036b2ed@gmail.com>
From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <3442a79a-854f-bc0b-8fda-ba866036b2ed@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 25/11/2022 à 15:32, Matthias Brugger a écrit :
> FYI
>
Well, ok, dev_err_probe() doesn't exist in 4.19.
Looks related to 2b2bf6b7faa9.

What to do then?

I guess that s.o. should just drop the patch, or fix it.


This just about an error message that could be misleading.

This is only in staging, so why backporting such a tiny "fix" up to 4.19?


I don't know if something is expected from me, but if it is the case, my 
own opinion is that it should be dropped, it doesn't worth spending some 
time on it.


CJ


> Matthias
>
> -------- Forwarded Message --------
> Subject: [linux-stable-rc:linux-4.19.y 4030/4465] 
> drivers/staging/mt7621-spi/spi-mt7621.c:446:24: error: implicit 
> declaration of function 'dev_err_probe'; did you mean 'device_reprobe'?
> Date: Fri, 25 Nov 2022 04:44:14 +0800
> From: kernel test robot <lkp@intel.com>
> To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> CC: oe-kbuild-all@lists.linux.dev, Greg Kroah-Hartman 
> <gregkh@linuxfoundation.org>, Matthias Brugger 
> <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Sasha Levin 
> <sashal@kernel.org>
>
> tree: 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git 
> linux-4.19.y
> head:   f65c47c3f3362b712468c9b15657d9311e998240
> commit: 269f650a0b26067092873308117e0bf0c6ec8289 [4030/4465] spi: 
> mt7621: Fix an error message in mt7621_spi_probe()
> config: mips-randconfig-c034-20221124
> compiler: mipsel-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget 
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=269f650a0b26067092873308117e0bf0c6ec8289
>         git remote add linux-stable-rc 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-4.19.y
>         git checkout 269f650a0b26067092873308117e0bf0c6ec8289
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 
> make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash 
> drivers/staging/mt7621-spi/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/staging/mt7621-spi/spi-mt7621.c: In function 
> 'mt7621_spi_probe':
>>> drivers/staging/mt7621-spi/spi-mt7621.c:446:24: error: implicit 
>>> declaration of function 'dev_err_probe'; did you mean 
>>> 'device_reprobe'? [-Werror=implicit-function-declaration]
>      446 |                 return dev_err_probe(&pdev->dev, PTR_ERR(clk),
>          |                        ^~~~~~~~~~~~~
>          |                        device_reprobe
>    cc1: some warnings being treated as errors
>
>
> vim +446 drivers/staging/mt7621-spi/spi-mt7621.c
>
>    421
>    422    static int mt7621_spi_probe(struct platform_device *pdev)
>    423    {
>    424        const struct of_device_id *match;
>    425        struct spi_master *master;
>    426        struct mt7621_spi *rs;
>    427        void __iomem *base;
>    428        struct resource *r;
>    429        int status = 0;
>    430        struct clk *clk;
>    431        struct mt7621_spi_ops *ops;
>    432        int ret;
>    433
>    434        match = of_match_device(mt7621_spi_match, &pdev->dev);
>    435        if (!match)
>    436            return -EINVAL;
>    437        ops = (struct mt7621_spi_ops *)match->data;
>    438
>    439        r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>    440        base = devm_ioremap_resource(&pdev->dev, r);
>    441        if (IS_ERR(base))
>    442            return PTR_ERR(base);
>    443
>    444        clk = devm_clk_get(&pdev->dev, NULL);
>    445        if (IS_ERR(clk))
>  > 446            return dev_err_probe(&pdev->dev, PTR_ERR(clk),
>    447                         "unable to get SYS clock\n");
>    448
>    449        status = clk_prepare_enable(clk);
>    450        if (status)
>    451            return status;
>    452
>    453        master = devm_spi_alloc_master(&pdev->dev, sizeof(*rs));
>    454        if (master == NULL) {
>    455            dev_info(&pdev->dev, "master allocation failed\n");
>    456            clk_disable_unprepare(clk);
>    457            return -ENOMEM;
>    458        }
>    459
>    460        master->mode_bits = RT2880_SPI_MODE_BITS;
>    461
>    462        master->setup = mt7621_spi_setup;
>    463        master->transfer_one_message = 
> mt7621_spi_transfer_one_message;
>    464        master->bits_per_word_mask = SPI_BPW_MASK(8);
>    465        master->dev.of_node = pdev->dev.of_node;
>    466        master->num_chipselect = 2;
>    467
>    468        dev_set_drvdata(&pdev->dev, master);
>    469
>    470        rs = spi_master_get_devdata(master);
>    471        rs->base = base;
>    472        rs->clk = clk;
>    473        rs->master = master;
>    474        rs->sys_freq = clk_get_rate(rs->clk);
>    475        rs->ops = ops;
>    476        rs->pending_write = 0;
>    477        dev_info(&pdev->dev, "sys_freq: %u\n", rs->sys_freq);
>    478
>    479        ret = device_reset(&pdev->dev);
>    480        if (ret) {
>    481            dev_err(&pdev->dev, "SPI reset failed!\n");
>    482            clk_disable_unprepare(clk);
>    483            return ret;
>    484        }
>    485
>    486        mt7621_spi_reset(rs, 0);
>    487
>    488        ret = spi_register_master(master);
>    489        if (ret)
>    490            clk_disable_unprepare(clk);
>    491
>    492        return ret;
>    493    }
>    494
>
