Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CE33CFF72
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788981; cv=none; b=tldSftpjGzdeLC6fjjE1PH0/eSFUgY+0V0JCOivD8icl0/UghESNXdeDm1yqwXMEbgfWkuTTzT3FyAmbkzIfBTJRxRM8sN/ZPM3PphVDEiulZ75+/zj5uG5kYj8AZN4iRY1axDnXnbIGRFBry7QQTqRtGziSfKO+9jwE0Lltdps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788981; c=relaxed/simple;
	bh=CiwycAHwCYFB8kdIK2eCfuhQua9DbImjpclRyfUrj/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LL4gyCQkaddNBUPf/dByILly2Wt1yDZJUn5UYzmzdkHyHLgNwAahiuH5ChfijTr0Oypwq2qyKfKb9dmSjx4AM4gRfC1rzrR9nC1NMDgbiC3qOgWX8VrOBz5FNGU08rLXkSEsf0RZZJZp2KLF8ImwRTaLRYwt9AHEs8JJ+xEe480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lpfbtuhz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lpfbtuhz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2671F000E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788980;
	bh=CiwycAHwCYFB8kdIK2eCfuhQua9DbImjpclRyfUrj/c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LpfbtuhzztJWjxmxERYVa4hH7Ggy8j5YsfNtTTQl28SyiJaE+UQqoGRMZYdAyPf5g
	 psQlPWUwiziBnpdStEVv0ptz2sXd0y/pen5QK+lDks2qnBWggCAYQnwdbeyLA00OPi
	 kp20IYXrKwTvhS0NpuH+9BZjh/8pxYJGEEfMX9O7BmuO7DCLja3LvgyYMF9xIeFKs2
	 5ILNWOVVpa/13JXPBsCiEWKZhUlFtBFd2FiwbuTu4kEbbaXRp+Buh/9kDSkn1tARE6
	 29OJam7mNA3A1mzKb2lZMstHADcc28npR5PmD/u3bFPciDcrOhOroXKf/rGeb24dNL
	 M++ety9LsonwA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so93763081fa.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 02:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NmXuL8Sf5khFav3ngkTJ7hHwM8CZCH+ubje0sTG8F50u4j6mynyZ1A4g/4lq7j/O/wvrosFoYHiV76DHq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1OOs4oRFf3z+6U6IkLjvr5IYNjbX88McO0hP1dAe3PPTEhmd8
	G1JzSvUwrZ/tS0P9aFj5Cp3sQtzI+4TpIQ54XXAPd5zobzWYr68Vm3oaf1uIlrWSZAXjSZuIPn/
	31k6owaGLCrVCBDPWS+3IfQvZe3Dbw5I=
X-Received: by 2002:ac2:4c93:0:b0:5a8:64a4:2bb8 with SMTP id
 2adb3069b0e04-5aa323d48c3mr3701591e87.23.1779788978932; Tue, 26 May 2026
 02:49:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a1983420-7a8a-865d-daf1-5f6e6c283a22@inria.fr>
In-Reply-To: <a1983420-7a8a-865d-daf1-5f6e6c283a22@inria.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:49:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLkFOXUsyHmBDW6+8VQegnj=ZgsBEiELusJ5FYVs=2ksuw@mail.gmail.com>
X-Gm-Features: AVHnY4IeJNSDkpCDN05F9ZaY-RjtY3uYlOADb1bycZBxM2OhHnp_lzPIva5BLkA
Message-ID: <CAD++jLkFOXUsyHmBDW6+8VQegnj=ZgsBEiELusJ5FYVs=2ksuw@mail.gmail.com>
Subject: Re: drivers/pinctrl/freescale/pinctrl-imx1-core.c:553:1-23: WARNING:
 Function "for_each_child_of_node" should have of_node_put() before return
 around line 555. (fwd)
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I got a patch for this bug, but since it is not critical (just a minor
memory leak)
the patch will be deferred until after the next merge window.

The problem is that I can't really merge patches that have a strong dependency
to -rc material before that stuff is upstream, and I cannot rebase my main
branch for v7.2 at this point.

I *could* merge in -rc5 but it is annoying to do for something as minor as this.

I am maybe challenging the process here a bit: tit would be annoying if the
bot keeps touting me about this until v7.2-rc1...

Yours,
Linus Walleij
