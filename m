Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A967C5C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709497456; cv=none; b=VSBvAaW2V9k1IPUPTGWQ34TZILcdQpCOnuC/VLg3UFK04aHAL1vy6dFJuysM9C2a/6mLJgoiEf2uOlHLlWgO8xUHszjs5v6DBMe5nClsiL7TsNiWj2VVa4m4kh8zlWFnAsNm32UIWDom2pfcnPClZrtVqJQemoM0T/Q7jsDow/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709497456; c=relaxed/simple;
	bh=wKfsyUf3DPHLb5+bNe7is8QSZZffVwOf6cpgOfSIHKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EewBtNmDEbHQiYL70csS1JsLIY70yi7d1IgfWGNPohg1W8o8dUPfli/P917VAuPOdKaBKKBc19NX3BIdKiS3Fdb4Aw1Uv3BH98tgoxb1ivshUvc4s69+CzPjj8qyF6pW9rkgT3mPvM+e2+mN0XFmMSMDBlqL3P5ad/2+kwD1q0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdCKbc4b; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdCKbc4b"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso44530711fa.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Mar 2024 12:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709497452; x=1710102252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKfsyUf3DPHLb5+bNe7is8QSZZffVwOf6cpgOfSIHKM=;
        b=cdCKbc4bTANivNK0XMIYLnHGE1TDfs93r/Jbj+CTEH1AkvXl7lNl1g6A9IGX+Ij7nD
         r7GZDkn9E/p57gsIZ6XX6lxRfPA7DVaUAWaMmv7HFcBAgRV5ETNTn8Qh99eNCJrPjBHf
         b6lPcjbBgeRhJkS9Fg2CRj6WY5dmb+N/gP0Gx4B55Wcb6dHWuY844iNCSeHZczVgaJmU
         V5Ge91TJrnoD3lGPkKUFQWc7VScXyibT7TYuW3Bii45CRSu6fu+FA5qZnHItyTdAGw8e
         y+hJsRPS3ZyYFymJ4h1Dj4qg8a/yT43vTZlbjRg9yyRWfuy9IDBpASnwpbiZQhYh+HBe
         nf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709497452; x=1710102252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKfsyUf3DPHLb5+bNe7is8QSZZffVwOf6cpgOfSIHKM=;
        b=ipO4Zck2/mequ0yOYhZZAQkC+ubU9oCe7JxluDHSKDMwPNTvbdrkfvjKnOCFVIznS+
         wblHRiCcbzPREfGeFD3IsDgYBGYUIpzSuax7VehrTLV9Oq7KQVp5HM++PAXu1rJXs5Ww
         fthkF7Q1Uckrcdm+9he9jkNvj4q9bv7N6ZoXeufU3397OEuLRQYDGOivcpwb9/9PkaiM
         jvTDGdjFcVOytMIeugoIIBXk25xOrY/wNMXL5lML3tWhkmb6NvEgtGo6Jyj3mUKzlcbl
         NWBKtVh7cAcu9YwRuXmNYTum9dtRc75NcXtz2S6rYgA98MeLoLk0N/ZmauvLH0F+/HW5
         q+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVsOPvMbOeWCMYcekjFOwg98wsvGjBYJmTUj3d2jfUFu9LFfnvfOlNAr6QYrmcZjpLmQ/3ZLnEw7UeQuS043UE7eGwUTUMJYGuMwrbNcA==
X-Gm-Message-State: AOJu0YxoDVcnn/sXmz1IrILiSqsUx6/gM2fojzhZP0RHHbdFs4EGsMYO
	SXSn7tF4UHqC10VFLv6oDNXudUkQtVL+DyjQF/vhBzJlqyIvNXnV/E879TaJ+UJFToNMcVS/lQc
	Yw1pBRNgWMfRq9xMJfVA6/6jGr+c=
X-Google-Smtp-Source: AGHT+IH9bgy2FSfFF72RMPmbMdDYHA6wFzmSr/xvr072k/oq5qVLt8Zj4vIQU4el/XJcMmoQ/A0OKARpu3Bdzci023g=
X-Received: by 2002:a2e:824f:0:b0:2d2:a19a:8625 with SMTP id
 j15-20020a2e824f000000b002d2a19a8625mr5046603ljh.40.1709497452384; Sun, 03
 Mar 2024 12:24:12 -0800 (PST)
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
In-Reply-To: <CAFULd4arHT+_fy9_oUNpmsvyfVPGaeB_pdeuqVS3UTpP5R757A@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 3 Mar 2024 21:24:00 +0100
Message-ID: <CAFULd4b0HN6eUJsOW6po8Hf16T3eMhjdKUvw-TS8yncNn-+Vyw@mail.gmail.com>
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

On Sun, Mar 3, 2024 at 9:21=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> On Sun, Mar 3, 2024 at 9:10=E2=80=AFPM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
> >
> > On Sun, Mar 03 2024 at 20:03, Uros Bizjak wrote:
> > > On Sun, Mar 3, 2024 at 5:31=E2=80=AFPM Thomas Gleixner <tglx@linutron=
ix.de> wrote:
> > >> I did not follow the __set_gs work closely, so I don't know whether =
Uros
> > >> ever tried to actually mark the per CPU variable __set_gs right away=
,
> > >> which would obviously catch the above 'foo' nonsense.
> > >
> > > No, because [1]:
> > >
> > > "gcc does not provide a way to remove segment qualifiers, which is ne=
eded
> > > to use typeof() to create local instances of the per-cpu variable. Fo=
r
> > > this reason, do not use the segment qualifier for per-cpu variables, =
and
> > > do casting using the segment qualifier instead."
> >
> > Right. I just figured that out myself when playing with it in user
> > space.
> >
> > That's so sad because it would provide us compiler based __percpu
> > validation.
>
> Unfortunately, the c compiler can't strip qualifiers, so typeof() is
> of limited use also when const and volatile qualifiers are used.
> Perhaps some extension could be introduced to c standard to provide an
> unqualified type, e.g. typeof_unqual().

Oh, there is one in C23 [1].

[1] https://en.cppreference.com/w/c/language/typeof

Uros.
