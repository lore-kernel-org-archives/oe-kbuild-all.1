Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D223CB907
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 19:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622314; cv=none; b=osNmQcq9UC4QCQizlSXkYKyRWkbWTBqVVweilw3gkR9a4FzwkrjjoyyJUP3wx4BWYnZuqbHN9yUYu3pCMsJ3OqE+6uhSyH/ggH9CqsMAy42uGv1H1HdwheFZyhcgtsXLQ0OvQ2imbg7f6g1W6KtOx74TkBRX+KmyiNJHOnohod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622314; c=relaxed/simple;
	bh=W/S282kE65UkR54PP+4hqJkZQuwpRd1wM6AvvsZ2hS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXC7XL9RJU+1Mg7/+JnyoTi0wMQqJ44Y0NX+ltn1riFyFisGXsH5ius5E1wbu6v/NubWi3jrajJhlfL3suNR4IPf4CjbsrST2Bv9G+PfwEt4zBSlW2jmbmKAVnWHiGqhrtBmtR7ngutZZvwRWJoqDarC57SH4G8MGpcb5i+hRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=AN79AMjn; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="AN79AMjn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 528411061E1;
	Mon, 28 Sep 2026 21:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790622305;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=oc0AMDAC/tcNF4KknV1bOq1qp5F0oUr0gA9faXbVPww=;
	b=AN79AMjnxwHSXSDujpXb7SvNhr5BaiVHcmnS3bUTxPxOQqd6/TSYN61iFSbjeZgbSg/4Gv
	iFn/+/iyUgcSmkR/CjglE+r/gUQhyNsmok428T03xpBUgeDiUIGwNstAm/zrJNC8OnNRoX
	35ukgySoaTu9KO59EHwqZN3tbCz6H9ei0Yssf+eeKA4wQdO+DlONKY1gWxaOOpcP2PHwt+
	PY05flwOlJLvsNvAx9nPpc9SC3JHc1l4gFyuTa8/b0i4bLhwYdRYTfsoAPWBTpM/eqlyTd
	S+PwfCnpC2RxK1fnloOJYMkIdggD3g+R/0zNFocsH6pzE0CPiEmyeifv2fB/ZQ==
Message-ID: <17c2d593-194c-47ff-9c55-b86cba82f415@nabladev.com>
Date: Mon, 28 Sep 2026 21:05:03 +0200
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
 <8ed2f318-5758-4d2d-9e31-bebbb067b913@nabladev.com>
 <27062652-12e5-428f-b900-e50cff70452e@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <27062652-12e5-428f-b900-e50cff70452e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/28/26 7:00 AM, Krzysztof Kozlowski wrote:
> On 27/09/2026 20:06, Marek Vasut wrote:
>> On 9/27/26 6:59 PM, Krzysztof Kozlowski wrote:
>>> On 26/09/2026 01:00, Marek Vasut wrote:
>>>> On 9/25/26 11:46 PM, kernel test robot wrote:
>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>>> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
>>>>> commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/10910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>> config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/config)
>>>>> compiler: aarch64-linux-gcc (GCC) 8.5.0
>>>>> dtschema: 2026.10.dev2+g840a01d41
>>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609252351.5UfBIiOJ-lkp@intel.com/
>>>>>
>>>>> dtcheck warnings: (new ones prefixed by >>)
>>>>>       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>>>       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>> --
>>>>>       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>>>       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>> +CC krzk, I just cannot reproduce this locally. Do you know what I might
>>>> be missing here ? Thank you !
>>>
>>> The things or versions listed in top of that email.
>> Linux has plenty of examples of such shared-dma-pool/no-map entries:
>>
>> arch/arm64/boot/dts/freescale/imx952-evk.dts-		vdev0buffer:
>> vdev0buffer@88020000 {
>> arch/arm64/boot/dts/freescale/imx952-evk.dts:			compatible =
>> "shared-dma-pool";
>> arch/arm64/boot/dts/freescale/imx952-evk.dts-			reg = <0 0x88020000 0
>> 0x100000>;
>> arch/arm64/boot/dts/freescale/imx952-evk.dts-			no-map;
>> arch/arm64/boot/dts/freescale/imx952-evk.dts-		};
>>
>> Are those broken and need to be fixed, or is it dt-schema that is broken ?
> 
> This could be caused by recent dtschema change, which was also recently
> fixed. The LKP report had dtschema git version and as you can check it
> points exactly to the version changing reserved nodes (which introduced
> issues). Not to the latest one which fixes the issue.
> 
> If issue is reproduced with 840a01d but not with later, then obviously
> everything is fine.
I can confirm that the issue does not happen with current dt-schema/main 
5687115902ba ("schemas: reserved-memory: Fix invalid oneOf match with 
iommu-addresses") .
