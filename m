Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15802FE063
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767533611; cv=none; b=XqOEwqGBbrc4U2OQ1dWQTJgYLfQ6uv+hfSa/07d9TBWjnkDZwSbwGtsLY513gLFjEyksf6geK89JfUcIXJdJZAQiKDjn2ht3mRig1RLfOx7pOkhDZpykfV14rgfppZyWRadU8H2ufpYbeRZbYkmTeV40F+eLfsLpRrAzzvQz8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767533611; c=relaxed/simple;
	bh=/6xGSMkKJ5AexSLbyke2Acpqftlu91VWRW7qp8gHr3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPu3RQZvRD30X+YJXhPKDdDNujtPY3/w7fk3d1m4QhP1ialsd9kiYObV0jWEKmVw3CtAKDZGfoKiHx1TLsc8g3zKFf43BBq6Eb7kq/5HCowzmisc7fYH0lQSMHGWU/+O2Y6c+Ds0vJVLaXxvy3ESb7AwalRMMGX4uKCOJCqupWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niN8Nzsz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niN8Nzsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CCBC19422
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767533611;
	bh=/6xGSMkKJ5AexSLbyke2Acpqftlu91VWRW7qp8gHr3U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=niN8NzszN0N7PnGDlFM7pMQT5ANpu80UwtkEgQmOUSDBC86UhgN5sV5gBid8Rrj87
	 w6AATDVy97NFLCj7PvNJhaWjG8TpxyNjqI+VxcTzkg6BESmaB1d2SnPXdFOgTd4llJ
	 FfbF/ecszWzFS/4Ly2JGBCao/ROGDD8+i/0ed2LZgXqE70sc0N83JTbED1TVKTz4RU
	 KssXZhcqqWjs/hDghi7gl5+vg+QICCiG3j2jzktIBCOnBvhg5irZUQXVrAqGRt1oxl
	 cQKSgEhC79mkPlxduVtupErrVEP3nEsHEij4ppxzzLKMWCuJC7q2EUDL+/8ryZaZUL
	 /0Rl4t+gn+0fQ==
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d5c365ceso176706375ad.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 04 Jan 2026 05:33:31 -0800 (PST)
X-Gm-Message-State: AOJu0Yx5UoxsBVEHs3A+KpX4Ea9ziRGPcUj7B2HMdIRTX2SldVbFJ5n7
	UGBC2jYOs7wS45cCK6hjThnMSWErdFgYSaaD5ol+IbkgKzIF/PkTo7LvPsxg4gJ25cwy56QVO9U
	69od4DmBgSSpiYDiYXIzRwbGsnySk7rk=
X-Google-Smtp-Source: AGHT+IEfVHHeJnGAndqEBia0+RBFb1+ujewYAEUJwQhHZ772oL7ufdrWGXFF7l50U4lgcfVfOwZO89CpO9n4esyAO1w=
X-Received: by 2002:a17:903:1a03:b0:29f:2ec4:83eb with SMTP id
 d9443c01a7336-2a2f293b6cfmr528947645ad.53.1767533610644; Sun, 04 Jan 2026
 05:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601042037.o9PM6Mm8-lkp@intel.com>
In-Reply-To: <202601042037.o9PM6Mm8-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 4 Jan 2026 14:33:19 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH6YKWq-F8Gy6F8L3NxeJZ7d1Y8so-g7qsDa-XMKCbeWA@mail.gmail.com>
X-Gm-Features: AQt7F2o5Mr8q7SqF-vdgO6F1e0OfM__-xL5FOXE5pWt4_hKPuhimjc_SN26mvGw
Message-ID: <CAMj1kXH6YKWq-F8Gy6F8L3NxeJZ7d1Y8so-g7qsDa-XMKCbeWA@mail.gmail.com>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This does not reproduce for me with the exact same config and compiler.

Please share the build artifacts (vmlinux.o in particular) so I can take a look.

One question below,

On Sun, 4 Jan 2026 at 13:07, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
> head:   f348d9af26d490c6f504ccaa7b342803ca1eaa0d
> commit: a121b4a72e405d1096049f81933531c59256cbe6 [18/19] x86/kernel: Switch to PIE linking for the x86_64 KASLR kernel
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260104/202601042037.o9PM6Mm8-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601042037.o9PM6Mm8-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601042037.o9PM6Mm8-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld: vmlinux.o: relocation R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIE
>    ld: failed to set dynamic section sizes: bad value
>

The second line lacks a >> so it is an old error? Where was that
reported? I.e., what is the baseline for this comparison?
