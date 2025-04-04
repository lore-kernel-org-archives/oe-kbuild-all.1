Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39216F8E5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743746156; cv=none; b=tc0rdYxHIsfVGreEU/VqSUkraaVmi3wbBhVeX/cd9v2RHNxqIz8pSpIbNkLGC58JXqumdux0Mo2XmYfPjaZPh7XZlb+SxKUfHbcKpYYFaGT/9XpAxhQFrF1LZNyg5sO44pqtgEDj87KPf+2aMcBfc5zNGNSfA/73xXpVLkbEfyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743746156; c=relaxed/simple;
	bh=m3Wf1exXRQJ0ctdB9DJLeYyEFT0zavPZvNni4xpRWm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIElWDxzRajn1+o94GlY9YNasy2bkA3YrSC7Jxy1SLa+Z310c8iz/sXTuEibHOMFXmvnvcWhaF1etNllJpyRXxiS/EuHCHUS+OMp8QX5Ud+gO+B7Dn1eIimKmRTi7PsITRkX59GOdT1mZtlz+hPCBnGqIFq/DKxoIPVHKBLRLII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PucI3vyJ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PucI3vyJ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bd21f887aso12587751fa.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 03 Apr 2025 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743746152; x=1744350952; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4m4Lgv/G0HSWsRrxvRHFcyOI0AOUZXlAU03wGqymqg=;
        b=PucI3vyJV+9iIRk7XAL1b6fEdAUPSvY4gcKEZ2ofelSD550XNXahhUsj6/2eybHMZW
         rN8zKa5JP5CkMQ7xmdfbYG2ieFzYDP+lmpfK+CXV71jyhkqZF5MsIhygqgt8lTjtjPv/
         m9PzIgEr+B8jLlEmIjuruMFT+JgHHJjA/La28zjsU9kGYkbGlspRu+pZoPpndqfUq9Un
         g1W+fK9Kq44Fa8TUP0cHgQKKfge5JlOgMV354duWwgHgaxvLsk+0+E62O1jxRBsQyjUV
         gRc3yzDbxCiWYGTuQrIbadLnwcYi0HVGJ91Psv20ZKaGv5RqM9jxK27yIFGtqkHcYdT+
         KamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743746152; x=1744350952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4m4Lgv/G0HSWsRrxvRHFcyOI0AOUZXlAU03wGqymqg=;
        b=b6/Sk9ILxN9VHFghjabl+0Qw9YNpF4S21HyP9q9XuAsVX8Fd2tKOSnX/5Nt+YM1Qpn
         pdatOEQcVhoaomZeflIZcrZAU55IQNiSnr4Kau4KeGBZDNZF74/vwA2bCbbmvoNucrlY
         SeJYq6iiCNJEYPA9dx2dS4m9UAkidwP2O4J1BFJYwbpf+ZZ7cZ0hYWG/3nLDzFMxm0GS
         k8Y7TJyHl5GCZdZOKk5DSaXxB1TEw98jjxU9oWMGLkLV9f8PJK0PS47MXb2Oql4gV+IJ
         mRVnhbZ2fFSriqeBlrC9IdY+Ww+GoQEirUQ3q0vWuYtrVYnjMl49L0xNK2lNP9T62AdZ
         6R+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzxv2v7IkQwCInLxX3wFt26ZE6qCvdgpx3U35PYVo/ZR1RMkaaUNlNmrbjvtJeAElumeZpmOmMmWyUgBwo@lists.linux.dev
X-Gm-Message-State: AOJu0YwN3y7Y8l+pENNmudHqRs+dvz8mBWmL2Pk9x6HYkgZr4CJNTC2Y
	PupEqsz0l+jmr6DP6h30x8ePpD2saQrxXKz78C9ZStSfEX9oB9bFEClqlazgjIwtlH2NkDd12Kq
	+TNQ7/Expw0Z170FZfW39keMaiSk=
X-Gm-Gg: ASbGncuBTicyAL5F7iD2Lirf6KgEQqtm0cvrG7nyv9zt4vdlxbirFeGYQfKQcdkHz6d
	4jgoyvn55gyC50LuzJb2gGyymQOYGUemOWdwah5BYqKvC9K5WABjBKN6dMc1Ft1FhaZxqLrN/Cz
	Ku0ZeLJg4M7fmIL6fmGdqWH7z56Q==
X-Google-Smtp-Source: AGHT+IGTy1lG5z/lKToJqLPpKeMMyAygaCW/W5NO8s5KV8h/yzeNHSQV1ViJFpeSbZCYHzC1pamHt+ktBZwIl25G9jM=
X-Received: by 2002:a2e:ad92:0:b0:30d:e104:cd58 with SMTP id
 38308e7fff4ca-30f0c08d73cmr3440681fa.41.1743746151616; Thu, 03 Apr 2025
 22:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403094527.349526-3-ubizjak@gmail.com> <202504040855.mr885Pz1-lkp@intel.com>
 <20250404015112.GA96368@sol.localdomain>
In-Reply-To: <20250404015112.GA96368@sol.localdomain>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 4 Apr 2025 07:55:40 +0200
X-Gm-Features: ATxdqUHvxKjaAuNJAyKxretVYKicCee6aHgEDOIqcSNJgt7UxehAOrZAXyC0sC4
Message-ID: <CAFULd4YrG-7DCXabke+uuLwLw2azciogG1nPGeAkMxLACw+0og@mail.gmail.com>
Subject: Re: [PATCH 3/3] crypto: x86 - Remove CONFIG_AS_AVX512
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, kernel test robot <lkp@intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Herbert Xu <herbert@gondor.apana.org.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 3:51=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> On Fri, Apr 04, 2025 at 09:13:40AM +0800, kernel test robot wrote:
> > Hi Uros,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on herbert-cryptodev-2.6/master]
> > [also build test WARNING on herbert-crypto-2.6/master tip/x86/core linu=
s/master v6.14]
> > [cannot apply to next-20250403]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/cryp=
to-x86-Remove-CONFIG_AS_SHA256_NI/20250403-174814
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptod=
ev-2.6.git master
> > patch link:    https://lore.kernel.org/r/20250403094527.349526-3-ubizja=
k%40gmail.com
> > patch subject: [PATCH 3/3] crypto: x86 - Remove CONFIG_AS_AVX512
> > config: i386-buildonly-randconfig-001-20250404 (https://download.01.org=
/0day-ci/archive/20250404/202504040855.mr885Pz1-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250404/202504040855.mr885Pz1-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504040855.mr885Pz1-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> lib/raid6/recov_avx512.c:382:2: warning: #warning "your version of b=
inutils lacks AVX512 support" [-Wcpp]
> >      382 | #warning "your version of binutils lacks AVX512 support"
> >          |  ^~~~~~~
> >
> >
> > vim +382 lib/raid6/recov_avx512.c
> >
> > 13c520b2993c9fa Gayatri Kammela 2016-08-12  380
> > 13c520b2993c9fa Gayatri Kammela 2016-08-12  381  #else
> > 13c520b2993c9fa Gayatri Kammela 2016-08-12 @382  #warning "your version=
 of binutils lacks AVX512 support"
>
> Yeah, CONFIG_AS_AVX512 needs to be removed from lib/raid6/ too.  It looke=
d like
> that directory was rolling its own CONFIG_AS_AVX512 in lib/raid6/test/Mak=
efile,
> but that's a makefile for a test program and not the actual kernel makefi=
le.

I think the best approach to avoid patch dependencies is not to remove
the test for AS_AVX512 from Kconfig.assembler in this patch, but in a
separate patch that will be eventually committed late in the merge
cycle (or for the next version), after all other users are removed
from the tree. I have patches for other parts ready.

I'll post v2 of this series with the above adjustment.

Thanks,
Uros.
