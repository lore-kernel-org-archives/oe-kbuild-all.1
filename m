Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01502325724
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 19:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580467; cv=none; b=GuMaVgyccNANZ6coTYVkyEJHiXWX7Hac71XGcsI+QuQBgfSBw945YLEcdS+X/unHRuPj7KFg8F933NrokNV0/PEdNOu9g8CpYnVvn5r+9jVdTB61GHPpBRQwWkFc+L5zFasjJkEBMimUSVUMoQ6mOfgdweB+Dbxe4IvR39qafvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580467; c=relaxed/simple;
	bh=OhtSa3jf+nR/15ghCvasOqA7D6ZUecwiAmdk4chd2L8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IiBU1K76atxr2/SAoZb0PpYFpOEdLplzZeO+fBc3S6ZLdqenv28GyV1W2IfP/LMc+t+she2tZp6xAbKAIvlXqCS+aS0/ahWJc/sJLYz1nnkXpjbhZksQv+EVSmxrwvGPUlEJS7idKRFdeiICRbI7adn7hmGZzEDHch3/ABOYXPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Re+bmWRs; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Re+bmWRs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C8BA44E417A9;
	Wed, 19 Nov 2025 19:27:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 84AA960699;
	Wed, 19 Nov 2025 19:27:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64FEC10371A7E;
	Wed, 19 Nov 2025 20:27:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763580455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g6KRO1bSR9UjlCi4KsdAdz7FLfsatP5desNtHHE8Woo=;
	b=Re+bmWRs7AKn7jdnaV3DNIKX95vaXpRGYey3vMm5fr3nVlbWSU5EDb0RPDtHJbWM+J8ABV
	zJmJoZHJYigoH3+4Oz6dfXeO0X1RgTdmr/dACvtlIEEZq1BauHHXIC1R69aSKh9e/7B1kv
	rc0V0dZJC10kCB6yEZWD6ue5FqoFNDCjMlZWexmvdPPASR9/2+k44qU3KP6vJlkZUoGTK2
	lOh1uuiwcDNkKJ7ak+LpB0UsYc19+I1V2hYNqx9f7RL4RlmtZYRKogJU+5jzNO9GbkwGno
	a2ZfoBindnOTCBpdSzfX0MWxu5MdqNWEtEsXBnVTGEXnj6MAyDekOnGX+Fk62Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <markus.stockhausen@gmx.de>
Cc: <oe-kbuild-all@lists.linux.dev>,  <linux-kernel@vger.kernel.org>,
  "'kernel test robot'" <lkp@intel.com>
Subject: Re: AW: drivers/mtd/nand/ecc-realtek.c:443:undefined reference to
 `dma_free_pages'
In-Reply-To: <003801dc4fd1$a76efc20$f64cf460$@gmx.de> (markus stockhausen's
	message of "Fri, 7 Nov 2025 11:31:18 +0100")
References: <202511071114.8WeW2GZK-lkp@intel.com>
	<003801dc4fd1$a76efc20$f64cf460$@gmx.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 19 Nov 2025 20:27:33 +0100
Message-ID: <875xb53jru.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Markus,

On 07/11/2025 at 11:31:18 +01, <markus.stockhausen@gmx.de> wrote:

>> Von: kernel test robot <lkp@intel.com>=20
>> Gesendet: Freitag, 7. November 2025 04:39
>> An: Markus Stockhausen <markus.stockhausen@gmx.de>
>> Cc: oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kernel.org; Miquel
> Raynal <miquel.raynal@bootlin.com>
>> Betreff: drivers/mtd/nand/ecc-realtek.c:443:undefined reference to
> `dma_free_pages'
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it
> master
>> head:   4a0c9b3391999818e2c5b93719699b255be1f682
>> commit: 3148d0e5b1c5733d69ec51b70c8280e46488750a mtd: nand: realtek-ecc:
> Add Realtek external ECC engine support
>> date:   6 weeks ago
>> config: sh-randconfig-r121-20251107
> (https://download.01.org/0day-ci/archive/20251107/202511071114.8WeW2GZK-l=
kp@
> intel.com/config)
>> compiler: sh4-linux-gcc (GCC) 15.1.0
>> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20251107/202511071114.8WeW2GZK-l=
kp@
> intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:=20
>> | https://lore.kernel.org/oe-kbuild-all/202511071114.8WeW2GZK-lkp@intel.
>> | com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    sh4-linux-ld: drivers/mtd/nand/ecc-realtek.o: in function
> `rtl_ecc_remove':
>> >> drivers/mtd/nand/ecc-realtek.c:443:(.text+0x1f8): undefined reference
> to `dma_free_pages'
>>    sh4-linux-ld: drivers/mtd/nand/ecc-realtek.o: in function
> `rtl_ecc_probe':
>> >> drivers/mtd/nand/ecc-realtek.c:434:(.text+0x2e8): undefined reference
> to `dma_alloc_pages'
>>    sh4-linux-ld: drivers/media/i2c/tc358746.o: in function
> `tc358746_probe':
>>    drivers/media/i2c/tc358746.c:1585:(.text+0x15cc): undefined reference
> to `devm_clk_hw_register'
>>    sh4-linux-ld: drivers/media/i2c/tc358746.c:1610:(.text+0x163c):
> undefined reference to `devm_of_clk_add_hw_provider'
>>    sh4-linux-ld: drivers/media/i2c/tc358746.c:1610:(.text+0x1640):
> undefined reference to `of_clk_hw_simple_get'
>
> Hi Miquel,
>
> help. What needs to be done here?
>
> Markus

Looks like the sh architecture has no DMA support whereas the driver
depends on it without properly advertising it in Kconfig. The driver may
be enabled on this architecture due to COMPILE_TEST being set in
Kconfig.

I'll send a small fix.

Cheers,
Miqu=C3=A8l
