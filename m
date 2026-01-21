Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EF6428498
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997642; cv=none; b=PJyaTCGoWRW12sso7rfbgxm8ddLl3t/CKidyX9fATgq78qAf+SpB5J/CUrk/wydBiaBVPiDaH4jRcBCq6tcsMZW7pkqlHzZSAE9kptbkb9YU07cHtmIisAtrZZ74WakUczIuzPDb0Dz46fQ9rOX9aB6MBIZonQ0wOp1tHBC7Qck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997642; c=relaxed/simple;
	bh=5BvH3tNtf3yGwclgsloqehSCFnzEUkv3zWGQ5+wTvn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJvDYEtyplY+icx6DMrUX9mlaPVQxLcw9qVZs3VszPYHOhkC1ZpSWiwN326a+I+OtJV/zRlrDksB9xlMCZ7rN71LjjT1jfgUCZ9OymkQCYcciMJiYN0Jg5+pS9B2V86x8i5UPjzl8t60iFrXoUbNzeSdp/jNgHzt8J7jUhxkDUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1oPFF6b; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1oPFF6b"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dd263bf42so630726e87.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 04:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768997637; x=1769602437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=V1oPFF6bU1vePfwjaLcH+Zc+hgO/3x0e2xDXuLD/x2rFD6T3N8Z1UoHXspTqtR6sCD
         4CaEZ5e+DWQoNCkJXj1q51Z57YtGrjGM5zhX0rsanAermJdVdjEhi2n/VXFr3HYJV3iX
         7YIrKtRm9EQxgt1B18Z4eC1VsUl6HbMtt3N4T4IvZi0su4tujoEGzuLtNf6HjUcXpZX4
         lgTAZZtYow1nzrpk4tP2ElasM5ENYwwb7yT61ewnKUtThHAQG2MIFnsHeEqtFaSuCJdD
         IKKK+mEevq64xzXO+tc83yypa8WoHVsSzY59mPQGhcabjIdGMdsEoUV3gdDGJv8ou3R1
         HxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768997637; x=1769602437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=bCZjzwfwck6zErix/vdKjUlYqf1xdArtinOh+re+SY1Z2QotyvdlgIWFj14ubpG15a
         YyCPGk0GCuxnfzFXM3KmXJEVF1cG71WAcCy/hF7kzOTc2ChgNG5H4adXTNIhSp55lpDW
         H1CPHcy3ow1i7Z+S3NVYbEuMPra25V6NPPuZo1mRsmojvh9n58gH7wyX6WawXbSMiH+u
         RoaUQO6Y3NR1lK2GxsoIvGbpGZO3Fr7+mFSeW9K6MRj5pV8gW45WcnrC3hZDQ/cK3yF7
         BWhTWRfS9ozzgdI+mpFjuyIkGG676URrschlEg3XnWrOOlzhczK28ZjWSZJjtZdpUQFu
         Cmtw==
X-Forwarded-Encrypted: i=1; AJvYcCUFtcujds7tiaJ7zJf2NZoi+68alpOdCP//ifNrxuBg8AXllP0vQ5VHXMLvyNvknpwsUWHyGdL23KwkTvtw@lists.linux.dev
X-Gm-Message-State: AOJu0YynpfgvHt5YddKPRNJPW9cohUEqcVo5qKQQ3qCpsUu/w67+Xc6J
	Am2P1nk/qNnCsXqjjvGFeyoOxPexzLboEkIMaUs3g/hB6eJzg87D+Xg7DUctag==
X-Gm-Gg: AZuq6aLXEMHa1PuDOF1l0Y6kFbiFiIDCmYnRbhGH5ygCvVIyIr9qoRlpHpCgQuxcacM
	3NVAEHBsSfQxft69hjhig1QZ2PzNZcGAkSKfC1dSfJ39i3BQXhTJbJRovmSlfCOE5pyt7u5r39r
	NUdtumht4Niq+b2GalHQhdsIu71R7TJ76ZUbDDoK5h5Vg15zZAeTMx92wcqA3qj8bJB2dCJEEV1
	MPDcCQQ3OWIytEujNNjCGPhNL5/qp5phw/HsZPfF/xOLBe/7ma/oMnxOXeyQu0/RHJenz2vmjfY
	w7hFbyeHlHWGXtBT2KG2CXgeuBADoyOtjFOlnvHRaFXHjSnzg4vGVz9Yl2UtKLCkW+PXTBBuQ95
	bOA+eU74u2pZyR2FS101HlJdctaH6AI0sS+vBWLO3mnFwsFPjZoH5gC7b8famBsUcBHDoIPMeQ+
	o/OLLaiN1gG0cIac8lwcciaY5zWLjyTPxIbpdBlxhF/ZDQZ5gUXnAYWBzaobRLWmY=
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr238692885e9.1.1768990819461;
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm306630785e9.14.2026.01.21.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Date: Wed, 21 Jan 2026 10:20:17 +0000
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
Message-ID: <20260121102017.539b5531@pumpkin>
In-Reply-To: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 07:50:16 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section  
> 

When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
become real functions.

Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

	David
