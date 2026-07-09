Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2384F4499AA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635595; cv=none; b=bh5UPTJSaRTIEvCNZArjQkNVfArx+PmRjcIgpXhAgsWQP7AY5U8FqgQw4/wBYlxy/6Pj6u/ouYodjNwn5OHAyeH1dLG6gbiCTycnbiy4SLXvs/GSK2AKw1o33VapPFZbIrnnci91uAc/M/jAs3ilzMc3tTXSU1kQbaZz7AyiONE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635595; c=relaxed/simple;
	bh=+H7M9M7bIdfrtWAAgYfiY00evOmzbICi/RKSaWkGHrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D3+x0vLNOicKBgEi8rl0SAeVt3H+L5uLQFl4wNd4oWWXwoIHNhi6gvBhg60YvE9XL4Q3IGtXqm7lNJhwUacwvJLNNVM8rpAtefl7bel9TfEoguohhrVJq3RNFiR5WHUKnwtMJn+vVQvhTUajk1pasPT8gdGiu+TdjHLzHnXwvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjztVNkk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjztVNkk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783635594; x=1815171594;
  h=date:from:to:cc:subject:message-id;
  bh=+H7M9M7bIdfrtWAAgYfiY00evOmzbICi/RKSaWkGHrs=;
  b=JjztVNkkPr41HnA1WevjGyn7DANtl+0hmPvljpNM4C/mkBo9yAXwu3Jo
   o+6SxdjLh9aoUpnZGuhK/yS6T4hsyMjc0yFbs9sbLQwB1kEqiRVBO+BIl
   gsG20lbarxNIzVyLNa3Aop/tXUiAQgWM/QTjUQC0QHr7DYYDc6hlWNys9
   wh0w7zhDdEEGI6KasYGSZOC50EwdG21yNNC3SL5itJ3rnRUZUoqYiB5CK
   TZb0PFCqX3MnjLascBfZLkd//zH/q0YUB1TsDWPIr+kJhDc+ErsGoyUCu
   yqj7gmwNLV63T7wgXTHDQ+yaVbqdBjiD5T2bXWqLiZinVxoUS2FXmVRmA
   g==;
X-CSE-ConnectionGUID: 2qXUZ1NaSAuQwHIVbDbtYg==
X-CSE-MsgGUID: iNmyNmcZQyazb64mjQXfpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83451916"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83451916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:19:54 -0700
X-CSE-ConnectionGUID: t0wbTJz3TPqgxpPpTzG2wA==
X-CSE-MsgGUID: 1S4+UeP1Tx2RYogxmTf/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254818792"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2026 15:19:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whx5x-00000000ICA-0rwj;
	Thu, 09 Jul 2026 22:19:49 +0000
Date: Fri, 10 Jul 2026 06:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used
 against symbol 'init_task'; recompile with -fPIC
Message-ID: <202607100652.WPUlEAfx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: d5cae2261b86913e602452ce4a07e6aefc0f603b dma-contiguous: simplify numa cma area handling
date:   6 weeks ago
config: powerpc-randconfig-r133-20260709 (https://download.01.org/0day-ci/archive/20260710/202607100652.WPUlEAfx-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100652.WPUlEAfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d5cae2261b86 ("dma-contiguous: simplify numa cma area handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100652.WPUlEAfx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'init_task'; recompile with -fPIC
   >>> defined in vmlinux.a(init/init_task.o)
   >>> referenced by head_44x.S:101 (arch/powerpc/kernel/head_44x.S:101)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x42) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'init_thread_union'; recompile with -fPIC
   >>> defined in ./arch/powerpc/kernel/vmlinux.lds:133
   >>> referenced by head_44x.S:108 (arch/powerpc/kernel/head_44x.S:108)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x4e) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
