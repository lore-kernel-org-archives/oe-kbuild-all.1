Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619E18FC91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319478; cv=none; b=fB70dcZGAwDBEiS4pqtA0T5piUFRefZ+C+tiOqBkNS0qnDMYopUb6ZVkZx0mdqZJqHaBEAPZbkNAG677N8XzOwsc9QZU1Y9kWbRBKLBhhmzx1+O+zwn3PdeQyN42Sb+qVEqUrgJNcpe5z+oKwpH+pIhR5xg5TJNrHhVTjz4y3KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319478; c=relaxed/simple;
	bh=AyEUhzg/CF+u+Jvp4t2YvSPVolejY6f9goQIef7us50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liRJu8AaNxhp3GJ6pOHr98CxYPZXYSBHYyTzR/bmqghWBi97y0UylBCV/TQmHfg7j84Lu9hZHHdWDPAUVh9VYGxg5kekv5eke4cbpXSksK/AqeiYePA52h+oG2sOnqgDDRe4i4W0B3BsZ/bh66vjhHQS6S0p2PKSK7jqiFQm3p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Hszkrbog; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pQJtDB4M reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Hszkrbog";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pQJtDB4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747319475; x=1778855475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nnis2Ixks07bqEwjjCU48V6rCXhkVbKB57we+5pKGzE=;
  b=HszkrbogJ7L/S8ovOePWQzrQL1wf4tIXMhjCVMYkZhxXvh1w9eQ5NTwK
   Vvpp5x9IBAc7R0BO/0Mp8u5ivZMjGiy+gc1sYtwRqoihfYPQnFbyo73pF
   PcX7eHQYSJdsW+4a6ghtl/cQ4AEEJnndhWUau0nShNLXkIqfDY+jhdR6T
   a5EMxPNuZASUqrbYCCpXd9Y/K3+y5tDrVBMPe9c++p7fzrto2BpJhz/Ma
   tjmA+6D6oV1MXzkI67kteYvfroq2L0vXGWW+uZEQocP6PoPuQUK9YbxSD
   LhVPhx7JYJTU9k3x0Gh/bDIYGu11Q933kyiHixJLBclPUzOzOKH8kqeyb
   Q==;
X-CSE-ConnectionGUID: ZXhsFuNFQ1iJ1j/R4Bv/Gg==
X-CSE-MsgGUID: EtjKOKSLSDm8PCkrbTRdNQ==
X-IronPort-AV: E=Sophos;i="6.15,291,1739833200"; 
   d="scan'208";a="44102250"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 May 2025 16:31:13 +0200
X-CheckPoint: {6825FAB1-3-BF62DDF1-CB8BF55F}
X-MAIL-CPID: C6C41B994A20E2E6935A8AB3FF312BAB_1
X-Control-Analysis: str=0001.0A00639A.6825FAB6.0041,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1FE516A011;
	Thu, 15 May 2025 16:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747319469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nnis2Ixks07bqEwjjCU48V6rCXhkVbKB57we+5pKGzE=;
	b=pQJtDB4MytM+8YJfxUUQR3NPJE549acsDKatIHTsTzqMkw00c01ZUOhR1KgrfO7VmDp9S+
	v+6VkE+q++9I+7zN9No/ZszjURiFTfVqkEBest5vWe0ebqED5Uxya0BHUrorQw/pD1pXHa
	x8qXVOWepKitrkQYt5Hxx1B8yPsR2ha8J3Rwf2rUF3rXZWem1jobVWgPQzyCUcaVv3remQ
	bKrmT+24YHgrk35gK9tM6V0BTNYFjhdFofAECcAhDxKGVG/YWoa7BydwpqUa5NL4ydzZwF
	CsQjQuxe4pd8nUqDjQKr61d+sspiEleTKZjM/SS00nSthwEqqTqIhkhJUVOH1g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>
Subject:
 Re: [linux-next:master 8991/11093]
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb:
 camera@10 (sony, imx219): 'orientation',
 'rotation' do not match any of the regexes: '^pinctrl-[0-9]+$'
Date: Thu, 15 May 2025 16:31:07 +0200
Message-ID: <4673935.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <202505151412.lkZyg8yI-lkp@intel.com>
References: <202505151412.lkZyg8yI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Donnerstag, 15. Mai 2025, 16:05:07 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
> commit: 6c2df49628c15ea8bca9d04b84fdf70549152da1 [8991/11093] arm64: dts:=
 imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camera V2 overlay
> config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/a=
rchive/20250515/202505151412.lkZyg8yI-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> dtschema version: 2025.3.dev27+g32749b3
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250515/202505151412.lkZyg8yI-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505151412.lkZyg8yI-lkp=
@intel.com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx2=
19.dtb: camera@10 (sony,imx219): 'orientation', 'rotation' do not match any=
 of the regexes: '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
> --
> >> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dt=
b: camera@10 (sony,imx219): 'orientation', 'rotation' do not match any of t=
he regexes: '^pinctrl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
>=20
>=20

Will be fixed by [1].

Best regards,
Alexander

[1] https://lore.kernel.org/linux-media/20250515142945.1348722-1-alexander.=
stein@ew.tq-group.com/T/#u
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


