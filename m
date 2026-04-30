Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B533914F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538347; cv=none; b=k+AvAdCdlXODBeAAyH12GvVMVvY9bnghEbarXFyvnmyxZcu+hDFwx2odok460gQT5aWq10UaaG0Qv5deql9VyN7j5Yxq+Fyfkp/9YyL7xNuP70884rlqTfRNgvDfN2cAsmBswNZ5nIE5oH6aYPz+JHQHug6Fc2A8H23dilRMmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538347; c=relaxed/simple;
	bh=601IpG6Beb8dB1WKchnnn6xURi3DKX9Amky8Yc4xBWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sdkjKywBGgnFvcqZzNcrFX/gOp34zT84wIcJv4QJ9Zk+eGO7J/mU3vYK4jMrko0oFJZGo7HJoolCnaEuxEye7AmLY8UY8rackIFjgwlgeA1FJk6a8wRzJ8wgy44imd1yycgsyJshZo9C4jPQXW1dPXGz9JrqqObDpO+ioRzM5Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9s47G28; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9s47G28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777538346; x=1809074346;
  h=date:from:to:cc:subject:message-id;
  bh=601IpG6Beb8dB1WKchnnn6xURi3DKX9Amky8Yc4xBWg=;
  b=S9s47G28dJI/OFlPlMIvKT2XrvJl8w80ExyrNnhuhvj/9tSGf/7Gi12A
   I4MEBdmdoNdEW8xvRrckqSMRraDyxAEEtqjf8m1MwsDj36DiE8vq8RQOA
   ck5j5aw+uI0tBpKVDOb2tz6SgHUAlHZYSKem7wyGLWKvvGTFOCD68mE/1
   vw0t7YevhvoUMp99IkFIWvEi80G6+wK0q9GqfgC/XmZUszV0rhaj8WT2Y
   n+WWIqRxzVB4h7V/d+myN9j9SXEVaGP7qCK/qOxdJNNe13VuOlUbassbu
   lLddIIwk9d98z+PiFZiBMie1FOOW2csE0c09lBjVfr0C2JTBgLe/LBXby
   w==;
X-CSE-ConnectionGUID: MRtBRR5ATJG2w3TAQUH2UQ==
X-CSE-MsgGUID: KVoJfymuTKylUZS1RZy+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82346679"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="82346679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 01:39:06 -0700
X-CSE-ConnectionGUID: xMvjQGMGR3GzjNjbA8qfmw==
X-CSE-MsgGUID: bYqXXDdDRfa3wf0PLgTmUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="272633404"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2026 01:39:05 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIMvF-00000000CAa-3maM;
	Thu, 30 Apr 2026 08:39:02 +0000
Date: Thu, 30 Apr 2026 16:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/glink 35/56] arch/hexagon/kernel/setup.c:33:1:
 sparse: sparse: symbol '__pcpu_scope_vpid' was not declared. Should it be
 static?
Message-ID: <202604301641.Y6fjyPJh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   5d897d0f6b0bbd170ef332eeae9a8329ec812a5e
commit: a7630c56e8ec408f28401233a9a9adc86d05100a [35/56] hexagon: support bootloader-provided device tree
config: hexagon-randconfig-r121-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301641.Y6fjyPJh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301641.Y6fjyPJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301641.Y6fjyPJh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/kernel/setup.c: note: in included file (through arch/hexagon/include/asm/processor.h, arch/hexagon/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/kernel/setup.c:33:1: sparse: sparse: symbol '__pcpu_scope_vpid' was not declared. Should it be static?
   arch/hexagon/kernel/setup.c:38:5: sparse: sparse: symbol 'boot_dtb_phys' was not declared. Should it be static?

vim +/__pcpu_scope_vpid +33 arch/hexagon/kernel/setup.c

9e31100842e0ddc Brian Cain 2026-01-24  29  
9e31100842e0ddc Brian Cain 2026-01-24  30  #ifdef CONFIG_SMP
9e31100842e0ddc Brian Cain 2026-01-24  31  DECLARE_PER_CPU(u32, vpid);
9e31100842e0ddc Brian Cain 2026-01-24  32  #else
9e31100842e0ddc Brian Cain 2026-01-24 @33  DEFINE_PER_CPU(u32, vpid);
9e31100842e0ddc Brian Cain 2026-01-24  34  #endif
9e31100842e0ddc Brian Cain 2026-01-24  35  

:::::: The code at line 33 was first introduced by commit
:::::: 9e31100842e0ddc84215562588aaaf7fe964791a hexagon: update boot and setup code

:::::: TO: Brian Cain <brian.cain@oss.qualcomm.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
