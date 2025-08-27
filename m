Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07D192B84
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299991; cv=none; b=btBC0Tqpp93LhqmgwhQRJDnu4OqncVFubQmA1l4QgNdhHAX6N+8o1smh2DETLhLaT0fi5v2FKabDfDQiAunkPDtHothWtCjQ4SAFzZIBDPx/PgKtlFscKaVfCmnQQ436zqhwOtRd8BisVG5P5seuDEoY4htb3RMdguK+Pr4+brQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299991; c=relaxed/simple;
	bh=J6tlttBlgZ6DdU9dlu0VuCFWzKR1/21U0OOFFKpK/Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVVxFJqNHLaOHIbJX55loLNOdej/VugkonGi2vLpUSZzn3QVGe+IfFsJxlJKnKz5wp1RRDAfFluhQTJIvrBQ4qJqHFYmrPdaSL39RMTg2pGAOArsK4a2v1gxEk4NNaJumqQNNy6zqGkUiPjLEjysZoZGlq+TbCEZygHX/QfqAAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTEXaN6G; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTEXaN6G"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b001f55so36712415e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 06:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299989; x=1756904789; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hK+6X7If3iibz8tYO8lX48Dx7ObpMSFEmkT7sgjJ+No=;
        b=FTEXaN6G5xnV6F7/cnUg8syTsO9Xdvx9iZU1tNtQVrRdS5e+PTzJFrtIidZPxuyBiX
         pL0cuH+EpzbPObInM5Bn2k+yR/mm2W2o9RYqblxpkYuMAJxcUpO/289h9R1l7KgPGil9
         cRsF2m8+ogNa+bEl8iozGnKGsOGE2KW/kQmQvi0FFCn+3Mzg/Eicy7jbOcp/H+RjyBsO
         +fSHdsGQqQVlmMV0bwFd6sM+GbtC2mRai4nFkPIYBQSpj6c3x+CK1A5Xj1xAJ8yrVQbL
         4WlorCYZIsplIXChO0yt/hsrXkKqDW46gdyuxrAkp4D2ZTbslh4XbkAVvM57vfYjdizt
         cW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299989; x=1756904789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK+6X7If3iibz8tYO8lX48Dx7ObpMSFEmkT7sgjJ+No=;
        b=sE/2SihL1ZbpgnGtaBHix91M4vVL7enJQvoluqfziXAkPxeu6LQz2PEMje2jDRbetM
         QRcwZSavjVEf6Jp6QUiMI1faJntAD3H0p8keE8q4KqYAilt09OEdQywLo9GSvEQTjAoV
         88jRoWj9EvigtQUfictZErN9VIpNd478ZGDW8ENlKzUQk1PSryOLcoGUhoYKe89rlu2o
         BMCJifyai0/LUja3YLtuUStbM3b1O+YZ3M21CQsZtWyFQnVNNe/JylcEes/O1YPLC6Qz
         ndipRrk+8WQX1KCxQXC9d6fgL2yvrIjjywdLWUQO/nG/S5drP7i24X86sw8d+aIH0H74
         OxWg==
X-Forwarded-Encrypted: i=1; AJvYcCWclP6ybUxDc25VIHy1YR0S0exePKyasz3IHAzy02bitKsv+rnfm5p1RvoEMuktoU1W6+/3htWlPMDIcy41@lists.linux.dev
X-Gm-Message-State: AOJu0YwPyAn/6n6BXcTyhMMh12zZ4zkWRhVZk1lh1eH7BY7GiRNwKD9w
	Gla+zeHSTnG2BUWVoYgM6xdQX/HbyvEvFVKzsMgfGwn0XNCU+CCG6NHuf/FzdAWaTDQ=
X-Gm-Gg: ASbGncu0UJ3v8Vn5laJh2RXTJcg12fPw6zewEN8Yl1AzGv41x5BMtPs5V0tUlNKHYl0
	O6k6Xd8OhyD/wmeSDvgNnTtH7I/B4fjkRuVEWtLHX5y/gPSwTU8ioA21pxc1NtnDLJRDIqSPfEh
	FnoHvyO1ZesjrWGDElmqaY7MoNXfok/gJ4hMNneS1Zt+JPXUFJxF31LmfIebgxS+PnSF3QTgkZL
	OPMSaJtdOh9ATF5wd+hEXcZWz864X0YvITCV11hgKd8RoFTl0S9lCgJUv9hMefHCDteFyq3AxwJ
	d+rGCOST6CXtQk/6C+CSujtev6CkNj1JKQhodMkdMDu0MfldPcDI+b9nlJL8/jHlvdtxdoG3vE5
	UTICsibVud8qpxy04t94gZcNqkZs=
X-Google-Smtp-Source: AGHT+IEXDXRBapmJnNzs3yvXudhRz+Tvr8DgSaDCekM2NjQJUOq12kV9vyfi7g4u8CZNTYZm5ZKuaA==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr189191765e9.30.1756299988612;
        Wed, 27 Aug 2025 06:06:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711212924sm20651459f8f.33.2025.08.27.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:06:28 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:06:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:cleanup 30/54]
 drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously
 assumed 'imx214->link_freq' could be null (see line 1017)
Message-ID: <aK8C0InZVhV-VnXr@stanley.mountain>
References: <202508270603.MDqIVFss-lkp@intel.com>
 <aK7MAiDuq6tqEW7X@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK7MAiDuq6tqEW7X@kekkonen.localdomain>

On Wed, Aug 27, 2025 at 12:12:34PM +0300, Sakari Ailus wrote:
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1012  
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1013  	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
> > 4f302d004bd0fc André Apitzsch 2023-12-06  1014  						   V4L2_CID_LINK_FREQ,
> > b9b359662952ff André Apitzsch 2025-05-24  1015  						   imx214->bus_cfg.nr_of_link_frequencies - 1,
> > b9b359662952ff André Apitzsch 2025-05-24  1016  						   0, imx214->bus_cfg.link_frequencies);
> > 4f302d004bd0fc André Apitzsch 2023-12-06 @1017  	if (imx214->link_freq)
> >                                                             ^^^^^^^^^^^^^^^^^
> > This assumes ->link_freq can be NULL.
> 
> This seems to be a false positive: the control handler's error is set if
> adding the LINK_FREQ control isn't successful and that is checked for later
> on, before calling imx214_pll_update(). Probably smatch can't figure that
> out?
> 

Yeah.  You're right.  Smatch knows that v4l2_ctrl_new() sets
ctrl_hdlr->error on failure but when it gets returned from
v4l2_ctrl_new_int_menu() then that information is lost.

I should investigate why that is...

Thanks for looking at this.

regards,
dan carpenter

