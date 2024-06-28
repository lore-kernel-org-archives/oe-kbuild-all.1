Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B1C156243
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575294; cv=none; b=YuGJSWBRKRRvwy8BU0fE1jAA/uUjmjkKrCz5+2RuPg5O0Oph+PXf1HaMZHZ3euHwVskiwgVZeYiEcmS8/Gd65ClbYzZV/Dx4aTT7BQZqeoUAZzjuLZog7xm6m/GBSIc5tfBXvKMq1nCQMMXQEniTctv5Wrd4OCE0SmCCwmEndKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575294; c=relaxed/simple;
	bh=AVqdxj0QUrK5rnOy/T4S28rU5HAdoWiH2Lj3QYY+MqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l4ABb5RXV1b2HfUt6nkPkpZMD8BtZq/znGn4so112YBYEu5nQB/IIo0F3wlSm5FJeled/YZCWBtZEUj1GmA3w3Y+9xVDqrPITd1JSbyAp28GXsILbbDNQBPd4yrW5g/ewkxiG6I/dPJ8/UyCMsx/mNzcRfOv0JKQ5CKotlo0xKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sNA5D-0005hZ-77; Fri, 28 Jun 2024 13:48:03 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alex Bee <knaerzche@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject:
 Re: [linux-next:master 7406/9027]
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c:
 failed to match any schema with compatible: ['realtek,rt5640']
Date: Fri, 28 Jun 2024 13:48:02 +0200
Message-ID: <2736121.mvXUDI8C0e@diego>
In-Reply-To: <202406280804.Kc8B4xzn-lkp@intel.com>
References: <202406280804.Kc8B4xzn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 28. Juni 2024, 02:55:26 CEST schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
> commit: 7b4a8097e58b608638d416bd57469f8a9ab70e7b [7406/9027] arm64: dts: rockchip: Add Neardi LBA3368 board
> config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280804.Kc8B4xzn-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev2+g3b69bad
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280804.Kc8B4xzn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406280804.Kc8B4xzn-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
> >> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000: failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
>    arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: i2s-8ch@ff898000: '#sound-dai-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/sound/rockchip-i2s.yaml#
> 
> 

The sound-dai-cells are fixed already by
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8d7ec44aa5d1eb94a30319074762a1740440cdc8
("arm64: dts: rockchip: Add sound-dai-cells for RK3368")

and the other two stem from those bindings not being converted
to yaml yet.


