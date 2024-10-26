Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E705EC4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729902440; cv=none; b=hJ+tkmcTe12NzEjOCxsDCuh8YJqtMOf2/HISnN8nvIboJQ9G6z+pUr70hlCFil7AjSq2cscnLzPwJWAxjFyQtbqhc5DqdhXZGcaYzHiuDnCpab0c4NINW8ZA/AUE7skVsGuvvddsQzTKuR3DGkmhfEFnVM+e9pGfnw81soBXvFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729902440; c=relaxed/simple;
	bh=bRitUrZLHvdvNzpKKwHrR+4lJ85TPahyI9zOpsB298Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJhiyG1SSJkwUsTNSJlY+f5IcLH3Q+hIeaEC5o3Z4o3bgeMGv8b9mvXwpYcrTJOnIDI7yd8vNPyQ1gPaYUCMvNIYhKo2UoPfrc+hVaWNGXQPBscfxBKK8p4NADC9VhaqK8W/+hwoxx0vGQ8JCfkryBwWI2kpWX3KFr4H+Rygido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QodVb4D+; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QodVb4D+"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-460b295b9eeso56101cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 17:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729902437; x=1730507237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P310wpJeZXac5i+8GykMOwLR6BCbAgFwwwEppVc/sqM=;
        b=QodVb4D+cSyaF1XohF9WRUp+lYRV7D7nJwt0LHWGC/Hll/Xi8MvBncwVNoZM7Y0Jjx
         +DWCpCGlhGzMEnJvDhNbyqx/af14qqJ5AkrhCUqXWKkHdSM4pUX8Gu7Gcft9eOX2/UoC
         orX3aeDAe+Q6rfUI/uBq4RlKbUpyTV9GB0HtZwzbVJDdPWZlvuLqFKrcwmGYHD0ZSqdU
         ahxpMoDMEOHT034FX8ebZmngpSVAzmX0nzYwRdYdiSB3a/uRswvbax6Wvrg6vzvq5mAo
         u0gm9PlioHqZdAGdhONkTsQKyrZD8sF6EBL99bbItEX9mWTS7/dEO8CFaQ//Y2RibgoS
         YhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729902437; x=1730507237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P310wpJeZXac5i+8GykMOwLR6BCbAgFwwwEppVc/sqM=;
        b=LL5U2vtDxa19hdGLSF3ECQ7zUiji7J8voyLoHbXXdfOWZRUbhHj2/CuIRuaG9aplz7
         fHIiCuh4s6Or7Vj1dmVJWQJ0aYGB7XELnHP3Mdws3HcCs+iUmVyeyferMTzXJZ8iBhDy
         MOA/XVYUxAHmcJU0w+Yw3kl0Ja1em8B8aNDIT1X85VwLz2YqdGJr29C9QTwrl8kOFYnu
         KNYCtyRo89YmLwpKs3nsPU0rOk3LsRTLEid4izAaflKEk7izT5h60/0uiavKbUaQc/j7
         QrhPjQ5FKz5Z3XCMLP+rhOKRMJjpqilZMhp8QPWfa8fBneZTLPOEM+UAu8MtMoNafpTf
         NA6g==
X-Forwarded-Encrypted: i=1; AJvYcCVKi+s1TU47Ix1YQo3Q4USFg1yrxPiXiQWcKEEoJ+5+LQzBDUPU8cI77Gv3i+oWvqXJTeGUHPW0dq7FrRgW@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4yZZ2CtMRzVXlw7aHdsbTSVThlRl4JTN7xahiJfxs3xvSOwcv
	nHJxnKB4GreVlJG+jLc9hxDfyjKUqPEgWNpTTbG/pWUeVhb8hg3MIh0oLBWlPel74AaaUb9c4jv
	DcbIX7z1RMeCKcn1qOSKxTmGcUSzgCe5oBlzQ
X-Google-Smtp-Source: AGHT+IGOiJ+HIOsHfWiij/nQItfUiirPyvji9TLI8xuC9nehnxsXf4PaVuOw7cljR40UTNakbuVdP1K9mQe14L1MaN4=
X-Received: by 2002:ac8:7d83:0:b0:460:44db:eb4 with SMTP id
 d75a77b69052e-4613bea8ed3mr1577501cf.0.1729902437164; Fri, 25 Oct 2024
 17:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023224409.201771-4-xur@google.com> <202410251411.eRNArTOZ-lkp@intel.com>
 <CAF1bQ=RmUbPGro2c+0mukG7PjP4OMgZEqjmfRnOudt_N12vzvA@mail.gmail.com>
In-Reply-To: <CAF1bQ=RmUbPGro2c+0mukG7PjP4OMgZEqjmfRnOudt_N12vzvA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 25 Oct 2024 17:27:04 -0700
Message-ID: <CAF1bQ=SLkmVaQ_J8FnM145Y3-65-7DuAwd-OPF1iOhtMtHg0WQ@mail.gmail.com>
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

OK. Here is a simple fix to the issue.

diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.ld=
s.S
index d317a843f7ea9..f1b86eb303404 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -48,6 +48,11 @@ SECTIONS
        {
                _text =3D .;
                HEAD_TEXT
+               ALIGN_FUNCTION();
+#ifdef CONFIG_SPARC64
+               /* Match text section symbols in head_64.S first */
+               *head_64.o(.text)
+#endif
                TEXT_TEXT
                SCHED_TEXT
                LOCK_TEXT

If this is OK, I'll send the updated patch.

-Rong

On Fri, Oct 25, 2024 at 11:14=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> I can reproduce the build error.
>
> The reason for the error is because in CONFIG_SPARC64, the symbol
> swapper_tsb needs to have a fixed address of 0x0000000000408000.
>
> In arch/sparc/kernel/vmlinux.lds.S
>  37 #ifdef CONFIG_SPARC64
>  38 ASSERT((swapper_tsb =3D=3D 0x0000000000408000), "Error: sparc64 early
> assembler too large")
>  39 #endif
>
> This symbol resides in the .text section. The patch relocates "cold"
> functions (tagged by .text.unlikely) to precede other symbols within
> the .text section. This pushes swapper_tsb to a higher memory address,
> and we have the assertion.
>
> However, this sparc code appears incompatible with the original linker
> script. The original script prioritized .text.hot symbols, placing
> them before others in the .text section. Currently, no functions are
> marked as "hot" in the source code.  If a function were marked with
> __attribute__((hot)), the build would also fail.
>
> I don't know a good solution other than adding a branch to the
> include/asm-generic/vmlinux.lds.h.
>
> @Masahiro Yamada: I'd appreciate any further suggestions you might have.
>
> Best regards,
>
> -Rong
>
> On Thu, Oct 24, 2024 at 11:47=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
> >
> > Hi Rong,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on eb952c47d154ba2aac794b99c66c3c45eb4cc4ec]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Xu/Add-Auto=
FDO-support-for-Clang-build/20241024-064725
> > base:   eb952c47d154ba2aac794b99c66c3c45eb4cc4ec
> > patch link:    https://lore.kernel.org/r/20241023224409.201771-4-xur%40=
google.com
> > patch subject: [PATCH v5 3/7] Change the symbols order when --ffunction=
-sections is enabled
> > config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archiv=
e/20241025/202410251411.eRNArTOZ-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 13.3.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241025/202410251411.eRNArTOZ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410251411.eRNArTOZ-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> sparc64-linux-ld: Error: sparc64 early assembler too large
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
