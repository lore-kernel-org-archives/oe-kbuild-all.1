Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED30A31
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 03:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736219026; cv=none; b=oSMGhsAkxh34hcROF6g7RopwxSEBAjLD9dfVOQ5MUOpQg6w++rGUzB/Dcz81IU2LYMgvxWgcVQKMLQO05/Ywp4OLM8bsP0w5aoaLjUp5Oxh7DHvwrXx0ZSgXY81RrTpkXo886VCkYG4P0lmkj9OAhWJROjznM90jVQDJ49lOPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736219026; c=relaxed/simple;
	bh=ShYO/bs4CCmVvvBvvR9JZ8pZQYYfRFaDqdyIinikFa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DcRpS1mgfEzPeRNV9m0nqVMrA2c5PsPLB6PVW43RLfAIlc96/r5EKhkSsNryAva2343mLk8IP8Z/puwQxozFvJupgWhJjhmqZiKLQ2+3yzY9MsqZnXmu1p9Ssg8h2Yf+MvF6tbdlVgW7b3JvqnBDSCr7Ac30q0HKWLcnw4hY5qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tu6ahsmx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tu6ahsmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736219023; x=1767755023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShYO/bs4CCmVvvBvvR9JZ8pZQYYfRFaDqdyIinikFa4=;
  b=Tu6ahsmxId+CBXZteOweYNqQpKbhhspii7yTFfvUu6Obak7VYVHROioi
   sl+TquBCEfVeSCY7BVdAoSCpKwdutK6xfeqFovU1/JxYs84G9fo0xzAul
   Lp2h+hBMiKhuvs+zp0rsKMXMKFbOdWdlUrD2WoS8QR8hfoCI+1LkPiFqP
   zPC6eXX5/58mhL0J1bGQwq6xh3ebO7FtvhgWPHM9LomXsj8F/CEcaHKIY
   fItn34uS6oDkZQXBXANZez/JI2HKgetIQp1ODKfbZMACBeX3zaOnsdA2R
   nWXdaIRsbqjvgMoYChsv2e+CNCn60+8DPGkK9R0yC9ye7sVfGSlXmQMMD
   w==;
X-CSE-ConnectionGUID: lDcsvdoDShS/qldh0ysJnA==
X-CSE-MsgGUID: zZLTfuJLSmu/gnhxjGgULA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35683834"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35683834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 19:03:42 -0800
X-CSE-ConnectionGUID: ELC5ACxiRXWdpW4W4cPv9w==
X-CSE-MsgGUID: +9hV6rEJTaaJo/i19iYBng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103486479"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jan 2025 19:03:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUzsY-000E9r-1g;
	Tue, 07 Jan 2025 03:03:38 +0000
Date: Tue, 7 Jan 2025 11:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347]
 arch/arm64/kernel/stacktrace.c:161:13: sparse: sparse: symbol
 'walk_stackframe_reliable' was not declared. Should it be static?
Message-ID: <202501071022.24eO1upO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: f6c94c34964ebf155b3188788a086805d33bcbf3 [1347/1347] bytedance: arm64: introduce reliable stacktraces
config: arm64-randconfig-r133-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071022.24eO1upO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250107/202501071022.24eO1upO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071022.24eO1upO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/stacktrace.c:161:13: sparse: sparse: symbol 'walk_stackframe_reliable' was not declared. Should it be static?

vim +/walk_stackframe_reliable +161 arch/arm64/kernel/stacktrace.c

   160	
 > 161	int notrace walk_stackframe_reliable(struct task_struct *tsk, struct stackframe *frame,
   162				bool (*fn)(void *, unsigned long), void *data)
   163	{
   164		int ret = 0;
   165	
   166		if (!tsk)
   167			tsk = current;
   168	
   169		do {
   170			/* Final frame for kthread; nothing to unwind */
   171			if ((frame->fp == (unsigned long)task_pt_regs(tsk)->stackframe)
   172				&& ptrauth_strip_insn_pac(frame->pc) == (unsigned long)&kthread_return_to_user)
   173				return 0;
   174	
   175			if (!unwind_state_is_reliable(frame))
   176				return -EINVAL;
   177	
   178			ret = fn(data, ptrauth_strip_insn_pac(frame->pc));
   179			if (!ret)
   180				return ret;
   181	
   182			ret = unwind_frame(tsk, frame);
   183			if (ret < 0)
   184				break;
   185		} while (1);
   186	
   187		if (ret == -ENOENT)
   188			ret = 0;
   189	
   190		return ret;
   191	}
   192	NOKPROBE_SYMBOL(walk_stackframe_reliable);
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
