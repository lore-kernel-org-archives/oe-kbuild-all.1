Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654256A343
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 06:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713421550; cv=none; b=pbn2z753ICeshLdRgbdSYr9WZxXWRKZ0pGbCeGz0kd1VHN0jYrgQN7/Fhn+LimpPMSUPKIGpFc6KJqKyyS8n5CIAEMQTliyGu1CrnDoSi0DvS9PG4ex+Gd3w2+JDA6+dU7W2f7CmvntOHsj47ZFDwMQMwUWPelOawWQrPeOL6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713421550; c=relaxed/simple;
	bh=T3gnbHnqDTNsXZjKgzNhK3w8RI5MS5/ZOhFLUooP1d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcW0wR5VsuC9gAvLUcXfepuvr30JzsiJUKvKJckqH6GE87ArrpGc0LNLrzFGmVH4cHQyEsklokC4oWXuPDcfVw9ZrDHFG50dh7iP9mJseHOh1CR0W+S124U7JLm6In3zuVSq8n9kDDT2z4qVM8QM1llamkiTEgFXBxywQuanbMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHngcDxn; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHngcDxn"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516dc51bb72so531820e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 23:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713421545; x=1714026345; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eeGlYTEPtwsiwYM/TpHd0Olr3KwcbSC63wU7MbucUsg=;
        b=JHngcDxnKbEQhsZpysb3LeeV8EKGMWZnVWXlLxSJXFXypJwwwaveTFzYgukq+SYjnx
         1MBKCr7NeH3LGRnsOE3ABD0S7j8e6LLsVhRow4rQuVNGzHKJ6CyuneBVvR885UKB9cxk
         gGdNktkoNouhyPkIDipMJXo8iU1UDMCiMfsTbZVeF9xgRPAbZdxYAoQDKc443jg7ZWd2
         HR6E9X2WAQAIaYzAjQOVQxLPn92A4/aFzow5qU26LW1kGUiMvpNRgLA4XyxPZZZrWuE0
         r71eHYTCs6LBb7/pXiq0xwsLTiurNMd+ryr8sqY/OlnyL2YzTckrNn/JexzmlvkLNono
         ec6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713421545; x=1714026345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeGlYTEPtwsiwYM/TpHd0Olr3KwcbSC63wU7MbucUsg=;
        b=Z1Da6OYU+2I8iigp0jWmGj6jjmQfDZY5n+aICZuKCnQ7G+HRh/vhNSY3z3IByUi6U9
         pvfSbKbIA8w/BZ1oW8LSwjSa5hpvbr6oV/1DafeuoRrE77Dpkrlturw66sBz7KgyPfA8
         XVd/ZLZmIKqhxmuHFVZozdwiJoJTqYAdPH0gPuvr0eyxdZ9GEABWIDB2WgFQjw0gs8JG
         ViB+ziWEamK2I9Xpg529ambFbGklSEwavr/+OfRS3OrAdsnyNShYD5Rj8anlMOcoJ5R1
         cy6nHOuKblYZtax2DBnvu8Loby1BhnHyjdoOVkVRVN7vc80ftE/qssyrt00ZLSgKHr/5
         iWKA==
X-Forwarded-Encrypted: i=1; AJvYcCVyccrQEw7TQFylcev68nKyX9NXfoKaCSlhPaHqfm+Kaw72ryHGUdmqEG8WiA3e8i9WgALG2zWNAp5Os4if5gwMQBQuug0jhh61TomHHw==
X-Gm-Message-State: AOJu0YxgWie4XQ8SZ5hQzc7b0evg/8h79hUa9KnwgoqRe17WGN0GYsgf
	ldZw7GuYc14jTCr1qa9EPZoByoWQccgZ1mId8CAjaeJwUGvh44q5PbJGcMFLUxk=
X-Google-Smtp-Source: AGHT+IHSQo96rBAeGsNob689+akPWqSZqQAXLoOckGnqF2JqlaQLfymxbweLLljeqKZYLOM3+sLT9Q==
X-Received: by 2002:a05:6512:484:b0:515:a6dd:9657 with SMTP id v4-20020a056512048400b00515a6dd9657mr800549lfq.16.1713421545466;
        Wed, 17 Apr 2024 23:25:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id d22-20020ac241d6000000b0051327d2f5e5sm117819lfi.119.2024.04.17.23.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:25:45 -0700 (PDT)
Date: Thu, 18 Apr 2024 09:25:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dharma.B@microchip.com
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, linux@armlinux.org.uk, Nicolas.Ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, Manikandan.M@microchip.com, 
	arnd@arndb.de, geert+renesas@glider.be, Jason@zx2c4.com, mpe@ellerman.id.au, 
	gerg@linux-m68k.org, rdunlap@infradead.org, vbabka@suse.cz, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, Hari.PrasathGE@microchip.com
Subject: Re: [PATCH v6 2/4] drm/bridge: add lvds controller support for sam9x7
Message-ID: <ymw3bsbpqdfhwnidkvkenbv73fxdk3okuiqsmltknpnlzuwges@dqevpe6okpk4>
References: <20240417024137.144727-1-dharma.b@microchip.com>
 <20240417024137.144727-3-dharma.b@microchip.com>
 <xbefyxiyiwckjsi5wyqaf5thqgpyyizy7sjojed4yc7bvm46l3@omffdudkxyhl>
 <f79861d1-2216-41de-8093-621cb07ba06a@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f79861d1-2216-41de-8093-621cb07ba06a@microchip.com>

On Thu, Apr 18, 2024 at 03:54:53AM +0000, Dharma.B@microchip.com wrote:
> Hi Dmitry,
> 
> On 17/04/24 12:05 pm, Dmitry Baryshkov wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Wed, Apr 17, 2024 at 08:11:35AM +0530, Dharma Balasubiramani wrote:
> >> Add a new LVDS controller driver for sam9x7 which does the following:
> >> - Prepares and enables the LVDS Peripheral clock
> >> - Defines its connector type as DRM_MODE_CONNECTOR_LVDS and adds itself
> >> to the global bridge list.
> >> - Identifies its output endpoint as panel and adds it to the encoder
> >> display pipeline
> >> - Enables the LVDS serializer
> >>
> >> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> >> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> >> ---
> >> Changelog
> >> v5 -> v6
> >> - No Changes.
> >> v4 -> v5
> >> - Drop the unused variable 'format'.
> >> - Use DRM wrapper for dev_err() to maintain uniformity.
> >> - return -ENODEV instead of -EINVAL to maintain consistency with other DRM
> >>    bridge drivers.
> >> v3 -> v4
> >> - No changes.
> >> v2 ->v3
> >> - Correct Typo error "serializer".
> >> - Consolidate get() and prepare() functions and use devm_clk_get_prepared().
> >> - Remove unused variable 'ret' in probe().
> >> - Use devm_pm_runtime_enable() and drop the mchp_lvds_remove().
> >> v1 -> v2
> >> - Drop 'res' variable and combine two lines into one.
> >> - Handle deferred probe properly, use dev_err_probe().
> >> - Don't print anything on deferred probe. Dropped print.
> >> - Remove the MODULE_ALIAS and add MODULE_DEVICE_TABLE().
> >> - symbol 'mchp_lvds_driver' was not declared. It should be static.
> >> ---
> >>   drivers/gpu/drm/bridge/Kconfig          |   7 +
> >>   drivers/gpu/drm/bridge/Makefile         |   1 +
> >>   drivers/gpu/drm/bridge/microchip-lvds.c | 228 ++++++++++++++++++++++++
> >>   3 files changed, 236 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/bridge/microchip-lvds.c
> >>
> >> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> >> index efd996f6c138..889098e2d65f 100644
> >> --- a/drivers/gpu/drm/bridge/Kconfig
> >> +++ b/drivers/gpu/drm/bridge/Kconfig

[skipped]

> >> +     if (ret < 0) {
> >> +             DRM_DEV_ERROR(lvds->dev, "failed to enable lvds pclk %d\n", ret);
> >> +             return;
> >> +     }
> >> +
> >> +     ret = pm_runtime_get_sync(lvds->dev);
> >> +     if (ret < 0) {
> >> +             DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
> >> +             clk_disable(lvds->pclk);
> > 
> > This can result in unbalanced clk_disable(), if pm_runtime_get_sync()
> > fails. This function calls clk_disable(), but the framework has no way
> > to know that .enable() was not successful and calls .disable(), which
> > also calls clk_disable( >
> > Please consider turning pclk into pm_clk so that its state is managed
> > automatically (or at least moving clk_enable/disable into pm_ops).
> 
> This process appears rather intricate. May I suggest omitting the 
> 'clk_disable' operation here?

Yes

> 
> > 
> >> +             return;
> >> +     }
> >> +
> >> +     lvds_serialiser_on(lvds);
> >> +}
> >> +
> >> +static void mchp_lvds_disable(struct drm_bridge *bridge)
> >> +{
> >> +     struct mchp_lvds *lvds = bridge_to_lvds(bridge);
> >> +
> >> +     pm_runtime_put(lvds->dev);
> >> +     clk_disable(lvds->pclk);
> >> +}
> >> +
> >> +static const struct drm_bridge_funcs mchp_lvds_bridge_funcs = {
> >> +     .attach = mchp_lvds_attach,
> >> +     .enable = mchp_lvds_enable,
> >> +     .disable = mchp_lvds_disable,
> >> +};
> >> +
> >> +static int mchp_lvds_probe(struct platform_device *pdev)
> >> +{
> >> +     struct device *dev = &pdev->dev;
> >> +     struct mchp_lvds *lvds;
> >> +     struct device_node *port;
> >> +
> >> +     if (!dev->of_node)
> >> +             return -ENODEV;
> >> +
> >> +     lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> >> +     if (!lvds)
> >> +             return -ENOMEM;
> >> +
> >> +     lvds->dev = dev;
> >> +
> >> +     lvds->regs = devm_ioremap_resource(lvds->dev,
> >> +                     platform_get_resource(pdev, IORESOURCE_MEM, 0));
> >> +     if (IS_ERR(lvds->regs))
> >> +             return PTR_ERR(lvds->regs);
> >> +
> >> +     lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk");
> > 
> > Why do you need _prepared version?
> 
> I will change this to just devm_clk_get().
> 
> > 
> >> +     if (IS_ERR(lvds->pclk))
> >> +             return dev_err_probe(lvds->dev, PTR_ERR(lvds->pclk),
> >> +                             "could not get pclk_lvds prepared\n");
> >> +
> >> +     port = of_graph_get_remote_node(dev->of_node, 1, 0);
> >> +     if (!port) {
> >> +             DRM_DEV_ERROR(dev,
> >> +                           "can't find port point, please init lvds panel port!\n");
> >> +             return -ENODEV;
> >> +     }
> >> +
> >> +     lvds->panel = of_drm_find_panel(port);
> >> +     of_node_put(port);
> >> +
> >> +     if (IS_ERR(lvds->panel))
> >> +             return -EPROBE_DEFER;
> >> +
> >> +     lvds->panel_bridge = devm_drm_panel_bridge_add(dev, lvds->panel);
> > 
> > Please use instead:
> > 
> > devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> 
> Sure, Noted. Thanks.
> > 
> >> +
> >> +     if (IS_ERR(lvds->panel_bridge))
> >> +             return PTR_ERR(lvds->panel_bridge);
> >> +
> >> +     lvds->bridge.of_node = dev->of_node;
> >> +     lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> >> +     lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
> >> +
> >> +     dev_set_drvdata(dev, lvds);
> >> +     devm_pm_runtime_enable(dev);
> > 
> > Error check is missing.
> 
> Sure, I will add this
> 
>          ret = devm_pm_runtime_enable(dev);
>          if (ret < 0) {
>                  DRM_DEV_ERROR(lvds->dev, "failed to enable pm runtime: 

DRM_DEV_ERROR is deprecated, plese use suitable replacement.

> %d\n", ret);
>                  return ret;
>          }
> 
> 

-- 
With best wishes
Dmitry
