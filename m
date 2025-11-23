Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15321433A6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 22:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763938712; cv=none; b=aXhxNM7x5APm10r2L3RoNwptvi4/Gucy7Cfhw3IMAUQofQpTqRDQ88ZcEsmq8wNX+0HDXDxlPPmg0dxgmNkUiSLIVs6uN9knE4A+AYPSu9zDO/a8PIpW1L7wWbE2h6r7DrMOLPeXZ3YKLYduIUI1B1YTBFPXWZ4BF/sPzcnI5v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763938712; c=relaxed/simple;
	bh=ylbOQ9SV9Xw9158J4OYNpgC3IwLRW7oX2upV6gTEuto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s6uko/0OGhJc2e974Cld1KDMcIw5xy+Bu2JVVFpV2FSn8z4cH5uu+rkd+JRg83CpSuvQ1zFl9UxvdtRjtuo4vdimUtf6B/gfjEkoUVz2C9EyCfw4cBg8y1qMlUUnuwx4Bh1JBMHL/Y+VmkDdYjeBnD8WfC1Fu+9oLkDHFcZAySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hE/pokme; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hE/pokme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763938711; x=1795474711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ylbOQ9SV9Xw9158J4OYNpgC3IwLRW7oX2upV6gTEuto=;
  b=hE/pokme4takhtKWD9bINu/kf8uDzdKyDpOmHai5NN/cQ+OSKP4y/s7k
   bMJjhOjtSHFLcrKPLu/OiH7KGyju8iTProNcXMWYaT5JWf6qbIk0zR/hw
   zFCLew7OLj5jLAH6o1YMUxioq6FHh5nCWjZCsLmiG7yOCdvpLvPwIQZ36
   n8mPZci/Xghs/MrdWhdwPtZjtj+XRAufSIcgwOTbHRz+Gd9yZn6Bd2bvD
   ZjfjH41vsuu0kfagj6tYo1OQS9jhEXQrRCTfDCD0Co2/IaHvYG5rEZhER
   7t7O04E83czUE4j5OIRZg0ouheTcth9oCOJJDYok0RjuhO+GedE9jxsb3
   g==;
X-CSE-ConnectionGUID: B60rym3LSJO6TciA6P2pXw==
X-CSE-MsgGUID: +JXJszJ3SfOPkcCjdbwbFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91424639"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="91424639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 14:58:31 -0800
X-CSE-ConnectionGUID: Kkzf1jXnRL2ZtzWvhM1zew==
X-CSE-MsgGUID: i18EZkiJToKT8NAc8txNrQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Nov 2025 14:58:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNJ2J-000000000DZ-0jYS;
	Sun, 23 Nov 2025 22:58:27 +0000
Date: Mon, 24 Nov 2025 06:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [linux-next:master 2198/11041] arch/loongarch/kernel/switch.S:28:18:
 error: operand must be a symbol with modifier (e.g. %pc_lo12) or an integer
 in the range
Message-ID: <202511240656.0NaPcJs1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: f634f10809ec3d51d9529dfb0f99bc7cec1b5eff [2198/11041] mm/mempolicy: Export memory policy symbols
config: loongarch-randconfig-r051-20251123 (https://download.01.org/0day-ci/archive/20251124/202511240656.0NaPcJs1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511240656.0NaPcJs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511240656.0NaPcJs1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/switch.S:28:18: error: operand must be a symbol with modifier (e.g. %pc_lo12) or an integer in the range [-2048, 2047]
    ld.d $r20, $r5, 3808
                    ^


vim +28 arch/loongarch/kernel/switch.S

803b0fc5c3f2ba Huacai Chen 2022-05-31  12  
803b0fc5c3f2ba Huacai Chen 2022-05-31  13  /*
803b0fc5c3f2ba Huacai Chen 2022-05-31  14   * task_struct *__switch_to(task_struct *prev, task_struct *next,
613d4164f5a503 Huacai Chen 2025-01-25  15   *			    struct thread_info *next_ti, void *sched_ra, void *sched_cfa)
803b0fc5c3f2ba Huacai Chen 2022-05-31  16   */
803b0fc5c3f2ba Huacai Chen 2022-05-31  17  	.align	5
803b0fc5c3f2ba Huacai Chen 2022-05-31  18  SYM_FUNC_START(__switch_to)
803b0fc5c3f2ba Huacai Chen 2022-05-31  19  	csrrd	t1, LOONGARCH_CSR_PRMD
803b0fc5c3f2ba Huacai Chen 2022-05-31  20  	stptr.d	t1, a0, THREAD_CSRPRMD
803b0fc5c3f2ba Huacai Chen 2022-05-31  21  
803b0fc5c3f2ba Huacai Chen 2022-05-31  22  	cpu_save_nonscratch a0
803b0fc5c3f2ba Huacai Chen 2022-05-31  23  	stptr.d	ra, a0, THREAD_REG01
93a4fa622eb061 Qing Zhang  2022-08-06  24  	stptr.d a3, a0, THREAD_SCHED_RA
93a4fa622eb061 Qing Zhang  2022-08-06  25  	stptr.d a4, a0, THREAD_SCHED_CFA
09f33601bf940f Huacai Chen 2022-12-10  26  #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_SMP)
09f33601bf940f Huacai Chen 2022-12-10  27  	la	t7, __stack_chk_guard
09f33601bf940f Huacai Chen 2022-12-10 @28  	LONG_L	t8, a1, TASK_STACK_CANARY

:::::: The code at line 28 was first introduced by commit
:::::: 09f33601bf940f955c10a6e75a1c1b7bcadee5e2 LoongArch: Add basic STACKPROTECTOR support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
