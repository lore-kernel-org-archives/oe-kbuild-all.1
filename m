Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5592E6CCD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 05:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786166777; cv=none; b=CNiRc2bEBGr4DT07FXOV5AomY0p2XycTexxUJAJ0VezQmLTh1Fi5b5u+bYH8XCPimGuj2FAYL3XwYgiYy3I1iUNYGOW+PMkatjRg6LU80tccCMcqJG+8vw1JG1WLfQsW1N+SLEAfjlMCvgqbhB15vaer3sBRwfq8Ec3d955akL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786166777; c=relaxed/simple;
	bh=Kxzw5bU8FsIoQ8EGPpSBOHbfUyUz0oNGd9OzzGmyjEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGY4FF1lxIdhJxpBzW3AM4UHN6/wNqr3cJbLL56mtxuD+A8wJ4fkCYjhrI8MQT6b878hPCZOI+s1k/O4zxGGzLiwC0VnlJ+MRyOQr2yDjQkkm0+4bSwgxjCNL253hXt92NI+CJf9KgcWxW0OFJ/3XqMF/9fszx9FHUd0w+Vmu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDf9zAPZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDf9zAPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02931F000E9;
	Sat,  8 Aug 2026 05:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786166775;
	bh=zDNr+26WcfCRvimIn5S9163V8hw+GPiCKLtNpsnjYSc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=nDf9zAPZAWYiaGkZbyokV//liAnVW+I3p/ktAznCuoCd7Va1niXD0vs4RvCji4cm0
	 HwJ+ikkltBlojPrY+3s17HtRHo7kP/2IhVkIvJJludQqcKuHysjILEkDzWBLqDZZGp
	 z9yRzLMy6bP+YzC5a/yoJlw9zAx38MDNGPW+IrSapzDayNgvfHyssAtQa3FJqzpyfg
	 td6lY26yRgDaDCdMLK4yAn5slb6tLUkRGn0uM6TtGFwXmtCKHbB1uCvdKGDoDhI2rp
	 eZl41h14H45Ro3VepKusnMpaE6d45qy9d30nNz4HIJvTUJP7vBnJB2SFn93G0++YnI
	 n6cmdiiONsVQA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9C537CE15E0; Fri,  7 Aug 2026 22:26:15 -0700 (PDT)
Date: Fri, 7 Aug 2026 22:26:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 7183/13846] kernel/hazptr.c:178: Warning:
 missing closing `"'
Message-ID: <314a0d67-7402-4201-8aef-cc46cdb1f1dc@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202608080824.VRQz4FGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608080824.VRQz4FGl-lkp@intel.com>

On Sat, Aug 08, 2026 at 08:58:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6b8c8af514d739d0335f5579b585e02babe8a727
> commit: 9d30872a4c09c2e8a97084ef1fe6913f6bf9e34d [7183/13846] hazptr: Implement Hazard Pointers
> config: s390-randconfig-001-20260808 (https://download.01.org/0day-ci/archive/20260808/202608080824.VRQz4FGl-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080824.VRQz4FGl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608080824.VRQz4FGl-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/hazptr.c: Assembler messages:
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
> >> kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:178: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
>    kernel/hazptr.c:183: Warning: missing closing `"'
> 
> 
> vim +178 kernel/hazptr.c
> 
>    154	
>    155	/*
>    156	 * hazptr_synchronize: Wait until @addr is released from all slots.
>    157	 *
>    158	 * Wait to observe that each slot contains a value that differs from
>    159	 * @addr before returning.
>    160	 * Should be called from preemptible context.
>    161	 */
>    162	void hazptr_synchronize(void *addr)
>    163	{
>    164		int cpu;
>    165	
>    166		/*
>    167		 * Busy-wait should only be done from preemptible context.
>    168		 */
>    169		lockdep_assert_preemption_enabled();
>    170	
>    171		/*
>    172		 * Store A precedes hazptr_scan(): it unpublishes addr (sets it to
>    173		 * NULL or to a different value), and thus hides it from hazard
>    174		 * pointer readers.
>    175		 */
>    176		if (!addr)
>    177			return;
>  > 178		/* Memory ordering: Store A before Load B. */

Is this perhaps a typo in s390 smp_mb() or similar?  I freely confess
that I am having trouble seeing how the above comment causes trouble.

						Thanx, Paul

>    179		smp_mb();
>    180		/* Scan all CPUs slots. */
>    181		for_each_possible_cpu(cpu) {
>    182			struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
>    183			unsigned int scan_idx;
>    184	
>    185			/* Scan CPU slots. */
>    186			hazptr_synchronize_cpu_slots(cpu, addr);
>    187	
>    188			/*
>    189			 * Scan backup slots in percpu overflow lists.
>    190			 * Forward progress is guaranteed by scanning one list
>    191			 * while new elements are added into the other list.
>    192			 */
>    193			guard(mutex)(&overflow_list_flip->lock);
>    194			scan_idx = overflow_list_flip->add_idx ^ 1;
>    195			hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx], addr);
>    196			/* Flip current list. */
>    197			WRITE_ONCE(overflow_list_flip->add_idx, scan_idx);
>    198			hazptr_synchronize_overflow_list(&overflow_list_flip->array[scan_idx ^ 1], addr);
>    199		}
>    200	}
>    201	EXPORT_SYMBOL_GPL(hazptr_synchronize);
>    202	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
