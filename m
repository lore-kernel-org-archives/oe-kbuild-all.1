Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA75C4D8B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027345; cv=none; b=FX7lu7wFDDsfiBY+fVzUyh2iSMCjCSoqQoY8L66O5x+NdB6lrvH031E0a8PuegRdTXfBCW8cI37cgcCufaybQE4vcVNtPFrnAOkirfZB5te/oft3FOvoOxc20dhPXBnWCwRJLuDTCY4Bd/aWZeUiM3Wjdc3GYWYxsAZtkiPsEVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027345; c=relaxed/simple;
	bh=DcRLspnOg5tC9xdmgLDWkYp0HnlqPVSr0m+NHcjQhkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJRBvlT+PhCfbktH71CpQiZRcdSYusup0Bg6B53ONTlxx7TZACYEDutlQ+Z+uFXsTgbpL03Qwz+c9DarDQjDssCkN7/wRaP+zzzcIbPcHj1tzHYErjz3XVuLLkJyh7OLlTAIeaVlBIGVodnVPazCLwr8rrQGWFY6S8fPgy1RqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GksrDm/z; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GksrDm/z"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-45680233930so10599861cf.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725027342; x=1725632142; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mO6nUV3+H9BHrc6q6st7QpkTON1guw0D4wbocSi6Exo=;
        b=GksrDm/z3+onnDfyvVeQgMZepoWqD+D5sxvMQHZ2VrcJZI/oy55kPEXx462S1riPsz
         l6MNrlMJYgJLebi4RcoK/I1HNc5EPpN4tKYh9QXMivk7o6pvWWHezsQ0lQzpvaNJ5hoC
         SKytTB7OYOl/4IwN3ZHJt74UILGGlXewePDKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027342; x=1725632142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mO6nUV3+H9BHrc6q6st7QpkTON1guw0D4wbocSi6Exo=;
        b=U82141BjOkbgZRdOHSIUlN5VE0Y9hkckn7vRVNRdwHdm9otLB1pq4rMj3CEkyYmmIp
         q4P65XFhGk+khsiUbYJVd26gYNqa0u30DJbxBb7/rItsC50H4CueN1wrHPoVUkLj5n7d
         /N/eVE6u3iA7k8+wn8E26u5llN3WxLpm61gtDogVpeqq4cx5eFOMVcNWHwe3iabBN2W6
         5HxXnoX/1viktNKrLSg8QV6HCTgN3e3ey0//7W4mwfwtA+tVeenUYRgrGYN/5yOHxsdi
         S4Wpbv8Jv7EakmuOVk5vePwwX2MKyG0MPN35FQVzw8CVI9S4bNSQSAbIh9ZgbmQdgQFB
         wKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCnIGcZTxx/NCnmcr7dh1vhPvDH8ZUAnkRwM3Dq9YK25T/o+an8vE6cnJMnWykjAoh3CkqFRFpcmC1gNP0@lists.linux.dev
X-Gm-Message-State: AOJu0YyXsThj48Rhlq9PgUIUYHcoIUsCIl7iZ674fSE6m2EZJg2yy+fK
	qaT6QPiFnnRD4tC9LlFGWqAUIqhDwFKPaJLAaS2QvPYj28OyNp2jhlRIS8vIw5KXUsn45rMNSN4
	=
X-Google-Smtp-Source: AGHT+IHHiNJGdA9r2Yv/zU7PJGupPi1WsbYm6rbX/clP7sd22+T0TkC66YlYm2BweL1kmyy9B8wbSg==
X-Received: by 2002:a05:622a:5586:b0:454:f2e5:9202 with SMTP id d75a77b69052e-4567f4f7e16mr66921451cf.7.1725027341843;
        Fri, 30 Aug 2024 07:15:41 -0700 (PDT)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682ce3037sm14226971cf.49.2024.08.30.07.15.41
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 07:15:41 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6c35334dfb1so1288076d6.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 07:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzoC4VO/IL9GQHv8qRzdsFVUnRxayWZnUS1/WWa3tQxDtl5zXQTSlDSLYk1ZmyYY9oXEM2kTTRGSVwnfFN@lists.linux.dev
X-Received: by 2002:a05:6214:5544:b0:6b4:fea8:6bfc with SMTP id
 6a1803df08f44-6c33e5e6b46mr74895006d6.10.1725027340527; Fri, 30 Aug 2024
 07:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408301813.TesFuSbh-lkp@intel.com>
In-Reply-To: <202408301813.TesFuSbh-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Aug 2024 07:15:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VREXJf0Mcs_FJ-bzFN9T2SPwar8RVbYvVz9Yu+5i57+w@mail.gmail.com>
Message-ID: <CAD=FV=VREXJf0Mcs_FJ-bzFN9T2SPwar8RVbYvVz9Yu+5i57+w@mail.gmail.com>
Subject: Re: [linux-next:master 7644/8126] drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:15:
 error: implicit declaration of function 'devm_regulator_bulk_get_const'; did
 you mean 'devm_regulator_bulk_get_enable'?
To: kernel test robot <lkp@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 30, 2024 at 3:18=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
> commit: e0cb0c785250d0565c19ba17fc95bd7ab97670ba [7644/8126] drm/panel: v=
isionox-vtdr6130: switch to devm_regulator_bulk_get_const
> config: openrisc-randconfig-r022-20230730 (https://download.01.org/0day-c=
i/archive/20240830/202408301813.TesFuSbh-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240830/202408301813.TesFuSbh-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408301813.TesFuSbh-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpu/drm/panel/panel-visionox-vtdr6130.c: In function 'visionox=
_vtdr6130_probe':
> >> drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:15: error: implici=
t declaration of function 'devm_regulator_bulk_get_const'; did you mean 'de=
vm_regulator_bulk_get_enable'? [-Werror=3Dimplicit-function-declaration]
>      255 |         ret =3D devm_regulator_bulk_get_const(&dsi->dev,
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |               devm_regulator_bulk_get_enable
>    cc1: some warnings being treated as errors

Oh! I think when I added devm_regulator_bulk_get_const() all those
years ago I didn't add an inline-noop version. Let me post a patch
now.

-Doug
