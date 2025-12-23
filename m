Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C943C33E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 04:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766465502; cv=none; b=pI3zq0MrROjAQLvDJcneWtWDlQmq1jBGNSMojGCNe4SCj2qixc4xcV6YDk4+epQ/MbK8hZloeBb+1T+XwNRNW5x4AjUaWlkwxCelpBJY44thRhBsQ4NZEKTfkwfYo41+cLz81WcqRnYy501D5RO5ccdQWleBPEFOSYewjSu0tZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766465502; c=relaxed/simple;
	bh=fuKCjy4J1r14m0DKbVHaqTDzLtMbCdTV8e2whbcn56Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fw3K1avYcohdeoJQcc+fVxBmczj5JI54LilA3rfYdQHWkHP129TiZUwrNjeeTl4RFjdzSdR+fBXVOchVlIm+0kGoLDnCEfGHWZUJ6g/huNz/YA7+sd5/LH1qUlJaSqEb3YwPnAwqSC+/yXBLKGI6JcbC7J1Gy1N89JvodzhVrc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GcNY59Me; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GcNY59Me"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee2014c228so28344391cf.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 20:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766465500; x=1767070300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3THllLg1+c2+Pm4bLv4QE+kWIS0LMOTgu2hmsLoh/g=;
        b=GcNY59MevPQXOZvPnp8tjQ3NGOrMIVdhXVyibh65XAyYcBml5KPOjFUE/nIQw5qoTu
         nTkRWrVoCPKZnuTj/2U7uzlwSgqLuJDtAvIBpfAbab9n2Mzunr7PhQIKU0VVyybVSE7u
         1IMrZR6R8F0QIejalFAMreFlcJVQF7Watbqt7yNSAGJ5QfvTD+15fonc0JDCuBGSd1Fw
         I0VeonQdEOb+wTEY7s1l+ngZ2daYRJ+qdiUocM7C9w6RbalvTCmT6q6NXIEeYUY3/T82
         PLbE8dPZkYVAGB3LPQoaCuQvUjvVda+8431WZWrzZjknUVVfqj0ly5aGf7W46L8avh+p
         ao0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766465500; x=1767070300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3THllLg1+c2+Pm4bLv4QE+kWIS0LMOTgu2hmsLoh/g=;
        b=Mld41FZsGkDcW2Gh957+c+nX1RNtSK1jswOXmDNeUnKrKOBTW1VTqmd1zpx6zlb8P5
         HIU5KAc0eNopjv/eYq5Iyxqa3CP3cd+DmU3ovJvvGRCYL1rzw3yzQpqLlECXCrqTSzOy
         JWNKJjBBjBcnGhFZf89DStYxxexeRdGadydM0EqCQYK8Cfrv6UJXp8mEbvtEPzyjofCd
         6hh7cdC9kqc/Uwae2jQjWswwkHH6tyHrcxImDpbMs6IdrxUbMf8tsWyB53vV5TteXzPj
         pqk0WNPpoORuqMQVqIOMMst/9A+WYiY/Kk4h6w2TWv+4kVx9REPXSOtEUgdlexBSW3hb
         rhyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF/S16l97B9cLLj93W2o1hDERwwcOY474yiR+O/mCJXzgTUv8nVOdzjlPAmkwzK0MDU93neVMhYz+ki5jm@lists.linux.dev
X-Gm-Message-State: AOJu0YzP0Pfx12hvRGBKfWDmvJ0wuXw+FWAlqLxGWnemLePWJMuErG/o
	woJCO9TiqYEMAwN/Jz/AX8LfP+o/YXm6aiOCE8bRqtdNJr0Z3ex9qVSSPSv4zdrvtZrOWdk8MCt
	eXp5HE4sPI/7iE6nQGtbJpxksyJfeyEfPmhysD08E
X-Gm-Gg: AY/fxX7Xh2uRqeHZ0Sr82l4c2VlVZufiphUdWVSsTVOOPPi75gU0eGlPS8Rg6kJ/dfu
	BHBFHavuySLk9NrLhVm8JXFIZtmqLjLzjskreWKzq5vG2eFfWDfWxsQbZ98BIwzHQ5mEioDa9wy
	Tb25xZbvBoyG9hD/ciXk+vv360uoflEUUicMWcVF4ptxdxkAXfijS/MXWNmK0P6v5TBV7Kcx8zS
	oP312yXf5ctdierBOwh0kK/GWas/U7uffBc+dLAUl1JuN0b3fwAgHjex0dD9mK/fIxX5w==
X-Google-Smtp-Source: AGHT+IHtJ6X49EvwjhqYw1bV7/iq7teyYZaR2zhsxQOnf363Q8DnrXM1UqfP552KhqODFtkVieuE1zOVgzmNtjeV7Mk=
X-Received: by 2002:a05:622a:5983:b0:4ee:280:2e49 with SMTP id
 d75a77b69052e-4f4abdc9b4emr196294011cf.66.1766465499553; Mon, 22 Dec 2025
 20:51:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222092208.770136-1-edumazet@google.com> <202512230859.jl2eLtLj-lkp@intel.com>
In-Reply-To: <202512230859.jl2eLtLj-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 23 Dec 2025 05:51:28 +0100
X-Gm-Features: AQt7F2r3TY_FTHMr4usjhJ4-fFiPnQcvAEhtrSripAFWO5Xgpryp3JIOMnggswQ
Message-ID: <CANn89iJ4r5hrqE=Lj16XVNFM7iZ+XB+JsXU8gE5ryeuG6kf1Sg@mail.gmail.com>
Subject: Re: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 2:06=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/master]
> [also build test ERROR on tip/x86/core linus/master v6.19-rc2 next-202512=
19]
> [cannot apply to tip/auto-latest bp/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/x86-a=
pic-Inline-__x2apic_send_IPI_dest/20251222-172515
> base:   tip/master
> patch link:    https://lore.kernel.org/r/20251222092208.770136-1-edumazet=
%40google.com
> patch subject: [PATCH] x86/apic: Inline __x2apic_send_IPI_dest()
> config: i386-randconfig-141-20251223 (https://download.01.org/0day-ci/arc=
hive/20251223/202512230859.jl2eLtLj-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251223/202512230859.jl2eLtLj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512230859.jl2eLtLj-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kernel/apic/apic.c:71:
> >> arch/x86/kernel/apic/local.h:48:2: error: call to undeclared function =
'native_x2apic_icr_write'; ISO C99 and later do not support implicit functi=
on declarations [-Wimplicit-function-declaration]
>       48 |         native_x2apic_icr_write(cfg, apicid);
>          |         ^
>    arch/x86/kernel/apic/local.h:48:2: note: did you mean 'native_apic_icr=
_write'?
>    arch/x86/include/asm/apic.h:116:13: note: 'native_apic_icr_write' decl=
ared here
>      116 | extern void native_apic_icr_write(u32 low, u32 id);
>          |             ^
>    1 error generated.
>
>
> vim +/native_x2apic_icr_write +48 arch/x86/kernel/apic/local.h
>
>     43
>     44  static inline void __x2apic_send_IPI_dest(unsigned int apicid, in=
t vector,
>     45                                            unsigned int dest)
>     46  {
>     47          unsigned long cfg =3D __prepare_ICR(0, vector, dest);
>   > 48          native_x2apic_icr_write(cfg, apicid);
>     49  }
>     50
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I missed the CONFIG_X86_X2APIC dependency, thanks !
