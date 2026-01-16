Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751D131A800
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554742; cv=none; b=H6Lqas5Ra4E5bwC3WA46VKENUDuo6nyQwMBI2hsc/9GtYwDvC/6yHyouI3qeKECoTwuARIjNOiZNWRV8e07kT8KfTKjan66vilVPYDzvKM5hqJzSmCaVTjlib+G6gX8UUDhrO9b0PuD5v9q/0ErEkY3I1IHglr2rS7uNsSJQiE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554742; c=relaxed/simple;
	bh=uVOVIUqiZuoTk+0maIOAiHxCplZx7jUlt7+31JiN0uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2/af5IKA3Dtum7+VcnF0Ef8HMzTBTWwD1iEE0dB1bW9BTfIFbQEudn11dIJ6FA95NvLKXa+vSyL890zni0RESyQ2O2dmVJauj608MNZEi5J5QbiTenh+dAs+82KbIi76mYxMdSMDGxjBQGxpafyk8hrcBpRjI96Cv70VttI6ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-56373f07265so1410637e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 01:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554737; x=1769159537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2UZe5YgfXhcRIgTVpIXZmgIkVRExJjOG0e61TJdE4U=;
        b=rLFZcfLG1O5YrGdaqwG5zzvmMEsXqdEtMP15v6cFWa9DLcxIR+qeC7Bg+bg4t4NI38
         qkIEoK6bE6BkEIwvOXZARkURb7k6robUW4zjC1cBQGZVgMyGOpYCAQp6o2ycqnFXM+uQ
         zZKkRGhXLpGT9MErD76tCnRX6zRWucgvZEE8CL1a9eA/9JX35s8HqP5nPaBH5PkVe8YF
         XXXHdb8hMDVjBOYEwP4I+aRDlT2Ke2Qb43TPSJOsOXCz7O99OwA0CrsoAiRNGSMfbETw
         A0GvZfCaGwb5wzhkcrlFrq4crcEfq2HLcsAr0dvUKXCsmIefAWqQxuudYlgTGdE8JOML
         XC5w==
X-Forwarded-Encrypted: i=1; AJvYcCU9wnKlEVRMggi+eNPIKAjCm/78iN7bdBFyFZiXmRyGTlRR9kr1EbSFFxAkJB6eIaycuVfr4JHJ5yqbv87P@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0dktGMGDJVmLdhInlZeDdn9JG/WszdnAfzBiqhi14Nvbfvavs
	mkD48usVIpTcN0el/Tt6wBw9Ktu9ejZz4zqekzT+lOR7qhCASv8mLIoB1Y/XE48dCG4=
X-Gm-Gg: AY/fxX4ivEXKCITjvznsnY0HTQUsN8IP891/cppmOX95jtlK4lOmgCDnIExvLETebm9
	+8aCdtEbPydlIhkga/GACTuguX9I/z7L51DAdZ19ZExcdQ4FXeiWCcZQA7wWnb7dgCqrkzq2UFx
	CuNocRHdEKfSIOvAZh8JPeq5qXq7nJHzWPhNhU6xW074h8glbk8pXlCHbb8KpHxYNe4itCFp08w
	aC9VFimOiuPBKqlgDqQBpDn+DmAHJ3g5+edhnBxSpD+yPQBm9QyhKC0y/C63UWmY8Lfe58FGNJf
	iIyEQp53zXkYUbP+beWREYHFwOfojCWdGJ8rGTrcfh8LUPesF4ZW0tnzbVpXYt3pNlBnOxpC9Ml
	y3dBt7oZf5wpVNPFIoztxaokjAy4kRm9XmOfZQaJJ1LXfImxjkUMQwBlAZQAegU5OmzfnZ3OOhw
	L/n0kUHfjgfAJVQT12oC4wZma/tDzydbz+AO+v1aNR/VsFc5x/
X-Received: by 2002:a05:6122:1d8a:b0:563:72d8:ea1 with SMTP id 71dfb90a1353d-563b5cc631amr1019673e0c.19.1768554737447;
        Fri, 16 Jan 2026 01:12:17 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6eae96asm552745e0c.0.2026.01.16.01.12.16
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:12:16 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ecb1d9ac1dso1259804137.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 01:12:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVo0e8fuQcHahTh+a34A+PuQQbcJPrVX0COxuYFN8kr8O4AUsmV8/MBx86B3fJS9pn2vBxkb/bpvbsesA7y@lists.linux.dev
X-Received: by 2002:a05:6102:5129:b0:5ee:d0ff:7254 with SMTP id
 ada2fe7eead31-5f1a55702dfmr888364137.34.1768554736636; Fri, 16 Jan 2026
 01:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601161408.8oFa2eE5-lkp@intel.com>
In-Reply-To: <202601161408.8oFa2eE5-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jan 2026 10:12:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUv0J_XGOzpirOtqPTVNTJBFWJnYPeoycNPKDPJB_mMbg@mail.gmail.com>
X-Gm-Features: AZwV_Qi75Ru-kG2msi4BX1GsJrsqa-bjWJ2OW9Z6QSQk0M6iAIM2cFl68rwdKz0
Message-ID: <CAMuHMdUv0J_XGOzpirOtqPTVNTJBFWJnYPeoycNPKDPJB_mMbg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v6.20 21/21]
 rzg2l-cpg.c:undefined reference to `__udivdi3'
To: kernel test robot <lkp@intel.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jan 2026 at 07:29, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.20
> head:   5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc
> commit: 5ef5f78c6635da0be514ea60c3c1cddd61dbf8dc [21/21] clk: renesas: rzg2l: Remove DSI clock rate restrictions
> config: xtensa-randconfig-002-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161408.8oFa2eE5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601161408.8oFa2eE5-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_mod_clock_enable':
> >> rzg2l-cpg.c:(.text+0x19cc): undefined reference to `__udivdi3'
>    xtensa-linux-ld: drivers/clk/renesas/rzg2l-cpg.o: in function `rzg2l_cpg_get_foutpostdiv_rate':
>    rzg2l-cpg.c:(.text+0x1c1d): undefined reference to `__udivdi3'

Thank you, I'll squash in a fix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
