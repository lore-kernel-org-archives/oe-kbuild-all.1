Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F4199E9A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368278; cv=none; b=ek3U1seEk6oXxs+ho3rzU5K3xAE9cq54W/Gl6kaTeGlK0eOTw7w+I+ykOFIkYsTDeuGZXbNgo3e8RsWIWSRaTn7YhoRZJiybhWR7Ex6pTiNArhLIETQ9aJywsY7IMpssXH3fTberqJlJylr3P4Z9Bi2N/hzOUIDvAGSbsiBqQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368278; c=relaxed/simple;
	bh=yBYGHyAAXbHIV4ubx5/Tlxv3MUGD7y8Iw5p+OGIynSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/UjG4app3UQGBwj0wzFCEViXnxvDQCLePZv9x/Ard4UmmON41niqLI00sbo9tysuRVP/6exBBFNNb3f0TX7y7kRL9r9mDu8srcWAyDA86uma9UbfOFoN5Cy8UL5PENr913EyWvFJsc4WH1n0D3giS6fRjLu3h2a85y8rcTC7O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iuVBAiM5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iuVBAiM5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso26822835e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 02:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737368273; x=1737973073; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yf0uhM0UA3SnHKS9Js8nec/sH05C5InnAKBuraTy3/I=;
        b=iuVBAiM531Xi3LBw8OHwCXOBmOgVIR/pC+kI4bp/mJtu0rEgj4eYoaq9If89MWcg23
         I7IHwdkKCWaaEbwiLgFbbN2kz2/t8Soz/2tfrTLfakqOz8oeXZUrK0Uq6IzvXc7dbAK7
         QR9hj9Z5S9w86MOAeu/bgwTmQ3tfKr30EhPvuBSt03obsOAa8lxtRz3NWw/k4Whseakx
         JPtwVq+mcT9RfMlse1plKynKaWAO0IcxYOQPE/dUVgzCLE7DdS5ve/Fjdt6RX2M6ZJ+j
         Ea4WFS6nFrdGSnv6e0c5cOW/Icl9/kZwGJMqYnYUmh3LJMXRYJWVy8h/4yPVFPxCBd/X
         a/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737368273; x=1737973073;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf0uhM0UA3SnHKS9Js8nec/sH05C5InnAKBuraTy3/I=;
        b=DbU/TtbQd0LG93WtILJFUsMNmkUJgaVZInOs/MHDCZ+FtIM/IgrdDGaV33BVkb4Dk5
         gIu7fKVYT6byUiQmwo+5mp33RWY2tbXBhDGIJPiDzD32ejLaRsA01JnfF3WgFjSCTHYl
         EyItcYw5lW4HXJhWW2Oz3r2R/LGU+Y7oTSck/H9nsMCGGM+HIwEPJOV2g7EFHrjJmypR
         xQhhpSq/D/yD+Fh7iifAldLCUDuCjyIjFldChbRQJM4Yq2UbmdqqYPzVASwtIpo95EIX
         s2iO1FEUByRK8pdS1a0aX8Qf7K0yTd0o6zn4AQt7ze64zYC0HOWDrpTyRL2HxqJTWIXn
         Andw==
X-Forwarded-Encrypted: i=1; AJvYcCUNI/AHFmIpENhMU4GRgkY7uh9xHBzkTE4vnyd5xFcuARlPNEqBaedqqlT1SlLFXK0IR8Vf2Faljj1KJTqN@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn+SH42ough3F3Z+fDejmTYVNtHnHkEZcGg7YgrzD6vgc3W4B/
	c5OjRyGDkC1ecoWmOs1j7NIj24zs8gnqm40vLdQw6spLdia21Jt8tk6cnibg0d4GK63wNDFCtoc
	N
X-Gm-Gg: ASbGncszufHosAVv/lZPsQKX0UuczKywzBIqzgqZ9kmpPixpBs86+zMSMtyfaO4/FsI
	qr0jPx12FDs8NV+StTb1FP1mrCkzWzGsmDJkGbF/pOpXEWVhNeNJlKPa0/ThsWn6pZFRf7DGRoO
	XzbjapKEYs9TSBv4Npynn/1ilfttPyxi0MEqlogoXSigfB2yvEs3pLMgri5iAH4uDy+9G/hPM3r
	aR8j32/WTo4Qp3BQtApNibXWDWHj8eHmM0KazdZ+Xh0izxWGONMkU0KQKsLwZvtSAdBxlXbCk0=
X-Google-Smtp-Source: AGHT+IHsrR439sEHsJbiPwk2UVMID4BcJeh1sR/CnTPnMX9/K5wl36XW4n6vPXAdSJ64ww4ctsoWow==
X-Received: by 2002:a05:600c:8712:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-438918d9008mr112456105e9.9.1737368273517;
        Mon, 20 Jan 2025 02:17:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm9981587f8f.70.2025.01.20.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:17:53 -0800 (PST)
Date: Mon, 20 Jan 2025 13:17:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [wens:mtk-wip 24/48]
 drivers/gpu/drm/bridge/analogix/anx7625.c:2658 anx7625_typec_mux_set()
 error: 'port' dereferencing possible ERR_PTR()
Message-ID: <a56bee01-e1fe-40b2-80d8-2e1434be7897@stanley.mountain>
References: <a7c24973-cebe-44e0-a5f4-9c2497dd3206@stanley.mountain>
 <CAEXTbpfcBtBRDcMcDuaOPQeYJLrd0qkP5P1hOmsgky0BOZkFfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpfcBtBRDcMcDuaOPQeYJLrd0qkP5P1hOmsgky0BOZkFfQ@mail.gmail.com>

On Mon, Jan 20, 2025 at 05:17:41PM +0800, Pin-yen Lin wrote:
> Hi Dan,
> 
> On Mon, Jan 20, 2025 at 1:36 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
> > head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
> > commit: d62036e150e84eff425756d90cf8f060d86beb17 [24/48] drm/bridge: anx7625: Register Type C mode switches
> > config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180409.LUg1bFSN-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202501180409.LUg1bFSN-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/gpu/drm/bridge/analogix/anx7625.c:2658 anx7625_typec_mux_set() error: 'port' dereferencing possible ERR_PTR()
> >
> > vim +/port +2658 drivers/gpu/drm/bridge/analogix/anx7625.c
> >
> > d62036e150e84e Pin-yen Lin 2023-03-31  2654  static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
> > d62036e150e84e Pin-yen Lin 2023-03-31  2655                              struct typec_mux_state *state)
> > d62036e150e84e Pin-yen Lin 2023-03-31  2656  {
> > d62036e150e84e Pin-yen Lin 2023-03-31  2657     struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
> >                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > typec_mux_get_drvdata() this returns ERR_PTR(-EOPNOTSUPP) if CONFIG_TYPEC
> > is disabled.  I assumed that the Kconfig specified that CONFIG_TYPEC had
> > to be enabled unless COMPILE_TEST was enabled but I didn't find that in
> > the KConfig when I looked.
> 
> This is a callback that is only registered through
> `typec_mux_register()`, which also returns ERR_PTR(-EOPNOTSUPP) when
> CONFIG_TYPEC is disabled.
> 
> So, anx7625_typec_mux_set() should never be called when CONFIG_TYPEC
> is disabled.
> >
> > Does the Kconfig have a depend/select/imply on CONFIG_TYPEC that I missed?
> 
> The Kconfig around this is "depends on TYPEC || TYPEC=n", though this
> is not directly related to the warning here.
> 

Ah thanks...

drivers/gpu/drm/bridge/analogix/anx7625.c
  2902          /* Add work function */
  2903          if (platform->pdata.intp_irq)
  2904                  queue_work(platform->workqueue, &platform->work);
  2905  
  2906          ret = anx7625_register_typec_switches(dev, platform);
  2907          if (ret && ret != -ENODEV)
  2908                  dev_warn(dev, "Didn't register Type-C switches, err: %d\n", ret);

If TYPEC is disabled then anx7625_register_typec_switches() will return
-EOPNOTSUPP.  We normally would not print this dev_warn() if the feature
was disabled deliberately.  To be honest, we would normally return NULL
when a feature is disabled deliberately but it's probably too late to fix
that...

  2909  
  2910          if (platform->pdata.audio_en)
  2911                  anx7625_register_audio(dev, platform);

regards,
dan carpenter

