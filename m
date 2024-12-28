Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F02382
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735393865; cv=none; b=KYO+R6E3g4AB1wFVQTNrO+zDSGx0aGxNx7XNmSu4Map6XmR3S3zKJXhK8MZc6QEhOtLdZStmjDXGHxAagGwVOryEidaBXRfiVgcbkYuMSjGFOcM2/ud4ux1zySrP0xeeUpgy2n4vafsMn0pgpHvc/gAgel+w4yvvatIqOmBh2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735393865; c=relaxed/simple;
	bh=yyBmXz7XgYsMCMXqpWOFe9d5WOVrxVRryobRRZrhhSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPLTFNszZvF1x5eg2p+MpX5LRUz3+9eUPboz6oN+7nRWFmBR4Lnp25Dh/mSfCn/NdON1a9pcttzmn2MBZi8twRuxx71Sek6u9PjD9HMMN8a6MrigaPOCFInzgSsOzPIrEbPmtT/tJMeyUNCG6XURifvT7duBT/XKcGsSQGg/k8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afdf300d07so4331896137.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 05:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735393862; x=1735998662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bE6x+KLRlOU5glkAAKOHXRR+my+FZXAZMoUd+0sekvA=;
        b=vJEYI0uqemo89lik5EHq4SaQpGg6a7xBn5ezl/eHJ2+03+ho/Ss61Xm39FQ1qos9cF
         U+aPsuAwXiNeB/JK3yVpg5ndK0VqgoqCCS/SZzdxiyWnruQihtpldaWFQb1p91NoVNjH
         5IRHUJLNHY3llockZcmWN9OtcNlAOlKVZuguC2zZYHeBhBM0rMdEC8+tsdIU1LJD2721
         QlsL5yjthisNM6KhzYWvLvUT0HRv16in7CW1YwAi0zDA+WQqbXHuvl8sr1kDuL2GUQHz
         lttFbjhCCwQeM5pdbzFVkXGX/CcayH1FZYZ5AnzJgRwW+ib2al7r0KyEv072Szami77e
         sBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4VmZqgQ6LIXQjl/+5r8rnIaoxq+hoVs82RrcRzs125x6z9WBT3OwjtagJMTKFx3TG9/bz0ZILh7iLSFQg@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7qQBuAriUtOYlLOz7CEjsLcMH7V2eKsgV0ZJ1uRPg5MYY6zCH
	X/qeNUsMarTKglU4fOi/V1sCfjPaBkQrr2y33BeWwOSpU9GFBBZ8k3hE6dpo
X-Gm-Gg: ASbGnctOfP6bjZrQ7nKQVcteDKIcBpGBCBuNWDy+nn5nu+LprCuyHY6gCuLVnKOcsl0
	+qgJ5wh5SzQRsYs/eixhIejaq7BE/Mmn36HxbztX2j0ssreL0zpJp5U057TufGdVyxrXg3Edf7n
	8i9k0TAbgQ3rYQwC8k9rFnmI1VRfpw6AyvFp/ClxTL3R1GWNnWmzLDdA+0ltrZ8S1VIvYtDKIZq
	Fs9UEPv9wbe8O+NqX6aehKdYRg6rrEmTUmt8IOu/3LxRLPiaF0DL5wLbn7417NrCZol+qs3JmKL
	XIT9a0sANrwQKuW1huA=
X-Google-Smtp-Source: AGHT+IFNL2a+GcPBoSBpbBi0wBOZKpr/nN+K+uGSVhVhNSLNxjmKb+pJX9aHhtlZKDIDXgmW0DbIYg==
X-Received: by 2002:a05:6102:504d:b0:4b2:5ecf:d124 with SMTP id ada2fe7eead31-4b2cc388a9fmr24175624137.14.1735393862204;
        Sat, 28 Dec 2024 05:51:02 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac1d6d5sm3434764241.6.2024.12.28.05.51.01
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 05:51:01 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afdf300d07so4331891137.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 05:51:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0Nsf2h1SogRChCbbKlXgWAhL7NWTTlTQ/FiIFpA+mSPVcfwpFEowyFFHCunnsOgzrJ0YFp+W0QXtNL3nI@lists.linux.dev
X-Received: by 2002:a05:6102:c07:b0:4b1:102a:5834 with SMTP id
 ada2fe7eead31-4b2cc455287mr24819183137.21.1735393861623; Sat, 28 Dec 2024
 05:51:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412282326.0DSE4HbR-lkp@intel.com>
In-Reply-To: <202412282326.0DSE4HbR-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 28 Dec 2024 14:50:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTtdQxyTUSd_NBiPvL6irb8p_2+=hk5PjUrXC4J=VrbA@mail.gmail.com>
Message-ID: <CAMuHMdUTtdQxyTUSd_NBiPvL6irb8p_2+=hk5PjUrXC4J=VrbA@mail.gmail.com>
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kernel Test Robot,

On Sat, Dec 28, 2024 at 2:36=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
> commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO dri=
vers into a new subdirectory
> date:   4 years, 4 months ago
> config: sh-randconfig-001-20241212 (https://download.01.org/0day-ci/archi=
ve/20241228/202412282326.0DSE4HbR-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241228/202412282326.0DSE4HbR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412282326.0DSE4HbR-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

The real issue was introduced in commit 1eefee901fca0208
("phy: mdio-octeon: Refactor into two files/modules").

Drivers must not use __delay() directly, as that is non-portable, and
doesn't work in the presence of cpufreq.

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
