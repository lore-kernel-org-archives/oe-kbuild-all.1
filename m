Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3025334B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375473; cv=none; b=QyA7S1zOEHseFW9myLA/yqTaZzZvzfPNaVeasp9C3LWW1BmruVWU+NdnVTqy++elRy6Vp29XiBaemyYkHAl38sAy+HmFZGxmLAYgOT3f93MW5TzpAxZBLZu+LwnYbXsifRzpBp8K+0bwo6uSAxM7UtYuxKnl1LrBgjh3BXI2aT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375473; c=relaxed/simple;
	bh=Hz870rrbvL7+W32chYi1AB5qzGbp00ew384Qn/R5AL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7Yw+KmleZILTxL5GqfCmHGQ4NKZ6V37TPVZQcj/WYG6ETSj9EGj2trj1L8AupBI0IqszYWf+Uz0d8yV2etc+gwCnmW0GjCZALU7pOwsOiq3xDLQaMXDAYfbohzIe9WoCPJCr5Wqh8/pPOuFPmw0a/5Teonp1jZed7AySQgX0bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1JMGkCN; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1JMGkCN"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6df83fd01cbso33848286d6.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 07:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739375470; x=1739980270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu7mS/LhR5nE7B4W16cmaBl2ePxW56GQKlpOVzXTQU8=;
        b=d1JMGkCNNIkDqNH3KCYtjas74nyPPYmNMKGwUzupRhBcSGeif2NsxXPHCqqq+qYgRQ
         tg0PzvywyvJhoQQKQr3ziUVlaQZ20lkH7Qb/iMwjw0GkgCjfce3f8h2aVLVbmroWzC22
         lHaX6484E06VKOb3zvnYSec9KJm7ysbJvrWViJARRNEBp4AH9WKXQuz0E7GwZ79BSWHk
         OAYGu6sqhXhiPX2+MpkAoI1Ngbi/7ECHZiX96p2btW8rwEpDhb0ctJcsYTyawY5YlFaX
         B4/K6Y4dGLWrTS0Oh4Vldy8cxdWWbz12mTHN7nSi9D5PODJcRe4ePISfB310S2IEsGvK
         QOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375470; x=1739980270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu7mS/LhR5nE7B4W16cmaBl2ePxW56GQKlpOVzXTQU8=;
        b=t6boqDmmhV/LR6I9dKysvREa7VDbZA0UD+gZc08YWftKCwzIR2E1GGOebmm5KB8/Eq
         WFuxIJPqVuPCU41h23A9m9uziTVnN3ZLXLvi5IrnNQWXqKT3/GKOrRUFdWiAWbb3tZpl
         Pwhk3861Iv5dvbe9H12I/v5UGDAJYigzmndlcOeF45d8Q55s2oQXuqqMBLrSoPoNiumA
         XrGloqIUMjiONbPYAMv0dGlZr91xHAfxJnuvnzvCuzWzeJ0rdtM6zBR/ahh2iebS9C8/
         TRmCYrufnlIvdXAPZjt3Gi/0wlY254JnnqcfHbPbx4HAg4StelV4jaE8uRgCIsqEflp8
         NzEA==
X-Gm-Message-State: AOJu0YypWHyDHo8f/y936HSeFfA2hO7e1wVKX0FAvj9Xz1LLRVgYWojs
	Bo38jLf32qxhiU9R24Kb61x/a7F8DIrthZOGIaxeY54WB5BKK5FZ
X-Gm-Gg: ASbGncsderxzOlETXQkU2qCOzmEqOtaFR+FCLw0jmRgOHHMY4IhUYtNu2AkObzksHaz
	PsBnCcfQ/yS9+9yTouYAADXv/Za8sIxACBjGiu/VitjLEbOEcqzIJhiEODk+qw0F96HOGyJUbuW
	LFkbBWBViHUiIsYko5Yq7Sh1//guJaPynHjndBm/H641o7e/7PS2Tcv57prxSkV9qSL8GIgNY6R
	bT79lTcCjx9JeVxotFxTGK9rD0xh54SgKd0DGzRYnAS/RYogBCFq7xdV0IfdC3WOcsXXy2dmq9C
	zuuc3+yJQxh7QH/ES0AK6R9A7/cz4gJZlsxb+2NdEj7SS4aqcQ==
X-Google-Smtp-Source: AGHT+IGU8OyRZmV+mFZ3xkPavJ6gXmruDDGWfo4AKqQMIrYYaDIXx+4ZT1EfSMpDphEm7W6mcMbvCg==
X-Received: by 2002:a05:6214:529a:b0:6d8:8a60:ef2c with SMTP id 6a1803df08f44-6e46ed77f6cmr52340066d6.2.1739375469787;
        Wed, 12 Feb 2025 07:51:09 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device.nat.cmu.net. [128.2.149.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e659304a34sm4438976d6.53.2025.02.12.07.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:51:09 -0800 (PST)
Date: Wed, 12 Feb 2025 10:51:07 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, geert@linux-m68k.org
Subject: Re: [litex-hub:litex-rebase 15/15] drivers/block/litesata.c:236:15:
 sparse: sparse: cast removes address space '__iomem' of expression
Message-ID: <Z6zDaw33CbeXFgyJ@glsmbp.wifi.local.cmu.edu>
References: <202502120833.dMbQRzZi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502120833.dMbQRzZi-lkp@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett

Thanks for the report!

On Wed, Feb 12, 2025 at 08:06:01AM +0800, kernel test robot wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   222d6093d18e20b52f2a81a4d162a17af3760fff
> commit: 222d6093d18e20b52f2a81a4d162a17af3760fff [15/15] LiteX: LiteSATA block driver
> config: csky-randconfig-r111-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250212/202502120833.dMbQRzZi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502120833.dMbQRzZi-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/block/litesata.c:236:15: sparse: sparse: cast removes address space '__iomem' of expression
> 
> vim +/__iomem +236 drivers/block/litesata.c
> 
>    208	
>    209	static int litesata_irq_init(struct platform_device *pdev,
>    210				     struct litesata_dev *lbd)
>    211	{
>    212		struct device *dev = &pdev->dev;
>    213		int ret;
>    214	
>    215		ret = platform_get_irq_optional(pdev, 0);
>    216		if (ret < 0 && ret != -ENXIO)
>    217			return ret;
>    218		if (ret > 0)
>    219			lbd->irq = ret;
>    220		else {
>    221			dev_warn(dev, "Failed to get IRQ, using polling\n");
>    222			goto use_polling;
>    223		}
>    224	
>    225		lbd->lsirq = devm_platform_ioremap_resource_byname(pdev, "irq");
>    226		if (IS_ERR(lbd->lsirq))
>    227			return PTR_ERR(lbd->lsirq);
>    228	
>    229		ret = devm_request_irq(dev, lbd->irq, litesata_interrupt, 0,
>    230				       "litesata", lbd);
>    231		if (ret < 0) {
>    232			dev_warn(dev, "IRQ request error %d, using polling\n", ret);
>    233			goto use_polling;
>    234		}
>    235	
>  > 236		ret = devm_add_action_or_reset(dev, litesata_devm_irq_off,
>    237								(void *)lbd->lsirq);

This is supposed to work in conjunction with the following (right
before litesata_irq_init() in the source:

    204 static void litesata_devm_irq_off(void *lsirq)
    205 {
    206        litex_write32((void __iomem *)lsirq + LITESATA_IRQ_ENA, 0);
    207 }

... which re-applies `__iomem` to the pointer. Since I'm trying to
pass a `void __iomem *` pointer as "data" through devm_add_action_or_reset(),
I have to cast it to `void *` and back to `void __iomem *` before use.

Not sure how to do that *and* satisfy sparse at the same time-- perhaps
using a (__force void *) cast is needed/warranted here?

Thanks,
--Gabriel

>    238		if (ret)
>    239			return dev_err_probe(dev, ret,
>    240					     "Can't register irq_off action\n");
>    241	
>    242		/* Clear & enable DMA-completion interrupts */
>    243		litex_write32(lbd->lsirq + LITESATA_IRQ_PEND, LSIRQ_RD | LSIRQ_WR);
>    244		litex_write32(lbd->lsirq + LITESATA_IRQ_ENA, LSIRQ_RD | LSIRQ_WR);
>    245	
>    246		init_completion(&lbd->dma_done);
>    247	
>    248		return 0;
>    249	
>    250	use_polling:
>    251		lbd->irq = 0;
>    252		return 0;
>    253	}
>    254	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
