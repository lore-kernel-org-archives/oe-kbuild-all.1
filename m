Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705D2F37
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 01:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709776571; cv=none; b=V/ss1u3Jwc6TFKFKu5s91/CpRLW20hyE+J1Lg+BtT/fyOd4pKZI8d5bYaSVy5xCZbaAoxS7m3+k5ajHZK89Jh9FIxqKsumlSnaYWdQvgDyxiCjYYApuFXoHBX3GxTWaS0CJvB//0turw2MnQqavy/75NoKdxHIm/LHT/qbKtfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709776571; c=relaxed/simple;
	bh=VJUJnvLfVvyKSKkT5xGQj+7pMBPdjp8e6lA6dXScnJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CA5r3fm08zF1/QswCHNNcbtmSxdPaZcih8YHmMbek0cFGyBF+Edg8lNe57qj0XZ8Y/ZaV50dFfRXGVJsNa6tp6qfCQ1Tyh8apisMLGdHGYWz+ZYfp7B9jZ4xghboWcFvsmBzS32r1nCciULvjq8KOBDdBgV/XYev7enU31WyeKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwQSx+NY; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwQSx+NY"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c21a3120feso115204b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 06 Mar 2024 17:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709776569; x=1710381369; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrL+Eds0RkB/v9J+ibfSxhNuIVdoK44X6cQ1PcgU1X4=;
        b=ZwQSx+NY7WN+To8y8BFzCvAqnodydpFaIs0bGeGcPaPOvnaU0AlZFcjmbrxV6USAuR
         hNNsnOF2/c6l/L+IBeXKyOEYaW+RUjoRWJrK39cuZaNQRjigoX+GAJE58Gy6IadumJxB
         vJj9AoC/HK1w+IdK3u7SZZc+0flhylBwiDe5QpG+7oUtOigCCq5uoD3JNKNpZVGWRh4W
         rlAJNbLnRlzeLqI/UYKGQdhP/TrFu4zx0wUax0WyWQQMXasR5BKJHfnLMfVPEDTLApVH
         otZ4O4jD75aHedSnePDzFi5YIQWnrenEtT6Rv7bB5iPf3PRIevuP688V/yAA+t+3Satl
         wFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709776569; x=1710381369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrL+Eds0RkB/v9J+ibfSxhNuIVdoK44X6cQ1PcgU1X4=;
        b=pSgIEXfVvCLTMi/ExhLQQ7p0QerFHOWHuQlhZ6Yz5ijK4lYLW4Rbno7aDDr4TmGiAE
         IPjv3vAXewyYUOqnER1u3GrTATnlNZ4YE5kvnuEpbAY1tV2Y+H34snys2gN/1U68JSFt
         U0ga7p8808dMdUf5H5OSojfFCRveh8W0nrQ76GhQagxTkYfZip8MRSyj02JFfUu9XfiQ
         SlYqNsFOnTgiNTY0Wd4Qe+zgKfUcxidGwBpJy/9xdON7wcj6V7ACfksu0NbqJcqGq5dz
         gIzRs3depKrYBn3nswno2EiLXaQlDBudIzLO4FrZaG4UvPdDx4I/dTlfqV4JMVJBwZE1
         Toew==
X-Gm-Message-State: AOJu0Yx4Q8UJPbMpODIwmeab/xOzkA17Fgt6UXZcvk0hMUcBe45SdTnf
	Se5sykNnHlcwqmTr2gLef1HOY6pmax4ER6tgpph9rRUosdAAIjVCIycgY+Yn+tVm0uerhd6o1qC
	jehmGI8GH00sGvcHqM++/EfFLMQU=
X-Google-Smtp-Source: AGHT+IHIkiywTckH06ThzTwAted33QkhUVcPurSBEqP2Q96IQYA+ttlN/68BUFLZX4vDdz8oABiMtMn/sD7FtKqXxtQ=
X-Received: by 2002:a05:6808:614c:b0:3c1:f61c:a1d with SMTP id
 dl12-20020a056808614c00b003c1f61c0a1dmr6681615oib.47.1709776569395; Wed, 06
 Mar 2024 17:56:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403061307.f7nX2Ma5-lkp@intel.com>
In-Reply-To: <202403061307.f7nX2Ma5-lkp@intel.com>
From: Thinker Li <thinker.li@gmail.com>
Date: Wed, 6 Mar 2024 17:55:58 -0800
Message-ID: <CAFVMQ6ThBWmoSEz==zVH_MvXq+=yvxO5XZJSLUUqJV+kVeULuw@mail.gmail.com>
Subject: Re: [linux-next:master 8264/11963] ERROR: modpost: "__fentry__"
 [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Martin KaFai Lau <martin.lau@kernel.org>, sinquersw@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am checking!



On Tue, Mar 5, 2024 at 9:25=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Kui-Feng,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   11afac187274a6177a7ac82997f8691c0f469e41
> commit: e9bbda13a7b876451285ab15fb600b809e5e2290 [8264/11963] selftests/b=
pf: Test case for lacking CFI stub functions.
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240306/202403061307.f7nX2Ma5-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403061307.f7nX2Ma5-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: Module.symvers is missing.
> Modules may not have dependencies or modversions.
> You may get many unresolved symbol errors.
> You can set KBUILD_MODPOST_WARN=3D1 to turn errors into warning
> if you want to proceed at your own risk.
> >> ERROR: modpost: "__fentry__" [tools/testing/selftests/bpf/bpf_test_no_=
cfi/bpf_test_no_cfi.ko] undefined!
> >> ERROR: modpost: "__register_bpf_struct_ops" [tools/testing/selftests/b=
pf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
> >> ERROR: modpost: "module_layout" [tools/testing/selftests/bpf/bpf_test_=
no_cfi/bpf_test_no_cfi.ko] undefined!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
