Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F38635C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747738829; cv=none; b=PrfOPX1Vp4JHK1UMqX/X0PSHE1VVaaW3UbbXYrUR+W7DWn+BYwVTyR+b7rRL0TJCgb9sL5Wc3RbsA86c+o0PVYAACK5mF/Y2maFTmvEor+RET75H5m4G7ODuGmTQPgkoizU/y3s7xFvqwV07kCA0q13mj6I3M0PlgIzfVb1EM/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747738829; c=relaxed/simple;
	bh=g6+UIfeYu/GOK1YXqBBPFtuwynMHi8vjztJmB3m5qk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0/svIWI+1/H+JoNaM9qlDkR2hTyEiGmQLXz6xpDkvmbAy6SzQQxbcjBcqP1rdfEZ/tZGSpX60nAPNPebMHFb/KzwWPFhF52ZjcT4a1IGJ1YnFi37+4rR1WxeCIHav77ejh2U/gfa2OpV0F7or31eKSpG8CI5gvOtHrimMQGrGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=mnrtk5Qr; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="mnrtk5Qr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vd5AsOmQ9Ly5phH5BbaqewujT13K+i11U7T3y314n3U=; b=mnrtk5Qr4XAbExoJBMcE5jil0O
	tHEYAXcmcybVqwn3ebrgdaCpjwRD4e8+/aZo5Qic3lBB6/CgUIxdyIwG0hBchFWurDtNcqalJsfGN
	yX+qwbhX8zzQhqrWX/t6nrblh3HKKTDOHXek6gp2PJ/l/s5y+qQb9NRCdnRvMdKO9lO+PIDlkZvx8
	IIRsopCl+2RQNMk99CPLdG0LOtWotmei5USl0qgs7TcjZpaCqWMjkeFjechv8fhX0oj/JYarBzO2W
	jBERSxcskq/nne4kbODNtFhjhely7ysPLzD8A3XVta0n+CM3IxtEcX8xroyggWU4TgNzqaiovJ+J3
	Xgi/6pBg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:48780 helo=[192.168.69.52])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1uHKhs-00AgXt-0Q;
	Tue, 20 May 2025 13:00:24 +0200
Message-ID: <65983a8d-6816-4059-93a5-800f1a942059@norik.com>
Date: Tue, 20 May 2025 13:00:22 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4287/7938]
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d
 (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt:0:
 200000 is not of type 'array'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <202505021937.efnQPPqx-lkp@intel.com>
Content-Language: en-US
From: Andrej Picej <andrej.picej@norik.com>
Autocrypt: addr=andrej.picej@norik.com; keydata=
 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
 xtT/8OxBOVSHvA==
In-Reply-To: <202505021937.efnQPPqx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi all,

On 2. 05. 25 13:20, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
> commit: 7ed7d1ed852d8f4c4dee7a4d4f7807ad59c7915d [4287/7938] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
> config: arm64-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250502/202505021937.efnQPPqx-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> dtschema version: 2025.3.dev21+ge6ea659
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021937.efnQPPqx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505021937.efnQPPqx-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt:0: 200000 is not of type 'array'
>     	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt: [200000, 600000] is too long
>     	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
>     	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microvolt: [200000, 600000] is too long
>     	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint: Unevaluated properties are not allowed ('ti,lvds-vod-swing-clock-microvolt', 'ti,lvds-vod-swing-data-microvolt' were unexpected)
>     	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
>     	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-data-microvolt:1: 600000 is not of type 'array'
>     	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-clock-microvolt:0: 200000 is not of type 'array'
>     	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>     arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-clock-microvolt:1: 600000 is not of type 'array'
>     	from schema $id: http://devicetree.org/schemas/property-units.yaml#
> 

apologies for the delayed response, and thank you for the report.

I've investigated the DT schema validation errors reported for my patch. 
The issue stems from using "$ref: 
/schemas/types.yaml#/definitions/uint32-array" for the 
"ti,lvds-vod-swing-clock-microvolt" and 
"ti,lvds-vod-swing-data-microvolt" properties, which seems to expect a 
different structure than what the DTS provides (a standard 2-element 
uint32 array).

Replacing the "$ref" with an explicit array schema resolves the errors:

> 
>   type: array
>   items:
>     type: integer
>   minItems: 2
>   maxItems: 2


This matches the intended "<min max>" format in the DTS and passes 
validation.

Would this be the preferred way to describe such properties, or is there 
another recommended style for handling this case?

Best regards,
Andrej
