Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0AD1DB134
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737708814; cv=none; b=bjCY6xDalGBEYZdCdnGAaYFYhhE88BeH3tfh7UgPODiGRvg9ruulw9NtknC87pcFZnqFt1L5NFs4ah2eQfIMyPhcVcWW6HQ93yH0gVLTpU3yPiqyrh6TXGo+B2W/JW/X5dqyjzCIS2tKGMOzOo47eMkDc+otAgQAfIxBkpE12X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737708814; c=relaxed/simple;
	bh=FItlSzho/bQG90h0RfbXHRaG8KbYB0RlN1p5AKc3Ldo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDwuXzXGAjH32eFqW2JwNeYL8Qdr4oXCCSVYWhb0v4NugX0cjVyn04mQTVK0EUXKT3MpEtIItTO70KGbHBYqLXApkg9PK85K5VJIvn2WwEX+jMxMkXPRPJRonU/ShGJuyZWJTsF1oqhtE+enyTLq2NQr9JBh0tKhTLPCcSUSzrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afeb79b52fso537331137.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 00:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737708811; x=1738313611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDFWf6Xu82hlwWvuFpCfiLWs2Tf0jqIF5NOVPKoCOEE=;
        b=VfpHsDtUROcFEoqEiw8ku1yYjHWjuUrplvv0Omhh4/0OFk8TML2luM0stdVBCl7/5M
         hWtArj8EOqaAWBfJ3NJ7aopT+Ywzj5+hRhnKW13eSMyhHwnInuCIfgVp3GPhvVG0YpFz
         /1KGGac2PFHwXG/EduZ13fTFvqxVq6FwVIIA6Y9lpLKwjKyyN5MdZmRFx92IoUsIlQkN
         v1UdjpJ6myTksssj6038mH7cLEfrmmWjqIwN+ydpgB4cof2EuEhQRSGlRpTfSM2MpA/g
         iofqCfkAFqd5gDkSI62iebYD8Ncd93h7ENf7O0gAX3plZMZw6Vp7BbJ0Hcr8UyxxKeIB
         MuMA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Q0XMoxozwfVpRnyN8B6IRrBZmnC+FaKTiT8NmRfSU1HTIwtnPxHXE1XkxdnY1w5MavWaWZDAmKGGjLxu@lists.linux.dev
X-Gm-Message-State: AOJu0Yww2Zi1aB40lePbmYYB+J8Uz8QHxSFAJ24ur1Q3waMy/MG0+nGD
	V0KW0iV1/MAuqy6ioC08lmsZKVg9LNMIM7i1p3umKQ1lJhsSXvup1U8cTh+M
X-Gm-Gg: ASbGncu0FJ0nc1hwI1NfF9R7gD6Q2yzBEv7Aq6BshncY4c2oycaDEiCKXHUvFSvVTH4
	eJZLTC0Bk+Ez4KrlGTjK+Tcr/3xul1YU5nMCTe7VeZg3cCalEhruGFN2022YO+HGI1LPgKr5Ba3
	RlptY2HOl9unQR7tALjpQF0ZxxPmDt5hLIj7tnWBWRf0pfWb4PzVDQ2++YhiK11AmtOzD36z4k+
	GkuMsuydvciBbXYTF1xE9sO00G6szX75DgFCbxPH0EHWf3zPgeNATWqHUPs41/5HlzaCotLcWYv
	J4Yb98O2VV6Ka02B3sAsd1nPEz7GWoKec9h7lCIPcXo=
X-Google-Smtp-Source: AGHT+IEwzF4AZL5/Ru67NKVP2kg1qDBuWNrIFwBW+oFhJarcR6aX6bFtUeDrdw7J2AkK4ekuygvceA==
X-Received: by 2002:a05:6102:b0a:b0:4af:be6e:f0aa with SMTP id ada2fe7eead31-4b690d3b346mr24099527137.25.1737708810730;
        Fri, 24 Jan 2025 00:53:30 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b7097aa5b0sm330220137.10.2025.01.24.00.53.30
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 00:53:30 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85c4557fce0so362617241.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 00:53:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5c5UIAeFbGNqYc7Ud6JE/WbJcWrwSrf9lNM0NXffLgHTn9sz+Xij726djNWDxxLZRooECdfZ9vIiJWwpM@lists.linux.dev
X-Received: by 2002:a05:6102:5129:b0:4b2:5c0a:9aff with SMTP id
 ada2fe7eead31-4b690bb53c0mr26366922137.3.1737708810066; Fri, 24 Jan 2025
 00:53:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501241032.oOmsmzvk-lkp@intel.com>
In-Reply-To: <202501241032.oOmsmzvk-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 09:53:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWe54-r39qrkfkw8M6VpKY7bc1mLuamTADxf8OQq0wkrQ@mail.gmail.com>
X-Gm-Features: AWEUYZkfKKZIObDCupUu9Z656a8qeMZQNVMnSW06AifxTo89MdfhoqCQzovOleQ
Message-ID: <CAMuHMdWe54-r39qrkfkw8M6VpKY7bc1mLuamTADxf8OQq0wkrQ@mail.gmail.com>
Subject: Re: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_SH4_SIU when selected by SND_SIU_MIGOR
To: kernel test robot <lkp@intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Gazzillo <paul@pgazz.com>, 
	Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 3:54=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   606489dbfa979dce53797f24840c512d0e7510f9
> commit: 2dbf11ec7d3a63ebde946b5747ad6bd74d45adb1 ASoC: sh: Replace 'selec=
t' DMADEVICES 'with depends on'
> date:   4 years, 6 months ago
> config: sh-kismet-CONFIG_SND_SOC_SH4_SIU-CONFIG_SND_SIU_MIGOR-0-0 (https:=
//download.01.org/0day-ci/archive/20250124/202501241032.oOmsmzvk-lkp@intel.=
com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241032=
.oOmsmzvk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501241032.oOmsmzvk-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SH4_SI=
U when selected by SND_SIU_MIGOR
>    WARNING: unmet direct dependencies detected for SND_SOC_SH4_SIU
>      Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy]=
 && (SUPERH [=3Dy] || ARCH_RENESAS || COMPILE_TEST [=3Dn]) && ARCH_SHMOBILE=
 [=3Dy] && HAVE_CLK [=3Dy] && DMADEVICES [=3Dn]
>      Selected by [y]:
>      - SND_SIU_MIGOR [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] && SND_=
SOC [=3Dy] && (SUPERH [=3Dy] || ARCH_RENESAS || COMPILE_TEST [=3Dn]) && SH_=
MIGOR [=3Dy] && I2C [=3Dy]

Thanks, I have submitted a fix
https://lore.kernel.org/8c17ff52584ce824b8b42d08ea1b942ebeb7f4d9.1737708688=
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
