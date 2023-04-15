Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC55C7EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 01:25:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8Ax69kc_TlkzbUcAA--.44354S3;
	Sat, 15 Apr 2023 09:25:48 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxAeUW_TlkQfklAA--.14224S3;
	Sat, 15 Apr 2023 09:25:46 +0800 (CST)
Subject: Re: [PATCH v7 1/2] dt-bindings: spi: add loongson spi
To: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jianmin Lv <lvjianmin@loongson.cn>,
 wanghongliang@loongson.cn, zhuyinbo@loongson.cn,
 Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn
References: <20230412045152.4694-2-zhuyinbo@loongson.cn>
 <202304141851.mUss7Eyn-lkp@intel.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <d6d21a3e-0d97-222a-f195-f1804067c37f@loongson.cn>
Date: Sat, 15 Apr 2023 09:25:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202304141851.mUss7Eyn-lkp@intel.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxAeUW_TlkQfklAA--.14224S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Cw1kuryfZw48GF1kKw1xXwb_yoW8Cryrpa
	1ru3Z8Gr15Xr18Ka98K3Zrua1jgrZ8Xr13WayUuryUZa9Fva4kXrs2krW3ZrnFgF1qgFyx
	JFZ3urZYg3WkJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b38Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc80
	4VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67
	AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48I
	cVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x8Erc
	xFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU
	zD73DUUUU



ÔÚ 2023/4/14 ÏÂÎç6:57, kernel test robot Ð´µÀ:
> Hi Yinbo,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-spi/for-next]
> [also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.3-rc6 next-20230413]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230412-125222
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> patch link:    https://lore.kernel.org/r/20230412045152.4694-2-zhuyinbo%40loongson.cn
> patch subject: [PATCH v7 1/2] dt-bindings: spi: add loongson spi
> reproduce:
>          # https://github.com/intel-lab-lkp/linux/commit/e230989729f1d1e10c49d1903a5c76a5b8b81f95
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230412-125222
>          git checkout e230989729f1d1e10c49d1903a5c76a5b8b81f95
>          make menuconfig
>          # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>          make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304141851.mUss7Eyn-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/loongson,ls-spi.yaml
I will rename this path to fixup this warning.
> 

