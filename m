Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765958F4E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7ED4382D6;
	Mon,  4 Dec 2023 15:34:58 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 15:34:58 +0800
Received: from [192.168.125.88] (183.27.97.199) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 15:34:57 +0800
Message-ID: <a87bd36e-a5b6-4fa9-bf9c-76a1c7851bcc@starfivetech.com>
Date: Mon, 4 Dec 2023 15:31:46 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, <devicetree@vger.kernel.org>,
	<linux-phy@lists.infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<minda.chen@starfivetech.com>, <changhuang.liang@starfivetech.com>,
	<rogerq@kernel.org>, <geert+renesas@glider.be>,
	<keith.zhao@starfivetech.com>, <linux-kernel@vger.kernel.org>
References: <20231117130421.79261-3-shengyang.chen@starfivetech.com>
 <202312010157.hZtZNEHE-lkp@intel.com>
From: Shengyang Chen <shengyang.chen@starfivetech.com>
In-Reply-To: <202312010157.hZtZNEHE-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag

Hi kernel test robot,

On 2023/12/1 1:30, kernel test robot wrote:
> Hi Shengyang,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on linus/master v6.7-rc3 next-20231130]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Shengyang-Chen/dt-bindings-phy-Add-starfive-jh7110-dphy-tx/20231117-210751
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20231117130421.79261-3-shengyang.chen%40starfivetech.com
> patch subject: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
> config: mips-randconfig-r112-20231121 (https://download.01.org/0day-ci/archive/20231201/202312010157.hZtZNEHE-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010157.hZtZNEHE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312010157.hZtZNEHE-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:226:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse:     got void [noderef] __iomem *topsys
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse:     expected void *io_addr
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse:     got void [noderef] __iomem *topsys
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *io_addr @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:21: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:21: sparse:     got void *io_addr
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     expected void const volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:29: sparse:     got void *
>>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void * @@
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     expected void volatile [noderef] __iomem *mem
>    drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:30: sparse:     got void *
> 
> vim +172 drivers/phy/starfive/phy-jh7110-dphy-tx.c
> 
>    167	
>    168	static inline u32 stf_dphy_get_reg(void *io_addr, u32 addr, u32 shift, u32 mask)
>    169	{
>    170		u32 tmp;
>    171	
>  > 172		tmp = readl(io_addr);
>    173		tmp = (tmp & mask) >> shift;
>    174		return tmp;
>    175	}
>    176	
>    177	static inline void stf_dphy_set_reg(void *io_addr, u32 addr, u32 data, u32 shift, u32 mask)
>    178	{
>    179		u32 tmp;
>    180	
>  > 181		tmp = readl(io_addr + addr);
>    182		tmp &= ~mask;
>    183		tmp |= (data << shift) & mask;
>  > 184		writel(tmp, (io_addr + addr));
>    185	}
>    186	
> 

The warning will be followed up.


thanks.

Best Regards,
Shengyang
