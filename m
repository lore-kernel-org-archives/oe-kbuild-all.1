Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E4198E99
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783580; cv=none; b=XdZ7vm/jvkQc0a13W+Rw8N3R6KSl8V7OujewkWD+vn5p7XRdQ9kx5mdMmxFq7LjzwXFj8FVweFGTTJLb+ldDJYP2CL3TLUn5iCE9XFmP624bshB5ztRBR0s02LMeO3uj1umkkBt//rQ4JRFRlslo3A3uuQ4XWi2Ijh452j5YBzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783580; c=relaxed/simple;
	bh=qgIEJoE2SaNv1GJKZnRrcn29nLGVC020hhZBFuuCajc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoTU2xjIbgLTka+ZYy/2fa/2fSSGWINlG5xFQiH5ycJL0kAaYojTW4g2MTEnb58OKUVvtN0P2OXFHOnR4uOWWeUoKUHBAKknkYpKbdFoqNSJN1ifVluz/D0stmhpS4JCFiI324p0nIsznoMYmV3NQ+sGpKiXDBgPle87VOPoNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso4724695276.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Oct 2024 04:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783577; x=1728388377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4YIvF1g8OtVmJFvpFme0P60tjKwaP4iqZOBius0DoU=;
        b=cgq8a0XKfcZ2G01N4tYqjkdNWHAD1oqgMmGDuS52AJpY6Z9GF3IH6rORQsamwGtTlQ
         h5h3luy4U+guzrsY5DdnDbtBNcuBi6D0IuCW/i1l1vlzoCtI4/hJUNCxFMZw9DhmYfMo
         GkJTvTYRYDxCgGvc69DA1dbnfgYRVfUDeezSdaEFcick+6OFUnW+TCnI6LVy7ptJ8PMt
         jJEPwlxTl6xp0sfkygGgeQpjP2UI4gLLRcDbckgHHDbPLVf3xalzMfkR8w22L95ucETJ
         zgf198hlUxx6MBD4mRi9+mkmurIchWlY7aLiXygw6cHFYSJkR5K7MfBBa+YuLECMAoaa
         RIzA==
X-Gm-Message-State: AOJu0YxjrAY8UVDCfou8v4XtUnU5vvl+nL7ROsJXit0iEneWnxj6+N+h
	kupUtnxpQ12mTdvQSGcanbyBF4W1oFDd6KcG+2+l8y3ipAmT3NB+IFbqQ3KU
X-Google-Smtp-Source: AGHT+IHYDGh5aQ+4R6HcXz91NsZR25H1183oK71bOi0gYt+3gXEtQHRUY6O8VXmEj+Qoey23DHdeCQ==
X-Received: by 2002:a25:aaa8:0:b0:e26:b55:77 with SMTP id 3f1490d57ef6-e260b550147mr8203904276.24.1727783576866;
        Tue, 01 Oct 2024 04:52:56 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e4322e57sm3097322276.38.2024.10.01.04.52.56
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 04:52:56 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6db20e22c85so47177457b3.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Oct 2024 04:52:56 -0700 (PDT)
X-Received: by 2002:a05:690c:1a:b0:65f:cd49:48e0 with SMTP id
 00721157ae682-6e247600474mr119818157b3.31.1727783576204; Tue, 01 Oct 2024
 04:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410011845.UiVJJtwf-lkp@intel.com>
In-Reply-To: <202410011845.UiVJJtwf-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Oct 2024 13:52:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxFzMTpAb-4L5Q4vdUE4_mSRJxCMf-UoscDHuwH3-TUw@mail.gmail.com>
Message-ID: <CAMuHMdUxFzMTpAb-4L5Q4vdUE4_mSRJxCMf-UoscDHuwH3-TUw@mail.gmail.com>
Subject: Re: [linux-next:master 968/1347] arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb:
 /i2c@ff110000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5651']
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 12:58=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
> commit: 2f39bba3b4f037d6c3c9174eed5befcef1c79abb [968/1347] arm64: dts: r=
ockchip: Fix rt5651 compatible value on rk3399-eaidk-610
> config: arm64-randconfig-051-20241001 (https://download.01.org/0day-ci/ar=
chive/20241001/202410011845.UiVJJtwf-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev4+g577c1ab
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241001/202410011845.UiVJJtwf-lkp@intel.com/reproduce)

> >> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /i2c@ff110000/audio=
-codec@1a: failed to match any schema with compatible: ['realtek,rt5651']

This is expected, as Documentation/devicetree/bindings/sound/rt5651.txt
is still a plain text DT binding, and wasn't converted to json-schema yet.

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
