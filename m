Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4314282ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jun 2024 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719740680; cv=none; b=AHcflgaTjltfhZF5iwhO8AJu4KomygpJMkmun5iFfXdqdu++uuHcMxnHkmUPfHYeJLwwa3VfNmVpoPU9wu5pgAOTtyMwxgU9/XDpEtUPvh4V1ITHrEWPTrCT+j8G1lWsXhdQOrvr1LLlC9qMGK2abfcBhsWfGyYWNSuswCScS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719740680; c=relaxed/simple;
	bh=9SxowyqwMEllGxLCpDSUUkuJBRWl/oMpNDxz/p3V6f4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvoMm5zIwgvEA2tK8ae338BZCcJ4CLb818vLPFaxORT8Os1FUuhFOzfR+PStq18a5PJznWhKydwMUYvkKa6ULW3CBCvfDoxPR8CJLxBH8n8KJ35PZEQiRHDrZplvT2kM1jrpvt4sciq7Jv2l7dord5fsalm7HVjzFc+nyhA6LDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a16.versanet.de ([83.135.90.22] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sNr6k-00038r-Sa; Sun, 30 Jun 2024 11:44:30 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alex Bee <knaerzche@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject:
 Re: [soc:rockchip/dt32 3/10] arch/arm/boot/dts/rockchip/rk3128-evb.dtb:
 dsi@10110000: compatible:0: 'rockchip,rk3128-mipi-dsi' is not one of
 ['rockchip,px30-mipi-dsi', 'rockchip,rk3288-mipi-dsi',
 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi',
 'rockchip,rv1126-mipi-dsi']
Date: Sun, 30 Jun 2024 11:44:30 +0200
Message-ID: <2611919.Lt9SDvczpP@diego>
In-Reply-To: <202406291010.wFy8YJmR-lkp@intel.com>
References: <202406291010.wFy8YJmR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 29. Juni 2024, 04:52:09 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git rockchip/dt32
> head:   313da6f69fa41d044b03f2ea37e56fe49f1e8a42
> commit: 171ea1ff14e42041af420ed3745f6f480612baa0 [3/10] ARM: dts: rockchip: Add DSI for RK3128
> config: arm-randconfig-051-20240628
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev3+g650bf2d
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406291010.wFy8YJmR-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm/boot/dts/rockchip/rk3128-evb.dtb: dsi@10110000: compatible:0: 'rockchip,rk3128-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
>    	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
>    arch/arm/boot/dts/rockchip/rk3128-evb.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
> --
> >> arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dtb: dsi@10110000: compatible:0: 'rockchip,rk3128-mipi-dsi' is not one of ['rockchip,px30-mipi-dsi', 'rockchip,rk3288-mipi-dsi', 'rockchip,rk3399-mipi-dsi', 'rockchip,rk3568-mipi-dsi', 'rockchip,rv1126-mipi-dsi']
>    	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-mipi-dsi.yaml#
>    arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
> 
> 

The rockchip,rk3128-mipi-dsi compatible will be provided by the drm-tree
and that commit is also present in linux-next [0]



[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9bb3d9ad3e19f16efc34f427a58e480424c56a16



