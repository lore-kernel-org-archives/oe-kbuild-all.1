Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BC84A33
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065767; cv=none; b=NKCFvB76Ob6/deTnfaF4qsN/FrJ22NfdouZAQ/mLZ7QkxtyfJt/bZnmYYW7Zg6I78+eFSFHL9hS8KFBN94xdaL7VjyDXSIjPxwFKgzCLHZ1jI/V4bJQ9m4ti/Ew0irk7JJWq0XmF5UiB10cRBumyjo/eKJf51DcwwSRBLm6LYjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065767; c=relaxed/simple;
	bh=boaYqs6W2Ch9MV7MIDV7tFHWVXlXvSTuE+SZQidgsAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtro8roM/CAnm7SHlRvGlmsixPhkT4MuFkpXGFpXYXXC7hE8Ft32r5LHWs3/tWFOcUoL/iPw/ktmn76pm1GHX3yRGuwiUoEF1Lg7YkkVUtI794WSh9Q9LfxXBaHZJtc1e4f5Yz/Dv1aAy4Oq4HEydg2NtYhqWL+wLu2T46D+3sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k4gAKZKC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k4gAKZKC"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b544e7b4so2798573e87.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750065764; x=1750670564; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
        b=k4gAKZKC4Wn22xDaCx2AfMj+st3xb+tPdK9K2Ki40VZsXmuhRn5yh8urejP+or6UvA
         gaZxLM7aA5WAdRA6clAGuaCuWm7xaLr/5Wl9iG+5Wb/S1w0ehwEP5oOVGfsgj5XV+3lA
         AU6bFYM9So0rd6Z6kmRfj6fHdd8WMfdoDIKcE9EbzRJ0VD6BHJ7NqwbP1cAFkQ1ObeXL
         Gb4cpYcWaSN7QZ/1NYIJqsi+QD+xPM+rIk2eeE2q9iLn85MtXsdgjfvAtU3DcH9a3mq0
         R6p1hcCakzLKil/8cPmCpalkNy1jUxKGnQLngbXKkYfiUJJeq5IWX4qKF8qKmEDsjtcT
         tLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750065764; x=1750670564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4clW0hfNM59uFuEpnawSRjVBJDyxSvonnhwsOilymQ=;
        b=PffN9OYzlL9LJYgoNv92AvF5F2j7x5TlJzmTuzqAoFXDUIO7WqMX32CqnEDhyRE+NM
         /lkGDZMC/P0tNVZRuJqWzHDs3E+jR6WfFp5CMHkMJm3D27u+Kx5jzms9xNtU+JiF6H+S
         lSLCDfmNKAO3Y94ZDfg2uWuFCPpI6s91YUDLk66veewey2bF2kPn2pPv3vgsecDo9xlP
         1wDcHEQOCdIaKejp2TCcnV6ATQ33iYmw6UtWBO5MuSHHEAq5Qa0zSAvuaW5F4X0Q+cwr
         j/V4iw9whx4PatEQ/F+sWi2DRLjFaUU0sy7AgtNYeI9fnP50PpzkdaVaeI/XMk1G2mOm
         zt7A==
X-Forwarded-Encrypted: i=1; AJvYcCVCz+RT/wbKM+ikmMGyy33fwWip2LtsR0YbPBut+vylaBSm56as0xNCmavvY4iPZmQEa+D3i595RZokLgKM@lists.linux.dev
X-Gm-Message-State: AOJu0Yybq4BnoEuNtfkqHZviNRndfoEWVXULsoLM5PDoblppEtUmo/Ki
	N+/iRubPg2o4hKnIefEsb7GIOHRtcwVXTwtxNZZ/9pc/ZO1F0zwpfjbGC1mP/zHSmprpKusFjtJ
	KRRTz+2xXRBYy6ArhOmc9cof+mzbDidc5pdGIJaDIUQ==
X-Gm-Gg: ASbGncumxwr+f+qkExwBwIMR3wN3gWj8nJujrXaLHjEI031Agnkjwyf0vfqOgAbsws2
	PgIPI1LSkWjX48lC/GkDAYUKxUJ65I10e22tnHfhraYU4XXMffzLCy5Zyo2eY4DItVfK7bjClf6
	o4eRxm7gIv2vSppWJTD3GvyW9pNm7JCGUmN5aimO9WX5xIvglE9qp7nDSaCSudflQGX6Ekei/kz
	xI=
X-Google-Smtp-Source: AGHT+IEsBvyH0Zky97WuBrKbbjvEScgzySvzxn3rYYtDfdyw86suCq566xBi9HBUjAShIE2Mm9O+XZUWm2PEcQ1RjmQ=
X-Received: by 2002:a05:6512:12ca:b0:553:2ed2:15b4 with SMTP id
 2adb3069b0e04-553b6f4d916mr2068254e87.57.1750065764330; Mon, 16 Jun 2025
 02:22:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
 <CGME20250615105256eucas1p21dba29a1450757d9201b2a9c7f0e34e8@eucas1p2.samsung.com>
 <202506151839.IKkZs0Z0-lkp@intel.com> <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
In-Reply-To: <9765c970-55cc-4413-9fd0-5e0cdfa900fa@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:22:32 +0200
X-Gm-Features: AX0GCFvGdfEg2CPyKVWjNTkacG-9vOyaV6LbrgzY6YJIQBzVINyrlmiwiBnsQKI
Message-ID: <CAMRc=MeG40TxMj3ezeC0iUBBo8w99RXQWOQBsfG4ZAJdbA+dYg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: kernel test robot <lkp@intel.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 11:09=E2=80=AFAM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/15/25 12:51, kernel test robot wrote:
> > Hi Michal,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on 4774cfe3543abb8ee98089f535e28ebfd45b975a]
> >
> > url:    https://protect2.fireeye.com/v1/url?k=3D6c3bc994-0cd954c9-6c3a4=
2db-000babd9f1ba-30c2378fa012fc4a&q=3D1&e=3Dc39c960c-4d5f-44d7-aed7-0097394=
dfc81&u=3Dhttps%3A%2F%2Fgithub.com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FMich=
al-Wilczynski%2Fpower-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driv=
er%2F20250615-021142
> > base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
> > patch link:    https://lore.kernel.org/r/20250614-apr_14_for_sending-v4=
-8-8e3945c819cd%40samsung.com
> > patch subject: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver fo=
r RISC-V
> > config: riscv-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_POWERVR-0-0=
 (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lk=
p@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20250615/2025061518=
39.IKkZs0Z0-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202506151839.IKkZs0Z0-l=
kp@intel.com/
> >
> > kismet warnings: (new ones prefixed by >>)
> >>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM=
_HELPER when selected by DRM_POWERVR
> >    WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
> >      Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && MMU [=3Dn]
>
> I believe this is triggered because RISC-V can be compiled without MMU
> support, while MMU support is mandatory for ARM64.
>
> Would an acceptable fix be to require an explicit dependency on the MMU,
> like so?
>
> depends on (ARM64 || RISCV) && MMU
>

I'd put them on separate lines. While at it: how about enabling build
with COMPILE_TEST to extend build coverage too?

Bart

> >      Selected by [y]:
> >      - DRM_POWERVR [=3Dy] && HAS_IOMEM [=3Dy] && (ARM64 || RISCV [=3Dy]=
) && DRM [=3Dy] && PM [=3Dy]
> >
>
> Best regards,
> --
> Michal Wilczynski <m.wilczynski@samsung.com>
