Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DB324B34
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 07:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794451; cv=none; b=pQYdx6eO9fD9GgwP3pBV6tKU5YUQ23DrZgkm6FNWOA5k8fw/ZteXWXa5GoO7OoMGoiXI0lMWCymwT0F/QWaDHC3ojJdzjbd23gNX+GTRVCuWWMbPfG6ehoFNQjXT+U/tauhSrzCf00R5QwZzy4J/9+ZNvnvYRxuRuR0qHELU5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794451; c=relaxed/simple;
	bh=J0CF/Zxx2OfDURCNT5Vg/Q1tEIrJciZjXwO7iuS8cqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/ky8lEgAWF6lDB2Kn9vhIaZehLcPJlcF0IIm4YnsuYbVUK+nPXxfjrQ1W3gbKRjWmn+zXl/JuNABQmFYPTXznEkeBD9nQ6fUkFy/fLfTKtWm8ijoT4mdQ93tK1BrEicAxIy5S2zIj/QJEHTdzCF9Bg1kiaq54bIIAYbA4AjfPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=PkjdCO2+; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="PkjdCO2+"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 805653F594
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 07:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1716794446;
	bh=J0CF/Zxx2OfDURCNT5Vg/Q1tEIrJciZjXwO7iuS8cqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PkjdCO2++3k9B/QGzG7oPgvj2tJy2EZryRX8nL4lv/PqFocZU6j5lyGGBpX+bRlc1
	 bcug8gilaodT0WXcWCcL+JDotB50OxzCoytvljqZ5bWgNflsjXuqopNLNoYfVPAjHi
	 q3VRDWvKbYdzn6C1o49imkq/lfBGx/GbOVUdUcXELz35E1y1ckGCurV69mBCo4AVxe
	 yhKSGhgEepx10r3LPF75b5l949mEMxV5kmjBybnq6umoGw+jD/JOlwNFwb97af85FF
	 Y3CnXLBL1x+2BS8Yg5ilQjHlGOf/mAyF9/yNSRgDDrU+mFWrE4JURNHvtLOQKXkGeL
	 byTwQDf2Dz5Rg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a62471564a0so174377066b.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 00:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716794446; x=1717399246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0CF/Zxx2OfDURCNT5Vg/Q1tEIrJciZjXwO7iuS8cqg=;
        b=CpiOI+CrX8aeg8hVIYCKm82K4AnEg85AQI8OggAORvdWgFFskuk1SAqB93wnmaH/71
         NUFnvVGhcmxoE6wjOLSSeLxftwdgnmE5csoTAJBck+iphlHVVgMoVvq3FPeI6RGLaUbf
         hu7bSTp6u22PN3P5miT0usT7hPMQ2cAQDcDnVXA28GGlXahCb3IvN2e1K4qtuGoJ469v
         rs9rMe888GCbnqRPMC1JNQiMccbxvOJNhGn+sUFY2Cxk4yhwropViMvMVSslrrsG6VjE
         kS+ZuQqJv1K3SY1RQRPC+5ha/RkTERJmUmgTB7/R/LA+tfTVwnw/Kno9kgjaMzcMdqp/
         YPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQVsJTE6mfaEkzRmnMfjwDYKoAOpcH+NzYvGsjQyrrp0JqsI3m1oyF5LViOCYJPyIGDY8PlgaDWATCqaXA49XpL/d4crAoaYn3v743EQ==
X-Gm-Message-State: AOJu0YzknWxrZs//ak6AGsFUYEGw1nF4L80IYIi1x+gKMBu2AFXrxJK2
	btqAWUg9IV5604g9RhEMoD293Nj8InqfR5NGfSH30TFHtEjWWuJeBPuTJZ23kSQp38i594W6t3Y
	+KypcrL+PvRaV3lgpMbSOs8+cj3S5FHLVYBSBM+mVW9NkWXj5EzrnBR6bl0k56dpBPpEGPgbT2r
	VBbtiUKCsCbECuBW6Gzi+OaSDEZ3KGYYaN2l1UuBpKivtMVDTta3LRXA==
X-Received: by 2002:a17:906:63ca:b0:a59:a9c5:e73b with SMTP id a640c23a62f3a-a62647ce012mr498321666b.46.1716794446012;
        Mon, 27 May 2024 00:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmw4VLWA0a24bjxblJSe5WRMYJ+9EroDGbosYsLw3G7eBxuW2EV0oOhmhXEwowPtjDctpJYo/2PbocToxCG2o=
X-Received: by 2002:a17:906:63ca:b0:a59:a9c5:e73b with SMTP id
 a640c23a62f3a-a62647ce012mr498320266b.46.1716794445611; Mon, 27 May 2024
 00:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240527063136.159616-1-chengen.du@canonical.com> <ZlQphdQLcOnGhCIR@64dafc7c46f7>
In-Reply-To: <ZlQphdQLcOnGhCIR@64dafc7c46f7>
From: Chengen Du <chengen.du@canonical.com>
Date: Mon, 27 May 2024 15:20:34 +0800
Message-ID: <CAPza5qcffDNUL+HXf0g2Kf2U9_nqsrbAaEwCf5gS7c5CH4c8dQ@mail.gmail.com>
Subject: Re: [PATCH v2] af_packet: Handle outgoing VLAN packets without
 hardware offloading
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I apologize for the mistake in this patch's commit message; it should
not have been sent to the stable tree directly.
I will send another patch.
Please kindly disregard this one.

Best regards,
Chengen Du

On Mon, May 27, 2024 at 2:35=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> The check is based on https://www.kernel.org/doc/html/latest/process/stab=
le-kernel-rules.html#option-1
>
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to ha=
ve the patch automatically included in the stable tree.
> Subject: [PATCH v2] af_packet: Handle outgoing VLAN packets without hardw=
are offloading
> Link: https://lore.kernel.org/stable/20240527063136.159616-1-chengen.du%4=
0canonical.com
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
>
