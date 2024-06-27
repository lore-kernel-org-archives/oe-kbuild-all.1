Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018C33FBA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719530866; cv=none; b=d3C5Sb7iExdUO87tqOxMmTx9ZVQOCnKa/6V+NwOLZ2e5sTon63ZY+WTKp2LrTMNFYg9Y4Sedu5KAZvNTZqiu/jvTxeFK/VJEY0ZuTD1o0d+3p6dCrfNiswQgGXD14//Ojd1JRGEJP8xJTUOB/eGfzUVAMeiHj6zALTfWrtmYYBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719530866; c=relaxed/simple;
	bh=mRaMphrozdYkqwRZUmA3qAIfmdSx7IfNFgaRXDpvwvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYGgimjShae7jM+tzJKK1MtGR0stZMtwS3sD9haf80FqCfR/QUexFfSIQVUpX+gTjyjcW15zQl605nzWDReHI3XsYjDSHPn7cloviptwvkP1u8eQjnCSsFaTp65Mx3Ea03bUzE+oY3SqKJjf1/O8/jV7HNlat7r5/YgbChaSMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sMyWe-000445-25; Fri, 28 Jun 2024 01:27:36 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Niklas Cassel <cassel@kernel.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject:
 Re: [linux-next:master 8329/9027]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /pcie-ep@fe150000:
 failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
Date: Fri, 28 Jun 2024 01:27:35 +0200
Message-ID: <4126102.zXnORWrf4K@diego>
In-Reply-To: <202406280710.UM3PNqsz-lkp@intel.com>
References: <202406280710.UM3PNqsz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Freitag, 28. Juni 2024, 01:16:09 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
> commit: 2fe9fe4e54f5763b8b681478dda9ac61fd42ecaf [8329/9027] arm64: dts: rockchip: Add PCIe endpoint mode support
> config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280710.UM3PNqsz-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev2+g3b69bad
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280710.UM3PNqsz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406280710.UM3PNqsz-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']

the compatible is part of the binding that was applied to the pci
tree in [0], so this should resolve itself in next shortly, I hope.


Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=dt-bindings&id=ff36edde817e0c846c3a849021e5c5062ea27ec0


