Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA942A82
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 05:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919896; cv=none; b=qo9k2ekE4m7lv2C72o7dVlAnZHBF0X/NjKcl5kQxKvErE3gtgaJaDjKZwcuamf0/6Em33qF/YqxJljp7VmZBuecDSCaJgtY750RVEjbQY0JRtwmEEDKMX0qz+o6umpH+am6UMGDDtz1zLmwSzZmaYc8cyVpFGshslcEw5FT8CPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919896; c=relaxed/simple;
	bh=DSw5LwAtNIgAtwn2UmzZxp5ADFzdQwHuiP3m7WQyk6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvrS+dWyY8RUWkagdUZac4ujqOtWB8Bxqrstd9OZ/fPa/l+7mPIMl9v5bCp6odS64bzNdU3tLlHfRMEWZicn/r9zA4haaOXQuDuWD4RLmrAXkxNWGzNpOHDPlZGRhg37tQV1eJ4s4f91MdNOe6EbtZDegpcHs8KsgwCuElwSIUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p4Z7Fp4/; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p4Z7Fp4/"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a3b28ac9a1so110735ab.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 22:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919893; x=1730524693; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU1QCoLm9SQ+6m7YZluKnFNfn8ZrWd4KaFL5e+lUweo=;
        b=p4Z7Fp4/giQVwkQnz8eaCdp/mQTGX15QzqiznvT/8ZYuXgujRQuzRtaHZ3KPrD4UBV
         EWvwhYqytIJksu0RGUk7g0fxT0tPUcRQ1yHTYx3NVbkiUjnFTU7vzxm4O1wM7exOWqMS
         CZfJUUkVNxe9N3cj20nSxfOHfwh5wpbHaoICBL/x49gD3htfEAIWSXyNVEDXbf/7Tgjn
         A9pNZS15qZdHpgMI38hTPFOwyaiOZhzS/sCVjqfvgt47znlMHs+E6tC4DozbwbssFas5
         DVBNQvx2QCBtx3+d+TWC93HNnTWFbnsl35xnHcAHb9/Kx4uREHZidZK1yDAbAMgYkJ14
         qjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919893; x=1730524693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iU1QCoLm9SQ+6m7YZluKnFNfn8ZrWd4KaFL5e+lUweo=;
        b=UBsWyag+MKTbHMsmiMY9gy5Lri8mpSHbjrLn/WhaBUZEdRg+uqzCW4/oQJK3u8xYOx
         aDlIc/o1gtj1Stxu6YS/k5m14fxQ0POk13nqb7iFO8XFQOIV78SkWDnPRui/YnBVHzir
         O12vqHwUcHaCVaV3o5riVH2xdZwVfZi8vpuuP7e/D3AVWKRP8QbG4tuf1QLqFpeW6Kmu
         YGYrgX0mHDvPXmvRbWzArC+TcB96rGsYFp4sQSNwv5ZM7NiYoCr92Wkwbs4RfE4TW1NU
         V6I+NXhT8zLPWkk3y8fSKhNDIDbgvzVxjSZabiEnEjRYDbi3gz+DmRwelg3s2h2sTVGb
         t9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX2DYwpaNwrbTEx8hro9LrOYYRoPg1H6+XwWL+7fRKonFRYeYE/0OR+wKlDHqqUeWYSbiMQ+7iNfMhyP8RY@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk1DY/EC1N6nKNkMba8eDgSMMQaSsz7STHzq5NX9k9H+yLbdOR
	vegUDEqw5ifGI9cJ1jmx4RR3ystqj/2fra47DxJMKqBAWCbi2k4QROXvugjL+KNYAb6D1RS1/UZ
	FThF7n7//czCvRr0gf8kw8qx/tLz+5x8ifJDw
X-Google-Smtp-Source: AGHT+IGxrZqhWOcm7GYtX9POebfPOUCTw9sWuuzUb9W2nGFOsHwUNqkHgbXjFmKvaPW6lmTMHMaB73N7SS1Qpuv8Hro=
X-Received: by 2002:a05:6e02:1d85:b0:3a0:9ccf:4f69 with SMTP id
 e9e14a558f8ab-3a4ed29d7femr2007395ab.2.1729919893333; Fri, 25 Oct 2024
 22:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023224409.201771-4-xur@google.com> <202410251411.eRNArTOZ-lkp@intel.com>
 <CAF1bQ=RmUbPGro2c+0mukG7PjP4OMgZEqjmfRnOudt_N12vzvA@mail.gmail.com> <CAF1bQ=SLkmVaQ_J8FnM145Y3-65-7DuAwd-OPF1iOhtMtHg0WQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=SLkmVaQ_J8FnM145Y3-65-7DuAwd-OPF1iOhtMtHg0WQ@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 25 Oct 2024 22:17:59 -0700
Message-ID: <CAF1bQ=R4NuJ1k7+Bdq6HGFr6KiyPjjr1soN_Lu8umX4LzPHWfg@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] Change the symbols order when --ffunction-sections
 is enabled
To: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The fix is now included in v6 of the patch series for review.

On Fri, Oct 25, 2024 at 5:27=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> OK. Here is a simple fix to the issue.
>
> diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.=
lds.S
> index d317a843f7ea9..f1b86eb303404 100644
> --- a/arch/sparc/kernel/vmlinux.lds.S
> +++ b/arch/sparc/kernel/vmlinux.lds.S
> @@ -48,6 +48,11 @@ SECTIONS
>         {
>                 _text =3D .;
>                 HEAD_TEXT
> +               ALIGN_FUNCTION();
> +#ifdef CONFIG_SPARC64
> +               /* Match text section symbols in head_64.S first */
> +               *head_64.o(.text)
> +#endif
>                 TEXT_TEXT
>                 SCHED_TEXT
>                 LOCK_TEXT
>
> If this is OK, I'll send the updated patch.
>
> -Rong
>
> On Fri, Oct 25, 2024 at 11:14=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > I can reproduce the build error.
> >
> > The reason for the error is because in CONFIG_SPARC64, the symbol
> > swapper_tsb needs to have a fixed address of 0x0000000000408000.
> >
> > In arch/sparc/kernel/vmlinux.lds.S
> >  37 #ifdef CONFIG_SPARC64
> >  38 ASSERT((swapper_tsb =3D=3D 0x0000000000408000), "Error: sparc64 ear=
ly
> > assembler too large")
> >  39 #endif
> >
> > This symbol resides in the .text section. The patch relocates "cold"
> > functions (tagged by .text.unlikely) to precede other symbols within
> > the .text section. This pushes swapper_tsb to a higher memory address,
> > and we have the assertion.
> >
> > However, this sparc code appears incompatible with the original linker
> > script. The original script prioritized .text.hot symbols, placing
> > them before others in the .text section. Currently, no functions are
> > marked as "hot" in the source code.  If a function were marked with
> > __attribute__((hot)), the build would also fail.
> >
> > I don't know a good solution other than adding a branch to the
> > include/asm-generic/vmlinux.lds.h.
> >
> > @Masahiro Yamada: I'd appreciate any further suggestions you might have=
.
> >
> > Best regards,
> >
> > -Rong
> >
> > On Thu, Oct 24, 2024 at 11:47=E2=80=AFPM kernel test robot <lkp@intel.c=
om> wrote:
> > >
> > > Hi Rong,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on eb952c47d154ba2aac794b99c66c3c45eb4cc4ec]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Xu/Add-Au=
toFDO-support-for-Clang-build/20241024-064725
> > > base:   eb952c47d154ba2aac794b99c66c3c45eb4cc4ec
> > > patch link:    https://lore.kernel.org/r/20241023224409.201771-4-xur%=
40google.com
> > > patch subject: [PATCH v5 3/7] Change the symbols order when --ffuncti=
on-sections is enabled
> > > config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/arch=
ive/20241025/202410251411.eRNArTOZ-lkp@intel.com/config)
> > > compiler: sparc64-linux-gcc (GCC) 13.3.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20241025/202410251411.eRNArTOZ-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202410251411.eRNArTOZ=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> sparc64-linux-ld: Error: sparc64 early assembler too large
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
