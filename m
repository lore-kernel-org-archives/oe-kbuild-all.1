Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36F279DB6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 15:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163062; cv=none; b=F0Oelq1TYBC1xB1Y2BKyJhw4R4eUVlSGc34pBhCsPbK4PGoKqqpI4gYXZAOEPEN5HJRLW10inJmes6gp8G+FkBfB+1MeOtgW3Doqinb/Q7cBgkzo1mW+zK1VtD22QkzegyjDPgWdGX/192hX2UQP8gA88KYhO4HeWzZKyiw0/+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163062; c=relaxed/simple;
	bh=lFZcBY3URVFrvN1SU2OnNL6+oWxyKK5PS2R0CTUJbu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cl928np0ar0UnMJTwU9tgKHW4NqK9tZYT4TPpw13Yt3//W84IpRLeZ1gi1qGGS9wOa4iYS9+DfRNQM3xSeV8malJRdbiseTLgAN9I1yX287/Kq/TWMYmPRZlqijjp6FXbkhWHWWdLWtXVScZChM0FRDs4jHKzin8+mH5g1QLkiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z50HCOKe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z50HCOKe"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so3810927a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752163057; x=1752767857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyFwto6duT8k2J6PKEM3Zq5e4wrdh9RzheYLqE65elg=;
        b=Z50HCOKeGhzTEc7OdypGi0CTipgy1tZEE4vFzvPYaS6gI2c5c1/Bt3hcN7tekjEEmM
         IQkUoPyZ78H0PD9CAy+q2kzf/HyOWuhqO5IL1JV/fwao5V7SO8fiWepILuADRtsh/Rco
         9Arqa0kdd39E7y0azvxUpeb2yIXkwvpqdkyTi/U6hVvCqRXcZxr0hL/WA7EZMwnmxS2z
         ffYxpCS0hSmxEE+4zxgvR9pUWrtf98bR64b92gCPthP/xziaKOPzfMnHfouycJIAs1hL
         iCx0Goy/6EJALOvttPcR9XcvEPTCdkzz/R5LBx8aN9Er48VMCqr+Hf6RG/b+Vjg5VCV3
         jBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163057; x=1752767857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyFwto6duT8k2J6PKEM3Zq5e4wrdh9RzheYLqE65elg=;
        b=HAVXrwntQQrn2fQj36JdY51ukKWvK2YrXrRqHHbAHYq9T/kBzgvZefwFXgfgvT5J11
         WiAebIjhvTt4hRjysSkWuqaPZ9dmY++PWoUYmohEn9KihH8ei/JnL2ZaWLRMrRceGcGR
         e5Qdkj0e3xVoNHADWyhvmqW/1lzVS8tyK90rJ7fgy8ADqaIFzxoJZYr3Ot78tgjaKzJy
         bTRjfE3pdhLAxI3muBhsDr5Tg4/E46lKwi9ELL3xM4J+3Tjs0pV/JwHMLnAhfHPNbvT2
         MqZJ4kleat0kQmEFPMNo15gCWnvFv9l0syTTZM8KMjOAP9W5CpFrbRI1oi5ocYfjXSu4
         GPPA==
X-Forwarded-Encrypted: i=1; AJvYcCV99hCycfZNG70csDQJHFN/ZiQXPmpoHXSI84xhyYPbBNhdhTudOZvY6d0FRp9IjdTr6lkSPKweD86UKPy+@lists.linux.dev
X-Gm-Message-State: AOJu0YwIiqAQGlTHwwOHkJani0CkvYToJPMWBdFIngzx9pid4/4o+Wsk
	c3BQ5/7C8y7J2e2Xro1UEzoa9tq2xsBW2gftnCex34XEt1AJZBT+PtMbgxzYFNvKk3B8QjTrxfM
	W05ViJOwJOsTApkJ8Jw+8LUgZu84QAwg=
X-Gm-Gg: ASbGnctrWe3KNBQBmwzKigO0pElwjZ4Ft5lGo6HhwR9bFo/HRTVo5Y+xVs2yIBCz2em
	bGfqW7HCrohoBopwKKgka9gb6kBltJTwBW9DaD3qT6KZEnP680Ao8gYPEExYfrSsDsYihppYIkw
	YEa/46sEFH5/ZWP/1GvIPfjirtJ6k6ZqdCxxQBNxdB3XE=
X-Google-Smtp-Source: AGHT+IFDjIdZXlAQN0o9gcQft8bdsUVAZWKdpbA0Umxqt7nH2dtNl+9/RBdEY1alElz7unAk1Y4PgfpvrjfUKZtYKls=
X-Received: by 2002:a17:907:7f24:b0:ae3:bb0a:1ce9 with SMTP id
 a640c23a62f3a-ae6e23472c0mr495513166b.12.1752163056970; Thu, 10 Jul 2025
 08:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aG3A8Jirg+TxNza/@rli9-mobl> <f5b1fc77-d180-4df7-b8f6-0cb0ca4a187a@ghiti.fr>
 <CAKxVwge4=cagaVDesKWe0BE88U0YmNn5LLDJvJG=F7EEP2=-LQ@mail.gmail.com> <7204f633-5b35-41ce-b847-7dfbaedbac47@ghiti.fr>
In-Reply-To: <7204f633-5b35-41ce-b847-7dfbaedbac47@ghiti.fr>
From: Miao Chen <chenmiao.ku@gmail.com>
Date: Thu, 10 Jul 2025 23:56:59 +0800
X-Gm-Features: Ac12FXwpHGHrqNJMYOCJrRAIJPU1S5sbSrf6kJb2PGDBA5iQ-Twvb8GXnLf4awU
Message-ID: <CAKxVwgdoK6wSt-1LNZ8Tn3MPaETR58RThbcdydijrKPbfpE68g@mail.gmail.com>
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

Hello Alex,

I found where the error is, but there's a problem here:

config PORTABLE
  bool
  default !NONPORTABLE
  select EFI
  select MMU
  select OF

select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU &&
(CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)

Because HAVE_DYNAMIC_FTRACE depends on the MMU=E2=80=94of course, it's
reasonable for DYNAMIC_FTRACE to depend on the MMU=E2=80=94*but since
NONPORTABLE is enabled by default, this causes PORTABLE to default to
n, thereby preventing the MMU from being enabled*. So, should I change
NONPORTABLE to default to n?

Thanks,

Alex

Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=8810=E6=97=A5=
=E5=91=A8=E5=9B=9B 22:33=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On 7/10/25 14:34, Miao Chen wrote:
> > Hello Alex,
> >
> > Sure, I'll checkout it. Btw, this is my first commit, so can u tell
> > how to reproduce failed case? Using the reproduce and .config.gz gived
> > by build-bot?
>
>
> Yes exactly!
>
>
> >
> > Thanks,
> >
> > Chen Miao
> >
> > Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=8810=E6=
=97=A5=E5=91=A8=E5=9B=9B 19:53=E5=86=99=E9=81=93=EF=BC=9A
> >> Hi ChenMiao,
> >>
> >> On 7/9/25 03:08, kernel test robot wrote:
> >>> Hi ChenMiao,
> >>>
> >>> kernel test robot noticed the following build errors:
> >>>
> >>> [auto build test ERROR on fda589c286040d9ba2d72a0eaf0a13945fc48026]
> >>>
> >>> url:    https://github.com/intel-lab-lkp/linux/commits/ChenMiao/riscv=
-ftrace-Fix-the-logic-issue-in-DYNAMIC_FTRACE-selection/20250706-231907
> >>> base:   fda589c286040d9ba2d72a0eaf0a13945fc48026
> >>> patch link:    https://lore.kernel.org/r/20250706151830.25091-1-chenm=
iao.ku%40gmail.com
> >>> patch subject: [PATCH V2] riscv: ftrace: Fix the logic issue in DYNAM=
IC_FTRACE selection
> >>> :::::: branch date: 2 days ago
> >>> :::::: commit date: 2 days ago
> >>> config: riscv-randconfig-r112-20250708 (attached as .config)
> >>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project =
cd708029e0b2869e80abe31ddb175f7c35361f90)
> >>> reproduce: (attached as reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202507090650.YGY56SIA=
-lkp@intel.com/
> >>>
> >>> All errors (new ones prefixed by >>):
> >>>
> >>>>> <instantiation>:1:14: error: operand must be a symbol with %lo/%pcr=
el_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
> >>>      addi sp, sp, -FREGS_SIZE_ON_STACK
> >>>                   ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>>> <instantiation>:2:18: error: unexpected token
> >>>       sw t0, FREGS_EPC(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:3:17: error: unexpected token
> >>>       sw x1, FREGS_RA(sp)
> >>>                      ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:7:17: error: unexpected token
> >>>       sw x6, FREGS_T1(sp)
> >>>                      ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:9:17: error: unexpected token
> >>>       sw x7, FREGS_T2(sp)
> >>>                      ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:10:18: error: unexpected token
> >>>       sw x28, FREGS_T3(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:11:18: error: unexpected token
> >>>       sw x29, FREGS_T4(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:12:18: error: unexpected token
> >>>       sw x30, FREGS_T5(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:13:18: error: unexpected token
> >>>       sw x31, FREGS_T6(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:16:18: error: unexpected token
> >>>       sw x10, FREGS_A0(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:17:18: error: unexpected token
> >>>       sw x11, FREGS_A1(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:18:18: error: unexpected token
> >>>       sw x12, FREGS_A2(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:19:18: error: unexpected token
> >>>       sw x13, FREGS_A3(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:20:18: error: unexpected token
> >>>       sw x14, FREGS_A4(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:21:18: error: unexpected token
> >>>       sw x15, FREGS_A5(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:22:18: error: unexpected token
> >>>       sw x16, FREGS_A6(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:23:18: error: unexpected token
> >>>       sw x17, FREGS_A7(sp)
> >>>                       ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>       ^
> >>>      <instantiation>:25:15: error: operand must be a symbol with %lo/=
%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
> >>>       addi a0, a0, FREGS_SIZE_ON_STACK
> >>>                    ^
> >>>      arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro insta=
ntiation
> >>>       SAVE_ABI_REGS
> >>>
> >>> Kconfig warnings: (for reference only)
> >>>      WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE
> >>>      Depends on [n]: FTRACE [=3Dy] && FUNCTION_TRACER [=3Dy] && HAVE_=
DYNAMIC_FTRACE [=3Dn]
> >>>      Selected by [y]:
> >>>      - RISCV [=3Dy] && FUNCTION_TRACER [=3Dy]
> >> To avoid that, we should check HAVE_DYNAMIC_FTRACE too:
> >>
> >> select DYNAMIC_FTRACE if FUNCTION_TRACER && HAVE_DYNAMIC_FTRACE
> >>
> >> That fixes the build error for me. Can you send a v3 with this change?
> >>
> >> Thanks,
> >>
> >> Alex
> >>
> >>
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
