Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805D7145FE0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767283438; cv=none; b=aU75fcJ0WsHH/PZChRk4jJFsijF5SPjEjVL9mrgHPlWR268o9+czPvxYj7FxdHbgKjSKlXuqpyHYaiZAzGnOUQY2nBnDwHGElfRl8sxvPelzmSU1k7rS/JAryerZ4BtnQM7cCj8r3sJf68W8wubasSlpDkgac83zOqYdp0Ai+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767283438; c=relaxed/simple;
	bh=UORruhzA+32NrQoQnmlwLuPtz7ru4PfeEPzfwVbaIwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDlUCTXvQnWfzpuyFt9Cnb9x05hqIhKRoxJfid16hwLm1rzvg9AMe2i0I/m10UlcuLc+sd5PIcUjSngWhzpppS2T/oZXu8hPVrGXjGgilMCi0ayVHlbGWxon+PqTqc4bN1pqCl2h+wWnrxAfxV7mQ8IAYSZQq2Brd+phcXVNdXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP5GfXnX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP5GfXnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F4AC4CEF7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767283438;
	bh=UORruhzA+32NrQoQnmlwLuPtz7ru4PfeEPzfwVbaIwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VP5GfXnXjZwTIVTWz7CPK/gCTpvLLAw8QxSIEsQhNvksti/v1E9W+XRZmb4G7zZRq
	 dUg7cQ1MbbBHnbO0YJnpiwxUNAiL9OKlR78KbxU/MwoVmkE0QsuhvnuRRYtADNyi+/
	 Og8zpq9xr4x5tqREXq1iRCysa9KVWk+3P4/u/a4fmrjrUxLte+C4qeoptET5NjuSX4
	 posZkNWrnMeeAU7nogdpPGLriJJ/jYr9Q5n18QG/2hQaLHCsEOmUR+oXh0D8H1PYxj
	 SG/0i3VMDvkZXIjmwdZRG9a5u6RbgI4zzGJtGiPcoXpuZdJ2VxpN1Rx19+L57bWchT
	 1y9/gbR1y9HCQ==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c868b197eso12737343a91.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Jan 2026 08:03:58 -0800 (PST)
X-Gm-Message-State: AOJu0YzaXyCBTKkcr9P50t3QoyRYF1zR32XdOLbv1mqRUNgSTF2+5SEG
	wEb80z5tUrz37gC1GKtOl53jyC+49vzE1XKnEOaR2YeHWuYxrZkAWqCBz8ebnL/7M1WR3Q2neqx
	VKw6wZ7S1YOO2w0Na7YN07UQJJ1AsgUY=
X-Google-Smtp-Source: AGHT+IHquaTZjwqPynK5Nz+TsKHW8DEDoK5AQcp9dJN8G/0RMLwgi8GuQuL8FgWUnhw8spBwSbpzxki56s9+P73OdiA=
X-Received: by 2002:a17:90b:28ce:b0:340:c64d:38d3 with SMTP id
 98e67ed59e1d1-34e921448b2mr34932193a91.12.1767283437703; Thu, 01 Jan 2026
 08:03:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601011320.wfOmjyKl-lkp@intel.com>
In-Reply-To: <202601011320.wfOmjyKl-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Jan 2026 17:03:46 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
X-Gm-Features: AQt7F2p3Fs1XT2uSECBZFqWKX8xRz1trW6TBQbgyhpo3UOu4VThhdmVB3RpsGlI
Message-ID: <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This does not reproduce. Where are the build artifacts?

On Thu, 1 Jan 2026 at 13:52, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
> head:   f348d9af26d490c6f504ccaa7b342803ca1eaa0d
> commit: a121b4a72e405d1096049f81933531c59256cbe6 [18/19] x86/kernel: Switch to PIE linking for the x86_64 KASLR kernel
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601011320.wfOmjyKl-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld: vmlinux.o: relocation R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIE
>    ld: failed to set dynamic section sizes: bad value
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
