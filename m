Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE341386C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 18:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738348149; cv=none; b=Uj7KJ5tlo2e741Aefq/e3r4dz7gn4XA593DE5pGiWLWxMFLDwxMJ+0aboFZnneJZWhix8i2M4ZNFJgHxpooao3rd4AlTy/h+8mgBalSzfeaJGtGHfP8yEbSKQ8G58RWMeMhaL1opFk+ljNweLKS7HWToSbi9Yzzk27PYdrjzKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738348149; c=relaxed/simple;
	bh=YdjlFAsrcGQ26BSKgaZhD+BxiPeTtiWes45nY7CAA/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DeKdYrN3LEITHnttZ0yKvuct5B6SbprSD0cOprUGv4GWPiRtfy15+ZYbcnOqxD0ppBDo217OtDzjWDj4xyKEIAo/Z6xWsLBKZiGl/5k/Syg5E7zIaHUbRHuWsFBk2eNmWF0RGdY+v/E/RilVFSE7IqYbQ74/9ZZWfYfZmtOe3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zO28ueS1; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zO28ueS1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679b5c66d0so11991cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 10:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738348147; x=1738952947; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IrKHH80HpXBW1gceMbXyu8qiKn7SQd86zNENky1rqg=;
        b=zO28ueS1Deoso/QiyGoYtZYES9MDGmFK34NB7KgxphgJQwF9TNLQwseuxb8/Y2NzKg
         bcTEo7/sHBEZKavNmtNsbQnRGTYIRiRa1E5w+yeDDgymmN5vUklFm8k1VW8YxWGrH5e8
         ns8QONn+fS6RnTa2WRlHFL5d8BNiejvuXlPEReNmH/7rsEIDpgRnHE9a+UFN0azdbe2L
         iyinpg+7e/EsQZE16EXUHIlIJfUwVfIfXAIaYGxaf13ee8Aw1HqhZBJkoOeLqsloBMfU
         EX/3QjT5RfAgPC2lHs7ciH2jITkkwONNq6vqY2/QUZn70xZLwMOA+w6q2iN0iN1/tYa4
         3kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738348147; x=1738952947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IrKHH80HpXBW1gceMbXyu8qiKn7SQd86zNENky1rqg=;
        b=bKOL9Zop+Q3nBBiG6V6ktQPlCvLUoxyPSBbXgZSWmz1UafJ/TxWQUhctymPsJHyBIQ
         ZFhmhn5VjZee1jETJuj2z8JvXUzESENXm07i11d//W2AbIZwDzIJ/IX7kfrrtHkHpsiG
         FZhVCU22uT6TJwE5z6Gto8FRAM3bezYvzsC4FFPZ+TRgHIuZEkcIsm/jqw2EM8YW/RfG
         L4/0ubbU3m0xpgCZfcL/ifWOzOkkXB7IP284V/raSORtgVLXgZ5/7KDFo/1qJZnkRG3q
         EAb6t22JtzKWMFY9y+GmLbrmWQX5Vd5yolqlT1okIWu7MVJhJlSXYj9uqidY7Y7ZuiCL
         0Rrw==
X-Gm-Message-State: AOJu0Yw7qc3VQwKhP7PkFttuZuIBpeySBrpFFWKqA3DtbWI4+NPGPcv4
	RiQCN/ctx21GUrb8MhGgW+v/T9SP4n6EpiEmQjv32CBKq/W0xkAJ1ggi75D/iQA2cwvgVQocTuz
	pCjZ1wpWOkGGc9XaswAHh4x/uIoTIa6bIZE7r
X-Gm-Gg: ASbGncugXJ/GN4tgY2A0f5dWm578m/1S9DmamZ1HDqaB1PQUXYTtm+JEF9NuQcbyiYC
	8QjeFLlNM7TDR/U5c/5DxyDKL3JLfxfalsrNuCGGObfQZiNvh6V+3BMdvMhZPFCPksTJ1Vg==
X-Google-Smtp-Source: AGHT+IE5MVmsNXC3+6fe6wuKlpW2Al4ZcSTnrQYlu8f8CrSjtfDO3Tc0kzj7tneNGmuao2NzrvBhRBNHPbZQqEiCzm4=
X-Received: by 2002:ac8:7d45:0:b0:467:86b4:4e92 with SMTP id
 d75a77b69052e-46febfc24a6mr3289101cf.29.1738348146911; Fri, 31 Jan 2025
 10:29:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501311653.mOxDNCYy-lkp@intel.com>
In-Reply-To: <202501311653.mOxDNCYy-lkp@intel.com>
From: Frank van der Linden <fvdl@google.com>
Date: Fri, 31 Jan 2025 10:28:55 -0800
X-Gm-Features: AWEUYZkujjBrYmU_4RPZlquLnHW9WAAYN3iQOY9SgvzDho0SwyxxackSw4vfoI8
Message-ID: <CAPTztWaG1OjgQ7Zj2SHXpYpPzJ1+LJQW6Le+wwKdRP2VZwg6Zw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 71/88] mm/hugetlb.c: linux/page-isolation.h
 is included more than once.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ack, will fix this one in v3.

- Frank

On Fri, Jan 31, 2025 at 12:39=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   495206a68b359eb6117d0860861578113bbb94e7
> commit: 0dfce6b46bf52a9cf68a600eeac4eab00dbfd554 [71/88] mm/hugetlb: set =
migratetype for bootmem folios
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501311653.mOxDNCYy-lkp=
@intel.com/
>
> includecheck warnings: (new ones prefixed by >>)
> >> mm/hugetlb.c: linux/page-isolation.h is included more than once.
>
> vim +39 mm/hugetlb.c
>
>   > 39  #include <linux/page-isolation.h>
>     40
>     41  #include <asm/page.h>
>     42  #include <asm/pgalloc.h>
>     43  #include <asm/tlb.h>
>     44  #include <asm/setup.h>
>     45
>     46  #include <linux/io.h>
>     47  #include <linux/hugetlb.h>
>     48  #include <linux/hugetlb_cgroup.h>
>     49  #include <linux/node.h>
>     50  #include <linux/page_owner.h>
>     51  #include "internal.h"
>     52  #include "hugetlb_vmemmap.h"
>   > 53  #include <linux/page-isolation.h>
>     54
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
