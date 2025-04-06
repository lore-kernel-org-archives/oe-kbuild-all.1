Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A428373
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Apr 2025 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743956917; cv=none; b=KkM7pXgpbY6lwn0pv++AkeBUpNoFs7HDTPYx6V3u4+U/eZsnLskbfPHtS08Pb8YbbhiUU7M2bSMyZ/R3t0w5Vt7b0vIWzoMJUoqc351oGnkGPUqCaSU4fZqyuI6OWSmos+xVoCh9r/lcw4ZSVvtOklD0bYETIcc/XtcN6Axa86I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743956917; c=relaxed/simple;
	bh=2tnRdVF34BFIEQ+j55XIsruwWYVdNafgaJHyI9uxk2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSUgnB9Eu4di27gs+AONV9Qeut4kAuqMZ0A5YaOAbpHx20otuovnkku2+EmG9Mj908R1mIJzu3GOjGWu0hBjtdXEo9XAO7GjbKc7GtY0/IAbm+liDMOu4HvcZemvfujVN6Iu/jgfVbpPwq3EwJN+/JAtlEndDdKRNKLBRsWah1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgHQMeAU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgHQMeAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743956915; x=1775492915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tnRdVF34BFIEQ+j55XIsruwWYVdNafgaJHyI9uxk2o=;
  b=JgHQMeAUg1ZPBAk4REDoqjRDfffVSPtj/zpoOs71lRN3ro+J82nGOCDE
   recYhvroPN8oQKliQMxtG1J9Nev+UdrOKB4bVxE5BdngaPgaj36wU9vuk
   WUWe7FMM7M1Ay0WQzLIesFPBepZp+s4pYvZRCgxcPMqrAYC0WvXqD7Yzs
   ojT2rFLH4StO0EQFjXlErbFoGxd/ReIsHOMT9tbepme6L2fyNPWlNQYeX
   2W70LAqzHgIgUGgSJyuuApm8oEFp1eTUBBwvLSvTw0I09NMGWMNROmjKA
   Ua8A116CIDp9YrRzJ+Xh4c3aKPlkQyQ8c6OTeXoWvEGQKfblwnd85I6Am
   g==;
X-CSE-ConnectionGUID: QkUxICwpR7WBxwKU9wLADQ==
X-CSE-MsgGUID: sVyhX/PXRCuyVfWMClZx5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="62885255"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="62885255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 09:28:33 -0700
X-CSE-ConnectionGUID: nWxip8bcQx2MgZw8wTu0Qg==
X-CSE-MsgGUID: F2Aq/NdYSHu/2VL8+1QM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128257378"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2025 09:28:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1SrF-0002hG-2T;
	Sun, 06 Apr 2025 16:28:29 +0000
Date: Mon, 7 Apr 2025 00:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:hack/ppi 8/13] include/linux/irqdomain.h:765:12:
 warning: 'irq_populate_fwspec_info' defined but not used
Message-ID: <202504070043.zBFNF505-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git hack/ppi
head:   2eb268faef9c9204898770ee24a676c213566794
commit: 069b6b94df996439ad61f8ad9f15617097a09fa9 [8/13] fixup! new affinity retrieval API
config: powerpc64-randconfig-002-20250406 (https://download.01.org/0day-ci/archive/20250407/202504070043.zBFNF505-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504070043.zBFNF505-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504070043.zBFNF505-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/of_irq.h:8:0,
                    from drivers/crypto/inside-secure/safexcel.c:16:
>> include/linux/irqdomain.h:765:12: warning: 'irq_populate_fwspec_info' defined but not used [-Wunused-function]
    static int irq_populate_fwspec_info(struct irq_fwspec_info *info)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c: In function 'safexcel_probe_generic.constprop':
   drivers/crypto/inside-secure/safexcel.c:1162:30: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(irq_name, 6, "ring%d", irqid);
                                 ^~
   drivers/crypto/inside-secure/safexcel.c:1162:25: note: directive argument in the range [0, 2147483647]
      snprintf(irq_name, 6, "ring%d", irqid);
                            ^~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1162:3: note: 'snprintf' output between 6 and 15 bytes into a destination of size 6
      snprintf(irq_name, 6, "ring%d", irqid);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1667:32: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(wq_name, 9, "wq_ring%d", i);
                                   ^~
   drivers/crypto/inside-secure/safexcel.c:1667:24: note: directive argument in the range [0, 2147483647]
      snprintf(wq_name, 9, "wq_ring%d", i);
                           ^~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1667:3: note: 'snprintf' output between 9 and 18 bytes into a destination of size 9
      snprintf(wq_name, 9, "wq_ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/of_irq.h:8:0,
                    from safexcel.c:16:
>> include/linux/irqdomain.h:765:12: warning: 'irq_populate_fwspec_info' defined but not used [-Wunused-function]
    static int irq_populate_fwspec_info(struct irq_fwspec_info *info)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   safexcel.c: In function 'safexcel_probe_generic.constprop':
   safexcel.c:1162:30: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(irq_name, 6, "ring%d", irqid);
                                 ^~
   safexcel.c:1162:25: note: directive argument in the range [0, 2147483647]
      snprintf(irq_name, 6, "ring%d", irqid);
                            ^~~~~~~~
   safexcel.c:1162:3: note: 'snprintf' output between 6 and 15 bytes into a destination of size 6
      snprintf(irq_name, 6, "ring%d", irqid);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   safexcel.c:1667:32: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(wq_name, 9, "wq_ring%d", i);
                                   ^~
   safexcel.c:1667:24: note: directive argument in the range [0, 2147483647]
      snprintf(wq_name, 9, "wq_ring%d", i);
                           ^~~~~~~~~~~
   safexcel.c:1667:3: note: 'snprintf' output between 9 and 18 bytes into a destination of size 9
      snprintf(wq_name, 9, "wq_ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/irq_populate_fwspec_info +765 include/linux/irqdomain.h

   764	
 > 765	static int irq_populate_fwspec_info(struct irq_fwspec_info *info)
   766	{
   767		return -EINVAL;
   768	}
   769	#endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
   770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
