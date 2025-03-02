Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF04EEB3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 20:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945863; cv=none; b=LbaApQsNRBsgTZ1yovlGX+0OmaA1sLg59TdJn0t/U0+rLumGOHLZcjWmoty8OF0qbfmVwHnW6zIxloL41iOENkUu6UasdxXqStFnxcfxoCYC3/qbYi+3Re8nUggtcWVZ+lFs/AIfr5yFlS4zzO8PKTyjjY7D5oT6tgh8G6RTFpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945863; c=relaxed/simple;
	bh=1v0iCWYYmfBkriZCYk7buZy1Vr4P7RGnBGC1E4+siOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SbI3avhXi2rObvqmgCvIiq0kpLn1iyuJY3oejAb9QvURxuzMobgUieYTJrCwnohmGMlRpvrEGzr9puAErk0t2Rol2bFRvHQmbHrWPtvlAczBDJzYO0PRmzHaAszEqmu3UC171yx9NPyqNXNB5YMvGJG1QhG5jRU7rouIP24MEPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=GEV4VHkt; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="GEV4VHkt"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CB0C92C01C1;
	Mon,  3 Mar 2025 09:04:12 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740945852;
	bh=OlsaELQmQhaGw6V3hchfPilFwA0woG0F6snHnqh0JoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GEV4VHkt6TJaIa2+tux0PwPE6rsXr/g+JuSKwIwpyyxId60zAlmpErEDQeX211l1y
	 pr98Zv4SaCrxW4cvT/aFl6avWFYWvlvdv/civOX3Srs9b62i5Ffm/TaaemusVTcNVB
	 7NbgoPPLNfILLuhEXpt9J/+g4xuXGs4hJ5/gv0He8gUOp+XY4ZTqefiJvk9nAnG+8S
	 RnxRr8oqSYEt12R6Q6LOUO9YTEo+2+Jjp1TG76JIi23Vi19/swPHJ0RMlqWD0vdkw4
	 92gVB1lLvO5WdxfVbjcndCVCT2zY92DCJVL2/ZHP629Eiic8stSGVng/Y1U8bHXx6l
	 pwf8WDl5xiNZA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67c4b9bc0000>; Mon, 03 Mar 2025 09:04:12 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id B145613EE37;
	Mon,  3 Mar 2025 09:04:12 +1300 (NZDT)
Message-ID: <ac2d3dcd-8bbd-4012-acf4-d0689f59aa6a@alliedtelesis.co.nz>
Date: Mon, 3 Mar 2025 09:04:12 +1300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [linux-next:master 4892/7423]
 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb:
 switch@1b000000: 'oneOf' conditional failed, one must be fixed:
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <202503030330.IXgD2w5L-lkp@intel.com>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <202503030330.IXgD2w5L-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67c4b9bc a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=gEfo2CItAAAA:8 a=0cQs5dtQxvmNpZMAhsQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 03/03/2025 08:56, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c0eb65494e59d9834af7cbad983629e9017b25a1
> commit: 92575a2182376e1244fe0c45e85158f5ebbd7b51 [4892/7423] dt-bindings: net: Add switch ports and interrupts to RTL9300
> config: mips-randconfig-051-20250303 (https://download.01.org/0day-ci/archive/20250303/202503030330.IXgD2w5L-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> dtschema version: 2025.3.dev3+gabf9328
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030330.IXgD2w5L-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503030330.IXgD2w5L-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>     arch/mips/boot/dts/realtek/rtl83xx.dtsi:19.11-58.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>     arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mips,mips34Kc']
>>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000: 'oneOf' conditional failed, one must be fixed:
>     	'ports' is a required property
>     	'ethernet-ports' is a required property
>     	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#
>>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000: 'interrupt-names' is a required property
>     	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#
>>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000: 'oneOf' conditional failed, one must be fixed:
>     	'interrupts' is a required property
>     	'interrupts-extended' is a required property
>     	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#
>
This is fixed by 
https://lore.kernel.org/linux-mips/20250218195216.1034220-5-chris.packham@alliedtelesis.co.nz/ 
and 
https://lore.kernel.org/linux-mips/20250218195216.1034220-6-chris.packham@alliedtelesis.co.nz/ 
which were sent to the linux-mips list.
