Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FD763B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 02:52:11 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8DxE0xTJxVkCakNAA--.20075S3;
	Sat, 18 Mar 2023 10:52:03 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxsOROJxVkn4kEAA--.20675S3;
	Sat, 18 Mar 2023 10:51:58 +0800 (CST)
Subject: Re: [PATCH v2 2/2] spi: loongson: add bus driver for the loongson spi
 controller
To: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 wanghongliang@loongson.cn, Liu Peibao <liupeibao@loongson.cn>,
 loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230317082950.12738-3-zhuyinbo@loongson.cn>
 <202303180159.1qAKqnp9-lkp@intel.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <804d327e-57e0-4183-79c6-f9650ac59a8f@loongson.cn>
Date: Sat, 18 Mar 2023 10:51:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202303180159.1qAKqnp9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8CxsOROJxVkn4kEAA--.20675S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZw1xGr18AF17Xw18Ar4xZwb_yoW5GFy8p3
	y8CFsxKryFqr18GaykGayDWF4jqrs8XwnrXFyDZF4UuFZxZFyjqrs29r1YgrnI9F4vgFy8
	ZrWfXF9Y9a4UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bx8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAq
	jxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz4
	8v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jj2NtUUUUU=


在 2023/3/18 上午2:07, kernel test robot 写道:
> Hi Yinbo,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on broonie-spi/for-next]
> [also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.3-rc2 next-20230317]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230317-163907
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> patch link:    https://lore.kernel.org/r/20230317082950.12738-3-zhuyinbo%40loongson.cn
> patch subject: [PATCH v2 2/2] spi: loongson: add bus driver for the loongson spi controller
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230318/202303180159.1qAKqnp9-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/a532955fcee3d37eb4332cea2b868f74ace0bc72
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230317-163907
>          git checkout a532955fcee3d37eb4332cea2b868f74ace0bc72
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303180159.1qAKqnp9-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "__udivdi3" [drivers/spi/spi-loongson.ko] undefined!

This "__udivdi3" undefined!" ERROR that due to u64 / u32 and not use do_div, I think add following change
that can fix this ERROR.

-               div = DIV_ROUND_UP(loongson_spi->clk_rate, hz);

+               div = DIV_ROUND_UP_ULL(loongson_spi->clk_rate, hz);

