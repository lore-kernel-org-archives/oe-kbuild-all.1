Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5A53A8BD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954722; cv=none; b=q1e6KBbKM6RHTydF1Ws3azTv2TEZj8bCSgB/BljrhKglCzTsM04SJl/VsxXguWa0XVAcNbl3nndQJKq+NskFYeWkOPn3gwEBx+RFZcII1oRoopy/iyrfxLUJh2lQiCDN2zpk70Kyem0xFKfSE4/KeZTmgAG0RzrT3tA1+My10+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954722; c=relaxed/simple;
	bh=Ot4B5tz4S9Qe5sHK+HG9J++nP9Mc/uWkplbz9xQyt8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/Q3uVVEONgRhBUM6EMVQpVArk3ruL7QDW1ADmEIqE8f1tBe39Gdhl4y2zkiWgvZW8gsUSF0rxl3ZHYtLgi92j+WU1kUKj8bUh1dEi3OPinTQlxW2ex8KR+IF519qm8fUhbkECdpO0MqywzZdpUsDE4FJ2MUtz7PjAIzFfVTi/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFGsBspk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFGsBspk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so34350745e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Sep 2026 04:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788954718; x=1789559518; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nhe9NczUq9Mbpq4goMzw9mFbZb2hrhosRkGmzA2+btc=;
        b=UFGsBspkFKqUY/ddvF/i0Qp+eKMuVn01Z7U2Un2zX7Sl5ijkM5R7sFG3CqFnY/n2fO
         /kHXRzaRaz77QpROFZfkwdVzs2oEY/MSeizjY2etFmowSpJpTiDPBDQ7cNSz8WVMlsv3
         /LBwGIFC+EU2GfP1uwdzym7L2ksGD1ooWBt8+6v9GiwES7DU7PqDPBkUmDQ9CMfAS5CK
         fn6MfE+Ygtb7dlZqhNAANNuA2UgDmQeq6BJm3nUr45IL6Yl/+yGbT74/MCH8gSDuLkUK
         N8TPSmvJJWR76LeZIl/CdeqO8bS/50rg6EHsApMVKdAMuoTPkZ9d80866HQ62IcnY/Ow
         ZhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954718; x=1789559518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nhe9NczUq9Mbpq4goMzw9mFbZb2hrhosRkGmzA2+btc=;
        b=VKkh9A5FXTCmN/DZRtr1mYLO9HOOBLYZ8GMJCcOi63wMYqmGdsURrOJb7MqU3OU2oN
         w/iQoN3w6SVjoxN/lZEjfCVFlleRstzAaQ61YUyuyCsJ7tLqfU2eaUwE4WeLxgq0Lj0L
         3gCBl/ukkn4AqNigYU2Q7yOgGk6AZQ1fdf1hA6OzU8/MWm6xy5z+DRJl006qpM691v85
         hOXSLSUPf9sthO83XmHDl4KMvXX7xgyoxsZmVAVMRp5m++d9YbWFYxjcAJOyyecnsqUg
         IB6hLV03pkD8+ak8bWeWClGo6DkY5B7L2cnH8mFQSVw6TfVd2vRa81cZyfCdqHuc86b4
         jPbw==
X-Forwarded-Encrypted: i=1; AKwUvBxHJJRvbVSnkclTy+xciNlYvRxczxYL4OyRkyQ2elbIXJ2P0sJ1ftNI0BJwVz526HBM1Drj2Oxjgi7vdKVB@lists.linux.dev
X-Gm-Message-State: AFuF++nzHkct/2msGbiVvvjJmb3Kpc2KWJV23pnths/vFr9VE21JD9qD
	WQSFR+5Nmlq5Jwfc06OGI2OfXbNc/keaFySjeW2w1KlKyz7/TKBiUWSW
X-Gm-Gg: AYBFou2pPWIW19H6wd/CIMHIGURIYEgMFoJrXuEoT+TBxFwxrQ141FBE22Ti0ctqSl/
	cwzrUdCUPo4uOIzqHtNMFLUaR80epCW8k/dyw9H6ox0hy89Gx4VeIh8nhN10in8vpRjQUOqjG0D
	83M8OUP9aa6u+x0fpBIFv+hzbW1DRwdxbjc/LDU5FaDbl6DyCpmpCUowwp5bkkwZ+EaFntFIgxn
	K7Gw0JydDrIi+wkrxpNq4qwgLOyG5mnUshQDHsQk8/OClqdDxr0v102699iovPN/DzHkProYwLa
	y+wzI2Gtiax2ptQcC90qSZ1rZ0/2KAxYbBtQfOipNRRKkr1Q4jyqKKXZHSY2lQWRREtidCJEUVT
	RKXPEPpFa79m/EGEkBHblro8qL/n9r9qpgLgaJA4XLmSXT7m/+XLBiVlASYgWAWS4vl4n4AvrJu
	uo2Ir8t32HGVc3VNfoEhoRRY6QaHUwSt9m22LOTaG9TB1bp0F9pVqMg8ZC9pFNaOAJcuoM/l8vX
	n7Iqzc7r70N8gjwIBGLRitQ2C4xeIBtsMq/4shTEzMzMDjywJZs3zPN5Fx7PEVGByZHTNeuA8vB
	Y/enQvJCAPLnYUOTPSgnKrZOoLJ8fnN7bwQORLU3SMmjzb5YjLw7ps4j
X-Received: by 2002:a05:600c:3148:b0:49d:1e3d:3b3f with SMTP id 5b1f17b1804b1-49d1e3d3b56mr69364485e9.8.1788954718068;
        Wed, 09 Sep 2026 04:51:58 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm579101905e9.6.2026.09.09.04.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:51:57 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:51:56 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, 
	oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [linux-next:master 2542/4316]
 arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphynop2
 (usb-nop-xceiv): '#phy-cells' is a required property
Message-ID: <tzw72rsa2pt4zayfztmicry3ybdj74wk7gvwgfu6ncmm2xpwnh@l2xexiixpstm>
References: <202609082058.gjkFuxpv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609082058.gjkFuxpv-lkp@intel.com>

On Tue, Sep 08, 2026 at 08:58:39PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   944a035ecca915ae947905dcfb03f2b9dc6d032c
> commit: cf08ef6995204752d8423226f3588c76c6403996 [2542/4316] arm64: dts: apalis-imx8: Add USB HSIC support
> config: arm64-randconfig-2051-20260907 (https://download.01.org/0day-ci/archive/20260908/202609082058.gjkFuxpv-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 10.5.0
> dtschema: 2026.7.dev16+g39602f98e
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609082058.gjkFuxpv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609082058.gjkFuxpv-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
> >> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> --
> >> arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dtb: usbphynop2 (usb-nop-xceiv): '#phy-cells' is a required property
>    	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Hi Frank,

The warning is caused because the initial patch to support USB HSIC 
submitted by you lacked the property.
https://lore.kernel.org/imx/20260720-qm_smmu-v1-2-3689fbd8b516@nxp.com/

Sashiko pointed that one out back then but it was ignored.

I also missed the warnings as in my submitted series the property was
included.
https://lore.kernel.org/all/20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com/

I think it should be fixed in the initial patch.
Can you maybe fix that?

Thanks

Franz
