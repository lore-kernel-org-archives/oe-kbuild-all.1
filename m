Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247423090DE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779392486; cv=none; b=kdRKsJbl/kESsJzPHL/JMMjslswQtKa3TbUaW1sMQAzX9C5tr7nblYcmBbUcq43cQ7ZVtCdcmjQG+dZhYqgQksSShEzz+4XrKAhx6FUWNmyyKSR2e/VEJqi3s++1mNoifqQLb8J0N67laND24TMuTstvC1bAbt/YD1NDcSgjN0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779392486; c=relaxed/simple;
	bh=mcj88/gltHanCdzjZgELrxkXKOi+3pHnIDbaeFW9lxQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dPWsiuyFu/Mv7ONIucqH1hVk6xXOflzuXYGl8hwOaBFKdXYXPDfGXPlUBL87wfRXIOIdSzNEScDjGhjF4JAjONOj7Ldw+R+rRMZV/IashZbaMB+YCBn8ZSvPBbqEoUivbI7Qvx04PHAgcCpBQQJ8riIuluJF2nUhRkoyizD+Cbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ya0QDYhv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ya0QDYhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779392485; x=1810928485;
  h=date:from:to:cc:subject:message-id;
  bh=mcj88/gltHanCdzjZgELrxkXKOi+3pHnIDbaeFW9lxQ=;
  b=Ya0QDYhvszoLCsJfCsbwqKQTD+RFV+HVBYeiSqG7tBnE1pTqZy51isLw
   59B65BD8DFPoCGHt3LD19ssTek1aScU2j30rW/fmjgVKfoA64nOu1z09Y
   HE7rw1yogbetVNdiwceYVhQTuhhprPiK9KksgKlnTCqM58reQlp1AGgbn
   W5K5mAf7kckwbJ31xD775T2ILlSazldXAPrrWRLtwSBQk39ahwA+8a8vJ
   TN5RTnZxn6/KK7XgZOvZarHExHSp1w2zWzLsjx9x3nbWCCmc8NMivtDS4
   BQUM/VEzqvD0oX2gpkgYdh0wodzPMHBf5Z/RkWLghqPojuGGKh82Xss21
   g==;
X-CSE-ConnectionGUID: OxAnT2MaQQ6/lxp+t6s5/g==
X-CSE-MsgGUID: PbIdn6N2Rm2KHS/CIbk/lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="82898722"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="82898722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 12:41:25 -0700
X-CSE-ConnectionGUID: H2sxYVcpTBeWdiuj3bn/uA==
X-CSE-MsgGUID: WODdmbmTR4GHNxS8IWacWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="242445420"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 May 2026 12:41:23 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ9Gi-0000000013V-3V0Z;
	Thu, 21 May 2026 19:41:20 +0000
Date: Fri, 22 May 2026 03:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kaiser <martin.kaiser@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 880/1130]
 include/linux/ftrace.h:823:21: error: initializer element is not constant
Message-ID: <202605220300.8kpOLBkc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 58b7f0bcef7558162191e3420385458735aecd78 [880/1130] ftrace: cherify the code that patches ftrace call-sites
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260522/202605220300.8kpOLBkc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220300.8kpOLBkc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220300.8kpOLBkc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/module-plts.c:7:
>> include/linux/ftrace.h:823:21: error: initializer element is not constant
     823 | #define FTRACE_ADDR (__c_pa(ftrace_caller))
         |                     ^
   arch/arm/kernel/module-plts.c:26:9: note: in expansion of macro 'FTRACE_ADDR'
      26 |         FTRACE_ADDR,
         |         ^~~~~~~~~~~
   include/linux/ftrace.h:823:21: note: (near initialization for 'fixed_plts[0]')
     823 | #define FTRACE_ADDR (__c_pa(ftrace_caller))
         |                     ^
   arch/arm/kernel/module-plts.c:26:9: note: in expansion of macro 'FTRACE_ADDR'
      26 |         FTRACE_ADDR,
         |         ^~~~~~~~~~~


vim +823 include/linux/ftrace.h

   821	
   822	#ifndef FTRACE_ADDR
 > 823	#define FTRACE_ADDR (__c_pa(ftrace_caller))
   824	#endif
   825	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
