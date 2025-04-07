Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE725D531
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052562; cv=none; b=GPLX9TvcIaeyiWF3c9tEU2gfJD81Q3MzcUshH89SV21gTikxbTWC5U36TvAu7zgxYbgBWe65eeGsTBSEw0trljAPOa9V4vA+7JvuCRimv18wvGY9C3fPXrMZgPumFSTx8bmYXpJ0wJtPMge3dg+T6/3oDtS4dCac6MKGfDtvM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052562; c=relaxed/simple;
	bh=3w3CD5q6GRJnXHz6VCgaFnqsMOkdzmCYyco+Rqyxsb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kC7Y72XvOa//E65KyTiMJqtQADnaWZheLbNY+EHyD/X3X2KLOurndSfMe9aXfgLueOQt40aklWdxvxrm5xriOBJvX+b0BBnF0sCJhlw8eWTXmFesXcJnQr3wS2krfeAnGMWxvHUqEXRLVP9roKKEGGml2dv9Z1eKGk633RsvEyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UPP7RpKW; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UPP7RpKW"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so697559a91.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Apr 2025 12:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744052560; x=1744657360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dffV1L61lSKvHP+naQW229RneaojE7BGB9VPXZP7TKc=;
        b=UPP7RpKWc9UxftllU/4JysZ6P0cUc6LDYlff4t/hercnxe8CpQ0ucz0BzkeWUlgjaZ
         VRWa6LDUJisFxVlKNRqDddTN0ODdcNxqkz9On9unv5j8vXlXmribZ5YuumMdpBab2ofU
         TH0oElFw41yHmLGm2akLIC6HXxmV2wscpS6sDVRPctV6hamHHv4R+jt+oRVVMH25z5pk
         pHLtUwl6aIqSaegVAe2+jtzmRhHMwj8wLcEe/dw0uHp33yKXvBX4wJ+PVQjPoI4GxLcT
         EjkavWAfAZvvBAJc+r4Bg7ANIwiW794zcL6gRD/Zc3PhkI1e3rctD6svkf4zFl8KQbvR
         3/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744052560; x=1744657360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dffV1L61lSKvHP+naQW229RneaojE7BGB9VPXZP7TKc=;
        b=w7aMxa2y4/BjHV1ZR9rYDIBfEoFzorEDdqPlIV5KIFDU9nRmfkmp1PoSVM/SRI18O5
         YsYBRqh9xZpcedpVtWJs375DQJD9ZikYiBz1XqIUvWAXfYeBJ//yT0M8nekXTtvWR1et
         393NIoiHYj3oVSNvWZaKKRuIl5jK9eJ77QwY5iUZOgekiaBv+wNWg3GpiKoK15fRdibD
         rImB2HdDFJ8dD9HiFVNhJvcNkqVxUf38b41L7bM5HqgZPq0nTmQsr7AQ4TUyRrS5LWoz
         gn0Y877HQzuLtNSLZtJqcEWjHlMbvBakJ1Lxlu7TaJMTAGCX6Vh0MV/v8U6U3g57focg
         5s4g==
X-Forwarded-Encrypted: i=1; AJvYcCV27Xk0lFW4PveIdQvOgORNYvaArkhVcTDcDhxRvFNJRFNcAjRdVFH4oRcg6Gq6vqGKoQ8IF1EEFxvEyPpL@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb/AWz9GdMtCc9tC3Cbs7tdPNF95n80MZqpf4WpmDbuJHZftNm
	2AhueqvIP2/k7Qc8/RJmgx0otJeJyQA1UQzqyVHKsQ1bWFPQi+k2litguY9iFiPj5DKg5f2wgSi
	r57kdV5h5bn3G+dmymvYPH+lMySuCcvy+1hW6+g==
X-Gm-Gg: ASbGnctI9CJ+uzlGFEM97bCW4jrG3ac0cm/dx4KC2vXJtN+BQOZYvigIhxNoYCJQf7S
	f60mC9MWHUcXBD0kcSJgcRfAaWgpmZJyC6OuNrafZHiL/iRqcZGskyZbC81bV2hl6TuE5BXxo93
	y2fkUfObTQpWWXO2/a5oFXP6PJfNOYwm1QFR9G
X-Google-Smtp-Source: AGHT+IHxiMtBLuE7HFtmvkPpSsjkuRidn3zZS30dHJvwFFeUSCiUjfZOrL88kgkuADRqoBm6z6E9g2rmSll++4dbQAI=
X-Received: by 2002:a17:90b:4f89:b0:2ff:4b7a:f0a4 with SMTP id
 98e67ed59e1d1-306a4865251mr6629267a91.3.1744052560223; Mon, 07 Apr 2025
 12:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504080139.KuphZ8ZZ-lkp@intel.com>
In-Reply-To: <202504080139.KuphZ8ZZ-lkp@intel.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 7 Apr 2025 12:02:27 -0700
X-Gm-Features: ATxdqUH-84qMH5h1xUTAKjO-bNIGNmH02qZY_0CIgwd8upVXFURnSidMpvgLrhU
Message-ID: <CADUfDZpvMAGheJ-k7jTa3pfjuTXCCZPt-iprnfd_HHAfS5+ghA@mail.gmail.com>
Subject: Re: [linux-nvme:nvme-6.15 3/4] drivers/nvme/host/core.c:4302:5:
 warning: 'CONFIG_NVME_MULTIPATH' is not defined, evaluates to 0
To: kernel test robot <lkp@intel.com>
Cc: Hannes Reinecke <hare@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>, 
	Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 11:54=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.infradead.org/nvme.git nvme-6.15
> head:   9e270930d683ff0207fed7f303988a7ad63ddfcb
> commit: a98aa32696a1a19814a2f97853400b28622c6a8f [3/4] nvme: re-read ANA =
log page after ns scan completes
> config: riscv-randconfig-002-20250408 (https://download.01.org/0day-ci/ar=
chive/20250408/202504080139.KuphZ8ZZ-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 9=
2c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250408/202504080139.KuphZ8ZZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504080139.KuphZ8ZZ-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/nvme/host/core.c:4302:5: warning: 'CONFIG_NVME_MULTIPATH' is n=
ot defined, evaluates to 0 [-Wundef]
>     4302 | #if CONFIG_NVME_MULTIPATH
>          |     ^
>    1 warning generated.

Looks like it should be #ifdef instead?

Best,
Caleb
