Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152EA2571D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 10:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479534; cv=none; b=cvDOK5JMEne6dVNVs4ttHQ7ZvTbyDNSROeDfBK6CGNLB9KGGL+iUw7xxujb7T5T1/pDMnG9BbGjxwadxZXC5VvdOGMhwdGnkoQ0xyGnHFFPsW+WZTYtjATQ4t6Ilc45qxYyfVxuUHRoVRo9RAeo5EIAHg6sBPiXcdIHVnjthd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479534; c=relaxed/simple;
	bh=oHntRc6ketGp/QhYf4I3EanOGrcu1tIhsBHqD3kFya4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAaG0drRXevN1b2ey79gHrDv14kXA+0zCZgBiACL1dvFp5cKpnzyuHki4pjl/DYnkYYyaCdeuHm9jDJqwnMA3qy1UVqbVnJj6wPiy9Dn6slU0m//XpfjU8MzfU2HUlhqhvK8Zb6R3/i2CtMdUYlvbeN5ErsUMqHfohvp6zPdd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OxktL3SI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OxktL3SI"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-548878c6a5aso334949e87.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 02:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740479531; x=1741084331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWPoegFSJ33fQC9+fuZ6e3TrU3m9G9N5dofmSUatD4I=;
        b=OxktL3SI58UOCss/kurTHJZrbFoa2AFfki7gmj04Ebj0IfST/Vi1B1qDvL/nSm+dwW
         soGbivLjrru4bjhFzCG3EOhJQ2kllXSs5tcYgNY0rq2U2jPRs0SS4McUijLd+7dx9fZ+
         poxOl/R7Ko+Ds7xs1KomLTgwQ/OqPHv+V/n6xzqKZTqBpmuud2/K3jS+/u8by9+1fyvK
         GNcpvlDFQhrNwU2CempHSKuDM6c0ULxSPPOTILwc1INSiQJNLs5fFCx5XohlLIwr8j1E
         ln/OMNWisDMJuhpT/ZBuZR/P6OAZRrwioabavHQ1X2hpom60okw+yd4eXlGI4sLBiE78
         sMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479531; x=1741084331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWPoegFSJ33fQC9+fuZ6e3TrU3m9G9N5dofmSUatD4I=;
        b=oigpFluyCLorup1gxVom+WOIfahTZGsVwrSq0vNZCTa80wWY5X/Sgl6Csh6jJQ7Dby
         VMrDe03H4+NQje9IPYlWtq9pMY6ul8988lcS4JjAWs9afSO5AVTrgTwDTg4b+/FOOE0W
         bsEj8IyKLjuuYTc1A2+e4XKkTxDMb9Y4Ly+OJVL2JLdhpuTwMRfEAPP+2QQB5dU9nkY8
         ZI2tX6TRvAw+7MLsYGlJKJOWNCk7hiFvEnlFiav6mXdP9oYVtn5PvB/ZX28CdEnlsv4G
         dxyS4dtwiONSEJE3z6jc5Uhb5pDJjKbKfscO5FTGMH31Ren+zUwbDbubBzjeL7IPGPyh
         g9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXnq/qtt7iusIFGJoqs/6VU6rM0jBD8ePmKedlhkuLF21p4vd62+Zw/pcOw9PDcMF86ud7bBn4oBtS/KcB2@lists.linux.dev
X-Gm-Message-State: AOJu0YxXrNA7irAWk9oy5xTc+O8amgg8uw7cfTPSFoBFAsxgaQhlu6El
	EHCxgwQgwkYZXTDRtX0Zk3Htf3AcZkRnQLVlmdzitiVEmw6VES85/Xvx47RzoBan8cD9iUyHNbA
	aPr4Ke4XQ3vBLbpOQ0xCUnFPqYQ+Zx8Hd/MvR8g==
X-Gm-Gg: ASbGncu8CzfwhbU8p5u3HDC+7eMUgLpIteioBWmTAZbrOdNzZr5sy/pfU7vcIetbEFY
	pu+PNbWPb39FVnPQfFHNbyf3gc7g0RuSwIoquZtLu5N0ua6iN+i1h37HF02V+fiVCbkTLzTH7I0
	liPdIEp8YYnkeDVWUxbfwPgSQ7cAfSlsHYck69Zyg=
X-Google-Smtp-Source: AGHT+IEMUr740ASAeQc83XrlkMXKSaxnJTQcJsipONR0CQHw253zGhzk9ocoUNCayWxPlmzRVF5OsK+6k3I2c0PAofU=
X-Received: by 2002:a05:6512:138d:b0:546:3052:4202 with SMTP id
 2adb3069b0e04-54839147f79mr7039635e87.27.1740479531024; Tue, 25 Feb 2025
 02:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502250657.z4e1UeVZ-lkp@intel.com> <0e8571a2-37b2-42cc-a3b4-8dbb947fb1a1@cherry.de>
 <6725313.tM3a2QDmDi@diego>
In-Reply-To: <6725313.tM3a2QDmDi@diego>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Feb 2025 11:32:00 +0100
X-Gm-Features: AWEUYZm7koLC9BfxBWXCU_uWHOGHhU2m5uFfIa-ljpTWKMNUivKsx79STZwEdFo
Message-ID: <CAMRc=Me11Sf-UKW3Fj-cwpKgbEvg--yF4fUZ8ioH+XLixt_APw@mail.gmail.com>
Subject: Re: [linux-next:master 5345/5954] arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb:
 gpio@27: 'reset-gpios' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$',
 'pinctrl-[0-9]+'
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: kernel test robot <lkp@intel.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:29=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.d=
e> wrote:
>
> Hey,
>
> Am Dienstag, 25. Februar 2025, 11:08:23 MEZ schrieb Quentin Schulz:
> > Hi Heiko,
> >
> > On 2/24/25 11:09 PM, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> > > head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
> > > commit: 9f889cf1783680835d3ed401279075690b7f078a [5345/5954] arm64: d=
ts: rockchip: add overlay for PX30 Ringneck Haikou Video Demo adapter
> > > config: arm64-randconfig-051-20250224 (https://download.01.org/0day-c=
i/archive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/config)
> > > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project =
7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > > dtschema version: 2025.3.dev3+gabf9328
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202502250657.z4e1UeVZ=
-lkp@intel.com/
> > >
> > > dtcheck warnings: (new ones prefixed by >>)
> > >>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo=
.dtb: gpio@27: 'reset-gpios' does not match any of the regexes: '^(.+-hog(-=
[0-9]+)?)$', 'pinctrl-[0-9]+'
> > >             from schema $id: http://devicetree.org/schemas/gpio/nxp,p=
cf8575.yaml#
> > >>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo=
.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> > >             from schema $id: http://devicetree.org/schemas/display/pa=
nel/leadtek,ltk050h3146w.yaml#
> > >
> >
> > I think we may have merged the Haikou Video Demo overlays too quickly.
> > The Haikou Video Demo overlays depend on support for reset-gpios in the
> > I2C GPIO expander driver, which was added in a separate series, c.f.
> > https://lore.kernel.org/linux-gpio/20250224-pca976x-reset-driver-v3-0-5=
8370ef405be@cherry.de/T/#m34648451131d34ba85538e08da0cacfc366d91af
> >
> > I guess we should revert the patches and reapply them once the gpio
> > patches get merged? Do I need to resend the patches in a new series or
> > are you going to keep track of patches to re-revert? The Haikou LVDS
> > overlay should be fine to keep as it doesn't have this GPIO expander.
>
> With the patch-series for the PCA967x in question [0] not getting any mor=
e
> change requests, I suppose Linus or Bartosz might even apply it in the ne=
ar
> future, so I'll give it some days and if that doesn't come true, I'll dro=
p
> the board patches here.
>
> Heiko
>
>
> [0] https://lore.kernel.org/linux-gpio/20250224-pca976x-reset-driver-v3-0=
-58370ef405be@cherry.de/T/#m34648451131d34ba85538e08da0cacfc366d91af
>
>

v3 was submitted yesterday. I will certainly queue it for v6.15, don't worr=
y.

Bart
