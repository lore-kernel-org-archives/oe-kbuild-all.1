Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A31D450901
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119169; cv=none; b=g3fUxWDVPi6dXYSqYUugdBcnTwU6enFlBV3tTy05GU7b+YAygimbcI3x/JdWPbtFExhpjf6yOMXfiowioxLBC7jtGTbjLgJdxuVP7WGgkhYwb2G1HoJ/dZ9D5p7IGMO9N/wPt0FhlAjV316Oo8eyXCZQUJ/aM4AlnRQWnLbMDX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119169; c=relaxed/simple;
	bh=C+ugMzXKZRq5OJnQuCyaI2af3+B3ayl2bltRmc5tf3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HNZIJWd66YI049asz/GeIwG89Omr2zKhuxfnObideCKFRcG3q9rxq+PBdjiCyW6CB2jQpILP7GzB860UWx7IPDJ4h4L0QSUnKuMsUrlNtQapoTwr8yGjbkkJSHM58HJ3RUWbHwn9Q9zs84rzIKLv/FTATSvwxXekCKD/oKS6YJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcBSJfs+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcBSJfs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784119168; x=1815655168;
  h=date:from:to:cc:subject:message-id;
  bh=C+ugMzXKZRq5OJnQuCyaI2af3+B3ayl2bltRmc5tf3A=;
  b=lcBSJfs+mbf5Km3lA8i3Y3MYjMFsUxRtiGpJXKW622hiwPsva/VyQCJF
   xaFSXa3TMFw8oXodoz1VdtMpjjBdzU3RH4mT6co112jI7g8Nsw86wo8Hh
   G4gtc/pFV3BYHiBLLQhOOP5XZHqm3PMl3vw6qvZQzo8qGIw9LYtHJab9S
   jUAa9ZV5JCTIC9mJl+DH2NLS6O72QYH6rCsqZbQWoNvG3ibLPS6BQfxyW
   YePZIW6wGHrsuURh6f8abAGsP4acf2C9xn3tJQ+frWii5nsFltdY238lG
   kA19W8XT/nvZCn7t4Xft+5yl8snsGFXid+c7HDFHrcSOcOgw/KqGty/EQ
   A==;
X-CSE-ConnectionGUID: UEVwTx6fQZ2BCZKngO6E4A==
X-CSE-MsgGUID: lahJ6QUNR/utUBBDR8ALBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95109845"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="95109845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 05:39:27 -0700
X-CSE-ConnectionGUID: RH+Qazd6S9Co1G3xFTqzIA==
X-CSE-MsgGUID: Kw2tog1uRlGpEKNVMcLczg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="253561319"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jul 2026 05:39:25 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjytX-000000004FZ-1pZC;
	Wed, 15 Jul 2026 12:39:23 +0000
Date: Wed, 15 Jul 2026 14:38:55 +0200
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/linux/kexec_handover.h:129:1: error: expected
 identifier or '(' before '{' token
Message-ID: <202607151457.EXxbolgc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260710-014638
head:   a4ac1827ac09b0b27fd42c9776b5f5bae67530c8
commit: ff640ad9350077a3af2482f69c1e34ee82daeaa2 mm/mm_init: don't rely on memblock to get KHO scratch migratetype
date:   6 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260715/202607151457.EXxbolgc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607151457.EXxbolgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607151457.EXxbolgc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/mm_init.c:33:
>> include/linux/kexec_handover.h:129:1: error: expected identifier or '(' before '{' token
     129 | {
         | ^
>> include/linux/kexec_handover.h:127:20: warning: 'kho_init_scratch_migratetype' used but never defined
     127 | static inline void kho_init_scratch_migratetype(unsigned long start_pfn,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/kernel/setup.c:19:
>> include/linux/kexec_handover.h:129:1: error: expected identifier or '(' before '{' token
     129 | {
         | ^
>> include/linux/kexec_handover.h:127:20: warning: 'kho_init_scratch_migratetype' declared 'static' but never defined [-Wunused-function]
     127 | static inline void kho_init_scratch_migratetype(unsigned long start_pfn,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +129 include/linux/kexec_handover.h

   126	
 > 127	static inline void kho_init_scratch_migratetype(unsigned long start_pfn,
   128							unsigned long end_pfn);
 > 129	{
   130	}
   131	#endif /* CONFIG_KEXEC_HANDOVER */
   132	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
