Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB391B647
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722910075; cv=none; b=sBf3ZTxywP6qmn+ABsPRme7pVW9zSm+GZqHUyurlAG3MIP1rL3MJpVEriWn5J+06jx5Yg7nTmcRv6CqSh5zQSdxFZly9qK9MjouXttj5YCAScT1d/mGvZn85YltuCXnvhac2FpcT1xMVVZP2WPp737iEEvpmTmxQvPNwsAOs0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722910075; c=relaxed/simple;
	bh=jt59FQqSI9OmpBDvj+W6jJgmftz6aU0OfR2v5brJ7QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaeUTE/+sWcB7pqGD4IZz0N6L3rgtYq8Dwz6Q/I54R/pmmqAdbBU6/8Yw/wffVM/lQpeBGKcE0gY+TyGy/rhvJMHIMYE6nJUDhw6j/Pzi7AdjXniel40GgBkT3awOzOOQKVeW8zIjyhphVZyVfhQ4r/PTQb75D9O2rUcxnJJIHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBnOgUqT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBnOgUqT"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5bb8e62570fso320075a12.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Aug 2024 19:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722910072; x=1723514872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH0hbgsnu6T52bt7D2n0S9Ogopg+qvghTIRm+AHbkMs=;
        b=eBnOgUqTLnQifXna2pe8j4EY4HjxD6mi/MDKSRhFWiFmPv4/JJs27kkwZDIAlKEGcS
         KxwnQT3egvt/Imxc1fRdrKrlBUTZMu+JLbqfgDW6hwHor9vYfgRzdlWeJxoGXojRypjs
         Rkhrp1K0iAOilihop4T7XMkfNLOPEbpMkEuwZlvoA2LwYn+kza0ZHoQTHYN0ndME+RuA
         7GqglOcZvPWi2VfEMQK+GKN0N9Aujqf69nn9Q1kNom/t3JMiXvOIfpdW07/KbefKHbNs
         iOexmoHZV0+5uG9WwQDj2SItUfRCh5sHIPqDcSjfSVzrca58lSieHlnnbrKCb7q/Fa7j
         xh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722910072; x=1723514872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zH0hbgsnu6T52bt7D2n0S9Ogopg+qvghTIRm+AHbkMs=;
        b=GLTVmgbgPWL1NobKckb9Op7+85gyx+2+deVmHfabqVnxrjECO5t/lgxr2erp17fCcE
         KHvpxfoxoROZsBvJG2UJSXrYEJRaQKC5objcEjJkU72U6ax9DNJ4ZXVIftqdxCV7fnA4
         Y9iU0iIRTEXF7hAB9Va7ckOHvOztJTu5chb4GtiEvL4E/vYMAfWnEnirxhau0Q6bOzhE
         fyTJgjTER7kWqjV5gIlTSz5FMEca8Zb5kAe/o27LV2ktedbGiq5cipI4B+uTJLEIVIqe
         /YAIl51QG9hCLflyGQRYWHEes5Bus9H8laI7hm1nQtvaEs0su+4+rOC+X5WV4IGUVqG0
         YTOA==
X-Forwarded-Encrypted: i=1; AJvYcCXTWvaTyzwYB4DdMyGBxipnf8n6IeDbEmeIgQwZg5gLuFQzBMmsrjscztTC4sR7mf7yA2m3LQUFklA21PWzNG78iHTm+y7/5e5fRo1KUw==
X-Gm-Message-State: AOJu0YywSGLdz3uVyVTgRSOe5p0hEVFU692Pj1Y9lphjQAZW14SpsS2u
	QZNMs6cCH0lCEjuIFuWeF8yG+WsWSXQOCkUYnWfnJgZgqarWHaGdBs8Ja6mEd+W7jCGcmytHTtu
	AF5SQfL7pCY+F+fBA17EeVvzcE9U=
X-Google-Smtp-Source: AGHT+IH8KdNlkin5gZxqjz6qSZjvvOQo2DyRfKySRIFg4fZEIJZgYjqB5SipRayRcG+D3+kKWg+MU4QoRN3B4OC72vs=
X-Received: by 2002:aa7:cf09:0:b0:5a2:5bd2:ca50 with SMTP id
 4fb4d7f45d1cf-5b7f5413badmr9781655a12.25.1722910071747; Mon, 05 Aug 2024
 19:07:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240802-loongson1-dma-v11-2-85392357d4e0@gmail.com>
 <202408051242.8kGK28W7-lkp@intel.com> <ZrEAaB_I1S2vM2EE@matsya>
In-Reply-To: <ZrEAaB_I1S2vM2EE@matsya>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 6 Aug 2024 10:07:15 +0800
Message-ID: <CAJhJPsX16-=HfDMWuYAPSuXL246Sn_L=j1=i+zpUPNK1mED8zA@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] dmaengine: Loongson1: Add Loongson-1 APB DMA driver
To: Vinod Koul <vkoul@kernel.org>
Cc: kernel test robot <lkp@intel.com>, 
	Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-mips@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 12:40=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 05-08-24, 12:58, kernel test robot wrote:
> > Hi Keguang,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on 048d8cb65cde9fe7534eb4440bcfddcf406bb49c]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Keguang-Zhang-vi=
a-B4-Relay/dt-bindings-dma-Add-Loongson-1-APB-DMA/20240803-111220
> > base:   048d8cb65cde9fe7534eb4440bcfddcf406bb49c
> > patch link:    https://lore.kernel.org/r/20240802-loongson1-dma-v11-2-8=
5392357d4e0%40gmail.com
> > patch subject: [PATCH v11 2/2] dmaengine: Loongson1: Add Loongson-1 APB=
 DMA driver
> > config: sparc64-randconfig-r063-20240804 (https://download.01.org/0day-=
ci/archive/20240805/202408051242.8kGK28W7-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240805/202408051242.8kGK28W7-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408051242.8kGK28W7-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/dma/loongson1-apb-dma.c: In function 'ls1x_dma_chan_probe':
> > >> drivers/dma/loongson1-apb-dma.c:520:34: warning: '%u' directive writ=
ing between 1 and 10 bytes into a region of size 2 [-Wformat-overflow=3D]
> >      520 |         sprintf(pdev_irqname, "ch%u", chan_id);
> >          |                                  ^~
> >    drivers/dma/loongson1-apb-dma.c:520:31: note: directive argument in =
the range [0, 2147483646]
> >      520 |         sprintf(pdev_irqname, "ch%u", chan_id);
> >          |                               ^~~~~~
> >    drivers/dma/loongson1-apb-dma.c:520:9: note: 'sprintf' output betwee=
n 4 and 13 bytes into a destination of size 4
> >      520 |         sprintf(pdev_irqname, "ch%u", chan_id);
> >          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Pls fix these warnings!
>
Sorry for these warnings.
Will fix them ASAP.
Thanks!
> --
> ~Vinod



--=20
Best regards,

Keguang Zhang
