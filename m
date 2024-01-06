Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769EFE575
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 19:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hrFoLdEZ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cd46e7ae8fso2891701fa.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Jan 2024 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1704569596; x=1705174396; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnbj3rhVInTrKv/hVQzfYCA+VxXl65Gc/i9kYgD67kU=;
        b=hrFoLdEZIZy0j3owWvALk3kaAs382AwxYE7wCFj/xcdZZOmgJia9TbErdK9T19n/Ip
         Z1B9Gk2cMhD3RNPX6MjofNxDLWpemGV4xGhQ72S8YlYt+J+kZqv2IOWBC59dx2WTRm7V
         uG/h30LVWnXHQoVt0KDuhke5CN+v2cEb4WcNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704569596; x=1705174396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnbj3rhVInTrKv/hVQzfYCA+VxXl65Gc/i9kYgD67kU=;
        b=BMP/0ILeIjh5NUvWi0wKrJICzjFuVo5NU5sHDrINIm1lR3uRMVyppVUSgUOJU5N3Kx
         nhq9e2AjIBWDU7GwL77Ld4aK+fYZKAP9lVJYXDwOvFcA7ZzU5qW78Fa+q4MONeUsaNzI
         Kk3d0K8SNfKwhrWrtMINw/oZKVeXeQ9KmR+/8RRdgVbPakEqUMFBglfPyIAtNmVNPuvN
         jzm9dnSzCDN9QhStjxZX4FLDtRJjbbLBzQe5nFHPs9ctwPPObhqDMP8LUjAUwrYX8aBC
         FAm/yZL11zK+rERdyeDrKspnqDwRdSA6J1tPFpz5fH/tmKql7aQoH/GEaKfwxsFD4Grc
         KnKw==
X-Gm-Message-State: AOJu0Yw6oEWP4UjntFMnWQ1/Wic/d2WtNqDWOli7MXX+Aqf+byJ+8cwA
	7ud/nUXSesgaG0fZ/sU/qeRNGsvVjNIjwsK3yCXGVLghs6f5/Ztm
X-Google-Smtp-Source: AGHT+IHI3NJBhwa7+k0pO87YkcjnNYTNKgvM4BxgYL6qK1J9nk9LlqzDzxz32TyVGl8RqREGa6LWjw==
X-Received: by 2002:a05:651c:1a09:b0:2cc:de75:71b4 with SMTP id by9-20020a05651c1a0900b002ccde7571b4mr283879ljb.188.1704569595819;
        Sat, 06 Jan 2024 11:33:15 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e91c2000000b002ccbc09230csm749289ljg.97.2024.01.06.11.33.15
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 11:33:15 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso556905e87.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 06 Jan 2024 11:33:15 -0800 (PST)
X-Received: by 2002:ac2:464d:0:b0:50e:7789:a22b with SMTP id
 s13-20020ac2464d000000b0050e7789a22bmr209061lfo.135.1704569594761; Sat, 06
 Jan 2024 11:33:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230920192300.3772199-1-goldstein.w.n@gmail.com>
 <202309231130.ZI5MdlDc-lkp@intel.com> <CAFUsyfKDRiX9kKOhHcA4PLqqT6Q5faHF0eRGiKN+9NSbvrUfDw@mail.gmail.com>
 <d02bd4f823534a00ae4915ead3d92773@AcuMS.aculab.com> <CAFUsyfL0M5P4+4s_b1kvJ_fE-ax8YBK0ammbKfoy7yKs1obzrA@mail.gmail.com>
 <CAFUsyfJduB29c6=BNmTtgoWcHAWA1AZ-sdbhyp02JVhvA6Gp0w@mail.gmail.com>
 <CAFUsyfLuo0_Sm91mqbM8Sbo-ncwnM4RaRq=GxQXDmkAN-nQ3uw@mail.gmail.com>
 <CAHk-=wgv6h4ru=z8UR5XyutoRKveOetNpwovHburvRgG9NSa3g@mail.gmail.com>
 <CAHk-=wiNUucmvTKGmveWzXXe99SpOwU65nFtH-A2_aUpPsAPJQ@mail.gmail.com>
 <5354eeec562345f6a1de84f0b2081b75@AcuMS.aculab.com> <CAHk-=wg8vssPVO68_qH_BHBCj6_DDawKQHBOgZh4gw5YFmpCKA@mail.gmail.com>
 <204bf145e6ad47219c005e9a4407ebdc@AcuMS.aculab.com> <CAHk-=wjGaH6oA47WkphTweMiy15Zjfuk-aVcXSasMX=aX9rFLQ@mail.gmail.com>
 <CANn89iKjUZjw-9ACNWrEd_H+o79Uwkw9NVuujQ3w=c2pGRFotg@mail.gmail.com>
In-Reply-To: <CANn89iKjUZjw-9ACNWrEd_H+o79Uwkw9NVuujQ3w=c2pGRFotg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 6 Jan 2024 11:32:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgobnShg4c2yyMbk2p=U-wmnOmX_0=b3ZY_479Jjey2xw@mail.gmail.com>
Message-ID: <CAHk-=wgobnShg4c2yyMbk2p=U-wmnOmX_0=b3ZY_479Jjey2xw@mail.gmail.com>
Subject: Re: x86/csum: Remove unnecessary odd handling
To: Eric Dumazet <edumazet@google.com>
Cc: David Laight <David.Laight@aculab.com>, Noah Goldstein <goldstein.w.n@gmail.com>, 
	kernel test robot <lkp@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Jan 2024 at 02:26, Eric Dumazet <edumazet@google.com> wrote:
>
> On a related note, at least with clang, I found that csum_ipv6_magic()
> is needlessly using temporary on-stack storage,
> showing a stall on Cascade Lake unless I am patching add32_with_carry() :

This is a known compiler bug in clang:

    https://github.com/llvm/llvm-project/issues/20571
    https://github.com/llvm/llvm-project/issues/30873
    https://github.com/llvm/llvm-project/issues/34837

and while we could always just use "r" for constraints, it will

 (a) possibly run out of registers in some situations

 (b) pessimize gcc that does this right

Can you please push the clang people to not do the stupid thing they
do now, which is to say "oh, I can use registers _or_ memory, so I'll
always use memory".

Btw, it's actually much worse than that, and clang is just doing
incredibly broken things. Switching to "r" just hides the garbage.

Because sometimes the source really *is* memory, ie we have

    net/ipv4/udp.c:
                 csum = csum_add(csum, frags->csum);

and then it's criminally stupid to load it into a register when it can
be just used directly.

But clang says "criminally stupid? *I* will show you stupid!" -
because what *clang* does with the above is this thing of beauty:

        movl    136(%rax), %edi
        movl    %edi, 28(%rsp)
        addl    28(%rsp), %ecx
        adcl    $0, %ecx

which has turned from "criminally stupid" to "it's art, I tell you -
you're not supposed to understand it".

Anyway, this is *literally* a clang bug. Complain to clang people for
being *extra* stupid - we told the compiler that it can use a register
or memory, and clang decided "I'll use memory", so then when we gave
it a memory location, it said "no, not *that* memory - I'll just
reload it on stack".

In contrast, gcc gets this right - and for that udp.c case it just generates

        addl 136(%rax),%ecx     # frags_67->D.58941.D.58869.D.58836.csum, a
        adcl $0,%ecx    # a

like it should.

And for csum_ipv6_magic, gcc generates this:

        addl %edx,%eax  # tmp112, a
        adcl $0,%eax    # a

IOW, the kernel is *right*, and this is purely clang being completely bogus.

I really don't want to penalize a good compiler because a bad one
can't get its act together.

               Linus
