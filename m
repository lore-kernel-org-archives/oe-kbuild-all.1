Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A92EAB91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377030; cv=none; b=igboL741gJXxSDRWWoew0OznSc797O63XyUZlX+ARA9OsW+rlEYus+q7w9654B3VGjdxPhXKb0eFdla8EiNbyr6Ik8ej4SBqJ5CQAoz4N+ZPUvZrN/pXKZIbYSTjD3cuQgCLcl3Jl1Qkrz5nMgQB58+HQlhEkniQpl9u+GduUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377030; c=relaxed/simple;
	bh=BXxKQvzobe5wQ3xYmuCvC8UMynXnntS8L6QJrFyzNtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0cEYbXYMyePgf76D36wNXXfS538tIvHtNAB849wsZpSusgRFgMlwv5kB5aX00xtnfiVeKq4TR4ncgEasnXfD7UvHuBUiQGUfZL52CPfggTHKMi69R3oevojUynh/Unu7ZNPwQJg9EbmUCIUfogLep23xTRYkKj4eO7yvgx9g5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tCuyOLzB; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tCuyOLzB"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e283b2d065so6075ab.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753377026; x=1753981826; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLgUSpYw53cKLUDxe40QFSqFx9VHdgfTQvYmq7qO0B8=;
        b=tCuyOLzB1Mzql0JFc663wdZmlBXeQy7+tSJnsPma/BwlLD1jQdNtTUuJnXikBubFTy
         2HB4By7rV38d8Pt0WrXLqSg/j06OxW6F23998oFxL77EJwyuKUbq5gRBd14Dl589kNnW
         k76ehCmeK7jpiDfecn9tnug+dWdkSI9FYBaN/pqV2It+b1DbvZnnG8xp6JEnlUoLjkkh
         QzlndNpOML+PwPjeig9RQo+g+Bh3pI9VeqRkwi7w9B79SQhKixqJvA+i12u4OPXuC6lM
         aipWoJr5zl1JckfZjfszV5Fo3jrTOWT9+91NxowYp+0HL6PdcDGMzcPWdY7QIeyZCUmM
         yuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753377026; x=1753981826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLgUSpYw53cKLUDxe40QFSqFx9VHdgfTQvYmq7qO0B8=;
        b=ZM/yfQ50F+EkdGyRLhcMmAcb257xNRFTxZA5wV0Vs1+MwZeYynePdR/du2qiRfhXj7
         wCj4PyI3JJewBb0xAtpqF8LSywV19MuBeDbQZxlXJNUH6L2Yi2V4dcNEL37iyFZZgcTd
         Q+FbtJJJj/9YkCV7AlFa93DFZaB93hyerVY+JpKcGJPjzZ6LgxWQJo6kgZOIWiFYH5J8
         jiU/ceSToNvF5zLxqKGIVCqg11zhP/JadJ671X4faYFcsx1/jBRDsi7GHm1rCZGqqpKr
         YFwuXbxNhxEX2nRPYl6evv8WerY1UhvMnCe0rkOdIbjFKiPuMy/ZQpyiTYgx4eko3K3s
         xt/w==
X-Forwarded-Encrypted: i=1; AJvYcCWPYalJpvqYkOXIRbrTaQDWZT4xQcfPrMGZK8wocxpJFwG8yruriPyfgaEDHmyzC+Z96o4Ff36yXrNlU4+k@lists.linux.dev
X-Gm-Message-State: AOJu0YzPxq1Wi95B4zDPoxV3Sd9ROzs9cwxZkenZAU64vd09ATq6jLew
	L05WHlVICEhZ35HdTtHux+DytZOVaQdmCzC8G61KQhnA49KGJsO2khl1LhjwS7Y7K7WsSRHXPJO
	lSIt85FU22r1zur965Hbsu/eflnR0ghboWe5L4VFT
X-Gm-Gg: ASbGnctAgGnEBWK7bVZj8ZxUINa4k56kD6wdmgnEI8h9ZauZu+jabUPt3lqJwl5Sc2l
	BD5+GZvFvEsoPxuGqNBFtUcWzDX3IF7Up8ETZbYYpEEk1p5NEOCKxnPzDgmZBYVA9AIZFh3Zdzd
	HELG3Z+Y65erc6uL65P7EsPaSog+N3up3Iexd14B+Em6o1oEa0Mj70+o98+Q46/pyRwz1qbTirb
	zxVBEdxUBpU02AbTnJLdI7NBPLMGcQtHTj6
X-Google-Smtp-Source: AGHT+IE8b1+9raOGesHfGm8k94AzrKSvF5YlDcl6t0VjEks3fbr8R8bSxUctdy4iwWVOqk6bssyVAo2+k1XA8p4oSsk=
X-Received: by 2002:a05:6e02:9:b0:3e0:4f95:13e5 with SMTP id
 e9e14a558f8ab-3e3b64c0bfcmr5891225ab.24.1753377026297; Thu, 24 Jul 2025
 10:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202507231135.OtEGYfnQ-lkp@intel.com> <CAP-5=fWXcGiWXeb8=165tCVtEAYX7qkVUpanbpmg=Db=kwEP0g@mail.gmail.com>
 <2923e512-36f6-4cf3-9606-18031167a93a@gmx.de>
In-Reply-To: <2923e512-36f6-4cf3-9606-18031167a93a@gmx.de>
From: Ian Rogers <irogers@google.com>
Date: Thu, 24 Jul 2025 10:10:14 -0700
X-Gm-Features: Ac12FXyR-7lBitRsNkqVgrna1c0hkaAl18mvxhank8-IiRE-018c4PqLhz59BRM
Message-ID: <CAP-5=fUiF26Ay+W+fUTRe7EOjEJXk5k_eNe6Yh7SD=GSYAssVQ@mail.gmail.com>
Subject: Re: [thomas-weissschuh:vdso/unaligned 1/3] include/vdso/unaligned.h:21:9:
 warning: '__builtin_memcpy' reading 4 bytes from a region of size 1
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-parisc@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 9:15=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
>
> On 7/23/25 18:11, Ian Rogers wrote:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/arch/parisc/boot/compressed/misc.c#n28
> >    /* output_len is inserted by the linker possibly at an unaligned add=
ress */
> >    extern char output_len;
> > ...
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/arch/parisc/boot/compressed/misc.c#n312
> >    vmlinux_len =3D get_unaligned_le32(&output_len);
> >
> > is reading a char as an le32, so a 1 byte value as a 4-byte le32. It
> > appears the code didn't originally declare output_len this way but it
> > was changed in commit  c42813b71a06 ("parisc: Fix unaligned-access
> > crash in bootloader"):
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/arch/parisc/boot/compressed/misc.c?id=3Dc42813b71a06a2ff4a155aa87ac6=
09feeab76cf3
> > -extern __le32 output_len __aligned(1);
> > +extern char output_len;
> >
> > Using __builtin_memcpy for unaligned values is sound. I'm not clear
> > what the appropriate parisc fix would be nor how I could test it for
> > the "unalignment-exception" reported in commit c42813b71a06. I suspect
> > the fix is to revert that commit. I believe we're seeing this warning
> > now as the casts of the previous __get_unaligned_t would hide the
> > issue.
>
> I'm afraid that if you revert my patch, the compiler may again "optimize"
> __builtin_memcpy() to a single-memory-access assembler instruction, which
> then will fail again if the variable output_len was stored at an unaligne=
d address.
> So the same issue as described in commit c42813b71a06.
> Please note, that this is the boot loader, where an in-kernel
> unalignment handler isn't functional yet.
>
> My proposal to fix this is to avoid -Wstringop-overread when compiling
> this file. Maybe some Makefile logic as done with CFLAGS_REMOVE_fpudispat=
ch.o
> in arch/parisc/math-emu/Makefile can be added

It is probably easier to add #pragmas. Is there a concern that the
compiler may detect undefined behavior and just do something garbage?

Thanks,
Ian

>
> Helge
