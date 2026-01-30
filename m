Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFFF2EC095
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769806055; cv=pass; b=fgudk9NMtV4EIGTF0koBbGau7CLH2UAUc0uckSaNDVhoolWKrRHtWY2rQM/M2JMelPqv0w1JE2FoCslAW3ZlbPcsKd/Xw3TsbJXBFuJGUJGKjU/q+K6mkJNtrlLxKzmwjxCDl7+0lNKmulqLmzm3jR1iqWLuPGT522QMU8C+0sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769806055; c=relaxed/simple;
	bh=Sq7qKh7EMk48dHWt/Qluz1/8qTKafxCHaQEna2Tz7fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/f20cBZhCQsNKnS5QGKU9RvyqLjVXXaEAZTprAXCb15ZEdifYp66Yrw/9a8TcLBgFItrSgmrf4UvmKvwgiIDn/zE+RCvl8LV4VqpakpjKID14/5+wP4ZR/o7POPCas19nq4pj1tFLPl0FgdpXMtRgeuKCH9bMf4yKMtjTeII+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meQLPEMk; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meQLPEMk"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1446957a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 12:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769806053; cv=none;
        d=google.com; s=arc-20240605;
        b=KeQCVZVqlvY9h09TYiaK4Ymj5thD6FdR5VlOLAd3AWYTiVZ/bbEaLD7ydWDw2+KiF8
         bFyg5Tw+NhbJi5DA7JO5fnREgPP48TeQMJzY4TUZY8DeSuXkFRzbzAY0fn8eUPR/wKjI
         0YsAAErmhEGNhOGaSzSeSvGYZsFGeliGv84CJFlULmqKIG7pnugQzxxHJdF/lnstyECI
         ZlKRjFaGRB9OPinleBUPNDHMfzsecmSO2WZ+3P/uaM1knATksE6PVbxxdA/bRh1po6NF
         oCkd6WswAh3r2nZLKde4WSTnX8j/shtC7EXRgNJm1tP3XGUl3n+UqLxCYvr2/2xHFDt2
         ZU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDkPuGg5sHwz7KAxPzT1A9rLAgVe4LnrIU8HnzBCVHo=;
        fh=dO/DT8FRGyTyeEENM+OTJxaOy8b7Czlw0RL0pVqhNOw=;
        b=G/oNTDFEkXTFNDd7yIuCRiXla20CsSYuJn1RIyZvWwv227pBwHKTe2NhG3xzoqEp1u
         IbBAewAw5UmVQbWnBKPEvPliDH6lphDQbUAsX/XnPMG0StjiRu6vL6V7XfB0vg6jCan5
         81XJCsi/n0quJYagxhO1WlHaJ6v0kNgujWXDlQCkhd2MnxgDhuZrWboXR7W1cjI1Doto
         UjnIZgx2mEJkhKkJML5j2zbomTvjnpbQgVdUv82RbMw80C8yjw6DuhBFVe1U9z6Ybz8u
         Y8JnuUKxSitHU8wahbnEZRoAi2hXd+kvQxh6s1/Tr7r/aYODoA9Jmtq36jpxQ2fpkVMB
         ZsaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769806053; x=1770410853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDkPuGg5sHwz7KAxPzT1A9rLAgVe4LnrIU8HnzBCVHo=;
        b=meQLPEMkwJwj5ASp6lHxYETjRkjWDuz1z3dXgfF8RUN8trCsjZMkUqgJZxR9vEJGob
         oJGQgPZq1IMWVHOH6wwrO5M5g1Ihz5XXLTzpZyQTYp100HG7IC8WHzxSnHJJOZ1CraKp
         +4rRBrxcpm9t4uvP8aOP/N5ciU6Tq/V/osXWvE1nguwCQUbHr8kZsiQlpSaEd+y+9NIU
         ZFihVNAcN37hTVza22lh6dsYV2wGwQzNahNFQ4KbKdlU3GcR/mdCc5InvKhrCEr9CB9p
         lDRtJUr+drnewC7h4rEhw68dFWNK5qww/1ewCdtFVPg7kAwKSu31/CxycRzy2X9pRiAP
         Hs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806053; x=1770410853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDkPuGg5sHwz7KAxPzT1A9rLAgVe4LnrIU8HnzBCVHo=;
        b=Icsj5k55Ki8cEwfaPpkVM/HTUVWiiWkwbJYXbghgoqdzaPHnzJnzYF0kU/GDVYrx6z
         vsg2GPAD+H7pmREcnelm+5lDehDSDCrIc61bG++snbOdof2d1QpDSVwv+a5r2lRN0/k7
         zc4uw9BnjPUWQ92aCZXX5cwuTe4d6HNgay8fcRxoGY0Lcurpn9CtMC9P9NoIWQW7WMFT
         r79nLWOT0iQyklWJ0/ahV++MPqGvTNCnXRuJvi1fXoxbIRFsHQ/Xd00c9rsTt5N0h/WL
         RP4trKGt+1Oc7t75DbF2+GAusILqpXtyDTkF6oG1yUAkTe/Q1M/S2aDLeZEKU6M/SMmC
         h2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXWq0XYI0oXKurmbrSFXBwKClACAY9ZYownHEGIpQeoVvcNSirAq1Yo2fHO+rnMZa17f3wDzaJ82B7iMJX0@lists.linux.dev
X-Gm-Message-State: AOJu0YywzDr10mBqM3ZQjZW060idc9gYSqjp2Z/NpWyUa98b2wJAfecT
	6kFeqWP1R5QuZ+cmpIs8bDi5vRhtGHxGrVdDh0a2A4Tx96ggfJRIdxCEFdApikdMq+9zRhn68vW
	d9ewaSjEZh6GVaGw4ZVTSGwmwADnurMM=
X-Gm-Gg: AZuq6aKu2c59TO5S9MjXoghIV4A/O+uHKzzuSa5miOB1UQfYLNsk1jKy3e2Iwj588Oc
	0/XqeSZcIua45BGNfSi5NDgomgHElOHW7x1yFGINMgr35yAefO7pN2uC1pb582+25epfBYPTja2
	majjbkBvEcWMDEHxung/r3GdV3a6jku9FH+W4CYMvh3RBXN1V1oNWfj/Fo6d6ZP4EPCk9dI9OCt
	yzmzHtMMiw1vrM8yEJieXbtaU3poLFZbMEkCbrCQL8zwYAqT99/It6Yd3JV6srT4pbBVKym+9Oz
	PVAIW33R1AE=
X-Received: by 2002:a17:90b:37c6:b0:349:3fe8:e7df with SMTP id
 98e67ed59e1d1-3543b38bdbfmr3697730a91.22.1769806052962; Fri, 30 Jan 2026
 12:47:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129215340.3742283-1-andrii@kernel.org> <202601301121.zr5U6ixA-lkp@intel.com>
 <CAEf4BzZthAONGByqvk3pHRT3GaA8=fNbz+d1V1CY1N8sHEcsjA@mail.gmail.com> <20260130124242.dbb7946b3592ffddac7c316a@linux-foundation.org>
In-Reply-To: <20260130124242.dbb7946b3592ffddac7c316a@linux-foundation.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Jan 2026 12:47:20 -0800
X-Gm-Features: AZwV_Qg6qiEP4IMJhs-KyomvrbnJXpik5IjgslLpgoiiekMmR439uSsS3HxxEv8
Message-ID: <CAEf4BzatC6zi2vm=acg7949nBKpb6m+L4ubvLKn6JmRwy8o2Bg@mail.gmail.com>
Subject: Re: [PATCH v2 mm-stable] procfs: avoid fetching build ID while
 holding VMA lock
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Andrii Nakryiko <andrii@kernel.org>, linux-mm@kvack.org, 
	oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	bpf@vger.kernel.org, surenb@google.com, shakeel.butt@linux.dev, 
	syzbot+4e70c8e0a2017b432f7a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 12:42=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Fri, 30 Jan 2026 12:11:31 -0800 Andrii Nakryiko <andrii.nakryiko@gmail=
.com> wrote:
>
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202601301121.zr5U6ixA=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> Warning: lib/buildid.c:348 This comment starts with '/**', but isn=
't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
> > >     * Parse build ID of ELF file
> >
> > So AI tells me to be a proper kernel-doc comment this should have been:
> >
> > * build_id_parse_file() - Parse build ID of ELF file
> >
> > Andrew, should I send v3 or you can just patch it up in-place? Thanks!
>
> No probs.
>
> The preceding two functions are trying to be kerneldoc but failed.  How
> about this?
>
>

yep, LGTM, thanks!

> --- a/lib/buildid.c~procfs-avoid-fetching-build-id-while-holding-vma-lock=
-fix
> +++ a/lib/buildid.c
> @@ -315,8 +315,8 @@ out:
>         return ret;
>  }
>
> -/*
> - * Parse build ID of ELF file mapped to vma
> +/**
> + * build_id_parse_nofault() - Parse build ID of ELF file mapped to vma
>   * @vma:      vma object
>   * @build_id: buffer to store build id, at least BUILD_ID_SIZE long
>   * @size:     returns actual build id size in case of success
> @@ -334,8 +334,8 @@ int build_id_parse_nofault(struct vm_are
>         return __build_id_parse(vma->vm_file, build_id, size, false /* !m=
ay_fault */);
>  }
>
> -/*
> - * Parse build ID of ELF file mapped to VMA
> +/**
> + * build_id_parse() - Parse build ID of ELF file mapped to VMA
>   * @vma:      vma object
>   * @build_id: buffer to store build id, at least BUILD_ID_SIZE long
>   * @size:     returns actual build id size in case of success
> @@ -354,7 +354,7 @@ int build_id_parse(struct vm_area_struct
>  }
>
>  /**
> - * Parse build ID of ELF file
> + * build_id_parse_file() - Parse build ID of ELF file
>   * @file:      file object
>   * @build_id: buffer to store build id, at least BUILD_ID_SIZE long
>   * @size:     returns actual build id size in case of success
> _
>
