Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732391AAE20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718884092; cv=none; b=OVAbTS6UyCBNtffWhYVB8+rcNi8++DIOSgNJoF5WtWSll2ulPBR+RHnh+Zppd+E9MrOgszh11xnpNvGwHe89PdhMbR+kEePczYGZAHqIMNBdpEYbtoMK4Xp5tAnCT8h+0sbtbqrvOQln/RColjcv/C0zpW/R9BVo9LekSZ/hRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718884092; c=relaxed/simple;
	bh=HSMJMcrKvDY0DVz0Ijja+oGWU+ejnhpMKQ+oeCsAzd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDVwb8P9mkBWdtm9p8dlqfm73R0gnioZXP7gTIyjq//r13y13D0DKoWoILKNXs3GMD9+CdGnJWZbBKQ7yaSCbwI8Xw8FhdNvwQ4iljF04fPcWZdd2yKoUfUWXsLfcfTmxbJucBPhzQriWWTRo6oA0XptNI1MnQ0k5XalMXnkP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfecd065b0aso671220276.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 04:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718884087; x=1719488887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfRqjNu5TZut6/mD++li1u+MXiBxMRMzVEbJez9Yj1o=;
        b=nnKCpSltyxswW/vDhCMjQPWSaSkbrcjrYgxOov4o2b1yhjoROG+SN9yU5JCin7c1va
         EY9eqVrPEFftoSJ5h5lriKdhmBS6rGVBfGkXkaiQINrMQhiM4l3Ds0UQ/6AfhxN8FvYa
         490p3w1hlfkDbc1bRaht6RVJ1DRVXhA1EsWWxz+vY2nzXnWfGVd/gqrwzgXcrsoUnSDn
         7JWE8c9R34OU+iWMafogp0SnM1Yb+g04b3ylYZ0y8fcei7Unqwx9vA6NcTYJp1rQWmp3
         YIaHx8+BOrp32xFh3aMfu4OWT24hbgRWm1K6pBIrhyBCvvWb+1HQFwGJSq8ZYBvKVeAw
         JyHw==
X-Gm-Message-State: AOJu0Yx2Pe+CZH/6fiWawGNql0JH7qyE9o+0qb/45vnm+cBGBQOh0Dea
	rqZTFWGXIFJHzF+z82q/akHr/FFed9nzLIdjagtC2RfyKER8y/ICNDnYjIDL
X-Google-Smtp-Source: AGHT+IEAkYvrL3zIHcgvtf4OGAJCpf+DECbE6duUEfHh+j78nssYV+bD2euSUb6yA10AhjwyxSc1VA==
X-Received: by 2002:a81:9c0d:0:b0:61b:bd65:1538 with SMTP id 00721157ae682-63a8d736e10mr52518767b3.3.1718884087154;
        Thu, 20 Jun 2024 04:48:07 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631183d7e64sm29050977b3.26.2024.06.20.04.48.06
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 04:48:06 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63bb0ff142cso7972207b3.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 04:48:06 -0700 (PDT)
X-Received: by 2002:a81:8408:0:b0:63b:aefc:84c1 with SMTP id
 00721157ae682-63baefc8523mr32856287b3.12.1718884086369; Thu, 20 Jun 2024
 04:48:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406201854.Pp3ZqJ0W-lkp@intel.com>
In-Reply-To: <202406201854.Pp3ZqJ0W-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jun 2024 13:47:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSohkXcCQrcmoZ=sTLjTgeAgsMX3chECO5Sscjd8W4GA@mail.gmail.com>
Message-ID: <CAMuHMdVSohkXcCQrcmoZ=sTLjTgeAgsMX3chECO5Sscjd8W4GA@mail.gmail.com>
Subject: Re: [morimoto:renesas-bsp/v6.6.34-2024-06-17 120/132]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /: failed to match
 any schema with compatible: ['renesas,gray-hawk-single', 'renesas,r8a779h0']
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Thu, Jun 20, 2024 at 12:45=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.34-2024-06-17
> head:   caf7f9c42b2dc056f352a35527e2efc1e4ffd4b6
> commit: e8478eceea52bc2f0721d029cf3ee4a31a75544f [120/132] arm64: dts: re=
nesas: Add Gray Hawk Single board support
> config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/ar=
chive/20240620/202406201854.Pp3ZqJ0W-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240620/202406201854.Pp3ZqJ0W-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406201854.Pp3ZqJ0W-lkp=
@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /: failed t=
o match any schema with compatible: ['renesas,gray-hawk-single', 'renesas,r=
8a779h0']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /: failed t=
o match any schema with compatible: ['renesas,gray-hawk-single', 'renesas,r=
8a779h0']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/watchd=
og@e6020000: failed to match any schema with compatible: ['renesas,r8a779h0=
-wdt', 'renesas,rcar-gen4-wdt']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/pinctr=
l@e6050000: failed to match any schema with compatible: ['renesas,pfc-r8a77=
9h0']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6050180: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6050980: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6058180: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6058980: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6060180: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6060980: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6061180: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/gpio@e=
6061980: failed to match any schema with compatible: ['renesas,gpio-r8a779h=
0', 'renesas,rcar-gen4-gpio']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e60f0000: failed to match any schema with compatible: ['renesas,r8a779h0-cm=
t0', 'renesas,rcar-gen4-cmt0']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e6130000: failed to match any schema with compatible: ['renesas,r8a779h0-cm=
t1', 'renesas,rcar-gen4-cmt1']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e6140000: failed to match any schema with compatible: ['renesas,r8a779h0-cm=
t1', 'renesas,rcar-gen4-cmt1']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e6148000: failed to match any schema with compatible: ['renesas,r8a779h0-cm=
t1', 'renesas,rcar-gen4-cmt1']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/clock-=
controller@e6150000: failed to match any schema with compatible: ['renesas,=
r8a779h0-cpg-mssr']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/reset-=
controller@e6160000: failed to match any schema with compatible: ['renesas,=
r8a779h0-rst']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/therma=
l@e6198000: failed to match any schema with compatible: ['renesas,r8a779h0-=
thermal']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/interr=
upt-controller@e61c0000: failed to match any schema with compatible: ['rene=
sas,intc-ex-r8a779h0', 'renesas,irqc']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e61e0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h=
0', 'renesas,tmu']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e6fc0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h=
0', 'renesas,tmu']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e6fd0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h=
0', 'renesas,tmu']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
e6fe0000: failed to match any schema with compatible: ['renesas,tmu-r8a779h=
0', 'renesas,tmu']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/timer@=
ffc00000: failed to match any schema with compatible: ['renesas,tmu-r8a779h=
0', 'renesas,tmu']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6=
500000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0'=
, 'renesas,rcar-gen4-i2c']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6=
508000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0'=
, 'renesas,rcar-gen4-i2c']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6=
510000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0'=
, 'renesas,rcar-gen4-i2c']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/i2c@e6=
6d0000: failed to match any schema with compatible: ['renesas,i2c-r8a779h0'=
, 'renesas,rcar-gen4-i2c']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6=
e90000: failed to match any schema with compatible: ['renesas,msiof-r8a779h=
0', 'renesas,rcar-gen4-msiof']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6=
ea0000: failed to match any schema with compatible: ['renesas,msiof-r8a779h=
0', 'renesas,rcar-gen4-msiof']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6=
c00000: failed to match any schema with compatible: ['renesas,msiof-r8a779h=
0', 'renesas,rcar-gen4-msiof']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6=
c10000: failed to match any schema with compatible: ['renesas,msiof-r8a779h=
0', 'renesas,rcar-gen4-msiof']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6=
c20000: failed to match any schema with compatible: ['renesas,msiof-r8a779h=
0', 'renesas,rcar-gen4-msiof']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@e6=
c28000: failed to match any schema with compatible: ['renesas,msiof-r8a779h=
0', 'renesas,rcar-gen4-msiof']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/dma-co=
ntroller@e7350000: failed to match any schema with compatible: ['renesas,dm=
ac-r8a779h0', 'renesas,rcar-gen4-dmac']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/dma-co=
ntroller@e7351000: failed to match any schema with compatible: ['renesas,dm=
ac-r8a779h0', 'renesas,rcar-gen4-dmac']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/mmc@ee=
140000: failed to match any schema with compatible: ['renesas,sdhi-r8a779h0=
', 'renesas,rcar-gen4-sdhi']
> >> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: /soc/spi@ee=
200000: failed to match any schema with compatible: ['renesas,r8a779h0-rpc-=
if', 'renesas,rcar-gen4-rpc-if']

More to backport ;-)

Here are all the recent changes to DT binding files that contain
"r8a779h0" but haven't been backported yet:

9c57c4a9a45c04c19f38986c73847b756ceae237 dt-bindings: soc: renesas:
Document Renesas RZ/G3S SoC variants
3b7eee6aae0b3212183fa63a4ae7887924218987 dt-bindings: mmc:
renesas,sdhi: Document RZ/G3S support
387bb6fdd0af1f853deeb1cdd8331c07b6a66b32 dt-bindings:
memory-controllers: Make "additionalProperties: true" explicit
1c3be6ca72293723e009a29fbe90385fa047e5ee dt-bindings: soc: renesas:
Document RZ/G3S SMARC SoM
6042f5365bee167ac27d02454f5cba403747277a dt-bindings: soc: renesas:
Document SMARC Carrier-II EVK
c0a2c7619666ae857a52219f344fbaa915cd181a dt-bindings: soc: renesas:
Document R-Car S4 Starter Kit
c083e9daf4a6f5bc61c5a0eb3ba3e229271fc624 arm64: dts: renesas: ebisu:
Document Ebisu-4D support
8e3c825288c6a091e3e80edcebe746b927dd1f73 dt-bindings: serial:
renesas,scif: document r9a08g045 support
ac8fe40c3628e12123ef32098216476dccea7b6a dt-bindings: net: renesas:
Drop ethernet-phy node schema
22088bbb02259d813d797e2d6a4ba7ca6ff4b96c dt-bindings: serial: re-order
entries to match coding convention
6d02f355c3d2fe86f503793e4df09898e9f9e703 ASoC: dt-bindings: Simplify port s=
chema
7c93d177d913a3a43bcb8f8edd4e2f78074a18a3 dt-bindings: net:
renesas,etheravb: Document RZ/Five SoC
29b0b68f25ae6f9454c3e1c31b054595af0a80fc ASoC: dt-bindings: correct
white-spaces in examples
3e3ce6314fc0eaa91d4cf7a663f6f3a793b4988c dt-bindings: mmc:
renesas,sdhi: Document RZ/Five SoC
060baa9b90d4e14eac7123abc563070dd30b21a2 dt-bindings: net:
renesas,etheravb: Document RZ/G3S support
c18327b36e9c1efb917953fc14b869c37d2884e1 dt-bindings: soc: renesas:
Document R-Car V4H White Hawk Single
2a8998479328a6eb6a2b07a68c7a756fe717b9e2 dt-bindings: clock:
renesas,cpg-mssr: Document R-Car V4M support
cd508bba82e4e0f405f593d7ada8067ebba289cb dt-bindings: reset:
renesas,rst: Document R-Car V4M support
49558e814fefdf33bf0b2d1c46c30d6a3f9634f3 dt-bindings: soc: renesas:
Document R-Car V4M Gray Hawk Single
0076a37a426b6c850a0b41b814952760e4a70fcf dt-bindings: timer:
renesas,tmu: Document input capture interrupt
ff3d9bfa25fabc4bf014d4e350ded1dc12b0a44a dt-bindings: gpio:
renesas,rcar-gpio: Add r8a779h0 support
d9a9657a1343a7eef7bcbf6e974bf4cea75121a5 dt-bindings: i2c:
renesas,rcar-i2c: Add r8a779h0 support
ce3e7d48ada5c74c03682eb11027ead177dd3008 dt-bindings: soc: renesas:
Preserve the order of SoCs based on their part numbers
4aee14527e4fd92d4a7487c430b54d099b99b4d1 dt-bindings: mmc:
renesas,sdhi: Document R-Car V4M support
35b78e2eef2d75c8722bf39d6bd1d89a8e21479e dt-bindings:
renesas,rcar-dmac: Add r8a779h0 support
75a7d8146ac90849a6239c0d029e8b089e7ec6bf dt-bindings: pinctrl:
renesas,pfc: Document R-Car V4M support
fdb88a1453d212ac52bbacfbaa9a950c626bfd1e dt-bindings: memory:
renesas,rpc-if: Document R-Car V4M support
588b82546d585e8b6ab9c2af06a8ac1d4e5731ab dt-bindings: watchdog:
renesas-wdt: Add support for R-Car V4M
6796c1b68fa92c303923812a0658f3afe8366db2 dt-bindings: thermal:
rcar-gen3-thermal: Add r8a779h0 support
66010ba94c9b9c273eb9682132d6b809440b9013 dt-bindings: soc: renesas:
Document Renesas RZ/V2H(P) SoC variants
a87590c45c87424953118e8a43f36d967f3ca406 dt-bindings: net:
renesas,etheravb: Add optional MDIO bus node
ed53d391b6401d624172d1c97458d115893c6e0b dt-bindings: timer:
renesas,cmt: Add R-Car V4M support
58d4b25c883192377bf6255a46d46d0589e6f4ca dt-bindings: timer:
renesas,tmu: Add R-Car V4M support
1f48cbd6f00f2d1442ac8757ae8c32b672073927 spi: renesas,sh-msiof: Add
r8a779h0 support
ee2929118884d7f6e8af35e166d5bc01379bf63f dt-bindings:
interrupt-controller: renesas,irqc: Add r8a779g0 support
466c8c46b4ba763435b2a787b7824d9f0fd3e76e ASoC: dt-bindings: renesas:
Fix R-Car Gen4 SoC-specific compatibles
493d2b2969d477802310e8e215cf1924f95a7284 dt-bindings: mmc:
renesas,sdhi: Group single const value items into an enum list
d640af49b65c6d260a5154dfb822e8371b502707 dt-bindings: mmc:
renesas,sdhi: Document RZ/G2L family compatibility
dab5b8e26e84708cd2c0f0bd612269b1c330c6b9 dt-bindings: timer:
renesas,tmu: Make interrupt-names required

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
