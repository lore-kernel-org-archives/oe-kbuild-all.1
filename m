Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E8A207675
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660405; cv=none; b=SYodqlcXO6LBvRCPKyQlu8Ne1BieLNDj5cTDgqNBtrh9dbqrbAWMtfM1I/2rDlkOuxn7I2aIEkG9Ik1/MzzxdY122LcnKwVspyc7SiVfwiH/UowVNrRRWp5ghbvgn7PLXofDG+Lr/PvQ05AtXyr6i95eWdNuJpibogNjPdtbyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660405; c=relaxed/simple;
	bh=guCYDEZfatS1noOg8DFizCB8qPAd1cKHdGMwaAKnd70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUbs08aK8l2LYwH6c73HYDBkjEwh7cG3T2kaCjGgbIE3R6bxmW20H3mwopt0LZrRA5PLEC908KGBS18mHkQZidj0uXHeejr2ZsFpbD0q/KGQC4xX8oIVxan1AWtg534njFxTgtUBjsknfYZCd6GIcVkQuTNThTKvpFVOmEM1uOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jVnRolT4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jVnRolT4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43675b1155bso61650325e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Feb 2025 01:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738660401; x=1739265201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yr/+ZLUNk+4n8++2+mVlj1ZU6ASEvzQYyto4goLfiVo=;
        b=jVnRolT4GL2FqVgZ9VU0Y0AHL2AyriiFY2sSkJJdC4O9kaJQrJzRbfeBdLZxHZVZP1
         lsoC2zKLkevKpEtQKpKPKSv95l4Ck6lHCL6h8tYVMQ3J/bf+jivCku7RykRr2Pucvneo
         hXfK0u/Yy/7D8Kae99wAOSSlOn0p/upBeJaOyCI0E6pp8TSoAjIB5Ge94bzXgdqa9TgO
         mg1+CdZuj/he2Cb++knkdRd/1G7DJVA/UyBVRsDk6gdmr7grw2f/q36fEomPx4mHv7Xc
         0SIiNovS+wbDi7cb6qCyFiRldesthUFTapMSd5C0Wz5+7e0Xji+qz8sHEOgbu2d5C0Xx
         HPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660401; x=1739265201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr/+ZLUNk+4n8++2+mVlj1ZU6ASEvzQYyto4goLfiVo=;
        b=dkUHOw61NELv6hKUl5mvkScxe1+ubC0HVQY41d/1tp+5CgjDwbwxUlgVgc7uDWxRaa
         /IPmxFjLqzLimvXhYqywwl5nkvlBwYmManTsU6dFt30gTw6HfoSXv1jCcQVB3+kbyue9
         cwgFx8SFY2bOObz34R08FrUClV8XTeujNI8dRDyPrJiwM8a5tmqQhHYiUNG0NpzB1FAw
         TfLIqWoNebhgABqsDohsvrx+jmFWqt8dyWPDAv4xFDOXkiHcKD0ODEliiGijH1XRAtpw
         nODdyTzGoFzm28Oya/sygBWm0jFpGa4ZBF2mIqPr9rmtW/6tqckfnS9EYJm7rkGKQNMC
         ZljQ==
X-Gm-Message-State: AOJu0Ywvrm6/3V5yVvjpnT3FGyDSHpAiiVcjihs9wVPNF+c1d1naCyvA
	zLmGkbsBMklxsIMVoL72eHkayXbMKfZPggsOAcpTBFPR0ZXlfentsoVGWj1t5RQ=
X-Gm-Gg: ASbGncvmT9P6wa3t/NgfEJaPfp/59/OsZ9ma69LMKuLwa9jTG83R1/VUe3tCyzElrt6
	fuymcGXMxeMQoib0ew8jAwavjyP84HedAoRrGBVSq+A4zFx8Sj258SHKG5oSg9xhWHx6UYgKFUU
	xAMTzyNbuh/DNuJzxAI1FfxBbu5yfgwCLvzcxHpalmm6HMZ8h09jYF8RJga3vEywQ7ceZtadyuh
	xFgs/ej7mp9szMXlOKI8v77f831V62Edhsuhhtvv304YBETlCVpj/z6oXXMke0IuR71RnUmJ+dA
	+84Ccb3UwPNLLe3TMpdOgudTlE8KZkvXBk/gkg/WVj4EjP+MjVOxfCpOKasq
X-Google-Smtp-Source: AGHT+IEbzL0EqLuDwQ6Yf31TGo6zlY2GXAZdCWOhx7/P2QuqO2JQc1DkrMAkqHEyKCWJuqpiYC70vg==
X-Received: by 2002:a05:600c:35d3:b0:434:f586:753c with SMTP id 5b1f17b1804b1-438dc3c3790mr229867965e9.7.1738660401236;
        Tue, 04 Feb 2025 01:13:21 -0800 (PST)
Received: from dfj (host-95-244-234-244.retail.telecomitalia.it. [95.244.234.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm179835275e9.33.2025.02.04.01.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:13:20 -0800 (PST)
Date: Tue, 4 Feb 2025 10:12:05 +0100
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <nuno.sa@analog.com>, 
	linux-iio@vger.kernel.org
Subject: Re: [jic23-iio:testing 23/47] drivers/iio/dac/adi-axi-dac.c:731
 axi_dac_bus_set_io_mode() warn: always true condition '(mode >= 0) =>
 (0-u32max >= 0)'
Message-ID: <l575dzyjzix2xnljfadw5uuu3qdzhmtcbkyg6eaccf2h5dtvsz@ju5mqszl2vzb>
References: <202502040758.DJqHqhLO-lkp@intel.com>
 <rhmmbt3yqfqhodivu2smuu4g2i77sqyzr3jjjxtvjsny7a6jgd@64bong6elaul>
 <20250204085744.000075d4@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204085744.000075d4@huawei.com>

On 04.02.2025 08:57, Jonathan Cameron wrote:
> On Tue, 4 Feb 2025 09:43:17 +0100
> Angelo Dureghello <adureghello@baylibre.com> wrote:
> 
> > Hi Jonathan,
> > 
> > On 04.02.2025 07:23, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> > > head:   315198c0a370da031f5c3d504b99f771a0c545ab
> > > commit: 493122c53af1915b4b5b5f47a8c446973ebff052 [23/47] iio: dac: adi-axi-dac: add bus mode setup
> > > config: m68k-randconfig-r071-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040758.DJqHqhLO-lkp@intel.com/config)
> > > compiler: m68k-linux-gcc (GCC) 14.2.0
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202502040758.DJqHqhLO-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > drivers/iio/dac/adi-axi-dac.c:731 axi_dac_bus_set_io_mode() warn: always true condition '(mode >= 0) => (0-u32max >= 0)'
> > > 
> > > vim +731 drivers/iio/dac/adi-axi-dac.c
> > > 
> > >    724	
> > >    725	static int axi_dac_bus_set_io_mode(struct iio_backend *back,
> > >    726					   enum ad3552r_io_mode mode)
> > >    727	{
> > >    728		struct axi_dac_state *st = iio_backend_get_priv(back);
> > >    729		int ival, ret;
> > >    730	  
> > >  > 731		if (!(mode >= AD3552R_IO_MODE_SPI && mode <= AD3552R_IO_MODE_QSPI))  
> > >    732  
> > 
> > not clear to me the reason of this warning, maybe because mode is an enum ?
> > Should i take any action ?
> 
> Currently there are only a few modes in there and that range covers them all I think.
> So warning is correct, but we perhaps want this check there as hardening against future
> addition of more modes.  Maybe an explicit switch with all modes listed and a default
> will have same effect and be better defense anyway against future changes?
> 
> Jonathan

thanks, clear now. 
Is maintaining the waring an issue ?
Another chance may be adding a AD3552R_IO_MODE_MAX as last item ?

angelo
> 
> 
> > 
> > 			return -EINVAL;
> > >    733	
> > >    734		guard(mutex)(&st->lock);
> > >    735	
> > >    736		ret = regmap_update_bits(st->regmap, AXI_DAC_CUSTOM_CTRL_REG,
> > >    737				AXI_DAC_CUSTOM_CTRL_MULTI_IO_MODE,
> > >    738				FIELD_PREP(AXI_DAC_CUSTOM_CTRL_MULTI_IO_MODE, mode));
> > >    739		if (ret)
> > >    740			return ret;
> > >    741	
> > >    742		return regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, ival,
> > >    743				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0, 10,
> > >    744				100 * KILO);
> > >    745	}
> > >    746	
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki  
> > 
> > Thanks,
> > regards,
> > angelo
> 
