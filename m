Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9681BDDF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729680906; cv=none; b=MpwnUS4Qq+A0mDaC2Ke65zofIf1iPGFl1D4HWA/6xposGfJ3kjvLFkgoh8s4svUROfgJDm8wQfa5pDUHBPGeI46fg9UBle4Z0D3O6dfWzAIbyT7noLgD1ENiuWsQIbbKtiZLGdC8HKulIZ7cVK3oRHKGXmTgClN8kqPMHW4Y6Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729680906; c=relaxed/simple;
	bh=Hg0FJBiG8jTbLe4687TwqoZO8re2LSq3AeS7fPa9Ex8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FNf7nnmS7ngWgqMMRGJ9bdkk7gaKfQZql1oRCTFmMsJHmx967dM5uz4kWMN/YHUfx1vAqDl6vTWb5FtEI7YmF0WGM9MCxxcDAoxjJmALxBoMd2t9GxcHkxtij0UQel1wEreQGSCGTsLJGlNbK7w3v6ec/BEAW1JxsubOrlIMsFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=WphzLKia; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="WphzLKia"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TCYLGGL6+b3/rAFR4Rm7peij4aUc4oxGG0dX2zARLMY=; b=WphzLKiaWxJ7uTQTZxZry6XXPJ
	Zq9Nu2NQ4ZW3pR/48CHL7SsUbgMYYMbtCpofFakQwJ0xUuqE6ecVUO0Q8IswYKNOt12rgu8NWNqTG
	EVaXvN/8DVrA/R/x8d67O7BRLIB9C9JkEwzrF53EzLjaYIOX2RWEi0niiQW3VJmjU55i6b6DugrFh
	hpBKHzlVia22+txxXHC3hY54HiE05IycRlmby7cUAurTgC4ovXsuSdkby4NVZ5eBqFd9bEQFgTqwW
	P0iqAwGBkcp2jmRs795mD4z17jS7NbGl52e3O+cFRD+jpAXK4fG1qSUCcqYxbq6MbWsMH7ALDDTwu
	2ePObvww==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3Z10-0006Lt-13; Wed, 23 Oct 2024 12:54:58 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject:
 Re: [linux-next:master 5764/6080]
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11:
 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
Date: Wed, 23 Oct 2024 12:54:58 +0200
Message-ID: <3781885.MHq7AAxBmi@diego>
In-Reply-To: <202410231034.kBCQ5FvS-lkp@intel.com>
References: <202410231034.kBCQ5FvS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 23. Oktober 2024, 04:36:31 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7436324ebd147598f940dde1335b7979dbccc339
> commit: 6df447d57800b7f9adb8eb673f1853331be20bb3 [5764/6080] arm64: dts: rockchip: Drop invalid clock-names from es8388 codec nodes
> config: arm64-randconfig-055-20241022 (https://download.01.org/0day-ci/archive/20241023/202410231034.kBCQ5FvS-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev6+g12c3cd5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231034.kBCQ5FvS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410231034.kBCQ5FvS-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#

This is a pre-existing issue already, but should nevertheless be fixed
"ASoC: dt-bindings: everest,es8328: Document audio graph port"
merged yesterday [0]

Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=e6d20a9b0f376fda3e3c3709a59cefa6c0021784



