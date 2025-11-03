Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66862F12CF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762173539; cv=none; b=LDSvC9cG6CDaLFBuKdVN83oHp+e3rt0pmw+u4isTl54M7SW/aTupN/Yl7A518lcJMaIciMEV7tedLYOTHVbzuN3PV0i7R1V7E2gSJhydrayoZjLpCRH55+7ObJFWJ/5VBtSxoZI6KokO9aO/1ZA5jBM/Gh8Fq/GQs7l9VNjIdlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762173539; c=relaxed/simple;
	bh=izB7uJGtTSwNhXYbyWcEb41JmA2rnS0h/QqNb5tUfhE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=hFd2qnZVTa8smuMG9HU2v0+FMwaUk4OS0QJC2GQ3kiJ72hrKFBvmSfQI7XNikTu8AqhO2QSFePblVB48rf9wZ5eqJjYKrXxqNJWCRSU0FQdZE5ZdFNC2i3oAx+CexAU9VRw6e7RqVP/Dq/fe1/PBo8hrNI5x/6i+uJw0j819eRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=Z9n/iC9U; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="Z9n/iC9U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To; bh=LE69I641i9BiEnoTELwC/9jIDwANz2JUs1g02a4LlHc=; b=Z9n/iC9URRvkrs8t
	IRH33aLdxY9ltVZk6JcERrTuQaK9FhI9aoNrqcn4J+2t+7VsOg1wSa5/8AjExys4kL2ReBfGwTg3p
	IoMqYmb0FOg1O5lcwBy8uuDBo5/7IPsu4Pqf37Z7rHWumNaNKjslahTHunDjVo7E1tB8fYIBphfl3
	8fGMSFh6//76UfSebPGRL7fLpP1ClRecMDxhgmumAOjHiTxDPn9PZZhqBjCsrmWzAJ0y9tYLXelnv
	81qu5GpM5SwdwAXzwi+Fp8imehktqx2qPDKmczoZL/g6i+w/n3mDV8DwT/lz67qWc4ORIOgkWb0bG
	Irf1SDoPIKQloubBxg==;
Received: from ipa12.colo.codethink.co.uk ([78.40.148.178] helo=webmail.codethink.co.uk)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vFtY0-00Fkr6-7w; Mon, 03 Nov 2025 12:20:32 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 03 Nov 2025 12:20:32 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Andrew
 Jones <ajones@ventanamicro.com>
Subject: Re: [linux-next:master 3969/5042]
 arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode
 `0x100000f'
In-Reply-To: <202510302348.Knwt7vQ1-lkp@intel.com>
References: <202510302348.Knwt7vQ1-lkp@intel.com>
Message-ID: <5331564de17c63a0f8d654c501007dfa@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk



On 2025-10-30 15:20, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   131f3d9446a6075192cdd91f197989d98302faa6
> commit: 44aa25c000b41d7afcb030ac1b8a38f06dabef0a [3969/5042] riscv: 
> asm: use .insn for making custom instructions
> config: riscv-randconfig-r132-20251030 
> (https://download.01.org/0day-ci/archive/20251030/202510302348.Knwt7vQ1-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20251030/202510302348.Knwt7vQ1-lkp@intel.com/reproduce)
> 

[snip]

> 
>     SYSCALL_DEFINE3(readlink, const char __user *, path, char __user *, 
> buf,
>     ^~~~~~~~~~~~~~~
>    arch/riscv/include/asm/vdso/processor.h: Assembler messages:
>>> arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized 
>>> opcode `0x100000f'
> ..
> 
> 
> vim +27 arch/riscv/include/asm/vdso/processor.h
> 
> ad5d1122b82fbd Vincent Chen 2020-06-09  26
> f811f58597acba Thomas Huth  2025-06-06 @27  #endif /* __ASSEMBLER__ */
> ad5d1122b82fbd Vincent Chen 2020-06-09  28
> 
> :::::: The code at line 27 was first introduced by commit
> :::::: f811f58597acba9100dd61cdef052d1d1f931968 riscv: Replace 
> __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
> 
> :::::: TO: Thomas Huth <thuth@redhat.com>
> :::::: CC: Paul Walmsley <pjw@kernel.org>

I'm guessing somehow this messed up with my change for ASM_JNSN_I() and 
thus isn't building
or is there some other configuration?

I'm out for this week so not sure if I can get to look at this if needed

-- 
Ben
