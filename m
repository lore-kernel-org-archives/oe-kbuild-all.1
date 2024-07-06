Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358441E4B2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720269670; cv=none; b=XAsLdD/VWzewJKZZsuRZnplNhvWMwlyAktBjSUa//NNVeSCLkx8x2PVwN1NCqeKjmr2jubjsnURBTO0UVWwDyJFSUZ91sWemXWfcUZF64LNGZmd9FWokevsKOKTsgIgGxazb+l+8QA0GzJML0+TdBZO7lWfNV7yuo6GbLcUouX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720269670; c=relaxed/simple;
	bh=sjmHmuHkG1x+fPTRteVoEmg51v9kSiChlhREu6lwpwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Es1i+zI8p8TJ9qzXAMjPO4b3oO6XIK9OFd/tI40vXuhIFjT7BJnbIDTG0xqyQ6ZFu3IKn01Pr1ZKKdRU/u1NNupf0ehUftn5Y0QaNXXOqFyPwb/dqoyvTVi1mFqqTA00IdSTg8tOC1bjTl36LxRvWF5m4/5WA+4eXJfqz9WWuGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e8616d1.versanet.de ([94.134.22.209] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sQ4Kp-0008S2-3U; Sat, 06 Jul 2024 14:16:11 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject:
 Re: [soc:rockchip/dt 39/42] arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb:
 pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks',
 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
Date: Sat, 06 Jul 2024 14:16:10 +0200
Message-ID: <11100802.5MRjnR8RnV@diego>
In-Reply-To: <202406301625.cTliyKZ1-lkp@intel.com>
References: <202406301625.cTliyKZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 30. Juni 2024, 11:04:21 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git rockchip/dt
> head:   9417909e253ffa57f014822a79cca9b1f2b25492
> commit: 406a554b382200abfabd1df423a425f6efee53e0 [39/42] arm64: dts: rockchip: Drop invalid mic-in-differential on rk3568-rock-3a
> config: arm64-randconfig-051-20240630
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
> dtschema version: 2024.6.dev3+g650bf2d
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406301625.cTliyKZ1-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

this is already fixed with the binding change in linux-next and dtbs check
does not show the issue anymore




