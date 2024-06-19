Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D266D558BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 06:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718780064; cv=none; b=XnvvPuP/GxjeJl9pyO+OmsdQEJ7s/Np40ljQEtqzw9diZMdwLOfTvyhQ9wNUsn1NpOfmppAdS4HRGtAMVXWpQlR9LAAQBHxyxlae7FkUpctrDC16R4zHiDFCWi4KFNkz/LktyH3Rq7f6wpgsUCFYZt37ljy+cx0dtSf0Xlplc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718780064; c=relaxed/simple;
	bh=Sx2UXOz0oyl+MsN9FuifoeeuLfPHUUwKdiPA21nFUNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHN2O4vw421CK8jA52iEm39dI2vGR/B0VAcYfzxxEy6eDdOmwgNyihkc2Rggn1JPwRLdiEeGxEkBZ5B78aehWo2Xxigd5tUlUWlYrn3067BmQUv2TS+xgRNADbVY0PrVxCG+esULRGRXShg9ulQA8pl509cdQGtaP1ZZiF7RCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-62a2424ecb8so69263287b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 23:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718780060; x=1719384860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2D9BRYYxrpNCLmFabRquCtCYqyuJXZUuWMiaC25V2Ng=;
        b=reKCdfX/J5vw6GFy9a5U4W0eWUUdfB7BOTOHFDfil0t2Qo47Rb0FOufH3oQ8xsItw7
         4WM85gpyG7DrJ4aPhxqqkvy1izcznYNgDjkpnPQfna7oRGE8pbwYQGKnK4SFOliNNxTz
         zaZoNC362ZXZmFs6lt+5IVMsJb310YHotVsVfxc0Yx6aV7EZVYTxQcab313CZPnknbCr
         u5woUEf/vT3+QF0c1OuCUG43zPd92TeVEY3SC1vqHGa4aLTR6MQyYSq9I/NuFTT1vBtK
         BMK0d3X0GRe45hwcD0JS6DmZs5pCvm7hKLs9iTbeXqKCcfPUYgJAqZ2S8vn253pAouh5
         0pfg==
X-Forwarded-Encrypted: i=1; AJvYcCU/j0dAyb+9wjyVnIb8ZTX+HRDM3FBeurf8QGpKbuO/U8lMyJ/l562QlQy3wHX02Mkx11SauQOmpgCErNZo5qEeDUpsrUEZhPrwcqm7zQ==
X-Gm-Message-State: AOJu0Yy5OceY2Au4BziR8WPfHI3HdOvAxPZOGrq0RZn4z9trvDHKnD0N
	dvzJ1Qz9jJuw/qMC1g6iY/4zsXfreR1JOdp4D9z1jM38iAFfnS9TjSZS72DN
X-Google-Smtp-Source: AGHT+IGc7PMFiPj//kf89yP5BSmsYJSaYSr5ySRg6hK/QY1ntwYOGf/s8Tu3Y6/NyOQ/cZ290m+x1A==
X-Received: by 2002:a0d:d505:0:b0:630:2749:2f52 with SMTP id 00721157ae682-63a8db0f86amr17436747b3.5.1718780060406;
        Tue, 18 Jun 2024 23:54:20 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63118da456fsm20189797b3.56.2024.06.18.23.54.20
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 23:54:20 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62a2424ecb8so69263107b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 23:54:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqztz57kychtpgszyHASjf9YiFzdHNuzOECm5RHWe04XJ2Xt9Dl3qzAtFVJh64ChukLvLP8fUwfnpTMjXd5zoRiNZfoyDo5si9TR4MzQ==
X-Received: by 2002:a0d:dac4:0:b0:62c:f82b:553f with SMTP id
 00721157ae682-63a8e7a4468mr18412857b3.31.1718780059989; Tue, 18 Jun 2024
 23:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406190324.USkOEaOU-lkp@intel.com>
In-Reply-To: <202406190324.USkOEaOU-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jun 2024 08:54:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZW1FQmBBzaJvgGANyAEQ-PJni9_qKsn4BgzvvBLJtEQ@mail.gmail.com>
Message-ID: <CAMuHMdXZW1FQmBBzaJvgGANyAEQ-PJni9_qKsn4BgzvvBLJtEQ@mail.gmail.com>
Subject: Re: [morimoto:renesas-bsp/v6.1.94-2024-06-18-2 76/663]
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/phy@e6444000: failed to
 match any schema with compatible: ['renesas,r8a779f0-ether-serdes']
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, oe-kbuild-all@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Tue, Jun 18, 2024 at 9:49=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-18-=
2
> head:   5e7236cba4333897587247b8cb1c26e5e90fb4c0
> commit: 05caf0cfd7ff4ee1f78c5a4810ec40891a970cc4 [76/663] arm64: dts: ren=
esas: r8a779f0: Add Ethernet Switch and SERDES nodes
> config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/ar=
chive/20240619/202406190324.USkOEaOU-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240619/202406190324.USkOEaOU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406190324.USkOEaOU-lkp=
@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/phy@e6444000: fa=
iled to match any schema with compatible: ['renesas,r8a779f0-ether-serdes']
> >> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: /soc/ethernet@e688000=
0: failed to match any schema with compatible: ['renesas,r8a779f0-ether-swi=
tch']
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Missing backports (from v6.2):

d7abac084536b6d7 dt-bindings: phy: renesas: Document Renesas Ethernet SERDE=
S
f9edd82774c0c8dd dt-bindings: net: renesas: Document Renesas Ethernet Switc=
h

Upstream also has a few more changes to drivers/net/ethernet/renesas/rswitc=
h.c
and drivers/phy/renesas/r8a779f0-ether-serdes.c you may want to backport.

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
