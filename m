Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996002FD1AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085884; cv=none; b=JjvYKDkNCwLvvPg7VpnoiNzHc6EOwlswYTXjQ6ZMgX1AK18EFttdmw/A2RUzjulUqP2UONzWd3XNchYWBsXzam2nKhIzDibZhN2zQJNcFGoym/1YvWvF4kiax5A3haMbaFXm/SXOPOUqssMEwQHNZeJFM7zkGWcUX55OuEicSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085884; c=relaxed/simple;
	bh=8udiGH1K52cJECGsI1ClAbnvDJp/X6dURVK8oXpqoD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uRVrrDaKxb6WcBIE3DmitYK16r6YPe6QDZEjuOGZbVEyhc9bI6OImX9M94bhjSKwFqkdGN2iRpKsgwDjUuRs5Jkk8MUGs6HV0iHEJDZ4E7HdM3t3ahUZA8BEeF51xmVGL3APa1a3VFl87qU+ljRTiPTRc39R4EkFadRGfNjDEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ihBR4h1R; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ihBR4h1R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ctDzRHf//CNeTwbj++Znf4F9PxyPwim8M9y2h8Atn+Y=; b=ihBR4h1RgOhpmhZ0Jq/tQYsWBv
	PprxkewAFxIp5/LhOTkq1iaJugmVqzYMWrFJ+bXs0UKdH4pdp1zGyrJ/8/7jhbMiD9YhjYo74im4k
	xIW9gdHow03OzmgZw8yI+2jiBzwzex2auFJvnDKEa76kWSKMc2vmFKxVvJA2/P7KqmWq2lJht6QcQ
	L8mBsQulWzGtcpQg4gurs4mWWVOqF1feyIri8dqpzDUiLTNKauTnSQ0WQiWqe66FPNp5gFf1OT4eK
	4qgM+LQdM/aKTdbsmZG0NIgAlxyEFgsUFTENtkE7mKSeoTzUwGXJBf3Gd1bwUi1PX1G57hZ8WWNOy
	lmYKYn7w==;
Received: from i53875b8b.versanet.de ([83.135.91.139] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1umA0Z-0003YE-W2; Wed, 13 Aug 2025 13:51:08 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject:
 Re: [linux-next:master 1286/1649]
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: /npu@fdab0000: failed to
 match any schema with compatible: ['rockchip,rk3588-rknn-core']
Date: Wed, 13 Aug 2025 13:51:06 +0200
Message-ID: <3384732.G96rZvMJ2N@diego>
In-Reply-To: <202508131428.tYcAx1Pp-lkp@intel.com>
References: <202508131428.tYcAx1Pp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Mittwoch, 13. August 2025, 08:56:11 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
> commit: a31dfc060a747f08705ace36d8de006bc13318fa [1286/1649] arm64: dts: =
rockchip: Add nodes for NPU and its MMU to rk3588-base
> config: arm64-randconfig-051-20250812 (https://download.01.org/0day-ci/ar=
chive/20250813/202508131428.tYcAx1Pp-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3=
769ce013be2879bf0b329c14a16f5cb766f26ce)
> dtschema version: 2025.6.2.dev4+g8f79ddd
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250813/202508131428.tYcAx1Pp-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508131428.tYcAx1Pp-lkp=
@intel.com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: /npu@fdab0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: /npu@fdac0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: /npu@fdad0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']

The Rocket driver for the NPU supplying this compatible is in
drm-misc-next for quite some time now [0], but it seems has
not yet fully reached drm-next / linux-next.

I expect this happen in the next days, so this should go away
on its own then.


Heiko


[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next/dri=
vers/accel/rocket

> >> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /npu@fdab0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /npu@fdac0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /npu@fdad0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /npu@fdab0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /npu@fdac0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: /npu@fdad0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /npu@fdab0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /npu@fdac0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: /npu@fdad0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /npu@fdab0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> >> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /npu@fdac0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> >> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: /npu@fdad0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /npu@fdab000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /npu@fdac000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: /npu@fdad000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /npu@fdab000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /npu@fdac000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: /npu@fdad000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
>    arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1410.7-1418.4: Warnin=
g (graph_child_address): /usb@fc000000/port: graph node has single child no=
de 'endpoint@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /npu@fdab0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /npu@fdac0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: /npu@fdad0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: /npu@fdab0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: /npu@fdac0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: /npu@fdad0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
>    arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4:=
 Warning (graph_child_address): /usb@fc000000/port: graph node has single c=
hild node 'endpoint@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /npu@fdab00=
00: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core=
']
> >> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /npu@fdac00=
00: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core=
']
> >> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: /npu@fdad00=
00: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core=
']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /npu@=
fdab0000: failed to match any schema with compatible: ['rockchip,rk3588-rkn=
n-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /npu@=
fdac0000: failed to match any schema with compatible: ['rockchip,rk3588-rkn=
n-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: /npu@=
fdad0000: failed to match any schema with compatible: ['rockchip,rk3588-rkn=
n-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /npu@fdab0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /npu@fdac0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: /npu@fdad0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
>    arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning =
(avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cel=
ls/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning =
(avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cel=
ls/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning =
(graph_child_address): /usb@fc000000/port: graph node has single child node=
 'endpoint', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning =
(graph_child_address): /usb@fc400000/port: graph node has single child node=
 'endpoint', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /npu@fdab0000: failed =
to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /npu@fdac0000: failed =
to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: /npu@fdad0000: failed =
to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /npu@fdab0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /npu@fdac0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: /npu@fdad0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /npu@fdab0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /npu@fdac0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /npu@fdad0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /npu@fdab0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /npu@fdac0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: /npu@fdad0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /npu@fdab0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /npu@fdac0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: /npu@fdad0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /npu@fdab0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /npu@fdac0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: /npu@fdad0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdab0000=
: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdac0000=
: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdad0000=
: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /npu@fdab000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /npu@fdac000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: /npu@fdad000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /npu@fdab0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /npu@fdac0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: /npu@fdad0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
>    arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1186.7-1194.4: Warn=
ing (graph_child_address): /usb@fc000000/port: graph node has single child =
node 'endpoint@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /npu@fdab0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /npu@fdac0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /npu@fdad0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /npu@fdab0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /npu@fdac0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: /npu@fdad0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /npu@fdab0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /npu@fdac0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /npu@fdad0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: /npu@fdab0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: /npu@fdac0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: /npu@fdad0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /npu@fdab0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /npu@fdac0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: /npu@fdad0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /npu@fdab0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /npu@fdac0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: /npu@fdad0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /npu@fdab0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /npu@fdac0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: /npu@fdad0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /npu@fdab0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /npu@fdac0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: /npu@fdad0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
>    arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1172.7-1180.4: Warni=
ng (graph_child_address): /usb@fc000000/port: graph node has single child n=
ode 'endpoint@0', #address-cells/#size-cells are not necessary
> >> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /npu@fdab0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /npu@fdac0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: /npu@fdad0000: fail=
ed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /npu@fdab0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /npu@fdac0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /npu@fdad0000:=
 failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /npu@fdab000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /npu@fdac000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: /npu@fdad000=
0: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /npu@fdab0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /npu@fdac0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: /npu@fdad0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /npu@fdab0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /npu@fdac0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: /npu@fdad0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /npu@fdab0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /npu@fdac0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: /npu@fdad0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /npu@fdab0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /npu@fdac0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: /npu@fdad0000: fai=
led to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /npu@fdab0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /npu@fdac0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: /npu@fdad0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /npu@fdab0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /npu@fdac0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /npu@fdad0000: f=
ailed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /npu@fdab0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /npu@fdac0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /npu@fdad0000: failed=
 to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /npu@fdab0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /npu@fdac0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: /npu@fdad0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: /npu@fdab0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: /npu@fdac0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: /npu@fdad0000: faile=
d to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /npu@fdab0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /npu@fdac0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: /npu@fdad0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /npu@fdab0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /npu@fdac0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> >> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: /npu@fdad0=
000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-cor=
e']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: /npu@f=
dab0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn=
=2Dcore']
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: /npu@f=
dac0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn=
=2Dcore']
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: /npu@f=
dad0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn=
=2Dcore']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /npu@fd=
ab0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-=
core']
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /npu@fd=
ac0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-=
core']
> >> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: /npu@fd=
ad0000: failed to match any schema with compatible: ['rockchip,rk3588-rknn-=
core']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: /npu@fdab0000=
: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: /npu@fdac0000=
: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: /npu@fdad0000=
: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
>    arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150=
000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpc=
ie3v3-supply' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-e=
p.yaml#
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: /npu@fdab00=
00: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core=
']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: /npu@fdac00=
00: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core=
']
> >> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: /npu@fdad00=
00: failed to match any schema with compatible: ['rockchip,rk3588-rknn-core=
']
> --
> >> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb=
: /npu@fdab0000: failed to match any schema with compatible: ['rockchip,rk3=
588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb=
: /npu@fdac0000: failed to match any schema with compatible: ['rockchip,rk3=
588-rknn-core']
> >> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb=
: /npu@fdad0000: failed to match any schema with compatible: ['rockchip,rk3=
588-rknn-core']
>=20
>=20




