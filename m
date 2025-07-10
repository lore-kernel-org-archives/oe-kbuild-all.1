Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36378221561
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150926; cv=none; b=NT9TvO83UM+aTsZvtIWDyq0ks6jSWKvbPqz9RMymHBpYEZsVsyLUPK45deygeKs3R65w/ox9Pqv9YfvoaQFxwpBm9Hvws59NnqeAdev6y92mxvupl9ZSPHayqrLKeHsTt+vVO/k2MIpQH9rgJMq2zsug4g8Pcb7l0y1c6tr7ShY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150926; c=relaxed/simple;
	bh=LG/1ebUuJmEyed8LnLcwSnJXIFtKciPHzdZFR+vJsTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0Ak2+xyk9ao3UZ8YHYVE0Z1Efljk5jPAcrYscEaaWkjvNWmFHd4xR4scCDMP4kM86t34AftIdh3tKd6EUaXjyA+Oc8O0cvanHmBXkMYD7d0tsJMgvgpKkAgcVf8AD/w7iRt7By/sHofh0Pvp3NaIcFTZUz0PRp9FWEmXoXBLN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br8HvXYB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br8HvXYB"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so144755866b.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752150922; x=1752755722; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYqkWjUbgDgAMhDOaLlsy2feUWXhugPze0zXdTjzjHk=;
        b=Br8HvXYBCGpL7vkW02s/ejPjPG51opJe0NvTiiq85io9EaoXMJ+FFAZaGR4OXiWoyQ
         8+KsCsWqeQ6I2DlBCTpZ8bKVbG90vnoFWjUPYOJZDGWBPCUHA1tSu+s9h/bWo/MebWtR
         zLpPx2EmJzbhXzdP5XCRTjPY1HgArC1d6LSpMsa0bZbDLbvmlabZVkFtniXs9IYF5Ue/
         iA+Y3JApsdsanhzJuIH5RAUULI1KTx5RxhK6nKZlIdNwdSKAQFHNT97iCRfSNFRDDrxT
         OTTGnfdthP9upUEUdD4zyYbROsA9MkOYxeGhHmWrn/+8xMvS6eh3gNQcXJsw0j+wferi
         G6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150922; x=1752755722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYqkWjUbgDgAMhDOaLlsy2feUWXhugPze0zXdTjzjHk=;
        b=InjwrAlzCHeNp4zxkZdZpjh0UzfzVWvv8sn1CqVnDkz01chdADWIWCGUvWOBO126kj
         U3HG7NeEYBudBV8qgL3eIRzbuvcYk2A/BwOdWYq299hfoNPl09qcgyZPZvLgUUsGuGHA
         fdo7Cw6QEW90h9i1W6i7fe0CygWsCw1kErcD5edl2pG/WnTlvqtcZ68c6RG8D1ooeQpC
         6LukUPAfXBVh7eb5vk4dqb56k0sq/Rw9nB5WGgHOUwg/8P7PqUhwdtuMOS5n7ykrUkhI
         BE+dxj2KKuGI7v9J73yMJcXlDEX1BEd7Aho2JOk4KMuhjWOK6EIZkaaFqmyB32h4vXY/
         BwQA==
X-Forwarded-Encrypted: i=1; AJvYcCWfRXMniSXM3psdtQ5opWb5L0yihuQ9OJiSAW3pZbKOP6QhKuj8VxcBdFbUlDBCNykMimApbbxgntssJjS5@lists.linux.dev
X-Gm-Message-State: AOJu0YwAf+Cyg4+TmfXEYE5BsSlvBJoMxKZOVS6V3TEuVQ2UYP1RPlKw
	Xz57gG6tccXVVVVcVN/35NmvfRK+BuMEW3/f9HEKWGrnSXTbmuEjeF1v7gq3NnYIXmkH6baWnMF
	a4TC7WY8EGu5+6JM3QgsRSB9+crUzvKs=
X-Gm-Gg: ASbGnctZeE4scjLPjgfiyqvTGiRSsANHl27lQ7ZyAXPoeU0g2d6qjTETlgTyqWC2oE8
	V2liwE3sdTiL8z/FZJtgAVZ8DcHl2haW8hpYIEptxj2DRe1osgmOFI5VBF6dBtctPwNnRwGzAWZ
	35O7wEnxBFlZ2sH205hxQZl/pn7rhf1HQRQmG9lG7hDik=
X-Google-Smtp-Source: AGHT+IHX3T7PV+QykAyNuRR2dadti9v2Ie7wRir36J2u9mQCz2nSMY967MJ2BBYwJz7saaIfCMnr2xs/Ohboe+eEpZM=
X-Received: by 2002:a17:906:6d96:b0:ae3:6cc8:e431 with SMTP id
 a640c23a62f3a-ae6cfbb7884mr544526266b.57.1752150922268; Thu, 10 Jul 2025
 05:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aG3A8Jirg+TxNza/@rli9-mobl> <f5b1fc77-d180-4df7-b8f6-0cb0ca4a187a@ghiti.fr>
In-Reply-To: <f5b1fc77-d180-4df7-b8f6-0cb0ca4a187a@ghiti.fr>
From: Miao Chen <chenmiao.ku@gmail.com>
Date: Thu, 10 Jul 2025 20:34:45 +0800
X-Gm-Features: Ac12FXz3YDmx_bCl1jwLRzCqzWV1jsBoaUE9F5V_xEYIQNA0e0JwLEYjqB_I24M
Message-ID: <CAKxVwge4=cagaVDesKWe0BE88U0YmNn5LLDJvJG=F7EEP2=-LQ@mail.gmail.com>
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

Sure, I'll checkout it. Btw, this is my first commit, so can u tell
how to reproduce failed case? Using the reproduce and .config.gz gived
by build-bot?

Thanks,

Chen Miao

Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=8810=E6=97=A5=
=E5=91=A8=E5=9B=9B 19:53=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi ChenMiao,
>
> On 7/9/25 03:08, kernel test robot wrote:
> > Hi ChenMiao,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on fda589c286040d9ba2d72a0eaf0a13945fc48026]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/ChenMiao/riscv-f=
trace-Fix-the-logic-issue-in-DYNAMIC_FTRACE-selection/20250706-231907
> > base:   fda589c286040d9ba2d72a0eaf0a13945fc48026
> > patch link:    https://lore.kernel.org/r/20250706151830.25091-1-chenmia=
o.ku%40gmail.com
> > patch subject: [PATCH V2] riscv: ftrace: Fix the logic issue in DYNAMIC=
_FTRACE selection
> > :::::: branch date: 2 days ago
> > :::::: commit date: 2 days ago
> > config: riscv-randconfig-r112-20250708 (attached as .config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd=
708029e0b2869e80abe31ddb175f7c35361f90)
> > reproduce: (attached as reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507090650.YGY56SIA-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> <instantiation>:1:14: error: operand must be a symbol with %lo/%pcrel=
_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
> >     addi sp, sp, -FREGS_SIZE_ON_STACK
> >                  ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >>> <instantiation>:2:18: error: unexpected token
> >      sw t0, FREGS_EPC(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:3:17: error: unexpected token
> >      sw x1, FREGS_RA(sp)
> >                     ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:7:17: error: unexpected token
> >      sw x6, FREGS_T1(sp)
> >                     ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:9:17: error: unexpected token
> >      sw x7, FREGS_T2(sp)
> >                     ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:10:18: error: unexpected token
> >      sw x28, FREGS_T3(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:11:18: error: unexpected token
> >      sw x29, FREGS_T4(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:12:18: error: unexpected token
> >      sw x30, FREGS_T5(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:13:18: error: unexpected token
> >      sw x31, FREGS_T6(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:16:18: error: unexpected token
> >      sw x10, FREGS_A0(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:17:18: error: unexpected token
> >      sw x11, FREGS_A1(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:18:18: error: unexpected token
> >      sw x12, FREGS_A2(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:19:18: error: unexpected token
> >      sw x13, FREGS_A3(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:20:18: error: unexpected token
> >      sw x14, FREGS_A4(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:21:18: error: unexpected token
> >      sw x15, FREGS_A5(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:22:18: error: unexpected token
> >      sw x16, FREGS_A6(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:23:18: error: unexpected token
> >      sw x17, FREGS_A7(sp)
> >                      ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >      ^
> >     <instantiation>:25:15: error: operand must be a symbol with %lo/%pc=
rel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
> >      addi a0, a0, FREGS_SIZE_ON_STACK
> >                   ^
> >     arch/riscv/kernel/mcount-dyn.S:185:2: note: while in macro instanti=
ation
> >      SAVE_ABI_REGS
> >
> > Kconfig warnings: (for reference only)
> >     WARNING: unmet direct dependencies detected for DYNAMIC_FTRACE
> >     Depends on [n]: FTRACE [=3Dy] && FUNCTION_TRACER [=3Dy] && HAVE_DYN=
AMIC_FTRACE [=3Dn]
> >     Selected by [y]:
> >     - RISCV [=3Dy] && FUNCTION_TRACER [=3Dy]
>
> To avoid that, we should check HAVE_DYNAMIC_FTRACE too:
>
> select DYNAMIC_FTRACE if FUNCTION_TRACER && HAVE_DYNAMIC_FTRACE
>
> That fixes the build error for me. Can you send a v3 with this change?
>
> Thanks,
>
> Alex
>
>
> >
