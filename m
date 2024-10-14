Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE11ABEA7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728936849; cv=none; b=aEdFPSJrtIBwyqLz6qSCorvm8imsUnIvAIgAsTuhTjWx8NBX9CMcWZQYiHaAOiWzOAZEAzq8nFnbxJqiWkWhQhPfNu1IrYkqzgbvpjHoaobCb2UNVzuylO8eSWNvHmeLiE4Mir47W6q/yKN8qpBYJl8vwvAlWnzgZAzoz/2MWts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728936849; c=relaxed/simple;
	bh=2duR3Up0Fn5AOkwt8Y3KyMWalTj1cYda1NyQh+hNLQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxrMssbqcBv8hSFxF+nBxzyb6LGiT9H80mZLHw+nLN8PYSKt4mo+rMGiQYTlkz9fbU9JNPLAX0z5mNCTZVzFp4OWxSf2EFYBWcfDybRlSLCebqn/ElK19O6pgRJ9Y3XFv9u1d6mJ6Ap6xXT6TwncvHRdNDeKO1x4hvvuALEC6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ley9PRSI; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ley9PRSI"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso3847099a12.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728936848; x=1729541648; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFfdktb8rvun4C2wfO4YRLva+QImGAd9cuW+Tla0apA=;
        b=Ley9PRSIBWLRYS9Y1b6MzPM85+gG5DWipxo8sh5dmvtWEyPbZk1TlsUjaPogtYTODN
         wi4lmfvBs6DFmZjRXRP81DC8nXrKUdpbjxshUwzbXz/8/0YFbEKc4bmcFhyTF+oKqaoi
         wVd7JMJRMM5ePW6Lh6yHLLrSmQMrQzTDj8+Xgtw55frwEPBjRe3VBF+oRBWUKlExtxZp
         Gojv6yzls0sVU4vwvXpInzQjAczDAYA+lmG3AfU+ia29LLARNlbU9Lm493889QkRNOPF
         InARLr9BxDkrtQds+HwBchf3iotj5oKCEDKnVFkLoA3+5Bf6xcdpyobZppgOT+E7oD2m
         5LSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728936848; x=1729541648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFfdktb8rvun4C2wfO4YRLva+QImGAd9cuW+Tla0apA=;
        b=SKxvBT7zL0gjA4B5EKvny3j12KGbNamhuDwhzPgozrgngxf2ZeL1V5G9A6xf+/2I3M
         qMjaMXaPsubicQUMp6SQHgAASKEK2XsxhBGLZZn5jrrbsgLxsnuSyhostB+AMiGA1bUx
         f/9/mn0xOe6OdKl1qrwPvj92uNSCbl+ZIbuNZ83Uuey42reUMXY86QcgoOPtSN/Uc2QD
         JqemwrvyfrhzADBV+qrnwAGtxhezllPK3c6MgUbhSPiy/CbCZAMo0TZYTDP3RE2qNWkZ
         0ZxWZC/miaDDd1jbOuYTYUJL5OQGqFmKq4PPS9GpAhIRRvRclACgmd1jbGYSpfmVQ54G
         s8tg==
X-Forwarded-Encrypted: i=1; AJvYcCVRlDCRpr5U3aE9WBiSWjm4dXRrel1lFD3DxbpCKwYAJgKjC5NzExpLHng1iYRmC8Mwd2BHdDu8oqhj1Sax@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlen1QjFVQnWlcaBxZFsgO6YFHkriho9G9BtjINKp9YsrCM5m/
	3d3hzzSEbFl7v1SiuCmvrUICONbCECkZPih9vg1CODhtY5VqDymn9ufzPgFQF4WlTMrznUbyezJ
	xtLd0Kw63aAGI6ztf61WXJ8xJn6zY3g==
X-Google-Smtp-Source: AGHT+IGf5MMcJ2y8qfgoEJL7bFDS/ZZdYZAzuWh/eyTLLRCFeltSfO1qVJVuLGKhHCLCOPuuS5PiKfOACdNpMayGFtU=
X-Received: by 2002:a05:6a20:2d22:b0:1cf:4fd9:61db with SMTP id
 adf61e73a8af0-1d8bcef1217mr22175364637.8.1728936847787; Mon, 14 Oct 2024
 13:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410131412.5csjqw8L-lkp@intel.com>
In-Reply-To: <202410131412.5csjqw8L-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 14 Oct 2024 13:13:56 -0700
Message-ID: <CAEf4BzZ=Rf+-_SSbtL+wZkX0XPrCfh3FBUCnR21qENAh0YMcFw@mail.gmail.com>
Subject: Re: kernel/bpf/token.c:50:6-27: WARNING: atomic_dec_and_test
 variation before object free at line 54.
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 11:58=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   36c254515dc6592c44db77b84908358979dd6b50
> commit: 35f96de04127d332a5c5e8a155d31f452f88c76d bpf: Introduce BPF token=
 object
> date:   9 months ago
> config: alpha-randconfig-r054-20241012 (https://download.01.org/0day-ci/a=
rchive/20241013/202410131412.5csjqw8L-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410131412.5csjqw8L-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> kernel/bpf/token.c:50:6-27: WARNING: atomic_dec_and_test variation bef=
ore object free at line 54.

Can someone please explain what this means and why the code below is
broken, according to coccinelle?

>
> vim +50 kernel/bpf/token.c
>
>     44
>     45  void bpf_token_put(struct bpf_token *token)
>     46  {
>     47          if (!token)
>     48                  return;
>     49
>   > 50          if (!atomic64_dec_and_test(&token->refcnt))
>     51                  return;
>     52
>     53          INIT_WORK(&token->work, bpf_token_put_deferred);
>   > 54          schedule_work(&token->work);

this is not "object free", but even if it was, I still don't see the
problem, tbh...

>     55  }
>     56
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
