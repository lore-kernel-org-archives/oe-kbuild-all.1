Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC54367B73
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jul 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643950; cv=none; b=BHKm85IftxxhwNZctz+EsGYmWMXIRJwl7LomijL/jUXMUj27zLa5X4nFSLvCBC7cBPLeX41t8S/he6qmOOppEcJPyT1v/47gKX8UvvTJaGh+1Xdo7mKEmZ2lueRXcCjS5d6xpXxlm9HG5mWLH6vWRvnSqNDjzdVVqPqi0L963rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643950; c=relaxed/simple;
	bh=vxRYpq/L1zFHPsYuw5D4lN62fiqdZIvwG8Y4QEy0VAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I7tzzhh4wsDc6ipG17sjBzN9wsYw2Trimnf70UIgbOJAVpZ4gJfrPSwX5SbPf+VT0NhYvyjEfXHo2KQZJ33qjqDO4BQHLJ1YSjWcBxhB61fcpLYkIgys9Q1kGAxsUYhbXBbAiyfWFon8UieZvJPPjMiK/3wYuCdH1ZNrG/68h2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Utm2TiqY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Utm2TiqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784643948; x=1816179948;
  h=date:from:to:cc:subject:message-id;
  bh=vxRYpq/L1zFHPsYuw5D4lN62fiqdZIvwG8Y4QEy0VAc=;
  b=Utm2TiqYm0Su3pKuv9QixxDDM3Dmw9ZlAAfT4ZgPEQSUymf2c7a8l3Jd
   bBgWUZfWeDRLE0KeE5l61a1fiCpORZGtH5zQtKUQj6Z7NLylQnm+Oj38N
   PUI8JqmCG9j25xqJji8xK5F5HjgygFdiUv+uuACKxKfbYkHNQU3KHwa41
   jOa48OapNVepsOXChyjL9SvOZOyO9P8siUg+3wAtPYpZGokGLqQrllJ1C
   X5/dS9A0lYQ4Ikm75nKZKhGsuTqeCjhTKtWX5oyuu9dFk0OAVhdCBwrDo
   hZnDNUYNtXCMICzpP0Z4lJTsFHvxWiCw29K8ruLJJr7guQJb2KlxMj9YF
   A==;
X-CSE-ConnectionGUID: SE2c2MKuQAaheltTJSrSag==
X-CSE-MsgGUID: LZuRCpSpS9SJKtVWWrtHjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85365257"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="85365257"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 07:25:47 -0700
X-CSE-ConnectionGUID: OgMa3bW+R++obNURHreOIQ==
X-CSE-MsgGUID: 9n88d062RtSaH1mQ6pa8zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="255134951"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2026 07:25:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmBPh-00000000Xd1-3QwM;
	Tue, 21 Jul 2026 14:25:42 +0000
Date: Tue, 21 Jul 2026 22:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 2/2]
 arch/arm64/kernel/entry-ftrace.S:333: Error: undefined symbol FREGS_SIZE used
 as an immediate value
Message-ID: <202607212154.SKdk3AjW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Masami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   1dbcf5c668550914a289415ca7562fea3883e034
commit: 33d4e904e24d14ff0fbc528b657ddc7c7b636e6a [2/2] fgraph: Replace fgraph_ret_regs with ftrace_regs
config: arm64-randconfig-003-20260721 (https://download.01.org/0day-ci/archive/20260721/202607212154.SKdk3AjW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260721/202607212154.SKdk3AjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607212154.SKdk3AjW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry-ftrace.S: Assembler messages:
>> arch/arm64/kernel/entry-ftrace.S:333: Error: undefined symbol FREGS_SIZE used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:336: Error: undefined symbol FREGS_X0 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:337: Error: undefined symbol FREGS_X2 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:338: Error: undefined symbol FREGS_X4 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:339: Error: undefined symbol FREGS_X6 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:342: Error: undefined symbol FREGS_FP used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:349: Error: undefined symbol FREGS_X0 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:350: Error: undefined symbol FREGS_X2 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:351: Error: undefined symbol FREGS_X4 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:352: Error: undefined symbol FREGS_X6 used as an immediate value
   arch/arm64/kernel/entry-ftrace.S:353: Error: undefined symbol FREGS_SIZE used as an immediate value


vim +333 arch/arm64/kernel/entry-ftrace.S

   324	
   325	/*
   326	 * void return_to_handler(void)
   327	 *
   328	 * Run ftrace_return_to_handler() before going back to parent.
   329	 * @fp is checked against the value passed by ftrace_graph_caller().
   330	 */
   331	SYM_CODE_START(return_to_handler)
   332		/* Make room for ftrace_regs */
 > 333		sub	sp, sp, #FREGS_SIZE
   334	
   335		/* Save return value regs */
   336		stp	x0, x1, [sp, #FREGS_X0]
 > 337		stp	x2, x3, [sp, #FREGS_X2]
 > 338		stp	x4, x5, [sp, #FREGS_X4]
   339		stp	x6, x7, [sp, #FREGS_X6]
   340	
   341		/* Save the callsite's FP */
 > 342		str	x29, [sp, #FREGS_FP]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
