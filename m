Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1C74BB5C2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601463; cv=none; b=kXj9CMn44UbNfifz7/YZOioTC38SR+umx3hSlkAEtGOBaisJBxXzqu+ETHCisEJ5hHG7vWpwJ39mXwXU/S1eiJzK4htlSYARIEx3P8gJaRYAXuE8iFMkwyPjVBPV06d3vbQj3Pxccyng7wkODQDeVlXqqdnReF7zQIDT3L9AwRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601463; c=relaxed/simple;
	bh=B5e4Y/8Jpt0CRNwIWg8i+L38AGaZNBusbNW4bwycAHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gliAgYdtv+ZVHtBiXx55GhaMy39Cy7mICt72oUgrL1DkvZp+/Hp/roHWGTyH3Zn0n8PFXch6JTpAoXHOVOyNIqijX+y8nuwA2YNFXZoTOKlOw/ufi/5fgluEFzE3ikGKr0RcYUoz46cloTgKJOrknPWIPWBr1jG5dCkuMFFWMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFVKBsQW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFVKBsQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C661F00893
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601462;
	bh=uhKhczyRZLzEw+SqHPHUKwxDT3bVsdZCgMgeMPy19eo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EFVKBsQWaOpccuNZWzBBg7cZ0bV4bC0Yp6LY5zLEm6MHROHWfBOC8plcCQ2q9rkft
	 494vKVY/v69e+wh996NZrYy+ronElufyuz3zdZrLCI090HM0ygKZ7QEGy9DHGbmJQe
	 UJKnTJyNTDVehy8UCIoFhLsA2gYX4FB2XGHHx4RcFzRuozhYZ7ITq7c8oP684c1eXG
	 qDA6TXNUZi6VbXybUcpdItxOUfm1tEn0JVc/AXJT+FWALKSe/NGxCykiHveTI+s2c/
	 HrnGX5TMlvUAWTWheFBKeKzu8lYbsaW1tUtAonq1+Cw5GkPYHihyPp+kp/JyFuuIPX
	 UHLj4nmiNHBEQ==
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-49172f18b40so1796782fac.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 06:17:41 -0700 (PDT)
X-Gm-Message-State: AFq9FYIa8/S+GwvO0PcetJjSBihy6LlMM9OWIUiZjnlw4yKtwsf2OwbR
	enMSW9lnE87cNmZc/YFSG9ApVrU9pHsHhzXLjASwuLcvZuhF9hr7GYGm/ty5ThDP1c5dNSSD3ME
	DIwFJXt24V5vPY7IMj4vWh0sipxz4M4E=
X-Received: by 2002:a05:6871:520b:b0:48f:e107:317c with SMTP id
 586e51a60fabf-491e6ef7866mr11786707fac.47.1790601461328; Mon, 28 Sep 2026
 06:17:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609281317.NLIoabJG-lkp@intel.com>
In-Reply-To: <202609281317.NLIoabJG-lkp@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 28 Sep 2026 15:17:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbM8VJgy+Vp+6Zn2hAW9UhbW5UKMUR0cCkkU8=9oTsVw@mail.gmail.com>
X-Gm-Features: AclHuK91vNxmCXLrf4gim0NbjQSllPnOveobas3dvDREBuErJhH9wrG-dHFK0mg
Message-ID: <CAD++jLmbM8VJgy+Vp+6Zn2hAW9UhbW5UKMUR0cCkkU8=9oTsVw@mail.gmail.com>
Subject: Re: [linux-next:master 6897/10910] arch/arm/boot/dts/st/ste-href520-tvk.dtb:
 msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:45=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> commit: cc47a544d4f7e4d5603af2e0d5c18fbdac5fe257 [6897/10910] ASoC: dt-bi=
ndings: sound: Prepare Ux500 audio graph links
> config: arm-randconfig-2404-20260923 (https://download.01.org/0day-ci/arc=
hive/20260928/202609281317.NLIoabJG-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> dtschema: 2026.10.dev4+g568711590
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260928/202609281317.NLIoabJG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609281317.NLIoabJG-lkp=
@intel.com/

This is because of patches queued in parallel for SoC:
https://patchwork.kernel.org/project/linux-soc/patch/CAD++jL=3Dvbc7DM1RB8_V=
fzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com/

If this is a big problem I can try to forestall the merging of this series.

Yours,
Linus Walleij
