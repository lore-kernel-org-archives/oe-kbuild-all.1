Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0B03D6CC9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 21:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785793009; cv=none; b=CaM0QOfzkBJZ7VaSzKtFKB+dp9ADr975zW1mwyp/UlMNjbq3ft0f5yLmRLqLmuUTrLGKfDwa04h42K1yUe7WXRHm44LNI3To9qje6vQcpEBIBNbdxh1xgztl5eNqfUuKAWCkssP8ivWN1AZLYf5qmxBx8/IhC2XfuJd6GNrBcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785793009; c=relaxed/simple;
	bh=qDfMsUIbbSJ3sV1yui6BOY9/QkqKd4R74mrTeWlNq+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yb+nRe0zRWyU+WyfI8RI/UKW67RQzCUH01lFNZ9tG1z7W75fdguKKS1sBao3gVt8RYaFL7Xcp9jGcwrqdteVQsyFY1TkUYjPD/jnDUW5d2wLyf+OY5JNb5VOb4dXF//xT5xIG+ma2x4W/UMM3EMaJd3ehTwnj0z26baCDtE2cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=lukffWQK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="lukffWQK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aQyu2YhdMj+Ucz91Qm1lwCrCW2EgrnvTO15g6p8z0cY=; b=lukffWQKrwn2E/75Xct9op5Bed
	ZmSNCeyuK+AyEXqcDreuZ4Nx94MTBsPBBsdlt50EQt+rm34NGpSzc8jHTnyXK/Oa4W72jwUiUdY/p
	YFbKcLc3XKeReEUpISI0UUcp5u+n4oYr1FPfExeJ2Aumvaj1FquuWrdJJZqcDa9htVxZiuk9kgZPA
	IHufwzROyt370OlXghbs407euoZcrgnn+ytdcmy4/tJA/Me5W9Sx1ohpmhnINZhL7k0RbDPrICvFY
	YgP2slZ2ltqX0wo31yr3UJMEMWNNyMCGGizdW/KlcuZAihIzNIJvH5zc6nCzWVUieqs/FvkLK2YTf
	JCcOIxHQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chris Morgan <macromorgan@hotmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Subject:
 Re: [linux-next:master 11606/12137]
 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dtb: /i2c@fe5b0000/imu@68:
 failed to match any schema with compatible: ['invensense,icm42607p']
Date: Mon, 03 Aug 2026 23:36:10 +0200
Message-ID: <9266549.DvuYhMxLoT@diego>
In-Reply-To: <202608032147.AcElFYvh-lkp@intel.com>
References: <202608032147.AcElFYvh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 3. August 2026, 21:58:10 Mitteleurop=C3=A4ische Sommerzeit schri=
eb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
> commit: 264429dfe5294b76c7c3b4ed2c9e6cea1042255c [11606/12137] arm64: dts=
: rockchip: Add icm42607p IMU for RG-DS
> config: arm64-randconfig-2054-20260802 (https://download.01.org/0day-ci/a=
rchive/20260803/202608032147.AcElFYvh-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a=
de128740327db281859708ddcb3b072903b3414)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> dtschema: 2026.7.dev1+g2203c1720
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260803/202608032147.AcElFYvh-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608032147.AcElFYvh-lkp=
@intel.com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dtb: /i2c@fe5b0000/=
imu@68: failed to match any schema with compatible: ['invensense,icm42607p']

The series/patch introducing the compatible has been added to the
iio-tree at:
https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=3Dt=
esting&id=3D2ffc35d202d82e5335900e93ac57496a7c492ae6

So this should hopefully still make in time for the next merge-window.


Heiko


