Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF224187859
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553153; cv=none; b=tdqQWrxtFknVdhcjPck5TSSvx/WoPQ79Ih/3bWoSzn6dqi+uei+mDPDJW8K/Sep45FggsiFpW4IW31TJYTQkV2IjKqjoFTsXGYtUUYdwFCfatSFiXWgvIiGNP9DHAkhgK0Os+GdMQIe8buYpG3eRz30va8wD32fz3TgHA/4zOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553153; c=relaxed/simple;
	bh=qYSZWnkyxaA3Jj9vXrwoqqK1aquLJcjN5MHNVYvr53I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeQj4nVIG56DK7s4KtpeoOlD5A3T+HsYeCp5t4e35Va204IccGlKbKrntVOiOhD37beBaHCSIbBl/CxTAUrCQu9z8FgB2zGejwGyW0+bKDBT8wEZ+61rcd6UK1sVD5m1eTSCxJVmz4d5vmJPbLzV5jBfpoAufr8duuMlaxEoge4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKP9BTyQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKP9BTyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3315C4CEC5;
	Thu, 10 Oct 2024 09:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728553152;
	bh=qYSZWnkyxaA3Jj9vXrwoqqK1aquLJcjN5MHNVYvr53I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKP9BTyQbzaAR5XSGTeN3ec0F0PDs2P27T+I38oTHK6tQSaxxALaIFu7xFts686dA
	 9hXD33Bvk+RLsU90slzNXksqsImXzs9zqatS11MbC5+OwChN5iFZudDIfJXWTFWsFT
	 h0gZIugi1Gx/rinChVRzl/aonnqwFANrBng4RBKnMdUAOyWz3vcc0yPcDPZjFNVXKM
	 RX0yUxDiE5YhBazLrt0tnOUFnknYk+iKOyWSNQjLAlCckrHCTdEVnl0E7tt27LL1PS
	 zreh+kT/0iWRQDwDqF2WYhCbMtf0i2lqdussTFJ2BMWgR4yKsmYaM0YhevuadkxNiw
	 iZLthiw4drqIQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sypdd-000000001h4-0yYf;
	Thu, 10 Oct 2024 11:39:17 +0200
Date: Thu, 10 Oct 2024 11:39:17 +0200
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [linux-next:master 2312/2853]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000:
 clocks: [[52, 122], [52, 120], [139, 10], [52, 123], [52, 125], [52, 127]]
 is too long
Message-ID: <ZwegxZBIXYrSVK2i@hovoldconsulting.com>
References: <202410092304.nR7sBZ4r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410092304.nR7sBZ4r-lkp@intel.com>

On Wed, Oct 09, 2024 at 11:54:32PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
> commit: 27727cb6604e0998d03d9ec063b517b239d2bb0f [2312/2853] arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY clocks
> config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241009/202410092304.nR7sBZ4r-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev4+g577c1ab
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410092304.nR7sBZ4r-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410092304.nR7sBZ4r-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/x1e80100.dtsi:4145.11-4155.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
>    	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
> >> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: clocks: [[52, 122], [52, 120], [139, 10], [52, 123], [52, 125], [52, 127]] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
> >> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1bfc000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
> >> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
> >> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
>    	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>    arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
>    	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

Judging from a quick look all of this is due to the fact that the
PHY binding update has not been merged yet:

	https://lore.kernel.org/lkml/20240916082307.29393-2-johan+linaro@kernel.org/

So should sort itself out soonish.

Johan
