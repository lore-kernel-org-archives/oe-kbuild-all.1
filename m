Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E730EF91
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 04:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078651; cv=none; b=DSNsJvF1hOKgVMoijhEtgt8yJTkPEXNCV7dnCMW2Dv+y7Xj1ajdoCJeeQTOp0sy6Xowo0XjollwnkGBuemgugePp4YX05Psd2vHKCe7VAM8/FfLHIsFDlSp0e2TlUQEvQF5r5GqhS7xwWxqTWnnVchkEG153dIw06QrvimgYSDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078651; c=relaxed/simple;
	bh=YaJkK2dwdOKjlBhx2Pl+aA6dQ0R4Tzyh3vIpFp3s5NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sej5eOqsqqpSd4X+PyelU5E6j1J47KKyPLEtXMgtr3ViPTH7v8NcXUQRu1mtx+I4ahPSHU8j8LHvKd+njoIw4zir/N5wwlhXYAhxdgBq7asc91ui5VIRGwsPOYgj2NvSshXCB+4oxKTDoFLqwUAtHkYoPU9B+G5kB7Mo6RSzmcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmIXkuMi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmIXkuMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4151F000E9;
	Fri,  7 Aug 2026 04:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786078642;
	bh=+Zb3mu+SyNjKd0/L5lgRCN5L1PL28N4FiynIX9ZmS30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HmIXkuMikr/jppEREL6sbNjW1Kc1CoEdllUqlOmuXVkn9r4w+vfA7OG3dwncR1rUB
	 LM+r8NVz3Hbcj5oSHOWywmEBlXR9OeYOx2VE2uigqwjy0AUNo6EgbAY1I7LkfCKHIs
	 SJcApQnJytWvrT5+tqjQfEJej6eQgJ49R59rE6xCP7KtZEDTUsxEYiqdmffOHE1UW0
	 Ls4HcLOHZ0kLQsTruJq1bnO0EoGW8JxKeYm9JGa38U4/lwBRrD04goYk5x1mG+gNWT
	 TrN9V8cppfZ0V/eXp3vYJbRyXfxo2Hl0s9JmO3Rbf34+licHTKoOIeqs7T38F51dHM
	 Q9huIHNsVsbLA==
Message-ID: <b887cec6-52db-499e-aae4-024d338d7a19@kernel.org>
Date: Fri, 7 Aug 2026 06:57:18 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 11035/13093] drivers/soc/fsl/qe/gpio.c:176:
 undefined reference to `of_irq_parse_raw'
To: kernel test robot <lkp@intel.com>, Paul Louvel <paul.louvel@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202608060954.ymFeQSY6-lkp@intel.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <202608060954.ymFeQSY6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 06/08/2026 à 03:27, kernel test robot a écrit :
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1701fda2f58e345c050f4309971bdc07cd6146ba
> commit: e75fcf32f93ef32cd020a63ffc1808303655a43b [11035/13093] soc: fsl: qe: Add support of IRQs in QE GPIO
> config: sparc64-randconfig-002-20260806 (https://download.01.org/0day-ci/archive/20260806/202608060954.ymFeQSY6-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060954.ymFeQSY6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608060954.ymFeQSY6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     sparc64-linux-ld: drivers/soc/fsl/qe/gpio.o: in function `qe_gpio_to_irq':
>>> drivers/soc/fsl/qe/gpio.c:176: undefined reference to `of_irq_parse_raw'

The patch is missing a dependency on CONFIG_OF_IRQ.

config OF_IRQ
	def_bool y
	depends on !SPARC && IRQ_DOMAIN

But adding dependency on OF_IRQ leads to

error: recursive dependency detected!
	symbol GPIOLIB is selected by QE_GPIO
	symbol QE_GPIO depends on OF_IRQ
	symbol OF_IRQ depends on IRQ_DOMAIN
	symbol IRQ_DOMAIN is selected by GENERIC_IRQ_CHIP
	symbol GENERIC_IRQ_CHIP is selected by GPIO_MVEBU
	symbol GPIO_MVEBU depends on GPIOLIB

As QE_GPIO selects GENERIC_IRQ_CHIP, IRQ_DOMAIN is automatically 
selected so the dependency is only on !SPARC

I will fixup the commit.

Thanks
Christophe

