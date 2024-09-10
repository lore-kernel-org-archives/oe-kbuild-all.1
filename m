Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A8175568
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725959101; cv=none; b=lQUQE7A6y1OV83eWN24LXal0ZJV5c5StzOJIMRQ1JF4fvFZx0ZPj7kQ6tP87WvMHfS6kyih8e4IBXHAV8VJD9mBw/EGoNx8pf3Nxxu8ZK0dNa5k1T4yU3AAebq83zOet3O3cWli2LuNgaq0ziopFzb8xaXFKCUi0u6rmDEqqrC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725959101; c=relaxed/simple;
	bh=d+a/HLH54e6hJb85VFKHdDyDs9zEYq45uYiP4vNGna0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlDahQU3jW6gwfhzXvnxWGZK1OWePmdufxNaFz7qWhDtsQTBN0fpetkEnQ8oVjpwIZ4a0ZtWubBEBwInFPcAfNTxsP8PsblS8u14zQ9rZJAoDQLz3sfqZiOPENcQmPq3M0Qrt8DoFegjPAy0a+qwLIBvGBvn0THCCptbuHh/12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id DC4671C009E; Tue, 10 Sep 2024 10:59:36 +0200 (CEST)
Date: Tue, 10 Sep 2024 10:59:36 +0200
From: Pavel Machek <pavel@denx.de>
To: kernel test robot <lkp@intel.com>
Cc: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [cip:linux-6.1.y-cip-rebase 190/438]
 drivers/iommu/io-pgtable-arm.c:1185:undefined reference to
 `alloc_io_pgtable_ops'
Message-ID: <ZuAKeKb/23ZqSltA@duo.ucw.cz>
References: <202409101626.sNel54m0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDvFHQDngPotlOux"
Content-Disposition: inline
In-Reply-To: <202409101626.sNel54m0-lkp@intel.com>


--KDvFHQDngPotlOux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Who is responsible for this bot, and how do I unsubscribe?

								Pavel

On Tue 2024-09-10 16:08:15, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git=
 linux-6.1.y-cip-rebase
> head:   fb1857d56e47961f0e5a291c3385b88f610320e3
> commit: 16cf7a685142727e637f16ed7d9de15b7a32a753 [190/438] riscv: Kconfig=
=2Esocs: Add ARCH_RENESAS kconfig option
> config: riscv-randconfig-001-20240910 (https://download.01.org/0day-ci/ar=
chive/20240910/202409101626.sNel54m0-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240910/202409101626.sNel54m0-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409101626.sNel54m0-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `arm_lpa=
e_run_tests':
> >> drivers/iommu/io-pgtable-arm.c:1185:(.init.text+0x212): undefined refe=
rence to `alloc_io_pgtable_ops'
> >> riscv64-linux-ld: drivers/iommu/io-pgtable-arm.c:1257:(.init.text+0x79=
2): undefined reference to `free_io_pgtable_ops'
>    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domai=
n_free_context':
> >> drivers/iommu/ipmmu-vmsa.c:361:(.text+0x7ee): undefined reference to `=
free_io_pgtable_ops'
>    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domai=
n_init_context':
> >> drivers/iommu/ipmmu-vmsa.c:439:(.text+0xc54): undefined reference to `=
alloc_io_pgtable_ops'
>=20
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>    Depends on [n]: IOMMU_SUPPORT [=3Dy] && (ARM || ARM64 || COMPILE_TEST =
[=3Dn] && !GENERIC_ATOMIC64 [=3Dn])
>    Selected by [y]:
>    - IPMMU_VMSA [=3Dy] && IOMMU_SUPPORT [=3Dy] && (ARCH_RENESAS [=3Dy] ||=
 COMPILE_TEST [=3Dn] && !GENERIC_ATOMIC64 [=3Dn])
>=20
>=20
> vim +1185 drivers/iommu/io-pgtable-arm.c
>=20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1169 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1170  static int __init arm=
_lpae_run_tests(struct io_pgtable_cfg *cfg)
> fe4b991dcd84e0 Will Deacon        2014-11-17  1171  {
> 9062c1d0bedacf Christophe JAILLET 2019-09-09  1172  	static const enum io=
_pgtable_fmt fmts[] __initconst =3D {
> fe4b991dcd84e0 Will Deacon        2014-11-17  1173  		ARM_64_LPAE_S1,
> fe4b991dcd84e0 Will Deacon        2014-11-17  1174  		ARM_64_LPAE_S2,
> fe4b991dcd84e0 Will Deacon        2014-11-17  1175  	};
> fe4b991dcd84e0 Will Deacon        2014-11-17  1176 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1177  	int i, j;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1178  	unsigned long iova;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1179  	size_t size;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1180  	struct io_pgtable_op=
s *ops;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1181 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1182  	selftest_running =3D=
 true;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1183 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1184  	for (i =3D 0; i < AR=
RAY_SIZE(fmts); ++i) {
> fe4b991dcd84e0 Will Deacon        2014-11-17 @1185  		cfg_cookie =3D cfg;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1186  		ops =3D alloc_io_pg=
table_ops(fmts[i], cfg, cfg);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1187  		if (!ops) {
> fe4b991dcd84e0 Will Deacon        2014-11-17  1188  			pr_err("selftest: =
failed to allocate io pgtable ops\n");
> fe4b991dcd84e0 Will Deacon        2014-11-17  1189  			return -ENOMEM;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1190  		}
> fe4b991dcd84e0 Will Deacon        2014-11-17  1191 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1192  		/*
> fe4b991dcd84e0 Will Deacon        2014-11-17  1193  		 * Initial sanity c=
hecks.
> fe4b991dcd84e0 Will Deacon        2014-11-17  1194  		 * Empty page table=
s shouldn't provide any translations.
> fe4b991dcd84e0 Will Deacon        2014-11-17  1195  		 */
> fe4b991dcd84e0 Will Deacon        2014-11-17  1196  		if (ops->iova_to_ph=
ys(ops, 42))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1197  			return __FAIL(ops,=
 i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1198 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1199  		if (ops->iova_to_ph=
ys(ops, SZ_1G + 42))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1200  			return __FAIL(ops,=
 i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1201 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1202  		if (ops->iova_to_ph=
ys(ops, SZ_2G + 42))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1203  			return __FAIL(ops,=
 i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1204 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1205  		/*
> fe4b991dcd84e0 Will Deacon        2014-11-17  1206  		 * Distinct mapping=
s of different granule sizes.
> fe4b991dcd84e0 Will Deacon        2014-11-17  1207  		 */
> fe4b991dcd84e0 Will Deacon        2014-11-17  1208  		iova =3D 0;
> 4ae8a5c528c0b1 Kefeng Wang        2016-09-21  1209  		for_each_set_bit(j,=
 &cfg->pgsize_bitmap, BITS_PER_LONG) {
> fe4b991dcd84e0 Will Deacon        2014-11-17  1210  			size =3D 1UL << j;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1211 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1212  			if (ops->map(ops, =
iova, iova, size, IOMMU_READ |
> fe4b991dcd84e0 Will Deacon        2014-11-17  1213  							    IOMMU_WRIT=
E |
> fe4b991dcd84e0 Will Deacon        2014-11-17  1214  							    IOMMU_NOEX=
EC |
> f34ce7a7018c2f Baolin Wang        2020-06-12  1215  							    IOMMU_CACH=
E, GFP_KERNEL))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1216  				return __FAIL(ops=
, i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1217 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1218  			/* Overlapping map=
pings */
> fe4b991dcd84e0 Will Deacon        2014-11-17  1219  			if (!ops->map(ops,=
 iova, iova + size, size,
> f34ce7a7018c2f Baolin Wang        2020-06-12  1220  				      IOMMU_READ =
| IOMMU_NOEXEC, GFP_KERNEL))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1221  				return __FAIL(ops=
, i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1222 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1223  			if (ops->iova_to_p=
hys(ops, iova + 42) !=3D (iova + 42))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1224  				return __FAIL(ops=
, i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1225 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1226  			iova +=3D SZ_1G;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1227  		}
> fe4b991dcd84e0 Will Deacon        2014-11-17  1228 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1229  		/* Partial unmap */
> fe4b991dcd84e0 Will Deacon        2014-11-17  1230  		size =3D 1UL << __f=
fs(cfg->pgsize_bitmap);
> a2d3a382d6c682 Will Deacon        2019-07-02  1231  		if (ops->unmap(ops,=
 SZ_1G + size, size, NULL) !=3D size)
> fe4b991dcd84e0 Will Deacon        2014-11-17  1232  			return __FAIL(ops,=
 i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1233 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1234  		/* Remap of partial=
 unmap */
> f34ce7a7018c2f Baolin Wang        2020-06-12  1235  		if (ops->map(ops, S=
Z_1G + size, size, size, IOMMU_READ, GFP_KERNEL))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1236  			return __FAIL(ops,=
 i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1237 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1238  		if (ops->iova_to_ph=
ys(ops, SZ_1G + size + 42) !=3D (size + 42))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1239  			return __FAIL(ops,=
 i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1240 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1241  		/* Full unmap */
> fe4b991dcd84e0 Will Deacon        2014-11-17  1242  		iova =3D 0;
> f793b13ef0c9c1 YueHaibing         2018-04-26  1243  		for_each_set_bit(j,=
 &cfg->pgsize_bitmap, BITS_PER_LONG) {
> fe4b991dcd84e0 Will Deacon        2014-11-17  1244  			size =3D 1UL << j;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1245 =20
> a2d3a382d6c682 Will Deacon        2019-07-02  1246  			if (ops->unmap(ops=
, iova, size, NULL) !=3D size)
> fe4b991dcd84e0 Will Deacon        2014-11-17  1247  				return __FAIL(ops=
, i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1248 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1249  			if (ops->iova_to_p=
hys(ops, iova + 42))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1250  				return __FAIL(ops=
, i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1251 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1252  			/* Remap full bloc=
k */
> f34ce7a7018c2f Baolin Wang        2020-06-12  1253  			if (ops->map(ops, =
iova, iova, size, IOMMU_WRITE, GFP_KERNEL))
> fe4b991dcd84e0 Will Deacon        2014-11-17  1254  				return __FAIL(ops=
, i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1255 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1256  			if (ops->iova_to_p=
hys(ops, iova + 42) !=3D (iova + 42))
> fe4b991dcd84e0 Will Deacon        2014-11-17 @1257  				return __FAIL(ops=
, i);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1258 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1259  			iova +=3D SZ_1G;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1260  		}
> fe4b991dcd84e0 Will Deacon        2014-11-17  1261 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1262  		free_io_pgtable_ops=
(ops);
> fe4b991dcd84e0 Will Deacon        2014-11-17  1263  	}
> fe4b991dcd84e0 Will Deacon        2014-11-17  1264 =20
> fe4b991dcd84e0 Will Deacon        2014-11-17  1265  	selftest_running =3D=
 false;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1266  	return 0;
> fe4b991dcd84e0 Will Deacon        2014-11-17  1267  }
> fe4b991dcd84e0 Will Deacon        2014-11-17  1268 =20
>=20
> :::::: The code at line 1185 was first introduced by commit
> :::::: fe4b991dcd84e0104cf2e29223a819335ed048a7 iommu: add self-consisten=
cy tests to ARM LPAE IO page table allocator
>=20
> :::::: TO: Will Deacon <will.deacon@arm.com>
> :::::: CC: Will Deacon <will.deacon@arm.com>
>=20

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--KDvFHQDngPotlOux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZuAKeAAKCRAw5/Bqldv6
8gr3AJ9IEMGLujlOMqmVXr6wE2Ut6qSS9wCgkYgA5/wn+hg30spl9cMNb+AaRBg=
=ITHT
-----END PGP SIGNATURE-----

--KDvFHQDngPotlOux--
