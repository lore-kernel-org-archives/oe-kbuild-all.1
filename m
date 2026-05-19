Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283A23EFFD6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181276; cv=none; b=daj8fZcuA6qoRsO5bhdPzWAhM1LGxPuDOpinNQ0zI3uj6D+wOqA2/NzwaeyBaqeLuLRcI0urcpn+bny8vgYY0Zhg/AIb5NSQKMBio8k1G8OrxvH07DswK5lok0n4ftMhA/IjmIDaLts3aIVoROt34UHMJPgS/OvyqmjCqVy9jiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181276; c=relaxed/simple;
	bh=R1js73BWuSqfrhzq/ZzZ+rordaHG57Rk80gzZ3b1dPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rVeE8DexkbJms5CPGYuYc21LhYAJYiJpyKK8AQqSsdRgnz8XbWDbXXXBw7wFCkILdfyxHV1kwyHehdK2c6r+zrVys4fsx8uv33yZ8lwbGJEmemhHroIAhYmyaYu7PZKVeDqD0U6L8NpcsdIDoI+aWAT3guSEFm9P1FKSbrfHS5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vwPZ6zKI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vwPZ6zKI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WziPWamifcKX4St6Vf3EdW6k6ifotCaXRT0zkIa4CeE=; b=vwPZ6zKIW/7BVmTEWHBKCtqKA/
	zHHMhb6+WaVEnGHf6jin7xo7JmUcgnn/NLBbFAf+gSCLgsQsbbbv6SD+IxHChMDEEXtwjuHqsosdG
	aFyotnJ3XlOkR/F+NQe2cDUMmhPx34BLML46fyYjwJVQxioo7gZ2kksaVecWmqjdCdk9CofRZB3xS
	jHsGvM0gvvFowE6um0i8V1cBkI8fJ3fyvI1M4xaHlmI1cObbWwy+ztx6eArEBTpHUDL1dncdtqDG+
	APFiXAJVAXVhLfXMrjOyOcaCdZAGoS6Q1cwvPhshdFPs+NrrqxKTxc686U7vac7HbSJ/xE1u3cM92
	KvByPWYw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rosen Penev <rosenp@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>
Subject:
 Re: [linux-next:master 4652/6115] arch/m68k/include/asm/hash.h:57:24: sparse:
 sparse: cast truncates bits from constant value (18720 becomes 8720)
Date: Tue, 19 May 2026 10:57:01 +0200
Message-ID: <42228466.J2Yia2DhmK@phil>
In-Reply-To: <202605191434.PQkj2Rki-lkp@intel.com>
References: <202605191434.PQkj2Rki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 19. Mai 2026, 08:43:20 Mitteleurop=C3=A4ische Sommerzeit schri=
eb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   80dd246accce631c328ea43294e53b2b2dd2aa32
> commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8 [4652/6115] clk: rockchi=
p: allow COMPILE_TEST builds
> config: m68k-randconfig-r133-20260519 (https://download.01.org/0day-ci/ar=
chive/20260519/202605191434.PQkj2Rki-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260519/202605191434.PQkj2Rki-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp=
@intel.com/
>=20
> sparse warnings: (new ones prefixed by >>)
>    drivers/clk/rockchip/clk-rk3528.c: note: in included file (through inc=
lude/linux/hash.h, include/linux/slab.h):
> >> arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bit=
s from constant value (18720 becomes 8720)
> >> arch/m68k/include/asm/hash.h:57:24: sparse: sparse: cast truncates bit=
s from constant value (1e8e8 becomes e8e8)
>=20
> vim +57 arch/m68k/include/asm/hash.h
>=20
> 14c44b95b3dcb8f George Spelvin 2016-05-26   4 =20
> 14c44b95b3dcb8f George Spelvin 2016-05-26   5  /*
> 14c44b95b3dcb8f George Spelvin 2016-05-26   6   * If CONFIG_M68000=3Dy (o=
riginal mc68000/010), this file is #included
> 14c44b95b3dcb8f George Spelvin 2016-05-26   7   * to work around the lack=
 of a MULU.L instruction.
> 14c44b95b3dcb8f George Spelvin 2016-05-26   8   */
> 14c44b95b3dcb8f George Spelvin 2016-05-26   9 =20
> 14c44b95b3dcb8f George Spelvin 2016-05-26  10  #define HAVE_ARCH__HASH_32=
 1
> 14c44b95b3dcb8f George Spelvin 2016-05-26  11  /*
> 14c44b95b3dcb8f George Spelvin 2016-05-26  12   * While it would be legal=
 to substitute a different hash operation
> 14c44b95b3dcb8f George Spelvin 2016-05-26  13   * entirely, let's keep it=
 simple and just use an optimized multiply
> 14c44b95b3dcb8f George Spelvin 2016-05-26  14   * by GOLDEN_RATIO_32 =3D =
0x61C88647.
> 14c44b95b3dcb8f George Spelvin 2016-05-26  15   *
> 14c44b95b3dcb8f George Spelvin 2016-05-26  16   * The best way to do that=
 appears to be to multiply by 0x8647 with
> 14c44b95b3dcb8f George Spelvin 2016-05-26  17   * shifts and adds, and us=
e mulu.w to multiply the high half by 0x61C8.
> 14c44b95b3dcb8f George Spelvin 2016-05-26  18   *
> 14c44b95b3dcb8f George Spelvin 2016-05-26  19   * Because the 68000 has m=
ulti-cycle shifts, this addition chain is
> 14c44b95b3dcb8f George Spelvin 2016-05-26  20   * chosen to minimise the =
shift distances.
> 14c44b95b3dcb8f George Spelvin 2016-05-26  21   *
> 14c44b95b3dcb8f George Spelvin 2016-05-26  22   * Despite every attempt t=
o spoon-feed it simple operations, GCC
> 14c44b95b3dcb8f George Spelvin 2016-05-26  23   * 6.1.1 doggedly insists =
on doing annoying things like converting
> 14c44b95b3dcb8f George Spelvin 2016-05-26  24   * "lsl.l #2,<reg>" (12 cy=
cles) to two adds (8+8 cycles).
> 14c44b95b3dcb8f George Spelvin 2016-05-26  25   *
> 14c44b95b3dcb8f George Spelvin 2016-05-26  26   * It also likes to notice=
 two shifts in a row, like "a =3D x << 2" and
> 14c44b95b3dcb8f George Spelvin 2016-05-26  27   * "a <<=3D 7", and conver=
t that to "a =3D x << 9".  But shifts longer
> 14c44b95b3dcb8f George Spelvin 2016-05-26  28   * than 8 bits are extra-s=
low on m68k, so that's a lose.
> 14c44b95b3dcb8f George Spelvin 2016-05-26  29   *
> 14c44b95b3dcb8f George Spelvin 2016-05-26  30   * Since the 68000 is a ve=
ry simple in-order processor with no
> 14c44b95b3dcb8f George Spelvin 2016-05-26  31   * instruction scheduling =
effects on execution time, we can safely
> 14c44b95b3dcb8f George Spelvin 2016-05-26  32   * take it out of GCC's ha=
nds and write one big asm() block.
> 14c44b95b3dcb8f George Spelvin 2016-05-26  33   *
> 14c44b95b3dcb8f George Spelvin 2016-05-26  34   * Without calling overhea=
d, this operation is 30 bytes (14 instructions
> 14c44b95b3dcb8f George Spelvin 2016-05-26  35   * plus one immediate cons=
tant) and 166 cycles.
> 14c44b95b3dcb8f George Spelvin 2016-05-26  36   *
> 14c44b95b3dcb8f George Spelvin 2016-05-26  37   * (Because %2 is fetched =
twice, it can't be postincrement, and thus it
> 14c44b95b3dcb8f George Spelvin 2016-05-26  38   * can't be a fully genera=
l "g" or "m".  Register is preferred, but
> 14c44b95b3dcb8f George Spelvin 2016-05-26  39   * offsettable memory or i=
mmediate will work.)
> 14c44b95b3dcb8f George Spelvin 2016-05-26  40   */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  41  static inline u32 __attrib=
ute_const__ __hash_32(u32 x)
> 14c44b95b3dcb8f George Spelvin 2016-05-26  42  {
> 14c44b95b3dcb8f George Spelvin 2016-05-26  43  	u32 a, b;
> 14c44b95b3dcb8f George Spelvin 2016-05-26  44 =20
> 14c44b95b3dcb8f George Spelvin 2016-05-26  45  	asm(   "move.l %2,%0"	/* =
a =3D x * 0x0001 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  46  	"\n	lsl.l #2,%0"	/* a =3D=
 x * 0x0004 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  47  	"\n	move.l %0,%1"
> 14c44b95b3dcb8f George Spelvin 2016-05-26  48  	"\n	lsl.l #7,%0"	/* a =3D=
 x * 0x0200 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  49  	"\n	add.l %2,%0"	/* a =3D=
 x * 0x0201 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  50  	"\n	add.l %0,%1"	/* b =3D=
 x * 0x0205 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  51  	"\n	add.l %0,%0"	/* a =3D=
 x * 0x0402 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  52  	"\n	add.l %0,%1"	/* b =3D=
 x * 0x0607 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  53  	"\n	lsl.l #5,%0"	/* a =3D=
 x * 0x8040 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  54  	: "=3D&d,d" (a), "=3D&r,r=
" (b)
> 14c44b95b3dcb8f George Spelvin 2016-05-26  55  	: "r,roi?" (x));	/* a+b =
=3D x*0x8647 */
> 14c44b95b3dcb8f George Spelvin 2016-05-26  56 =20
> 14c44b95b3dcb8f George Spelvin 2016-05-26 @57  	return ((u16)(x*0x61c8) <=
< 16) + a + b;

I'm not really sure what the correct course of action is for this.

The code calling into the hash is the
	hash_add(ctx->aux_grf_table, &vo_grf_e->node, grf_type_vo); [0]
with grf_type_vo being part of an enum [1].

So everything 32bits as the function expects, but the m68k hash32 then
doing that u16 cast.

I guess adding a=20
	depends on !M68K
to the Kconfig?

Other options?

Thanks
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/drivers/clk/rockchip/clk-rk3528.c#n1147
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/drivers/clk/rockchip/clk.h#n575

> 14c44b95b3dcb8f George Spelvin 2016-05-26  58  }
> 14c44b95b3dcb8f George Spelvin 2016-05-26  59 =20
>=20
> :::::: The code at line 57 was first introduced by commit
> :::::: 14c44b95b3dcb8ff1d627e6b78f57c4373d375cb m68k: Add <asm/hash.h>
>=20
> :::::: TO: George Spelvin <linux@sciencehorizons.net>
> :::::: CC: George Spelvin <linux@sciencehorizons.net>
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20




