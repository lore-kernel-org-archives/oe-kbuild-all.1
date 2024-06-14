Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337361591E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379333; cv=none; b=p7E28cjNYCKr35mwMkvwxqqhXFRX7hL7RU+SbW5jk/XzOclWj0Uz98QvC1YMEqFWB6JyIX55nLeV9T8mxUYc9wzur8yeIEcT9u4r7VIEZqhpjwFE3uFq7Xd2MHamObTq8XQ529PK7Nh88r8c3M+JCl7gJXimeLS63/6yzv86eNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379333; c=relaxed/simple;
	bh=e+pZ7eTKAx4VkEW8APS8mrMH/EItOgatnlu+M5ND5W0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HteUYuhRBKb9YXSyq2dme3QRoszR/7KFV5gyUlvRa3yJql9D1EUsFd6fDt5CTVU8Qv6GX/uHuYtcjzYTnSqTpEqrafrMK9OUZoT1zLq0vwDxQy7/DAy9dkLXyMHbbULXBRhiS6k2scQldb7P3m2RGDkBfvsmHzCkhUbBIvSCkXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDRyjSt2; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDRyjSt2"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dff1eb1c1fcso971206276.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718379330; x=1718984130; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dK2lFOmA7MzUYlO9j8YBz7d5Tzn0my7qhQPYijrsljo=;
        b=qDRyjSt2OK+OZ4Qtf0OPcBA//cD8X7VSqkBcO/XoPMpFXOgaoRVUCWtmohnSRAomXp
         l2lrLh5qTXX672gKIqwXrCoUye+VHWrlvdcaBE7g+rm9lOE347uKeIwuOPAFoBEz2JsZ
         4gqkcW2Cl1f8OZYxHCW6PFhcXieEzuIPc872TzsiY/hmZTsZPLb2rjR3Af2kbDel+h9L
         ei4vaps5HSFZIxEPgQqcxWxvc5M8s9GpIzAMZwhUu83bDy1nsXTvhQEKN+sHr1LSNe2J
         Y7PMgYoUnncKxxrL7Y3uFtFfC5aZ26TE30wNmCfAz6iy6ii21JG+MXtTlnDkjS7B6yZ0
         pROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718379330; x=1718984130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dK2lFOmA7MzUYlO9j8YBz7d5Tzn0my7qhQPYijrsljo=;
        b=J8GYzR5e74sP+WRMY6l11+wCxHbVm1ySeoiM8t8sRCA2JfD15yZKKja8+H7MhuxhHZ
         cziw2QOgkQj9nIGMDqsQCPqmtsTbNyU//AMSXpRrLHVyyX7zJVPOFNwasYDLIGeqUHRU
         KvPl/OQvLhNSwEgp7kPShG3q/WD3bih1oaV+Xhk5HkVNzHqeUy3Ax7nU68l0sr/4Tu4a
         OtQg796rQkmCKENEoEkmke2bXLis3yB68C69xCJQi6K7+mK6dnOtcYvQULZay9k7yKGL
         evnLPzqq0/X0WUaLCbzCAIhUBQNAN20ImW0IKWAl0Z/AZZbslp1PINv5IY8IK1CYWZYt
         AfxA==
X-Forwarded-Encrypted: i=1; AJvYcCWWrYg2B+tgKzAS5Qb1Q981ndB5bNFdA6PjdiulUu9lhZ9lEMjLzLxvsDZHt8n4qB6wMivVEMtce8Xre/JyDrxQ/zuQhWrelTM5Dq7agw==
X-Gm-Message-State: AOJu0YxOZYstQGS7akDQSWeirV6ozI15N60Nab3/kwFI9oOTHDM5+aXT
	ZCspbY9i6LgHUxXKa661fAVXjzz3rzZHEHh0y0rG+fjeQ3caNRLWyGo3rNte56v6HUECxe87h9s
	bxw==
X-Google-Smtp-Source: AGHT+IHZ+72AO/j0fqGW0W0xo4ynxvLZU81Wx/9eB8DTQbR+p/iEZtM5Z/d/JmTxJ48EWnz7qRK+kllwhBo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:18ca:b0:dfe:fca5:2b9c with SMTP id
 3f1490d57ef6-dff1389defemr890465276.2.1718379330021; Fri, 14 Jun 2024
 08:35:30 -0700 (PDT)
Date: Fri, 14 Jun 2024 08:35:23 -0700
In-Reply-To: <20240614152228.GAZmxgNPmozj7UzRdV@fat_crate.local>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202406141648.jO9qNGLa-lkp@intel.com> <20240614152228.GAZmxgNPmozj7UzRdV@fat_crate.local>
Message-ID: <ZmxjOxhPy67QOh5Q@google.com>
Subject: Re: [tip:x86/alternatives 14/14] arch/x86/kvm/kvm.o: warning:
 objtool: .altinstr_replacement+0xc5: call without frame pointer save/setup
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 14, 2024, Borislav Petkov wrote:
> On Fri, Jun 14, 2024 at 04:15:14PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/alternatives
> > head:   f776e41fdcc4141876ef6f297318ab04c2382eb7
> > commit: f776e41fdcc4141876ef6f297318ab04c2382eb7 [14/14] x86/alternative: Replace the old macros
> > config: x86_64-buildonly-randconfig-r001-20211209 (https://download.01.org/0day-ci/archive/20240614/202406141648.jO9qNGLa-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141648.jO9qNGLa-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406141648.jO9qNGLa-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> arch/x86/kvm/kvm.o: warning: objtool: .altinstr_replacement+0xc5: call without frame pointer save/setup
> 
> That thing comes from:
> 
> SYM_FUNC_START(vmx_do_interrupt_irqoff)
>         VMX_DO_EVENT_IRQOFF CALL_NOSPEC _ASM_ARG1
> SYM_FUNC_END(vmx_do_interrupt_irqoff)
> 
> at the end of arch/x86/kvm/vmx/vmenter.S.
> 
> I know Sean had a patchset to cleanup that gunk. Sean?

That series was just for the actual VM-Enter/VM-Exit path.  vmx_do_interrupt_irqoff()
is unrelated, it's just another asm chunk of code that happnes to live in vmenter.S
(which is obviously is a bit of a misnomer these days).

> >From reading objtool docs, those functions (vmx_do_nmi_irqoff() too AFAICT)
> should have FRAME_BEGIN/FRAME_END  but if I do that, objtool bitches
> differently:

That function does create a stack frame, just without using FRAME_BEGIN/END so
it's not dependent on using frame pointers.  Ironically, the intent is to try and
placate objtool.

IIUC, this warning just stared showing up with the alternatives changes?  Does
CALL_NOSPEC generate different code now?

.macro VMX_DO_EVENT_IRQOFF call_insn call_target
	/*
	 * Unconditionally create a stack frame, getting the correct RSP on the
	 * stack (for x86-64) would take two instructions anyways, and RBP can
	 * be used to restore RSP to make objtool happy (see below).
	 */
	push %_ASM_BP
	mov %_ASM_SP, %_ASM_BP

#ifdef CONFIG_X86_64
	/*
	 * Align RSP to a 16-byte boundary (to emulate CPU behavior) before
	 * creating the synthetic interrupt stack frame for the IRQ/NMI.
	 */
	and  $-16, %rsp
	push $__KERNEL_DS
	push %rbp
#endif
	pushf
	push $__KERNEL_CS
	\call_insn \call_target

	/*
	 * "Restore" RSP from RBP, even though IRET has already unwound RSP to
	 * the correct value.  objtool doesn't know the callee will IRET and,
	 * without the explicit restore, thinks the stack is getting walloped.
	 * Using an unwind hint is problematic due to x86-64's dynamic alignment.
	 */
	mov %_ASM_BP, %_ASM_SP
	pop %_ASM_BP
	RET
.endm

> 
> arch/x86/kvm/kvm-intel.o: warning: objtool: vmx_do_interrupt_irqoff+0xc: undefined stack state
> 
> Suggestions?


