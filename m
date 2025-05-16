Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED92AE8D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389821; cv=none; b=Nyd2U/Yrj5fSkJAU6dZbkKki3sCXuPEy/0onLncEPmIKeT9ZmWz3OiIMOXaEKrRr5y0at7VhXTeordTBu4UZ2c7SzAtiCVHKEoNtR+EJs8V7nEHmsHZUZkIO9LXbM0Pth3rCzQ8kPph8oH+3MNyccO0dRq7C75glXB/XKY6/IGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389821; c=relaxed/simple;
	bh=Atk+gaZ4U11Jtp1nidcxGfT6V4soWiaFmw5Wl4NNRBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=he3YRKfAabsM6h1EP2QkEkU86ywGnzMMFm+XcwJTfPtsRfP2cUXtRJFFedRm2IYkPW5IeMvlnLviEgmeV3E8Y5VolRvaYn/btv+LQGzv04xv1gnaB4XzvriYCWSD+cf3anb19VCPwoSTY+n1xHvRvkhM2TX3dJlfjMkt1gtkSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eU4ri/BR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eU4ri/BR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=9kVJFBXSF2Ho7P/WhxCkyfSReoZHBE5fjITU/wPn6Vs=; b=eU4ri/BREYhxo0kxP7gYjhNDq8
	Er9a88VJ5exI4OIPvkrj11v3gJrl6eF+CRar955B/723FeW/hcPckV/+pKj0E+cd5GidPV5HsHsBC
	XgVCt/2EF7N5QAi+XjEQchw4PQEZ7FkuaF8jajhGdQT3Vd/X7iU/tkJK5Dm0xl/jEq0UGpCwVjSUK
	eyFonrvMn9Dc4Dlj7KSP879k/Xp5YZlUlFQnLYqwk2+3bDPsf9hlSCsCZKCXZedpNpew9VaWNv6cL
	4vIUsa0dqpBE3zVJjjPgf12XF3I5T5C0ku9osdwP95QxRVKGr6KEOlrxs71+VgNt8iKnhSSGA1sDm
	9Rb1s46g==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFrug-0001Dz-Lg; Fri, 16 May 2025 12:03:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject:
 Re: [linux-next:master 7524/11408] drivers/clk/rockchip/clk-rk3576.c:1810:9:
 error: implicit declaration of function 'kfree'
Date: Fri, 16 May 2025 12:03:34 +0200
Message-ID: <4601287.Wku2Vz74k6@diego>
In-Reply-To: <202505152121.FIUXB0Kj-lkp@intel.com>
References: <202505152121.FIUXB0Kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 15. Mai 2025, 16:01:17 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   484803582c77061b470ac64a634f25f89715be3f
> commit: 9199ec29f0977efee223791c9ee3eb402d23f8ba [7524/11408] clk: rockch=
ip: add GATE_GRFs for SAI MCLKOUT to rk3576
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/2025051=
5/202505152121.FIUXB0Kj-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250515/202505152121.FIUXB0Kj-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505152121.FIUXB0Kj-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    drivers/clk/rockchip/clk-rk3576.c: In function 'rk3576_clk_init':
>    drivers/clk/rockchip/clk-rk3576.c:1769:22: error: implicit declaration=
 of function 'kzalloc' [-Wimplicit-function-declaration]
>     1769 |         pmu0_grf_e =3D kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL=
);
>          |                      ^~~~~~~
>    drivers/clk/rockchip/clk-rk3576.c:1769:20: error: assignment to 'struc=
t rockchip_aux_grf *' from 'int' makes pointer from integer without a cast =
[-Wint-conversion]
>     1769 |         pmu0_grf_e =3D kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL=
);
>          |                    ^
>    drivers/clk/rockchip/clk-rk3576.c:1777:19: error: assignment to 'struc=
t rockchip_aux_grf *' from 'int' makes pointer from integer without a cast =
[-Wint-conversion]
>     1777 |         ioc_grf_e =3D kzalloc(sizeof(*ioc_grf_e), GFP_KERNEL);
>          |                   ^
> >> drivers/clk/rockchip/clk-rk3576.c:1810:9: error: implicit declaration =
of function 'kfree' [-Wimplicit-function-declaration]
>     1810 |         kfree(pmu0_grf_e);
>          |         ^~~~~
>=20

kfree also is declared in slab.h, so the change fixing the kzalloc prototyp=
es
commit 92da5c3cba23 ("clk: rockchip: rk3576: add missing slab.h include") [=
0]
will also provide the kfree prototype

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?h=3Dv6.16-clk/next&id=3D92da5c3cba23ee4be2c043bb63a551c89c48de18


Heiko

>=20
> vim +/kfree +1810 drivers/clk/rockchip/clk-rk3576.c
>=20
>   1731=09
>   1732	static void __init rk3576_clk_init(struct device_node *np)
>   1733	{
>   1734		struct rockchip_clk_provider *ctx;
>   1735		unsigned long clk_nr_clks;
>   1736		void __iomem *reg_base;
>   1737		struct rockchip_aux_grf *ioc_grf_e;
>   1738		struct rockchip_aux_grf *pmu0_grf_e;
>   1739		struct regmap *ioc_grf;
>   1740		struct regmap *pmu0_grf;
>   1741=09
>   1742		clk_nr_clks =3D rockchip_clk_find_max_clk_id(rk3576_clk_branches,
>   1743						ARRAY_SIZE(rk3576_clk_branches)) + 1;
>   1744=09
>   1745		pmu0_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3576-=
pmu0-grf");
>   1746		if (IS_ERR(pmu0_grf)) {
>   1747			pr_err("%s: could not get PMU0 GRF syscon\n", __func__);
>   1748			return;
>   1749		}
>   1750=09
>   1751		ioc_grf =3D syscon_regmap_lookup_by_compatible("rockchip,rk3576-i=
oc-grf");
>   1752		if (IS_ERR(ioc_grf)) {
>   1753			pr_err("%s: could not get IOC GRF syscon\n", __func__);
>   1754			return;
>   1755		}
>   1756=09
>   1757		reg_base =3D of_iomap(np, 0);
>   1758		if (!reg_base) {
>   1759			pr_err("%s: could not map cru region\n", __func__);
>   1760			return;
>   1761		}
>   1762=09
>   1763		ctx =3D rockchip_clk_init(np, reg_base, clk_nr_clks);
>   1764		if (IS_ERR(ctx)) {
>   1765			pr_err("%s: rockchip clk init failed\n", __func__);
>   1766			goto err_unmap;
>   1767		}
>   1768=09
>   1769		pmu0_grf_e =3D kzalloc(sizeof(*pmu0_grf_e), GFP_KERNEL);
>   1770		if (!pmu0_grf_e)
>   1771			goto err_unmap;
>   1772=09
>   1773		pmu0_grf_e->grf =3D pmu0_grf;
>   1774		pmu0_grf_e->type =3D grf_type_pmu0;
>   1775		hash_add(ctx->aux_grf_table, &pmu0_grf_e->node, grf_type_pmu0);
>   1776=09
>   1777		ioc_grf_e =3D kzalloc(sizeof(*ioc_grf_e), GFP_KERNEL);
>   1778		if (!ioc_grf_e)
>   1779			goto err_free_pmu0;
>   1780=09
>   1781		ioc_grf_e->grf =3D ioc_grf;
>   1782		ioc_grf_e->type =3D grf_type_ioc;
>   1783		hash_add(ctx->aux_grf_table, &ioc_grf_e->node, grf_type_ioc);
>   1784=09
>   1785		rockchip_clk_register_plls(ctx, rk3576_pll_clks,
>   1786					   ARRAY_SIZE(rk3576_pll_clks),
>   1787					   RK3576_GRF_SOC_STATUS0);
>   1788=09
>   1789		rockchip_clk_register_armclk(ctx, ARMCLK_L, "armclk_l",
>   1790				mux_armclkl_p, ARRAY_SIZE(mux_armclkl_p),
>   1791				&rk3576_cpulclk_data, rk3576_cpulclk_rates,
>   1792				ARRAY_SIZE(rk3576_cpulclk_rates));
>   1793		rockchip_clk_register_armclk(ctx, ARMCLK_B, "armclk_b",
>   1794				mux_armclkb_p, ARRAY_SIZE(mux_armclkb_p),
>   1795				&rk3576_cpubclk_data, rk3576_cpubclk_rates,
>   1796				ARRAY_SIZE(rk3576_cpubclk_rates));
>   1797=09
>   1798		rockchip_clk_register_branches(ctx, rk3576_clk_branches,
>   1799					       ARRAY_SIZE(rk3576_clk_branches));
>   1800=09
>   1801		rk3576_rst_init(np, reg_base);
>   1802=09
>   1803		rockchip_register_restart_notifier(ctx, RK3576_GLB_SRST_FST, NULL=
);
>   1804=09
>   1805		rockchip_clk_of_add_provider(np, ctx);
>   1806=09
>   1807		return;
>   1808=09
>   1809	err_free_pmu0:
> > 1810		kfree(pmu0_grf_e);
>   1811	err_unmap:
>   1812		iounmap(reg_base);
>   1813		return;
>   1814	}
>   1815=09
>=20
>=20




