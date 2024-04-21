Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DCF182B1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713720271; cv=none; b=XHcIox/mEzEPJfMY7yeGxASCOrp4Wc6HtekWQmcwPuh6038gfOsml06A77n6+ICnRSsAjucFYaS8WAmeKGEDmfKHLfFh8IbdpCsbdCCSSkVrVez94/4TuRHIs+3txpLgYS28LfONoMp+MdiDeN9ffavdRC7bNBqREh6MTpArcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713720271; c=relaxed/simple;
	bh=yHL0DbIQLkmeGdlCKpk8kjyfuAXLVJzOnT87LUKVr0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXidNYAOaLmMBhRJ0FAJ6XDOH2P5q2fCqAxinGlGMq4fGTqiAdWfzAJwCT6BvZE1CB/dYOTEf9SbdIJnHzR0Umhk2I4u8Rt5H3XmHG7ax8TtqdLArbYRHII+bD50khoAdBBuTaQ4niL//GWokk864WIh7kC9+fAVNEH4Tn5qmuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DaIrHnj9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DaIrHnj9"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso5676626e87.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713720268; x=1714325068; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qP4QRJgU1BApHuToLH0DTtNB0ZEyDCq59t66ZEJwTQg=;
        b=DaIrHnj9dTTvBr/2XIkbBGPZuMUE9dMqynMioNF7BNVvs+45WPwZRMnj9MIvFJLE/D
         hXSfONNzrPZugqffW/10FnzvslZCdnNuYdIt/wpo8hpIqK1LEwEaRaO4yv8v0WItUGOH
         0wywHv6NDKXlpjdkc7vrnk+jJ5+517OhDCBXrQDrILlcZ97WDqHd4pWt/oDsdfDfLAcW
         jTzrNHlKpbdISGjopQiJccT+hKAm3Qcxx4ISqUxaKbhkM8qKxq8moyE25icjivc2J5E1
         Y0qwADxAkJTcC9kpe5oOEmFuCLX5Qz10E1yipH8dZPI+pncs8zYzsafr6Cj/hpZASfqD
         iMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713720268; x=1714325068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP4QRJgU1BApHuToLH0DTtNB0ZEyDCq59t66ZEJwTQg=;
        b=ZDYkcsWVXqW8gKJ553/+96Ai1NECpcY/MMawZ839AXolYaLMAFywn4osszaSBKpASw
         tp6erKi0gMZnp8v7V20SBoZmAPkhq+O6HzdvWdnd4v9ptf3mj+3hgFpZmtUWhhByINpF
         txepib4UhW4BuODmq4e0jHa6bl2iqkToOcbyFqpPA2CKuf1PVtAQweiOcES8r39Gu40l
         kdQsEDsr0gzPir0KQ+KCq7X7hf0RSp1tpi49y8cNlXUcC/L8fKCIYrIip9NsEzGfNHdw
         jIJzien9+E878To4dHW/pUmKuzz8Penc73P/TLnB6jpXTBbAa3CREH3hMY6lh7jX5xMh
         s34g==
X-Forwarded-Encrypted: i=1; AJvYcCU3kcpkEZ8hT2ccc7jHSbQfJMU5R2obgyS/VUOHA4WhPvBZbmlbNaZ6Ceq56B5f5i6CxgckhaCxVOXQRnR5yameEJzgpH5SF/DvZ2elIA==
X-Gm-Message-State: AOJu0Yw25ui8XA7YHAwJACbvcXjutmCJPR8vNibPSw6wzVh7/Ol4ueOi
	CdhMllAutnCOAZ3gCzLPleyrjWFmbdSu7ksSjmVHH40+w2LW6f/SAawMNRWha3A=
X-Google-Smtp-Source: AGHT+IFLvHBYF/HR8/m7asEk356ewfwQEIZ3ux1d+BGEv1g/KRonZRM89ywg48Iy/h82lTw96asb1w==
X-Received: by 2002:a05:6512:370f:b0:518:c8e1:478 with SMTP id z15-20020a056512370f00b00518c8e10478mr5802469lfr.58.1713720267513;
        Sun, 21 Apr 2024 10:24:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id u18-20020ac25192000000b00518d5c5740esm1507389lfi.180.2024.04.21.10.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 10:24:26 -0700 (PDT)
Date: Sun, 21 Apr 2024 20:24:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, 
	"neil . armstrong @ linaro . org" <neil.armstrong@linaro.org>, "rfoss @ kernel . org" <rfoss@kernel.org>, 
	"Laurent . pinchart @ ideasonboard . com" <Laurent.pinchart@ideasonboard.com>, "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
	"jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, 
	"maarten . lankhorst @ linux . intel . com" <maarten.lankhorst@linux.intel.com>, "mripard @ kernel . org" <mripard@kernel.org>, 
	"tzimmermann @ suse . de" <tzimmermann@suse.de>, "airlied @ gmail . com" <airlied@gmail.com>, 
	"daniel @ ffwll . ch" <daniel@ffwll.ch>, "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
	"krzysztof . kozlowski+dt @ linaro . org" <krzysztof.kozlowski+dt@linaro.org>, "conor+dt @ kernel . org" <conor+dt@kernel.org>, 
	"linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
	"Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, 
	"alexandre . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>, "claudiu . beznea @ tuxon . dev" <claudiu.beznea@tuxon.dev>, 
	"Manikandan . M @ microchip . com" <Manikandan.M@microchip.com>, "arnd @ arndb . de" <arnd@arndb.de>, 
	"geert+renesas @ glider . be" <geert+renesas@glider.be>, "Jason @ zx2c4 . com" <Jason@zx2c4.com>, 
	"mpe @ ellerman . id . au" <mpe@ellerman.id.au>, "gerg @ linux-m68k . org" <gerg@linux-m68k.org>, 
	"rdunlap @ infradead . org" <rdunlap@infradead.org>, "vbabka @ suse . cz" <vbabka@suse.cz>, 
	"dri-devel @ lists . freedesktop . org" <dri-devel@lists.freedesktop.org>, "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>, 
	"linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, 
	"oe-kbuild-all @ lists . linux . dev" <oe-kbuild-all@lists.linux.dev>, 
	"Hari . PrasathGE @ microchip . com" <Hari.PrasathGE@microchip.com>
Subject: Re: [PATCH v8 2/4] drm/bridge: add lvds controller support for sam9x7
Message-ID: <2ct5tav52onwd6ceuzqbbam4qsqfvxdjpsrbn72jbsyjtcgtsl@j3d7piqqheel>
References: <20240421011050.43265-1-dharma.b@microchip.com>
 <20240421011050.43265-3-dharma.b@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240421011050.43265-3-dharma.b@microchip.com>

On Sun, Apr 21, 2024 at 06:40:48AM +0530, Dharma Balasubiramani wrote:
> Add a new LVDS controller driver for sam9x7 which does the following:
> - Prepares and enables the LVDS Peripheral clock
> - Defines its connector type as DRM_MODE_CONNECTOR_LVDS and adds itself
> to the global bridge list.
> - Identifies its output endpoint as panel and adds it to the encoder
> display pipeline
> - Enables the LVDS serializer
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
> ---
> Changelog
> v7 -> v8
> - Assign ret variable properly before checking it for err.
> v6 -> v7
> - Remove setting encoder type from bridge driver.
> - Drop clk_disable() from pm_runtime_get_sync() error handling.
> - Use devm_clk_get() instead of prepared version.
> - Hence use clk_prepare_enable() and clk_disable_unprepare().
> - Use devm_drm_of_get_bridge() instead of devm_drm_panel_bridge_add().
> - Add error check for devm_pm_runtime_enable().
> - Use dev_err() instead of DRM_DEV_ERROR() as it is deprecated.
> - Add missing Acked-by tag.
> v5 -> v6
> - No Changes.
> v4 -> v5
> - Drop the unused variable 'format'.
> - Use DRM wrapper for dev_err() to maintain uniformity.
> - return -ENODEV instead of -EINVAL to maintain consistency with other DRM
>   bridge drivers.
> v3 -> v4
> - No changes.
> v2 ->v3
> - Correct Typo error "serializer".
> - Consolidate get() and prepare() functions and use devm_clk_get_prepared().
> - Remove unused variable 'ret' in probe().
> - Use devm_pm_runtime_enable() and drop the mchp_lvds_remove().
> v1 -> v2
> - Drop 'res' variable and combine two lines into one.
> - Handle deferred probe properly, use dev_err_probe().
> - Don't print anything on deferred probe. Dropped print.
> - Remove the MODULE_ALIAS and add MODULE_DEVICE_TABLE().
> - symbol 'mchp_lvds_driver' was not declared. It should be static.
> ---
>  drivers/gpu/drm/bridge/Kconfig          |   7 +
>  drivers/gpu/drm/bridge/Makefile         |   1 +
>  drivers/gpu/drm/bridge/microchip-lvds.c | 229 ++++++++++++++++++++++++
>  3 files changed, 237 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
