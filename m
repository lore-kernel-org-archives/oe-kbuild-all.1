Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4F20C491
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980217; cv=none; b=InUp3KrfLJE5XCXBiF/GYfQQ3in9sHMfJb6u3ZATcKpuHckoKSmtfYYvwxCziEkWV9iwycXcRG1oX1qPrwMNsboD+ju0DtBsaSJFj53qliW5/bPUT0OV6T/5u4tt4qjY7NumkA2UrAbvCCuaDczJe5mR4Z4EKdzoDKHTGgSEwZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980217; c=relaxed/simple;
	bh=VdTVQBES2KfmfKHee+gt0ILxalnyJBBmO+IcEE8cdfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spEbRzwK4n4SY7iDfiOGz4CjaceJJtREifZBLvwFvX2Id4f4aoWZpeeYmlq+BXoYf9Sx3fFQstLfchioTQt42NGz5zs4C9j35EQpJrU/6bKnJbE1SWBIUTlKuNwNkB7xrEUobdoEF/KRAIhsSjNA90b3axYmH38WvV4ADOJSxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uueT4JHj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uueT4JHj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so7743565e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Nov 2024 03:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730980213; x=1731585013; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp2ljM4CPrxjwxpW+HN5VbP4d/zKwyluHhIWBactpi4=;
        b=uueT4JHjGV7Qd4B7Op07la64X487yEurKifM7yxV3bCSjtPP82/R2ed3RDvcbbQzwJ
         kklGp2XQDmlsH3Dl+KeqWOb3hJBqQGDGm3kSxMgpPLK1xtubjPF5V9NSbAY/93KyauXg
         9FkRi0A7VDKoCrAok36ZtqE/MiENHe/LjG/8aurks2PmZvUEZruPX1iRUhFmcjcHF5T3
         5hw3oq9ZqDF38HJ2evu28SQ/4V3AiOgTJ7EwpZ8Ud9DmvlhccxbtWCimJpZHkFjpUYyG
         sBK0UU3EoysItcn/qIkqWkm56YD00E9NCUKfSGR0VzNjZ4WxktVivfxTVPtwzuTBSR0A
         Uwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730980213; x=1731585013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp2ljM4CPrxjwxpW+HN5VbP4d/zKwyluHhIWBactpi4=;
        b=ijMBf3SZ47DEAurVzFFhWEeb+gfVCoG2QeMiL7Lfs/tvBeyYC/wyGOpmYMBDSKKIBy
         /yIP7pbKvcnDknxBIAsTbPx62AJahj4hET3cAMgvytbEJn8Z2ykAkuwbrWXg4xUBUVvk
         /PxQpPwCQt3nfsHIQ8pweLg97GOLs/ve4HWFfWrzre2KM6iarkLIHPOzy4Vc/mppP7TY
         TTR9Hy/6Q0R3SOgFUsHa673+zp9pcwrGY1OWTZOTop2V75wLPriV8AfiuQPZ0vs+z97p
         MvwSUQK7FEIlgiKV4ev0OWqyuxs5Kn92J09UV50dcNQGd5iUu6wkkFufRijN4QyG4Ten
         1cmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRuKFKuyVn5zU4HM9rhJS5VsBqiYLHH0bYjV6ZyUVU9XtbXa2d8+lCk6lIV6RyYTL4q4CAOPJfqbfA6he4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/QOnUI52Ryt6ruNR1SyejeR591KdggsXJ3cZJVnDkio9u1nWU
	I47Rh3s/YKlsaeAjU27VyvvdAHfH1EuupwuAXX9kcMyA2MePteCYZYijIDbwSx0=
X-Google-Smtp-Source: AGHT+IFTZVAt0eFCluGsZgUPKDPd3SwHhyJY5zBlNjNVF9WhkYx884WrwxojciUI5IyAocEvNzJyfw==
X-Received: by 2002:a05:600c:4f89:b0:431:5aea:969 with SMTP id 5b1f17b1804b1-432b2ffd0efmr9606975e9.8.1730980213390;
        Thu, 07 Nov 2024 03:50:13 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5f82sm21790955e9.42.2024.11.07.03.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:50:13 -0800 (PST)
Date: Thu, 7 Nov 2024 14:50:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Conor Dooley <conor@kernel.org>
Cc: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [conor:gpio-irq-regmap 2/18] drivers/mailbox/mailbox-mpfs.c:255
 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <eff3c192-4861-471b-ae87-b9811930d4e0@suswa.mountain>
References: <2e34c90c-3260-49dc-89b2-2a5fa098cccd@suswa.mountain>
 <20241107-briar-decline-fcf3c81a62d5@spud>
 <20241107-septum-useable-5d5e65ad3f4f@spud>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-septum-useable-5d5e65ad3f4f@spud>

On Thu, Nov 07, 2024 at 11:37:36AM +0000, Conor Dooley wrote:
> On Thu, Nov 07, 2024 at 11:34:19AM +0000, Conor Dooley wrote:
> > On Thu, Nov 07, 2024 at 02:10:14PM +0300, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq-regmap
> > > head:   d1b7c5558fb6dded2dee2cfebe358de0d93f022e
> > > commit: 6692ff5a8ee2df1c83af1c1d1a0dce7bc947d2a2 [2/18] mailbox: mpfs: support new, syscon based, devicetree configuration
> > > config: parisc-randconfig-r072-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071659.wRgcOIQB-lkp@intel.com/config)
> > > compiler: hppa-linux-gcc (GCC) 14.2.0
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > | Closes: https://lore.kernel.org/r/202411071659.wRgcOIQB-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > drivers/mailbox/mailbox-mpfs.c:255 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'
> > > 
> > > vim +/PTR_ERR +255 drivers/mailbox/mailbox-mpfs.c
> > > 
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  243  static inline int mpfs_mbox_syscon_probe(struct mpfs_mbox *mbox, struct platform_device *pdev)
> > > 83d7b1560810e0 Conor Dooley 2021-06-24  244  {
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  245  	mbox->control_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-control-scb");
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  246  	if (IS_ERR(mbox->control_scb))
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  247  		return PTR_ERR(mbox->control_scb);
> > > 83d7b1560810e0 Conor Dooley 2021-06-24  248  
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  249  	mbox->sysreg_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  250  	if (IS_ERR(mbox->sysreg_scb))
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  251  		return PTR_ERR(mbox->sysreg_scb);
> > > 83d7b1560810e0 Conor Dooley 2021-06-24  252  
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  253  	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07  254  	if (IS_ERR(mbox->ctrl_base))
> > > 6692ff5a8ee2df Conor Dooley 2024-08-07 @255  		return PTR_ERR(mbox->mbox_base);
> > > 
> > > s/mbox->mbox_base/mbox->ctrl_base/
> > 
> > Sweet, good spot chief. I'll squash this in before I send a v2.
> 
> Hmm, actually it should be the other way around and on line 254, no?
> The code on line 253 is acting on mbox_base and the IS_ERR() is not.

Indeed.  This is a weird warning because it says ->mbox_base can be
zero when it can't.  It doesn't have the cross function database because
this is the zero day bot.

regards,
dan carpenter

