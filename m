Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659618FDA7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028787; cv=none; b=OnKJFBRVhgKcOWZYmx35NlzBB/g9wBrub3C3dX6RDoq9edQXYwLGR/FuMGI4c1n96V78RpOFTdblL/fi6a6Gv8kzxxWNR1DiTamAcQSxwQ/uCMO3fZ4E3Zo3gKaqn/m+cmj2g3ADq2Xvj1Ju/3Iu9/LxoZD+zvk8XHDQvH1JPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028787; c=relaxed/simple;
	bh=2ephjGRHNPo48iDMA1nSh7ibPkjTj8OCvJRSKMmMsTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBrRcFiMSENq/1wITA21nRH0c02B6E5UxPfe5UeaZwPuASMH0katAho6k/7eTvR2xX5c23qIp5y1q7PPvRq4o1d3/RnMoiry64nh47RdWXMehDTi+k/IDPK6gfJDUSJxF6Gu+W+/wjiVjpVq1ZM9KUq9un2A4FClWGYON8W6HsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z0Z9Spef; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z0Z9Spef"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bf9ddfc2dcso9159496d6.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725028784; x=1725633584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHaqxwew6g5W4cUlmBz/epY/hIYnRPTFY3uvTyUohwA=;
        b=Z0Z9SpefR9vs1VXRzvgYAKP16UqL6tnz+f3OghouEj8pcPoWBwGoJIdOqceyGndIp9
         pTBt75VRIr2Czth8hWi9jTs5YJOpAUsXxQotbD57lE5xu5WxHhL2GcKcXEn0n/+o1Mqu
         lWU940wRr/36wjfLpPdT09ZlGAQjpRcgeVvdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725028784; x=1725633584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHaqxwew6g5W4cUlmBz/epY/hIYnRPTFY3uvTyUohwA=;
        b=FOwnXTu48PMgdwv92TQ7GAyIakrgAFATmibCaooATfijvn7j3wqYbvU5tDtWhlxHzE
         xNYVFal7phZKfyq3OjXEMQAn1YIlQQKyNvOSujKOH39brtCj7sTqSGvxMNAA++c1sKHd
         euR63lQ/Td+DPlGrwC5Bt5HvDVqGCPz2M3j7n6JBnh3u0/brxWhmB7MOPScChfpJPRmx
         6qvb78Y0yIfcWiKxalQ5NxdadFEJ4ANY6wURW9dQgjJIsHb2f+N0V7AKb7MJzvrDW6Rq
         k4LVZG2hZRwcTiUm/+aYDWcof26b9MpfIon6yzV1dUipdz5NyfcUB6fLykj3IgJ1qGEv
         FdHg==
X-Forwarded-Encrypted: i=1; AJvYcCXX8gH9gg0YsKYB0HHn3+DwzAotftmZe0xMlYVeZWzbcq8/KD0cMoY0dQ8NNkVr67Z6Qr/bkV6PHIWzZNmU@lists.linux.dev
X-Gm-Message-State: AOJu0YyAfAoKZpWTMZvB++MFV64kRA5sS8VCziU3zWLE1Cofkpbixn2h
	SM5urXvNVQYl6EdbePMTrpOObw6vpVVVYsRe8XdG1RuiEq4AIeT5x+ujNxleg5EsqsqO9VkbSPk
	=
X-Google-Smtp-Source: AGHT+IF2pASnKcSEn+W+gfOh3jsK6qeU6v2GcjHSJChOPD9UEggpoE31sQaiQOzWkglgYPJsGYM0vw==
X-Received: by 2002:a05:6214:2f8d:b0:6c3:33c1:bdd1 with SMTP id 6a1803df08f44-6c33e6980efmr71050086d6.51.1725028784075;
        Fri, 30 Aug 2024 07:39:44 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c43914sm15080686d6.73.2024.08.30.07.39.43
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 07:39:43 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6c352bcb569so1848086d6.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 07:39:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXy3+9SYUI+mLmeygk2IvU8Xm/pa4cdcTO0cw45ZqG4dt0gVKdXriiKwgHfzHmFrThdqU+pHHDwZDTeOzMX@lists.linux.dev
X-Received: by 2002:a05:6214:2c13:b0:6b7:b277:dd12 with SMTP id
 6a1803df08f44-6c33e6962e7mr84484156d6.49.1725028782645; Fri, 30 Aug 2024
 07:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408301813.TesFuSbh-lkp@intel.com> <CAD=FV=VREXJf0Mcs_FJ-bzFN9T2SPwar8RVbYvVz9Yu+5i57+w@mail.gmail.com>
In-Reply-To: <CAD=FV=VREXJf0Mcs_FJ-bzFN9T2SPwar8RVbYvVz9Yu+5i57+w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Aug 2024 07:39:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WW5AyabXbcVTuHt1T-AgTq4g9pnyVJTCQeb=bw7dUJ0g@mail.gmail.com>
Message-ID: <CAD=FV=WW5AyabXbcVTuHt1T-AgTq4g9pnyVJTCQeb=bw7dUJ0g@mail.gmail.com>
Subject: Re: [linux-next:master 7644/8126] drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:15:
 error: implicit declaration of function 'devm_regulator_bulk_get_const'; did
 you mean 'devm_regulator_bulk_get_enable'?
To: kernel test robot <lkp@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 30, 2024 at 7:15=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Aug 30, 2024 at 3:18=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
> > commit: e0cb0c785250d0565c19ba17fc95bd7ab97670ba [7644/8126] drm/panel:=
 visionox-vtdr6130: switch to devm_regulator_bulk_get_const
> > config: openrisc-randconfig-r022-20230730 (https://download.01.org/0day=
-ci/archive/20240830/202408301813.TesFuSbh-lkp@intel.com/config)
> > compiler: or1k-linux-gcc (GCC) 13.3.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240830/202408301813.TesFuSbh-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408301813.TesFuSbh-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/gpu/drm/panel/panel-visionox-vtdr6130.c: In function 'vision=
ox_vtdr6130_probe':
> > >> drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:15: error: impli=
cit declaration of function 'devm_regulator_bulk_get_const'; did you mean '=
devm_regulator_bulk_get_enable'? [-Werror=3Dimplicit-function-declaration]
> >      255 |         ret =3D devm_regulator_bulk_get_const(&dsi->dev,
> >          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >          |               devm_regulator_bulk_get_enable
> >    cc1: some warnings being treated as errors
>
> Oh! I think when I added devm_regulator_bulk_get_const() all those
> years ago I didn't add an inline-noop version. Let me post a patch
> now.

OK, I've posted:

https://lore.kernel.org/r/20240830073511.1.Ib733229a8a19fad8179213c05e1af01=
b51e42328@changeid

That should fix the issue. I assume having that go through the
regulator tree ought to be fine, though it will mean randconfig on the
DRM trees could keep hitting this failure until the DRM trees rebase
onto a kernel with the fix.

-Doug
