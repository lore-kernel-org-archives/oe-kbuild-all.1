Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8423BB9F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 23:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779407877; cv=none; b=HuGD3+RKAEfq8qaukV+XLnm/1DHhMfuwjHNFJPaRlG2tqtD3jugrV2E8WQOwMeAKjihK48yPuyxFH6qGGqT/SJYd+O9pgaYCmfh+fJ9Yko+ZA11QQ1w/2mQx73P0TWEA24l5yyeXDYz9vsuu004+eQ7iDwg717h7ydxEOBR+Sg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779407877; c=relaxed/simple;
	bh=lRzJkAQXVKb0XGqrtbxiquLhWY6n0AwGmVyUOwqjIls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nENoLqmQLql81xCmH/050PINo/PtT/+l13E9drUaRG2mVYOZ1udNovF2BmASKK8fHEOgf7IYJZPqsS+uE3C0x2JZ+RZubaZLIM/JhPmwcT/D7c5KFsDiuFfuxtCx/4y8YBwYWJ4dY6+alAvEkxz+eFNlMUfBeVmuNxfCLJiDZSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6o02X0y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6o02X0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779407874; x=1810943874;
  h=date:from:to:cc:subject:message-id;
  bh=lRzJkAQXVKb0XGqrtbxiquLhWY6n0AwGmVyUOwqjIls=;
  b=f6o02X0y4WDhXlwqCsFzQbCXIf35fHu80oquO56WDp5zdg/u+F653vD6
   hGaMBSPeEZS5LMHc6hUMcfxlrQjyedimdV06bjIhHJEkofRd9UWxk/XwX
   xwRLl9LQMWGhB2cqrGSMNoNB+oPruiN1Ltp/Bx8gRRkm/iZ0mKFBb/qec
   bpfsC/Qq6LioklPRHrcYkF/MSIqwnaXwyVPFSXfFxEVsyZDxDQMU6j7Fa
   6xU1rDrp3q7FJtIkZCWZc0+TvWulsHFCfxalZ+l/VBDytmn939G1LIfh7
   bJ4+S6w/ZnE6FatU7xJc9aoZpZGrxxMiFwD6Pu92Ct0FVJalN588t8DLz
   g==;
X-CSE-ConnectionGUID: MHgP+kiKTN6MLiCm7BMSEA==
X-CSE-MsgGUID: B5/65OuQSsO7Y9xoMlbHuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80370722"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80370722"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 16:57:53 -0700
X-CSE-ConnectionGUID: snKXiKLDRsGwerX1KPuzbw==
X-CSE-MsgGUID: zogUlLBjQvqdzYG+/IrzpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="244752075"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2026 16:57:51 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQDGu-000000001On-1p83;
	Thu, 21 May 2026 23:57:48 +0000
Date: Fri, 22 May 2026 07:57:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [tj-sched-ext:arena-direct-v3 58/64] aarch64-linux-ld:
 Unexpected GOT/PLT entries detected!
Message-ID: <202605220700.lDfcrhX4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git arena-direct-v3
head:   4a5efbeb273b64332267a353aff34275266607ea
commit: 89d58a851781947942277e2dded4c98a2434c614 [58/64] bpf: Recover arena kernel faults with scratch page
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260522/202605220700.lDfcrhX4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220700.lDfcrhX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220700.lDfcrhX4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/mm/fault.o: in function `__do_kernel_fault':
   fault.c:(.text+0x260): undefined reference to `bpf_arena_handle_page_fault'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
