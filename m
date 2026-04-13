Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218B235F19D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074550; cv=none; b=j+5J9sw+T2k1xPbYRE6nJtefPMFT7Le2YOeTh9gQPU8VnkOkfp5mTes742OtIhaIuV6NRZ1eZrtWncEhxGaMkTcT9/dFN5PuLtSBrtK5/Rc61b85pF0diDT1TnCI2PMk5eMfqgdW70usxCkfcsVqMKTIatRsG2l9k9DI4rrw7lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074550; c=relaxed/simple;
	bh=OJhkenZeXpWhmuMzXfde9TgUNplYQhkkG/1G1TU20DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTPqEs6mgku82/rYQKUouzBO0gC5A5+qFCuNMS4emCiTpbq9co8yKXcgCZdS2WDU7y6b33GCCGEBIp11SZkFS8fRMUq1tLP627OJpkTqBBv6jDD4H+llQhmwywSg18SizOggPALB+8sv0RI5EhuPHwqyQRQqOEsxX+IQqBXBf10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso2821335e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 03:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074546; x=1776679346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAtRWEjC2sAANZrEW34vEBdDD4L0Fl7gxb1SSwRyF6c=;
        b=OxCauTNaPur37LwzZrOUS8H1QwYXA8L8HTIWATbl3nRD6MVW9HRezCjCBMG7FK2ez/
         tXah+b34tsRcXtWdxdzlG3vZqDDU1OgoAPIxePD7ksNgHBDOVGa0696ed1chTI8Z27nv
         4XqqHrxvC2JKctkM2N6KgxsZKfC88k4JWVwd5yk2XyB/h8DAhDpWcg0/Dw15tJu0Yadl
         4aLvpTzn01vdAn1aLuIoLeY1+RGV9/oLyskz37/+m2rAb+IMuBfY3E3MslDalDsTuFtV
         JZiOpogyEJVMh6QIj/yQLUQN8PnjofYZ04qVMSj9A4PGe8CIrSugCRrUSkk3LYOTFuMt
         2epA==
X-Forwarded-Encrypted: i=1; AFNElJ/3hUi6g+QlZqDXk0BflJpYRy5T6Mk9hQqkHfON2vvr4B+S06SWy6yxFL1eRiwF2uHsLskR0/WSmrZkj+CE@lists.linux.dev
X-Gm-Message-State: AOJu0YzHrl5DsVWrgeRgdBeL+dfiscKy3mrghBnQFdQqQpAWYEvUxXQa
	HH6LDQyWHCURwObmcv8lEjgvYAzUSWkK+eMX6UWlR7lo4MMjFbLi3kiUIqxJy9TX
X-Gm-Gg: AeBDievwOAm8EzVMQdmMuBcI4NzTKFZuTjexKg2IFX2pcPGLzSBKFNj0UramanXzEwD
	0TD55Lgi+TVqxt4vAdYF8nryr6e51+OWY/VgGYZUEbkOhRvzO3VEoMn4xFfhyZf2+WP4QswaOjz
	3o2ekgaGnI5M37W+tms96BYtxuN5WSh+6yDs2/IG13dceGsvJofFpZ7qZmL4CNgG6LmX/moux4A
	+J9YVUgRKqEaF1ccWLYBZV/wUVfN6DFz+UaB7EIKk8R/9TaklY4MDMAqBFUHDLHscvKkyNSS8tb
	G5jsdp5aGVkwvs4Qq5VUO/ezlGfPHjrkVaXPIpy98C/aSAXGmp/wMAYrf7vg0PgVEbKjD+901do
	c7GM0LEJdbNK+311zrWxi0YGSAg1BOzxlAPeiPQ/p0024LZ+RK2r3B+6LYmmZq1Eka9fzTXglCt
	TpyRKqVXLG8X5w6P9Mj1jVYVyd/0c/LPDjkKrvwxmDfsagFpuyqkmg8rRoLl7rywYA
X-Received: by 2002:a05:6122:45a6:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-56f3bb8a321mr5328266e0c.4.1776074543026;
        Mon, 13 Apr 2026 03:02:23 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-954e0ccacf1sm5637886241.13.2026.04.13.03.02.22
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:02:22 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d95bc93e3so2570359e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 03:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Y8O3md3eSm4bkfB1D+8r/5iNSmM0AcLyMdEsKkrpgRVVGrv1QNfMIpzSIFD2gDJ7gi9fdGu3I38w3KN/r@lists.linux.dev
X-Received: by 2002:a05:6122:65a1:b0:56d:b337:4709 with SMTP id
 71dfb90a1353d-56f3bc536f7mr5402633e0c.6.1776074542130; Mon, 13 Apr 2026
 03:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604101721.fsv5XmCX-lkp@intel.com> <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
 <1e02bd10a68747f4a342caedde76ef04@realtek.com> <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
 <c09417ea7d534e2c812d470bd166fa3a@realtek.com> <CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
 <6b6310b8-2b0d-4390-992e-5ccd81cef2e0@app.fastmail.com>
In-Reply-To: <6b6310b8-2b0d-4390-992e-5ccd81cef2e0@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Apr 2026 12:02:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzr5_5s=JGzMsdjC-MjWQrSvqGrzWLiM=BjJaAB7kwyA@mail.gmail.com>
X-Gm-Features: AQROBzCF56abR4UoKFjT_X1tUplP8tWMNwuoLggZIFI1qSisE6E9krlH2_D1TkY
Message-ID: <CAMuHMdWzr5_5s=JGzMsdjC-MjWQrSvqGrzWLiM=BjJaAB7kwyA@mail.gmail.com>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>, 
	kernel test robot <lkp@intel.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 13 Apr 2026 at 11:30, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Apr 13, 2026, at 11:15, Geert Uytterhoeven wrote:
> > On Mon, 13 Apr 2026 at 02:48, Ping-Ke Shih <pkshih@realtek.com> wrote:
> >> > On Fri, 10 Apr 2026 at 14:15, Ping-Ke Shih <pkshih@realtek.com> wrote:
> >> > How can that make a difference?
> >> > Both rtw8814au_efuse and rtw8814ae_efuse contain just (the same number
> >> > of) bytes, so __packed on the union should not make any difference?
> >> > Moreover, rtw8814au_efuse and rtw8814ae_efuse are already tagged with
> >> > __packed, which should also not make any difference.  Someone's been
> >> > sprinkling too many __packed all over the place?
> >>
> >> I have similar thought as yours, but arm-linux-gnueabi-gcc compiler seems
> >> have special treatment with union. For this case, without __packed
> >> the offset of followed field res5 will become 0xe0.
> >
> > Hmm, I can confirm the original issue, and that adding __packed does
> > have an impact (it reduces the size of rtw8814a_efuse from 522 to 520),
> > but the actual size is still wrong (should be 512).

Aha, rtw_2g_txpwr_idx also needs __packed.

> >
> > drivers/net/wireless/realtek/rtw88/rtw88xxa.h has a similar issue, but
> > adding __packed does not make a difference there.
> >
> > Removing the __packed from struct rtw8814au_efuse increases its size
> > from 14 to 16 bytes.  Looks like that ABI pads every structure to a
> > multiple of 4 bytes?
>
> Correct, that is a unique property of the ARM "OABI" legacy ABI,
> triggered by this defconfig line:
>
> # CONFIG_AEABI is not set
>
> Nobody should be using ARM OABI any more, and I think we should
> remove it from the kernel once support for the StrongARM
> CPU gets removed (I have patches for that), as those CPUs were
> the last ones that regularly used OABI.
>
> Annotating the union as '__packed' is the correct fix for
> the theoretical users of OABI, and does nothing on other
> supported targets in Linux.

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
