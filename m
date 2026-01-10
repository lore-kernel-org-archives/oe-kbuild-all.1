Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE9F23D2A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 02:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768013196; cv=none; b=NrGj2+aAxIx7TamqZzYht8h7PAtxOSOd7vSvlDnulJwOfd+xDC69rmrf+oR9ccsr9vtyN7xGf4Tzu7BKdbXU1kYND3hEWYvhgQdXXloxIdxFRz8vIF8GCD4fSbN62yIl35Os5pv2h4aXmuNsr7tD2pSTNApO9MzlYeb3LNJw4yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768013196; c=relaxed/simple;
	bh=HRwVbKCeOqAHY869iBl6z8pewnjr2QH1eSHSoUK2mv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTgUHWm25qJAjTSRu9ko0o0EnyV+v4Ike7AtLA3Z7tLesb/JGTYBPLUjlQOhuQTgQTdzMrZZAStHhTPw/28NHjSVS/gu77rjk+t0pUtG3jm7cc8MZDYDKsOQej6Pk7td054ISoVkCN/rwuOVtXwfNMfRDLe7zeQie/foZLeeCc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avxt96Ds; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avxt96Ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768013194; x=1799549194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HRwVbKCeOqAHY869iBl6z8pewnjr2QH1eSHSoUK2mv8=;
  b=avxt96Ds/VJaGV/kazqE3ZbJvYaIAZsBBGZKAukWyVfURgs6j2zNbDCL
   jBedTOCK0lqFnC/NvSe+/2yDjlrDKFA2dT22E/jm+Re/l2sEEpI8UUq6d
   i9TnL9lCOFSZ2b4Eq6Lih/JkSyYYI873cH6C6P7bQWNVRVdRP9X/s8je1
   syF+F4aWu1KSwVOhqbkSDoMKo6Yk9l91t/cMW6+OL/KPvsb+yMP+rn8tM
   j7dgkJSMlgL5gx0b+db4yMBk3z2APj6PY6x43HCv6rBRNoa+ej0kR2Ld3
   tOtMarpGsU8Z/WVX8TE6ATzrQt18hN5DDzEF4N1o7QWRPeOjeqgAE+/7J
   g==;
X-CSE-ConnectionGUID: Hp29hOyzRtilCzw8Bsn7HA==
X-CSE-MsgGUID: SNSLrOldR3ydV5fqwsfrRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69304394"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69304394"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 18:46:33 -0800
X-CSE-ConnectionGUID: V+A+p+pERlKvrZDmGvKvgA==
X-CSE-MsgGUID: 77fBKwUMSHK2zv91GAyVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="208143701"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Jan 2026 18:46:30 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veOzj-000000002Ce-1eS3;
	Sat, 10 Jan 2026 02:46:27 +0000
Date: Sat, 10 Jan 2026 03:45:30 +0100
From: kernel test robot <lkp@intel.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	"Xin Li (Intel)" <xin@zytor.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] x86_64/bug: Handle __WARN_printf() trap in
 early_fixup_exception()
Message-ID: <202601100329.ndS6mKRm-lkp@intel.com>
References: <97dd5c5b5e92d48ffbc95fb1357dfbbbf0d12a1e.1767960698.git.houwenlong.hwl@antgroup.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97dd5c5b5e92d48ffbc95fb1357dfbbbf0d12a1e.1767960698.git.houwenlong.hwl@antgroup.com>

Hi Hou,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Wenlong/x86_64-bug-Handle-__WARN_printf-trap-in-early_fixup_exception/20260109-204012
base:   linus/master
patch link:    https://lore.kernel.org/r/97dd5c5b5e92d48ffbc95fb1357dfbbbf0d12a1e.1767960698.git.houwenlong.hwl%40antgroup.com
patch subject: [PATCH] x86_64/bug: Handle __WARN_printf() trap in early_fixup_exception()
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260110/202601100329.ndS6mKRm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100329.ndS6mKRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100329.ndS6mKRm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/extable.c:414:7: error: call to undeclared function 'handle_bug'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     414 |                 if (handle_bug(regs))
         |                     ^
   1 error generated.


vim +/handle_bug +414 arch/x86/mm/extable.c

   376	
   377	/* Restricted version used during very early boot */
   378	void __init early_fixup_exception(struct pt_regs *regs, int trapnr)
   379	{
   380		/* Ignore early NMIs. */
   381		if (trapnr == X86_TRAP_NMI)
   382			return;
   383	
   384		if (early_recursion_flag > 2)
   385			goto halt_loop;
   386	
   387		/*
   388		 * Old CPUs leave the high bits of CS on the stack
   389		 * undefined.  I'm not sure which CPUs do this, but at least
   390		 * the 486 DX works this way.
   391		 * Xen pv domains are not using the default __KERNEL_CS.
   392		 */
   393		if (!xen_pv_domain() && regs->cs != __KERNEL_CS)
   394			goto fail;
   395	
   396		/*
   397		 * The full exception fixup machinery is available as soon as
   398		 * the early IDT is loaded.  This means that it is the
   399		 * responsibility of extable users to either function correctly
   400		 * when handlers are invoked early or to simply avoid causing
   401		 * exceptions before they're ready to handle them.
   402		 *
   403		 * This is better than filtering which handlers can be used,
   404		 * because refusing to call a handler here is guaranteed to
   405		 * result in a hard-to-debug panic.
   406		 *
   407		 * Keep in mind that not all vectors actually get here.  Early
   408		 * page faults, for example, are special.
   409		 */
   410		if (fixup_exception(regs, trapnr, regs->orig_ax, 0))
   411			return;
   412	
   413		if (trapnr == X86_TRAP_UD) {
 > 414			if (handle_bug(regs))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
