Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CAC48DA26
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867956; cv=none; b=dtaHXTcCgZLzDIKUiMnMVKZkwkze0fl291owjD9FffHH8x+N5E6V7UloJIs0jakYGquIa7JDqSJxRjVfYpusDehfpw9pp2f8Pl5OZBU0cAaIOzheoDuSKgFBj+2SJ2XJHf6dJttkZY/3MK8VyEHcoVg1MJi2JdPW3oonTYD6PyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867956; c=relaxed/simple;
	bh=lHOl0cgJQjAwdFIFFq7Bfk0hvkj/+BY6KvapcV3Evj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRLrA949F49DLPGAC3YF9/TGm1wz4ahxxoiLoCM6R9qe1BF+yNBBrIeqyb4nFY0v+XlwmhJQYXH7Djqxsr10NdgzW7I5Ryo2T4IyH7KFycIvs46TtBxurXpJnZe3F4wuji4GsE8RX5Xrjs6r2ZfTvYdRjEuud2vwrCNsL+iXUpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4QxgAlo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4QxgAlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656EAC16AAE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767867955;
	bh=lHOl0cgJQjAwdFIFFq7Bfk0hvkj/+BY6KvapcV3Evj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y4QxgAlob5jegiGJX2dkiN5JAxgMAXtlHYgqY5cVpDrwEN9GosYse/GHZ52quymuT
	 Kwxp1hBgej0vZeOgz0vy0wK5jtybCgvBnWYd5H2NVadKOlEHCts5m8WMuhh8+dhHDL
	 TsPKTfyINfHBo/nDxQTxEk4AOLdy3U1NrzDB61fN/tgl9M5FktbOPuuuM/1C2NyYPb
	 rfEmwDcagUnh7tQC//KIuA86VRBcRDX9WmsGSUD52czge3bqfsikjXkGcU4f0MkBTG
	 NF3deqwVkE4jLq3uQsssqBVMX4syIfVu19+8BFcOnip4HX6trbXFKsm1l/DMxrcxfw
	 44xh87zfsnalQ==
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b98983bae80so1588972a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Jan 2026 02:25:55 -0800 (PST)
X-Gm-Message-State: AOJu0YxfYf9/93kF9UMfia1Wf2lpi3C2zAhPS9+Pmsk5FZt6wxqALKoN
	8cnYB80JMSCLir4voNs3CHH6IbpXzx+bse2imrZOn0KalifqJgVD0vMkzR5oq4qNHh9iQPGFdvG
	fZmwNGN+MJQVOhzinFvkfBn4QOjHtYCs=
X-Google-Smtp-Source: AGHT+IGywNNb0vG7UjZQ3NCHv8BzhT3DIft64K6SqFXBm+7wQ+VXL9wv9norrxxIzWeBqAcgLKCmjXKEm9RmvwmcfAc=
X-Received: by 2002:a17:903:2292:b0:2a1:2ed4:ca1e with SMTP id
 d9443c01a7336-2a3ee4b72e8mr51132045ad.34.1767867955005; Thu, 08 Jan 2026
 02:25:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601011320.wfOmjyKl-lkp@intel.com> <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 Jan 2026 11:25:42 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
X-Gm-Features: AQt7F2pglsWsn4t9WdCqKdzCT0UNqdzdBIBDxc9l_2-P9_wwxBUzypKBAZOMrLs
Message-ID: <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Jan 2026 at 17:03, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> This does not reproduce. Where are the build artifacts?
>

I kindly ask again: where can I see the build artifacts that produced
this error?

Thanks,
Ard.


> On Thu, 1 Jan 2026 at 13:52, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
> > head:   f348d9af26d490c6f504ccaa7b342803ca1eaa0d
> > commit: a121b4a72e405d1096049f81933531c59256cbe6 [18/19] x86/kernel: Switch to PIE linking for the x86_64 KASLR kernel
> > config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601011320.wfOmjyKl-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld: vmlinux.o: relocation R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIE
> >    ld: failed to set dynamic section sizes: bad value
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
