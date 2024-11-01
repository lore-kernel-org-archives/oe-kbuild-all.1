Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761ED194C89
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461085; cv=none; b=NqTo2Ox924McWuCcUlmR5HIOg33jXzDFPSE54D+pDzLgRTd2A35fbW8Z4TFAQYPI8rf/Kgc/kygY/gIkGy7Yjd8/MClOC0VP9/Q4Hauc09JHA1rrdV70w43rTvsBgLAn3xQTiLFTnU2uNVOsfalXgvMf/FFPay3fwmhAcSH2IrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461085; c=relaxed/simple;
	bh=lLzApKGXP4yKPgiyBXZfCHrEUshQDR3sB/lxsiiyMyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gH3pk3FyhNsdrmDgrHyw4iVwcWVAdqfK82dbRqQUZfFQXwBPn/6vZVzz9gOSqwFnnyWU2A2m2xDKB19ME+UHEYEY9iiOvw8p7q49fv7HJ3b3j7UHMr1Jr+vdzgqAN9RZOnGN+ifdcSq4Z18ma6uRI18a7NKXUQtkxQZhU/vyeAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PTMHHfi9; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PTMHHfi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=N7PITZcZCWwNJ18MiPygl/2uU6o9L1C5AVMhdiSlK2Y=;
	b=PTMHHfi9U1OmzVk5oCEDXDugw9y/eQcgf2zfvUE0c4YY+KgeBKFgCvQA2lrXW2
	HAvtss4vUsM94+Q2chsaMPvk7MRoUySPdp/2v+JYQZYV4pkI3cRWKVa/CS1Yx72T
	r1lM3jeQx5LkI3IKS1UK+vFAHoDcoahz7tXh4ZNzCzYwM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3v_l_vSRnitdlAQ--.13988S3;
	Fri, 01 Nov 2024 19:37:37 +0800 (CST)
Date: Fri, 1 Nov 2024 19:37:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: kernel test robot <lkp@intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, oe-kbuild-all@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [linux-next:master 5865/6433]
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: usbphy@5b100000: 'nxp,sim' is
 a required property
Message-ID: <ZyS9fwsomC3iO881@dragon>
References: <202410240411.1YzFzxxo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410240411.1YzFzxxo-lkp@intel.com>
X-CM-TRANSID:Mc8vCgA3v_l_vSRnitdlAQ--.13988S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw17XFWrXryfCF17AFyUtrb_yoW8Xw48pa
	1xAan0gr4vgF10g3yqgrnxuF45tan8J3WY934DGryUua45uF9Iq3WSy3yavr1q9rn7K3yI
	yFn7Xrnxtw1UWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jV_MfUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwuKZWcks1IbtwAAsh

On Thu, Oct 24, 2024 at 04:11:43AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ceab669fdf7b7510b4e4997b33d6f66e433a96db
> commit: 78009bc3ffe128f492df3c5c6c049892971559d6 [5865/6433] arm64: dts: imx8qxp-mek: add usbotg1 and related node
> config: arm64-randconfig-051-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240411.1YzFzxxo-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev6+g12c3cd5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240411.1YzFzxxo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410240411.1YzFzxxo-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: esai@59010000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>    	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
> >> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: usbphy@5b100000: 'nxp,sim' is a required property
>    	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

Hi Frank,

Is this something we should be looking at?

Shawn

