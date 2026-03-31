Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3691C401A34
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970186; cv=none; b=XwvoEqbeNonHOfJOQYF5uYBAnRsrmkNWnxvaVizVthp2vYQ44vnSyC1/KvFi635rSdqXXergQJsAvvGmPZvyMHd3CCAMG6U08Cc5TDOqslyBh/g13od2WvUDYdA6CSKaNkdbXsbfFsXtgUPGp0ffdhWvi04cbP45csLsKGPw3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970186; c=relaxed/simple;
	bh=rI2xg8opKsJBh6DIo38L6n0i+smHwievEfZ4lSuOmuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUl7dxu2maSJ4g7QzWd5Uo6iON+yhIVcsp0aBIbFdc6/Vcr+00yHUVSQdCuCXKDWnInBcQUHGYjpcHrRAUK3mwt8feTU4vazd1xqxBG6t0m70hNAB0XCj3gyyksuFUTx0NiOGsCdTGjEL2a8PzGh5YBH8vgnZbuTd9vKH4kaa1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWyo0cPC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWyo0cPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA3FC19424
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774970185;
	bh=rI2xg8opKsJBh6DIo38L6n0i+smHwievEfZ4lSuOmuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gWyo0cPCRR/dB8U925HNW1dB1kxHSxwcmZbr7KL+POQkrOkO9jl60E1kjDVoa0lLN
	 KXssJ5JeHjx5USxtVymNN3Bt6XL01VnI5R66ST8yRvuX1dJ4w/yYSuN4iBBEi1wkcb
	 8VScP1UR5XyH4ktzWKa+Inkc7hbg2btYPvyqEZKgKOmukJAeOrfLlieGzBoo5XPiGU
	 veOyyaSup2FnQgizIGcoTqhPITqHm6rcEWUphZeJtu2KuSADxNGCSB0B8IefoubLZ8
	 Vva35QjgqgSb6Eh8J4gIFN74ZyDsTvibY06PYUXMvmCCfAbW+BP1J3VgT+aDzaUnco
	 YCItP0mfM9rAg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66d65646c65so174839a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 08:16:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy4txWWqM8sudo57aAnGB/p6wzLmFE69bpY9tWUdyy88qH7HfqVX7CpfHyQ7VWhT+42xECbthyZFZZo24u@lists.linux.dev
X-Gm-Message-State: AOJu0YwQW34V7GQ9ruj1vS/78ljNo9ZjtCapWGuZo/bU68HUNZ0xHUU2
	HU5Psksj5w1uDUOjHClrJfv0uCwa7FiKHgBXoX7TNU3FU9XqA+PWt6yb17VBkzQJLsbfbNpepgy
	8dyjfbYVNJIuXsOWwsEWP6DhofkLnWw==
X-Received: by 2002:aa7:c3ca:0:b0:66b:3c98:6587 with SMTP id
 4fb4d7f45d1cf-66c3385a049mr1765817a12.14.1774970184397; Tue, 31 Mar 2026
 08:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603271742.UMycleyh-lkp@intel.com> <87qzp0828j.fsf@bootlin.com>
In-Reply-To: <87qzp0828j.fsf@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 31 Mar 2026 10:16:12 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pOUuLPaPzQzGVQ_ENq_-7481cxgArbxdSbrPSVpafJA@mail.gmail.com>
X-Gm-Features: AQROBzAoV7GUb6xXCaarSPgBi-8y86qkRm_RCLx4vwkC3Ul654u-JI3Eo2F02pw
Message-ID: <CAL_Jsq+pOUuLPaPzQzGVQ_ENq_-7481cxgArbxdSbrPSVpafJA@mail.gmail.com>
Subject: Re: [linux-next:master 8419/9801] arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb:
 nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not
 allowed ('clock-names' was unexpected)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: kernel test robot <lkp@intel.com>, Frank Li <Frank.Li@nxp.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 10:09=E2=80=AFAM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hello Frank,
>
> >>> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dtb: nand-=
controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowe=
d ('clock-names' was unexpected)
>
> I haven't investigated the problem, I believe we do not reference any
> yaml file to authorize clock-names, there should probably be one (or a
> manual addition in the -legacy.yaml.

That should surely go in a specific controller schema.

> Can you send another follow-up to tidy this up before the merge window
> opens?

We're really not close to no warnings on arm32, so I wouldn't worry
about this one too much.

Rob
