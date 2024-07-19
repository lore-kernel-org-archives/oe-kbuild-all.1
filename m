Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACCF55769
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721381239; cv=none; b=uq0hUTIAwN/eaKTsGpKow2sa3j/Tko9UciNsor2G5QWKkpPdb71PCbr/pgx5gK5Irhq1i84ILdAlE7m97cBj/rE2BEFpR2rzxZO2sbhf6KVZTz8UcjZDJdR8Xrtw151NjZR2KxQOJpszV4gnjdU/os+56yFrXpD+MoLQh1DfrYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721381239; c=relaxed/simple;
	bh=IU3mO+eflIRvC0cljnLDQAU3tY2pQn9r6aqWcXQnG6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DW+tF2kP3+qpL9hlDL8NzCbwtyZj14798HLCdZPAn2V8KbHw7H10FKemkg9opoatkzfqr/qt5rWJ7feZ8UYJO5KfJZQMuNgdDZuZeiZ0whj9TyGcTFk/I6U8KyoEeP6VSm9aS9+f6LGecP67H1yx0CQfPkwk9VOvFvoTQOOoJOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0365588ab8so1856190276.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381235; x=1721986035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQQH9zQ0KuEmDvyjHiQws0xpaW4ALn+Sbzd9aHdjFFQ=;
        b=uCsdlSyDSULO53/MX/FVL5VvfW/QpmyVbItxCOW97DSDbMAHN2ghkzxpX48aevcz01
         b1KMD+zZEtY8oVv+KqqUMkzI9wYTr401B5JnrnLD03t+ULUhQpGm/VQ+uB0S0SowABPZ
         S/CrZ3icGw3ukP+Zcg36lyjUXkOZjFM0xNpGl14q8h6v6wsFPqnBTx4NfUlc4Po2auPc
         //hY6SQ2A/Uq81yb3tWopluK073NvzaN+vX3bIt72V6cqCZSDt5BCqGgkh2dEztDPsGf
         ZYA4Sso5cVYqR/EALIFb8GrLAuVzCuFM9dovAvEiCj/fHdvS5DweD9xzbKbXLa9DnMoj
         7HqQ==
X-Gm-Message-State: AOJu0YxJ8XPcq74JB6Tz+zoFgimenSMrM7+hlwyXEVjJIc4k5HOTrG/r
	MDUMFQKj1HSCFiVv0SFTwJjE/yOhvu/Q3E10i7ONTJA6FLQI7oRIDpbdvHNp
X-Google-Smtp-Source: AGHT+IG0XyKafxB4qZA9Q+QtanjeDR/8juDQZjOesjbY3s6Uv+dH+Ut98jR9r9kC27tKuNPeBL7ySA==
X-Received: by 2002:a05:6902:1502:b0:e05:b9bf:4e58 with SMTP id 3f1490d57ef6-e0640dbda65mr4988083276.25.1721381235265;
        Fri, 19 Jul 2024 02:27:15 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0860b43432sm336838276.65.2024.07.19.02.27.15
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 02:27:15 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e03d49ff259so1819083276.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 02:27:15 -0700 (PDT)
X-Received: by 2002:a05:6902:218b:b0:e08:64ff:9ff8 with SMTP id
 3f1490d57ef6-e0864ffa3famr708853276.32.1721381234832; Fri, 19 Jul 2024
 02:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407170751.LGZlPmUL-lkp@intel.com>
In-Reply-To: <202407170751.LGZlPmUL-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jul 2024 11:27:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUff1zMWzghwmP1QwF5Krt2aSF=cYe_Qfc4Mw-woCunDQ@mail.gmail.com>
Message-ID: <CAMuHMdUff1zMWzghwmP1QwF5Krt2aSF=cYe_Qfc4Mw-woCunDQ@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:topic/rcar4-fractional-pll-improvements-v1
 19/28] rcar-gen4-cpg.c:undefined reference to `__aeabi_uldivmod'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 1:37=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git topic/rcar4-fractional-pll-improvements-v1
> head:   f5a672b0ed67fa75083e13e5f82832cbe7a55e20
> commit: 4557d64e7540f8fe383458738b45f317e2235f7b [19/28] clk: renesas: rc=
ar-gen4: Add support for fractional multiplication
> config: arm-randconfig-001-20240717 (https://download.01.org/0day-ci/arch=
ive/20240717/202407170751.LGZlPmUL-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240717/202407170751.LGZlPmUL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407170751.LGZlPmUL-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arm-linux-gnueabi-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function=
 `cpg_pll_8_25_clk_set_rate':
> >> rcar-gen4-cpg.c:(.text+0x29a): undefined reference to `__aeabi_uldivmo=
d'
>    arm-linux-gnueabi-ld: drivers/clk/renesas/rcar-gen4-cpg.o: in function=
 `cpg_pll_8_25_clk_determine_rate':
>    rcar-gen4-cpg.c:(.text+0x392): undefined reference to `__aeabi_uldivmo=
d'

Thank you, I indeed missed two 64-by-ul divisions that should have
used div64_ul().

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
