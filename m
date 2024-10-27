Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6501DFE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 21:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730062984; cv=none; b=NvS+8tunPTqs6khxXqlAwgdzVKC1hcr0hjo6FJy5+inU0ZiPchG9VHScPhFaaXwFCeNh197JaAuU+oMglMQk9prY0lTCRQz46XxhKbuKURPGCeOYyEaz/TZS/WLN0XIQgPRZp75Zcjh/8ElCq7QnlRkf2UzSrL3qh9Sz9hXQY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730062984; c=relaxed/simple;
	bh=cp5TtzUJVN3ywAd/IXdqAlQveZ1W8WmMmOTD+dwRjhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hT+w1hJTKM9WhJYR0a4HRnTN1BwkodnEJBIYYiu4kOq0xmRcNFN2rarODi25uA7OtvkDl0pxJQc9FXw9Ui+4NcDptqSAozrxJEifaSJEOqax6SZod4dI/unkP4s/VawStALw3Od9xmWr6u+Pmp0NDNd5+TnnCHTIpUvXSP1hv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=LfFC1XgD; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="LfFC1XgD"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F178B88E31;
	Sun, 27 Oct 2024 22:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730062975;
	bh=MmExOwajJ6SBkDdipBnKSESH84JasReo2tJ4VUVT0O0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LfFC1XgDiGkmHV7qzwzIys+z5m/qt2Om9vA3pKEYIhSjvfD9nf6OtBpmlq4H++NKt
	 3NK1mG8gjz4Vd31mSxgian94LzgTXJ1jBKa1ZlPttR4ZOR9aduw+01F4/LZeIb5t8x
	 PZVuMzOd8FtVj/zt7R18MmpzRNDuLzC/uJjaLgQzDkqnfwJ1x9FvRKl8FADfWOYD3q
	 ThnQRbq585MMa7tPRGQF39T2MnGoICUqPFAiatg0ln+LgS8Duay7EdOwcvl4bylMn+
	 t9jTQVl1/NxDWUAfjZBVmyCwZQ1wprcIAuaOjw8r1koZgKxD5aCeCSb5/Vnuv7Ub3D
	 I5D8t2FOUmBuA==
Message-ID: <4d989ac6-272a-470e-bed0-0229a13ba9a7@denx.de>
Date: Sun, 27 Oct 2024 21:41:54 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5515/7183]
 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any
 schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>
References: <202410280343.WJE7GVzN-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <202410280343.WJE7GVzN-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/27/24 8:24 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
> commit: c3f5d76a6e036b55cacf6489914aa7b82637843c [5515/7183] ARM: dts: imx6dl: Add support for i.MX6DL DHCOM SoM on PDK2 carrier board
> config: arm-randconfig-051-20241023 (https://download.01.org/0day-ci/archive/20241028/202410280343.WJE7GVzN-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev6+g12c3cd5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280343.WJE7GVzN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410280343.WJE7GVzN-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     	'phytec,imx6ul-pcl063' was expected
>     	'phytec,imx6ull-pcl063' was expected
>     	'fsl,imx6ulz' was expected
>     	'toradex,verdin-imx8mm' was expected
>     	'avnet,sm2s-imx8mp' was expected
>     	'toradex,verdin-imx8mp' was expected
>     	'fsl,imx6dl' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
>     	'fsl,vf500' was expected
>     	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>     arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /: failed to match any schema with compatible: ['dh,imx6dl-dhcom-pdk2', 'dh,imx6dl-dhcom-som', 'fsl,imx6dl']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: iomuxc-gpr@20e0000: 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: 'pinctrl-[0-9]+'
>     	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2000000/pinctrl@20e0000: failed to match any schema with compatible: ['fsl,imx6dl-iomuxc']
>     arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/i2c@21a8000/pmic@3c: failed to match any schema with compatible: ['lltc,ltc3676']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/mipi@21dc000: failed to match any schema with compatible: ['fsl,imx6-mipi-csi2']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /capture-subsystem: failed to match any schema with compatible: ['fsl,imx-capture-subsystem']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']
>>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: /disp0: failed to match any schema with compatible: ['fsl,imx-parallel-display']
No real surprise here , the IPs listed here do not have their DT schemas 
converted from text yet.

[PATCH v3 02/12] ARM: dts: imx35: Align pin config nodes with bindings
and the rest of the series should at least help with the iomuxc .
