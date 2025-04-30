Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351336F06A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995453; cv=none; b=FI22/R3hRRyfdrBIPUlgWEz9zl+qcJ50EE07Vr3PvrVumYiR0bJe8e/hi9th0UpBxEncwYvdWwawbAyWQ+WIlr127dhx/qFE8BlJ+QkLK2qlsKKziCIyfXNlyXbzj4KYwmdcR2Q2/dNVBQ55yS74q/eX4Du/CrchZA73C8XKelg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995453; c=relaxed/simple;
	bh=XmjJlriSU546WwNijXDXxcjtYzosQfciIJX7qxC5sXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZBC04IfhU4JE8SgMcrnGwaTvAyZwKKP9rs9MEDTy05o2Xaiw5R06BNZ0x9dK0TEVjchdCn+rlcvteSi4x9m5iSpBHxOXXeGbIB7MPjJ6ieId9/PZBcCIK1g2P9Gp3sLewuXcMx1cKZqhzIicv2nBw/yWdbPAwZpX6aUVE4iJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5259327a937so2615333e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 23:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995448; x=1746600248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnU9zbusVANKslaJeJSl94vuczo81pzSQY1N+xf6f3A=;
        b=rQ3Mf89yyvCJppBlhS4ptop8t60NDmvoTaWR/jTantR0SrJ0DSWGGZJwIYsnWpniBN
         eIlzzFyNAaa2AKoaLVz1HP1zinBFubC9HT9IhOgWremtFc7KRQODMA/rSpN8nvRGC42w
         GD+aS2yzItInOEaa85kRF1ieNlIrWx+tstmT/t7weVIKvfhL7j5srIG7jsTq5m8Yfa0/
         wtGnFkIHIlHFX4nwS/mZ0df2A1beeyl1t16fo6cFxc8Mk5AJ1wTMgwimvvHcGe3NqybN
         1/vnPtxkLFWDQ2NgUg+q5Lypu+x7ONGJRUy8IwesSEZvKhxjacJV1KiFVUvepGgExn98
         DlJg==
X-Forwarded-Encrypted: i=1; AJvYcCUHpoJRuLPhrWuDgaY5fw0bX5XobY1dIy70AzA/KMZSqbujB8B7DI2DAzxLKW+wD9wC6S0NYhqZiNz4XXRu@lists.linux.dev
X-Gm-Message-State: AOJu0YwC6MR5EaVmsF2ljYJT60Pddbi6p/Jm6pgjOrPRjNxlq2CdB5oV
	HJg6hka2uM+SBf7HyaA5B/6P3wiyUns955SUn32cAYV1hgXQ0oAbNQohbl0L
X-Gm-Gg: ASbGnct0juNUA06zJOcHyKk8DpLTV/emPoPgwUg8FZ7jZH1lqGoePupQzCV2JjM1EP5
	wsFka/gSEFfM23ioCI2zK6wz2eWrGoDpdEuND05m4HGFWHV7xRoLTg1l6J7Lj2qSwoD5U0zkqY2
	Uvvxz28+xGZykRUeDP7uVnu2yz1yPEfH1U5VhDqPua0cCMJaRot73w3mruOEk7OZY46vUgvTQBO
	aRAvcGyW/17Z/LCRL37z+c05YPd+Bscpm1Lnpqk51kivC2FDwWU/r8pa1lzi26D/zMnBIXxAHjK
	9mjV2pss+Ei9Y0JnPpJMlCLKByHDkmYwe+zd4ym9Nl/+o71MwrZ39QgoRA43Gc0r5QAE5PWLM68
	MrhFv5x5BX6m0iQ==
X-Google-Smtp-Source: AGHT+IE7etIghMCQYOwGfUuBn4TJyKvcciNL6MftOQSbCPvFDIC3XAZ9G334yfozdIVm4T/5j9QUBQ==
X-Received: by 2002:a05:6102:161e:b0:4b2:adfb:4f91 with SMTP id ada2fe7eead31-4dad398f5d1mr1222696137.21.1745995447496;
        Tue, 29 Apr 2025 23:44:07 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dad40dc128sm210717137.8.2025.04.29.23.44.06
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:44:07 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d377306ddso2670558241.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 23:44:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXB39j2uVQo2Wz0NLZdGlow+B6k2or83v/6YtxLxsDUC7HJi9io/F6/5hnsUeFltUDWhyuzY70CXzrqKPp0@lists.linux.dev
X-Received: by 2002:a05:6102:2922:b0:4c1:903e:7bed with SMTP id
 ada2fe7eead31-4dad339cc27mr1480246137.0.1745995446785; Tue, 29 Apr 2025
 23:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504262154.sBmNTrcB-lkp@intel.com> <84fd01d9-d320-4296-9c42-0fb5238a8505@kernel.org>
In-Reply-To: <84fd01d9-d320-4296-9c42-0fb5238a8505@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Apr 2025 08:43:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWM=ftk3AYTQJFVcSUnYmqsYRLvK9un5OvR9poevBTgA@mail.gmail.com>
X-Gm-Features: ATxdqUGCh4k0tCxGJc8o-rbA0OfuL2r0BIEhDobkEiZf3HL2t6VOpsmCQCRIaqk
Message-ID: <CAMuHMdWWM=ftk3AYTQJFVcSUnYmqsYRLvK9un5OvR9poevBTgA@mail.gmail.com>
Subject: Re: sound/soc/qcom/sdw.c:93: warning: cannot understand function
 prototype: 'ret = sdw_enable_stream(sruntime); '
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 10:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 26/04/2025 15:32, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   02ddfb981de88a2c15621115dd7be2431252c568
> > commit: db7e59e6a39a4d3d54ca8197c796557e6d480b0d ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc
> > date:   6 months ago
> > config: sh-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 12.4.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504262154.sBmNTrcB-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> sound/soc/qcom/sdw.c:93: warning: cannot understand function prototype: 'ret = sdw_enable_stream(sruntime); '
>
> This looks like compiler issue. I check the config and SOUNDWIRE is
> selected thus sdw_enable_stream() is reachable. I also cannot reproduce
> it sh4-linux-gnu-gcc v14.2.

I also couldn't reproduce it, using the specified commit ID and
the reproducer instructions, with gcc versions 12.3.0 (Ubuntu
12.3.0-17ubuntu1) and 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
