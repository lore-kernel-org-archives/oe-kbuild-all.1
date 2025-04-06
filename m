Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48830535D8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Apr 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743930295; cv=none; b=qVdewtDAL0njotsqYhm2DuRQYywEdm0SCOqrZqHuFfw2BIPcXqnnyOqcrGKPH5lUtrWpaNviC/B7t4nw4LPHG0eNWFxroMPzLqe+VhqKBhXLYrOnRDFvurbZc/HK2eZlO3XWy+a0AXvLqFilyGx8s+VAWuMIaW+1ehP5yYWgsdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743930295; c=relaxed/simple;
	bh=E8hi38LiB256y8aFjkvsxWygggRGilL+mns0Wk67p5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C72vSUDne+gy1jHqLK+fDVCWf0Y+JHbk/Ts71T2uZDKhe6+yFgkORCT+3u+A25lK3mFveXCi8OrO8vUDMfyVzkrHv9J4Q5Ub12lU2qbYHxnV675hxMS8O7ZoRW8BPnVtetB4CFgpBLNwVAQvLIGnw2karJrd2JGC1dM62nMCFig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aw5YySTK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aw5YySTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743930293; x=1775466293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E8hi38LiB256y8aFjkvsxWygggRGilL+mns0Wk67p5k=;
  b=aw5YySTK98BS+E6ylc54I3IkpgfBGKwuTLaURnmRhwXtycvwXhiX/2vM
   yuGDGSLBQqxYDMVnkLiqJEyl9kQnQhjf0AsKTdoK3LRLghpFc7bjpHa3t
   TVNquZIBRJvpK7FUVKTlPkOIsjGMtObwZLdkStQ9OBFtM1G/e9hmlzciH
   3r6TRmBI9kAIa1Kb8UeIRusoW6P3c4CQDgaKgcGMdrP2r5vdbi5LSAarX
   WFz4JpqqEDikR6shkukx96CgRG/N8J2B9gPuAtisqTAKd2KAH8ZrBdZBU
   8nWfhvn+FbRxhsvcxKwYkHiGtxVEscXzRxpnb2FtjgH8L+kzO74EduCZd
   A==;
X-CSE-ConnectionGUID: 1To0FssPTYGOEuc3w9A98A==
X-CSE-MsgGUID: FH+V5SG6Tza0BQ24FHhYpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="49175873"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="49175873"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 02:04:52 -0700
X-CSE-ConnectionGUID: 3F0V8q8NRB6gOysNhrHJlw==
X-CSE-MsgGUID: r1gfQllhQfWWAL+rGtNYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="132823443"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Apr 2025 02:04:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1Lvt-0002Vn-1u;
	Sun, 06 Apr 2025 09:04:49 +0000
Date: Sun, 6 Apr 2025 17:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 17/25] kernel/irq/irqdomain.c:922:1:
 warning: control reaches end of non-void function
Message-ID: <202504061643.olUiUk0A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   aefa1f7be0ec85eaa2d21637deea85660d4c153a
commit: 56d963e82dae51037c004093c820370a4ad96cba [17/25] WIP
config: powerpc64-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250406/202504061643.olUiUk0A-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504061643.olUiUk0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504061643.olUiUk0A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/irqdomain.c: In function 'irq_populate_fwspec_info':
   kernel/irq/irqdomain.c:916:29: error: 'const struct irq_domain_ops' has no member named 'get_info'
     if (!domain || !domain->ops->get_info) {
                                ^~
   kernel/irq/irqdomain.c:921:20: error: 'const struct irq_domain_ops' has no member named 'get_info'
     return domain->ops->get_info(info);
                       ^~
>> kernel/irq/irqdomain.c:922:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +922 kernel/irq/irqdomain.c

   910	
   911	int irq_populate_fwspec_info(struct irq_fwspec_info *info)
   912	{
   913		struct irq_domain *domain;
   914	
   915		domain = fwspec_to_domain(&info->fwspec);
 > 916		if (!domain || !domain->ops->get_info) {
   917			info->flags = 0;
   918			return 0;
   919		}
   920	
   921		return domain->ops->get_info(info);
 > 922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
