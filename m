Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFD2423178
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868447; cv=none; b=nEK86Lw8ME7RBW7VHSmQsT634MnekNVJZO+9UBG0jVxkwuX//Tb9SZzhFtwKs8wKnbXyYJF+fscrI7y9aVvtFxecpXZ6o5L/ZCvCygRnGazaDflAHDH2+go2zNNF0xEbtIE0zQJcM5RYmRBo77Cj51TeFmLrSA7eYko9tTC5kRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868447; c=relaxed/simple;
	bh=NNmwxFC8WnuUQZQApzi+U2IMeS9UQqH/btnFmWMygdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BiEuQUKMV+HQ83twP8qsKcW+1uuxPn2IOMFwg7Ynhpx53+hgGpUZSdOheLSZyMcp00CjeICANqmDms+lZf6GsbNJc1eOi+nAeWzjsk7DublZ8vIJVWWlpcKvpVoofoj+o59v0lwN0vdqLh4Jl3u6NXogN4sU+F+9jS6jBJcgLtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV1DUcp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RV1DUcp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21DBC19422
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767868446;
	bh=NNmwxFC8WnuUQZQApzi+U2IMeS9UQqH/btnFmWMygdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RV1DUcp+WYZiCQRHd6Jt+dgjmZH2ELP2mzDYFdYblkZgs+rzy+d1YyidAPdranGdF
	 DVi7aJMkk73H+v9MBYbp4TS5oqqYh1SoffE5I9HmeYzpBaIiYBeSNe2BoQ+/XohvE4
	 7uJGVhVeFC2tcQkNgipmzcpNdn4SBwooM74TJPeBfHjLuvJXcxHxoY2KM62uZIXPLR
	 UwvAr5pnkqItQgRs0JEnEvI8Ouwg7MGujI/3OxebaYbr7VvBnFytmwnZg+Zco+zDAS
	 D8BVcBi1/FNUBziN9nS4q5qbTRxPZp9f/azwdX2n683OtTCULogzeuQo8ig1WEJexs
	 wfGHcqE/7xj2w==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34f63ad6f51so1016853a91.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 Jan 2026 02:34:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqLIdZGQcQczVJSpxsR5wE8B8xB/0HTCIvn1TsLZawUZxrSDvvEaWiiC1lFgabHKAbmUFyOVuXvzuSKQA1@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdz7SNloijoI9B1MSOkbPgV1T4zzy3xMynHGoZXkDgo5CnphL6
	kjkdFKzkUtbquEuL8NIhVOxLmrW+lB9kz3C0PTte26XxFlhevZ8mXEI7VQtSTgft6mbVleC0Nee
	DQl4YjIguY7iDBpUX1XSvXvq9HHNPk2I=
X-Google-Smtp-Source: AGHT+IE5HADDaH0lqbcUYd7bQOxYOXG+ulzcjp6j8ftmiSMU6G1lqbrbMXfQx+HKUdHFwmRIN14iiAF2FXSnojkeqTM=
X-Received: by 2002:a17:90a:c107:b0:34e:5aa2:cf68 with SMTP id
 98e67ed59e1d1-34f68c27d59mr5031827a91.30.1767868446437; Thu, 08 Jan 2026
 02:34:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601011320.wfOmjyKl-lkp@intel.com> <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
 <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com> <aV+HboykUV1ac4Oo@rli9-mobl>
In-Reply-To: <aV+HboykUV1ac4Oo@rli9-mobl>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 8 Jan 2026 11:33:54 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
X-Gm-Features: AQt7F2qtN6ZaYuqaEy5F0sLCfVQCDzClfV48uJYJoLYSAL5DskJlZG8ko89bRB8
Message-ID: <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 11:31, Philip Li <philip.li@intel.com> wrote:
>
> On Thu, Jan 08, 2026 at 11:25:42AM +0100, Ard Biesheuvel wrote:
> > On Thu, 1 Jan 2026 at 17:03, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > This does not reproduce. Where are the build artifacts?
> > >
> >
> > I kindly ask again: where can I see the build artifacts that produced
> > this error?
>
> Sorry for not responding in time, we just start the investigation. So far,
> it found the internal build has set below extra flags for x86_64, which probably
> leads to this issue.
>
>         KBUILD_CFLAGS_KERNEL=" -falign-functions=64"  KBUILD_CFLAGS_MODULE=" -DMODULE -falign-functions=64"
>

Why would you pass additional C flags and not mention this in the reports?


> But we haven't got further root cause.
>

Thanks, standing by for further updates.
