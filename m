Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49126E555
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 16:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771950049; cv=none; b=TVL6pQQ1ElK7vCEAScwbgeny4PfhU7owKoz64+7fDm22JTKJSLTW+gkj36xj9Gi3M+fqTACPQqtcu/bEJQA+5MQW8YolXE4TKAZaOmZcn5J+PRo7hwGly81sb0p9ra7GyWIraFDCPWcd4xsXpU8zTBY2opsi3rCrc3TID2qH2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771950049; c=relaxed/simple;
	bh=IUxFzckIDRpejZhrhw9exGvgpVnn/udf2KCPYVtB1yI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mkPwLVtaJmLnLoL28+yOtaVT/4m50BUcFyM8AEK171sa+a2rsjbjeD3r5wOkkGMji1IuXV8GknpxfBBd4dvyKPBUrJNvRR8HRoBHbCJ/E/TBsux+LDBAmQJzXKqsRReA41zdRp11B/6McYkGbOzJ23KC2TP2Qwkb+XINtILYp5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6pdefpi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6pdefpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771950048; x=1803486048;
  h=date:from:to:cc:subject:message-id;
  bh=IUxFzckIDRpejZhrhw9exGvgpVnn/udf2KCPYVtB1yI=;
  b=I6pdefpiYgD+A8EVzGJ+xCrhOhd+19nzCaJJuy86DYKWX7BDm2jmDMyt
   3OFe0vjE1QSOJ22WfBw7BqTj1jK9CnIR+CIjCuCO/+avKnUIBfCEwn2S7
   1GxbAXx/tvItNhJwq+KyYz8r0lQnXLLNBd3DYVaRtJAYNHAvEFyRJtqyl
   u/qy7zHYZwBD0Q7VmIV4yHwWxuRGXbE3lBSLzpjK8vAyQH2kjRHXrBfnG
   FQUQfy9oZakWzSFEUk/xHhe6nkyxitSR+8P+HrbIlQRGEakJrbhRU3GEP
   Ft2E1+VrGWHiOqgoVlyskVtuVUZdoIHCW8Mg7mRAM+1zyMOSZOhlfvFYj
   A==;
X-CSE-ConnectionGUID: WjemorM6QLC0q5dF3KBmng==
X-CSE-MsgGUID: L1nu1nZxQt+JQGGjx/ZczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84429185"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="84429185"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 08:20:48 -0800
X-CSE-ConnectionGUID: I63bzrzGTPiVG1rMkU8Z7A==
X-CSE-MsgGUID: Xayyjc2FT+C5H//gEmQNCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="253702737"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2026 08:20:47 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuv9Q-000000005Lp-1BqG;
	Tue, 24 Feb 2026 16:20:44 +0000
Date: Tue, 24 Feb 2026 17:20:31 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-APX-ANBZ29353 30/30]
 syscall_arg_fault.c:20:13: error: redefinition of 'sethandler'
Message-ID: <202602241707.lqx1UG85-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-APX-ANBZ29353
head:   d8e6957edead90297a4f8cb1f247c54e559dbf8c
commit: aff105721ff72a3d39380c97c8a872d642d41acc [30/30] selftests/x86: remove (or use) unused variables and functions
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260224/202602241707.lqx1UG85-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241707.lqx1UG85-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241707.lqx1UG85-lkp@intel.com/

All errors (new ones prefixed by >>):

>> syscall_arg_fault.c:20:13: error: redefinition of 'sethandler'
      20 | static void sethandler(int sig, void (*handler)(int, siginfo_t *, void *),
         |             ^~~~~~~~~~
   In file included from syscall_arg_fault.c:18:
   helpers.h:30:20: note: previous definition of 'sethandler' with type 'void(int,  void (*)(int,  siginfo_t *, void *), int)'
      30 | static inline void sethandler(int sig, void (*handler)(int, siginfo_t *, void *), int flags)
         |                    ^~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
