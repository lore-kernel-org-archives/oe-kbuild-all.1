Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F06F06E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718626763; cv=none; b=F6Ev092faDpDoxjQltoxPp+5rZ1AmtKFwT/RGmnZzgJHYJsRtpHYXIrPuQ0a1b6twxei9tLPHJCjlrOeUoXDYqJSNqN/iENs1t9E+weP1S01HGPeR3zlMUwHvsyLeko4A25GfqJQLiFXag6FBBnhSwCakhulHiI69y+r0worW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718626763; c=relaxed/simple;
	bh=xzhvDkEpDZrgRThMoaFSSMxMV4Dp4LP6yDwE0eNMl/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZOzRGRfy8kDdHyz5VA6GzxAVen9nHAq4MDqqf6g+0R6bKNQuuVYMxGl+3eLjaFyCa60vyx3/9vGHjdHkTWBV7yYV3cdev2dMOQcFN3cCuBIovtHgEITuXSj8TFBLFpbhu/ca436WZ1nfK5G+XHRSy2zyt0riClV7LJO/UntXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-632597a42b4so21321257b3.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 05:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718626760; x=1719231560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HNNvRS4bV8hMNb+Fj9cM3FroLQToBVMjslpHHwlSo4=;
        b=M0p1/zra0tkc5cT0NUid5KuFgtYRPXiICKaHiPsECwSYg6oLwIwA32Hg9x37hQ1v83
         6NxpC5Lvf2gaU+7NAWjCDUyg47/lM9wdVrvYnTLXUefmIUwOiPyln1pUciCgXW/cQRdz
         RwX8LoLGP55BGZxdlrepVMTx14Veop0EDDUmFuZZFSn8uB4MIGa3+4m4SZJsIPzuVwHM
         yXDjXGlrVrGCrr8gdbBeYz81EXSGi+kGYgt9ZdWente+pG4uCOuSLC9Jd92UAI21LZu0
         NBte55flI4BGYUvKPsgJQf03DrIIggROVhj9l4vXOLNMgMd3ZoJqOoB/SUiGqy1se4jk
         ZX5g==
X-Forwarded-Encrypted: i=1; AJvYcCVZmksXki8ADLHR5NW6cmdeAGOX+3Xe0IFSZjBgY4j94+qSLeL3Qb+64u5qZPqkkLEBaGVAo5LgXoFX4aad449XazAbm0iopwj0rde9HA==
X-Gm-Message-State: AOJu0YwzntDlXiK6WACp1Mfvgud3E+IL6bH2IHguZDmmBGD6Wy6/0JTy
	4tajD+2A9T9IZ4KHasLgncphIAmDu5J44mE/25kL7g/FjT0MxRM8WQHAgbZs
X-Google-Smtp-Source: AGHT+IFkfyeQ2Czz0K7P/YXmbeDFlTRgqXcQ/STFOxLQ4cHHm8+eOQObVfYBcULYGcTfzz/AKikHWA==
X-Received: by 2002:a81:a906:0:b0:631:5204:ca08 with SMTP id 00721157ae682-63205fe3cf5mr58030707b3.16.1718626758546;
        Mon, 17 Jun 2024 05:19:18 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63118e99735sm13813907b3.68.2024.06.17.05.19.18
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:19:18 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso3181768276.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 05:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbYNwhbDnybmw3CcWVIllt8ugWmF5fL0m8ZOjibGS8mXpjHXpaJUCTy3SsoSzuZxM4t0JPLkDfUy8aaCh9hpBVrAjroLrbEuzTEQo+aQ==
X-Received: by 2002:a25:ae9d:0:b0:dfd:a57a:7317 with SMTP id
 3f1490d57ef6-dfefec05f90mr7752620276.9.1718626757882; Mon, 17 Jun 2024
 05:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406171924.M6q32pv6-lkp@intel.com>
In-Reply-To: <202406171924.M6q32pv6-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 14:19:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXocnjMw67acsehOpZKXSrCE6ci1-Z3wgNQrBRH_TeTYQ@mail.gmail.com>
Message-ID: <CAMuHMdXocnjMw67acsehOpZKXSrCE6ci1-Z3wgNQrBRH_TeTYQ@mail.gmail.com>
Subject: Re: [morimoto:renesas-bsp/v6.1.94-2024-06-17 52/661]
 drivers/iommu/ipmmu-vmsa.c:485:undefined reference to `free_io_pgtable_ops'
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 1:24=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-17
> head:   6ce189abfade2a17cc6b84c39ec1d82e4be871b2
> commit: d623e64054303ef67c85496510b46687497508ab [52/661] riscv: Kconfig.=
socs: Add ARCH_RENESAS kconfig option
> config: riscv-randconfig-002-20240617 (https://download.01.org/0day-ci/ar=
chive/20240617/202406171924.M6q32pv6-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240617/202406171924.M6q32pv6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406171924.M6q32pv6-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domai=
n_destroy_context':
> >> drivers/iommu/ipmmu-vmsa.c:485:(.text+0x98e): undefined reference to `=
free_io_pgtable_ops'
>    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domai=
n_allocate_context':
> >> drivers/iommu/ipmmu-vmsa.c:342:(.text+0xf5e): undefined reference to `=
alloc_io_pgtable_ops'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>    Depends on [n]: IOMMU_SUPPORT [=3Dy] && (ARM || ARM64 || COMPILE_TEST =
[=3Dn] && !GENERIC_ATOMIC64 [=3Dn])
>    Selected by [y]:
>    - IPMMU_VMSA [=3Dy] && IOMMU_SUPPORT [=3Dy] && (ARCH_RENESAS [=3Dy] ||=
 COMPILE_TEST [=3Dn] && !GENERIC_ATOMIC64 [=3Dn])

Missing backport of commit e332003bb216a9f9 ("iommu: Make IPMMU_VMSA
dependencies more strict").

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
