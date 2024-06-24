Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1FE4F5FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719236748; cv=none; b=anC5yLiXDNcrBzhdbdh7/4wiNge/fQ5w0TuUS2Hp6jbJVnIkpk5/QlH5e3PJV0A02H4pW/PAmo0cA0/ZBerYHAo2u4Y1NUs/9bi2QlsA/Z86VNNaXjGYt2nsWf/FeIF6RB/dsKQsnjaAr06PUMCu0WzbrbiXGRiID3LPZ6SqizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719236748; c=relaxed/simple;
	bh=RqeuvMz0cRSx1ZUaiURn+zvKLMXsN6xdTYTDIkNr6Io=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ys1pSQP+V8eaoqMuHFlYnnNWocMs5MQVzKEJPRepe4iDF7u1soODXZs/G60R1dM4M5Yf9biSpODcBZpyhBzVobp39d4+Nf++VfISs/A+rwnivpox54tGspt16PvU3rCeYLeWBQn947I26C6lVJ9ZYxyaJIcAd0Ck+OuKcW6kbOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zWLO/s9K; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FGBtjy/T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zWLO/s9K";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FGBtjy/T"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719236744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GboIg5eVGHDPZ9dHMp+OprFYxnXj5dxDMNcULCsadHc=;
	b=zWLO/s9KLalwIYKdFRK1CChvsksfGjPSSuY4q1nfKLracltPA+LwJL/PFALBxbXHW2WJPs
	GSa+StBJBeUCkGxoKegr11yqWP7Y73QF7er/UpehEri8F4XejtMPwRiMuPTYNOnsZSNYgF
	KxhY2sz7kPyF8r4RzeROD7kOO+OVDwNdtt8PLMuGs8sM10M78U6BVAFS6nhoRso9FvyO+r
	bjxSNvyFaloyz5InhM3icfPZ7+EdTebH+7Vtq4XYYV5oecfoaiuOgFk21EH4vWSAKBWns8
	AG/66DYKssND59/YVEWNeK5Tau8YuQuRm+DudV3kZ5teqza70DQ1M+Fli42elg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719236744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GboIg5eVGHDPZ9dHMp+OprFYxnXj5dxDMNcULCsadHc=;
	b=FGBtjy/TwRE/uHMqDgyipx7UFEpUjQmXrf4kBf8fE1Q4esR2Mk0vube5ZaI+ILex74ZHfn
	2lSN8V2FSINMmxAg==
To: kernel test robot <lkp@intel.com>, Tianyang Zhang
 <zhangtianyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Jianmin Lv <lvjianmin@loongson.cn>, Liupu Wang
 <wangliupu@loongson.cn>
Subject: Re: [tip:irq/core 39/46]
 drivers/irqchip/irq-loongarch-avec.c:82:17: error: implicit declaration of
 function 'loongson_send_ipi_single'
In-Reply-To: <202406240451.ygBFNyJ3-lkp@intel.com>
References: <202406240451.ygBFNyJ3-lkp@intel.com>
Date: Mon, 24 Jun 2024 15:45:44 +0200
Message-ID: <87sex28nef.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 24 2024 at 05:06, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
> head:   c9d269469d2b9a06559cdc84d12dd3fb4d552581
> commit: 760d7e719499d64beea62bfcf53938fb233bb6e7 [39/46] Loongarch: Support loongarch avec
> config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240624/202406240451.ygBFNyJ3-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406240451.ygBFNyJ3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406240451.ygBFNyJ3-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/irqchip/irq-loongarch-avec.c: In function 'loongarch_avec_sync':
>>> drivers/irqchip/irq-loongarch-avec.c:82:17: error: implicit declaration of function 'loongson_send_ipi_single' [-Werror=implicit-function-declaration]
>       82 |                 loongson_send_ipi_single(adata->prev_cpu, SMP_CLEAR_VECT);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/irqchip/irq-loongarch-avec.c:82:59: error: 'SMP_CLEAR_VECT' undeclared (first use in this function)
>       82 |                 loongson_send_ipi_single(adata->prev_cpu, SMP_CLEAR_VECT);
>          |                                                           ^~~~~~~~~~~~~~
>    drivers/irqchip/irq-loongarch-avec.c:82:59: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/irqchip/irq-loongarch-avec.c: In function 'complete_irq_moving':
>    drivers/irqchip/irq-loongarch-avec.c:173:55: error: 'SMP_CLEAR_VECT' undeclared (first use in this function)
>      173 |                         loongson_send_ipi_single(cpu, SMP_CLEAR_VECT);
>          |                                                       ^~~~~~~~~~~~~~

So this code was never built with CONFIG_SMP=n.

Can the loongson folks please send me a delta patch ASAP, otherwise I'm
going to revert it.

Thanks,

        tglx
