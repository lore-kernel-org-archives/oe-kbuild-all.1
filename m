Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C157321A455
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486959; cv=none; b=Ofvq8MIuQzJkL+gyw9Vc0X28kglCWuTNDDTOp68OkUKQFc6PLh1EdfzChHyDst2jo8Y6bgXaVGU8jMQ9fwd9aOxpkUMKO/EKmLP8wCouAOM6ccDKL36+b2ik3oFf13M+HzZXTCTJLZIjGjFNUR9RRw13+65+G+hO4X5HiAryFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486959; c=relaxed/simple;
	bh=NtLJV4p5cJuBKb/UudIAD/NwyNwxAp2MkYQ5AO1pYDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgBBkWiw1siiutt1y6F6/LAyLhUegNeZhjJurNySvIJjAsGAa9Gllb6xf9+9AYWhOJErQGXgXqXQApbjor0COdq7xaun/dH2AmP6lkVFdm6J+UUZzexCrFKSqLiaD2HuMvtcqM1U9x2pwQDlYBjSAT7mXaBBrDwCsRnvGmh/D2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rh+jVaA7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rh+jVaA7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2348ac8e0b4so360565ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Jun 2025 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749486957; x=1750091757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8riTLpg7FvZThdG4JrgKprebdHeRkr/r4Dt6E/RTpA=;
        b=Rh+jVaA7S9M/tJQp6U0f9zGldaLiEfwCFyTPqRhTpS9o1SIYaQO17p0rQsLkTY9Zsk
         9vlc/ApkVQO4QB3bF3pD9UQS9T1vUJcmetBKmOmUeB/EeB7fGZeRHDo2QshlGi9K+X7L
         NQE5qvDWgvXCtiOyf7bUdSwNpd75BDF/LdiwEGXC7PWq+h9fnHIaDPoi3SI8uhMlIYqd
         Uj8B7L9+dHNssb9KYgPbT+pEIJwRYAjjjEIlTNI29k+mrcrPLsNYdMEKUH6MRfUM+xj9
         8lPPgOi2+0ukfeDbzrbgV1Cdv+Tmep3gWEX/bs1DnQSEFi1bF+gaunAvBbbtHMKVgCqL
         Ur8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749486957; x=1750091757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8riTLpg7FvZThdG4JrgKprebdHeRkr/r4Dt6E/RTpA=;
        b=sQqLXVCUXm2VgLDqHYzzLPaL+y61vaYBGkmZilaP+uDNbmO9rA9KLPk0eHpqFkc5S0
         rVUaiCi+KU1KdkXLhW7W5Qw7zwoqHEJzhKeZUbT2BlX3tQexFvOTfZL6/Vg5lvR8r7l3
         gtqgrfr4zXR9BQB1gYzFwJJYdtLw5H6Ex+DYc50G7jw31x+kEk16n0SRHrAEl+C0S+0u
         KJjrbrRVImQ3+36na1KibUp8pmXgZHRcCc2PpxOpvZhaMX/XLC5k94UQRulNZnJZycd8
         teAUeL5ZngP8oNk+83liX9BmJcDQC/IxDTFulvOgHZXmxyhKXTG6N7w7uetZWvv4gMlp
         XvXw==
X-Gm-Message-State: AOJu0YwSwzTjyiGp6YbVP5dkbqEeMuqefJS8Dldb018XiJwLEdYMRXUs
	2DInGwvvlzBoseQ0tIJ30+E/rXpDmGewQV91ZwHxD6lq/uQv1rx7VPECGiK4HfVxPwETgop7vnr
	8O8DZqYpcRAn2pvayDILJmcY9sqIecpvicVY0ky2z
X-Gm-Gg: ASbGncuPt/18DuIkl+7X/ejnJOsy8GNbQq6boDyHATxrwdpnmDuvTRHwVgUBejCANBI
	xe5AqxDQEbN0nfhPapP+j2Kfc6NK1pSMjtTZounhExMHpIZdaweOMD8RxGSsexiSNkjWkLuwVQu
	DUxEv2I5XDQtyt6jJiYEqLhw/FPpZ+WYpLFTYvSaK8
X-Google-Smtp-Source: AGHT+IFJ5uam8zat74sYve4mZID4y763DK2+CtglvFbT2zh3Cd8CNhoO1omPHbpqnaUawe9izeWgEgBfeojCRauEmGA=
X-Received: by 2002:a17:902:ced1:b0:231:f6bc:5c84 with SMTP id
 d9443c01a7336-23611fcb276mr5163365ad.8.1749486956755; Mon, 09 Jun 2025
 09:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506091622.dOo1Na3X-lkp@intel.com>
In-Reply-To: <202506091622.dOo1Na3X-lkp@intel.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 9 Jun 2025 09:35:19 -0700
X-Gm-Features: AX0GCFtYOpDP97Lv9FSFuSYflyXsuFsU-dfE8d4vEcVJeWM_FFJyeGYsLbKufJQ
Message-ID: <CABCJKufNv+suE+B2as71y8=sF1kxNSL_zcq3GV7o5GxTRpszHw@mail.gmail.com>
Subject: Re: include/linux/kvm_host.h:1908:24: warning: field 'desc' with
 variable sized type 'struct kvm_stats_desc' not at the end of a struct or
 class is a GNU extension
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:50=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Sami,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksym=
s as an alternative to genksyms
> date:   5 months ago
> config: s390-randconfig-r132-20250609 (https://download.01.org/0day-ci/ar=
chive/20250609/202506091622.dOo1Na3X-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> reproduce: (https://download.01.org/0day-ci/archive/20250609/202506091622=
.dOo1Na3X-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506091622.dOo1Na3X-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from <stdin>:3:
>    In file included from arch/s390/include/asm/asm-prototypes.h:4:
> >> include/linux/kvm_host.h:1908:24: warning: field 'desc' with variable =
sized type 'struct kvm_stats_desc' not at the end of a struct or class is a=
 GNU extension [-Wgnu-variable-sized-type-not-at-end]
>     1908 |         struct kvm_stats_desc desc;
>          |                               ^
>    1 warning generated.
>    error: gendwarfksyms: process_module: dwarf_get_units failed: no debug=
ging information?

The issue was fixed by this commit:
https://git.kernel.org/torvalds/c/173767c218cc1da74704e7863f165ac8a9796f3e

Sami
