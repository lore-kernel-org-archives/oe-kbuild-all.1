Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD22D9EE4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 00:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123275; cv=none; b=cJhpwRlHIIc4sybHr74SJxF+5Mkb0MJS+KT8Lx2VXd6XUJD/orvJJTwpjIk4O7NL9m75HgrcAkaPq+CX22USPSzLj5WwlifoMQbAR5PaKDH1gNqlRT7NFrl8AU4CY8P0Rhhhu7Y/8lvqVlrfNlHYejm+Gc5XWQBZUwxSYa3ju6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123275; c=relaxed/simple;
	bh=Dju8DlHWoY23EMXCmr18d+M4NZ73zKiFnVeQhsH1jXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWqnRiDZni3vF7naOirbEUFnOko0eoxned+p9noHcWPCowNfW0UthGvCDxGnscHM7Z3Ft4Mvx1g5mekzgeg+qV7IfrZOtLIEufwbkUcR8n+FmyOkFWgKjTyDf8iBz3liSXkKmmIs1XMWc0d65L13kFDSFVaPQLfOYBP5WIub9X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=bC7QrqZH; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="bC7QrqZH"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3C4A1032E7;
	Wed, 23 Sep 2026 02:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790123259;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Eev5+G/x4t3sQeLRC1blfNUuY5QWg5E+uJVwU9rTOW4=;
	b=bC7QrqZHDKaWYGCzuxNM95U26tVGBAAnSqHKVNbzHNi7SXvCh+0WHLBbv25RiNFPRXYse7
	eSu/NsIM7ou80I305n/6depqG9nc7TMYqZ70iHYLf9IMVGyEtTfWHBAEsCTWh46ArOe1Fc
	8f+Nic16n4hUfJYBaoBMCb7ETEvTscQLYDFvdGJL4lvEagtl2DQVcGXwsWdHMl0G5P/P0G
	GUmqnMXbVwC5CN+8PyLCBAQEbGpJhi2+g/S0hBKxhcMa5shbPHGBXORk3M+ykzxqyRhFEh
	jA3gfjxQdLfxYmHuIsjnnDLkTtuzLnGyQEBncsLdIeiu4ZP2p35U+zWw4o92Ug==
Message-ID: <ecaad12c-f084-4dc2-a38b-aa0f6b661152@nabladev.com>
Date: Wed, 23 Sep 2026 02:27:37 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1377/8910]
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb:
 vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <202609230104.FiyyplfO-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <202609230104.FiyyplfO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/23/26 1:22 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/8910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260923/202609230104.FiyyplfO-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> dtschema: 2026.10.dev2+g840a01d41
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230104.FiyyplfO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609230104.FiyyplfO-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> --
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
$ make W=1 CHECK_DTBS=y 
freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo 
freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC 
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo
   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
   OVL [C] 
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb

seems to pass fine on next-20260922 with dt-schema 2026.09 ?
