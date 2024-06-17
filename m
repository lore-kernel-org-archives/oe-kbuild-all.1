Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80112AD39
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 03:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718594425; cv=none; b=ohG9FLlLtY762kvBPJ83Xtxti1M2PAeOT+oYCM4MRAYwCRgYRqLCbjG/DsVFMqo+Uulsw3+uV99Y4lplZEA1MKLvMXDwpNBUYmUTe1bAGJN99QwlVyDAbW8JkUcjx2QlboD8JNxFctQSxF9K6S5q6YvxwhbwAKFRmieX03Rsivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718594425; c=relaxed/simple;
	bh=x9eknM+uiJM3s5JSZ6S6xiskJ+mQ1NC6nhqDxlhqTw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vc3S9mWCfkH5PBhbojivWi6cYm6NhzT5hO6BEqScoLJy5IxUuJll9P9YcO9ldTa7/gaqnWRNs9PW056g9FjMmbjFzOWPM1IPgAYynTO54wAeOFDSEn17+rtUN4ABIQGi4a8/D+KW547UoNvXoNCMiIZrfGx/pbwk8V8SOsjFVEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pP55n7+p; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pP55n7+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2nkcSds7QxdWnyjawm44xlH4USScH8xdTFKg7s8rIUA=;
	b=pP55n7+p+wwwFvPTd5ZFkcSML30jTbKN1MQj9OT+XOqqzwK5KBozPl91bkL5Vl
	hWS7BqtWQvv0G2/hj2lZqNig09j3Qg+BEw2vPr+ZmY4XbdFEIquPTnLQ9jygvbHQ
	/YXiAt9Ih/2l1Kta/uJSlI+J8aeptZBOJQXEmBITSfuZo=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrAD3HyBiq29m+_kMCA--.57528S3;
	Mon, 17 Jun 2024 11:20:03 +0800 (CST)
Date: Mon, 17 Jun 2024 11:20:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: kernel test robot <lkp@intel.com>
Cc: Marek Vasut <marex@denx.de>, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [shawnguo:imx/dt64 27/42]
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: hdmi@32fd8000:
 Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
Message-ID: <Zm+rYkorx7K9dtIA@dragon>
References: <202406171104.SmweUTX3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406171104.SmweUTX3-lkp@intel.com>
X-CM-TRANSID:ClUQrAD3HyBiq29m+_kMCA--.57528S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw13WF17AF4rCr4fGrWfKrg_yoW5CrWxpF
	1UCFnrWrZYgF4xW39Fgwn09wn0vws3Ar15uw1UG34jkrW29F9rJF4S9r98Wr1j9r1IgayS
	yF1xZw1Sqwn8XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jaCJPUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFQYBZV6NnP-buwAAsn

Hi Marek,

Should I drop the patch or is it bindings that need to be updated?

Shawn

On Mon, Jun 17, 2024 at 11:04:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
> head:   152f7a9908b11ff55f3feb357a5f6ff84f90e69b
> commit: 11af40dc13f328c76648e16b8c8a6902b35bbd8c [27/42] arm64: dts: imx8mp: Enable HDMI on i.MX8MP DHCOM PDK2 and PDK3
> config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171104.SmweUTX3-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171104.SmweUTX3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406171104.SmweUTX3-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
> --
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:261.9-273.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: typec@3d: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/extcon/extcon-ptn5150.yaml#
>    arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
> >> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: hdmi@32fd8000: Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,imx8mp-hdmi-tx.yaml#
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

