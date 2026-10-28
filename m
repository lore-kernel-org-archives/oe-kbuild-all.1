Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793159684;
	b=M7mCc6rAx8O1d2j8bM6i8OV5+islgYXATyDQ7Xo0hZ6OoBQY0h89iKXuJdB7Ayw1j1oA
	 LD35+BCLKdXm8HfrQx7YS8v7UUOfij61RAY5ipipVtSSrBKdZAl68NKZg8Soux2oxc6dj
	 WciFhBgygBZmO98+Cox8lDUa5ryoZamG05NLtPrinYVp2DjXkGCuRUEsMZmr4PnxrVK/d
	 GanK7yEj5x9j+X56m3dgEBkBtegy1829TkLZ/WxvIEUu/6lyiQvRRH96v/ONb+th0e38B
	 JUUKVNKWL2kNWYL/jw7S7CdhkScy69AkfFAX1fzXUGwQfwF/VuwxzprPBQNiYKb6Y8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159684;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:To:Cc:References:From:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZcjibqjjjL4B8urMPCai9DU9KGZVULQYy3DlUK2r/Qk=;
	b=qpjFcE2wOuAPxghR4LczyIH16957UVL4FkkkIzFyZqFNmG8jNlFPwzziLZyEqVzwcnmU
	 YEptpxHQLi6eA/f1Uk5eS53xdGkddcwG+ilR9iHDCfxasS9A5OJcaSTd0pBWsE29Rzyth
	 f6EKZH93d8yH2Eo5azmargYtDE7+3FlsXo9XmIZHH8jGUJAmEsGLNvxuCS6hJWIzmfmQo
	 ynE6Up8slHIMsIumGHF1Vz4lji+M5CUHKhj6LYgD0yGOE5gKIAh31khPzOgXCFjIbQXJe
	 Zv3aU849zr3BgmJzuPhjCkLo2W1G/Cx3Q5aWu+wvdIUea54hIwkv/kPp3TRSVNtS5ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RjGDVltN;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=AHRMsllZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 03:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8876B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RjGDVltN;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=AHRMsllZ
ARC-Seal: i=1; a=rsa-sha256; t=1793159627; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=c4mN3i2uNU+04aJPbvyBaU6I7N5YzApmRxylPPLOuWoQ0U8eDuryKuomZWdDF6Go5r
    T6vNYq6HXyRTJX5A1TFemyAayF3auVKwvkhrZMPozriOS2HNBReNWR1U02gsNpmRn/cD
    3WFmXX4/HsBcyMumg3vawo9JiGAPUDZD80Q2TG3EiQk42omXsO+7ogn4XVyPwn+DRL2p
    vVbqnwGUpeP5jV2g4m/i230OSUCOBQnPOa1adnxM9mL62iiDc6LY4gKJK5PY+aBdMoD0
    zG5tK2E2DjOfKtjeLHWaR21k+Ywcqyuuqpier3RD3pS2pVLmdCWaHUr3Cu/tlONLwXJg
    4GtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793159627;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZcjibqjjjL4B8urMPCai9DU9KGZVULQYy3DlUK2r/Qk=;
    b=EzGIGlKM+TQbpvf/KQ95eZA1pmouxZCRTCosdbgWdjbh0szWZNelxh/pxrvBSK+4jD
    6lZtx2cnyu7dmU9pBnCitLyPN/Jm2fv9EknpwPeWthfPuHTMAnwWdHsuEzeP1+86hwsW
    Pq4F+P9mHkfuCZYkNLmoWm3ZgW+1ILTT9UT4PliiJfQyO5fZRodDEoPx1MAjr29Rv+nz
    bEjGBcILkPbrCM6J/LS0gMkDkRvCuKOknPERKVpm0Rb3inDbp06+hyc7LJHMLF6MVZHs
    7fh2BdxCm8yEW/eXJx6GhgBR6CTPB4RhFEKJg9V1M/ejZKGHlxBZViVOser8ysgCUN7D
    d/Zw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793159627;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZcjibqjjjL4B8urMPCai9DU9KGZVULQYy3DlUK2r/Qk=;
    b=RjGDVltNBVIsR64C2thO1D6B6Ng2r4KuHEm7rh9IB8+3LPeYRQmIdhhSsDfq+TIt5U
    62eiAMFQb8ju6Txscs3bGl1wqx/NqXZ0529j6MQOhFwXAV1WDp8Trp1E5Ma1fqqGWf5f
    ECzEhqvkj0wke7sutUyIJmhXusXPg1M5d+JtjL9xfXpl0bmErt8UA/aUim3MGh8xH70A
    6K92/sevpYP6TwnvNJC0qZ0KTqfcX1Ic9YAq2cFGEumNBDOkYBfW87zeBzV8Vch+qOtI
    XA6ZyadozneZ2vDc2CzRtnSknFm9EJf9jLPpWZKe4MMcQJQMGQSQZh5U1qGvGxI0QDKw
    wCXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793159627;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ZcjibqjjjL4B8urMPCai9DU9KGZVULQYy3DlUK2r/Qk=;
    b=AHRMsllZWqLmmHntNaHylTMmq+VVWfBAyCjpVCu6g5gAkwbEeYFtXtOQffBNzTm8Ff
    eg7eaLWzfs1GvRZVEqCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+t6nc="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d929S3rjnsu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 28 Oct 2026 04:53:45 +0100 (CET)
Subject: [PATCH] powerpc/pasemi: Defer Nemo IRQ initialization
To: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, Christian Zigotzky A-EON Open Source
 <info@xenosoft.de>, Darren Stevens <darren@stevens-zone.net>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>, oe-kbuild-all@lists.linux.dev,
 Philip Li <philip.li@intel.com>
References: <20261024075519.18877-1-chzigotzky@xenosoft.de>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <7cf987e2-0ac7-f523-21a9-b340f10dc592@xenosoft.de>
Date: Wed, 28 Oct 2026 04:53:45 +0100
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261024075519.18877-1-chzigotzky@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I have created a new patch. I hope it is OK. It works without any problems.

Thanks,
Christian

On 24/10/26 09:55, chzigotzky@xenosoft.de wrote:
> From: Christian Zigotzky A-EON Open Source <info@xenosoft.de>
>
> Since pas_pci_init() is now called later during boot, the i8259
> initialization in pas_init_IRQ() happens too early and accesses
> registers that are not yet mapped, preventing the board from booting.
>
> Move the Nemo-specific i8259 initialization to pas_add_bridge(),
> after the ISA bridge has been discovered.
>
> Suggested-by: Darren Stevens <darren@stevens-zone.net>
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by: Christian Zigotzky A-EON Open Source <info@xenosoft.de>
> ---
>   arch/powerpc/platforms/pasemi/pasemi.h |  6 ++++++
>   arch/powerpc/platforms/pasemi/pci.c    |  5 +++++
>   arch/powerpc/platforms/pasemi/setup.c  | 12 ++++--------
>   3 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pasemi/pasemi.h b/arch/powerpc/platforms/pasemi/pasemi.h
> index 6f6743b8e48d..01bcfa258625 100644
> --- a/arch/powerpc/platforms/pasemi/pasemi.h
> +++ b/arch/powerpc/platforms/pasemi/pasemi.h
> @@ -7,6 +7,12 @@ extern void pas_pci_init(void);
>   struct pci_dev;
>   extern void pas_pci_dma_dev_setup(struct pci_dev *dev);
>   
> +#ifdef CONFIG_PPC_PASEMI_NEMO
> +void __init nemo_init_IRQ(void);
> +#else
> +static inline void __init nemo_init_IRQ(void) { }
> +#endif
> +
>   void __iomem *__init pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset);
>   
>   extern void __init pasemi_map_registers(void);
> diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
> index 2df955274652..fb53782da7ec 100644
> --- a/arch/powerpc/platforms/pasemi/pci.c
> +++ b/arch/powerpc/platforms/pasemi/pci.c
> @@ -265,6 +265,11 @@ static int __init pas_add_bridge(struct device_node *dev)
>   	 */
>   	isa_bridge_find_early(hose);
>   
> +	/*
> +	 * ISA bridge is now active, add the i8259 cascade (if needed)
> +	 */
> +	nemo_init_IRQ();
> +
>   	return 0;
>   }
>   
> diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
> index 45792ecd5dfd..7a961f2a228f 100644
> --- a/arch/powerpc/platforms/pasemi/setup.c
> +++ b/arch/powerpc/platforms/pasemi/setup.c
> @@ -216,10 +216,12 @@ static void sb600_8259_cascade(struct irq_desc *desc)
>   	chip->irq_eoi(&desc->irq_data);
>   }
>   
> -static void __init nemo_init_IRQ(struct mpic *mpic)
> +void __init nemo_init_IRQ(void)
>   {
>   	struct device_node *np;
>   	int gpio_virq;
> +	struct mpic *mpic;
> +
>   	/* Connect the SB600's legacy i8259 controller */
>   	np = of_find_node_by_path("/pxp@0,e0000000");
>   	i8259_init(np, 0);
> @@ -230,14 +232,10 @@ static void __init nemo_init_IRQ(struct mpic *mpic)
>   	irq_set_chained_handler(gpio_virq, sb600_8259_cascade);
>   	mpic_unmask_irq(irq_get_irq_data(gpio_virq));
>   
> +	mpic = irq_get_chip_data(gpio_virq);
>   	irq_set_default_domain(mpic->irqhost);
>   }
>   
> -#else
> -
> -static inline void nemo_init_IRQ(struct mpic *mpic)
> -{
> -}
>   #endif
>   
>   static __init void pas_init_IRQ(void)
> @@ -300,8 +298,6 @@ static __init void pas_init_IRQ(void)
>   		mpic_unmask_irq(irq_get_irq_data(nmi_virq));
>   	}
>   
> -	nemo_init_IRQ(mpic);
> -
>   	of_node_put(mpic_node);
>   	of_node_put(root);
>   }


-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

