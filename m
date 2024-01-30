Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3481AA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628433; cv=none; b=LTLBbeYusbDwv4/SsL40XvEGnXqZ0WJlKodcO+bvseI0ouHgtFwG6psTY1X3fU+lm/4GikB+QOMvB5D9s1jYinLb6bvTZZAvkx6iM1EmBSuZmy0nf9DBH1sGF7jU1OjjVkCYw6zXhdX5javo3+PY1G2Uww8Opk++0XTOpUWmEus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628433; c=relaxed/simple;
	bh=u8jCyMPbt7+jtcBEC/HMPvoQ3JLqD6oDD/PjKKgWE0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VScj6o+mclrlK9EoFu3k0heIL0N2pcB37iZTWyNVyl7EsMQoOVcB580HLd+U5dxF0JFq9Bd/SBHA4GnboD2b2SAqd4l0Zd1EGKSLJJDn08OXL4oAu/MwJ3+kYs1dZkHmNCc5smb1hynF0iRfh8qZUEgxC+rla9big5miVNJNqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-602d2e67217so41870397b3.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 07:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706628430; x=1707233230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a+YrNqIjaleO6hsDwzL6bs5Vk9PjcgZQgwDcDZqILk=;
        b=wVjWAJ+xoL3maGjX1qXtptJB5tkQNBRhGNf+pe2fChOPNCVYBelnuUsQXKGEnWFOHw
         9SPnxElRQl3aEtfl9km5GiEcXFI6fdbtQ27iyw8dgtURTczZQTtIwEdlzseC63UqM2nm
         Xg7XUoxclKF8UomGKXpZBxdQLYaBq5MDSEYBwQRL9BEU4cjhUnkHuTyZsyqvX1prBQP1
         shrZpuzbRsNVMgvT50DgKapm41WbjztOO3NRAjv3zsQMNMu/dSfXXgp0+/PVuQ2OsIvo
         CJ4RFOZ1llt7uMAGtpaQR4I7aC/bwYTEpi3Li0DsfViz0Krp6eAPBYyiy5p+b58JEwPm
         OVDw==
X-Gm-Message-State: AOJu0Yzz8s3iM8v+0GjPQU6CLd6j4Xo5/WKh8CzxjUOwHbbExT7+e8Ot
	hgqTDHxwATofWXJbhAaF2pO9gEt/P3drQMTbakgUlrBVBZkGYB5GkWMjJHZ2hAo=
X-Google-Smtp-Source: AGHT+IFoOVO7z8jBK5Mvl66190FI2OgU1ElN+8I+itXDm85kOUCodMvO8OABhuWU2Yy60tTVJ+lV4w==
X-Received: by 2002:a25:2e48:0:b0:dc6:a1b9:a3b6 with SMTP id b8-20020a252e48000000b00dc6a1b9a3b6mr1571349ybn.37.1706628430078;
        Tue, 30 Jan 2024 07:27:10 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id c2-20020a258802000000b00dc2366900f9sm2910797ybl.65.2024.01.30.07.27.09
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 07:27:09 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5ff7dd8d7ceso43156557b3.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 07:27:09 -0800 (PST)
X-Received: by 2002:a81:8304:0:b0:5ff:7a74:412e with SMTP id
 t4-20020a818304000000b005ff7a74412emr7821865ywf.38.1706628428717; Tue, 30 Jan
 2024 07:27:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401302324.d3o6tgup-lkp@intel.com>
In-Reply-To: <202401302324.d3o6tgup-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 16:26:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
Message-ID: <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
Subject: Re: [cip:linux-4.4.y-st-rc 878/1809] arch/m68k/kernel/traps.c:32:10:
 fatal error: linux/extable.h: No such file or directory
To: kernel test robot <lkp@intel.com>
Cc: Michael Schmitz <schmitzmic@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Ulrich Hecht <uli+cip@fpond.eu>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 4:23=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git=
 linux-4.4.y-st-rc
> head:   4daf8df4558b5aae717516f7e941014c463772c2
> commit: 193e83a8194fcb23b6fb4aea9518a67b786df1c5 [878/1809] m68k: Only fo=
rce 030 bus error if PC not in exception table
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/2024013=
0/202401302324.d3o6tgup-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240130/202401302324.d3o6tgup-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401302324.d3o6tgup-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> arch/m68k/kernel/traps.c:32:10: fatal error: linux/extable.h: No such =
file or directory
>     #include <linux/extable.h>
>              ^~~~~~~~~~~~~~~~~
>    compilation terminated.

Either include <linux/module.h> instead, or backport commit
0ef7653797addea8 ("exceptions: fork exception table content from
module.h into extable.h") in v4.8?

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
