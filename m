Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB01EEF9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 20:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709497297; cv=none; b=aypzPDrzLq//Zz6r3e4LdR6M07ULbX9epuIn6zFXefRyp1C47HKq311t25SgWAfT+dQaq3cdOdYUy7d8i+WT2GmI3vnSdtBUVSM7R040suhSFRV/le1mn82jBMU4bzF71+vtZW271V7YGcq3/kVemIzv5LKlxa5fNlZQsj9ob/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709497297; c=relaxed/simple;
	bh=Q35YAZglOxYGDpRSAGOwZwk3SdJ6ZQoJ/uPZMfRrgyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eedFUwbZCxBmt3Cph042/QbNkrMpM4qyTftt9pAr/lmXbnERDFrVtK5Y4e68VMuQUK2vwDszrh5Y9UuZ7rz1Kouvpd/c76uTaBDcZhHhePJMnAcL3ze8n7ssod2jbWAnW233T34DIayUEamxnHFSJPoJ5/I1xT8RYt+LBzEdyXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abRz26JN; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abRz26JN"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d2fad80eacso44883331fa.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Mar 2024 12:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709497294; x=1710102094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7rADcp8cd3a5Ybe7Fit1F3MeRi+39WRSfwok0lZWxA=;
        b=abRz26JNrnCk8QKVQGjp4Sxr16szD0lzh71K4j/xUztaCHVjywcqxaLXybbgUceDY2
         OkDkBzPLN5xWvbj5BiActWxPOov43A0Y5cGs4COfJGxlSfGZtti+GTyer2GgxZPj4suo
         YLkw7WR04T1i7SS5x30KicJOVmXiTXTF2wLosEejOQ3N+ngVjUx/qWcj6m0pkK+yCp0h
         8rkuvxTYXR3ocT/CmvEXY3PHn3dDlhdku8dEqOMmxNx4+LsQCaYiHjz/NUlLYv0hCnkg
         z3v91/qWy2MbYE9BYM9thnvAliSNfEbvkJmyVfgd1cWfaPChK4/5/hqN08xtV6fJtOJx
         U3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709497294; x=1710102094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7rADcp8cd3a5Ybe7Fit1F3MeRi+39WRSfwok0lZWxA=;
        b=Cl2cnbIPKf/S05sy63wuyiW+zIfpJQ/uVaBVLPk1LCBao4hcaloxePkUzK55wHRM8V
         hbSXXI+LUiuex0zn0ZASFegLMVn1O+cDEG8/e3Mp2YjLGpDqqsZmqHzq9/kyHFLa70lE
         nZMJSBfnEhanBl+hpfOf9LQlmF1AOjkhTEBtgkqcQ86zPu61ZbNVpA6zylfOCvKCaE+W
         FeC5pYYMxH0KIkLY811cA1QltT0WOzoolHhZ+PIZ4DmUst7mi4Ry8/vedPd5iJik9vOR
         mlP6GdKrtftdf+5kg2uZsKx7IY6Br+RU3fNtZXgQoxg5MnQEtZwaQpsyEYowBZFkWHYV
         WgFg==
X-Forwarded-Encrypted: i=1; AJvYcCV4T192qCBXPAq18wfDu5MN0sefTgWRqKdAY9w8b8EZ3Dna1A7Fb+YVwAOibYKZAhC4oNXp3EME9Itr1ptlH9l/AOxTEURP4aJRqGnsCA==
X-Gm-Message-State: AOJu0YxSuhUEbLstyaa3WXCwXrb/dZ8yAVf8t0S4wi1XftWeX/b5grZm
	k99LYDT9UYEWLenJEhlRhfJpGcB3eaJmdW+MjWC85I+8TUQBPP9EK95NIhiX8f2uqiTlzTuIe8m
	UZe/MO9nC+7fBlya5OgWdDTtTL9o=
X-Google-Smtp-Source: AGHT+IFxzrAqNk8fA92YYJpvZJNt/kHy1rRa4DBkd0uvc3IOknUgd6d0DvxW55b7IB8ZEWE4u9x76ucY5Uij8msbFv8=
X-Received: by 2002:a2e:92d0:0:b0:2d3:93dd:c54b with SMTP id
 k16-20020a2e92d0000000b002d393ddc54bmr1606888ljh.25.1709497293411; Sun, 03
 Mar 2024 12:21:33 -0800 (PST)
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
 <87bk7vuldh.ffs@tglx>
In-Reply-To: <87bk7vuldh.ffs@tglx>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 3 Mar 2024 21:21:21 +0100
Message-ID: <CAFULd4arHT+_fy9_oUNpmsvyfVPGaeB_pdeuqVS3UTpP5R757A@mail.gmail.com>
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

On Sun, Mar 3, 2024 at 9:10=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Sun, Mar 03 2024 at 20:03, Uros Bizjak wrote:
> > On Sun, Mar 3, 2024 at 5:31=E2=80=AFPM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> >> I did not follow the __set_gs work closely, so I don't know whether Ur=
os
> >> ever tried to actually mark the per CPU variable __set_gs right away,
> >> which would obviously catch the above 'foo' nonsense.
> >
> > No, because [1]:
> >
> > "gcc does not provide a way to remove segment qualifiers, which is need=
ed
> > to use typeof() to create local instances of the per-cpu variable. For
> > this reason, do not use the segment qualifier for per-cpu variables, an=
d
> > do casting using the segment qualifier instead."
>
> Right. I just figured that out myself when playing with it in user
> space.
>
> That's so sad because it would provide us compiler based __percpu
> validation.

Unfortunately, the c compiler can't strip qualifiers, so typeof() is
of limited use also when const and volatile qualifiers are used.
Perhaps some extension could be introduced to c standard to provide an
unqualified type, e.g. typeof_unqual().

Uros.

> Right now this simply does not work and __verify_pcp_ptr(ptr) is not
> doing anything except when sparse looks at it.
>
> Sigh.
>
>         tglx
>
