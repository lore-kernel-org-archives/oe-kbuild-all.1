Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636E1EA8D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 11:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712058196; cv=none; b=Dm1VmMVZOR19mTQSwLLWoZXtJjmXxHyVAHPOUNUwYfzwAadwUl9hbCrJAsrdImo6DHRYJD9zUBxakmcZW/C0sK1z3ioIHexwhqPGT9NfpT3gcpZE5NiiMaaWG9JyUs278o/QDTGiousuAeAiDxH/D0JxZ9800CgvyClvTvDGtZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712058196; c=relaxed/simple;
	bh=wfh9sdADz/bkMRKMGA3whYn+hr88GJ3D+Zq/YxNJhsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pyufxuymcf3wU+agYEV78iXxwOBD8WsObFb+pe7oMGMJocaf6g5knoJEcJUn8E7UAy1iEit+i1zQmcUdNAc4bfISLN8hJh/Xe9tB/vYY79bmBVyQmBUGm6K8cN2ipIKX8qsr903fIoe4FFhmHK8mbm/WmGgumeUWXkvt8jCA8UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPUjVQkY; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPUjVQkY"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d6ee6c9945so37477671fa.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Apr 2024 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712058193; x=1712662993; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfh9sdADz/bkMRKMGA3whYn+hr88GJ3D+Zq/YxNJhsk=;
        b=lPUjVQkYShV6JHMq9MXuTGvibEL9ut2unwfRRogpNTl0zw+fwYWn+XB9sTZsb2aFdS
         Y5ofVfvN2UWmNIiLkXfKQzkA4YvJEImfpL0cVxp2ueKYnGv84MAUh8Dl44snlhSVNO8Y
         ODqHfq3hkqr4YgtWYneLqfcLVzUXjEj3rVtIfDqwBC4IDv7mUt8KAXohbjSVs330XCvL
         lwa+/YtR12n0d4JvmW1cE5Zlw5R6IOJla8/+pNFhhsDVV702U+ioYnYDDzgca3XU1Lt4
         o+pZ5eSpmZhpjHQdnjl/KWna55HDeyXfr3+f/pbzkQpsdykUEBUsdYKNQc3gxzZDyeft
         fxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712058193; x=1712662993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfh9sdADz/bkMRKMGA3whYn+hr88GJ3D+Zq/YxNJhsk=;
        b=MtrbaNuihl01QkoSDEh33H0+vdaAC9yGSFPN0hrvmeidWHS9pvf8wQ/YEJkF9QOvo2
         VmVpkKJcwZOLTg3OmRCPS/C/F0bTbpD2qPx2UWVnLvkLI3knZVWry/NiWjO1+9bgBYTz
         G0RJoKunQQPebdt9K7oTVOJtFjxLzIDOWGa+DRt8BJJzJceBJdg8/a+AFfOAXFwkwzuB
         idPjupczTafbgiY0wpegFTbZ83GSQ/pDz4R5Xp/JsFwUZc3sM9OBWdg83eTdfBGX5V/x
         nnuUpWDZCqw2bjS2XUqZ2IBRrhjnNqELqAWhpKndc16mjp5Q9gEi4So4FBwV+tYgmlwc
         7CcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOYwfvlIH9Tt/nbH9At86mAtJPKXRImEkBAyQQkqwlpwKiF8iJgHwlh8H3v2W4XVGS5pg74sDWjjDydcu0Ocu6mLeHqYryNwgJVB2Pew==
X-Gm-Message-State: AOJu0Yy1FZfajxhaZxcUL5hdpA2FSv0v/TQrlbqTuy/OLoiwNOO9DCDA
	3W51fT0glwpJ0h9sY+UW/F48UU8M2m2TGfd7e8dec2O9eH+eJRyrmp+DJjD9ksrxYELYe8GnBpt
	1gOAtSUfDQA+E4omeZsGVEuf60lc=
X-Google-Smtp-Source: AGHT+IHMiuP3xigqbDcdZMSkqQncGuzQsCB3N3dWLYh/ZbqrYdtCqXXL5aPE//+dkVXzg2TC0TA5QtrXngsIwZkdIH8=
X-Received: by 2002:a2e:7a13:0:b0:2d4:2958:6daf with SMTP id
 v19-20020a2e7a13000000b002d429586dafmr7478985ljc.20.1712058192551; Tue, 02
 Apr 2024 04:43:12 -0700 (PDT)
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
 <87bk7ux4e9.ffs@tglx> <CAFULd4aEe2KU=UXEt2=GeLQq2uTSFvydBiwAdSa7B6T61Am=5w@mail.gmail.com>
 <878r2ywk3k.ffs@tglx>
In-Reply-To: <878r2ywk3k.ffs@tglx>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 2 Apr 2024 13:43:00 +0200
Message-ID: <CAFULd4YG21NdF_qNVBGDtXO6xnaYFeRPvKicB=gpgUUqYE=4jw@mail.gmail.com>
Subject: Re: arch/x86/include/asm/processor.h:698:16: sparse: sparse:
 incorrect type in initializer (different address spaces)
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Arjan van de Ven <arjan@linux.intel.com>, x86@kernel.org, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Sparse Mailing-list <linux-sparse@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 8:07=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Mon, Mar 04 2024 at 06:42, Uros Bizjak wrote:
>
> > On Mon, Mar 4, 2024 at 12:49=E2=80=AFAM Thomas Gleixner <tglx@linutroni=
x.de> wrote:
> >>
> >> On Sun, Mar 03 2024 at 21:24, Uros Bizjak wrote:
> >> > On Sun, Mar 3, 2024 at 9:21=E2=80=AFPM Uros Bizjak <ubizjak@gmail.co=
m> wrote:
> >> >> On Sun, Mar 3, 2024 at 9:10=E2=80=AFPM Thomas Gleixner <tglx@linutr=
onix.de> wrote:
> >> >> > That's so sad because it would provide us compiler based __percpu
> >> >> > validation.
> >> >>
> >> >> Unfortunately, the c compiler can't strip qualifiers, so typeof() i=
s
> >> >> of limited use also when const and volatile qualifiers are used.
> >> >> Perhaps some extension could be introduced to c standard to provide=
 an
> >> >> unqualified type, e.g. typeof_unqual().
> >> >
> >> > Oh, there is one in C23 [1].
> >>
> >> Yes. I found it right after ranting.
> >>
> >> gcc >=3D 14 and clang >=3D 16 have support for it of course only when =
adding
> >> -std=3Dc2x to the command line.
> >>
> >> Sigh. The name space qualifiers are non standard and then the thing
> >> which makes them more useful is hidden behind a standard.
> >
> > With GCC, you can use __typeof_unqual__ (please note underscores)
> > without -std=3Dc2x [1]:
> >
> > "... Alternate spelling __typeof_unqual__ is available in all C modes
> > and provides non-atomic unqualified version of what __typeof__
> > operator returns..."
> >
> > Please also see the example in my last post. It can be compiled without=
 -std=3D...
>
> With gcc >=3D 14. Not so with clang...

Please note that clang-17.0.6 currently fails to compile kernel with
named address spaces [1]. So perhaps kernel can use __typeof_unqual__
(available without -std=3Dc2x) in the hope that clang implements
__typeof_unqual__ in one of its next releases, following the examples
of GCC [2] and MSVC[3].

[1] https://lore.kernel.org/lkml/20240320173758.GA3017166@dev-arch.thelio-3=
990X/
[2] https://gcc.gnu.org/onlinedocs/gcc/Typeof.html
[3] https://learn.microsoft.com/en-us/cpp/c-language/typeof-unqual-c?view=
=3Dmsvc-170

Uros.
