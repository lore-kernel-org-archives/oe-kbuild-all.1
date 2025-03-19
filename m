Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB8210F4D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742360834; cv=none; b=ZsXSGh2lFRDWan+W2yMWBqMg7RSCj6mY4YCBftdlWu5h+CBrX/bs6qINaxkAORVnejKxeHwdtmz7f51IA5hUGEnJU7HDSLJzeL0D4AhTSPYraD/0nIOMpvX3VV8g/FMXKCQNow8YBuuCagw/tdMuUeTAv3+I7nj27L2f444MyQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742360834; c=relaxed/simple;
	bh=/pKlRpzrFMOJFvWEfkuVM7VOXk4tiC90+0XLUButK0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rc03uX47s/ZJ2eAWKuVqIdSIqwBLlNZaLBcFWx4AdgPQz6mdLH6A8a69EuvuIfcmGb4e3A3BWV1FMXBFAMDw5yfXGUqMw20U460QmSPemG3RNpXPxcknoJSk0fW+fvHT02m8m5pWTVIRveUgZava2yjB+iIu4qeEQpyXxuRK5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuPBTLm2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuPBTLm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742360833; x=1773896833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/pKlRpzrFMOJFvWEfkuVM7VOXk4tiC90+0XLUButK0g=;
  b=EuPBTLm2KbUB/tf2zlF9R1K1Skc2tq/Wk3LvuvTE+OCmviCrzWHWl4cy
   Q9OoTK3Y8HzaW07N2SJ7QPUY0TieTKEmNRPJnN/6z/URaysCL5oVAkoGi
   TEcaJSPtjQN3Wj4t+O6VxW+fQEMZT8FJLAg1vA4ngzuU5kHJjlua5zxN0
   Yp6lzig2brob7cywtIkycQedPXK4qkJJotvN2UF4EH7fR77A4eKlxUVnV
   AbSWwf/JoZBWtE0Dzpmg5kuXjr5MbRIhM6UOt+s+2QhBZT9BguM06VKzF
   TogLSaA4+h8+T9GhSpvAmWuXzVj1AqRLOhro7ylf8VQ3Ug5Gp5KRGgnum
   g==;
X-CSE-ConnectionGUID: HQlSoXllTPmZO+m/oAWLvA==
X-CSE-MsgGUID: MuyQoqGESVy9BpIL8ZvmhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54165553"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="54165553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 22:07:11 -0700
X-CSE-ConnectionGUID: B6fQhWDmQPyhLOh7tmtBNA==
X-CSE-MsgGUID: +vD10cAgRBOBeqZgl7ds8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="159614974"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2025 22:07:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuldy-000ENC-2i;
	Wed, 19 Mar 2025 05:07:06 +0000
Date: Wed, 19 Mar 2025 13:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: arch/arm64/kernel/entry-ftrace.S:333: Error: undefined symbol
 FREGS_SIZE used as an immediate value
Message-ID: <202503191223.RCdQEebt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81e4f8d68c66da301bb881862735bd74c6241a19
commit: a3ed4157b7d89800a0008de0c9e46a438a5c3745 fgraph: Replace fgraph_ret_regs with ftrace_regs
date:   3 months ago
config: arm64-randconfig-003-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191223.RCdQEebt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191223.RCdQEebt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191223.RCdQEebt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry-ftrace.S: Assembler messages:
>> arch/arm64/kernel/entry-ftrace.S:333: Error: undefined symbol FREGS_SIZE used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:336: Error: undefined symbol FREGS_X0 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:337: Error: undefined symbol FREGS_X2 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:338: Error: undefined symbol FREGS_X4 used as an immediate value
>> arch/arm64/kernel/entry-ftrace.S:339: Error: undefined symbol FREGS_X6 used as an immediate value
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
 > 336		stp	x0, x1, [sp, #FREGS_X0]
 > 337		stp	x2, x3, [sp, #FREGS_X2]
 > 338		stp	x4, x5, [sp, #FREGS_X4]
 > 339		stp	x6, x7, [sp, #FREGS_X6]
   340	
   341		/* Save the callsite's FP */
 > 342		str	x29, [sp, #FREGS_FP]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
