Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C8822DA13
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692769; cv=none; b=rCJlFZUp3kuCYXGep8ZSuajM2VjRVAZXr+jlLm6xynWU91USMKqaVkcjUP03LTjkRKQY5jbXynBRLtyie8EaChBvPlfj/5d2/gvGaZYaT/6p4EjWGT7huuQCZPbZh/822VwPXVNwXIvQ7Ws5M6nOU4/TD/iNtuvTOBXJh1qptW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692769; c=relaxed/simple;
	bh=atLEO9hxWHbIBM89m7SWMk3oA7Ms94Z7LN/jIa6Gby4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsrW9TQ8BeI6OTeLXI/qWZwvMo1uINgjXuHetNuspUxhCm5YJOtLyYJSO6usWqNk1TnMviT8ffDrPnGUji7PYma2iZiQHKdAKasBzVYIWmnX/EYL4tHwdY2tnwPF/6sQLMUPx0cIwW1xm6NtMD9vXSY/9GtWjQelmcdNNv+mpNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NkN1KwUb; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NkN1KwUb"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7082ad1355bso6533417b3.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 May 2025 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746692763; x=1747297563; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE65+d+3Jn5oteEU117118OxaZs5J48wYNW69m8KJVM=;
        b=NkN1KwUbIyMswTdNJlDVP9Q5+RARLg4AmjqVErzLapIZO4QDFlG71xtB+evkGzC/Pu
         FJW4SD06IKrSqQqEAIoad04bU1KRkqS4UK1H4LR9OfiCx2X/ahY60jB+aZNUu6whWpLw
         o0GM0H77zFzRgdEm+RDdhFdedGpSEI3qb/gqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692763; x=1747297563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE65+d+3Jn5oteEU117118OxaZs5J48wYNW69m8KJVM=;
        b=GxT59CrfSehbu6QzPN2va36Hg3/y8eZ8wzvUXwtsjL1JXN0e3pTnDUB0uPyvqLv74W
         5RA6y+bKJPNiL8h0kd0Jc3paB82uEIvjhggEJJwZ+Lx606cavEvlx9izeZqVJV1QfimK
         POXGZw2TMiznDG799+iHIh3mGZIo/7dOCfcp10SZdG5G03XROLYMJkfCY1Kh9MSpG17u
         EljGqFIPrBk8pkhnFNTkzLVNd8Li+b0x3tZ5n66/JJ8+NHl0qLb5oxoEZ5Anu7UQQxHw
         xyrvToF9lB6o152U5h/rUfPISOcZDlLzJOXVlhXevAA6fOIJ73CaGoCdCjG8//hyCt+g
         wB5g==
X-Gm-Message-State: AOJu0Yzq76VhXMPKZokVxxUULoiDdq3+2C4MnJGeM3XthuTdSR5GIFJC
	ug+HJ+RXwFYpf/rdB0KNQlZnh0ddSrCw5c/Ba+V6SbymyMB4yIfIHlETzQ16ZmZUMgDiS0hi0i3
	1Un8Qn3PTJRlyIbiLxqwouS4/xXdRnwTB5qDQzg==
X-Gm-Gg: ASbGncsdxapj4jeu0cZ7TKL1mllof0Ibs3y5QTvH9KQE3asz3oKdMBzcC6TWGghIxu7
	8PIlkE7zw61r7L2IX7CtOQEhHghTMUlpu6y41mfc00FM/n4oBPy4YG4eFyK+zXWYxZnO2eWrWmm
	x5jUKpCi7s86gEikvXe8zHNjvOb0HWW5Q=
X-Google-Smtp-Source: AGHT+IFZKTo123zuRr8LNZDAOR4TjuHpXh05W3rmowEaSleqmlvnQ/ZfHmJ755xbQjazy9hGFZRi4RVVDK6sN8PztFk=
X-Received: by 2002:a05:690c:4d83:b0:70a:192d:103 with SMTP id
 00721157ae682-70a1db16ddemr84236877b3.28.1746692763328; Thu, 08 May 2025
 01:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505072349.c10qxUzl-lkp@intel.com>
In-Reply-To: <202505072349.c10qxUzl-lkp@intel.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 8 May 2025 10:25:51 +0200
X-Gm-Features: ATxdqUFoybQIn1kx0C6U89apji45Ekqz24KPAXs7zzYvt5koLh2EEfYQxhcEjko
Message-ID: <CABGWkvp7n=Or-OqnLoOJsQQCHF+=8eQ9EV5=O+Qp4sQF49_DbA@mail.gmail.com>
Subject: Re: [linux-next:master 7777/9308] arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb:
 clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
To: Abel Vesa <abel.vesa@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Abel and Shawn,

As reported in

https://lore.kernel.org/lkml/174643143452.2950397.16722215892279685541.b4-t=
y@linaro.org/

only part of the patch series has been applied.

To fix these issues, the remaining patches =E2=80=94 the ones that modify t=
he
DTS =E2=80=94 also need to be applied

Thanks and regards,
Dario

On Wed, May 7, 2025 at 5:27=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   08710e696081d58163c8078e0e096be6d35c5fad
> commit: 2ba124053687c933031a6dc5b2e16ceaca250934 [7777/9308] dt-bindings:=
 clock: imx8m-anatop: add oscillators and PLLs
> config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/ar=
chive/20250507/202505072349.c10qxUzl-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> dtschema version: 2025.3.dev21+ge6ea659
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250507/202505072349.c10qxUzl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505072349.c10qxUzl-lkp=
@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@=
30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb: clock-controller@=
30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30=
360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb: clock-controller@30=
360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller=
@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb: clock-controller=
@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@303600=
00 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-evkb.dtb: clock-controller@303600=
00 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-co=
ntroller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb: clock-co=
ntroller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-c=
ontroller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb: clock-c=
ontroller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller=
@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dtb: clock-controller=
@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-cont=
roller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dtb: clock-cont=
roller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@=
30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb: clock-controller@=
30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30=
360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: clock-controller@30=
360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller=
@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb: clock-controller=
@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@3036000=
0 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phg.dtb: clock-controller@3036000=
0 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@3036=
0000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-prt8mm.dtb: clock-controller@3036=
0000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts:48.9-58.5: W=
arning (graph_child_address): /connector/ports: graph node has single child=
 node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw75xx-0x.dtb: clock-contr=
oller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts:361.14-467.4: W=
arning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@=
20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" o=
r child "reg" property
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts:311.14-418.4: W=
arning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@=
20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" o=
r child "reg" property
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dts:277.14-364.4: W=
arning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@=
20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" o=
r child "reg" property
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts:330.14-411.4: W=
arning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@=
20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" o=
r child "reg" property
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-=
controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb: clock-=
controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-=
controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-mallow.dtb: clock-=
controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-c=
ontroller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-yavia.dtb: clock-c=
ontroller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dtb: clock-contro=
ller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-mallow.dtb: clock-con=
troller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-cont=
roller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-yavia.dtb: clock-cont=
roller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@=
30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb: clock-controller@=
30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@=
30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb: clock-controller@=
30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controll=
er@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: clock-controll=
er@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:794.26-806.7: Warning (avoid=
_unnecessary_addr_size): /soc@0/bus@30800000/spba-bus@30800000/spi@30820000=
: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or =
child "reg" property
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-c=
ontroller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: clock-c=
ontroller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@3=
0360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb: clock-controller@3=
0360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30=
360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb: clock-controller@30=
360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller=
@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-rve-gateway.dtb: clock-controller=
@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-contr=
oller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb: clock-contr=
oller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-contr=
oller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb: clock-contr=
oller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts:309.14-416.4: W=
arning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/i2c@30a20000/gsc@=
20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" o=
r child "reg" property
>    arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (gra=
ph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has s=
ingle child node 'port@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controll=
er@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb: clock-controll=
er@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock=
-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock=
-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required prope=
rty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warni=
ng (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: =
graph node has single child node 'port@0', #address-cells/#size-cells are n=
ot necessary
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller=
@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: clock-controller=
@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warni=
ng (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: =
graph node has single child node 'port@0', #address-cells/#size-cells are n=
ot necessary
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warni=
ng (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: =
graph node has single child node 'port@0', #address-cells/#size-cells are n=
ot necessary
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warni=
ng (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: =
graph node has single child node 'port@0', #address-cells/#size-cells are n=
ot necessary
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller=
@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: clock-controller=
@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: c=
lock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: c=
lock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required p=
roperty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controlle=
r@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controlle=
r@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360=
000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30360=
000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dt=
b: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required pr=
operty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dt=
b: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a requir=
ed property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-co=
ntroller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-co=
ntroller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-control=
ler@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-control=
ler@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clo=
ck-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clo=
ck-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required pro=
perty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-contro=
ller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: clock-contro=
ller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-=
controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: clock-=
controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controll=
er@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dtb: clock-contr=
oller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-=
controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-=
controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-=
controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-=
controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-contro=
ller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-contro=
ller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-contro=
ller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: clock-contro=
ller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-cont=
roller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-cont=
roller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-evk.dtb: clock-controller@3036000=
0 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: clock-con=
troller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb: clock-con=
troller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: clock-con=
troller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb: clock-con=
troller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: clock-controller@=
30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: clock-controller@=
30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: clock-controller@=
30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb: clock-controller@=
30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: clock-controller@=
30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb: clock-controller@=
30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: clock-controller=
@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb: clock-controller=
@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: clock-controller@30=
360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: clock-controller@30=
360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: clock-controller@30=
360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb: clock-controller@30=
360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: clock-controller@303=
60000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb: clock-controller@303=
60000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: clock-controller@3036=
0000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb: clock-controller@3036=
0000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1251.27-1301.6: Warning (avo=
id_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #a=
ddress-cells/#size-cells without "ranges", "dma-ranges" or child "reg" prop=
erty
>    arch/arm64/boot/dts/freescale/imx8mq.dtsi:1284.13-1292.8: Warning (gra=
ph_child_address): /soc@0/bus@30800000/dsi@30a00000/ports/port@0: graph nod=
e has single child node 'endpoint@0', #address-cells/#size-cells are not ne=
cessary
> >> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: clock-control=
ler@30360000 (fsl,imx8mq-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clo=
ck-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: clo=
ck-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required pro=
perty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: c=
lock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtb: c=
lock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required p=
roperty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-control=
ler@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtb: clock-control=
ler@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-co=
ntroller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtb: clock-co=
ntroller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtb: clock-controll=
er@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33=
.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required=
 property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33=
.dtb: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a req=
uired property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33=
.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required=
 property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33=
.dtb: clock-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a req=
uired property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cloc=
k-controller@30360000 (fsl,imx8mn-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: cloc=
k-controller@30360000 (fsl,imx8mn-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cl=
ock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: cl=
ock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required pr=
operty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: clock-controller@=
30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: c=
lock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: c=
lock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required p=
roperty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0=
.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required=
 property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0=
.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a req=
uired property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0=
.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required=
 property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0=
.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a req=
uired property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-con=
troller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller=
@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: clock-controller=
@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: cloc=
k-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01=
.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required=
 property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01=
.dtb: clock-controller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a req=
uired property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.d=
tb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clocks' is a required p=
roperty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.d=
tb: clock-controller@30360000 (fsl,imx8mq-anatop): 'clock-names' is a requi=
red property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
>    arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.d=
tb: dsi@30a00000 (fsl,imx8mq-nwl-dsi): ports:port@1:endpoint: Unevaluated p=
roperties are not allowed ('data-lanes' was unexpected)
>         from schema $id: http://devicetree.org/schemas/display/bridge/nwl=
-dsi.yaml#
>    arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.d=
tb: dsi@30a00000 (fsl,imx8mq-nwl-dsi): Unevaluated properties are not allow=
ed ('ports' was unexpected)
>         from schema $id: http://devicetree.org/schemas/display/bridge/nwl=
-dsi.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@=
30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtb: clock-controller@=
30360000 (fsl,imx8mm-anatop): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: c=
lock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs232-rts.dtb: c=
lock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required p=
roperty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs422.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prope=
rty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rs485.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prope=
rty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-imx219.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rpidsi.dtb: cloc=
k-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prop=
erty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: c=
lock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required proper=
ty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs232-rts.dtb: c=
lock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required p=
roperty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs422.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prope=
rty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x-rs485.dtb: clock=
-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required prope=
rty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-c=
ontroller@30360000 (fsl,imx8mp-anatop): 'clock-names' is a required propert=
y
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: =
clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required prope=
rty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: =
clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required =
property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb=
: clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required pro=
perty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-cts-rts.dtb=
: clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a require=
d property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: =
clock-controller@30360000 (fsl,imx8mm-anatop): 'clocks' is a required prope=
rty
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: =
clock-controller@30360000 (fsl,imx8mm-anatop): 'clock-names' is a required =
property
>         from schema $id: http://devicetree.org/schemas/clock/fsl,imx8m-an=
atop.yaml#
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
