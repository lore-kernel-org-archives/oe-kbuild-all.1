Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAC2777F3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546163; cv=none; b=S2GubwC+TH/zYoANSJ2fp3lRP/SUpuHkhtv12lgvS/ySTD+bH5EhvQvlUyzQRLfkZJSSilsasvlF0NaholaNMSN4eBOyGzvzkhTyewZU6u2HuCQdUoJydQu0Chd9UgBGPlXcORPGdOF5BC4a+8M6aeZW2sWwoin5jQFRMULiElE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546163; c=relaxed/simple;
	bh=s7sB1j+3X0hoYwMBBsIS/a3sw3PlhNwtEuTj9ejxlCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sJ+MmMq4mmtnckZCS0LbGRVkIggekgUcnVGrRG5bbyHzWDhoCiXXYVFBmW2iozVaA7/D2w7MLTF8TaQC5IXZqvKlVnmPw4F3UyPNL3+GP4Gxv9WWQHVgDNgjTQnByPDAoiM3q642bs6Ifb6gsoK8pjhHA5Ea0KKxa96w7jEA/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ah66FM3K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ah66FM3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783546162; x=1815082162;
  h=date:from:to:cc:subject:message-id;
  bh=s7sB1j+3X0hoYwMBBsIS/a3sw3PlhNwtEuTj9ejxlCY=;
  b=Ah66FM3KECo+SL8up+y/kco7H+gcUGbQUq/kCZ/ghs6kg4JIwHRcVrzB
   ci/f7/fQpaE4yXEDPvt+UBrjoq/kE0ApW2ZMO06/jHrNvbA2q/ftEOTdR
   m4sPXJ61GiuqBwa1nERglgs2Pr8ICUO6jEtm1JBzHm2p+1ArSPPijpHgT
   JaGt1HB2NwOWyS+Km6P2urZj0TJdNjffMiNDsDR/Krt+UMmdfBdX722/U
   30cs+H3IvxEq7GYd+Uyq1XkV8K+p8nceG8L5v2dzyPaZRdwY17e9aJHvc
   QCEO0In4UiWRQslpKwvbCzfXqLrOUL4m5yJtCJLcijLb18FFGNDC4EHFt
   g==;
X-CSE-ConnectionGUID: 9KgrGrmMSeCs6GDU01KtvA==
X-CSE-MsgGUID: yp2aA43kTj2mUlysz1RFRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101648492"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101648492"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:29:22 -0700
X-CSE-ConnectionGUID: jnxsQ6+GT5aYjdwcJxEf7g==
X-CSE-MsgGUID: ctCy2iNWSzCGFKmWc8oK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253909676"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Jul 2026 14:29:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whZpU-00000000Gtb-0LVp;
	Wed, 08 Jul 2026 21:29:17 +0000
Date: Thu, 09 Jul 2026 05:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 4/4]
 drivers/irqchip/irq-gic-v3.c:1585:12: warning: 'gic_v3_suspend' defined but
 not used
Message-ID: <202607090553.zUO3OycA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Unnathi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   5b9136b9d339e45260ca901c1a3fb5857763df8a
commit: b4b436ca33c0900359df8643d5c0b27c35954f30 [4/4] ANDROID: irqchip/irq-gic-v3: Add vendor hook for gic suspend
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607090553.zUO3OycA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090553.zUO3OycA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090553.zUO3OycA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:1585:12: warning: 'gic_v3_suspend' defined but not used [-Wunused-function]
    1585 | static int gic_v3_suspend(void) { return 0; }
         |            ^~~~~~~~~~~~~~


vim +/gic_v3_suspend +1585 drivers/irqchip/irq-gic-v3.c

  1582	
  1583	#else
  1584	static inline void gic_syscore_init(void) { }
> 1585	static int gic_v3_suspend(void) { return 0; }
  1586	#endif /* CONFIG_PM */
  1587	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
