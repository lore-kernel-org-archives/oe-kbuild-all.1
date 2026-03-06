Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9C36AB43
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772783862; cv=none; b=sePNU1JhhbcEfKifuLACOXcR0okL7BxH3YQjpNPZ+LL7X9ZEKPUBixJcT4P85sXUqcyuyY22dy7qxN0Ir722xrxyy7bzOjAV4Jyze+zqN8oSXqQxo18vLmB42VLF06D6PtJkt1NGDUC24t8u0EbtOi+bHCghGqVLDP/duJ2vUgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772783862; c=relaxed/simple;
	bh=7wKRkvO70hMy5zDRYhtTu26HawZrkHofq3o87be9SVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNSZ4B4nI7bRV38xhfIVlynAav0kJ9BX7bWjV++z4SbHrErZynNx0kJ0Jg1uf2hxoW/aRnhIiZ2tm+FwaQu3LDAaYPidXxzZScMYViD2AS/2ESZ3mEzwDbeQ7dTOwzk7cxFexpT9mYeVXf0httBHyufgUXOsUf1xT4oa6r6BC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94acf9ce1b7so5919998241.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Mar 2026 23:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772783859; x=1773388659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdkYidlXRHI4vogHfWqY6yIA2LSTFvUAK1wlWzgQ9zU=;
        b=MxAApRuoe+yBilDP0N670dwywQQcUIbwulXiaKBGmxFvyFcu8CNQWtzEaCadbzdVkV
         CGVlef8RwZFKA/15ESyDy2KrLxt4I2zZNDoTTgwBUDZewR0YLQC4J7X7pUPrbkE9/UyU
         FIHi92/Rc5xsdTmoWNYfY1emACEp1tMXsywyu9HbIygx3Ae+JMJJoOCDF1OEpa5f+To2
         FBBVLhlecpZSAitawh1EludGjaRFpBQnsa4AEE0AffCV1HsY8yWDcVs518xZ8n1B4psJ
         wjK7O+/TcOv4hNPPJlH4+EuU6YcSetG0s8yTMKP+CW6CPuSyoIUNWso4XS5x+nMJ2viO
         zKaA==
X-Forwarded-Encrypted: i=1; AJvYcCVdlJWzaREHTTvWX1oqqWshSgQNQWtUk8upk3TliEGgk2lQbdGo/nOdiaoCsxRJIHjrXqF4I/B2RATNZDTz@lists.linux.dev
X-Gm-Message-State: AOJu0YypMVAYHKrSLgNyNzlIHYAWRq0d+qfjOKRxYxA3AO7S9Fh+nQ41
	b76+S9RD1gMf0tBKTU5gwGTpGWDK67mJY0KxCGLplc1HbK8wJS0LPExmVXasga9TOZc=
X-Gm-Gg: ATEYQzwYuG4bbwdtA4PyTxlOqc1FaUM0OHH1v+6tRTGO7TnKpStimrZWuLIYkavYmph
	b955O+nnnXyBw/plE3g/eut5F5X1o2+ZkAZUdjFeRzYhl9xalViUlkD4zukkKX5UBXSfMqlw5CT
	bjl8q8XwUFjyaQ2Pn6Oj9hyQ6CyrenBJOnQvMpfeLgfGkdb/wbUMT7QSCL3FjFxQnn385qJd8Vo
	/OeN+g/wL4qrfQgeZ440JBInmgdglCAhqZVtg3z+ukWWZW1ImeLQ6OvwXJbO5Y6UN0yGnPJdV+z
	QGqsPmSIPY8nBHHSBPvpdEZRalfyePFaEVruYfMsgtreIbSNYaNbhxAtJXzy6p6mmK+2GqsMLph
	P334SsPqvGaI/ltx2sbshI3wY3PUKmqgcYanNPBuyZvIIWYflpedJ84HUNlAoiCyxPN0SUpdmsp
	w9UczAS8nvEJ2qyh+HDQ1qI2PYwkLnHiLNw14RYIGdw4eamtSprywSFTa+PVHmtLKX
X-Received: by 2002:a05:6102:dd2:b0:5ef:a59e:617a with SMTP id ada2fe7eead31-5ffe6120e40mr474931137.21.1772783859436;
        Thu, 05 Mar 2026 23:57:39 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ffe8c6f1e4sm708493137.11.2026.03.05.23.57.38
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 23:57:38 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a987683baso8843126e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Mar 2026 23:57:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVhjX/TCd/Yt44EmGZRRsUfK3Q5+9a1T38DznBqCDdz+RugmtL+Kwhkkd+jmuBv1XyMFHzD7gT7JWPaBYXM@lists.linux.dev
X-Received: by 2002:a05:6102:54ab:b0:5f1:5c43:936a with SMTP id
 ada2fe7eead31-5ffe61206bamr473306137.25.1772783858371; Thu, 05 Mar 2026
 23:57:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603042127.PT6LuKqi-lkp@intel.com> <aah4opTMZeDDfWFG@carbonx1>
 <aak3k24kjfD55xNQ@monoceros> <eccfd2eb-f635-400c-9517-1cf574da70d7@gmx.de>
In-Reply-To: <eccfd2eb-f635-400c-9517-1cf574da70d7@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 08:57:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKnP2W2mZuX_aWipOzCSjkJqA_0cRv1ALcjvgm-r=FZw@mail.gmail.com>
X-Gm-Features: AaiRm52A8p7cpZl8_p3OksqTVNGDRHOEW82bsyicwF26dBaFiBOpBnv8Ni8ujb4
Message-ID: <CAMuHMdWKnP2W2mZuX_aWipOzCSjkJqA_0cRv1ALcjvgm-r=FZw@mail.gmail.com>
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
To: Helge Deller <deller@gmx.de>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Helge Deller <deller@kernel.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On Thu, 5 Mar 2026 at 09:58, Helge Deller <deller@gmx.de> wrote:
> On 3/5/26 09:07, Uwe Kleine-K=C3=B6nig wrote:
> > On Wed, Mar 04, 2026 at 07:23:30PM +0100, Helge Deller wrote:
> >> * kernel test robot <lkp@intel.com>:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> >>> head:   0031c06807cfa8aa51a759ff8aa09e1aa48149af
> >>> commit: 6f366e86481a7503a821de82930df517dddd4047 fbdev: au1100fb: Mak=
e driver compilable on non-mips platforms
> >>> date:   13 days ago
> >>> config: mips-randconfig-r052-20260304 (https://download.01.org/0day-c=
i/archive/20260304/202603042127.PT6LuKqi-lkp@intel.com/config)
> >>> compiler: mips64-linux-gcc (GCC) 14.3.0
> >>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20260304/202603042127.PT6LuKqi-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi=
-lkp@intel.com/
> >>>
> >>> All error/warnings (new ones prefixed by >>):
> >>>
> >>>     drivers/video/fbdev/au1100fb.c: In function 'au1100fb_drv_probe':
> >>>>> drivers/video/fbdev/au1100fb.c:448:46: error: implicit declaration =
of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Wimplicit-function-de=
claration]
> >>>       448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(=
fbdev->info.fix.mmio_start);
> >>>           |                                              ^~~~~~~~~
> >>>           |                                              CKSEG1ADDR
> >>>>> drivers/video/fbdev/au1100fb.c:448:23: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
> >>>       448 |         fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(=
fbdev->info.fix.mmio_start);
> >>>           |                       ^
> >>
> >> I've pushed the patch below into the fbdev git tree.
> >> It should (hopefully) fix the issue.
> >>
> >> Helge
> >>
> >>
> >> From: Helge Deller <deller@gmx.de>
> >> Subject: [PATCH] fbdev: au1100fb: Fix build on MIPS64
> >>
> >> Fix an error reported by the kernel test robot:
> >>   au1100fb.c: error: implicit declaration of function 'KSEG1ADDR'; did=
 you mean 'CKSEG1ADDR'?
> >>
> >> The header asm/mach-au1x00/au1000.h is unused apart from pulling in
> >> <linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). The=
n
> >> the only platform specific part in the driver is the usage of the KSEG=
1ADDR
> >> macro, which for the non-mips case can be stubbed.
> >
> > This paragraph is copied from 6f366e86481a and doesn't make sense here.
>
> Yes, I noticed that later and removed it already.
>
> > I'd write something like:
> >
> >       arch/mips/include/asm/addrspace.h defines KSEG1ADDR only for 32 b=
it
> >       configurations. So provide its compile-test stub also for 64bit
> >       mips builds.
>
> Ok, added.
>
> >> Fixes: 6f366e86481a ("fbdev: au1100fb: Make driver compilable on non-m=
ips platforms")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202603042127.PT6LuKqi-lk=
p@intel.com/
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> >>
> >> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au11=
00fb.c
> >> index 1a04154bc535..3b104d377d28 100644
> >> --- a/drivers/video/fbdev/au1100fb.c
> >> +++ b/drivers/video/fbdev/au1100fb.c
> >> @@ -380,7 +380,7 @@ static struct au1100fb_panel known_lcd_panels[] =
=3D
> >>   #define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
> >>   #define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO=
)
> >>
> >> -#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
> >> +#if defined(CONFIG_COMPILE_TEST) && !(defined(CONFIG_MIPS) && !define=
d(CONFIG_64BIT))
> >
> > The condition is equivalent to
> >
> >       defined(CONFIG_COMPILE_TEST) && (!defined(CONFIG_MIPS) || defined=
(CONFIG_64BIT))
> >
> > which is logically a bit easier, but I'm unsure if it's easier to
> > understand (IMHO both are bad).
>
> Yes, both are bad. I changed it to your proposal.

Yes, I had to read it twice, but that applies to both :-(

What about "#ifndef KSEG1ADDR" instead, or would that be considered
too dangerous?  <asm/addrspace.h> is included by MIPS' <asm/io.h>
 so it should always be included if the I/O accessors are available.

---
Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
