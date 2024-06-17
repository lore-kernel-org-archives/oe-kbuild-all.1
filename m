Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106B1B3745
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632045; cv=none; b=fES01atuu/ezQmAM/vr9FA5czrvE0pv5YocY55sx/aTV0Nfc42yW8914bErjNJzEDBTNvsr4BCuNIdK5WLNa8WjXZ19QUMKfQRAZHFgrGckQ7kEx5HhU0V7lntsAjyeJ10CZ6JdVYBpMC5IxfA4WSL4zRZRpmsrTr8YBn4x32GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632045; c=relaxed/simple;
	bh=3SUojPKHMWFnVEtUmzCvJ0XJVYHWg9uufwDXcUrW4n0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l0YfYHu0rFWVDf9widP3QPRZ8PIjMnG5rHsScJDszpvoiZvhcVT1Tnhoh48ELae2CaLLvxWlI2oYgjzLUYAH0irOyyWbmn3rUFIwLzscv3JL541Ug1qNavQSya4QDViEoFBdALtcU1MbjP5u7/7PNv6M4TH5v2lBFl/7vqjxm+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Nl93wmA9; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Nl93wmA9"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfea5f628e9so4889106276.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1718632043; x=1719236843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HcMYFgMjLj9bfVN/vNd/auegls9+ix6qtJM9yIB3tE=;
        b=Nl93wmA9ZsKLMb5EXjTDG4Sg+6/BxCHBs8p2GxNKOsysmm6b2J4nDdFaItLu6fpwr2
         JcdujXpJf75cIadOgu6bxA3EFAKLdzd9Q88L6FMLNXaiV2hLTxWSPTYXJpMgZ3sT4LLV
         B6+pKQCGYv2KE228gUHClg65Vrl5VEfjCaGV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632043; x=1719236843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HcMYFgMjLj9bfVN/vNd/auegls9+ix6qtJM9yIB3tE=;
        b=Z1o+sYMz2gqPz6d8/8TXLlfTockl855bubqr0R1k0zKu0GeoJ6TGu80jpNUipdYsQ2
         2LkBZ6MnkCOVF5xsCPTjT3yqDRCb61dfY1MLIAS6y2UGmX8gX7Mzbct8cXdSWtf8OFRx
         bWLKrjGx4xrcH+8PPK9FSNe3d/fp80qjMhf+tienA+XTnetuMbQ3a16FbvoJEYLrqDRG
         HPNOEQVYGOPDPoWoIggjdGjrYeOFF+K9ZZAT4pUr4t0LCNc/phhE7RWoqN5OQPlA47LM
         SrE7iCRoqhgAApwFHjiugRjU0cRZd60l9KUEroP6FjQpg4kcxOWHZwLKqeeuaJ4je5vt
         Nwuw==
X-Forwarded-Encrypted: i=1; AJvYcCUh7A0ZxpDglSq6Dn5Y14jEJLpAMTl8SGgp9OaoPYeR0oDIVxYW9YghXUAO5joshJKcsM/lb0kasEVlv2cDvBvMkfDx9kNH2OZVAfrUvw==
X-Gm-Message-State: AOJu0Yy8czLgv91OsaFC2lAvIopkECPP/+PivzOxWHxTMZtFXbj3B14J
	gj2KCqHoVjZsyHobGemXQ/NejOhyeVbr4ZU1ld3z8Af6GxTVDWfwcu3eWwFGxPTck9hUD6gluwc
	5Yg3rKCqPLRXbv+4v2iOCX2ZZed/Fc4b3GnWW
X-Google-Smtp-Source: AGHT+IEn0uy3dwK2KhLXw7MEv8zGGNIiTaQBsPR2kW9tDB4MUQUymoB6SG2mXCXggR/NMBj1eOnEsZO0JKSQmlhOkf0=
X-Received: by 2002:a25:df48:0:b0:df7:7a90:26c5 with SMTP id
 3f1490d57ef6-dff153b3999mr8205865276.32.1718632042819; Mon, 17 Jun 2024
 06:47:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406152104.FxakP1MB-lkp@intel.com> <20240616012511.198243-1-alexey.makhalov@broadcom.com>
 <20240617090709.GCZm_8vdnLzt048UH_@fat_crate.local> <20240617100150.GDZnAJjoH5wZKu2OAV@fat_crate.local>
In-Reply-To: <20240617100150.GDZnAJjoH5wZKu2OAV@fat_crate.local>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 17 Jun 2024 09:47:12 -0400
Message-ID: <CABQX2QNT+rDC3M7UPWwT_XRb8iXiihk4iczfcO9iokUFhn0DJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Fix missing HYPERVISOR_GUEST dependency
To: Borislav Petkov <bp@alien8.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, linux-kernel@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, lkp@intel.com, 
	dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org, jic23@kernel.org, 
	lars@metafoo.de, nuno.sa@analog.com, dragos.bogdan@analog.com, 
	anshulusr@gmail.com, andrea.collamati@gmail.com, 
	oe-kbuild-all@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 6:02=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Mon, Jun 17, 2024 at 11:07:09AM +0200, Borislav Petkov wrote:
> > On Sat, Jun 15, 2024 at 06:25:10PM -0700, Alexey Makhalov wrote:
> > > VMWARE_HYPERCALL alternative will not work as intended without
> > > VMware guest code initialization.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-l=
kp@intel.com/
> > > Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
> > > ---
> > >  drivers/gpu/drm/vmwgfx/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/=
Kconfig
> > > index faddae3d6ac2..6f1ac940cbae 100644
> > > --- a/drivers/gpu/drm/vmwgfx/Kconfig
> > > +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> > > @@ -2,7 +2,7 @@
> > >  config DRM_VMWGFX
> > >     tristate "DRM driver for VMware Virtual GPU"
> > >     depends on DRM && PCI && MMU
> > > -   depends on X86 || ARM64
> > > +   depends on (X86 && HYPERVISOR_GUEST) || ARM64
> > >     select DRM_TTM
> > >     select DRM_TTM_HELPER
> > >     select MAPPING_DIRTY_HELPERS
> > > --
> >
> > Right, I'll queue this soon but it doesn't reproduce here with gcc-11 o=
r gcc-13.
> > This must be something gcc-9 specific or so...
>
> Actually, that's a DRM patch.
>
> Folks in To: ok to carry this though the tip tree?

That's fine with me. Thanks.

z
