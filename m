Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293D157E99
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479370; cv=none; b=gObHrIxeTw5vR8Dy7KxCb5Xf5Mdt/DO/ciEYoAZySux7Hkuam78sn5hIGbhtbcpvPe1EMBCcBIjfUFYFiTgEJ5tHpoyyx6Sd048TFnCvUwXvcU6nx1lAyKQ/yY0QcK8Wyuwk0RzCIofiq70XoACcVHQVFflfz5V0lZyzpUMNzEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479370; c=relaxed/simple;
	bh=9W//4V6cRA+71zgba9KmTmyufKsQC5XOwO7ouRMkTDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OnOJ/acmXiS9YaKK+0/vNVUhgzeeleCt9pTd8sFifxBK8g5JSFhnHMW6sBaUkkfETg7Qw5dV5X6BFnSGK5lfzwYXPEpfP8bY8sJaZGMAxQq0twBweFG2rPLDODKegRlsYJyFSNDMFbkm714kXSr0wNOClNPMRIZ6BKt7p/hZBcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=j9mFFqNc; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="j9mFFqNc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AOZEfq5IWQ9TojVU3EQQ9l3RioahsNlCDGsZhTk7Gog=; b=j9mFFqNcatUStziS7bt3txcj2e
	vLpfA4wRWa4u6Nc57oK5ls06m+5sb/ruhHIoVQylNxkgxTaW68YE+zDyBka7gA2lVFiQgcAeNDOHq
	2tXlLi6UWFFx/8+tMcSTxxE/NW7Jfdd/a96soj3fj2BQ8INYoVpWoTl32Md5OwKOIitbWPyaABroQ
	axw0fdHslsoP4e0iPanWiNtRwxKTtW0uHCI3xfmBRu6nI38ikr1mnbeCjdKqTOAKG7YMUMHtAh2Sj
	nHyRzGSU0qACm3gPC98e02aqDL5TVnhEVywKosKC5axwlWAFNNET+TbNUKJGmiQyPpmNGa4pwg9j5
	cxtbi7gQ==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tmsBh-0002M6-3X; Tue, 25 Feb 2025 11:29:17 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: kernel test robot <lkp@intel.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: oe-kbuild-all@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>
Subject:
 Re: [linux-next:master 5345/5954]
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb:
 gpio@27: 'reset-gpios' does not match any of the regexes:
 '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
Date: Tue, 25 Feb 2025 11:29:16 +0100
Message-ID: <6725313.tM3a2QDmDi@diego>
In-Reply-To: <0e8571a2-37b2-42cc-a3b4-8dbb947fb1a1@cherry.de>
References:
 <202502250657.z4e1UeVZ-lkp@intel.com>
 <0e8571a2-37b2-42cc-a3b4-8dbb947fb1a1@cherry.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hey,

Am Dienstag, 25. Februar 2025, 11:08:23 MEZ schrieb Quentin Schulz:
> Hi Heiko,
> 
> On 2/24/25 11:09 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
> > commit: 9f889cf1783680835d3ed401279075690b7f078a [5345/5954] arm64: dts: rockchip: add overlay for PX30 Ringneck Haikou Video Demo adapter
> > config: arm64-randconfig-051-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > dtschema version: 2025.3.dev3+gabf9328
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502250657.z4e1UeVZ-lkp@intel.com/
> > 
> > dtcheck warnings: (new ones prefixed by >>)
> >>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: gpio@27: 'reset-gpios' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
> >     	from schema $id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
> >>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> >     	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
> > 
> 
> I think we may have merged the Haikou Video Demo overlays too quickly. 
> The Haikou Video Demo overlays depend on support for reset-gpios in the 
> I2C GPIO expander driver, which was added in a separate series, c.f. 
> https://lore.kernel.org/linux-gpio/20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de/T/#m34648451131d34ba85538e08da0cacfc366d91af
> 
> I guess we should revert the patches and reapply them once the gpio 
> patches get merged? Do I need to resend the patches in a new series or 
> are you going to keep track of patches to re-revert? The Haikou LVDS 
> overlay should be fine to keep as it doesn't have this GPIO expander.

With the patch-series for the PCA967x in question [0] not getting any more
change requests, I suppose Linus or Bartosz might even apply it in the near
future, so I'll give it some days and if that doesn't come true, I'll drop
the board patches here.

Heiko


[0] https://lore.kernel.org/linux-gpio/20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de/T/#m34648451131d34ba85538e08da0cacfc366d91af


