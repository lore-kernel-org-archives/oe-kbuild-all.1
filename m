Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067231DE3A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269004; cv=none; b=h3XdLu7hBCgVqj1w31oATeJoUsvY1lUKEnUUr57H0FV549qFJSYYK547TpK+qAv+5WA6oNXL8cBJ3LblC7ZXY0wf11x/Gcwh6qx2Qmr9XJTRQNThN3rOL+7O6v+1p/sQSCZOANY+TNpUF0KdczblLjNlmGxdYoC0RNRRSWbC/CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269004; c=relaxed/simple;
	bh=PvEGdxriQ64q0nn9Stq2sPLaEpishpGozwR3OcVmBwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDN1eZpsDyM2OtUBDzBQXve4/76efayP/W0uCd7KDC5iFkAz3CuDTEczmt4VFhCdsVG1nVyeLV6Q/rOxPFQzkcJbuPNVweKLgY8hasPaHuc69/oYuDlVqzqSAGW1jIFRQDgnFMeZFTOiB+pqmLOdhQTye4gMGFlp9xtfEMUgWBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JWHCb1rp; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JWHCb1rp"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2967af48248so1084312fac.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 01:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732269002; x=1732873802; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVK3siImP8xz7KIb6KpsrNuBusfSPJqPiJxMHJ1HiJQ=;
        b=JWHCb1rpw/RA9fMVHypBJtIAB5XEenxNYkAc/dRQ4NXebZvyFKTRsKM97oaSGdkm5A
         wIve/DxBaJFZivCm5GiSN4R06L3XLMNCfCzleeGYM8sKLFXJxXKy9D61x/brbTjDbgsr
         FZQ2JbKL32kmCwEbAUGJJCVWS+nyIKIgbdM48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732269002; x=1732873802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVK3siImP8xz7KIb6KpsrNuBusfSPJqPiJxMHJ1HiJQ=;
        b=fcIq5LLwl8P137PGhqxXNRpgMJGiOihzaUBm854R8bowTdrNcm0Ch1+iuegAZzO1Oa
         A8cjVsNk97vEp2FS4opf/CvrBYvTSL96q6YqaRfjuein1AtTq59LDka2KgpPpP+HMY7/
         8TV62+w9ZLv19rXYFtP3uABhHxu5I0zi9WXk+WSBcwAigBRmsOP2KeunuyEJ0uIqf6Mp
         uiJaSP8yTkl+8UDajSFhTwWFLuzzGwfuH+dloHgh0rBmHrG5DiMZSnqTm32LyVvusPMA
         I4OYXDLsjHkhZJrY6/UeZ3m18cp4350PtsN7A86wCDuphQLZmiO4qAO6thX0uiI1+tZ9
         rTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvwjDtjoJ6IbAWQXMdw/ACPkq0fLcz2fXBZ6WQ+ReSzN1H+i16sRY0MX8dY5e71z+H5YMIiQfquEz6lUe3@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1HsHXl4vMNqrskwvV45JTW8WZHYya8HVNWBHBr7XK71uR/bCL
	MHpIetDWe0HjuKQdrqdh08XlFdesmf88DY2uKgeOcRLDkLv/Q+bvVfpu4VBI8l5W5/DCYFkVyMo
	=
X-Gm-Gg: ASbGncuCgq0P/GCaCBHg9lkScjzamepGsWpyBUeiVxTRRKSIEl33iutVc6dvPgWWyX1
	C61GRA3pyPuqf0VWxg5n4D2PUZoIHOQ5NCpiCEGvTiBLQtpcjwcjZ4FhGtUu3V3QC55qDpyilcj
	aEMrszlhZaQwRk2kr+LGKYl8gU5xLVt4qdfWSb9uwrPli6jRj8CvpXOAzJza3+s878N13DEEc/K
	Phi24pQImDA9/Zd9p2d6KWf34yuMKpQiH4JMnwup41k11UTiZ6M51io0TYj/d9Uqq/mOlDnDn7V
	UWctfC0IRifef5Om
X-Google-Smtp-Source: AGHT+IF7QVQOO3FiWNrkzDJB/hjYgeJydQI4kBSTyfpsund3NZQmYycCZXNNC79jPj/CfxMf2JZChw==
X-Received: by 2002:a05:6870:d90c:b0:277:d8a7:f63b with SMTP id 586e51a60fabf-29720e60fb8mr2131260fac.39.1732269001923;
        Fri, 22 Nov 2024 01:50:01 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d56e5ecsm476491fac.7.2024.11.22.01.49.59
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 01:50:00 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e6005781c0so1152121b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 01:49:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwJSzb+lvUuPvEU2fsRcOaqYNV+mDY8WKPLBSeg0MBBQLclq4hWdE6m7UdPtkhw29te7HwygsAuUHHl369@lists.linux.dev
X-Received: by 2002:a05:6808:1590:b0:3e7:6468:1fd5 with SMTP id
 5614622812f47-3e915a5886cmr2412276b6e.34.1732268998797; Fri, 22 Nov 2024
 01:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain>
 <Z0A6Rc-HUPcsIw8z@kekkonen.localdomain> <CANiDSCuQFmrPTLTFs0GPJ209EEKN=MCg8cK3xcsxp8c2eEMhVg@mail.gmail.com>
 <Z0A8njOPBMtkb5wJ@valkosipuli.retiisi.eu>
In-Reply-To: <Z0A8njOPBMtkb5wJ@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 10:49:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCtRife4KNYmCFX56hroGJCHTQvSWdwwMRHGC7mpVbKCYQ@mail.gmail.com>
Message-ID: <CANiDSCtRife4KNYmCFX56hroGJCHTQvSWdwwMRHGC7mpVbKCYQ@mail.gmail.com>
Subject: Re: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Fri, 22 Nov 2024 at 09:11, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Ricardo,
>
> On Fri, Nov 22, 2024 at 09:06:40AM +0100, Ricardo Ribalda wrote:
> > Hi
> >
> > On Fri, 22 Nov 2024 at 09:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dan,
> > >
> > > On Fri, Nov 22, 2024 at 10:45:53AM +0300, Dan Carpenter wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > head:   28eb75e178d389d325f1666e422bc13bbbb9804c
> > > > commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
> > > > config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
> > > > compiler: alpha-linux-gcc (GCC) 14.2.0
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > | Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > > >
> > > > smatch warnings:
> > > > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> > > >
> > > > vim +/i +752 drivers/media/pci/intel/ipu-bridge.c
> > > >
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747     struct acpi_device *sensor_adev, *adev;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748     struct device *csi_dev;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749     bool ready = true;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750     unsigned int i;
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752     for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754             const struct ipu_sensor_config *cfg =
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755                     &ipu_supported_sensors[i];
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757             for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759             while (true) {
> > > >                                                                                                         ^^^^^^^^^^^^^^
> > > >
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760                     sensor_adev = NULL;
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
> > > > 8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762                     if (!ACPI_PTR(sensor_adev->status.enabled))
> > > > c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763                             continue;
> > > >
> > > >
> > > > These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
> > > > loop.  We're stuck forever.
> > >
> > > The non-ACPI case is there just for the looks... I think what should be
> > > done is to make the entire loop conditional to CONFIG_ACPI. I can post a
> > > patch.
> >
> > I saw your mail after I sent my patch :)
> > https://patchwork.linuxtv.org/project/linux-media/patch/20241122-fix-ipu-v1-1-246e254cb77c@chromium.org/
> >
> > If we make the entire loop conditional then we would not compile test the
> > loop.
>
> I'm fine with the patch as such but don't you think we might get just a
> different warning from this one? :-) I'm fine trying this though.

I have send a new series to fix it for real. Until the acpi guys
review the code we can land the first patch of the series. I have
tested it with smatch and sparse and it seems to be fine.

>
> --
> Sakari Ailus



-- 
Ricardo Ribalda
