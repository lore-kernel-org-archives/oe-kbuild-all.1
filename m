Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CE5839FB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804221; cv=none; b=m7mv2CIsOBCFIi08qIoWsRv/vQW54EEx1KREmgUJPWVU81G4cafgtQ5ZkrhQq3Iy1ZOn0CQVElImJLZ+gIn10G+iHkeAHwvCyxmDXLEjN8pZlS+skNu2P5Uv+HUz1dt0AiVGnkzadKeANWhGnGa0a64NDZBxubookYYDqSEUED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804221; c=relaxed/simple;
	bh=oHEKTEkBG3T6siBJh8XlxlgJv/e+1RJKsUnA5Nca7ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ixbl4UbU8CWY6mXZvpWnPvsRT2s8hXsOyokdngQ1WZbPCAhvAoTS/BWfI8Su9KfwJdl9SVt/+tmb/6WkzlAvVgIA3uisMDzwwPRkBRPvr23BxWBnTWgkwU+cAoc3tD7Y+RqnzWYR5QDhX3TYru/Co+Fj9dBfUopqXh3KxKnczmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-609eb87a9e3so5280947b3.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Mar 2024 01:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709804218; x=1710409018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PojEcxi4I/RdiOARzWVwK72o2YrlsxJWpO83mdW8+30=;
        b=AcPj8GgDaAP76ar03cRQ1X6E1sXmfEq938JAW0gCnOWiLmGcZm0HnojDf3pFoevHMf
         /SJZitaPDNbz+vVSAfuWoogBbCRJ5kD9o1qzDe3rU4ctfTAf44PQT62/huiAsDj5xBjc
         CHHZDDnoZOpEhTlxdwqrj7ZrdnZY5YccVaLa47doa12/68K6Ge7WTQBpL499FY6FKBgz
         PO6ItGlsFlC5dzYFejN0mk/segpE+vnQyN1tsT4WH/d9BDVfG4W32LA+eMXhEA3nLSM6
         v3B51VylRfnoE5QAkjgA9CeO84t5xh7X/CXpOwTpp1KpLId8qU+xrmodaxYF85ew3CUh
         Gqlw==
X-Forwarded-Encrypted: i=1; AJvYcCXnlJ0G53kwSmw5CXpTtXksl09FxSjfiWdnj7b4jJjbN5TBc/Oxw0GVDW3BQLl231w9AuyUo4W1YgTCJZ1W6SzDwmM3Idiub0fjSxPuMg==
X-Gm-Message-State: AOJu0YyrpfrcMHSFw0UrIyrbxbMkgAsu1AQFO0EohywkpJPO75Vc7XlG
	NsT80EQIvupINKOIKwuK2OPGQCBF7E1PC4UHNZeP+UBks0U4jE3yGHYCCu0DRX8=
X-Google-Smtp-Source: AGHT+IGo4JTPatHOg4YWm/TnlpGmedjXtZCpstFzWB9JBWdiGQqm/bjgmf/lW149K3g8yDDka6viZw==
X-Received: by 2002:a0d:d5d0:0:b0:609:7699:dc63 with SMTP id x199-20020a0dd5d0000000b006097699dc63mr483258ywd.9.1709804218588;
        Thu, 07 Mar 2024 01:36:58 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id k62-20020a816f41000000b006093c185c13sm4072604ywc.64.2024.03.07.01.36.58
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 01:36:58 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so560345276.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Mar 2024 01:36:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNWToIiTX6Y4AaJUGU5B+qCUm7QOmQKbL8tKJFw+axffBKMG5ZC7c9aJTUjvun313BRPJrTPRQDkY5b5I9DUXkUPWZPykAYbtOViD0YA==
X-Received: by 2002:a25:abce:0:b0:dcc:97c:5754 with SMTP id
 v72-20020a25abce000000b00dcc097c5754mr540534ybi.5.1709804218030; Thu, 07 Mar
 2024 01:36:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e22ab28836ee1689ea4781ed53fd2e4e4f84728e.1709749576.git.jani.nikula@intel.com>
 <202403071317.uoW18ZR3-lkp@intel.com> <878r2uxwha.fsf@intel.com>
In-Reply-To: <878r2uxwha.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Mar 2024 10:36:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+54MEdrgYr+4cXnd4oN9i3_cxrpLRhJVzuJuRoUs3Qw@mail.gmail.com>
Message-ID: <CAMuHMdV+54MEdrgYr+4cXnd4oN9i3_cxrpLRhJVzuJuRoUs3Qw@mail.gmail.com>
Subject: Re: [PATCH 22/22] drm: ensure drm headers are self-contained and pass kernel-doc
To: Jani Nikula <jani.nikula@intel.com>
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org, 
	oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Thu, Mar 7, 2024 at 9:44=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
> On Thu, 07 Mar 2024, kernel test robot <lkp@intel.com> wrote:
> > kernel test robot noticed the following build errors:
>
> So I'm trying to make include/drm/ttm/ttm_caching.h self-contained by
> including <linux/pgtable.h> with [1], but it fails like below.
>
> Cc: Thomas and Geert, better ideas for the include there? Looks like
> include/asm-generic/pgtable-nop4d.h isn't self-contained on m68k.

I have sent a fix

https://lore.kernel.org/r/ba359be013f379ff10f3afcea13e2f78dd9717be.17098040=
21.git.geert@linux-m68k.org

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
