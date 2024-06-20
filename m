Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C9156256
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718901983; cv=none; b=sPUVPvitRjcp+5e5TR8FONf7MCS5FG9nXrFGeEE9LOMcV+fEaGoOcjNZrB2hWOOcYRzWKvtjP9lcUwRTsM+0NAOZ2j1RUbn8AgnSImBGfMLbW/RcbftxP6BVxmvbgfMNJ/DBDLG2dl//eKKt+Dg66N0xrfdyv3Ss5wLKwmdLkbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718901983; c=relaxed/simple;
	bh=54aGWPISAvctBRblmf+0XFEa7/fqePVDOYydqE9rpFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LW3y/UZLvZjRaS+r5H+5vIhyC470C1zJBUKFKHmbk7apC23mqVSiAZvuf3qiWrkt7Pq4R318l6iFazSJJuCZg6drprxBldnCBOv7Y9z4BIA/kpN/X/sQZhV83+97Gnia7BidsZ98LnqleAXhxBgS3YeOfX90aHKE2e/Sg/7/lpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63267c30eaaso10812307b3.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 09:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718901980; x=1719506780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALZMaxnKCu7LTyW4d3fTVKB34Y+6JED2cwcIVU/tvvk=;
        b=hglA9yrs2MT67Ia2CWZynsy9h2glxLLM1xOsj5b4SDafR/gBTugu1x35xWM9oCOZ6J
         X3s8+UCLb6RCz2UTI16JIIdXp+e/HphzLNCsrC1o2Yx/8uK1GCmPTuMgx0T9FDuioSN3
         DIfUt7Jhqt/IQzaK8jOLFScHNsCYitFZXM9bHVbiP8p28pDbCl+/Pl3IWfNyX26untmi
         k+KWh/jopGlDtjO+jRO1vfh61CWbBK1NFbKYPaBCJyr4Y8tobQvYiNqYOWegdAYmTId2
         bZLy12bcpwZaW5gOI5wSLeemi5Am9bcouO7pKRikQP5y0hOI7HotS56HMHzTLzpuQEz0
         SlGA==
X-Gm-Message-State: AOJu0Yx2rfdDoBYJeA2JZAoxY66avGh14Rbi8i1lxBfL0ZDw97TT7B7/
	hM8GOy6T06tFIT2NCKjL3poep6JX3513lSL8Pz80aJtYVFckJIdcrdrsJEGg
X-Google-Smtp-Source: AGHT+IFkoFB5kArhzMH8cp+ULcq+73sZWj7oXool3qnNVw2w9oHue4QEX3MORuNmHDNCUYermifEzg==
X-Received: by 2002:a81:b049:0:b0:63b:ab20:bc7e with SMTP id 00721157ae682-63bab20bf0bmr40631197b3.41.1718901979972;
        Thu, 20 Jun 2024 09:46:19 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311918f652sm31316057b3.74.2024.06.20.09.46.19
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 09:46:19 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-632bcf111ffso10848597b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 09:46:19 -0700 (PDT)
X-Received: by 2002:a81:71c4:0:b0:617:cbc7:26fe with SMTP id
 00721157ae682-63a8dd02bd3mr61802667b3.16.1718901978494; Thu, 20 Jun 2024
 09:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406210035.ag62hCvj-lkp@intel.com>
In-Reply-To: <202406210035.ag62hCvj-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 18:46:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrO9ecPf7C=YLHqQ1j8hyhzm6Amhyvebd8+8pEkHje1g@mail.gmail.com>
Message-ID: <CAMuHMdVrO9ecPf7C=YLHqQ1j8hyhzm6Amhyvebd8+8pEkHje1g@mail.gmail.com>
Subject: Re: [morimoto:renesas-bsp/v6.1.94-2024-06-20 177/676]
 arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: /soc/i2c@e6510000/i2c-mux@71/i2c@7/audio-codec@44:
 failed to match any schema with compatible: ['ti,pcm3168a']
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 6:29=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-20
> head:   d0503e6510818ad3d8f152b7825e5110b81d8f7c
> commit: 25b834b52bc2a786b5d268be3f66bfea36efd68d [177/676] arm64: dts: re=
nesas: ulcb-kf: Fix pca9548 i2c-mux node names
> config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/ar=
chive/20240621/202406210035.ag62hCvj-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240621/202406210035.ag62hCvj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406210035.ag62hCvj-lkp=
@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/renesas/r8a77951.dtsi:2770.25-2795.5: Warning (uni=
que_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in=
 node /soc/pcie-ep@fe000000)
>    arch/arm64/boot/dts/renesas/r8a77951.dtsi:2797.25-2822.5: Warning (uni=
que_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in=
 node /soc/pcie-ep@ee800000)
>    arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: codec@10: 'port' doe=
s not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi=
-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/sound/ak4613.yaml#
> >> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: /soc/i2c@e6510000/i2=
c-mux@71/i2c@7/audio-codec@44: failed to match any schema with compatible: =
['ti,pcm3168a']

Missing backports:

13a7d9e992fa47bb ASoC: dt-bindings: ti,pcm3168a: Convert to json-schema
7b71da59122c3ab8 ASoC: dt-bindings: Add missing
(unevaluated|additional)Properties on child node schemas

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
