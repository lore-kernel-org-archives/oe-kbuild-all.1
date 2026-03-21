Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF5175A71
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774111150; cv=none; b=e6RZ6cfQnp2QStJN+joDK/PvJ/KA7ao2xNbAgGNnWbX+gJN6RhcakwE2G4HBDaTR11eXC/ovOFfN0OgWNVbtDoI7jw8hQ53+2Ey6weW1tUfCJZX30Qycnve34VOTUewVJDZzh1TrItU19EAgB8O1BK2NbkhoJQp1M+C4afX/GiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774111150; c=relaxed/simple;
	bh=SjQob6FDwo+/opKz7c1YH0Lm3/ydW3yrWgrY+zB/ODk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgPZ72quVvBgo9Iy3I5pxhLvfYGlIm4AINTU9dThqscGcjZM0KaZFRx0aajbNHPQpFC8qhZAQUPparEjZ3TYzOzO1f1jMnOVG8DKLf+JDbwEa4XYJcsjify9t0rFVpmZlRD7qLWkVVbg7dVH2NBzujnbY/UY5pidOIdMKBp7lGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QBOz+SAR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QBOz+SAR"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b97a9f4b4dcso185862066b.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774111142; x=1774715942; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+mAGI6D2x7kpdUZk4YxlzGy1eE7Yb9ILgwi8nyiApI=;
        b=QBOz+SAR4qgyashyzcLjACvNVz2Ax8voUR5QBmvu5ua20HmkAybgz7ApUALtc8EKGH
         bXlgwsulbIYEdUeAAyqxiLW4Dra3FLDRFCGEjK5geBTXT8rWK03WG/hgpbJTcNQlIJKw
         AjAJRdxYMuTWRJ6U8FPeGhQp/ap8UccILqTbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774111142; x=1774715942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+mAGI6D2x7kpdUZk4YxlzGy1eE7Yb9ILgwi8nyiApI=;
        b=Ie6q19yBzoFog6p/+oTZ/Y3Qj7/1pUB1mYsvskE4zGuLN6FXHJ90UPW2cC6ZUk0v2s
         NImJ4RthrKKbB3kQPhmpDdvNM0hP7/hF1lMBpa6bMgAd4xP3ovxzeBESvalN9tjd12lo
         SVEzoMlWkEFGoTz13k5IfRTBIZy8y+WW/moS/kL94MJPVyhgwGkKrKNcXOknOAkrDu8E
         HRbKSWGsbYNlf37cxA/5UtRR/4LhPVQgTbU5Qj5gTAvpNJxe4vvlZMqJHNU7e0JCnwz5
         8CqKSAYmiPk+rdv1UfGXodFbtFfP7hFHsIOLJ3FmebHpcSDWaC7nAHuYhSuTXwmL/eig
         yZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkoyhjZAZ0oB8elUQc8xWJgYHLS6YSkOQadsZz6AMPVMWeMUAvAlcM4LppDGl4a95lE1Yr99D4YXC8w45K@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyxgq+549jbu8mwHEJpLugyXQ0MqaEPwYASc474xdDqcuNQi+d
	/XIcSSicJE4GZXQ5Fa/Czn1RrYywv5CEKYrymWEJkPY0atnI4A/mFxhFEywKy49acsPl6trAWB/
	BoZi0tUjV
X-Gm-Gg: ATEYQzyNcciIVhQI/FMjtMPaRmeh51xeIAZJvVffhc7Xnh1tgIVxbYIndpPwJCHyBfw
	no79ImcPOsuVzvSBqY1Cai2QDPQhcBSqDlXKO3SJmJimvf/duwSl3EfBxc7LWiYxRuicTRSlnwv
	SfAeCnVYaBVUVVLJxZ7J9LmJeGZqWaCzyxaQrZ4BcZiquMZpOpdl7/IohfS6q4Mh4ImqBx/p5vj
	SoBL2PYqOXIWbfHT2KK2WziPK4vlE2SgO1K504jNz8Pv51hFyDpw2S3lU7o7oCkXcC9VYQ4r2m2
	/XLaM2pjhiMbKQ27l9t9vMpc8zp23RlMZzqUMenYBzwCPFf70OESZnYS1H4nNpR8ep+FJirUbhb
	uD/bY7wnuWrlIXvmdJw1KgCoJVxgfzpKAAN/NQKK/Lg0pzp93gKolF5ENM6ce23MpvAg3G4IKLR
	J3CJBPiYSQtIRqw0MXKPk1wvv17dovV4k10xzSDsDr/USXxIhjh/xa+Q/IoTB+IQ==
X-Received: by 2002:a17:907:9813:b0:b98:5100:3950 with SMTP id a640c23a62f3a-b98510039camr146697266b.42.1774111142266;
        Sat, 21 Mar 2026 09:39:02 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387085fsm281000566b.52.2026.03.21.09.39.00
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 09:39:01 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b2965d4bso1037267f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 09:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP/FoA6PKNfYELDABspGeUoMgRmcI8xG47jGwQWNKhoCBQ5JgwiyIDRKqHcB731ZD+7TiaN3WtckGpph6X@lists.linux.dev
X-Received: by 2002:a05:6000:290d:b0:439:d242:e8fe with SMTP id
 ffacd0b85a97d-43b64242fddmr11167085f8f.11.1774111139960; Sat, 21 Mar 2026
 09:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319050938.556235-1-alvin1.chen@lcfc.corp-partner.google.com> <202603211444.JZ4VbAPo-lkp@intel.com>
In-Reply-To: <202603211444.JZ4VbAPo-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 21 Mar 2026 09:38:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXD+FmjQusp_inaLhG8=vR3YgtobOp3igSmR54=Ka4bA@mail.gmail.com>
X-Gm-Features: AaiRm50fR7YNH2twmQ7oW8qNNgZ56TEA6Y66221jXJ3dTEgaRip4CTx2LNX3NkE
Message-ID: <CAD=FV=WXD+FmjQusp_inaLhG8=vR3YgtobOp3igSmR54=Ka4bA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel-edp: Add BOE NV153WUM-N42, CMN N153JCA-ELK,
 CSW MNF307QS3-2
To: kernel test robot <lkp@intel.com>
Cc: Alvin1 Chen <alvin1.chen@lcfc.corp-partner.google.com>, neil.armstrong@linaro.org, 
	oe-kbuild-all@lists.linux.dev, jesszhan0024@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 21, 2026 at 7:03=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alvin1,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on linus/master v7.0-rc4]
> [cannot apply to next-20260320]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alvin1-Chen/drm-pa=
nel-edp-Add-BOE-NV153WUM-N42-CMN-N153JCA-ELK-CSW-MNF307QS3-2/20260320-08471=
8
> base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
> patch link:    https://lore.kernel.org/r/20260319050938.556235-1-alvin1.c=
hen%40lcfc.corp-partner.google.com
> patch subject: [PATCH v3] drm/panel-edp: Add BOE NV153WUM-N42, CMN N153JC=
A-ELK, CSW  MNF307QS3-2
> config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/ar=
chive/20260321/202603211444.JZ4VbAPo-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260321/202603211444.JZ4VbAPo-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603211444.JZ4VbAPo-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpu/drm/panel/panel-edp.c:1893:1: error: expected expression b=
efore '{' token
>     1893 | { \
>          | ^
>    drivers/gpu/drm/panel/panel-edp.c:2028:9: note: in expansion of macro =
'EDP_PANEL_ENTRY'
>     2028 | +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0db3, &delay_200_500_=
e80, "NV153WUM-N42"),
>          |         ^~~~~~~~~~~~~~~

I think this is the issue I already reported where your patch had an
extra "+" in it. I fixed it when applying the patch. I think the
kernel robot here was just testing the patch itself, not what landed.

So nothing needs to be done here.

-Doug
