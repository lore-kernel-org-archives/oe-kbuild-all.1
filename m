Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA10482D3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717845990; cv=none; b=Ycp44+abn3G4YPBXUJJktpcQ9JewIX8SZaWStsCzv2iyHnQBiCCtOwWSoq6TtAsbf43HhcanKuBljsqRosDta9MT/cAa4AoCjNxF6EfFlozbZsvtv569TA4hhvz0u9ELDu7FvT1UHmb/gBcpqQZkLnw/NgQAk4/4lwmBr2k7SoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717845990; c=relaxed/simple;
	bh=fpDJTEEpl0g7hBrnH141ZisKWinWEGs1JByJue9JWDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+J4sTpcu7oCBtMwcxxI/6NaRE8drXkHcjHoUggX6MpKCC1g2TdILSjTyOWl9Jh2bhgFpBBgMbCZtlmmpXsX3YbF58z7Zdty9MR2SFQjkl+NuB7PtthVPB/C8apuOukssVWT2lpxr5W+hrfnls1XXvYnmF+AgGtDU6ih5BRfKE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFuDB-0006Y4-JA; Sat, 08 Jun 2024 13:26:17 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alex Bee <knaerzche@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject:
 Re: [linux-next:master 1912/4582] dtbs_check:
 arch/arm/boot/dts/rockchip/rk3128-evb.dtb: /dsi@10110000: failed to match any
 schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
Date: Sat, 08 Jun 2024 13:26:16 +0200
Message-ID: <3048353.WAvfycf1tz@diego>
In-Reply-To: <202406081302.0CAdvAA9-lkp@intel.com>
References: <202406081302.0CAdvAA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 8. Juni 2024, 07:58:10 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
> commit: 73fc389129dfe22b5706b4b6cbc1a4f86d1fbc1b [1912/4582] ARM: dts: rockchip: Add DSI for RK3128
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev1+g833054f
> reproduce: (https://download.01.org/0day-ci/archive/20240608/202406081302.0CAdvAA9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406081302.0CAdvAA9-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm/boot/dts/rockchip/rk3128-evb.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']
> --
> >> arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dtb: /dsi@10110000: failed to match any schema with compatible: ['rockchip,rk3128-mipi-dsi', 'snps,dw-mipi-dsi']

I guess something went wrong when that specific next-tree was constructed.
Looking at the current linux-next, the drm-specific parts really are not
present, but they are in the drm-misc tree for a while now:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9bb3d9ad3e19f16efc34f427a58e480424c56a16
(in the correct drm-misc-next branch) and has been in a pull request
to main drm on may 30th [0]

Not sure if Dave is on vacation or so.


[0] https://patchwork.kernel.org/project/intel-gfx/patch/20240530-hilarious-flat-magpie-5fa186@houat/


