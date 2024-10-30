Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE91E0E03
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730278209; cv=none; b=CTLrQ3BDf4urtVOybMYBwjkPdPJ9DGeHScOREk5aEzuoXatiNxqv3waeLe+TWt0FBK2BBzdz1nMWkvKIBqP6b7kRC8+9nk+o1S6alFMoixOObqa3T/LLl1615hvc5vHKm6VDU4BrIHsKjMuTWO3zIdpSMwsLp4sT5Yre+sr2s3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730278209; c=relaxed/simple;
	bh=Rmq6ydEUF+ADbzBqVsJtGh5i8NVxc6PoYT1PSL4+70k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5OFubUyyAk2wbtIqxQHjKue+qI/XHNPy9umyA2sf/3POPL+PXXPCAL9PMaRtMT5jkQOynnn1MyKPNGyTApFu79pi3m9OuaHqR0K6vSeO9ZtLvjzaJp68xjJjPFCB4P1slm2NM3MDWi6jZhzLUUlvWI8Iz2TWMuoYQqss+szeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38ebcc0abso75448477b3.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 01:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730278204; x=1730883004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86eFSFUck4/KuoLg5PWtf7IRQRYkzza8NNRm4idPt/0=;
        b=otoaRpY7U+CCpeZFlvSekyQoyZZKpAP6Sy2Rfl/0NsDUcKGTWzSJIySeTCl7yUKs53
         mQCfTFiwoNG5WHAscDNf3KAY2g6H3mIJ8UMc5bsTcKzKgqGWanafU1BJPsQ+x0DxHZ1G
         wFU62M9QjZd/FyzdpBYLDw1v67QpUn/lILf5lDAL+Wrt53aM+yevQcJ9bCnN7vmYfOe3
         gKf21rQ/YPeWnegdyK/uhKWxqROd0b9n5Fpc7Ve966LdrPS0bzvRg78zTqyWTw5Hydel
         kk9yLMNZKEbG1TQCbSUN6PKWl0BuvOSYovdoRZTHGyhD07llZ0zemzjuDml1L0fPvzIo
         fXGw==
X-Forwarded-Encrypted: i=1; AJvYcCWDyMndeSiO2QVTo4pUa0/M3i5tpADKUwahd2ywJ5B/Ni0EQEhh+zUg/Yg4Uz/VPdbz09c/ewwYJFOZpKuQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzBSnlK7/zt+l6255fED1Zj/ZyaQAMte2gT+LwqVQJUGjLnhmjk
	CfVpylSZJDvDfmIy3lxbaMfR1xLJij82W8o7hwzl6ZFAqbozdyzFz6UndoLu
X-Google-Smtp-Source: AGHT+IFd/6PDkh6Q+gUqt1bz7ATi1hDlKHZeybtz8FRY5oeRVJ4fl/edMnGPOu7Ghl23P3VaQT6pPA==
X-Received: by 2002:a05:690c:10c:b0:6dd:cdb9:cf2a with SMTP id 00721157ae682-6e9d88d04dcmr136631377b3.1.1730278204478;
        Wed, 30 Oct 2024 01:50:04 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c97b27sm23454237b3.115.2024.10.30.01.50.04
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 01:50:04 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5fadb5e23so57153847b3.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 01:50:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFshCkmwAVFYlPnIHWKJZAzROS0pZydD6L9fJFi+yJRWuRHUyup47FBrDMcLfkpm2UJaz/E8sNAMxillAY@lists.linux.dev
X-Received: by 2002:a05:690c:f15:b0:6e7:f98e:12dc with SMTP id
 00721157ae682-6e9d88cf8cfmr143305437b3.9.1730278203924; Wed, 30 Oct 2024
 01:50:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410290639.TBG289SO-lkp@intel.com> <87ttcuzjy7.ffs@tglx> <1d6a10ca-3d86-452a-bdba-03a1204dd232@app.fastmail.com>
In-Reply-To: <1d6a10ca-3d86-452a-bdba-03a1204dd232@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Oct 2024 09:49:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAdV5Qv1AXKqLGi4xoM=9uiygSDKqhLnZ5YxzXsN6SxA@mail.gmail.com>
Message-ID: <CAMuHMdUAdV5Qv1AXKqLGi4xoM=9uiygSDKqhLnZ5YxzXsN6SxA@mail.gmail.com>
Subject: Re: [tip:timers/vdso 11/13] include/vdso/page.h:15:39: error:
 'CONFIG_PAGE_SHIFT' undeclared here (not in a function); did you mean 'CONFIG_LOG_BUF_SHIFT'?
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, Oct 29, 2024 at 11:05=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Tue, Oct 29, 2024, at 21:18, Thomas Gleixner wrote:
> > On Tue, Oct 29 2024 at 06:38, kernel test robot wrote:
> > That's actually not the culprit. The problem exists in mainline too. Th=
e
> > actual root cause is:
> >
> >   5394f1e9b687 ("arch: define CONFIG_PAGE_SIZE_*KB on all architectures=
")
> >
> > The config has no CONFIG_PAGE_SHIFT because nothing selects a page size=
. The
> > the original code had:
> >
> > if defined(CONFIG_SUN3) || defined(CONFIG_COLDFIRE)
> > #define PAGE_SHIFT     13
> > #else
> > #define PAGE_SHIFT     12
> > #endif
> >
> > But the Kconfig magic changes made this depend on various other things.
> >
> > The patch below cures it, but it needs an eyeball from Geert.
>
> I have previously suggested a similar but more extensive patch
> to address the problem:
>
> https://lore.kernel.org/all/CAMuHMdVC-FUSA5C9aNrvP3=3DRaRWrchhUEC5UYcSGMz=
_ep1PEhg@mail.gmail.com/
>
> I can rebase that one if Geert still wants it. I think I sent

I am still interested ;-)

> an updated version somewhere but can't find it now.

AFAIK you haven't, so there are still outstanding review comments on
the last version you sent...
Thanks!

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
