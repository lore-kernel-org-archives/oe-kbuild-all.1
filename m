Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C54EAC6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738334086; cv=none; b=uw9fQNOUhXwh26OY/SK6qBDoB1x0ZBDI1oiBa3iI2NMLudpTaSLVBr5BWP9wca3Azhkeqnx38VXjNFwXtFwJcR2JR349DXYK+htAYWeaH2eOzpale7iLNxl13rqA/502rjzB/ZPKVpNOJ8bVi7bU8A2kSqPYBL5P8jPVncqsi/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738334086; c=relaxed/simple;
	bh=5xqkddsJTZ5dRQSHbBSc2SHbxqOWzTOe942HRf1yRPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF/KVq0CiJWDvSBy0JteDVaDn3DOZR5/W8IsiHL8hzFN1P1fGb8NJ78O+oeBCz3xSA/e0L2h1Mu+pim0No5MJ0Q1VhWaT0YnHjqkYCHsHcgZGZjVW7XuCfRP3dL+VNIGfAV9yjHO8gC5GXcRDvXnV9VTgVbPnS6nWjJlfm2NaWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIidVaj3; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIidVaj3"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-518a861612eso1547441e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 06:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738334083; x=1738938883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DQt9hxGdmYVVKNYAgUDndBfs4/Z4r22J1KiTNLuw6c=;
        b=VIidVaj3Q3ZAuVH/5VZ2LEAv/JmowSj4mC3Az4sEZZALp9I9tW36SRQtG8wngSEExt
         4Uz+7YLFNI4U2aoCoAkC8dE6VLEy9OLQxGD0uNKu9UIwrjbfxYeZf3pSQ+bhRk6Tt0Ef
         mzkPNkRxR0TodCrzzCF2FUNNLeET0b81yPI/ATdGM8lFL/6kDU0RXf0KKuyCAZlBeYOb
         u/o4V8aPk7pBJuP3AQA0Ka4YZN94pxFL4d+ARxCAhdmmzj/G1aZYSG71UH/LqY0ExR2y
         USriTKEdV4TW1qFFNxxjgW5j26aeQQPzsd0OUUH2vd5vbeO9jOQp0pdy57oVihCN9IVB
         J3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334083; x=1738938883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DQt9hxGdmYVVKNYAgUDndBfs4/Z4r22J1KiTNLuw6c=;
        b=kYjqKW858fcGSOAbmR3z1EfICtaWdjJWM/8xyWUMhLIeTCVbrDYJKnCi/sJanAlo1B
         YymLENwv6EBipZtEio9weE8CIUiJKiZZPRuoGBCz0IelliqwiPHkzS7dvPYAaOhQNDfA
         xMjsSTI7fOJ48UB/jrbS3DpMfx67YlC+k61ZPChIDFxU53DXPvtHsEysoaDl6dlhtHgw
         XdUb6FHfyBclF+dzDXHELtSUOdv8OV5N9s3d0C7aFEZB3EUgUnANnaEOiCFs0tAHv9Dv
         rmtOs1WCPr7OxyQASG0D8nc5vx1tEEMm6d6e9m8oROGIXgaLemPJFjoDq2TaiEdXmz04
         9A0A==
X-Forwarded-Encrypted: i=1; AJvYcCWbCN3aDvulr0+1sB+0yqWJmXe/9GBSs7tRBVLTput2gIA+Sm3tbQMiouzvJTHyUpseQ2nKEinEy1ciszEQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyNeHcHqrQRGjgJNj3LeUq8s0QfG6yBCxuszHyqLGwPxHxdC/IU
	8qJWadf/d8a2omgILQXkUkN2lQlI9Ho6VkQEyJ9/cV7mChVYLoWGngxB8NEZ6qU7l/h7VLyqQr2
	gimzILSi08rQZmQsec4fuGeoDxeE=
X-Gm-Gg: ASbGncuIdeRz3SD5uEgmwCpU2701ggjBSKABAlCo5yIZDY3EhhlVHIxn2H5HGYvwS4Q
	JvTHSASt9AP14g+t2mR6BoqMt8o1hwTi6uQ5ech5txzDlYgx65Ho5ao0CpFujvSsyAQHF4G8GkC
	A0jj+x3D4mJY18xWyhyTMSB7xKPbsF
X-Google-Smtp-Source: AGHT+IE6AB0NR/2v7NcnnwE1c1/Qy9NZRDU60J8O+gdUWChe2JLE52MXJDKLJaSrqPGZ4r5c6FcJGVWUGsKhNFJB/BY=
X-Received: by 2002:a05:6122:2bd2:b0:517:e7b7:d04b with SMTP id
 71dfb90a1353d-51ebe66645fmr1668237e0c.5.1738334083520; Fri, 31 Jan 2025
 06:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501312159.l6jNRaYy-lkp@intel.com> <CAFULd4bYhA+XsJH3rr=i98O4DJr_jjZe5HtBETGV_4Sm0S0QnQ@mail.gmail.com>
In-Reply-To: <CAFULd4bYhA+XsJH3rr=i98O4DJr_jjZe5HtBETGV_4Sm0S0QnQ@mail.gmail.com>
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Fri, 31 Jan 2025 14:34:32 +0000
X-Gm-Features: AWEUYZnEV00JUTBBfkJnQ1ZIl_kj_yrPJWJxfYjp_pjsVLhk3-5vl9bmpu34dY0
Message-ID: <CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 52/52] lib/bch.c:317:undefined
 reference to `__paritydi2'
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 1:23=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Fri, Jan 31, 2025 at 2:12=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
nonmm-unstable
> > head:   1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e
> > commit: 1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e [52/52] lib/bch.c: use=
 __builtin_parity() when available
> > config: arm64-randconfig-002-20250131 (https://download.01.org/0day-ci/=
archive/20250131/202501312159.l6jNRaYy-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250131/202501312159.l6jNRaYy-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501312159.l6jNRaYy-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    aarch64-linux-ld: lib/bch.o: in function `parity':
> > >> lib/bch.c:317:(.text+0x10e8): undefined reference to `__paritydi2'
> > >> lib/bch.c:317:(.text+0x10e8): relocation truncated to fit: R_AARCH64=
_CALL26 against undefined symbol `__paritydi2'
>
> This config for some reason generates a call to the library function.
> But I have tested this with a crosscompiler:
>
>        fmov    s31, w0
>        cnt     v31.8b, v31.8b
>        addv    b31, v31.8b
>        fmov    w0, s31
>        and     w0, w0, 1
>        ret
>
> It looks that __has_builtin() does not mean that there will be no call
> to a library function?!

Yep, __builtin functions aren't strictly required to be inlined and
can generate a library call if the compiler so chooses (how often this
happens depends on the optimization level and architecture).
e.g: https://godbolt.org/z/zKPb9hbaM

--=20
Pedro
