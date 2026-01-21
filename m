Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F0346AFD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 16:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014031; cv=none; b=ELLuhKjeJX9IfaTBzZ9r4fAik1nEWkO+iRO58skrGm1OlQ3k8MMYBj6tAZQ45/Fuwkr1hFe7tyH1pUZwLmEXzvP4ehWBO6SSTJ8jD7Ziq7ce1fVleFCGs/+Wmv07G01N/B+Bb93jjvUv9Xs5o1ygs5z7ZSYbygnv4YIluzpAk6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014031; c=relaxed/simple;
	bh=Jj/tYwdXEXUOg64lKr4IrDKHw613UPzJ/qBPeEVnSIo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mrGQp0N3RQvTa3MISyVQboh6DpNh1Z7qkSXEHZ8T8yrnzcdqYSEJUSGZ3UphHKCYvO6ay9YvlK1KrhCeWtCw9QN7vU0HuqpJ/t48MpI9hx1RTTM4rdGZWxpkN9v0U0IO/d7yKn+G87RE0dppgwV3TDqtChi2KZVb4YB85mfFFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klnPz4gn; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klnPz4gn"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so23408a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 08:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769014028; x=1769618828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=klnPz4gn/9vIwfAIME60v9cBCYmT3zJ65NnadyCWlvgAZ+oLzOFvgtcrZb8Q/8O5Zq
         rUnuZLrg9OUqgxG9wqXFyHJ09HUHFqRF8ZlDIv+tJXAeLAgMMNtIZvvfxNTEX1V+9SB/
         ntkhGW/uXKBrvewxxvUAPxI/Xza8LQKUkcXCeSbzQUs0FutwWa+vHNQuzUc79W8TLbOG
         BgiXBjPK3QT86w2uWH7v7DdkVBJQ1Zf47I/XreWCmYvf27Tx+Zmdv5QLMIC1Rg7svIkj
         FMXp0oVGHx4rGwDLky2+Vif6995xoHAJXoPHKwH3SLz+ApG+eCUFEHsiYznTBZmzp0Ya
         4Zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014028; x=1769618828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=VXzBZgQ42ll/FJu4mLqYXaLc9Y6oEKwRcWfQIgHyZTASHhSOk21jshSM3P5XkUNHn7
         y5Ias0wCBQmDpIT/4cOMEz+DY2xgSJLCYibklSh3y0HnwICESyhjetczj34mOkBuIZPp
         iUsHKDG7dscRjU0FBe/F8sHVHmkt9PZmZiojRxnO8/b1q7KS6k4AbohzBDkOVGa5FB40
         cy/qlcBOQAgCLRc6RHKbvmaABqjzJ6ruaRyI9Wu14rrXu8qHUmPYkg9NO6Nqe5ehjVXE
         EQotOcw8egJwinruaMw+5IlDY2dLo0v1vTdYr3UFr+nUQ5owWO/5wtFLgtuZkUxvYgiY
         WuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLIWUssxcZ8N0jZTHnbVbTti+AOOQAMSHSFytzH4R/GG4Jg4NVP852aokK1iVJj4ewby1SZjCgoK+aRyLj@lists.linux.dev
X-Gm-Message-State: AOJu0YwNyjCCs1dv/r8aXch5DR3cjuknMiktFlPi6ATg5+QvK/HZwmrJ
	YMcySxaKEMmr+t/IGZKWz4/g65NXf+2C+Uo09FOwJ5Y35swDC2GCQwWN0dzFwA==
X-Gm-Gg: AZuq6aJCBxhEdGCKSJCeTPFwIvee9a5Ho5+OU9NYHqPrRAj/Rl8zACgXbZ0jQ4ia18G
	J8RdgY6+uk8p3yMPZAqzub19BxzXjPS+Fs7PgP9dLrZAMqgp1uVZ2H1oMXjB9OY0wBelyAyyZoH
	2v9cN+WefKead/UkXlXR+pDo2gX8/1DnMa7qTRjojQoFa42a1h9ybx8+PzUCafvADZkxjwyVSIl
	/W6J9CWS6Yp6Y7Dplm7b30CnxfdlKjsijnJdccIsjQiLToisIsxjdm1GAfslB9xwW/186jRmHOy
	mv7gAVzh/BR8OKSXQxgDMQUFKZ4pNT6vvawHpHsoslKiQXAfmZ1zgeTtEF6ARWGMvsp2/mqIX1B
	7JKmFPauNRAcKOb8siDvHHmmFPpCHut7nAoA007cIjl/MOsSSf8VKNBQvxU0iZxXO/cLJdQiJ2L
	NRlFwqoNgv9KGVPA0JQigzl9ybmRphPe/kzHW2/a+CLtoZo1YyqGQP
X-Received: by 2002:a05:600c:4fc7:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-48042f7e0e0mr38897745e9.25.1769006884109;
        Wed, 21 Jan 2026 06:48:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm274897235e9.7.2026.01.21.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:48:03 -0800 (PST)
Date: Wed, 21 Jan 2026 14:48:02 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260121144802.1287ce3e@pumpkin>
In-Reply-To: <20260121102017.539b5531@pumpkin>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
	<20260121102017.539b5531@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 10:20:17 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 21 Jan 2026 07:50:16 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ryan,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> > [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> > patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> > config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> >   
> > >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> > >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section    
> >   
> 
> When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
> the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
> become real functions.
> 
> Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

Or the code could just use the per-cpu data without disabling preemption.
Usually that isn't a good idea at all, but it can't matter in this case.
Might give a noticeable performance gain, disabling preemption is
non-trivial and/or an atomic operation on some architectures.

If anyone is worried about preemption causing the output be repeated, that
would be (mostly) mitigated by checking that s[1234] haven't changed prior
to writing the new values.
I think a 'not locked at all' compare of two of the four values will
stop everything except two threads doing system calls at the same time
getting the same output from the prng.

The whole thing is very unlikely and there will be much easier ways
to break the prng.
Provided s[1234] are only written with valid values (ie ones which aren't
effectively zero) it will continue generating numbers.

	David


> 
> 	David
> 

