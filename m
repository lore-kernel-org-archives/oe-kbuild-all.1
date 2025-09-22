Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4557221299
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522724; cv=none; b=lr5xMIK0EkMd/jWUKjC8mg5m1hjvBfDAHtBsKJ1unNeawk+prl6YaajxRmIXAlpiHKhSias8swG7aJL8zQ+WBkgLx4PGejTVZNIkFVOBs5veJT93vrluw9sPZVWQibYniDnS9iaLIwuJD2APBGE38lkfeUpjPhftSkiAc1mGFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522724; c=relaxed/simple;
	bh=GcxGZtlcvANM4ISN0vX5FgQ46FyXpsKP4aF2UdyoWm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmBNc8itQK4Uu/sZnULbSueFLEgUpbfTAhqq1ZFbkG3/cfVHw9Etn7Vk7/2mZX8PyaZkzKfPFYM/fMpfD2pjZZnRlioJ+suIbgbqZh1X6oUjdaD5+VD+2BW0d41Bc0ZHLukT0T+lNYA5F1eI0Ygz1ISPKVxzJ3nN8+YrN1OBhQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-51d14932f27so1208296137.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 23:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522722; x=1759127522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9Xa9qt87OWMrii0JP5Zzn4osjNDUYE7qcLRx8KQ3iQ=;
        b=YaXANLxwYwe/u2P7AtVbCTIa2y4rlZeWk/NHoG4A7GwIa/INrYQX7VPdVlBLO+ppLF
         Kxb4q7LcIitOEzEw0C5veGC/LO7TknuawYL9VHI5JLQh3OCOW1VpAXtm70QRLhKtOPMu
         QC4yaG8LZEUjCxRVybgxNv8VMgpqJ9dPRhqsRWpHzTVQxzJqFMtfsJ6oRHu+7PRvd4qh
         R8acF8/JIhRyHfRlGXzwsuDuqjFuyMR6XKAer4mWZtj07v84pbRyeiajv1DApZ1ueji4
         ODQfMLaPhBeT7cTKLPKQ6joMeHHXEaHvSjL4fGtFMREUiW1jwJ3SlIxuIV/kOYk7ba7n
         gtBA==
X-Forwarded-Encrypted: i=1; AJvYcCWltpG4ltsxmBt23X5ZbwBkTifr7NyH9GRWpaEfpKwo2rg0Eyvbqxr39KtLGfZyULwWiRtMfxdsnRAQsMAv@lists.linux.dev
X-Gm-Message-State: AOJu0YxAr54VtGbNYVEwM9mGRKzTc1KNtIoUdGvF4ds0pf5cMlM1ei+r
	NJlok4WY88iaBylBM1RLGCef7cg7fGdVYa/QHcqj04PCknC6wci5xLJpDrk8ZVAb
X-Gm-Gg: ASbGnct2PxD3BJiO/FtPbeHCIfeLDuUdUhdpZINubGdL2JLv97JlqfWA555vkqEKGwt
	K5SjiDJ9I/WHot4tAdnRV9GXVAMBf0DrHCLFOxNLWJrOGrOrFNArT13i4LoYpPVVQu5v4zQkEdL
	HEpboRUt73iQJsvk/3S+Vsldd3YsLsVJVVoYIo9Syy7rpRV5QSbwZshj1o06LEJCajcWt83maP+
	POrqMzm7sqL5c52Dx6Uh1w+hcckyp3H79luBDjyzxECikjSa4Fb9eVvFcJw5siRK1z8YP+wUGkE
	YrHlyGfoXvA4X8Pc4mzbbHkEML3oQoKA9X0E8lXtJm0FyK5J6QvlnH9QlcpkZdRiXjtiotC7Scg
	GorsQRQu/6xhR5CdbcpTCfLkWQeKDepyPJBKl79yKsDGU3Vp+IiTob0NYJrd9
X-Google-Smtp-Source: AGHT+IFQv3sOhwoBq5sZZ5d+P03OyYlok33Yqy2r43ITH8z9uNm4brgs2yFG2akuq/o2NcoKG3HW/A==
X-Received: by 2002:a05:6102:91b:b0:5a0:4f93:fc31 with SMTP id ada2fe7eead31-5a04f9401d0mr621385137.4.1758522721697;
        Sun, 21 Sep 2025 23:32:01 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-57a02676c33sm3065731137.10.2025.09.21.23.32.00
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 23:32:00 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8e352f6c277so997757241.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 23:32:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmruQA3hHdpKn+WGIJIXJNq1PTUIk4xOMrYgnMhgoIIHryD0YO8+0ZOp6BkvvdOrzXFxOA1cG/cnOkCAWi@lists.linux.dev
X-Received: by 2002:a05:6102:449a:b0:59d:6be4:5b87 with SMTP id
 ada2fe7eead31-59d6be45e33mr1180465137.12.1758522720412; Sun, 21 Sep 2025
 23:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509212320.yCuqvnVn-lkp@intel.com> <202509212148052be5ea9d@mail.local>
 <aNCVl06r95XVn80G@rli9-mobl>
In-Reply-To: <aNCVl06r95XVn80G@rli9-mobl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 08:31:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXD_pBmMXB9AtBKXYzpvSwedCx=rQ45BN3J7EHB8aw=jQ@mail.gmail.com>
X-Gm-Features: AS18NWDJ1T0UMfydU9Ibm_gReDWXEJQCvT6Rk0CJxMCHwZSA2VY1VEA5R2-Wtso
Message-ID: <CAMuHMdXD_pBmMXB9AtBKXYzpvSwedCx=rQ45BN3J7EHB8aw=jQ@mail.gmail.com>
Subject: Re: drivers/i3c/internals.h:54:9: error: passing 'const void *' to
 parameter of type 'void *' discards qualifiers
To: Philip Li <philip.li@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel test robot <lkp@intel.com>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sept 2025 at 02:17, Philip Li <philip.li@intel.com> wrote:
> On Sun, Sep 21, 2025 at 11:48:05PM +0200, Alexandre Belloni wrote:
> > On 21/09/2025 23:54:32+0800, kernel test robot wrote:
> > > FYI, the error/warning still remains.
> >
> > As replied multiple times, the error is in the sparc64 code, not i3c.
>
> Sorry about this, the bot will be configured to ignore this issue to
> avoid further reports.

It is expected to be fixed shortly:
https://lore.kernel.org/all/fbb1a96c-d913-4bdf-b40c-c8981601bbf9@gaisler.com/

> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
> > > commit: 3b661ca549b9e5bb11d0bc97ada6110aac3282d2 i3c: add missing include to internal header
> > > date:   8 weeks ago
> > > config: sparc64-randconfig-001-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212320.yCuqvnVn-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212320.yCuqvnVn-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202509212320.yCuqvnVn-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from drivers/i3c/master.c:21:
> > > >> drivers/i3c/internals.h:54:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > >       54 |         readsl(addr, buf, nbytes / 4);
> > >          |                ^~~~
> > >    arch/sparc/include/asm/io_64.h:265:41: note: passing argument to parameter 'port' here
> > >      265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
> > >          |                                         ^
> > >    1 error generated.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
