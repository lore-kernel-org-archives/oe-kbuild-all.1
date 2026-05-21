Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886C1E51E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779339727; cv=none; b=gzEBz0nltQePUdwn8LFx1EXpaVAumSrdQXpcdoDazaBvad+HP4kxqD4tTYHBcKezq32yUKpQx3SOV55B/Qeais/LxkM45V03KlGOKpXIZrXA2X2iabqc/AsNmaPa5PSw3qmyg8H61hMBEnZZXC5+oj9Va4ukvHPbHgelnJ/avj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779339727; c=relaxed/simple;
	bh=DDMEyn5yE7eNG9VUSIzJXFzx2LdOx+fKtsk68jsTm6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oeCtjMRs32KkFW+6UYLyI/cym1G/kvAKOpB2Q5Djb1BmfiE7irkJJBYKqOlIgMr1GcRi/aM4DPIHtU27gRnexwamxxnQdEAQVmF63lo9Ml9v5qVECtVi/9/8yaqvJANshvr2AB6NjI/Sr7weET3iomzmSapPHdgxPhU3N5duL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nnn/JcFk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nnn/JcFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9FA1F00A3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779339726;
	bh=fxAPqYFADqbaIwont5/dMdPBMyJDt478QigzsjjuHH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Nnn/JcFk9BWbEzMMZRs0U5y2EtRHrvkTlEnEmbAPNuZCw870Fg1YnlRcPZd26iXG8
	 tAv1Y97BHlhap4gRJhm6o3g22M1Ne354w2Ahb3bUd/r/JWkQbPhgF0nKEqJDYW8k3Q
	 xLaEfLdDCG3x61GcgOGEo95Ic5l3DoBjqBtsRUbiaZp5VbYvv6oCRoH+LhUX1xviHZ
	 bxqCJKTJ2yOcFcdP7QLkdXa4FdpaHdnQhIUKmpT45LgMkiP24AVsA1G3u9zYH6VMzk
	 OaoWY52+ui1t0DcPN3hxLyFM51ezJUWgEUr8gz5u2XCT05Sj3Cb4fT3/4ibSL9xAO1
	 JGm+oUvyA6Fpw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bce386d5b85so930371466b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 22:02:05 -0700 (PDT)
X-Gm-Message-State: AOJu0YxsDZjh41sWFpDj+3dIzfX86ezZ1DlYUQA0ko2PLh7E/reM/DHn
	0pl+2k2VwI4t5K3ZuLGpG3ri82qSHMtmCUC91dygnBH2SMLP8g5QJSHPOeymRVbo0wSiffGhd0+
	ZU3oja7vcs5ydgWVNNrloE+mbK2FDD+0=
X-Received: by 2002:a17:907:97cc:b0:bd4:a839:9065 with SMTP id
 a640c23a62f3a-bdc1524e537mr52013366b.37.1779339724670; Wed, 20 May 2026
 22:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605211248.DSL7pell-lkp@intel.com>
In-Reply-To: <202605211248.DSL7pell-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 21 May 2026 14:01:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_7OcdxkD4-EQr8fGJv1RtuM3mLP4qPz7yaS4qgQkxKdg@mail.gmail.com>
X-Gm-Features: AVHnY4KLRh2jwgGo8Z_3mU5Zk44WHquIv-G1-_yZLs23QX1StKrGIjrmq-4DSE0
Message-ID: <CAKYAXd_7OcdxkD4-EQr8fGJv1RtuM3mLP4qPz7yaS4qgQkxKdg@mail.gmail.com>
Subject: Re: fs/ntfs/runlist.c:1953:47-52: WARNING: conversion to bool not
 needed here
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 1:40=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Namjae,
Hi,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8bc67e4db64aa72732c474b44ea8622062c903f0
> commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Ma=
kefile
> date:   3 months ago
> config: um-randconfig-r063-20260521 (https://download.01.org/0day-ci/arch=
ive/20260521/202605211248.DSL7pell-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605211248.DSL7pell-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> fs/ntfs/runlist.c:1953:47-52: WARNING: conversion to bool not needed h=
ere
>    fs/ntfs/runlist.c:1961:62-67: WARNING: conversion to bool not needed h=
ere
>    fs/ntfs/runlist.c:1964:65-70: WARNING: conversion to bool not needed h=
ere
>    fs/ntfs/runlist.c:1802:47-52: WARNING: conversion to bool not needed h=
ere
>    fs/ntfs/runlist.c:1810:62-67: WARNING: conversion to bool not needed h=
ere
>    fs/ntfs/runlist.c:1813:65-70: WARNING: conversion to bool not needed h=
ere
> --
> >> fs/ntfs/logfile.c:626:2-8: WARNING: NULL check before some freeing fun=
ctions is not needed.
> --
> >> fs/ntfs/super.c:2519:2-8: WARNING: NULL check before some freeing func=
tions is not needed.
>    fs/ntfs/super.c:1731:2-8: WARNING: NULL check before some freeing func=
tions is not needed.
Okay, I will fix them.
Thanks!
