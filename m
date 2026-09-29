Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4243E024D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 03:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651436; cv=none; b=BO0DiF5zfFJ8U4DnI6jJI6u+BHFXyjiRNczZ5wX0la100C1YQYsNGJLJWmHszEUay24VpHNB0oEeQTIF9YNhGm4Q86jNOMospe87hB4RSmx0wK+x5uv3U9l5QgGdcULWYmeF+tMcF0OkeiAnX79uiGfQoH56ku/eTJ4rfgqWOzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651436; c=relaxed/simple;
	bh=dudPjvz3RpcTrW4LUJtkx0q5WX37D8QEs/OK/NCl+Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k70t5IxMYK14lyPW4TwpjcdA/xnbBNd7Iek1JEIbwlvSMuZavNQGHr2ZtP3UgbeAP7/aYbbFCBAsJd1w0FcVaiOQHy7bcOY9g+HXXFjnMIjLystSXXoOty6mvAYIQr6WfQ+R2ReSS2CVeyTWtJcwMUYVY09r7sa7n2Y2sFzrNHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=M222KNMg; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="M222KNMg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38E33104787;
	Tue, 29 Sep 2026 05:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790651423;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=J8HsgviU3zevlrat0s0P/sWHT6xXKPsx2tZa8Z5Ff6I=;
	b=M222KNMg3h7FTVLgc3iK6yooSNbPNS4vx0P8VPi+Fw43e5VhX8lwIW6GCtZGFV2YTYaV+n
	EPExBhI1vucBKalZ6R7oVoFiwQf82Cj401CazUQ/cYZlEuIKUzKv9vtSl3TeeD68EqEweA
	TfEj0oJK1SsMBW+Tk8+tCA9+u+Icq2XiIBo6rWmDit8RcXoOYcb12jHlepPzHWx3O9PuoX
	uUQuQhO24QbSfQdkKoEY01DP10aBWqTNvmD9LzspdVZghYbk33+O/mI6XTmkwOwhY6psQa
	3mk/TOcGpSfU1uOy1ajdOePvp0iD0AYpytT2iprbzB0T21qbJEuhGI55fiXWrA==
Message-ID: <71fa8ee2-6425-452a-8581-85280c89c7c5@nabladev.com>
Date: Tue, 29 Sep 2026 05:10:20 +0200
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
To: Philip Li <philip.li@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, oe-kbuild-all@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>
References: <202609252351.5UfBIiOJ-lkp@intel.com>
 <b70365a8-9812-434a-b514-4604835cf347@nabladev.com>
 <735d64cb-b35b-4854-8b6e-d1f32822c244@kernel.org>
 <8ed2f318-5758-4d2d-9e31-bebbb067b913@nabladev.com>
 <27062652-12e5-428f-b900-e50cff70452e@kernel.org>
 <17c2d593-194c-47ff-9c55-b86cba82f415@nabladev.com>
 <arsVX0tTq2WaVM9S@rli9-mobl>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <arsVX0tTq2WaVM9S@rli9-mobl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/29/26 3:33 AM, Philip Li wrote:
> On Mon, Sep 28, 2026 at 09:05:03PM +0200, Marek Vasut wrote:
>> On 9/28/26 7:00 AM, Krzysztof Kozlowski wrote:
>>> On 27/09/2026 20:06, Marek Vasut wrote:
>>>> On 9/27/26 6:59 PM, Krzysztof Kozlowski wrote:
>>>>> On 26/09/2026 01:00, Marek Vasut wrote:
>>>>>> On 9/25/26 11:46 PM, kernel test robot wrote:
>>>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>>>>> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
>>>>>>> commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/10910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>>>>>> config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/config)
>>>>>>> compiler: aarch64-linux-gcc (GCC) 8.5.0
>>>>>>> dtschema: 2026.10.dev2+g840a01d41
>>>>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/reproduce)
>>>>>>>
>>>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>>>> the same patch/commit), kindly add following tags
>>>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609252351.5UfBIiOJ-lkp@intel.com/
>>>>>>>
>>>>>>> dtcheck warnings: (new ones prefixed by >>)
>>>>>>>        	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>>>>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>>>>>        	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>>> --
>>>>>>>        	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>>>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>>>>>>>        	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>>>>> +CC krzk, I just cannot reproduce this locally. Do you know what I might
>>>>>> be missing here ? Thank you !
>>>>>
>>>>> The things or versions listed in top of that email.
>>>> Linux has plenty of examples of such shared-dma-pool/no-map entries:
>>>>
>>>> arch/arm64/boot/dts/freescale/imx952-evk.dts-		vdev0buffer:
>>>> vdev0buffer@88020000 {
>>>> arch/arm64/boot/dts/freescale/imx952-evk.dts:			compatible =
>>>> "shared-dma-pool";
>>>> arch/arm64/boot/dts/freescale/imx952-evk.dts-			reg = <0 0x88020000 0
>>>> 0x100000>;
>>>> arch/arm64/boot/dts/freescale/imx952-evk.dts-			no-map;
>>>> arch/arm64/boot/dts/freescale/imx952-evk.dts-		};
>>>>
>>>> Are those broken and need to be fixed, or is it dt-schema that is broken ?
>>>
>>> This could be caused by recent dtschema change, which was also recently
>>> fixed. The LKP report had dtschema git version and as you can check it
>>> points exactly to the version changing reserved nodes (which introduced
>>> issues). Not to the latest one which fixes the issue.
>>>
>>> If issue is reproduced with 840a01d but not with later, then obviously
>>> everything is fine.
>> I can confirm that the issue does not happen with current dt-schema/main
>> 5687115902ba ("schemas: reserved-memory: Fix invalid oneOf match with
>> iommu-addresses") .
> 
> Sorry for the false positive report, I will fix the bot to upgrade the dtschema
> to use 2026.10.dev4+g568711590 version.
No worries.

Thank you !
