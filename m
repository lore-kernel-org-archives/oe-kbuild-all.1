Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569B40BF5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734748895; cv=none; b=J20oQetDKUxHjqccc51ESxsxhp2tGDVN5TS2mjArOF+dp2WrnKVfiaCWRGt6RVCSFabX+EPVHFGuUS0nTAMPYcCQAJPsySlabGeGIJw7DXeeDxFOnk2ipSjf9agxfEAl3vb5koqewOxXZcvAAN+qm9jhvP5W/yAwMyCKB6ZW6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734748895; c=relaxed/simple;
	bh=eJEIke8x7tcLIznTNUcJyJr04tGRUnRCnc6gbQdTkX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3Neth+EvIzEcbG4oqI4t9Yi4bzukH0Gd3FAPRD3ZnVrI+g7rhYt9BSGHSlhoAxuYA7owTutwonwIIvLO72BtYUPe2IRAE92h6NUkPiIwbGHK4Wr6v4mz/l5zeN96+6U1JifBIijCGprfw77Rpxk7auv74fKY4wKQXMdsaOOTuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYK08WQD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYK08WQD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA84C4CEDC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 02:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734748895;
	bh=eJEIke8x7tcLIznTNUcJyJr04tGRUnRCnc6gbQdTkX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IYK08WQD+Euc1LvH6hlmuw6wqJ5xJ7McoVu3fsdlmTCbg9/2fOHKmcMqRQkl/8rT0
	 10v6XqwRgDltIDoxNTHFC38A8uKTIyPQkuCw5k1Sp156RX/+vR+CuHg1vNgNflZkj/
	 S2KVRTRLGcGt6XAHqNtYknTFhAde3qixeuZpmepqQSNRXhO/d9wsaw6rpINhuy8cch
	 4mDtVLI4NAGhEqp/4mnHMAdSz/8hjHt/qRz+4R3l7asM9I1zSHhYrs0bVsGh8XLg02
	 k2ItI/CgHjoNrkxRHZs+09W8jm9A8+pCFsOfGp+zar9e67NMp557c8i5tUGu4e1Prn
	 p0L1gMHgZH3AQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3a227b82so2251244e87.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 18:41:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhUFZCPuy4uYnFsbOA3fLuHFMDweLnuc7uzxGdiTZIQX0yL2g+gnvQ8ymZKS4zV7pfnyylG5ep/EttRkQ0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw12k/6gw3Jnprh347Fp5YYkAou7aWGxF5qSyVOuMhQW2AWIdP4
	dCn59tGLQkYysT7+/EtOUq1osNxdunPHGL7h7QV+zJlwaG3PzRIVvZ2GqTVgNGHx2gX1qrhBB+Q
	za3efFBv7D6o4pTmpNaRCDRf3LHU=
X-Google-Smtp-Source: AGHT+IE8oYgRMV3X/NrI7fg8Am5vdxW4IOHHdeUyJDDns+/VEQFJXubRtRa6FFalQ74umSePUqLaf9ohWNH3nL8FUXE=
X-Received: by 2002:a05:6512:39cc:b0:53e:94f9:8c86 with SMTP id
 2adb3069b0e04-5422956026dmr1803343e87.35.1734748893631; Fri, 20 Dec 2024
 18:41:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert+renesas@glider.be>
 <202412201643.PR8VVmEL-lkp@intel.com>
In-Reply-To: <202412201643.PR8VVmEL-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 21 Dec 2024 11:40:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATMMoiKR2CTA2C86CgampnDye-9Q+dN6ft4Nt3wOBZjTw@mail.gmail.com>
Message-ID: <CAK7LNATMMoiKR2CTA2C86CgampnDye-9Q+dN6ft4Nt3wOBZjTw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Drop architecture argument from headers_check.pl
To: kernel test robot <lkp@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton <akpm@linux-foundation.org>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 5:21=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Geert,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on masahiroy-kbuild/for-next]
> [also build test ERROR on linus/master v6.13-rc3]
> [cannot apply to next-20241219]
> [If your patch is applied to the wrong git tree, kindly drop us a note.


This patch was applied to the wrong base.

e818f927cd01 (HEAD,
origin/Geert-Uytterhoeven/kbuild-Drop-architecture-argument-from-headers_ch=
eck-pl/20241210-165347)
kbuild: Drop architecture argument from headers_check.pl
f2dc1ed2104b kbuild: deb-pkg: add debarch for ARCH=3Dum
b493dc6aab8a kbuild: deb-pkg: allow hooks also in /usr/share/kernel
e9bd8e4b7712 kbuild: deb-pkg: do not include empty hook directories
fac04efc5c79 Linux 6.13-rc2







--=20
Best Regards
Masahiro Yamada
