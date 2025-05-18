Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5478615A;
	Sun, 18 May 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747576649; cv=none; b=uoyJGYv8wFqmlpAMajXK2bDyg2yiIr+aMM6jXxLtSU0itAZEj4PUiaBaUEv3kRhpyGmibn2fhEkdeJPhpL1QlmENXU/+J8f/6Xgtl5H91Ti23jY/qA/HctcSc6yts/UtRQ8a8Q0nWSd0kQa239BxUB8ey1VsCxyOTy7364VEAe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747576649; c=relaxed/simple;
	bh=0guoTVEf0JLLAhF7vqrd71VVzRoEOAz7Uv4UP9QZJZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2iD6x+5b/mFBLGHuKBne50ObGLMqj7UQ7i1Gfx1CWb8VSjUKjwtcJg3GCukDe9TQnp/zNq6cHlJbt8Cg+5RJ7MLynU7qsgEt8IcerRIIPtjLtBL70k7vkXRP0/c7FIosMpDtHm95YSKFdcvSN41samLolOTS9m4EvvFmGAycqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=u+xNnM8b; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="u+xNnM8b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8n1qhNBG9aKCngN6y44GHqsGUf3hTGo9f/XMCdBaqNI=; b=u+xNnM8bAVkEi+EEoXbSBB1F71
	gbFybuoAdhIft85qDzxeeXz9yvHCGMQtFecDkPXIURmMZEG/iyCVaiRkCK/qXv0G579Vfto6m1m+X
	oRsFBhclFcwyZmW5NU3Zh9MGlAWwUi4rc9xEY7p+c2+Hgf84R2uP4Y0C8yfpUmfaCYuBOLoEDVu/k
	eqgtXrfUbX6ndPiItrv4c+fc0hzbo0oiYRGbQndAhgkUAABfa5Wmv6kPwl4shs1D1TKpx0M2oqjKD
	QXgKwzZ1qTdtx60wwQ5IOV0VT5bXSU3xs8kj1Nrw3c4KwIp+c2eMZbDmTTV3tXMlZDQ6Cfd8YdzN+
	osABZZ5w==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGeW2-0003lu-JI; Sun, 18 May 2025 15:57:22 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Finley Xiao <finley.xiao@rock-chips.com>,
 kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Kever Yang <kever.yang@rock-chips.com>
Subject:
 Re: [linux-next:master 9473/11093]
 arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning
 (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error,
 expected "fe000000"
Date: Sun, 18 May 2025 15:57:21 +0200
Message-ID: <2410023.BjyWNHgNrj@diego>
In-Reply-To: <3c3d0020-1dce-4364-a0a1-7c35b21e93de@kernel.org>
References:
 <202505150745.PQT9TLYX-lkp@intel.com> <3983362.fW5hKsROvD@diego>
 <3c3d0020-1dce-4364-a0a1-7c35b21e93de@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 18. Mai 2025, 12:36:50 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Krzysztof Kozlowski:
> On 16/05/2025 22:10, Heiko St=C3=BCbner wrote:
> > Am Donnerstag, 15. Mai 2025, 16:04:20 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb kernel test robot:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
> >> head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
> >> commit: ceb6ef1ea9002669afc0e1ef258e530d3c05d91a [9473/11093] arm64: d=
ts: rockchip: Add RK3562 evb2 devicetree
> >> config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-c=
i/archive/20250515/202505150745.PQT9TLYX-lkp@intel.com/config)
> >> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-projec=
t f819f46284f2a79790038e1f6649172789734ae8)
> >> dtschema version: 2025.3.dev27+g32749b3
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20250515/202505150745.PQT9TLYX-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202505150745.PQT9TLYX-=
lkp@intel.com/
> >>
> >> dtcheck warnings: (new ones prefixed by >>)
> >>>> arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning (simp=
le_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error, expe=
cted "fe000000"
> >>>> arch/arm64/boot/dts/rockchip/rk3562.dtsi:1115.20-1181.5: Warning (si=
mple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
> >=20
> > hmm, I don't really understand this error message.
> >=20
> > From a practical point, the dtschema-version I have installed is
> > 2025.3.dev27+g32749b3, which is the topmost commit from
> > may-13th.
> >=20
> > Running the dtbscheck on the rk3562-evb-v10.dtb on the full
> > linux-next from today, yields no errors.
>=20
> These are standard dtc warnings.
>=20
> >=20
> > Checking out the specific commit ceb6ef1ea90026 brings up the
> > errors from below [1], because they come from different trees.
> >=20
> >=20
> > But in no cases does dtbscheck complain about the PCI memory regions.
> >=20
> >=20
> > The PCIe controller in question of course has 3 memory regions
> > 	reg =3D <0x0 0xfe000000 0x0 0x400000>,
> > 	      <0x0 0xff500000 0x0 0x10000>,
> > 	      <0x0 0xfc000000 0x0 0x100000>;
> > 	reg-names =3D "dbi", "apb", "config";
> >=20
> > and currently the node-name mimics the "apb" memory region.
> > Should it always use the first one?
>=20
> I don't understand where is the problem. The warning tells you: unit
> address is not correct. Fix the unit address to match reg.

The problem was more on "is my toolchain outdated or why am I not seeing
these reports". Which I now managed to resolve, because I finally saw the
"(this is a W=3D1 build)" in the header of the reporting mail ;-)


So yes, with the dtschema warning about the power-controller I got my mind
stuck in the "is my dtschema" outdated, not realizing that the first one
comes from dtc itself and then also missing the "(this is a W=3D1 build)"
mention.


Heiko


