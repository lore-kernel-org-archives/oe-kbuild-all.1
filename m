Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F62AD22
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719166479; cv=none; b=oW+x7KQCydYUOrmfzpNedDyF1Qohs467fQ0F99S7HcHGGHO9CPChgERe0JbMyZI68djwMgpoEKbJPsLaJFum0j02ADIpU1WkwmTP6KD/Ceu65ABpjDsTngqXL/bYDD0Zlh6wRADK6Qb2xrNKhTogmflnSsE7bYxRWqLGKcfvTQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719166479; c=relaxed/simple;
	bh=hrw2cWL1A7ev4AhwQWmduHTm6s1CxAkOpYTqIGX8hfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRPE1kNgMdyV/kl+lXyKPhX2ArcJC4TSpX4o8S3RBhXZ5NL8qw0KZklXcbexrhKEMZArxOcPECj9VpdZCXw9Pu7Nxc1tiGrIFZmYTyKIv2R/fBq9hq1yol1RvDADdkeCUQjc3xtwNtC/v3G+4GDTCr0UHCizpory2d61qfJHX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAgARisJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAgARisJ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso38785431fa.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 11:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719166475; x=1719771275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAmqARKrHui/NaUmZfz82SlsXm+I+AB9Qkw5ktB+JRw=;
        b=iAgARisJbaGfTtbHTNuaZ9rErusOWL9O7KGksbYHWo6EgKeigzqVryoVyU5579Gmkw
         rCbTmlqy6TPhTJoeU/TbTGsi/zoZ6Sapg+DYGGbAdl9Udu53WEE/zP8UiAr02B/8H/sc
         qnPLEG696eJCuXFQCLOXOiB7orViHTHOIQDjK5Z/DBwjT7HV2W1NW1lA7YYTj2/6eNry
         TSnuzsqFkvUXh7abS1HiTS/rSdFjSCXkDk7yzKHfaYh0gT/hQsPMTdmEsmHk3qK+q5aV
         3KFwvtbvSIG17pNtjE3M2b1h0VGjdCS3MNxom1eS83mMH+FsOtm90QVGH7EZpPM18v9t
         DNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719166475; x=1719771275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAmqARKrHui/NaUmZfz82SlsXm+I+AB9Qkw5ktB+JRw=;
        b=guT9uRuBwIcrhGtEwaaxClguhdWA5gfLRAJOB6st3cKUAmKq2565DibGjvwyTWUyHs
         AHusUUII2niUyU2iwTwY6Hl3dXt/paLtXy3AIaMm79SmKSDv6/WEEcWXsprmaIAP4iRF
         XoCSw7xgogc+k3xO6J/vEjgIGsSWKSrmtImQno8VRXVUwVzvV2ia/HYA1f8YO4kfd9K3
         4DInmX0/Juhczz2JcK8UuyzpPWRvpxT5KBCBTDFevHCxEzUg8lkCnTxTdf3UTyHS2YRD
         QLD0vgeRrZOTxC6QeTRJejvCyxPY03ffTCDyvPbb7saKxQD+SwSsuNqkoJN+m0Idh1WN
         n0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWskVkVZD4IN0sUQqMRqhsQ8u01wny7moyx+tsu93eSdw9V598faOgAg6z7P5/laZtK+EUt9QxPSp7ZLVcfQNIjibI+gO8s1+lInYAJSQ==
X-Gm-Message-State: AOJu0YxIzgdImiQKL3rFzaELnugkJFieoeFkT1VIk7LRc7bZZWlKHzST
	HIYkm/hrLRFpoWV/ulaAYNqfsB+/UrblwHGVGJuthTBTY4jBRd83RPYUDX3w41qM+q8HQnvGr2z
	OepghN6XsMcBs5m3HfbAZ/7kpXhc=
X-Google-Smtp-Source: AGHT+IFfyeGk4zOz61lEAAHkBgCnNzNpNQ5zKKohl4iOtOMwSULMnFWDfEm5WgxFRuCqdzcbSOjtLA7Gf6alclZRR0k=
X-Received: by 2002:a2e:9b4b:0:b0:2ec:5921:bb21 with SMTP id
 38308e7fff4ca-2ec593bea06mr18882271fa.10.1719166475181; Sun, 23 Jun 2024
 11:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
 <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com> <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
In-Reply-To: <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 23 Jun 2024 20:14:29 +0200
Message-ID: <CAFULd4b43=pTnAMKusJmGCeF1Bk-f6AyeOR8wGM8EieqhuH5WQ@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 7:49=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 23 Jun 2024 at 13:43, Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > I disagree with the above.
>
> Your disagreement just doesn't matter.
>
> We don't introduce regressions and then blame others.
>
> There's a very clear rule in kernel development: things that break
> other things ARE NOT FIXES.
>
> EVER.
>
> They get reverted, or the thing they broke gets fixed.
>
> This is not debatable, or something you can "disagree"' with. This is
> how we work, and if you disagree with that, you had better get out of
> kernel development.

I disagree with *I tried to shift the blame to others*! I take full
responsibility for my patch, and I'm perfectly capable of fixing the
breakage with an alternative approach.

I'm OK with the revert, but it won't fix the underlying problem.
Please see the definition of __arch_cmpxchg64_emu - it forces the
address to %esi registers in the same way as __arch_try_cmpxchg64_emu.
Effectively, the compiler allocates 5 input registers just for the
instruction.

The alternative is to implement atomic64_{and,or,xor} as an outline
function, in the same way as e.g. arch_atomic64_add is implemented.
This will avoid the call to __arch_try_cmpxchg64_emu, and the whole
"instruction" will use just:

__alternative_atomic64(add, add_return,
      ASM_OUTPUT2("+A" (i), "+c" (v)),
      ASM_NO_INPUT_CLOBBER("memory"));

> Now, from having looked a bit at this, I can point you to the
> differences introduced by having to have the emulation fallback.

Yes, I know this - I also (runtime!) tested the emulation, but with GCC onl=
y.

> And I would personally be ok with leaving Pentium etc entirely behind,
> and getting rid of said fallback, but that's an entirely separate
> thing that will require much more discussion.
>
> Some people still wanted to support old 486 clones not that long ago.

This can be achieved by implementing atomic64_{and,or,xor} as an
outline function.

Uros.
