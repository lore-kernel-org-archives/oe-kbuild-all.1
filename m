Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B022C356;
	Fri, 16 May 2025 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747426215; cv=none; b=LFEVrwGALzL5UWPwsct6SNfpIM0iv9SVziNkg9Qe8JJyy19dwOyJkMxIQtUKZWym5TuUBdcRd8VtTHAoKKOk6JKEAYxoCqZhBH+jw3b9tRgWhppkSn2DQ+ASHpH+vz3qbq+fjTTT+YTeV86NNx9NBesyKwV7l1gBOWIVK7HkgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747426215; c=relaxed/simple;
	bh=2e/6iUxTrx5nSFpVgyz1b/DK7YLQxC4kUUQt9HxsL/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BNfmHtYb05T7YnWY4iiBElM+piTZ5cVIgXAc/J5h8UnCS4RrUXs9EwoXEUPAHpPIGrpElljsf4mv5o53PsPP5OXQN80imkUilyJSCzKFo4yAAY3xwHXukOWnmJeoiJkb9qbZHoNquf/mCIafm0GQwLzJ9yq7Q0QDh8PnMKy3Fc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=2uDmcFx2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="2uDmcFx2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4GWgmLyTl8Gk7HWPKH3auqn15uG60IPCLLC27zlld+U=; b=2uDmcFx2iH0atwEuyZslnoA/0e
	BBye0RDnqTqbtAf/uz2jOx/Sp3HaZw+uRLNPW0iyEdjqf5pxj1qDrr86wmaKkAFyePPnhwYeDjoOt
	J549FxwSNA8sb49hmXVkgFBiIwJwFiPozl4XJiJwW/Ys2beQgjsALDx5kB9v9er8o6Zk6hMcHGzN2
	jcBZ50uwE/375RfFcHFie5E/vOWoCsz1qTkacLLRB0JiAtkqxGKVMRdriEFQSdyu+Wg1RDmYhgyvK
	2Zq7dnAXP6iFICbdX2060oMBO2qXfRM2rrY2JsfGsDghYFZKQ3M+74/zlMQAEn1xJv/Edlob9B3NS
	ZkdUb5Ww==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uG1Nc-0007aP-NQ; Fri, 16 May 2025 22:10:04 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Finley Xiao <finley.xiao@rock-chips.com>,
 kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Kever Yang <kever.yang@rock-chips.com>
Subject:
 Re: [linux-next:master 9473/11093]
 arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning
 (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error,
 expected "fe000000"
Date: Fri, 16 May 2025 22:10:03 +0200
Message-ID: <3983362.fW5hKsROvD@diego>
In-Reply-To: <202505150745.PQT9TLYX-lkp@intel.com>
References: <202505150745.PQT9TLYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 15. Mai 2025, 16:04:20 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
> commit: ceb6ef1ea9002669afc0e1ef258e530d3c05d91a [9473/11093] arm64: dts:=
 rockchip: Add RK3562 evb2 devicetree
> config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/a=
rchive/20250515/202505150745.PQT9TLYX-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> dtschema version: 2025.3.dev27+g32749b3
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250515/202505150745.PQT9TLYX-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505150745.PQT9TLYX-lkp=
@intel.com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning (simple=
_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error, expect=
ed "fe000000"
> >> arch/arm64/boot/dts/rockchip/rk3562.dtsi:1115.20-1181.5: Warning (simp=
le_bus_reg): /soc/pinctrl: missing or empty reg/ranges property

hmm, I don't really understand this error message.

=46rom a practical point, the dtschema-version I have installed is
2025.3.dev27+g32749b3, which is the topmost commit from
may-13th.

Running the dtbscheck on the rk3562-evb-v10.dtb on the full
linux-next from today, yields no errors.

Checking out the specific commit ceb6ef1ea90026 brings up the
errors from below [1], because they come from different trees.


But in no cases does dtbscheck complain about the PCI memory regions.


The PCIe controller in question of course has 3 memory regions
	reg =3D <0x0 0xfe000000 0x0 0x400000>,
	      <0x0 0xff500000 0x0 0x10000>,
	      <0x0 0xfc000000 0x0 0x100000>;
	reg-names =3D "dbi", "apb", "config";

and currently the node-name mimics the "apb" memory region.
Should it always use the first one?


[1]
>    arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/power-managemen=
t@ff258000/power-controller: failed to match any schema with compatible: ['=
rockchip,rk3562-power-controller']
>    arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockc=
hip,rk3562-pcie): interrupt-names:5: 'dma0' was expected
>    	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.y=
aml#
>    arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockc=
hip,rk3562-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
>    	['rockchip,rk3562-pcie', 'rockchip,rk3568-pcie'] is too long
>    	'rockchip,rk3568-pcie' was expected
>=20



