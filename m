Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5849A248867
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768855940; cv=none; b=mfF2GfcmcdlWUeD2M6bAGqq9WuR52h2dj58gkqsAs1R5ZB3SaoMGdPm8loY78/EchPCUU1Fzc/pNGw08mjbJlcT2RC8RLvlCKY8PnH9XeRdT2Xs3bUZmWWZ3EaJBfaW3Jjz8hGY0lNXHflpBdKURQ7I6kVp+IfXlGvtuXd6QQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768855940; c=relaxed/simple;
	bh=nDwWiSNQwCPRJTDrkbPucGnALAKjK3AX8ZOj3KNUCf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WGDgcuZRiOai1wODkOQB/iFpViEV5RBW5oY9/OYrlb3YUu+W+NZLa4eidA5UpYxKrN2JqvXFald1U1h6dvjb3xPQJU5GOdURKnGcctongV+O+a27kwWvsKvf6CWyTaVDQ6JXy4lkUaupMrJ40Wau3iC/JoY/HQy4+y+zneq7kAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlL3yKOm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlL3yKOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768855938; x=1800391938;
  h=date:from:to:cc:subject:message-id;
  bh=nDwWiSNQwCPRJTDrkbPucGnALAKjK3AX8ZOj3KNUCf0=;
  b=QlL3yKOmFYYHT70zu296xujH1liiLRPmfxMUXkN2fS0D95bpvMDgWXY4
   fQZTPGX9ZeTAhkIcaOFFxbIN7dD3HKRhCwUlfTKvzZdvcHMbGL1S1r1rq
   OqKLXA5HhUvksHva9FMGE+l5xWOx3+i2hkry/U9ik+q96A1ljIeZZ9oqs
   MbBR+3oHnwe5yYPup4dVCc/2DlZk4ouQmKuxFPcI00XLnjajknIKmHVMy
   sqgYEExdnq1q2G+IBmZIRtJC38rqO4TL42syU7zE3NH/91TYFDbZfswnp
   Kw2pbKCun0P86CNox/e3+xujpJvv9S4zBGpKCRD/r0bniobQOqnwFv5qj
   w==;
X-CSE-ConnectionGUID: f72wjSudSAayPWwVRjhwHg==
X-CSE-MsgGUID: e+ybNbwiTq6l1uOYjj/x7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70040725"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70040725"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 12:52:18 -0800
X-CSE-ConnectionGUID: DzGi0jVLQYew0kRR2F8++g==
X-CSE-MsgGUID: RlJT+kTHSvunK3PyY6sJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210081050"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2026 12:52:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhwEP-00000000OIj-2yAa;
	Mon, 19 Jan 2026 20:52:13 +0000
Date: Tue, 20 Jan 2026 04:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 7/14] arch/m68k/coldfire/intc.c:173:34:
 error: 'MCFINT_VECBASE' undeclared
Message-ID: <202601200416.fpIqDLOZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   c125a4847c40ed3b54deb8116f78193aa9fd29da
commit: bf56caa3d5a11034c40c55074a863e3f341b73ea [7/14] m68k: coldfire: support devicetree binding for intc controller
config: m68k-amcore_defconfig (https://download.01.org/0day-ci/archive/20260120/202601200416.fpIqDLOZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200416.fpIqDLOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200416.fpIqDLOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:173:34: error: 'MCFINT_VECBASE' undeclared (first use in this function)
     173 |         const unsigned int num = MCFINT_VECBASE + 64;
         |                                  ^~~~~~~~~~~~~~
   arch/m68k/coldfire/intc.c:173:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/MCFINT_VECBASE +173 arch/m68k/coldfire/intc.c

   169	
   170	static int __init intc_of_init(struct device_node *np,
   171				       struct device_node *parent)
   172	{
 > 173		const unsigned int num = MCFINT_VECBASE + 64;
   174		struct irq_domain *domain;
   175		int irq;
   176	
   177		domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
   178	
   179		for (irq = MCFINT_VECBASE; irq < num; irq++)
   180			irq_create_mapping(domain, irq);
   181	
   182		return 0;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
