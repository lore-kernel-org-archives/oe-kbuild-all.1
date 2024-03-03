Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05947641C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709492652; cv=none; b=l06fS3o+UllMrbH2GiSNsOZsr5kgPNitLsvAja87mSx8+RA99ONRXCbK9iMQ1vI0Q5HunXXtn1BgQb28l4A9QGO4EwchaD7iyq/lATtgpLlMvwHgG/Y7uxAUcarVT7874TPdBYr2kQ2g/Fm+rq++QGAz0L7aD8rNQrQq67vwEKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709492652; c=relaxed/simple;
	bh=XcvvUXceBSb176i0TRf9vtM0/PGGD8QMPdQJXgBDrGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7b3vbwHLZ53KRcERnPKgtEbZ2TlAjQ6H0MAtqzSymMAiXGCzUBNlkwleObYo9ozo1/zwmdFJnV3kf8Ltl6Rhe+/9nSDvx0NGt1JMWU4lirzuTbSTG09/YXzSk9qjyjD3nez8hcqf+5E2dqx65gnsaoQ3pKpa4v/bRzmLBrPqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSOGL+3v; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSOGL+3v"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d26227d508so42438751fa.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Mar 2024 11:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709492648; x=1710097448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DVCx1/HHcWKKtGLW0BdzytODfQzaAANbwcrDliILZk=;
        b=iSOGL+3v/E7ovOPqSqlE4YkUgvSSR1XVHaGCzULMMQ8NNOTpqSQK/x6owyPWk+nG2M
         wzWHCefH/dXlxDM8/89n/1g8xD46kJFWPYLjR4rFkzdZh0MihGKs6e/oQTyr9wyERGni
         6wITF8cxYxqm+5pnAX1Nbm4/8MBfdhcQb+xVaaN0PUOt7frLadY83GfnuhlDkc2T46PG
         KlW/KsLgO7tuSwTErx/Xca2kgVDVMgRE/mT5wgeh032zB2rTRna6kqZ5XTCsP4TLTVKQ
         D2AidziCLCwWkpqkrj+ZLvh2J2MojOQaEypyU90l+QsaQbsBLPm/dINTqbCjK2p4xzvX
         4zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709492648; x=1710097448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DVCx1/HHcWKKtGLW0BdzytODfQzaAANbwcrDliILZk=;
        b=U1NFC2tY6z9EFw3ORNPdmJf3E98DqAuAmk7emuoDY+qdVAPN1+Kl7DpF/QFEZvcRcn
         BHkTf0ffH00EZ8tHK6cDt9FbC/aMBHsrpDN/dIOw9kepB/UL2W3h7Jf7iN/8g/l7OWNa
         dpX1vwMZot23W3eG2R4jFAEJgCs7cI6c2SBWHXJC10WWLoyFvJp/me6zLZ+v9gxTv3xW
         /gA9TwT0X1QPiXHX50sp2+hzwLEs5epM6ARiQ/BexU4sUZ4QSVwcZfD8MwV87WPqYP5l
         Pz71AtUrzU9dnXkASVaUoiJHpV0TUzsoQcSgeYXAY608oGq+7hgkD5FX1Uuf4mBYWUMT
         DHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2x6ctRq8cX9Dztm0fQHrPAkQZkjklfPwyWs2ygEkp/Kdo4OChYOldz2l2IHuEB3D5Q+SB0E1ouJHVincjFgBS9KqBmy91sbsAH9awPg==
X-Gm-Message-State: AOJu0Yxyk94prvr2ZPeOGqQ2hoMIqe1pYlnEZCfhafsAB8vEl/M9eoUx
	T11BAac6PTQ6QDs9sSbOMeRFgo9IlYIUxy013znOjSML5aROd0JPuhx9iHKlfGeQwJsTd0kiP38
	0TBrF53msqhpPzedCI4QRc5Aopk4=
X-Google-Smtp-Source: AGHT+IFCSdD6OHt6bljSwkVkmweyQrmbR5W6Rf3Y/xTV8dRYMkGvWt4G0Q4Zm0KA/B2fjDQRxo5V6x5AwJlIy4MUrgI=
X-Received: by 2002:a2e:6e10:0:b0:2d2:8fb4:46cf with SMTP id
 j16-20020a2e6e10000000b002d28fb446cfmr4825247ljc.15.1709492647620; Sun, 03
 Mar 2024 11:04:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403020457.RCJoQ3ts-lkp@intel.com> <87edctwr6y.ffs@tglx>
 <87a5nhwpus.ffs@tglx> <87y1b0vp8m.ffs@tglx> <87sf18vdsq.ffs@tglx>
 <87le70uwf0.ffs@tglx> <CAHk-=wiWhfdc4Sw2VBq_2nL2NDxmZS32xG4P7mBVwABGqUoJnw@mail.gmail.com>
 <87edcruvja.ffs@tglx>
In-Reply-To: <87edcruvja.ffs@tglx>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 3 Mar 2024 20:03:56 +0100
Message-ID: <CAFULd4bVEUBEidTLbHNzRaJbSjXm99yC8LT=jdzFWb7xnuFH7g@mail.gmail.com>
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

On Sun, Mar 3, 2024 at 5:31=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Sat, Mar 02 2024 at 14:49, Linus Torvalds wrote:
> > On Sat, 2 Mar 2024 at 14:00, Thomas Gleixner <tglx@linutronix.de> wrote=
:
> >>
> >> I had commented out both. But the real reason is the EXPORT_SYMBOL,
> >> which obviously wants to be EXPORT_PER_CPU_SYMBOL_GPL...
> >
> > Side note: while it's nice to hear that sparse kind of got this right,
> > I wonder what gcc does when we start using the named address spaces
> > for percpu variables.
> >
> > We actively make EXPORT_PER_CPU_SYMBOL_XYZ be a no-op for sparse
> > exactly because sparse ended up warning about the regular
> > EXPORT_SYMBOL, and we didn't have any "real" per-cpu export model.
>
> Right.
>
> > So EXPORT_PER_CPU_SYMBOL_GPL() is kind of an artificial "shut up
> > sparse".
>
> Aside of that it's also making it clear what this is about. So I don't
> think it's purely artifical.
>
> > But with __seg_gs/fs support for native percpu symbols with
> > gcc, I wonder if we'll hit the same thing. Or is there something that
> > makes gcc not warn about the named address spaces?
>
> Right now the pending code in tip does not complain about the
> EXPORT_PER_CPU_SYMBOL_GPL() part because our current macro maze is
> hideous. Here is the preprocessor output.
>
> This is DECLARE_PER_CPU() in the header:
>
> extern __attribute__((section(".data..percpu" ""))) __typeof__(u64) x86_s=
pec_ctrl_current;
>
> Here is DEFINE_PER_CPU():
>
> __attribute__((section(".data..percpu" ""))) __typeof__(u64) x86_spec_ctr=
l_current;
>
> And the EXPORT:
>
> extern typeof(x86_spec_ctrl_current) x86_spec_ctrl_current;
>
> static void * __attribute__((__used__))
>    __attribute__((__section__(".discard.addressable")))
>    __UNIQUE_ID___addressable_x86_spec_ctrl_current804 =3D (void *)(uintpt=
r_t)&x86_spec_ctrl_current;
>
>    asm(".section \".export_symbol\",\"a\" ;
>        __export_symbol_x86_spec_ctrl_current: ;
>        .asciz \"GPL\" ; .asciz \"\" ; .balign 8 ; .quad x86_spec_ctrl_cur=
rent ; .previous");
>
> And the __seg_gs magic happens only in the per CPU accessor itself:
>
> __attribute__((__noinline__)) __attribute__((no_instrument_function))
>  __attribute((__section__(".noinstr.text")))
>  __attribute__((__no_sanitize_address__))
>  __attribute__((__no_profile_instrument_function__))
>  u64 spec_ctrl_current(void)
> {
>  return ({
>     // this_cpu_read(x86_spec_ctrl_current)
>
>     typeof(x86_spec_ctrl_current) pscr_ret__;
>
>     do { const void *__vpp_verify =3D (typeof((&(x86_spec_ctrl_current)) =
+ 0))((void *)0); (void)__vpp_verify;
>     } while (0);
>
>     switch(sizeof(x86_spec_ctrl_current))
>     {
>     case 1: pscr_ret__ =3D ({
>             *(volatile typeof(x86_spec_ctrl_current) __seg_gs *)(typeof(*=
&(x86_spec_ctrl_current)) __seg_gs *)(uintptr_t)(&(x86_spec_ctrl_current));=
 });
>             break;
>     case 2: pscr_ret__ =3D ({
>             *(volatile typeof(x86_spec_ctrl_current) __seg_gs *)(typeof(*=
&(x86_spec_ctrl_current)) __seg_gs *)(uintptr_t)(&(x86_spec_ctrl_current));=
 });
>             break;
>     case 4: pscr_ret__ =3D ({
>             *(volatile typeof(x86_spec_ctrl_current) __seg_gs *)(typeof(*=
&(x86_spec_ctrl_current)) __seg_gs *)(uintptr_t)(&(x86_spec_ctrl_current));=
 });
>             break;
>     case 8: pscr_ret__ =3D ({
>             *(volatile typeof(x86_spec_ctrl_current) __seg_gs *)(typeof(*=
&(x86_spec_ctrl_current)) __seg_gs *)(uintptr_t)(&(x86_spec_ctrl_current));=
 });
>             break;
>
>     default: __bad_size_call_parameter(); break;
>     }
>
>     pscr_ret__;
>   });
> }
>
> So all the export etc. just works because it all operates on a plain
> data type and the __seg_gs is only bolted on via type casts in the
> accessors.
>
> As the per cpu variables are in the .data..percpu section the linker
> puts them at address 0 and upwards. So the cast to a __seg_gs pointer
> makes it end up at the real kernel address because of GSBASE + "offset".
>
> The compiler converts this to RIP relative addressing:
>
>   movq   $0x0,%gs:0x7e14169f(%rip)        # 1ba08 <fpu_fpregs_owner_ctx>
>
> This obviously has a downside. If I do:
>
>    u64 foo;
>
>    this_cpu_read(foo);
>
> the compiler is just happy to build that w/o complaining and it will
> only explode at runtime because foo is a kernel data address which added
> to GSBASE will result in accessing some random address:
>
>   mov    %gs:0x15d08d4(%rip),%rax        # ffffffff834aac60 <x86_spec_ctr=
l_base>
>
> This is not at all different from the inline ASM based version which is
> in your tree. The only difference is that the macro maze is pure C and
> the __set_gs cast allows the compiler to (micro) optimize, e.g. 'mov
> %gs:...; movzbl' into a single 'movzbl'.
>
> IOW, right now the only defense against such a mistake is actually the
> sparse check. Maybe one of the coccinelle scripts has something similar,
> I don't know.
>
> I did not follow the __set_gs work closely, so I don't know whether Uros
> ever tried to actually mark the per CPU variable __set_gs right away,
> which would obviously catch the above 'foo' nonsense.

No, because [1]:

"gcc does not provide a way to remove segment qualifiers, which is needed
to use typeof() to create local instances of the per-cpu variable. For
this reason, do not use the segment qualifier for per-cpu variables, and
do casting using the segment qualifier instead."

[1] https://lore.kernel.org/lkml/20190823224424.15296-3-namit@vmware.com/

Uros.

>
> I think this should just work, but that would obviously require to do
> the type cast magic at the EXPORT_SYMBOL side and in some other places.
>
> Thanks,
>
>         tglx
>
>
