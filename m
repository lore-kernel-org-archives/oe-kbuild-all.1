Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0AE1D5147
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 19:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838278; cv=none; b=XmfXjXb3K0rJPoI8BB8Wzlaxjf7uHWQlVivqzgTj+oBVf9i5AqF1TT7acrXak0zm8UPbYlc8i1X/PoEESB6KN/IPi4OTpwA8h1Ti9u3jnfwxvIA9KqFddHB93vWYLI9UWCIn20ylZlz4JC+iSHZRkQ0oNPxeUAqG7iM6q3T23qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838278; c=relaxed/simple;
	bh=i5yIVHa4XXWUvNtM2BFTjGf/wrX+dzYk9ww6RIaTnnE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ox27LpbtJicC+fzGg++c8qqGMlQ2eQbj3aXzRs62FsF52m1CYYkzqutjS1bZ1hF63XK58vQZf2sSBE0oKEpmcrKshhsLnde/DpGJac2qvtWCpgTgcnspdZor/Vhy8MfQSVDie6oETkJ0bfVPDDjq1uZjzUnQqLnr4Yw176uHz7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDywsaUU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDywsaUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770838277; x=1802374277;
  h=date:from:to:cc:subject:message-id;
  bh=i5yIVHa4XXWUvNtM2BFTjGf/wrX+dzYk9ww6RIaTnnE=;
  b=WDywsaUU45Bvwt3mZwf3t+loP0hyjaWNDjLTpaM7Ag2IrIHAdwx2LJhB
   4s6ydEXKZuG6bFtbHXXIMiRBqU1Bit5PqoWKawYqSFncwTDtfqtKLAkQR
   abKNa/JsrLd/oNgc+uA9amaTxp8sxbqkRUpRWz/QicnvIS5tVluI7mxMe
   5059vpyGCdBP+A6hAOyvPyxDSpNZ8VhjNe2DHZQ/ezymDUEplmQIe4Xf+
   U5TNdwzquSUYUbGUGWFXTnlFrFDgK1wxADiWW2b9FcCqLifFCqVHRDYCu
   dLKILtf1EkTbnyh+9qAmQSCCR2vPqMH1HRcbTKnI4wzrNVXnC458leRIw
   Q==;
X-CSE-ConnectionGUID: 1K9lq+raSROK0SOlIGc/Lw==
X-CSE-MsgGUID: lYk7/B9LQu6u6GGLnN9FDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75620993"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="75620993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 11:30:48 -0800
X-CSE-ConnectionGUID: 9aq4E8/xSE2GxeYB07o9fw==
X-CSE-MsgGUID: z/2qxx4oSbyapfb9iO4CWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216603327"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2026 11:30:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqFvA-00000000qJA-0dh4;
	Wed, 11 Feb 2026 19:30:44 +0000
Date: Thu, 12 Feb 2026 03:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 7/11] m68k-linux-ld:
 fair.c:undefined reference to `__udivdi3'
Message-ID: <202602120334.j0IicTNm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   0900b7ccd9fd82ebb9af824a43994c4d20c7cca8
commit: 5f7dcdadf71c0b5c475bc3ffe4d4f69be7bb87b5 [7/11] sched/fair: Use full weight to __calc_delta()
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260212/202602120334.j0IicTNm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120334.j0IicTNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120334.j0IicTNm-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/sched/fair.o: in function `entity_lag.constprop.0':
   fair.c:(.text+0x7f0): undefined reference to `__udivdi3'
   m68k-linux-ld: kernel/sched/fair.o: in function `update_curr':
   fair.c:(.text+0x2140): undefined reference to `__udivdi3'
>> m68k-linux-ld: fair.c:(.text+0x217e): undefined reference to `__udivdi3'
   m68k-linux-ld: kernel/sched/fair.o: in function `yield_task_fair':
   fair.c:(.text+0x235a): undefined reference to `__udivdi3'
   m68k-linux-ld: kernel/sched/fair.o: in function `wakeup_preempt_fair':
   fair.c:(.text+0x4a98): undefined reference to `__udivdi3'
   m68k-linux-ld: kernel/sched/fair.o:fair.c:(.text+0x5438): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
