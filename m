Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD0A1E1E04
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 06:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004002; cv=none; b=hiPJdqXcAzh5Bn1+4zNo6JlkqgiOKzvDNYZ+3X2svL/0btNHV7OUG9Fg0eRE/l+IB/UQYKkbcAIHjRennGIOTfOxoT1mThTpBEzdeUTAZXzApII3WJr1wOG4BorXPgcMksdpIJ/Jyk+JPHbSBJAr9uEO8Y+e1GchwXdqskGMFmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004002; c=relaxed/simple;
	bh=PNjNZMpScHoR5w6If3yM1SnGGvv4bf5QJBsM8IGLZV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGSeAYPrlwBsFOS43QA5hZTiXSiZfHOTk91R6xk+xB+3GEv9rwkx5ssXPXRvblKWiSRz54qNhoGenl07JHRKiNcy9eFJ9ieRw7MXtq8UZh/tgCBNw7jqy6Y9+SQjmvacpaVm0KhgmxizDPkFbzNy2t1G3S/5hpvmwlIFdDozrpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VApDRe8k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VApDRe8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751004001; x=1782540001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNjNZMpScHoR5w6If3yM1SnGGvv4bf5QJBsM8IGLZV4=;
  b=VApDRe8kQrjlVmAglgSWbMSvl1mLpSHMjaE+v3tY0YSTSrfShWG9d/Nv
   fg57ArQbd2+xppABd68flQSlfSDcB9QqFs4r5suZZnlLaaWV8GaqqY/rf
   0lv7fBm9zoEkeytRUF3wXkBKWplEE+vpKAlIgw4XhoH6A0yvSvBpJrZRl
   GuuvlHOi64wKJtaYznLt5EUUKjNwbNsAuFEyNS5tow4ytpiSuxFUzCBLP
   YltOY2LKvOMQYGNEI0t3hRM1ypI4ITKpL/ABvdnIw/BoePeG+Hgb4qvhd
   fHgZxBOTvueg0k/CK1XDwLjrWl8+Xh8UB1Y8/5aHW3VK/0+vtuEyAg0UZ
   w==;
X-CSE-ConnectionGUID: /I3uuuPFReqStRpMafidaA==
X-CSE-MsgGUID: sLdAWXItRZakq2ZBDZ+NqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63569805"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="63569805"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 23:00:01 -0700
X-CSE-ConnectionGUID: qIAPEiwdQJCUGJBChcHHrA==
X-CSE-MsgGUID: O1Bz6RBsRnqMXQ9UtQ6qaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157009570"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 22:59:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV27x-000VqE-0u;
	Fri, 27 Jun 2025 05:59:57 +0000
Date: Fri, 27 Jun 2025 13:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 7/14] arch/m68k/coldfire/intc.c:173:34: error:
 'MCFINT_VECBASE' undeclared
Message-ID: <202506271329.TPfKPXfx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   f1fa7fc50979940f45a83a33ea77b41c98d8e29b
commit: bd3e6e3ba6e920be08054f1c066c0cf8801875af [7/14] m68k: coldfire: support devicetree binding for intc controller
config: m68k-amcore_defconfig (https://download.01.org/0day-ci/archive/20250627/202506271329.TPfKPXfx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271329.TPfKPXfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271329.TPfKPXfx-lkp@intel.com/

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
