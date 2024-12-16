Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D731BC08B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 05:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734328218; cv=none; b=fg3dpAgOe+4Zr5kTOWNCa4nIhImewuh6RJ3QsOOKAFAHKv/YOxXrQwVMC/PCQ5j5ALjjb2DdIEJhl/dhSljkvkcceGOKXmkFkoXuMxxC3jZ+mqxTxCtOD9A9B0fY3KZfQJ8jPuZlYjtZ8bE3eqKcUbf4ncq9iQJCa6o8Xv6zwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734328218; c=relaxed/simple;
	bh=g2LjW45yJeCvAgTddbcIaRoiOB4DAZ8PmKvp9forOc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNcdF/HiaDm72cyeVZa7VY3OLtcHkikn+HAb/l3C4UVgNCBkyQfIzATzOeE2iyCUfiG7l9w8VBeFFMaw8tR5HsxnMWW7eD78xRdZANNF6bBTgLc61PJTB1lYYo7rFWO/Q0AhBeJyN6Kkn4ZGK0LPfjPnTcwXU8Eo64gB0NywHNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Ioa4CpUy; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Ioa4CpUy"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5249C10486D83;
	Mon, 16 Dec 2024 06:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734328213; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCtYxYIMGF0A5PEGc4khdfBgK3Zw9N7rP6m3jPfwks0=;
	b=Ioa4CpUy1/morUB2l/hLOptIAQnQ4sFekOijD+UW8TPs6X5yrEtCr1Q+65/DjudHWiUlpS
	A7bF0mpAURNQkiW8Az9mIXWF2Dqk4FkXUeyr0gNFDTWMfQI9afSHDYGrK0tm6wH/6EFVlO
	L4GZryMPceDyQ9rfW4l/+5cOkwW5NhrTWDgkkgzCHTSogf0CjbKUp8/i3L9yZSZsDRdK4Q
	zDHNermNxxZDAvCkSSwSDBMMIL/octDP/bm84jzKLBC+B1BxhUtVgkiajJqONpz0M02F1q
	XLXMU6yg+Vd39+6w+C3m+4SeggxT4HbqQLV7PMkbkDQMF0fSxWuQCiUPyvcTUw==
Message-ID: <fae48034-8ba0-1cbb-bbfe-13034dab5549@denx.de>
Date: Mon, 16 Dec 2024 06:51:05 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [linux-next:master 1940/3764]
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
 /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with
 compatible: ['ti,tlc59108']
Content-Language: en-US
To: Shawn Guo <shawnguo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <202412140525.pLh8UgfS-lkp@intel.com>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <202412140525.pLh8UgfS-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Shawn,

On 13.12.24 22:45, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4176cf5c5651c33769de83bb61b0287f4ec7719f
> commit: eead8f3536d5cdb0b300a473ca800249bbcd8329 [1940/3764] arm64: dts: imx8mp: add aristainetos3 board support
> config: arm64-randconfig-051-20241212 (https://download.01.org/0day-ci/archive/20241214/202412140525.pLh8UgfS-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> dtschema version: 2024.12.dev3+g93ee800
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140525.pLh8UgfS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412140525.pLh8UgfS-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     	'phytec,imx6ull-pcl063' was expected
>     	'fsl,imx6ulz' was expected
>     	'toradex,verdin-imx8mm' was expected
>     	'avnet,sm2s-imx8mp' was expected
>     	'toradex,verdin-imx8mp' was expected
>     	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
>     	'fsl,vf500' was expected
>     	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>     arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /: failed to match any schema with compatible: ['abb,imx8mp-aristanetos3-proton2s', 'abb,imx8mp-aristanetos3-som', 'fsl,imx8mp']
>     arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /: failed to match any schema with compatible: ['abb,imx8mp-aristanetos3-proton2s', 'abb,imx8mp-aristanetos3-som', 'fsl,imx8mp']
>>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
> 

Seems patch:

https://lkml.org/lkml/2024/11/5/227

is missing in linux-next... could you please pick up ?

Thanks!

bye,
Heiko
-- 
-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
