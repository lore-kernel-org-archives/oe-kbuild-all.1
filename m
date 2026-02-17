Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDC117A30A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 02:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771296192; cv=none; b=qMtx303YR+hcV+RbEpkjkwGbaTdmnHF8+k3ToMr2FHy+AW0+4cxhnrmPn1w5Fu5oK+FLsSC9mxSLu9Dw8jnRQqTupe4g2EoGL38PWFfk7axQruslCQVmLuwM6UQ3MYFwnM9QBbY/B/6SE7gg413g50hv5VwTTGX/He+VGt+bQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771296192; c=relaxed/simple;
	bh=dDMK7mgvP/+Yhj1fZJGPxi3QLPIR+CLqhRwBaPvR+zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Biqg8B39oDJWr7P8cLXWBuuK6+WafoPJeOhfKfGNFUXewdxOCvdIUYCZz/Ma+toNo1Hml1zqs0JWJJ61Uz5VKcZFsl9dYk4JQ69sgSUSOsk3qkaaPN+F+BelJv66tRUcOzt77Nwbq/0de1Da0NwmFjNnjKVVjn6neFTKdBBCuTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGFjUcSf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGFjUcSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771296190; x=1802832190;
  h=date:from:to:cc:subject:message-id;
  bh=dDMK7mgvP/+Yhj1fZJGPxi3QLPIR+CLqhRwBaPvR+zw=;
  b=XGFjUcSfTrVd5TKydOmhXSZophrBZ/R1LViAm76opMy/AuzonB9QMPN3
   pZqSgJjwV0zj/m0K4cAQXipGAviBi+fqbTkTqBVkxGgRART4iS6yuHOKM
   hCGstqWjPjiYTGCRoWXuUfVWhINV1E9/GFyTRV1jVPsezaDlx9upYHo+P
   63N4UrKy3SCZNYrZKjH8zJ6eqS6g1h9CZUkUCRBr1OnqddoccQRrmYdT7
   cYMC/9V62+6aQEEFeragFgP+qgPUY+ba86tTP9w79S57J5maGIJPoerfx
   C15NXoUw+Wb6IMKsV+ziIIRuP85LUtxvnHCVogtVe3PpUhO65RIygG0H5
   w==;
X-CSE-ConnectionGUID: V5qkOtNSRuus0WT1CisP+g==
X-CSE-MsgGUID: E/CW51uvTt6/TXBe1C39bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82697079"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="82697079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 18:43:09 -0800
X-CSE-ConnectionGUID: gRr8jHmSSCeXxXvl72bDqw==
X-CSE-MsgGUID: VuAt11ehR2OP1eZYtP44vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213043209"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Feb 2026 18:43:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsB3K-000000010YW-3kYD;
	Tue, 17 Feb 2026 02:43:06 +0000
Date: Tue, 17 Feb 2026 10:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 36/36] kernel/sched/core.c:882:13:
 warning: 'hrtick_clear' defined but not used
Message-ID: <202602171013.VyR8FIZ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   b4fb5671d1c3610e5afbae296e258f8f5cd9d512
commit: b4fb5671d1c3610e5afbae296e258f8f5cd9d512 [36/36] sched: Optimize hrtimer handling
config: parisc-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171013.VyR8FIZ2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171013.VyR8FIZ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171013.VyR8FIZ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:882:13: warning: 'hrtick_clear' defined but not used [-Wunused-function]
     882 | static void hrtick_clear(struct rq *rq)
         |             ^~~~~~~~~~~~


vim +/hrtick_clear +882 kernel/sched/core.c

b4fb5671d1c361 kernel/sched/core.c Thomas Gleixner 2026-02-05  881  
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25 @882  static void hrtick_clear(struct rq *rq)
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  883  {
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  884  	if (hrtimer_active(&rq->hrtick_timer))
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  885  		hrtimer_cancel(&rq->hrtick_timer);
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  886  }
8f4d37ec073c17 kernel/sched.c      Peter Zijlstra  2008-01-25  887  

:::::: The code at line 882 was first introduced by commit
:::::: 8f4d37ec073c17e2d4aa8851df5837d798606d6f sched: high-res preemption tick

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
