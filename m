Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07102D7DF8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362628; cv=none; b=MUDyMpxmbYGNR1e0YuMRc2MerTQ8eR//dzL1uyWxxTX3URPXTvEJlCl06Y7y7bdhXiqZGnv3mnBkL0RJ2Qjgjhxc2xJXD6Yd7EXOqH4M7sNgIOn7lQ80sxY9VldxL22BklnL23CeqN1X6Kb+LrAT/RNLl3XLBtYHXJjIUGfs1ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362628; c=relaxed/simple;
	bh=2+LclUnre7rSDRgm+4ElatQHH7j2vBwIG1AKS1WdO9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aun++yNTzTP0DwrLoNfbPmLfXxZhteiliwgdLQ/dbIJsHTCaI4msx9PxxdeSjSjiflGe6ol7XDQQjN1hZ+LY5ScwjX3PWmXhLn6myNtH2p+4ol9OFsmhWZYnQkgeUHREek9FLrBu9sVDPLMVO5pxCDQxQNXrtEHMTTSrfP5wuHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhZZMI2y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhZZMI2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C040C2BCB5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362627;
	bh=2+LclUnre7rSDRgm+4ElatQHH7j2vBwIG1AKS1WdO9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EhZZMI2yG5Ih9+JWnsgH87TRgvnS1WfpO9jhbJN/7u5Mco7yh6dojFRw8rjAlDTPf
	 6a1aHTdYKePyOKah6TYnTATFMAYks5MZwGWUisw1/f/Rlq+xTXXYhLX5tcGPG9vkZK
	 ToEVjhTf2NBQIVXym7ibKSO3tmhI+BIDavHgs6n69CkJzeNzlJ1Eu5YTPvCZ168AgT
	 DYfiYDCJf0+3fh9G3CGgczHvURVpiEGmpNONw+9N/XHcOm55fvxbqT52NljIxHs5fb
	 3zERQUif4DY/bksyULlIE5YuJfYKQbJ8ZGe1Wi5ZsS8avlxP1n083JSE7K2I7/jtHj
	 f0MyWC49Pkwyw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso104797841fa.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 00:50:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KT0j8wjL96QY18lYSbMKeX8dFOhcDqAo4J5HbXBHJM4BeCSPUTImjp66VFUBnlcOlGzcJ2EAQRqxunRVY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3slyiBn7G1bessB0HxkjfBCj12uSBeVrNg5rjl/CgQyd6G/dA
	hGzvzKXxvGcKK8tqnkAMvX7ruMM1Hg09KtDD8J/ilXQHPCDdOi0pCU7g5DJiqePiZv79NlBX65P
	lsNHvEw5VIN0IkuOqHsictAk+y6zCSLk=
X-Received: by 2002:a05:651c:888:b0:38e:cab9:365e with SMTP id
 38308e7fff4ca-39240d2cffbmr6778151fa.14.1777362626296; Tue, 28 Apr 2026
 00:50:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604191855.Xw6q5RJC-lkp@intel.com> <5d194339-0011-4621-a235-7412974259d7@kernel.org>
In-Reply-To: <5d194339-0011-4621-a235-7412974259d7@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 09:50:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLnn0J+E_-PeKvRSZo9w5rNLR7PNf42=1Qs_Qb_D6LuYzg@mail.gmail.com>
X-Gm-Features: AVHnY4LRWk2Hpv_PY9vzZVCyzan_6wBhZ1fR7SF38_3hMCSkwt9AsCftg8r1zk0
Message-ID: <CAD++jLnn0J+E_-PeKvRSZo9w5rNLR7PNf42=1Qs_Qb_D6LuYzg@mail.gmail.com>
Subject: Re: drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 9:44=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 20/04/2026 03:44, kernel test robot wrote:
> > Hi Krzysztof,
> >
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   faeab166167f5787719eb8683661fd41a3bb1514
> > commit: 1982621decaf788d0611fc291fe89b297b6e5510 pinctrl: Allow compile=
 testing for K210, TB10X and ZYNQ
> > date:   10 months ago
> > config: alpha-randconfig-r133-20260419
> > compiler: alpha-linux-gcc (GCC) 15.2.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=3D1 build):
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Fixes: 1982621decaf ("pinctrl: Allow compile testing for K210, TB10X =
and ZYNQ")
>
> Hey Linus,
>
> This warning is obviously a benefit of compile testing, so issue did
> exist before.

Yep you're right. When I get to queue this up I can maybe cook a fix
at the same time.

Thanks,
Linus Walleij
