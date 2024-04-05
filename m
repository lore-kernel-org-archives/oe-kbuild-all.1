Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2887DDA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712277215; cv=none; b=e4mEAtM3QA8FpyR7u56UDzFl0ktfYWsv5/tfDBrJdtvDOPTRv4y6EeR6IutaMbiXEEEp67e+wKy3Rliyy79qTKh9qFvLVA/t/8TNa4bsPdh0APiXuP7Gu8Q6y9bkUwAr1P4zienmtuUphhLMIIOAnwoLvvmS+0cWvmkpwpaNjQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712277215; c=relaxed/simple;
	bh=3f0T7zGmf9+14j43HgQiZN5rnEWFTw71M97ZXYkXpqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3P2Q2yB9h3gwWMFQGD0InKAae7WFD7PhR+KwFsm0f0doabUpbLwAzd7hKuHCx3mGrVmLGRO7Ea+aEwhWxo3A7HyS4o6+HF7nux6o2krDO39jyfM6kQJrfY3SqlhZkmGph+ItCvKIA2ZHUBQYLTErspe6EU5rJxGlXyQ57qOrtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HM4iljlE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM4iljlE"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34005b5927eso1048951f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Apr 2024 17:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712277212; x=1712882012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CA2s3ES1+QW1vJJD5jyz67kb+6aVgEEoM0JPi3P3WY8=;
        b=HM4iljlE5hovavn3hj13jcPpZjQ9M7qeNSpwnQibh4qJ8d/JyoWAdYzDrdgoShLjMG
         Plv0X0XSiXifoU3r39t81kCogkRDKPFW9uB0XWwWJ0fkkKzyU3n+rKwqqnE8ld/7pIJC
         c967oMLnGQhLseGOPgqOOwHFaUBgRYcawzASayiNZWV4zWzCavbhiUetVEm0arAzaTnX
         BactPJ5u5HESrcDfdacxXych3U1Ezt8zeh3Z4mkueF2tFsuubieN0QwJ1pVnPUEjSc9w
         XRYnQlAgJxT48y90oi8sBVt0LyEAh4DHrkINDiNxEvM17Xcy4Epdj2TY0GTBK0W9Nz7x
         g2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712277212; x=1712882012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CA2s3ES1+QW1vJJD5jyz67kb+6aVgEEoM0JPi3P3WY8=;
        b=UVC3KhsxrKXcYwoWBmTYaOYTOwv9VYhlbJ1IkyQTXyKlAdQKbs5HVzSTEKnsmNWuQZ
         XQbNkVvfX+Kbp+rMfApqFo7V3dyYWFEwWR0g7JPxP/fxysRUafAwejQiy18F5eFzzl6I
         ZWbUzAWtnNhUKYPxOaq44SErVZnQI20vl9DHNunCYOBIF8UGhVfQp+TLKY3tE/N/kuNh
         UE3a5G3MUAmNoglLiLjiQEV0zsJV1KKK3Rhq+i1/AYseMhxgd43GWk/DsFUYCcJXnWZp
         W9ISItBFx609m3AE9JXOWaotGeGCJzE98/lS3Q2+45vpunp4wkpQNKPT8gPONfa98ZdH
         129A==
X-Forwarded-Encrypted: i=1; AJvYcCUDf2a22Llt23frfiiYvXb56oyDKke5cfkhwdPb2TM1+vnjQ5uXl+nq1bWv+JAHQCGVMAZpTa7ZFcyrh7kVAjpaVSv6w19qrDp+d0Jbvw==
X-Gm-Message-State: AOJu0YyofBrd1XkhNDQsZjnb16vXefNpFJHgzNnYIq4+hOMJhxV4a3lS
	19yJiMp9V7ahez0M011sG5CdMTZcQAkDeMIDDPXLOa98wgAyN1zTsoNPwfQ8WqnBtUdhPav6PvQ
	D2ulBTmSmm9YIcG0kXydGLg18BXULeQ2fKzI=
X-Google-Smtp-Source: AGHT+IEQRD/RfsHH4TdCUOOVS5ZyHHzsk+oMuueJQFzj2GdCpbwNPNuvBvGK58TBnIjB6vvlBILCB0ZX6Kmp8hJmE2E=
X-Received: by 2002:a5d:4089:0:b0:341:751e:49b2 with SMTP id
 o9-20020a5d4089000000b00341751e49b2mr2794345wrp.32.1712277211785; Thu, 04 Apr
 2024 17:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404050810.gBFtCbIg-lkp@intel.com>
In-Reply-To: <202404050810.gBFtCbIg-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 4 Apr 2024 17:33:19 -0700
Message-ID: <CAADnVQLahaPHsC8W=mvc9rtmp4xrzHGX_9402px-ovm-OkV1hw@mail.gmail.com>
Subject: Re: [bpf-next:master 1/3] kernel/bpf/verifier.c:19160:44: sparse:
 sparse: cast truncates bits from constant value (ffff800000000000 becomes 0)
To: kernel test robot <lkp@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 5:27=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> head:   f91717007217d975aa975ddabd91ae1a107b9bff
> commit: af682b767a41772499f8e54ca7d7e1deb3395f44 [1/3] bpf: Optimize emit=
_mov_imm64().
> config: arm64-randconfig-r121-20240405 (https://download.01.org/0day-ci/a=
rchive/20240405/202404050810.gBFtCbIg-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240405/202404050810=
.gBFtCbIg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404050810.gBFtCbIg-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    kernel/bpf/verifier.c:20219:38: sparse: sparse: subtraction of functio=
ns? Share your drugs
>    kernel/bpf/verifier.c: note: in included file (through include/linux/b=
pf.h, include/linux/bpf-cgroup.h):
>    include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
>    include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
>    include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
>    include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
>    include/linux/bpfptr.h:65:40: sparse: sparse: cast to non-scalar
>    include/linux/bpfptr.h:65:40: sparse: sparse: cast from non-scalar
> >> kernel/bpf/verifier.c:19160:44: sparse: sparse: cast truncates bits fr=
om constant value (ffff800000000000 becomes 0)

Huh?
It's (u32)addr; sparse should know better.
