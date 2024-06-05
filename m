Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB416F9CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717611814; cv=none; b=sy3Vh7NMDe8ECmvUHUzu7F2tt6sR3OYQS5FcxM5IIgnldZlNR/XjagV7FS8iOKi8quVaA3IR+7AdCtnwPu9psDz9ZSK768+s+1qNqDDVl8x75pnimOa1EQJQVg9dXaro5Mjh/+siFFd5frzY37M1oH63Kefmc/gPh92DCxL9T3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717611814; c=relaxed/simple;
	bh=TjMRzsDboSXRcn+FRC00kuMwIbSFxrAct4OYW2cgP2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmvXtllL6Jnw5XRoQXiJMTBwzLjJlbdHEW4JRzikfjh4Xn9G4vv+WWpxdfgEnrcxD7Oa+9T71gNWmX0oU+TYXisFXF4/b4M00n8XgaVwXZoIw9TeW6c1wMb8+q2HMF6sBf9JeHAqCJZcIMZE74YJzzaWlBsjg99JkFveRudzKRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyPA7M+D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyPA7M+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717611813; x=1749147813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TjMRzsDboSXRcn+FRC00kuMwIbSFxrAct4OYW2cgP2E=;
  b=RyPA7M+DJM41VHg2dX0HrKDXm29X2sgR00ABslUkTexxFO+88cLo6Q79
   ImVzeCiG3TDKeOhGPUk3p7Y6uFU+occpw2zdX27zfjzMsyLNBHxFwhFYJ
   z73bLB5LYuRa/sSCFDvngVJeWjMXSvTE6CuMC9sqoISB4dmTsfRAErxfh
   XFM+kd6Ibm/6BMCjM8l65Kt0sKt7omXKtHXQJmaFXLnLceq0RlWKqRwME
   AEsxUrfkth+4GAgJ0aHYXUsh/OJw5mrYwpH2opyiJEYB/xdwQTCob/gQP
   QLokNzhPY1gs77pJJL2IM2Z0U9D+lkvsSli7uEeMDCNghBNbEPYX8vQLh
   g==;
X-CSE-ConnectionGUID: j9mmvtCuQ3WBN+NZt/KIBQ==
X-CSE-MsgGUID: VNtzBP2KR22BfTWuxncTBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14379151"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14379151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 11:23:31 -0700
X-CSE-ConnectionGUID: SKCBMv+0RyCRZ7ZsxCRXwA==
X-CSE-MsgGUID: iYPPBItXRxiv5NaI+xRBXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37567938"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2024 11:23:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEvIG-00023M-03;
	Wed, 05 Jun 2024 18:23:28 +0000
Date: Thu, 6 Jun 2024 02:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 30/30] lib/stacktrace_kunit.c:87:20: error:
 implicit declaration of function 'stack_trace_save_regs'
Message-ID: <202406060255.ochb1ss1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   b355c7c11a4a1cec3478bc7a2f129638d9b5116d
commit: b355c7c11a4a1cec3478bc7a2f129638d9b5116d [30/30] WIP: lib: add more stacktracing tests
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406060255.ochb1ss1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060255.ochb1ss1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060255.ochb1ss1-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/stacktrace_kunit.c: In function 'std_save_stacktrace':
   lib/stacktrace_kunit.c:69:20: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_tracer_enable'? [-Werror=implicit-function-declaration]
      69 |         std->len = stack_trace_save(std->stack_trace,
         |                    ^~~~~~~~~~~~~~~~
         |                    stack_tracer_enable
   lib/stacktrace_kunit.c: In function 'std_save_stacktrace_regs':
>> lib/stacktrace_kunit.c:87:20: error: implicit declaration of function 'stack_trace_save_regs' [-Werror=implicit-function-declaration]
      87 |         std->len = stack_trace_save_regs(regs,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/stack_trace_save_regs +87 lib/stacktrace_kunit.c

    82	
    83	static __maybe_unused void
    84	std_save_stacktrace_regs(struct stacktrace_test_data *std,
    85				 struct pt_regs *regs)
    86	{
  > 87		std->len = stack_trace_save_regs(regs,
    88						 std->stack_trace,
    89						 NR_STACKTRACE_ELEMS,
    90						 0);
    91		std->hit = true;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
