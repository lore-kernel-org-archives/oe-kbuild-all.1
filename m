Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863ED67A0D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 21:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709500806; cv=none; b=s95Gj9AM2HPa5yrk3teuNCTGVOyLz9ZNe0opEJO7WgpIMm8wCdxWbdcrCVZoLnSsgX4qyAwyUHWs5wCJ7lQ84moGtfb0IanlLEMoUzbyGu0MElOBKYeXIOLOG6fER/+Z0pqNm6XEdeK3h9rvgrxDhITuzgmhNegVh3CgjiEXGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709500806; c=relaxed/simple;
	bh=b1+PGDPg3AaCd4KGYAy/tgATvccAE7wfNpG/Ok+p19I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FlUOJNoctnv8wlB1EaqTZ/+OpbY6tE9bvOxNyicVK7ddvtcAcktNI7mgET9S9JatehxytJIS2ywh0g0fAmJm78R4zRFLTPjBlppKt3z6Bf+w6+Wao2P/QAsFlCsHfHjcJLGk8oNhKEy4z2OpKFbDht0dKzbJKmumQLrqek8tJUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bj6VxF64; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bj6VxF64"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d28e465655so55487661fa.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Mar 2024 13:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709500802; x=1710105602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BwYkjBXlBZesoIUNfa0a3rUePDN3R4LPFfw17Gvsbs=;
        b=bj6VxF64JqHJZ8+Es9oY/3tble9O88WRQqS4i6FsP7lJvmd9hW+ugrkKR76hp/AT81
         n/l1u5Ag1frxjQF4BLd3ug3pR5LOTDYlUGhNEdHitZUhI9UWigawfnuy9Th44WmsMZUK
         HtqXRdm0/lhuH8g39IJj+IhqvVXm2wFFBL+T+dRUlkhO5ziC/6zwbRpmoK+UT3CQqQi5
         Df+drFGSbgwh93JGGcIAjvohWOvbE/uXGODd6/HKJTTmM0R+D9KUbuBUJHJ6foVuJt7N
         M7QChUOB3jFGuaaWx59qp4KONyAZFh4SMgp4gN+mwYWoUOLhBRjV84MwvohCcuwnL4Jv
         T6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709500802; x=1710105602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BwYkjBXlBZesoIUNfa0a3rUePDN3R4LPFfw17Gvsbs=;
        b=ig/hr1GHj3Wg9xdKAux0dpogCBesv+sEGa6niIPc5lf1iAOv+VGuXVZHBVMAcwCRF0
         6oGe1aClsLwHp+VGaC25WkNez8qqevgwzjVkCpfUheloB36iFOSgKuB/zDJfOtCYsjxV
         +AtFaIUebpjJPluIiYG3BI2/BRpvfpq2sDP7P3W1HGEhTMc12E5hDv1mrp2UH+gkM368
         qfOb2GZclVu8T8JUNOaSJBodqK0xdbHFckMzfYd9FW1xlOH7hMTYiWv43zqB9WxVLWgw
         tCIwAbw++IBReOc7Gzb3milBpkLfTXkJdF7H3DjXJNkpaEAM+Pr/HhwfMNFr3Fo3nIl0
         E6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUDSFobINVT60wIWAl0WDcjidydXXd414ZUss2I1ezzvar3Sz33jye4Z/8j93M2TMECkfgu0j5yXlpomopGv6DyIkhauQbswDR7aBUN7Q==
X-Gm-Message-State: AOJu0YxpOudrlyBliBbrm9QbtR7gf/JJB3nqF52Bv6XXYJ9QFvNOO4q4
	W8NELqxPfyzddpeYr9GE0AXQiWcuMYbyGcZupBUf+dqkP/4AdDoAQlDd4jlXvs8cPesxrvLOfzS
	O1l6jm94yzEtcPhSE1VIYlNxcn4I=
X-Google-Smtp-Source: AGHT+IFeOfOK6bx9XjIbBUV/ro9/M9cYaBUN1wdFhPsEa+HXrbjG+tPS3TvhIw/LocOC5VYdXXXAFZGpDAO0VhFV6pE=
X-Received: by 2002:a05:651c:1689:b0:2d2:9fc2:9bb8 with SMTP id
 bd9-20020a05651c168900b002d29fc29bb8mr4590358ljb.25.1709500802496; Sun, 03
 Mar 2024 13:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403020457.RCJoQ3ts-lkp@intel.com> <87edctwr6y.ffs@tglx>
 <87a5nhwpus.ffs@tglx> <87y1b0vp8m.ffs@tglx> <87sf18vdsq.ffs@tglx>
 <87le70uwf0.ffs@tglx> <CAHk-=wiWhfdc4Sw2VBq_2nL2NDxmZS32xG4P7mBVwABGqUoJnw@mail.gmail.com>
 <87edcruvja.ffs@tglx> <CAFULd4bVEUBEidTLbHNzRaJbSjXm99yC8LT=jdzFWb7xnuFH7g@mail.gmail.com>
 <87bk7vuldh.ffs@tglx> <CAFULd4arHT+_fy9_oUNpmsvyfVPGaeB_pdeuqVS3UTpP5R757A@mail.gmail.com>
 <CAFULd4b0HN6eUJsOW6po8Hf16T3eMhjdKUvw-TS8yncNn-+Vyw@mail.gmail.com>
In-Reply-To: <CAFULd4b0HN6eUJsOW6po8Hf16T3eMhjdKUvw-TS8yncNn-+Vyw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 3 Mar 2024 22:19:50 +0100
Message-ID: <CAFULd4ZQwhASjvfya6eYv+9hMf=aQmSpW0wLSKPES4DRm0qeWQ@mail.gmail.com>
Subject: Re: arch/x86/include/asm/processor.h:698:16: sparse: sparse:
 incorrect type in initializer (different address spaces)
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Arjan van de Ven <arjan@linux.intel.com>, x86@kernel.org, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2024 at 9:24=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> On Sun, Mar 3, 2024 at 9:21=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
> >
> > On Sun, Mar 3, 2024 at 9:10=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> > >
> > > On Sun, Mar 03 2024 at 20:03, Uros Bizjak wrote:
> > > > On Sun, Mar 3, 2024 at 5:31=E2=80=AFPM Thomas Gleixner <tglx@linutr=
onix.de> wrote:
> > > >> I did not follow the __set_gs work closely, so I don't know whethe=
r Uros
> > > >> ever tried to actually mark the per CPU variable __set_gs right aw=
ay,
> > > >> which would obviously catch the above 'foo' nonsense.
> > > >
> > > > No, because [1]:
> > > >
> > > > "gcc does not provide a way to remove segment qualifiers, which is =
needed
> > > > to use typeof() to create local instances of the per-cpu variable. =
For
> > > > this reason, do not use the segment qualifier for per-cpu variables=
, and
> > > > do casting using the segment qualifier instead."
> > >
> > > Right. I just figured that out myself when playing with it in user
> > > space.
> > >
> > > That's so sad because it would provide us compiler based __percpu
> > > validation.
> >
> > Unfortunately, the c compiler can't strip qualifiers, so typeof() is
> > of limited use also when const and volatile qualifiers are used.
> > Perhaps some extension could be introduced to c standard to provide an
> > unqualified type, e.g. typeof_unqual().
>
> Oh, there is one in C23 [1].
>
> [1] https://en.cppreference.com/w/c/language/typeof

FYI: gcc-14 compiles this testcase:

--cut here--
__seg_gs int a;
__typeof_unqual__(a) b;

int foo (void)
{
  return a;
}

int bar (void)
{
  return b;
}
--cut here--

to (gcc -O2):

foo:
       movl    %gs:a(%rip), %eax
       ret

bar:
       movl    b(%rip), %eax
       ret

So, it *does* strip the __seg_gs qualifier here.

Uros.
