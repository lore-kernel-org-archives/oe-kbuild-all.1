Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3C139D0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 08:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760774681; cv=none; b=HmfUCJhO7W/d5Q4rmAHGuoEEUc2cu7Vpp+xmIpwETD3to5a8CMioN8te03950FTBCMszYqBkU1b30tqDzU7XxQ/4PRTpXpeMkV8rELUejQ1KFuHIubdHg+T9y2Rq8PZmJLAi8zq32DeOwahbHUorzdGFP7HouIkjrjrJwb1y2Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760774681; c=relaxed/simple;
	bh=fwZz8EbhKzZCpMfm9FineV++ok1Cs2g3XDw3rptrbeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sFWjxH/1NjDR8nwGYqs3l7QX4NBpzi07oTzeBGlpYH+ctE7zPsRDfZseUh8DYEKa0tG9UUp+z5V+4oN5TPyZmYFDWffq5Z6OaFod5VhpFPNQpoI45UlyvYAReRJXZrfpLBCQt/5mGH7BsDc/H6Gs0bbn9B1KtATzuD8hPD5eGlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxjxH2b8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxjxH2b8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760774679; x=1792310679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwZz8EbhKzZCpMfm9FineV++ok1Cs2g3XDw3rptrbeY=;
  b=OxjxH2b867KOYGPrgp+qGLJ3bqw9XiPuBa1Cm4vOM29KCRrq+krq6jNl
   UIWVzctJBhz0++qwEB0v5IraZ1HAS+2H8J6Ddc0Z0PUUe3SLX2H6aW1AU
   uVGrPhKVB7haeAles7hRUTWpS+3l1C9uXZ7RCTJkXBugCtttmDgvPPigR
   cQZC6wumUj/yVbZkkzeqKkSgt+PAgdENPRBiyjim45AvbKVlDSG0XSxPI
   2cEtFa1l1svHYOdOey5Tj5XvBoTIzbJ7tlMhUZvWwabVhmkQIzZNmheYL
   /YpxpAUXdvPAoPpdn2j2R4eDYeIRldwryigABPGHLISPapkD9Eht7WB3m
   A==;
X-CSE-ConnectionGUID: U58NT7+7RQmjuHgPZpp9Ng==
X-CSE-MsgGUID: ZXs8a47ZSoitg8A/zNjv0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66849863"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="66849863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 01:04:39 -0700
X-CSE-ConnectionGUID: N4/HoL1qQHunaAFpbq4jYA==
X-CSE-MsgGUID: MYCx1AY6QsKH8BghQu7rog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="213529337"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2025 01:04:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA1vX-00089r-1a;
	Sat, 18 Oct 2025 08:04:35 +0000
Date: Sat, 18 Oct 2025 16:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.17/fixes 4/6] drivers/pci/msi/irqdomain.c:156:3: error: call
 to undeclared function 'irq_chip_shutdown_parent'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510181524.Z9u9wUSa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.17/fixes
head:   2204ae45596c83fbcec13b2e8776b66d2e41a261
commit: 9c72540edfd20c69769955971be0675cf3e73bbb [4/6] PCI/MSI: Add startup/shutdown for per device domains
config: x86_64-buildonly-randconfig-006-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181524.Z9u9wUSa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181524.Z9u9wUSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181524.Z9u9wUSa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/msi/irqdomain.c:156:3: error: call to undeclared function 'irq_chip_shutdown_parent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     156 |                 irq_chip_shutdown_parent(data);
         |                 ^
>> drivers/pci/msi/irqdomain.c:164:10: error: call to undeclared function 'irq_chip_startup_parent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     164 |                 return irq_chip_startup_parent(data);
         |                        ^
   drivers/pci/msi/irqdomain.c:164:10: note: did you mean 'irq_chip_set_type_parent'?
   include/linux/irq.h:686:12: note: 'irq_chip_set_type_parent' declared here
     686 | extern int irq_chip_set_type_parent(struct irq_data *data, unsigned int type);
         |            ^
   2 errors generated.


vim +/irq_chip_shutdown_parent +156 drivers/pci/msi/irqdomain.c

   150	
   151	static void cond_shutdown_parent(struct irq_data *data)
   152	{
   153		struct msi_domain_info *info = data->domain->host_data;
   154	
   155		if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
 > 156			irq_chip_shutdown_parent(data);
   157	}
   158	
   159	static unsigned int cond_startup_parent(struct irq_data *data)
   160	{
   161		struct msi_domain_info *info = data->domain->host_data;
   162	
   163		if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
 > 164			return irq_chip_startup_parent(data);
   165		return 0;
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
