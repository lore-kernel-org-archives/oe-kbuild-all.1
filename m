Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CED231842
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786881; cv=none; b=gRUVOcZNBIxlRnMyZ1q4X3zJ+2naob1HdNPTLO4vCvL0eZs9cDSn5DOPyLDchjD/BOWT5+7Q8R/O9SO4/2UkAtSjcQWoZwtsCRc16j95f56UCdPdo2cubYb4rhnVdlrESrHwDOoJka4NTBoECgYwnHwcZ1nhXYSq4z79/70sjgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786881; c=relaxed/simple;
	bh=BJJVEdkmCFSQyajDQY1hsnFGIWVSlK6ThCzuZ2aAnN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5khi7NCmWEbCloj/vrfRMTwqzJgT9aijvAVkP9iESxD4tArc0URvHjiHpV+tWDKHfHt27KF7koYahii+mQknCVoGsDcueCzwioWs3bcBfxvYGRpUGwTIJuLdJOxEpDvIXym7EaZG6OoyMJBOtlL3oiMWX4LmJjO/umAez68TV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56af4aa4e41so1469240e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Mar 2026 00:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786879; x=1773391679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iiJ6TECGEnMfAAB+bA0Ewp5vacuGaesLyp1YR1Q9pKM=;
        b=gOBuT1aDgseX6DK3GXqWWTA5+06R55EjTnNdF2dW6ovGZelo+WSVSkoN8ouoN7cTXt
         g13OhxJKvDxgZuuZEkT5MbldAF9CWusa8RRFlLdAoyQw1uvow7JIYE4sUSuCyUEMYoH1
         Nc+044OBS1l/YLOb+yXGGgrOgRrHkV43NeCgSFLB2vT1vjY+wfP2Pq5rm4hxgqq4HXYq
         GSgs3xbXeenwhRUXfQjxVMgz0SsAYNwFKczmcCVxt4YHz5j4Vuy1nxkfMdxSZeTMph3N
         7zUVr8OTtb9zsRgMr+aGQxGclOLsJU2Dgrh81qMjXnL5JTVm/ZSjH6RR4pG0aTS09/5P
         kX6w==
X-Forwarded-Encrypted: i=1; AJvYcCVGqjoVicV41JNoV51BXArPOUMowXeOIb12//EVfcjuGvwsIlQD9tGgPBQ6XUtDYCFp7k3SBo/vqWY4jiOB@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt1X4yDb67zzqbe7NnMYVe037o+vQoiX0ZK5j2FeSR8btJMApA
	17BKfvoef88UUwXkNCF4tf3sQANO6jUYGqvn/lcSuG3gRFKy593kY7zlE/8gcEsnCX0=
X-Gm-Gg: ATEYQzxZlOV6cOjWHt7+Arps6mIaN44QeBI6GqybqmlUfvk1XiCAZmCad6MaSah1S+M
	Tc91hKv2Q6AvmYj5aQTF6AwFy6VjQOV8fIZuF3CxxTIq71Cy7yZI8f7GDs4w8XbADG/s0kuIskE
	6LfoeSx5eaTCpZQ4zgtkxDhKMzpeVxWBgqtYgOowUqdpqLnJGxV4c/L4F4YYIDo9Q9w2pAGZUEt
	UfJTpA03v5fpAdx1XTUmgnTVgj50kUXihL2Lm2Mdkeu70xfAmvaUDU01W9gACbGQqr8GVU9fNsK
	npGnvuRzIzSKZUykOCCFFC7oEAUXSC70Hg6RQLUicj0YD5mvni0fFYg2bqCqHNfuP0vow3OPwO/
	eabMoYAgoUpkLTfQUWC+Qyifk2qsOTuW7f3zbIfjuQHL1Sbkv7XGDTmGGh3WYLU4aSHlIRx1pLd
	6kyGjfvLQY7YFgyv/XrNegvDJMeGzb5s60MmS9nLibR4AC08WY1e1RVNrvYlIW
X-Received: by 2002:a05:6122:6597:b0:567:4838:8e4c with SMTP id 71dfb90a1353d-56b078601bbmr490968e0c.8.1772786878903;
        Fri, 06 Mar 2026 00:47:58 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09ae8a5fsm745762e0c.13.2026.03.06.00.47.58
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 00:47:58 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94ddffda372so6266242241.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 06 Mar 2026 00:47:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbQT9I7im6nCamazQCJmGQryi0CaWDGyU5fiiuq9b9+DSBs6MmvJaJknnB++F1Wk64fUmqcZWCaQAbWZhJ@lists.linux.dev
X-Received: by 2002:a05:6102:3f4d:b0:5ee:a6f8:f93b with SMTP id
 ada2fe7eead31-5ffc8bdd63emr2443177137.2.1772786878409; Fri, 06 Mar 2026
 00:47:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603042127.PT6LuKqi-lkp@intel.com> <aah4opTMZeDDfWFG@carbonx1>
 <aak3k24kjfD55xNQ@monoceros> <eccfd2eb-f635-400c-9517-1cf574da70d7@gmx.de>
 <CAMuHMdWKnP2W2mZuX_aWipOzCSjkJqA_0cRv1ALcjvgm-r=FZw@mail.gmail.com> <aaqOcs4CFMt1wiXo@monoceros>
In-Reply-To: <aaqOcs4CFMt1wiXo@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 09:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7d-5PTir4o0cSYiKqk01_dHjt1SKT4Xjohw11LjSLiw@mail.gmail.com>
X-Gm-Features: AaiRm52nSUyBFciv8GHyENanY_b2WUxt6c9jIOveo9oSqIHY2MULYGZd0N1aSww
Message-ID: <CAMuHMdX7d-5PTir4o0cSYiKqk01_dHjt1SKT4Xjohw11LjSLiw@mail.gmail.com>
Subject: Re: drivers/video/fbdev/au1100fb.c:448:46: error: implicit
 declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'?
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Helge Deller <deller@gmx.de>, Helge Deller <deller@kernel.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Fri, 6 Mar 2026 at 09:37, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Fri, Mar 06, 2026 at 08:57:27AM +0100, Geert Uytterhoeven wrote:
> > On Thu, 5 Mar 2026 at 09:58, Helge Deller <deller@gmx.de> wrote:
> > > On 3/5/26 09:07, Uwe Kleine-K=C3=B6nig wrote:
> > > > On Wed, Mar 04, 2026 at 07:23:30PM +0100, Helge Deller wrote:
> > > >> -#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
> > > >> +#if defined(CONFIG_COMPILE_TEST) && !(defined(CONFIG_MIPS) && !de=
fined(CONFIG_64BIT))
> > > >
> > > > The condition is equivalent to
> > > >
> > > >       defined(CONFIG_COMPILE_TEST) && (!defined(CONFIG_MIPS) || def=
ined(CONFIG_64BIT))
> > > >
> > > > which is logically a bit easier, but I'm unsure if it's easier to
> > > > understand (IMHO both are bad).
> > >
> > > Yes, both are bad. I changed it to your proposal.
> >
> > Yes, I had to read it twice, but that applies to both :-(
> >
> > What about "#ifndef KSEG1ADDR" instead, or would that be considered
> > too dangerous?  <asm/addrspace.h> is included by MIPS' <asm/io.h>
> >  so it should always be included if the I/O accessors are available.
>
> Just to state the (maybe?) obvious: With the more complicated expression
> it is asserted that the build breaks if on mips32 the definition
> disappears e.g. because arch/mips/include/asm/addrspace.h isn't included
> implicitly any more or the macro is renamed to unify with mips64's
> CKSEG1ADDR. With just `#ifndef KSEG1ADDR` the driver would break without
> the compiler noticing and put it's fbdata somewhere in the address
> space.

The KSEG1 and CKSEG1 names are part of the MIPS specifications,
so very unlikely to ever change.

> I guess it's subjective, but my preference would be to keep
> the more complicated expression (despite being complicated).
>
> An alternative would be:
>
> diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/dev=
boards/db1000.c
> index 6984cd5169b5..1958ad0e02a8 100644
> --- a/arch/mips/alchemy/devboards/db1000.c
> +++ b/arch/mips/alchemy/devboards/db1000.c
> @@ -98,8 +98,8 @@ int __init db1500_pci_setup(void)
>
>  static struct resource au1100_lcd_resources[] =3D {
>         [0] =3D {
> -               .start  =3D AU1100_LCD_PHYS_ADDR,
> -               .end    =3D AU1100_LCD_PHYS_ADDR + 0x800 - 1,
> +               .start  =3D KSEG1ADDR(AU1100_LCD_PHYS_ADDR),
> +               .end    =3D KSEG1ADDR(AU1100_LCD_PHYS_ADDR + 0x800 - 1),
>                 .flags  =3D IORESOURCE_MEM,
>         },
>         [1] =3D {
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100f=
b.c
> index 1a04154bc535..70b96e9ea454 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -380,11 +380,6 @@ static struct au1100fb_panel known_lcd_panels[] =3D
>  #define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
>  #define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO)
>
> -#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
> -/* This is only defined to be able to compile this driver on non-mips pl=
atforms */
> -#define KSEG1ADDR(x) (x)
> -#endif
> -
>  #define DRIVER_NAME "au1100fb"
>  #define DRIVER_DESC "LCD controller driver for AU1100 processors"
>
> @@ -764,7 +759,7 @@ static int au1100fb_drv_probe(struct platform_device =
*dev)
>                 return -EBUSY;
>         }
>
> -       fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.=
mmio_start);
> +       fbdev->regs =3D (struct au1100fb_regs*)fbdev->info.fix.mmio_start=
;

Changing fix.mmio_start would probably break userspace.

KSEG1ADDR() is basically a cheaper way of calling ioremap().
Looking at the MIPS implementation, it can probably just be replaced
by a call to ioremap():
https://elixir.bootlin.com/linux/v6.19.3/source/arch/mips/mm/ioremap.c#L71

>
>         pr_devel("Register memory map at %p", fbdev->regs);
>         pr_devel("phys=3D0x%08x, size=3D%zu", fbdev->regs_phys, fbdev->re=
gs_len);

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
