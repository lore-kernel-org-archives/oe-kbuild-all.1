Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA0D41A4F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225202; cv=none; b=LaPLiEESDJFiqF3tohHFFn4ur85qIqh8x9olYTzfBTpZ+txh4FSXXb4pZ6dv442zCB4kC6Onl9kentfpjho31yHAjvZ5tDOdych74GtK1QB44XpLLn6TotVABj+Rcu6zZv/n7uvtuBanLJ5ztmhc3otCiDp67hp8sRcZy9HEF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225202; c=relaxed/simple;
	bh=Yt7UVE5W62LcQI1dEzU6gH2ERHR8B3qY+szYyRafa/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gL8iCxwh5y95sYvWvMS6EnGNwNQfXKpeKzyuf8RZufHbox7xYGesVyougHX66W6dHednHTxiAAXnBIByaA5EJ84DJ0YyFyo8AerZTf4A0Qdxku4OQ3TmAI+dXQSwKM5mSUOFK2y3RkedcUffgTtbCrw5gLDmRy1NcNdS+5NuG9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWo41K1T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWo41K1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787225200; x=1818761200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yt7UVE5W62LcQI1dEzU6gH2ERHR8B3qY+szYyRafa/Y=;
  b=aWo41K1TvxDNP5wUn1bCD7/z3Ys9AhDaZcBtDK1X8L9Bx06ebNGXyvye
   pN4f1dfJBXa2xCKCnxszh5+J+DXpyFrlvHf0pul5A4Q+GBafW4FDnu1ev
   wd6kcfhaUx1bkcgz3uanVndHA+PrZozyVxoGak/2PQWL43V0Ho+dECGN7
   jDp+Bzq3jsmzBBPv1JMisoygywBbnuKfveOZ6AnjUFiC+dZ2KzWs9QUj2
   +tplB3vAtdQQ499ZWDE4fI3605fYEmyRmuF6qk80gUmQfBT+PHDdMV1rx
   J9WB/7k3xw+7l/pccEFqVljJQ9a7bH74YqYDwnfiWXsKzw5oD7bfSl1kX
   A==;
X-CSE-ConnectionGUID: RqKc6SLDTL+7/J9UqwHAoA==
X-CSE-MsgGUID: 0zSg/5ypTYyQEm0ncH+fxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="75289078"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="75289078"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 04:26:40 -0700
X-CSE-ConnectionGUID: E3cF2FKwTXqTXYwjmH0GAg==
X-CSE-MsgGUID: oOcCykvBRJeT9XYlAZsInw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="270226536"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2026 04:26:37 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx0up-00000000iof-08nA;
	Thu, 20 Aug 2026 11:26:35 +0000
Date: Thu, 20 Aug 2026 19:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Yiqi Sun <sunyiqixm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <202608201957.jszjEpsE-lkp@intel.com>
References: <20260714143600.23853-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714143600.23853-1-will@kernel.org>

Hi Will,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721]

url:    https://github.com/intel-lab-lkp/linux/commits/Will-Deacon/arm64-syscall-Ensure-saved-x0-is-kept-in-sync-with-tracer-updates/20260815-220235
base:   https://github.com/intel-lab-lkp/linux Yiqi-Sun/arm64-ptrace-use-live-x0-for-seccomp-and-audit-after-ptrace/20260815-210721
patch link:    https://lore.kernel.org/r/20260714143600.23853-1-will%40kernel.org
patch subject: [PATCH] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
config: arm64-randconfig-001 (https://download.01.org/0day-ci/archive/20260820/202608201957.jszjEpsE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201957.jszjEpsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201957.jszjEpsE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ptrace.c:2461:13: error: conflicting types for 'update_syscall_orig_x0_after_ptrace'; have 'void(struct pt_regs *)'
    2461 | static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/ptrace.c:563:13: note: previous definition of 'update_syscall_orig_x0_after_ptrace' with type 'void(struct task_struct *)'
     563 | static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2461 arch/arm64/kernel/ptrace.c

  2460	
> 2461	static void update_syscall_orig_x0_after_ptrace(struct pt_regs *regs)
  2462	{
  2463		/*
  2464		 * Keep orig_x0 authoritative so that seccomp (via
  2465		 * syscall_get_arguments()), audit and the restart path all see the same
  2466		 * first argument the syscall is dispatched with, even if it has been
  2467		 * updated by a tracer. Skip this for NO_SYSCALL (set either by the user
  2468		 * or the tracer), as regs[0] holds the return value (see the comment in
  2469		 * el0_svc_common()) and can be unwound using syscall_rollback().
  2470		 * For compat tasks, orig_r0 is provided directly through GPR index 17.
  2471		 */
  2472		if (!is_compat_task() && regs->syscallno != NO_SYSCALL)
  2473			regs->orig_x0 = regs->regs[0];
  2474	}
  2475	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
