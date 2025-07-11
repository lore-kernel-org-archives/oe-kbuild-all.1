Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F171A5B92
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222325; cv=none; b=fhCpWCOGTBjqD2+3N+GCcAOH94rxTTTet6rhr8w1aU645gfSE28ScYFCyi1KJPjaIfEdY3UTBdeq5yicj2rGrTdJ4JJiKlh3RXP2luJTqQMsigcMQgo2SDegiFSRGvv0mW54fpHc9KrmAQr14fAScPSRhvHrLFTDpBfBDJXZYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222325; c=relaxed/simple;
	bh=6+5Ha7SJxmyoopp1jzkm2XJfU5Q1cuDgFc7BE6MVAj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOlnTr42HVPYl1ZGWFtvbDE9ZNoIV46gyEpkDfTFqUEFTXtxDb0UKfkEFf+Mkp7kDs88aOiVVqfuN8Y/B5j/hIZmpMwGAVu7jiz9fvt2HufjgIegRmlYrXmEhud18aoFqmVgMOxZdcbFF/HXrb5gTJnKMoKv230gnsbcIBETvro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahMcmNUr; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahMcmNUr"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae361e8ec32so325129166b.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752222321; x=1752827121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRoXmte5KjgmHxw5xtEa7W/UEelUJHeebr5yRCTQ5tc=;
        b=ahMcmNUr5K0Agk7+S67btihANwVGyJPxYmuhlDRICEIT3ZSTQYwYOCxO+F5kMjSwN0
         sh72pLzCnw47T31CvtV0JjlwYDVbJf9hX2YokJlV3ey/3qNQw0RgS5c+Zn8K+7q5PtrO
         83En6+DzKlwQ6497RxX6FhqprGf8zwOHaa8VSvkysyYSI/5t9fQI6D/Y/tAFCQHxG1k6
         93pOYDrPhBZ1m303w253fgYPMJNhvkbsJIxuErhOScEmfk0WtqfQMp7gOdaPBSrGmg+n
         9cBPVNZHLjBsoaGS7F72H+729w37NA9EScAMnpnc3bOl6t3abnunwJCtiysaQMCgG5Qq
         1nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222321; x=1752827121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRoXmte5KjgmHxw5xtEa7W/UEelUJHeebr5yRCTQ5tc=;
        b=VZkCHS0w01tLLUAOIoWTPC40edYP48xbjUC52cbrL099HZBrRuiFkjULMy/gbrsOjK
         zwEvq09iTFo/8KkL5j8JXwT9hC6NqeFekoQewQp4au2IZPgHn0KSsydwQ6DidW9hYAL6
         gAbX9QW8zuDO4FAmINX2D9k/1cqVW5CaKkJbsf+o/J3JkrfgY97n55OF840hddCFPHKQ
         Mz3hFWCtWmAvFThbekBxnDYxRp+BAGG8J3jwshZ+qodtbs9O2yz3PmYa5l3Zsr9MquGW
         47dO7ItgA9xDcaG1Yj/+FPTyTPWGca3WlGp09XvOZuNAtMGeOCPAy9QJsg0Kxc1qlrRw
         SlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZR30l29lc8BynHsU5r13bm1+Rl1hK+T/LJ26gkX3qQ79uSmXaQrSGcNgr8T9FxT7hiqnh57PZs53Vb9RS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt1VlVbPVtf9+Dy4b92PXeAFfGXCFIcnWNshOxBrTsRc2kr4r+
	1fIdCUbsBHJkX+RSeDLNQmFU0K7wUyjCEkdYeN/jsAM4vBUy0l4u9lQRa6BzvIRAYtPbPkO6bVc
	k1pN9ZXanY4aT1m31KY8CCXtMx5ZIFro=
X-Gm-Gg: ASbGncuZhXpu40zJVTlI+7nd77xni3bVEAvErWb6UI+2slnOnlRjdd9PliUPncnyllV
	TBOxFqui0WB4D2ZyrrVofHbYezr3fmtgV/E8jeyaXJgR3j101USyT7WTIlr4puEwwfUCMTndb5x
	lf8K+nxoz4zUZJxal79JIPqtw9h/zUd0REScQ8wOzns+ZZb02TQ0JnuYDIFRz37U1J61AmSHxVN
	qnOoX4=
X-Google-Smtp-Source: AGHT+IFJCn2k9ZiPrMNpvm5zigeAos7swIfr+WYbZoJwErVPkTB72leaL2OosKOL08Q75yIJnf2WcPn3dtUCnG+A50Q=
X-Received: by 2002:a17:906:fd86:b0:acb:abff:a5b6 with SMTP id
 a640c23a62f3a-ae7010feb8dmr132425966b.13.1752222320689; Fri, 11 Jul 2025
 01:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aG3A8Jirg+TxNza/@rli9-mobl> <f5b1fc77-d180-4df7-b8f6-0cb0ca4a187a@ghiti.fr>
 <CAKxVwge4=cagaVDesKWe0BE88U0YmNn5LLDJvJG=F7EEP2=-LQ@mail.gmail.com>
 <7204f633-5b35-41ce-b847-7dfbaedbac47@ghiti.fr> <CAKxVwgdoK6wSt-1LNZ8Tn3MPaETR58RThbcdydijrKPbfpE68g@mail.gmail.com>
 <b6dbdcbc-08b5-4de0-9955-cf2b048dbb38@ghiti.fr>
In-Reply-To: <b6dbdcbc-08b5-4de0-9955-cf2b048dbb38@ghiti.fr>
From: Miao Chen <chenmiao.ku@gmail.com>
Date: Fri, 11 Jul 2025 16:24:42 +0800
X-Gm-Features: Ac12FXyvD0R9AsvspaLoVsNWvo-QzhbHa2gjFm3KnJTmZUxfAcQszpX4dP7braM
Message-ID: <CAKxVwgdMBfzfU04WMOALsi7sqPdj1vsv_kt+ZK=32aWASF1XXw@mail.gmail.com>
Subject: Re: [PATCH V2] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: kernel test robot <lkp@intel.com>, Linux RISCV <linux-riscv@lists.infradead.org>, 
	oe-kbuild-all@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Pu Lehui <pulehui@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I rechecked the .config file. I configured it using

make ARCH=3Driscv CROSS_COMPILE=3Driscv64-linux-gnu-
CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited
-fmax-warnings=3Dunlimited' O=3Dbuild_dir olddefconfig,

and obtained the following configuration. If NONPORTABLE is disabled,
the MMU will be enabled. I did not find any other settings that would
affect the enabling of NONPORTABLE=E2=80=94it is set to 'y' by default.


--------- CONFIG ---------------------

config NONPORTABLE
bool "Allow configurations that result in non-portable kernels"

Symbol: HAVE_DYNAMIC_FTRACE [=3Dn]
Type  : bool
Defined at kernel/trace/Kconfig:42
Selected by [n]:
    - RISCV [=3Dy] && !XIP_KERNEL [=3Dn] && MMU [=3Dn] &&
(CLANG_SUPPORTS_DYNAMIC_FTRACE [=3Dn] || GCC_SUPPORTS_DYNAMIC_FTRACE
[=3Dy])

Symbol: MMU [=3Dn]
Type  : bool
Defined at arch/riscv/Kconfig:298
Prompt: MMU-based Paged Memory Management Support
Location:
  (1) -> MMU-based Paged Memory Management Support (MMU [=3Dn])
  Selected by [n]:
      - PORTABLE [=3Dn]

Symbol: PORTABLE [=3Dn]
    Type  : bool
    Defined at arch/riscv/Kconfig:1344
    Selects: EFI [=3Dn] && MMU [=3Dn] && OF [=3Dy]

Symbol: NONPORTABLE [=3Dy]
  =E2=94=82 Type  : bool
  =E2=94=82 Defined at arch/riscv/Kconfig:389
  =E2=94=82   Prompt: Allow configurations that result in non-portable kern=
els
  =E2=94=82   Location:
  =E2=94=82     -> Platform type
  =E2=94=82 (1)   -> Allow configurations that result in non-portable kerne=
ls
(NONPORTABLE [=3Dy])

Thanks,

Chen Miao

Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=8811=E6=97=A5=
=E5=91=A8=E4=BA=94 15:55=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 7/10/25 17:56, Miao Chen wrote:
> > Hello Alex,
> >
> > I found where the error is, but there's a problem here:
> >
> > config PORTABLE
> >    bool
> >    default !NONPORTABLE
> >    select EFI
> >    select MMU
> >    select OF
> >
> > select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU &&
> > (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
> >
> > Because HAVE_DYNAMIC_FTRACE depends on the MMU=E2=80=94of course, it's
> > reasonable for DYNAMIC_FTRACE to depend on the MMU=E2=80=94*but since
> > NONPORTABLE is enabled by default, this causes PORTABLE to default to
> > n, thereby preventing the MMU from being enabled*. So, should I change
> > NONPORTABLE to default to n?
>
>
> NONPORTABLE is not enabled by default and PORTABLE=3Dn does not prevent
> MMU from being enabled.
>
> IIUC, it seems like you don't have HAVE_DYNAMIC_FTRACE enabled but
> that's probably because of your toolchain, not !MMU, can you check that
> in your .config?
>
> Thanks,
>
> Alex
>
>
> >
> > Thanks,
> >
> > Alex
> >
> > Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=8810=E6=
=97=A5=E5=91=A8=E5=9B=9B 22:33=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On 7/10/25 14:34, Miao Chen wrote:
> >>> Hello Alex,
> >>>
> >>> Sure, I'll checkout it. Btw, this is my first commit, so can u tell
> >>> how to reproduce failed case? Using the reproduce and .config.gz give=
d
> >>> by build-bot?
> >>
> >> Yes exactly!
> >>
> >>
> >>> Thanks,
> >>>
> >>> Chen Miao
> >>>
> >>> Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=8810=E6=
=97=A5=E5=91=A8=E5=9B=9B 19:53=E5=86=99=E9=81=93=EF=BC=9A
> >>>> Hi ChenMiao,
> >>>>
> >>>> On 7/9/25 03:08, kernel test robot wrote:
> >>>>> Hi ChenMiao,
> >>>>>
> >>>>> kernel test robot noticed the following build errors:
> >>>>>
> >>>>> [auto build test ERROR on fda589c286040d9ba2d72a0eaf0a13945fc48026]
> >>>>>
> >>>>> url:    https://github.com/intel-lab-lkp/linux/commits/ChenMiao/ris=
cv-ftrace-Fix-the-logic-issue-in-DYNAMIC_FTRACE-selection/20250706-231907
> >>>>> base:   fda589c286040d9ba2d72a0eaf0a13945fc48026
> >>>>> patch link:    https://lore.kernel.org/r/20250706151830.25091-1-che=
nmiao.ku%40gmail.com
> >>>>> patch subject: [PATCH V2] riscv: ftrace: Fix the logic issue in DYN=
AMIC_FTRACE selection
> >>>>> :::::: branch date: 2 days ago
> >>>>> :::::: commit date: 2 days ago
> >>>>> config: riscv-randconfig-r112-20250708 (attached as .config)
> >>>>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-projec=
t cd708029e0b2869e80abe31ddb175f7c35361f90)
> >>>>> reproduce: (attached as reproduce)
> >>>>>
> >>>>> If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> >>>>> the same patch/commit), kindly add following tags
> >>>>> | Reported-by: kernel test robot <lkp@intel.com>
> >>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202507090650.YGY56S=
IA-lkp@intel.com/
> >>>>>
> >>>>> All errors (new ones prefixed by >>):
> >>>>>
> >>>>>>> <instantiation>:1:14: error: operand must be a symbol with %lo/%p=
crel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
> >>>>>       addi sp, sp, -FREGS_SIZE_ON_STACK
> >>>>>                    ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>>> <instantiation>:2:18: error: unexpected token
> >>>>>        sw t0, FREGS_EPC(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:3:17: error: unexpected token
> >>>>>        sw x1, FREGS_RA(sp)
> >>>>>                       ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:7:17: error: unexpected token
> >>>>>        sw x6, FREGS_T1(sp)
> >>>>>                       ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:9:17: error: unexpected token
> >>>>>        sw x7, FREGS_T2(sp)
> >>>>>                       ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:10:18: error: unexpected token
> >>>>>        sw x28, FREGS_T3(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:11:18: error: unexpected token
> >>>>>        sw x29, FREGS_T4(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:12:18: error: unexpected token
> >>>>>        sw x30, FREGS_T5(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:13:18: error: unexpected token
> >>>>>        sw x31, FREGS_T6(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:16:18: error: unexpected token
> >>>>>        sw x10, FREGS_A0(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:17:18: error: unexpected token
> >>>>>        sw x11, FREGS_A1(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:18:18: error: unexpected token
> >>>>>        sw x12, FREGS_A2(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:19:18: error: unexpected token
> >>>>>        sw x13, FREGS_A3(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:20:18: error: unexpected token
> >>>>>        sw x14, FREGS_A4(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:21:18: error: unexpected token
> >>>>>        sw x15, FREGS_A5(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:22:18: error: unexpected token
> >>>>>        sw x16, FREGS_A6(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:23:18: error: unexpected token
> >>>>>        sw x17, FREGS_A7(sp)
> >>>>>                        ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>        ^
> >>>>>       <instantiation>:25:15: error: operand must be a symbol with %=
lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
> >>>>>        addi a0, a0, FREGS_SIZE_ON_STACK
> >>>>>                     ^
> >>>>>       arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro in=
stantiation
> >>>>>        SAVE_ABI_REGS
> >>>>>
> >>>>> Kconfig warnings: (for reference only)
> >>>>>       WARNING: unmet direct dependencies detected for DYNAMIC_FTRAC=
E
> >>>>>       Depends on [n]: FTRACE [=3Dy] && FUNCTION_TRACER [=3Dy] && HA=
VE_DYNAMIC_FTRACE [=3Dn]
> >>>>>       Selected by [y]:
> >>>>>       - RISCV [=3Dy] && FUNCTION_TRACER [=3Dy]
> >>>> To avoid that, we should check HAVE_DYNAMIC_FTRACE too:
> >>>>
> >>>> select DYNAMIC_FTRACE if FUNCTION_TRACER && HAVE_DYNAMIC_FTRACE
> >>>>
> >>>> That fixes the build error for me. Can you send a v3 with this chang=
e?
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Alex
> >>>>
> >>>>
> >>> _______________________________________________
> >>> linux-riscv mailing list
> >>> linux-riscv@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
