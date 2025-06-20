Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E92AD16
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408371; cv=none; b=E4vA/Q0YJph08G43Sc+aVf/Y6yCIM52Qg1UFiOwSuBj55HPkeU9eBmV479RRSWt19mbviYBMfAUSXqf+D+XRnpkruT0FjOT9ha+I4RxixGz9SWBz0LbYIcXoJCJ867LU/Y1HwGgXpAgkE1qEtGCE8dVh7pXLGNNdDG4sWnKtqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408371; c=relaxed/simple;
	bh=uCRX1nuFoRtnYCJ9KxkhvaXyEHuuLMZXm5m+SDOqDbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieBZoh0wT4DCaQOpFx6OiNRvQAcGHRdARMCqrVn+qmppH4SVfT2aYHCR26HFZdeWN/Kf5XpAdFicU+xTUKVCr+IAov5wq9fB6fAzKa0FmaDOiFFkCq3XIJNW/W9QV/DvvHIPKJAF/X9NYP8RmMOFHVEA5YOpw/+axyl8hed5DlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AOd8Tbt1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AOd8Tbt1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so261158666b.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 01:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750408367; x=1751013167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8wmox5wbVcYBtpfIK7MG/8DvxWobEdHxrXsqDBn3p4=;
        b=AOd8Tbt1s23dG2lokmYaTUM93URAzrrLdZ4br591FzYGwPnB/ogPzj4gke/2gQe3jh
         0/ntvOvK6TFO0REiYFSLOAZCZuudzW1CLHS4UnLfq9D0Vm4Q7QNVmMU0b0nrZm5ueojj
         bT5hECLpCuaq7+ooWsiwSsKr3RRjod+0kxBmBDUuSnd3nsVn5s5XcUOqFP7R2xlQ5Vij
         nsojxEt8AHaH8a8HeUHFRo+hhOHBSD7adoonHjeCPuIVEG99msqNwtzXfH5QeOqM6QwA
         dCr+Qdsfe00xSbmnivjZDRlMd+CLZaNyGj/q1itT3sg6NVyvI3zDlipjuyGZnhdDBYpv
         Pt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408367; x=1751013167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8wmox5wbVcYBtpfIK7MG/8DvxWobEdHxrXsqDBn3p4=;
        b=RYKHh+SGBHFhQPSmMNIKRGVs1mLmFAtsU4Kop8NugStjOyu7Dq2Sqqhl2Ub/ERbeEH
         wYZH+LNYJg80vWfmY15g50ZS+cL9+mC/e875OwEuNpesElINr0CFG3FJVXfytgCcZm5y
         RS3gY8SkjsBGFBtM8+QqiwonekXnv6WSf4Ik7jUTnpqMxN7Deigq7lOb54kMGFlqXt2+
         RfzkSIS/Qi3ixpUDAG27fanDAhngygsImCRUxMUW8ktuBbcilMQH9VLv1654jQOiLa1A
         NwFzVwCNCMxKaSKmz0uuRiFpXxV0uZoqA16rN0omNtmbrGew/bz7QqRZYsFR5NQCiGaC
         nU5w==
X-Forwarded-Encrypted: i=1; AJvYcCUOhKBj5OK2PnEY9LUqO25l9l5Ek+jHDGf79E+ukfy4I8a7qRs675mF3Xun/gBkxzGlnjRT5S09jmIwCfD1@lists.linux.dev
X-Gm-Message-State: AOJu0YxplGTYHLAjjyHUMrltxTWPcMQccUnom1fuU6ZoHl9z0PFpj/0O
	IIVr6dI7G/fgKForfOuw1GZvOsY+X4Wz/oeNcM5xtULFCRsJbksrUBww5TAFlwYLhHFtPMkXlhf
	3VxhlLNcrAXkSerJOB9SsCQtgeO1tzQDWf84r55mjZA==
X-Gm-Gg: ASbGnctARki1rSRKOtvSPrgm34JHKA9Fl972N1zr+JuO6JhM9hm1ZbCiOE7OiKwhr/l
	e8TjNTq/L3fbZbY01OV+ilkLeqDGOTrNCpCzWDWWQeOJWyJc1gUKU57Ec1LlSkklaZI6KsUJRWC
	C8gCIYm0pOlLXcV+hETKSh057EP+2W7SGhJ/mmIy/Nu3JsIo5TjvNB4E1sKNYdKCoscl6Fpf2hW
	ZzRVi7iFm9xSng=
X-Google-Smtp-Source: AGHT+IHx6J8pSPzVkYMOpBzKscIvIHoFXttHdd3oJL6N7iJycLVydQtv5A9bOfHWJYcvOjYYwszDL1FSgGmT97f5ndY=
X-Received: by 2002:a17:907:6088:b0:ade:31eb:66f7 with SMTP id
 a640c23a62f3a-ae057cde4e4mr190530466b.58.1750408367380; Fri, 20 Jun 2025
 01:32:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506191949.o3SMu8Zn-lkp@intel.com>
In-Reply-To: <202506191949.o3SMu8Zn-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 10:32:36 +0200
X-Gm-Features: Ac12FXxRGK7YwYdzqjI318B5Gj8dNC_z7UGrx_SbEPCsKkcykY33W_qwUXLotv4
Message-ID: <CAHVXubi46zgpKkKmGZvu7mNdfBLAsjgpLauLEfysUP05FMtyCQ@mail.gmail.com>
Subject: Re: include/linux/ftrace.h:190:9: error: call to undeclared function
 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 1:21=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   fb4d33ab452ea254e2c319bac5703d1b56d895bf
> commit: d0262e907e2991ae09ca476281fc8cae3ec57850 riscv: ftrace: support P=
REEMPT
> date:   2 weeks ago
> config: riscv-randconfig-r071-20250619 (https://download.01.org/0day-ci/a=
rchive/20250619/202506191949.o3SMu8Zn-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 8=
75b36a8742437b95f623bab1e0332562c7b4b3f)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250619/202506191949.o3SMu8Zn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506191949.o3SMu8Zn-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/riscv/kernel/asm-offsets.c:10:
> >> include/linux/ftrace.h:190:9: error: call to undeclared function 'arch=
_ftrace_get_regs'; ISO C99 and later do not support implicit function decla=
rations [-Wimplicit-function-declaration]
>      190 |         return arch_ftrace_get_regs(fregs);
>          |                ^
>    include/linux/ftrace.h:190:9: note: did you mean 'ftrace_get_regs'?
>    include/linux/ftrace.h:185:40: note: 'ftrace_get_regs' declared here
>      185 | static __always_inline struct pt_regs *ftrace_get_regs(struct =
ftrace_regs *fregs)
>          |                                        ^
>      186 | {
>      187 |         if (!fregs)
>      188 |                 return NULL;
>      189 |
>      190 |         return arch_ftrace_get_regs(fregs);
>          |                ~~~~~~~~~~~~~~~~~~~~
>          |                ftrace_get_regs
> >> include/linux/ftrace.h:190:9: error: incompatible integer to pointer c=
onversion returning 'int' from a function with result type 'struct pt_regs =
*' [-Wint-conversion]
>      190 |         return arch_ftrace_get_regs(fregs);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~


This is what I came up with because after fixing this ^, we get other
similar failures. My level of confidence on this one is pretty low
though, so if someone can confirm, that'd be nice:

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrac=
e.h
index 22ebea3c2b26c..28319c50d0315 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -49,7 +49,7 @@ struct dyn_arch_ftrace {
 };
 #endif

-#ifdef CONFIG_DYNAMIC_FTRACE
+#ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
 /*
  * A general call in RISC-V is a pair of insts:
  * 1) auipc: setting high-20 pc-related bits to ra register
@@ -117,7 +117,6 @@ struct dyn_ftrace;
 int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
 #define ftrace_init_nop ftrace_init_nop

-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 #define arch_ftrace_get_regs(regs) NULL
 #define HAVE_ARCH_FTRACE_REGS
 struct ftrace_ops;
@@ -233,8 +232,6 @@ static inline void
arch_ftrace_set_direct_caller(struct ftrace_regs *fregs, unsi
 }
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */

-#endif /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
-
 #endif /* __ASSEMBLY__ */

 #endif /* CONFIG_DYNAMIC_FTRACE */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offset=
s.c
index 6e8c0d6feae9e..f29b33358a328 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -505,7 +505,7 @@ void asm_offsets(void)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 #endif

-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+#ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
        DEFINE(FREGS_SIZE_ON_STACK, ALIGN(sizeof(struct
__arch_ftrace_regs), STACK_ALIGN));
        DEFINE(FREGS_EPC,           offsetof(struct __arch_ftrace_regs, epc=
));
        DEFINE(FREGS_RA,            offsetof(struct __arch_ftrace_regs, ra)=
);


Thanks,

Alex

>    2 errors generated.
>    make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets=
.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1282: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>
>
> vim +/arch_ftrace_get_regs +190 include/linux/ftrace.h
>
> 762abbc0d09f7a Masami Hiramatsu (Google  2024-12-26  184)
> d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  185) static __always=
_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
> d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  186) {
> d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  187)       if (!freg=
s)
> d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  188)               r=
eturn NULL;
> d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  189)
> 02a474ca266a47 Steven Rostedt (VMware    2020-10-27 @190)       return ar=
ch_ftrace_get_regs(fregs);
> d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  191) }
> d19ad0775dcd64 Steven Rostedt (VMware    2020-10-28  192)
>
> :::::: The code at line 190 was first introduced by commit
> :::::: 02a474ca266a47ea8f4d5a11f4ffa120f83730ad ftrace/x86: Allow for arg=
uments to be passed in to ftrace_regs by default
>
> :::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
> :::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
