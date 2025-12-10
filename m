Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ECA22DA1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765377923; cv=none; b=e/jo3aMkaH+yBF03vxj5VnM4oall97yDrFYlmig72uX14pPQHowTYP5gJ2ZBZZV9vLt3L+xLEeHtojVKA4nTBgbcvm33OeS+kdWwKDucCn86HsBYSjlT35GytZE9THEbwyjazcVLnkXhX6Mwa4pdWoWPxh0kNyTv04at6XHkY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765377923; c=relaxed/simple;
	bh=RDbUEisgRR4tU11zIpYNTzVej96Q7nUGkAHi/kjvyzM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h5Ugtmtnb2RqefeUfkasKZe61yL6ix2n1EVuoc7Bzbr5EuctBVEAcZskBHXMAsY8NXVVpn588Sok78SNuzudCBEO0t8Hc5p9lKq5Y7WGINpKPL8k+hCVLBclSBmWOLcEodROfFFJm6MH5fdGwDb5sqgLcjPLZl/3ULfpBnP6URA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dRJQy2jmdzJ4680;
	Wed, 10 Dec 2025 22:44:58 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 7674B40565;
	Wed, 10 Dec 2025 22:45:16 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 10 Dec
 2025 14:45:15 +0000
Date: Wed, 10 Dec 2025 14:45:14 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: kismet: WARNING: unmet direct dependencies detected for
 AX45MP_L2_CACHE when selected by ARCH_R9A07G043
Message-ID: <20251210144514.000021ed@huawei.com>
In-Reply-To: <202512100411.WxJU2No9-lkp@intel.com>
References: <202512100411.WxJU2No9-lkp@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Wed, 10 Dec 2025 04:42:42 +0100
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
> commit: 4d1608d0ab3365d1ef9447bdbc0cb4c0962f1774 cache: Make top level Kconfig menu a boolean dependent on RISCV
> date:   3 weeks ago
> config: riscv-kismet-CONFIG_AX45MP_L2_CACHE-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20251210/202512100411.WxJU2No9-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20251210/202512100411.WxJU2No9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE when selected by ARCH_R9A07G043  
>    WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
>      Depends on [n]: CACHEMAINT_FOR_DMA [=n]
>      Selected by [y]:
>      - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]
> 

Thanks for the report!

I think we need a select CACHEMAINT_FOR_DMA in 
config ARCH_R9A07G043

By exposing an explicit option to enable these drivers so we could hang the riscv
dependency off it I broke this particular combination.
It won't break simple builds with old .config due to the default=y but it
still possible to unset CONFIG CACHEMAINT_FOR_DMA

Sorry, I'd missed these were selected though thinking about it that is kind
of obvious given they are needed for correct functionality of those CPUs
if any non coherent DMA devices are present.

Similar applies to CONFIG_ERRATA_STARFIVE_JH7100

I'll spin a patch but I'm not setup to test these properly and that will take
a little more time.

Jonathan
