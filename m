Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEBF14884C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753813065; cv=none; b=R3bxcak7F8fx1iWP7HisIeMg9lz7xMfLurcjY6+hevCjnX2axV/smekPAge4DfmQ/FtByKs7hB9UELf6AY1PpZdPTp0h0q8pcKPLsE5EWwnq8OxGFn0bWZRsbDZdw0suOcJebIp3GhNtX4ywJoKGviHuHaIH8YPOPFPYUIKyb8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753813065; c=relaxed/simple;
	bh=90zZj2Wi/jSSStHprtwOYJEKOACLou5BBOJZbWY93Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ut+zzdZ7wSFVB6NPT57j0mq90nxxeWIqeZG5557XQnBHPekwqPA7J7FiR/vzH+68/62g2wd9lLs0iR5laRkLcBjBjR/poc/eJucm425WqsfWaxjskMThiruxA/GMaYd68XSZrb+Iy1ctZjMQ69qJnDoUsKlIkYXBEWDYnGsfKQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VR6tZZ1S; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VR6tZZ1S"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-240708ba498so23475ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753813063; x=1754417863; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrELFtAsQyNIYUQCqV5rIFM2vQCd45+6wkPo96+Xm4M=;
        b=VR6tZZ1SPzoIOX9QKOtj20Vcz1RSP5blTwuWpxw7ZjHOnl4k6Yw1uUovNMEiMJqJxZ
         iarxWgm2KBBkzY6SHe12FSsPHtMqZ9MSm7CLfbTxRgRGLqqYa5s9/Rwo3gmGMjxRQoVA
         AiQ7mfboVccyvNeoxja42V8oMetkYxERPpCXzBGQrnEPzqRj20wvBhxeoHUg48nYGL2N
         EMceVv0SM1wGIVpL9MhoWtBNNFSomC1CS69LTx/f2KrO6Lj+M8tCspTZjGLOQOHuQ93t
         EywvahG2x2L1A62dKcxcKslRXZO9E5GzYLGzZV4bUAjPteYMxE5bzilWSUVlz4SeZtN0
         gV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753813063; x=1754417863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrELFtAsQyNIYUQCqV5rIFM2vQCd45+6wkPo96+Xm4M=;
        b=Ldzq4HGMq5GrXw9zlOCJTXnZXQUIDHD81CHE0Co9CNcF3YJ7CChO1VGGj49OoDvDh0
         Xz8sjr/K19KlxsrND+8u/BspFowGJsXEDFX6Ftm3Aox/vj85+UhEWL1Ashpph7W5Vtrc
         /oZQZ4mMUYOqIb1lUlRmKnaIIqH3eknm7/O0J4suOioQWCPcRCrMP3AqyRBGgQe1GaHR
         89PGsftxZU5aobcsT3FMqtJHkd6k2IBCNIufXUKtFa7XUb0/W8xLjpYZTyXG68rkQ15B
         EczZ6ELo6HO7XZJoEwN6JQ+5L5EFx6LB2oDrfhD3SPMYTZKGbUi0HRmytz/oAGtoesdn
         M7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWG8uKGvU/6/2LaT6Qs3oD6pCxx40SbK/qF2l1mAJZ4x/b+tKQuFiO5UD8ugeocVzz2DpQCYVLyiVWKK5Id@lists.linux.dev
X-Gm-Message-State: AOJu0YwkuoAa9XwxdBDfXo7Jyk/dhVKLi5BLLAd/Vb6CL5Ovpt4mp/te
	va8ch6xEFAz9NalxjQovkE+l4S6LYbyGSi9x6yksa3U5gu08rZZqfrDfcvtiPjamU83lNS3fg+d
	z3xQTMRKqgg7esbw8Pltd0S9hcAOHWV/qfbSxRhOl
X-Gm-Gg: ASbGncvM8YT2hPXeQIl7zCbzwRyBYFJQVNNuLCNBKl4nsROodhJZyn4ZHvdE9DKNPRO
	+zSxyIW/wTMV2oHfIrtGJ0cV82Ot7lOrPqcGgH3IJJZGqWu5YRGgtx+DxT3dZdZeZOTxuZiUp3r
	iXJedONjlDhnpHnShkuyBrF/StGfzEkLVRxKxirv145iP9hHVlZow7Q1gb+JQKufjMJYEHaM6j0
	t/v
X-Google-Smtp-Source: AGHT+IH/JGiXh5XiKWwlu4CDnIGhqRo+jwrPA9qHfnd8CZIjwn6cTGQgk7e/thnN52vXlk8rPFqbbZX1d9enm1CVFgo=
X-Received: by 2002:a17:902:e80d:b0:240:469a:7e23 with SMTP id
 d9443c01a7336-2409a044697mr269765ad.20.1753813063049; Tue, 29 Jul 2025
 11:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728202656.559071-7-samitolvanen@google.com> <202507300122.RpqIKqFR-lkp@intel.com>
In-Reply-To: <202507300122.RpqIKqFR-lkp@intel.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 29 Jul 2025 11:17:06 -0700
X-Gm-Features: Ac12FXyTkIKUF3oE37TmSDCsrlZi0YemuCpY3RAC5JJl1HoxExctdyr3bgTjL2E
Message-ID: <CABCJKudjiU8KZoBa+0k9ey5ccPp5E0JhUc5n-DRKbOamSO==VQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/4] bpf: crypto: Use the correct destructor
 kfunc type
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 10:54=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Sami,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 5b4c54ac49af7f486806d79e3233fc8a9363961c]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sami-Tolvanen/bpf-=
crypto-Use-the-correct-destructor-kfunc-type/20250729-042936
> base:   5b4c54ac49af7f486806d79e3233fc8a9363961c
> patch link:    https://lore.kernel.org/r/20250728202656.559071-7-samitolv=
anen%40google.com
> patch subject: [PATCH bpf-next v3 1/4] bpf: crypto: Use the correct destr=
uctor kfunc type
> config: alpha-randconfig-r111-20250729 (https://download.01.org/0day-ci/a=
rchive/20250730/202507300122.RpqIKqFR-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250730/202507300122=
.RpqIKqFR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507300122.RpqIKqFR-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> kernel/bpf/crypto.c:264:18: sparse: sparse: symbol 'bpf_crypto_ctx_rel=
ease_dtor' was not declared. Should it be static?
>
> vim +/bpf_crypto_ctx_release_dtor +264 kernel/bpf/crypto.c
>
>    263
>  > 264  __bpf_kfunc void bpf_crypto_ctx_release_dtor(void *ctx)
>    265  {
>    266          bpf_crypto_ctx_release(ctx);
>    267  }
>    268  CFI_NOSEAL(bpf_crypto_ctx_release_dtor);
>    269

__bpf_kfunc_start_defs() disables -Wmissing-declarations here, but I
assume sparse doesn't care about that. Is there something we can do to
teach it about this?

Sami
