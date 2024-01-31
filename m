Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD865C61C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689660; cv=none; b=hz6hTl0dwI8ZurC2xjRGPNqLuxdRatvzqdXRM1GYviLmkk4TDf8zJejgnvqCKRtt05OOJVqle9gr8z4szYfxNGi5A1oXK8VJPhC4sO06B1NxFnQww0dJQ0t/ZtM8jFay5vJRLWqUQ+ieJL0sP+BRGtdMa+4KGstrkrmWSyP8ebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689660; c=relaxed/simple;
	bh=StKMTjMo8nFlRMhyV9QAB9j1UM5UCl2FSEFKd5yo4KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R276Go1Pd0Otl/mqoFlFFKN7CaLo+TWKkBhgIR1DBSfBVelvTW/Hk/mm6Rab1/+cZn0imuPua6UfN/k9PUDTPjwDed2pZ9mn73ce3pRoxB92ebKgBRy9Rqh9HheGjNOLEvmxvtRKUG1KsbTOxjCILdzCCyMbxGFqkMElhi2MmG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6041012c81fso1396337b3.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 00:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706689656; x=1707294456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KUbzwx5inbEAVx61I1uoDNdxpZRyQEjPFWJW8yDq54=;
        b=XhIxIzEl8g6W63mZ++xDyOQzaadprUJP/vkOxShlkSEas1HRzBnHhU4FejzNmxCRPD
         dJyG1usMClV/U6qgwNg535kPjVTVjVS6UfedafVFzsi84/2Jt8DOC0pQk8c8FnDVFqPF
         1NhML5G3BDPWtU2V+M4OAnYMIi2QFp1kiDzJXyFo5lqlog7GkQ4D1OHwUQwlKmG91bAs
         4LpF4xYzYXjqCm711kjdKgBuNg34InBzgwj5X9ma9fsBg0SXFQ20tQDblUMGYYzKpxa9
         3PCrRNAgJfVaPoDDkmKhCPXX8LEnJIcvAp9LLTZ8dgKhT9bNS2MTIvcc+k9jsTg7QhYB
         qqog==
X-Gm-Message-State: AOJu0Ywzhvsa6GUfTNuZalYzYKQqtN5vlzj+vdOzAXQO0sLKg5zkxWuv
	9INdyyJrOu5Rxzkg7v7Q0X2btnLa7XdjCp1N6OwsjH+tJvjuM+zSpLq3LDzi/fQ=
X-Google-Smtp-Source: AGHT+IGPs2+A1c75PKx1Ip5Zlawl8a28Yw2a9ZwUqi8OrXAEFlzmoSskqyoWCfnI5mLjbJDtN054UQ==
X-Received: by 2002:a0d:d6c1:0:b0:5ff:6084:421e with SMTP id y184-20020a0dd6c1000000b005ff6084421emr725871ywd.32.1706689656261;
        Wed, 31 Jan 2024 00:27:36 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id u200-20020a0debd1000000b00602b23c8e8fsm3739744ywe.135.2024.01.31.00.27.34
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:27:35 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6041012c81fso1395907b3.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 00:27:34 -0800 (PST)
X-Received: by 2002:a81:b3c1:0:b0:5ff:aa34:7c5f with SMTP id
 r184-20020a81b3c1000000b005ffaa347c5fmr680994ywh.46.1706689654682; Wed, 31
 Jan 2024 00:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401302324.d3o6tgup-lkp@intel.com> <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com> <8cfa0192-769a-6ef0-4b59-bcfd0eb43453@gmail.com>
In-Reply-To: <8cfa0192-769a-6ef0-4b59-bcfd0eb43453@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jan 2024 09:27:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhjCJqOpLA1VYMCLDrXVkhV6qBJzUOMVA324-UyfUxSQ@mail.gmail.com>
Message-ID: <CAMuHMdVhjCJqOpLA1VYMCLDrXVkhV6qBJzUOMVA324-UyfUxSQ@mail.gmail.com>
Subject: Re: [cip:linux-4.4.y-st-rc 878/1809] arch/m68k/kernel/traps.c:32:10:
 fatal error: linux/extable.h: No such file or directory
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Ulrich Hecht <uli+cip@fpond.eu>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, Jan 30, 2024 at 9:16=E2=80=AFPM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> On 31/01/24 09:10, Michael Schmitz wrote:
> > On 31/01/24 04:26, Geert Uytterhoeven wrote:
> >> On Tue, Jan 30, 2024 at 4:23=E2=80=AFPM kernel test robot <lkp@intel.c=
om> wrote:
> >>> tree:
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git
> >>> linux-4.4.y-st-rc
> >>> head:   4daf8df4558b5aae717516f7e941014c463772c2
> >>> commit: 193e83a8194fcb23b6fb4aea9518a67b786df1c5 [878/1809] m68k:
> >>> Only force 030 bus error if PC not in exception table
> >>> config: m68k-allnoconfig
> >>> (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tg=
up-lkp@intel.com/config)
> >>> compiler: m68k-linux-gcc (GCC) 7.5.0
> >>> reproduce (this is a W=3D1 build):
> >>> (https://download.01.org/0day-ci/archive/20240130/202401302324.d3o6tg=
up-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new
> >>> version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes:
> >>> https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp@intel=
.com/
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>>> arch/m68k/kernel/traps.c:32:10: fatal error: linux/extable.h: No
> >>>>> such file or directory
> >>>      #include <linux/extable.h>
> >>>               ^~~~~~~~~~~~~~~~~
> >>>     compilation terminated.
> >> Either include <linux/module.h> instead, or backport commit
> >> 0ef7653797addea8 ("exceptions: fork exception table content from
> >> module.h into extable.h") in v4.8?
> >
> > The latter, for preference. Thanks for spotting that. Where would I
> > send such a patch?
>
> On second thought - backporting that commit would break anything in 4.4
> that includes module.h for exception table stuff.

Why? <linux/module.h> still includes the new <linux/extable.h>, so
existing users of <linux/module.h.> should be fine.

Plain v4.4 + these two commits seems to build fine for me (modulo
the issues due to my cross-compiler being too new for v4.4 ;-).

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
