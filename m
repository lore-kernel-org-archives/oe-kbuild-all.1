Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D81FFC55
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376784; cv=none; b=o5cYwZvb3EBYKLg7Sxqay7HnJklmHhIyzlRlVWhgUJvxSfV3qrG3Gm5ACff9ALMjWklCo3Rm6KFkIP0odQxcfrvOsDOvMv7NhbjE+S109iHIOnKOiWFFK/5uP+xmFUTbrS9M4iDol3JRr6/5UHpjW+vyoK9EeULaYJyRM29rU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376784; c=relaxed/simple;
	bh=G4Ernkhsv95JBehmZO9UBpUMa/j4QPSkZYwBR1IS79s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVZm8Y/u3E4LovI8QiQ+IA7ykn5Hd8UkGUh3qg8SRY6TKfbEkmauS5BMhnduw3wXSyRBia+d5xmBhdaCO/CxBkos98umTNmC8ZodLlnf8hFrOprFACxRqF92elT4+G8JtJoTEkVM9sNxCDb1bxNEgVYT/AG72s0+0fFBHXY9Uik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6xQZoLk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6xQZoLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4AAC4CEEB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748376783;
	bh=G4Ernkhsv95JBehmZO9UBpUMa/j4QPSkZYwBR1IS79s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h6xQZoLkdW0bN+4msYVTf5GSD4VVrD2yJA6ve8yI5koqvO+lH34RpNR7NerLaPNNS
	 geIz9ImFZUNG4dY/wiO7od5I/pYZFOfgtUBKVCCm6T9TgjLbM/0M/UNTpe43tR+At4
	 asmEv1iphwifFMRbDvAEkAU1GMbAR3/KFdNIiekNDWvHJzyL75bfv/uZUjRT/pUhvD
	 jfETE15YNpufgWyrVGtYq+9+i+LYSsSZiOliEOkWfogAY1HtW4dS+IS8/E62hRDp+k
	 RGtWMudwbC8ZPWMfnp9QG3OzfnK8DthYEJr8ohl/WIRUd0v2LoWNqvOtPsDAgrzlmJ
	 zvKl+mTVGtzhA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-604630fcd3aso3735313a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 13:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwafHl0GlTk8twXBlhnGdLwq9El7b2YxSMvYlaht/nTm5tO4yNhV5oN0MzTOO4sbb7mIanBYH3ixEdf9rF@lists.linux.dev
X-Gm-Message-State: AOJu0YyI1FcaYy56wrdKUW5/MvvUv7gvTkjRRyG7oPqBofUvNOxlzmEW
	oyWtFKCGHvR0E/fatnitHzLQiqjnZcxqa4GQDH2/IH6a6oxjeU3H/c5oqlbONM0fb25Kd1hRb0x
	I4uViCgVvzd7TVTkGaGFa2o9byE1mog==
X-Google-Smtp-Source: AGHT+IEkgVRYJ6/0DEFTYyiceas+US3sJSeiBZmC5/gWzfxTRknfhtiHM0iOZDjX4E5hyBof/7+rpnlcXLyeryntz7A=
X-Received: by 2002:a17:907:7287:b0:ad8:9b5d:2c23 with SMTP id
 a640c23a62f3a-ad89b5d2de4mr121450866b.10.1748376782222; Tue, 27 May 2025
 13:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505021937.efnQPPqx-lkp@intel.com> <65983a8d-6816-4059-93a5-800f1a942059@norik.com>
In-Reply-To: <65983a8d-6816-4059-93a5-800f1a942059@norik.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 May 2025 15:12:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLb_Qy5aMnX1D53bTRvFYKHtunTtYkbOztZz-HNVkmYGw@mail.gmail.com>
X-Gm-Features: AX0GCFsqm07e0QITwGC2wv16I35EcIoWYkquya5wgsZoYb58Dj50aOnPf6_DPas
Message-ID: <CAL_JsqLb_Qy5aMnX1D53bTRvFYKHtunTtYkbOztZz-HNVkmYGw@mail.gmail.com>
Subject: Re: [linux-next:master 4287/7938] arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb:
 bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt:0:
 200000 is not of type 'array'
To: Andrej Picej <andrej.picej@norik.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Shawn Guo <shawnguo@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 6:00=E2=80=AFAM Andrej Picej <andrej.picej@norik.co=
m> wrote:
>
> Hi all,
>
> On 2. 05. 25 13:20, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
> > commit: 7ed7d1ed852d8f4c4dee7a4d4f7807ad59c7915d [4287/7938] arm64: dts=
: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
> > config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/=
archive/20250502/202505021937.efnQPPqx-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project=
 f819f46284f2a79790038e1f6649172789734ae8)
> > dtschema version: 2025.3.dev21+ge6ea659
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250502/202505021937.efnQPPqx-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505021937.efnQPPqx-l=
kp@intel.com/
> >
> > dtcheck warnings: (new ones prefixed by >>)
> >>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: br=
idge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-micro=
volt:0: 200000 is not of type 'array'
> >       from schema $id: http://devicetree.org/schemas/display/bridge/ti,=
sn65dsi83.yaml#
> >>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: br=
idge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-micro=
volt: [200000, 600000] is too long
> >       from schema $id: http://devicetree.org/schemas/display/bridge/ti,=
sn65dsi83.yaml#
> >>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: br=
idge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microv=
olt:0: 200000 is not of type 'array'
> >       from schema $id: http://devicetree.org/schemas/display/bridge/ti,=
sn65dsi83.yaml#
> >>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: br=
idge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microv=
olt: [200000, 600000] is too long
> >       from schema $id: http://devicetree.org/schemas/display/bridge/ti,=
sn65dsi83.yaml#
> >>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: br=
idge@2d (ti,sn65dsi83): ports:port@2:endpoint: Unevaluated properties are n=
ot allowed ('ti,lvds-vod-swing-clock-microvolt', 'ti,lvds-vod-swing-data-mi=
crovolt' were unexpected)
> >       from schema $id: http://devicetree.org/schemas/display/bridge/ti,=
sn65dsi83.yaml#
> >     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: =
endpoint: ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
> >       from schema $id: http://devicetree.org/schemas/property-units.yam=
l#
> >     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: =
endpoint: ti,lvds-vod-swing-data-microvolt:1: 600000 is not of type 'array'
> >       from schema $id: http://devicetree.org/schemas/property-units.yam=
l#
> >     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: =
endpoint: ti,lvds-vod-swing-clock-microvolt:0: 200000 is not of type 'array=
'
> >       from schema $id: http://devicetree.org/schemas/property-units.yam=
l#
> >     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: =
endpoint: ti,lvds-vod-swing-clock-microvolt:1: 600000 is not of type 'array=
'
> >       from schema $id: http://devicetree.org/schemas/property-units.yam=
l#
> >
>
> apologies for the delayed response, and thank you for the report.
>
> I've investigated the DT schema validation errors reported for my patch.
> The issue stems from using "$ref:
> /schemas/types.yaml#/definitions/uint32-array" for the
> "ti,lvds-vod-swing-clock-microvolt" and
> "ti,lvds-vod-swing-data-microvolt" properties, which seems to expect a
> different structure than what the DTS provides (a standard 2-element
> uint32 array).
>
> Replacing the "$ref" with an explicit array schema resolves the errors:
>
> >
> >   type: array
> >   items:
> >     type: integer
> >   minItems: 2
> >   maxItems: 2
>
>
> This matches the intended "<min max>" format in the DTS and passes
> validation.
>
> Would this be the preferred way to describe such properties, or is there
> another recommended style for handling this case?

All you should need is 'maxItems: 2'

Rob
