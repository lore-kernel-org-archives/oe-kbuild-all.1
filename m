Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF276CDD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410261; cv=none; b=PZJYRp809zCFtdNXKam8UM0IkZg9AyjFCnpLxNTeWc6699EowBxqtINBkCN+2XB2rpGLeYua+sEDTymGj+SdDzeDe4zTQuserwzUR/rIk7Y1CwMREno0p18Q6AZO0zw6EKyvdv+mKuxdkj/4B4XJfeVFZ3y5FUtSUiFqeCQYA/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410261; c=relaxed/simple;
	bh=VqCz2igfg2nWsES9iIOGmzpT62E7/xaNIwB8TKcfzcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFK/jhOR8540tZd5UPQSyPZYPwCbZ4PYRsgwF/Gem8H/Gc4cGWi0ggIcNZNw5gOOdXpOotoyBMOPVXOMaksmYbJDacBFpXm+Lm0z6L4HOQB4FTlhjWAhQozHa+zvebBZ/PZx/UCYSgPQi/a2ei4g7f04UEZRIl/vMHFH5u72Xlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkebZ+L9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkebZ+L9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28a6cef709so97415466b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710410258; x=1711015058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EQJP9snJ+QMn1kOIEI1bHrE4YWtBgcqYZRBKU0i0oU=;
        b=OkebZ+L9yOahEjnUwttaNmY7wtMBbgqtPnpSzAREqnHvuVhg4fksQi5sLPtKZaqMeA
         tm6X4oOimql4IMyXt4XhEwZ2zsnwOPBM1d9yxLwgbv/B6p2pFoU9F33i2g0Ra5pQx2PY
         hzTHY7VNK2FexPDUY8cLa7ttAV7GDFNhJt5CRzuwQO/TWFL/KGjV8qDRI0gTJEPOc3Pi
         yHcgz2E+PvxUHkgBFQZ728jydrhAstNvXKSkSXxCGDVrsY94wVYwy8fz4wJqLxZ6d8SH
         ANaRaTw+Fx3SMg8SUiyO2mz19eLz0p4R9fIMSASVhPUEYZ8+gIYihCn4nmHwD4UMlXK/
         5Iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710410258; x=1711015058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EQJP9snJ+QMn1kOIEI1bHrE4YWtBgcqYZRBKU0i0oU=;
        b=v9z7pasPBOHZfId7IULF6Exj9y353PymORAKMV5LnTZpE/7nLO3lJVGrySq4d39Nvc
         XjwP35wBNUFFjK3aqwW7ptnoPRmskqpdia5AWZCpgnuuMCZdVMhnNtZb1HOVSrNQTz2x
         NOesRuOe1d8geL2fbtAK+sV/ZakP7X4T7JUrI0bZKmQuWcW+DEWcKQCwGJ3zH5LVbGYc
         jUwXVaT61ALxM6DVVsOXDoaSbPdXrNiswSWVVi2IoAu9oX5WH9qYyIoWiEO35XOdM+kb
         SCUCwr4Ea+qQ+3GnlaKQ0H52/Yy0HhVCBFMkwbB9wEj25XAm2jea5CGqYgUQieJ7A+jW
         AlLA==
X-Forwarded-Encrypted: i=1; AJvYcCWxZcCmzxgIKiX3Slzb3K4/7j1btRGZ8W0WNHMloR8Znkml8cVETQGYn7JBfSyoC+PjnoOZjp3cdoDU/W9m9nQzTOIbiUwE7UskDB8wig==
X-Gm-Message-State: AOJu0YzxWWz/qOsGZcLSiFHaqmcacJ/sAAq/etwtW2nuhqrr4pVp8FhS
	h+Av7BbQCa8ZTuLcivP8xcL7nwWCaOQnbgb7kVePKRiPNfdO2CmA6BO0k9LyWrZB4pwtjP1SASV
	ee7xcX8RIr7Zg5+ii1rvf6tiiTKw=
X-Google-Smtp-Source: AGHT+IGyab5KBsAesnH1jxLgGY6boYF6TUj24EvyN1esyvAau51ilcVLio7p/CiieVnoKJ3jmExMyWomKfwPWIYn3oI=
X-Received: by 2002:a17:906:ecfc:b0:a46:6557:716f with SMTP id
 qt28-20020a170906ecfc00b00a466557716fmr143159ejb.20.1710410257421; Thu, 14
 Mar 2024 02:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240313070705.91140-3-umang.jain@ideasonboard.com> <202403141436.KEQj1YzE-lkp@intel.com>
In-Reply-To: <202403141436.KEQj1YzE-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Mar 2024 11:57:00 +0200
Message-ID: <CAHp75Vdo4Q-1j7XYB92i5=LNwuB7fpV3jPgE98K1Z_QHP5Zxng@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add imx283 camera sensor driver
To: kernel test robot <lkp@intel.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, willl will <will@willwhang.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, tomi.valkeinen@ideasonboard.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Hans de Goede <hdegoede@redhat.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Mehdi Djait <mehdi.djait@bootlin.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 8:57=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Umang,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on media-tree/master]
> [also build test ERROR on linuxtv-media-stage/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/media-d=
t-bindings-media-Add-bindings-for-IMX283/20240313-151107
> base:   git://linuxtv.org/media_tree.git master
> patch link:    https://lore.kernel.org/r/20240313070705.91140-3-umang.jai=
n%40ideasonboard.com
> patch subject: [PATCH v3 2/2] media: i2c: Add imx283 camera sensor driver
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202403=
14/202403141436.KEQj1YzE-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240314/202403141436.KEQj1YzE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403141436.KEQj1YzE-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):

...

> >> ERROR: modpost: "__udivdi3" [drivers/media/i2c/imx283.ko] undefined!

I believe I have commented on a suspicious line (during v1 or v2
review round). Seems nobody reacted :-)

--=20
With Best Regards,
Andy Shevchenko
