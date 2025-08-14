Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1D3009F0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179551; cv=none; b=AusfZMVh2TT9KKyEAVWs9ib7nxcgntExwPZLI7DYbieHB3gWyiWgWr2CAKXO3UJWNF48VS4nsPFBksfz1VurpnF2bRrZULcrZPgtTWG9h7CxhIX0GbSG1tnWB/y8GsywwhW+mGSqXxjFXB7EP0tmApCJAFFumLlmxmAo1hK+rBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179551; c=relaxed/simple;
	bh=AuSxpcvb7DLJUWQFOJ9pI6FfZFF9U7z3dCclw46zCw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0d9VH772e7TM5Sj3m9ldSrhNG1zyu4P/b/kSrYEaZ4xPO0xt7LAeHzlpSB5fpVMecyl4BaQgUBjEfeBDH+0dIjEbzWQRat8IpQMNaPeOrfjK3qqnn3cg0gsrFUo/QMpAeTc0AmT7dkCsMm8OPqCdWAstrqQr5ZQieHPAlGEeVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gKWgyfm3; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gKWgyfm3"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b0bf04716aso266901cf.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755179549; x=1755784349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iw1gbTTEoFVJTMKqMiHJHmmtmv0E4fqdZ5KeRQQuZ4M=;
        b=gKWgyfm3PVFC6AdncZmHDN44xSujRzjp6XXFyMxUEK/IqKLYPiPmyItsk4nZHTagv4
         Rm8VfoRjKqgSOjoX3JpsyovhD/iXhJvKDVCrTVsWqb4b5/j5p/wxcc1dn09J4U1Iralz
         RjTVzFKPv4o/B/he2UMgdgzRwMvnnckeTjRrZUmCn9W1zBtPItGXYqi8z9hOzls3z2UQ
         ZfEXcypSyA/YZBn+26vgpg+nmWPKsfrA1XWkro9WQ3tv1AgGSQVXYhj9b2V8N2aeXSbe
         ze8y5XmKaa9Skc3qqOzlUS03Uy24cRuhYREHBqOBsyp7RLHEDAGtRZLwlhxru0ZZibPy
         xkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755179549; x=1755784349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iw1gbTTEoFVJTMKqMiHJHmmtmv0E4fqdZ5KeRQQuZ4M=;
        b=kU9BG1nUu0qFUxAu4nk7j+W9JWlGKdIGEvk0rWPMFWePj3NbrgcdsPgiZuQ9yDZ/nL
         fIpSS6ctdvzjf1pNG2XwOlOrkk/ZWUGX9+qkVBIQ3dDhh5vDI8thulz1CwxWovrSTzxz
         L0aPI5aFc/56w4258p5DU7Sgi4W31CJmYrqKYoPLTCM8Gr1fbX5/tE7J7frNiDEGhqqC
         ONMWUnRH3jXzopECZcHSS9rGJ9+UckvK119LG8jlX3O0ZuIp+uja2F3gAeEZffPz0TXC
         +VzOtsPUUgcAti8NDIzz2amASvN/fL37HGMQcHtszCqeegrPMEmXdtp+Jz0wO5AsPZvO
         Uusg==
X-Forwarded-Encrypted: i=1; AJvYcCXAUJ+IC6KbCyWyEKzlH9IPTXs+PjOylo4TtuPaV3mw1CI+zE47bBinKWnpEytMckLZKbTPZrG4ItlFHXom@lists.linux.dev
X-Gm-Message-State: AOJu0YwBHn4MTo57gmW4/e27GcKR60qNPwN7EOxczMlVHnQm0y4bvClx
	OWhF66ksino4K6PXmG3afaNHXtlzItGDTexChC6GZxL/qrZrMW0LRSiPeZ0/Ucy14XHe9l82z9b
	rTzzaSnwiVilyxudKnnddxkSrpYjf1CYbBj4qxk1h
X-Gm-Gg: ASbGnctkGXzFeNZSf1LZmOfbaos2z8rXAfPt2o/T/lQp8V5EZt/qLqvv8KXq4d02cTQ
	ed0j7eeJrb6M0wWoBDqsGBel2XbAhwt6ah0q5nkVqsA2O0KGfeSYqDawZLk85JYP0PZuD9P2BJR
	eg4gRNZ9/idAUz0UvZywn1gAmy/IVDKA14rJPEuQgQqJ6uyp9aJrdOpggsaT5xULUuL00G55mxC
	uyHEnwzzN5X2w42sksdaXoh
X-Google-Smtp-Source: AGHT+IFxCDaMIGSe3pZulw+GZLKqDhTfgI0QVOHcpZbnMzUJvM2n9+s+0HZfSWxvk4YSxiK5Ve0UBALAMOQ12E7m2ls=
X-Received: by 2002:a05:622a:7ac9:b0:4a7:179e:5fec with SMTP id
 d75a77b69052e-4b11648166emr751351cf.15.1755179548355; Thu, 14 Aug 2025
 06:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508142105.Jb5Smjsg-lkp@intel.com> <aJ3l0Te5Q1d4g3u-@google.com>
In-Reply-To: <aJ3l0Te5Q1d4g3u-@google.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Thu, 14 Aug 2025 19:22:15 +0530
X-Gm-Features: Ac12FXyU5mWkZ0SgOCtUvtEQ_v_nO7Y8OIQ-eUV3qn2nKOwscpdgvvk2Hwf8ewQ
Message-ID: <CAN6iL-SXvgRGSmUQ2-M115_y_k=cVCH3M3UATO7SzC8vMV3T9A@mail.gmail.com>
Subject: Re: drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse:
 sparse: incorrect type in assignment (different base types)
To: kernel test robot <lkp@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Alok Tiwari <alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 7:04=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Thu, Aug 14, 2025 at 09:21:50PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
> > commit: 32b2d3a57e26804ca96d82a222667ac0fa226cb7 iommu/tegra241-cmdqv: =
Add IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV support
> > date:   5 weeks ago
> > config: arm64-randconfig-r112-20250814 (https://download.01.org/0day-ci=
/archive/20250814/202508142105.Jb5Smjsg-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project=
 3769ce013be2879bf0b329c14a16f5cb766f26ce)
> > reproduce: (https://download.01.org/0day-ci/archive/20250814/2025081421=
05.Jb5Smjsg-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508142105.Jb5Smjsg-l=
kp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> > >> drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse: spars=
e: incorrect type in assignment (different base types) @@     expected rest=
ricted __le64 @@     got unsigned long long @@
> >    drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse:     e=
xpected restricted __le64
> >    drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:305:47: sparse:     g=
ot unsigned long long
> >
> > vim +305 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> >
> >    297
> >    298        static void tegra241_vintf_user_handle_error(struct tegra=
241_vintf *vintf)
> >    299        {
> >    300                struct iommufd_viommu *viommu =3D &vintf->vsmmu.c=
ore;
> >    301                struct iommu_vevent_tegra241_cmdqv vevent_data;
> >    302                int i;
> >    303
> >    304                for (i =3D 0; i < LVCMDQ_ERR_MAP_NUM_64; i++)
> >  > 305                        vevent_data.lvcmdq_err_map[i] =3D
> >    306                                readq_relaxed(REG_VINTF(vintf, LV=
CMDQ_ERR_MAP_64(i)));
> >    307
> >    308                iommufd_viommu_report_event(viommu, IOMMU_VEVENTQ=
_TYPE_TEGRA241_CMDQV,
> >    309                                            &vevent_data, sizeof(=
vevent_data));
> >    310        }
> >    311
> >
>
> I assume we'd need something like the following (untested) for this:
>
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -303,8 +303,8 @@
>
>         for (i =3D 0; i < LVCMDQ_ERR_MAP_NUM_64; i++)
>                 vevent_data.lvcmdq_err_map[i] =3D
> -                       readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(=
i)));
> +                       cpu_to_le64(readq_relaxed(REG_VINTF(vintf, LVCMDQ=
_ERR_MAP_64(i))));
>
>         iommufd_viommu_report_event(viommu, IOMMU_VEVENTQ_TYPE_TEGRA241_C=
MDQV,
>                                       &vevent_data, sizeof(vevent_data));
>

Running `make C=3D2 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.o`
seems to remove the warning, I haven't tested this on HW, though.
LMK, if this needs to be sent as a separate patch?

> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki

- Praan
