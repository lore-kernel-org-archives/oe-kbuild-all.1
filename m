Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED22E2EEE92
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 22:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790549300; cv=none; b=I0eXvtfB1K3E2qBPntyU65glpEK1GI/k1X3TkmUkXpzsD+uvqKT3/d/YzPXWw0wFZPEuLucNOrckDQEOTrTdu5PqviPTLfWJWDfBELrLP7gBdW/bSCAPoVIhNlMu8ma34zod+QSVRDRyrthY4hURWjyvlSDUFYtr59l/ZQtCsKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790549300; c=relaxed/simple;
	bh=M0s+K0UvUZeleLd8Nrcv5gDjImIac8VuByfh58MBirg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abuvY0PV47rbbJak7CGloohMwhGM5negIdd/XgGoahJfdebaeTEj7FIch94UHdOZGP7mwMlZVQ5z1fQj+FupizZE95lAtTYr3n5OJhWHKkaBXhRHrziHjb62HDLArdqKOxODrumpk4/rauXwnlzpe+ijPKfREmY+njn7CBDOOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=LGie/Gt/; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="LGie/Gt/"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 780A010637E;
	Mon, 28 Sep 2026 00:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790549285;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=XE3UAwE0hay/gPRNV12rFaRYj7zYEg6z0cO3LvUktfg=;
	b=LGie/Gt/U6zGUTlpcguR9Ek89vs1bVfqKtz9LzzU43f4Qi8/4VwFPY6OxxWCw5DIqtVGWV
	Ky9miAlEUrTcKLlHRoBrqvq80d1fR5tf+I4fcdaTRpYDa6KNl3FOMlU7QdJwVucGLG5vKP
	jSFMp9fEBjgVYuHeIgYBoLB8ojE3sKcHfwtDFAFSfXB1/7e3iM/v3OLm/Z52fV9rQKDywR
	oHL87awEVHx83yBqUU/fMUk2Ge6pgER70lN99S7wZANqbGFC5VLsbhKqDDKhUVnSOg73jM
	cqu2Fedo29porFE3nwFeEF5x9MB1w3OqBmVZ7MuY3AVO2WIDFR1bcpisH3/N9g==
Message-ID: <8ed2f318-5758-4d2d-9e31-bebbb067b913@nabladev.com>
Date: Sun, 27 Sep 2026 20:06:12 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1377/10910]
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb:
 vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <202609252351.5UfBIiOJ-lkp@intel.com>
 <b70365a8-9812-434a-b514-4604835cf347@nabladev.com>
 <735d64cb-b35b-4854-8b6e-d1f32822c244@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <735d64cb-b35b-4854-8b6e-d1f32822c244@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/27/26 6:59 PM, Krzysztof Kozlowski wrote:
> On 26/09/2026 01:00, Marek Vasut wrote:
>> On 9/25/26 11:46 PM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
>>> commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/10910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>> config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/config)
>>> compiler: aarch64-linux-gcc (GCC) 8.5.0
>>> dtschema: 2026.10.dev2+g840a01d41
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609252351.5UfBIiOJ-lkp@intel.com/
>>>
>>> dtcheck warnings: (new ones prefixed by >>)
>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>> --
>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>      	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> +CC krzk, I just cannot reproduce this locally. Do you know what I might
>> be missing here ? Thank you !
> 
> The things or versions listed in top of that email.
Linux has plenty of examples of such shared-dma-pool/no-map entries:

arch/arm64/boot/dts/freescale/imx952-evk.dts-		vdev0buffer: 
vdev0buffer@88020000 {
arch/arm64/boot/dts/freescale/imx952-evk.dts:			compatible = 
"shared-dma-pool";
arch/arm64/boot/dts/freescale/imx952-evk.dts-			reg = <0 0x88020000 0 
0x100000>;
arch/arm64/boot/dts/freescale/imx952-evk.dts-			no-map;
arch/arm64/boot/dts/freescale/imx952-evk.dts-		};

Are those broken and need to be fixed, or is it dt-schema that is broken ?
