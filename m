Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3EF38B7CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817076; cv=none; b=sDyIkAkHnx9CnbKbn5Aary47CBwancNU7GQoojLvhMzN50wIT53QDJlTNIMNfdyEkhga2qYpCv3yiMCZySwwLYgvavS0hKasmU6Uh+vzUkXVG8yXYXeUMFxxQEu7sVw/g/Q5y7vzBDLUV+q44lD7ZkN2M6eTnlq3oW7h2ACc23o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817076; c=relaxed/simple;
	bh=dOGUPI+MiV/OWgfdEs5YOeqHbH0YFtoekEev6C7wVaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdGvZfjRLxFebpt1QEwqjAmP2kbYdNYKYEe6Vt0fPhGZwnlVfm7Vc6myX+N5qrNsnujm95VYGGQ2yDRQBFYlJv9xcu3AXbjz9DnmBna6sjevpPjz54wrzeA1m95Jg9MvX4qOMTFgdowdeWyzeKb7iKkmxlh9LGZIH7C5tqk1PcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr7a+xmM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr7a+xmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87048C19421
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 23:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769817075;
	bh=dOGUPI+MiV/OWgfdEs5YOeqHbH0YFtoekEev6C7wVaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gr7a+xmM9B1EhPgJ22ewLPu/aX+/qea3UX3WDLf7KNGQERk6+u5MaBzMvhwOvbPxI
	 HS/sgAZyAKwKnzFmSNSEe53c+kyez+j5Oh6GOB7jDIyy8G0h+et2xmZoWoQUJMAGNl
	 uRBSBVfVV3ehuHEdK578vFzvVW8fDra3+ERDJhyg2nfw7xdvJkQ9Dh+zOuH3SxHlSw
	 AWZ6/gRPKsIlBw6uTc6MnP28mjfWO/T4MH7J2HJMkJLKdnVZA8wbKAEi+6vfl/9QFs
	 dulI/RM59xWpMyoIuaXLB9HEHViBi0HHbPa/2DKJv3eseqdhYGv/GcFnu8Oro+qRxo
	 tAgw667M/fVzg==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-649389b1cc5so2467028d50.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 15:51:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxelOU5tuMZzqRoanNtQ+SOdDCoaGDFFBjbsdqiWNUhjPbfXJBwmIsBFol52OX/hMM6v43jaM840Z956gk@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5RHw0h/Xzn3JZrk9++7qKiFuTVLuUR+G6EgSdc6PvjKXqEeo2
	7eUy0C4lTnzvX8F91y7PqtkPiaKoA413q3fY0c2Rekawg10fHT9vJhMI6JIrRWPgj2vUfLW7vEy
	T8kt0w8NrwTBWlHoQQbxJNue8dzO+KNk=
X-Received: by 2002:a53:d88f:0:b0:649:5ed9:fb72 with SMTP id
 956f58d0204a3-649a84a0faamr2868972d50.61.1769817074751; Fri, 30 Jan 2026
 15:51:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601271725.gqlQ8Jl7-lkp@intel.com> <20260127-habitual-suggest-c3f429569fb6@spud>
 <20260128-magenta-unsealed-f7586f14eed3@spud>
In-Reply-To: <20260128-magenta-unsealed-f7586f14eed3@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 31 Jan 2026 00:51:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmH-Nt5teg8J8dM3Ce_kEw0vEYdd2W5GocEiFKZytG2Mg@mail.gmail.com>
X-Gm-Features: AZwV_Qgde52ThcYHzMDibXnFyzCOqYf7EPZTfRrQaDtKCDNCNsUyvdFnyP3bCeo
Message-ID: <CAD++jLmH-Nt5teg8J8dM3Ce_kEw0vEYdd2W5GocEiFKZytG2Mg@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 39/46] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_PINCTRL when selected by PINCTRL_POLARFIRE_SOC
To: Conor Dooley <conor@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 11:49=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> > I guess I'll send a patch restoring the selects to the driver option
> > Linus?
>
> No, I don't think that's correct. It's the below, right?

Yeps, I can't apply this for some reason, can you send a proper patch?

Thanks,
Linus Walleij
