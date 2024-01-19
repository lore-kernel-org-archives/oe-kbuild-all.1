Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D951C4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 14:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705672940; cv=none; b=byBSv0061gDvRAd6hl1aYciSzD7+3ZSePaoKZeoRe0/yHAciIxQnUYQXtduBmV+dnfVur5R6J1FI1m8HTDC5CoZj6CYsiZvZo65zEgTnz6v+bz5JeNIoSiJwMsZDal9bKtNvUnT4P2+aNQX+r6a49WVh5jSRqjTtopkl8OTA39g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705672940; c=relaxed/simple;
	bh=NBWhqZpL3bnUQx+gDX3WOHPAsmG8A+ayw581UpQYjkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRmWBeXqsFGF2Oe/kyFKduj77f7EzGRwrRxre4AwgfTnf4LNSYbQQKBk+1e/5ZF6B4TH3mOvHGiSe2LcFN6uMVSJ3t1tpsF7vfl2al0fY3cSjaJz00eeoIYEIZUbRTkSX7TesChO2yTDEw42X7I10RuQD3B8xmvP0xcFrLttHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ff45c65e60so6865447b3.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 06:02:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672937; x=1706277737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPmOnRQasptCicfyYxyrzQK4txgf1yyc2TzPZ7CJsy0=;
        b=Taf1CH/iOS/iOp87tbGVC/Lr4hsWja82PLBew/LnZVDO0Fxgn1uOzdw70uS0+/LFsB
         /ZTtUTzFeTAvtenacSk5Dt16WWtMrq93PU2zBFpd1BBL3jdsQD9KWFrIRu77urpgubdZ
         P3ViewAH3Ao0oJtmaA75pWtEyYoWADP7/1i2ZdDlF4ru0nSQU7XsAP3A3ub015JJH6zK
         ZZQdblFHC1awQd6r9sj9quziMBNhyp9snE+KN1DjM5LHie3uG2IZUJ99sO6At+hhjvk+
         EQ95TGzZk4LlG0KRDrxb2L5tgsQLn+Rk1y9uIxZtXXVNtE4djhMkHzvGPHplE+77vlev
         cHog==
X-Gm-Message-State: AOJu0Yyp3CAhFUlsN47lorv5wwpkpC9VApcmtzq62qQ5CDQpcV4y98Lf
	AgUnRVNfoaaT/qJ2aOJfijw5x2pBSDNhvefdpWTkmFn9dhYtxMoUI6kBiUPrMYk=
X-Google-Smtp-Source: AGHT+IHhCubBxeMlmr7ndt1i98he07UF0LRkBAEvulEQ8iRQB/z/AjKsdvWA7Xsg+QGQDIPLBc52Fw==
X-Received: by 2002:a81:7706:0:b0:5ff:8156:6c16 with SMTP id s6-20020a817706000000b005ff81566c16mr2253943ywc.67.1705672937225;
        Fri, 19 Jan 2024 06:02:17 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id w131-20020a814989000000b005ff826f142fsm1492776ywa.92.2024.01.19.06.02.16
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 06:02:17 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5e54d40cca2so6307227b3.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 06:02:16 -0800 (PST)
X-Received: by 2002:a0d:cc10:0:b0:5f4:8b0c:dff6 with SMTP id
 o16-20020a0dcc10000000b005f48b0cdff6mr1946059ywd.83.1705672936598; Fri, 19
 Jan 2024 06:02:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401192114.sNB5eWkI-lkp@intel.com>
In-Reply-To: <202401192114.sNB5eWkI-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2024 15:02:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXuMChWnnEOh=8k-Q9yK9g7b17-Qb6x0FdR3dP3hNp3PQ@mail.gmail.com>
Message-ID: <CAMuHMdXuMChWnnEOh=8k-Q9yK9g7b17-Qb6x0FdR3dP3hNp3PQ@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:topic/renesas-bsp-rebase-v6.1 17/22]
 drivers/net/can/rcar/rcar_canfd.c:1852:59: sparse: sparse: Using plain
 integer as NULL pointer
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	Simon Horman <simon.horman@corigine.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kernel Test Robot,

On Fri, Jan 19, 2024 at 2:21=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git topic/renesas-bsp-rebase-v6.1
> head:   f23d103b0a307c5339994c410f09ac77b374629a
> commit: a7e448b5460131be0eab090896030c6259b32375 [17/22] can: rcar_canfd:=
 Add transceiver support
> config: powerpc-randconfig-r113-20240119 (https://download.01.org/0day-ci=
/archive/20240119/202401192114.sNB5eWkI-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240119/202401192114=
.sNB5eWkI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401192114.sNB5eWkI-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/net/can/rcar/rcar_canfd.c:1852:59: sparse: sparse: Using plain=
 integer as NULL pointer

Thanks for your report!

> vim +1852 drivers/net/can/rcar/rcar_canfd.c
>
>   1849
>   1850  static int rcar_canfd_probe(struct platform_device *pdev)
>   1851  {
> > 1852          struct phy *transceivers[RCANFD_NUM_CHANNELS] =3D { 0, };

This is fixed by commit 8e85d550c127d8c5 ("can: rcar_canfd:
rcar_canfd_probe(): fix plain integer in transceivers[] init") in
v6.4-rc1 and later.

As this issue was reported in an old stale branch, I removed that branch.

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
