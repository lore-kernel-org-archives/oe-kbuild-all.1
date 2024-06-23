Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2324D8AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719137681; cv=none; b=W4kvN4APDWwwOmyLrTH9eNr7bGAoNXskw+9Xrw55pous758xmCSVbwWgsJV4g8eV12x0ViCs1mA5v0dvTXXSwz17auWKuBI9cQAMenXPIWlQFs5rySYWzPNdunW6zGiy+xL+mqZcR0GF1NH/Q9kzDaE9SstlIbTTK/iVm1syxLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719137681; c=relaxed/simple;
	bh=MLHQ4aOS9/UvbxJWmdvAAGVaEHwiA9saIH8Zd4gNquQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kE8cqLqKBo7HXwSOBT7yjpPx0QF5+cS+yG1SqKLTf2zQaFMUMt+Ocsgi5UspayyHanLJSEG2Y5KvSW0oD8xC8fjVH0T/gNUtf6gHgBgXlYCPIMis+8HqrLmmMrAGB07rVruZzVPFdzs5ORv68U7JWgkxlNXsX8hBzf99RKnF+gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/4BLzNl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/4BLzNl"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe785b234so35734841fa.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719137678; x=1719742478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcBNMr/k4edRqZPFNELG9b7ftRgg/7wluKHpnfnmGxI=;
        b=H/4BLzNlGEeL1MfnkuXix3eshnZ+k+HdJ7Po1r/SwM1Gm3BMTw8Yp9OGVCr7fGL2sm
         bQ6Q+3LZ0JkEtsfQmSGJY4upV3e8E3SsmyhrjMWyYrg7FSdZ1UQlgAtiLa8oqBYLkdQ4
         7IGk4CZXC8sNnEoe9hrmzYgCPFwtNf2bcDSIpw4fRaC+PkKtMGmTPoHkaA6iQK1+zwMo
         NB2qD2M99d5KWlanHzXOe7CDyc9sx3xhUbULSPl5YvNx35wsbfyPR7lIpcpi7yH9bD7Z
         abMdg5hdRmafx6wvlHG3BnjhvpPb/+Rrl7DU9rh/ooBOY1z3KYB9EtHyLJMjUYN45dj/
         CnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719137678; x=1719742478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcBNMr/k4edRqZPFNELG9b7ftRgg/7wluKHpnfnmGxI=;
        b=btsaqlixbhEmW/bATehk31lEiRhCBWpPxlJQFXa307e0oyerkeeywarS9a16ghuDXs
         SIyWElfda88vgayh1w4+38XSqNnXEAAJN5en5IfhVpgzqF0p2+YvCBMNH6Ea53tZlFHz
         mDnaqrxJhMIb9CNSkJm3y6Psgz8bxjo5rh812ppgbfAMhpuTMFFOOlOVkla410JrLrIl
         994wFXhcHecq5tVQradRQ2mKIuPhRALG+4xCM50Bw//kDVgSHBLGrHvrlB4Auo81QWhB
         QD0XutznrFBhOSSgs3NQpX7kukRKX0D8BK8Nqeyj89aSL3mzZOKGsggxSq+ray8H0/aX
         CSMQ==
X-Gm-Message-State: AOJu0Yy5eC3ydiVXh5WkiumFDDesv7TCPdYngLCkY0ldZRO97HBGbPrz
	lOGtEyfmeH2X/hNGh+jKyznj4WN2mAvUadnv4tr8YfWL0F009q8yQ2o5cxqfMoFZ8G/tDm0WMLH
	iTlTnYy9hWkhGQmNE11cIc/cHbO0=
X-Google-Smtp-Source: AGHT+IHkxmdmnKxGzdWq0ZfUUa7uh0yszAyagdUJIA9igGwW6bz0JrHmKv2WJhrF6J8GAE+AaRYhD2p8rweA2xf6ibk=
X-Received: by 2002:a2e:9d8f:0:b0:2ec:3dd4:75f9 with SMTP id
 38308e7fff4ca-2ec5936fa45mr15056751fa.35.1719137678142; Sun, 23 Jun 2024
 03:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com>
In-Reply-To: <202406230912.F6XFIyA6-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 23 Jun 2024 12:14:32 +0200
Message-ID: <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 4:02=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   5f583a3162ffd9f7999af76b8ab634ce2dac9f90
> commit: 95ece48165c136b96fae0f6144f55cbf8b24aeb9 locking/atomic/x86: Rewr=
ite x86_32 arch_atomic64_{,fetch}_{and,or,xor}() functions
> date:   2 months ago
> config: i386-randconfig-061-20240623 (https://download.01.org/0day-ci/arc=
hive/20240623/202406230912.F6XFIyA6-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a=
15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240623/202406230912.F6XFIyA6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406230912.F6XFIyA6-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from kernel/bpf/core.c:21:
>    In file included from include/linux/filter.h:8:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/x86/include/asm/atomic.h:8:
>    In file included from arch/x86/include/asm/cmpxchg.h:143:
> >> arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly requir=
es more registers than available
>      149 |         return __arch_try_cmpxchg64_emu(ptr, oldp, new);

The referred patch actually mitigates the issue, as explained in
details here [1].

[1] https://lore.kernel.org/lkml/CAFULd4b8kRgy0p3pKwheLRHx7rX+4RuY-45_Zt-CC=
j5sCpGjCw@mail.gmail.com/

Based on the above explanation, the build will break even harder
without the patch, because *TWO* additional registers are needed to
carry the value to be compared over cmpxchg8b instruction. The trouble
that register allocator goes through can be seen at [2] and [3].

[2] https://lore.kernel.org/lkml/20240410062957.322614-1-ubizjak@gmail.com/
[3] https://lore.kernel.org/lkml/20240410062957.322614-3-ubizjak@gmail.com/

Up to now, the atomic64_{and,or,xor} functions (and their derivatives)
were/are seldom used in the kernel. Recently, their usage increased,
so the register pressure situation around cmpxchg8b instruction
worsened. For some reason, x86 implementations of these functions are
declared as inline functions, in contrast with much more used
atomic64_{inc,dec,add,sub}, which are declared as outline functions.
While using try_cmpxchg() instead of cmpxchg() helps, it can only go
so far.

The real and reliable fix is to re-declare x86
arch_atomic64_{and,or,xor} functions as outline functions in the same
way x86 arch_atomic64_{inc,dec,add,sub} are declared. The
infrastructure is already there, the assembly macros just need to be
generalized slightly to handle additional asm primitives.

I started this fix some time ago [4] by optimizing the infrastructure
first that could relax some register pressure, but there was no
reaction from x86 maintainers. I don't want to waste my time on
patches that get ignored, so I dropped the ball.

[4] https://lore.kernel.org/lkml/20240605181424.3228-1-ubizjak@gmail.com/

So, without some interest from x86 maintainers, the issue will remain
unfixed. If they want x86_32 arch to die then inline locking
primitives involving cmpxchg8b are one of the nails in its coffin.

Uros.
