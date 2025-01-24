Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008D166F32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737708066; cv=none; b=aScA42M4FCV/LRUh7ZhMakaw6XqiIECoQNg0BLPrCV80n9YjypiG9na425pXL+gaHEyDVLeL6Ojb4daHBCDSjbwCBecKU5uyvgapspiZsX+YXZVUaJBFFAkLukfdNTY4K+Zi0GJxz/SMdmVrfDPVhh62vqdoaq9le+q2oy4uGHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737708066; c=relaxed/simple;
	bh=yTEhmrd7q8uhCnNcQMgzTpcT6bnmYSI7LKzH8cxdo9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXtpGdSB47TI216VlvwM0M0DFNzPUYCVsJgI4/fkhGAkE9Er4oVimZjj0V9ODuVPE02mlDL5UfCXeuK/+WS7bJ7yuVT5n9XUodPC6KJa9c/9oLx2Ah8yEfSzGe5SmjZIraPUdYVuR6EErAYGdRMhiew+N0HcxYhkXS7K79V2q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so484656241.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 00:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737708062; x=1738312862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWUI4a/iKijMy690fG92u2fVqzWDkOQYravo4+In6go=;
        b=q2yrhIbioZcjL9+zPNJ7WOVSdcTXqlftlqAnbZvvmrVmtJL7ZPzGgI1NqSvM/aZ3rS
         SoitN9YpOEPswEODuLTIcxq5hnJYNlCSzet/OL7eUvSF1w7sBet/KO0va91swQ0u149K
         JfKU84lvucuK6uAsb9RvEYfdmiuCbACCA6XNAqtwyJUwig1AdMcmuGZjlKuzGXX/qihe
         SgUmuA+/pF1r4K+sdJniFCc2lQ5xU6/uwqRysvu8mtlxmNXmQL4Un/IiZKsLccaWuY+b
         mYgorj0chR3KfLwf6ivkdzWmfFGKm50vbtGnVs/gwQQrXb5LP2LkoqXm4383YsY+AsMZ
         EhkA==
X-Forwarded-Encrypted: i=1; AJvYcCUM+jrfJ1i4xqenqljS3/Oqf1BkbVXmWPNAhPzZ71Dym8CvVGLR7gD5fSgPxW+iQ6gs3CbrJIXAqOgCtr7Z@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo5D31Y9qzSw5OLs4Q5knEcMJ4rJXOBCZ/zilsRtildWHVyS49
	CUrzeZmyVAkAdP5AgYoi51HLR8ZsNXMC2QLM4CQa0qEt5fXPcB9FiWUibcNF
X-Gm-Gg: ASbGncsZnrITORRUD5DJQB1qBAevHIS6woDB8syQbjRmuKzBW0KCCwPKfhb0lBa87cw
	ITDGvlvV9ZQ6HLqzWu9bAjdK2IwQAdAbMzyc6FalLQR8yy/gCZa3+S//ILhQ7T1M6EsYcc3Ati3
	2WAPN2ayvDBOL8lRdh4Pc7jO2zQPVOW6iY1wd7EDZQ/aps7Mvpttp/U/XWvARIpiPFT21KII7qT
	yyN51z6ETxm6Fx8CBxrLUlgaST4VKrQUFwBLRm3sz3/UL1Lh2GawR4riXZK25omrN8Uwv6u3FIZ
	sKOWFAh9Iy9h2CNa/Lorabhcxhn+HO/D6Kh/cAz6W+c=
X-Google-Smtp-Source: AGHT+IESCIEkPf+0JQt9r++w4d+3etwnTpXuhFaDyTKuGVT+sZNULVje+CNXFZQ1mbCQz8F6ZI32Dw==
X-Received: by 2002:a05:6102:3ec8:b0:4b2:49ff:9786 with SMTP id ada2fe7eead31-4b690cdd7f6mr25893480137.17.1737708062111;
        Fri, 24 Jan 2025 00:41:02 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b7097b4bb5sm320462137.12.2025.01.24.00.41.01
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 00:41:01 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afd56903b7so511033137.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 00:41:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIa80FyqCeeO/7ySPdVRmircJ+hL1fINdg6mAcDa2jiN8LC29TTPcpd6cY4WBFd+DgnvpXpCteCpP+2Yl7@lists.linux.dev
X-Received: by 2002:a05:6102:3ec9:b0:4b1:1b24:7241 with SMTP id
 ada2fe7eead31-4b690c3a394mr24735063137.15.1737708061521; Fri, 24 Jan 2025
 00:41:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501240836.OvXqmANX-lkp@intel.com>
In-Reply-To: <202501240836.OvXqmANX-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 09:40:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkK4vuM+HtEUfGqzSDB16rzn_oKq7hcyFnxwUWt5zEog@mail.gmail.com>
X-Gm-Features: AWEUYZlSmR-zvC1YHQLEGAwqIWzHsnWAMz8656O70UU6HmRWOQUWN7vg_xRkWug
Message-ID: <CAMuHMdVkK4vuM+HtEUfGqzSDB16rzn_oKq7hcyFnxwUWt5zEog@mail.gmail.com>
Subject: Re: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_DA7210 when selected by SH_ECOVEC
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 2:09=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8883957b3c9de2087fb6cf9691c1188cccf1ac9c
> commit: ce0c97f8a2936d05951da7093b881c8eaaee72e0 ASoC: Fix SND_SOC_ALL_CO=
DECS imply SPI fallout
> date:   4 years, 11 months ago
> config: sh-kismet-CONFIG_SND_SOC_DA7210-CONFIG_SH_ECOVEC-0-0 (https://dow=
nload.01.org/0day-ci/archive/20250124/202501240836.OvXqmANX-lkp@intel.com/c=
onfig)
> reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240836=
.OvXqmANX-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501240836.OvXqmANX-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for SND_SOC_DA7210=
 when selected by SH_ECOVEC
>    WARNING: unmet direct dependencies detected for SND_SOC_DA7210
>      Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy]=
 && I2C [=3Dn]
>      Selected by [y]:
>      - SH_ECOVEC [=3Dy] && CPU_SUBTYPE_SH7724 [=3Dy] && SND_SIMPLE_CARD [=
=3Dy]
>
>    WARNING: unmet direct dependencies detected for SND_SOC_AK4642
>      Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy]=
 && I2C [=3Dn]
>      Selected by [y]:
>      - SH_7724_SOLUTION_ENGINE [=3Dy] && CPU_SUBTYPE_SH7724 [=3Dy] && SND=
_SIMPLE_CARD [=3Dy]

Thanks, I have submitted a fix
https://lore.kernel.org/8329d88cecc1e419f6a0f3f215695d3cfcb549aa.1737707880=
.git.geert+renesas@glider.be

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
