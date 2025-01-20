Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218019004D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737362527; cv=none; b=ipMrziT+/S8kgtu3+vg4D2EV+lY7p+ADopHwSJEhPXQzQ7PkL5BRLnxIf0VQ1zfqJ9VgRhQznSx7MC+sEzBvSK8g2I/r0bQjVghN+z39No8/oejtc10gZnWXNdl3kUVoynoTyAatsuO+sfCIeM3PnEROr4uu7pxY22QZZpSw36c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737362527; c=relaxed/simple;
	bh=zUW42g9j58jlFEdIkDEjdoCMuo0GMFWbVS0XBLbNWZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abAN6AB0cl60H+YUGyTXwuwHLi5/9c6Sxlm8c8FO2eOQInznBDhH4RuCZbPIFVaDIei/VlLkGeWAW1B6WltziXNuxfNw0tey2hUPZaKQkGc5f2hnOXLfTcQCYmC4tk1/HRodZIdlvpGLDqH3uQeUFpoQgz0n2KHHLe0dh95E+SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85c5a91374cso1864121241.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 00:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737362523; x=1737967323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkesaM2Mzs7ra5bhCoJcMSPLGakUiG+eLRjst2GonZ0=;
        b=CFRSf/kBcAPiUOCXllmfkk2Ilnv9qBIrjkIxoDf1doFtq35FhpKmgnhGJCex145FQE
         oOUV6dh2emirPBjyn+kxoa5t8aIUTX62GHxI63ULAXPc9M+ytZYTTSq/VwbgRP6+/own
         BFdRJuT91xLSIxPeTj/V4rzYMD4XqamrGtQ1CL55vjaZYPfPc5Qhd10M5CxYCZLdd2a8
         kyERlCHybjDfCt4rCBLR0Z82BOo4qfq+XKbn8iKj3a3ps74motPpcQgiycD6kxxG3czT
         WpDkYClOhNKjI/zRQIzFP7b9gWOAPLpxBc1s+eQd5Z13Ic6YvKw/3iWxzlaEN60iuLke
         N9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0xMwryxbQBlcVwjj6NuMppRpa15uayjw6fQC3rYvHhcWIfJ7bNdM1CwH58WtZqxN0V+dbXUtFPYSwzJm4@lists.linux.dev
X-Gm-Message-State: AOJu0YzBZrDLTT8N6fg8RiQXiUxEjEgKRmaQ4VYUaHIibr87kflMn4Fy
	N69GraW24wsPRSKX5x0yr161zBqCLYh2vgJcXCM5uKwA4G3ZBhGycx9o+ACw
X-Gm-Gg: ASbGnctFZiP9bOW/r4ZgNcxvGiILa6MNw8ZNAfyVo8iJIXVu24/Ir5ig/1bpNbspXdH
	EZf3vxodjtUQmZRy7x+xDrwOgvgt6Q76PLsh4uJbOyoRIMcDrmbyowxEK5oOBZMQ+d6h5trktEk
	S4RkpRgekty1dHDgQmuMH9pU/DoY4ksTdLVpQI5shzATkRgXDID84s977oF8MXeog4BaJ7RJrBN
	0VUadDz+HSGohY9Sh0Gpil5NLh88DRPxP4HsVsjoXil7b1MHfyNSqdsz1Jl8YTeeuMoiHDt0Rxr
	nm5oytn99ZNN8v8y3QN366WhCgo1I98D
X-Google-Smtp-Source: AGHT+IEzKd1nJ1RbjyX/pLcyIERfDsC9o7485T4tCdeXO1hTSXqN9RZaOoGEQuwfhqdQJXneVwEtqA==
X-Received: by 2002:a05:6102:14aa:b0:4af:c5c8:bb4c with SMTP id ada2fe7eead31-4b690c77448mr9657457137.16.1737362523530;
        Mon, 20 Jan 2025 00:42:03 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a318cfesm1664588137.21.2025.01.20.00.42.03
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 00:42:03 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso2441361241.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 00:42:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSvibyBeJZhLcWcGS7wrih4bDklm50K2mPMn/6Rm7K/keorEYoSn1dtbkQWfjBe75HOcrT4zNCrnScD0ih@lists.linux.dev
X-Received: by 2002:a05:6102:f97:b0:4b4:27dc:ffe3 with SMTP id
 ada2fe7eead31-4b69099e6f9mr9946198137.0.1737362523176; Mon, 20 Jan 2025
 00:42:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501200756.HycDH8wZ-lkp@intel.com> <55f6f8ec-48bf-4d0e-ab74-b5bc7c9a7f56@mailbox.org>
In-Reply-To: <55f6f8ec-48bf-4d0e-ab74-b5bc7c9a7f56@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jan 2025 09:41:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-hp9q_vGsbxwy1s6__Y8BoCQbPAzpzAojM9s0QNaRrg@mail.gmail.com>
X-Gm-Features: AbW1kvZ8kECBPfivR-VOLrhAZPBoA-FmCdqwmrtY4Eeb05qipEeYCA2oas9AckY
Message-ID: <CAMuHMdW-hp9q_vGsbxwy1s6__Y8BoCQbPAzpzAojM9s0QNaRrg@mail.gmail.com>
Subject: Re: drivers/clk/clk-renesas-pcie.c:178:31: warning: '%d' directive
 output may be truncated writing between 1 and 4 bytes into a region of size 2
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 8:19=E2=80=AFAM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
> On 1/20/25 12:45 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   9528d418de4d83c7ada69314ddd8d4427b1f703a
> > commit: cd9a5c97dfdaeb9c8ac02e14d7ccbd445e8b5265 clk: rs9: Replace mode=
l check with bitshift from chip data
> > date:   1 year, 1 month ago
> > config: s390-randconfig-r111-20250120 (https://download.01.org/0day-ci/=
archive/20250120/202501200756.HycDH8wZ-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 14.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20250120/2025012007=
56.HycDH8wZ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501200756.HycDH8wZ-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >     drivers/clk/clk-renesas-pcie.c: In function 'rs9_probe':
> >>> drivers/clk/clk-renesas-pcie.c:178:31: warning: '%d' directive output=
 may be truncated writing between 1 and 4 bytes into a region of size 2 [-W=
format-truncation=3D]
> >       178 |         snprintf(name, 5, "DIF%d", idx);
> >           |                               ^~
> >     In function 'rs9_get_output_config',
> >         inlined from 'rs9_probe' at drivers/clk/clk-renesas-pcie.c:305:=
9:
> >     drivers/clk/clk-renesas-pcie.c:178:27: note: directive argument in =
the range [-250, 63]

I'm wondering how the compiler arrives at this range?

> >       178 |         snprintf(name, 5, "DIF%d", idx);
> >           |                           ^~~~~~~
> >     drivers/clk/clk-renesas-pcie.c:178:9: note: 'snprintf' output betwe=
en 5 and 8 bytes into a destination of size 5
> >       178 |         snprintf(name, 5, "DIF%d", idx);
> >           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> I can extend the name variable to length 8 to mitigate this warning, but
> there is some 8 DIF outputs maximum on this hardware, so it is known
> this %d field would not be longer than 1 decimal number. Shall I send
> such a patch ?

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
