Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AFA1946B8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727857197; cv=none; b=nOuX8MNWVyXBzLbqIuYowc2Yr4yUs4UYa+uFUQ6UkcOv5pce771OswmTMrm7jI4KtMJwQEmcMK2JsBVoBx+LzZHsjcn8shmoBbwA6JBGVTucpEOA/4dFZR0fOK7Hpy5ynxE8i4NqfC1O2J++OWZpafzviYjoPyinNugpFXEoGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727857197; c=relaxed/simple;
	bh=d1WXcQKJYOHTURZhqznxS3US8Zodokf/EL9EGxHee7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sA5fbRVjxpwywjj8jR+Um3s5vvhhCa42gb08ozXuTSGFfISM0MiSZRsDTkJpfBxRiOeXXK7ZCCfVU7eAyMAzL4UD7A2xYhJssgKEXngXSCOkTL9RwZtVUyVrA1zfON+ceGZ+bBIHZG1pLnQ5xM+H3X/01UDTGVkXDuen4JMwTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=re9fZa9p; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="re9fZa9p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xYKJrN9v9QzrVQiwlfgXCf7g7VyXIAwpe9m65hJOiGI=; b=re9fZa9pOJMGNtcghuSWvrxMrg
	dB2vNTOmdYQpbU0SCeLD/ZZszh4kIctDPO9IdBhYca0Xp8RpCjLsGPcETkLBE/8M1uyGLOV2SyXGp
	D41ElQ3L0VkuHpBpY9uk3nIFy4PknNCLWeF1BXutWRVES60GKCPssv43vto+pJ20T9/GeAy8qOa9C
	SPfNN03DNSqqK3nJnE2LI8M0QNFbAE5at0BHo2U4fQ+Mez0HLS14USfYaDlQ/UMERb84uuPZnzAbO
	UVdq9T1GS/HHaPvMM3HocBW/EnA1K1ZZoOgjX5SaP67+t39a26CBWUMC5TRG6sE04N+EU5CTPxHHn
	ocMo4sWw==;
Received: from i53875aa1.versanet.de ([83.135.90.161] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1svuaN-0003AH-Kq; Wed, 02 Oct 2024 10:19:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject:
 Re: [linux-next:master 969/1347]
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb:
 /i2c@ff110000/rt5651@1a: failed to match any schema with compatible:
 ['realtek,rt5651']
Date: Wed, 02 Oct 2024 10:19:50 +0200
Message-ID: <3530812.QJadu78ljV@diego>
In-Reply-To: <202410020004.4imQt5MT-lkp@intel.com>
References: <202410020004.4imQt5MT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Dienstag, 1. Oktober 2024, 18:25:27 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   77df9e4bb2224d8ffbddec04c333a9d7965dad6c
> commit: 577b5761679da90e691acc939ebbe7879fff5f31 [969/1347] arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-sapphire-excavator
> config: arm64-randconfig-051-20241001 (https://download.01.org/0day-ci/archive/20241002/202410020004.4imQt5MT-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev4+g577c1ab
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020004.4imQt5MT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410020004.4imQt5MT-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
>    arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>    arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>    arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
> >> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /i2c@ff110000/rt5651@1a: failed to match any schema with compatible: ['realtek,rt5651']
>    arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
>    arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>    arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']

Similar to the other board, the rt5651 binding hasn't been converted
to yaml yet, but exists as txt binding.

Geerts patch fixed the wrong vendor prefix (rockchip -> realtek)


