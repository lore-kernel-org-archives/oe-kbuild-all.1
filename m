Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EE31E47C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387581; cv=none; b=jk62hP3faCn2UGyttxR1QywJXzCqL6ZMdQMgLEmAh3m0YU3zs4840KhjcXg6qi2wMxJ/+BEP+VHwNE6F83ghksNlLM0T0oOfQxuyCKEwqkyEH6O7DPh7wbg1u9TOSOwH4Q1bdUkIkFLhsTK+5p2i0l3uWVr3dbBYwQuUJHSmEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387581; c=relaxed/simple;
	bh=rpXVeFpE/JHKaSSHfrq2uymq/qV2TCj2gbNQeBcCF60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAcZ4OwJe5rs36SU/hObJqj5mXf7nWxHkbuoKcd0kOmja6elBZDfbRfAYBPeoB3RDFHacwbMrSSlXaeSFRotF4ovHOJS8FrXCuI+gXyRkJZB+CimvTMP1DPThEbca3+TER6X0q3YryUP3kqmRb9FyJB76XbO+FFS6w5tbOQf7p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkv8hRyS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkv8hRyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737387579; x=1768923579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rpXVeFpE/JHKaSSHfrq2uymq/qV2TCj2gbNQeBcCF60=;
  b=kkv8hRySOVkJ09P6GNlfMLiGsBrHZSexaB3usl2Mk974pzmd8s9KmDs+
   nUCfLvLaEgPAgzHzE6N4dhLqVWEDl1gQv+Y7j0JgjwZBnjiElv25KzgsT
   Cw4WtMz5T5/ihw5/hHS9nXcG9OtPjHqik8Wxr/aAsMMFdnrZ079rRMXqx
   JArNnWtsOJJOQXPRYnJvbK/2KPFK7nYg2WI8FQX9QbBc7uWlMG57pO7jD
   DJlP14sJ3QjuLTP+3s6lyCS60c9Z1RzP/KBD1Xlguma8nwyVijDr/NRI9
   ErJjF1lArww+r+KW8YXz8NCtQfxCoAdfOqcRCWHu8j8b+GDfXPOt7rVQY
   w==;
X-CSE-ConnectionGUID: hE0mDidrQHiVpWcuy8Fcpg==
X-CSE-MsgGUID: YK8xWQb+QRyIV3NDnAUJYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="49183671"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="49183671"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 07:39:38 -0800
X-CSE-ConnectionGUID: oihc9zcPT9+iLCXCeMuWsQ==
X-CSE-MsgGUID: /BaSr4TGTdCqJ5xJkvnMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137441493"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2025 07:39:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZtsD-000Wh5-23;
	Mon, 20 Jan 2025 15:39:33 +0000
Date: Mon, 20 Jan 2025 23:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Joerg Roedel <jroedel@suse.de>
Subject: include/linux/kern_levels.h:5:25: warning: '%s' directive argument
 is null
Message-ID: <202501202346.wwLQkkI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: 59833696442c674acbbd297772ba89e7ad8c753d iommu/vt-d: dmar: replace WARN_TAINT with pr_warn + add_taint
date:   4 years, 10 months ago
config: x86_64-randconfig-161-20230920 (https://download.01.org/0day-ci/archive/20250120/202501202346.wwLQkkI9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501202346.wwLQkkI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501202346.wwLQkkI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/jump_label.h:250,
                    from arch/x86/include/asm/string_64.h:6,
                    from arch/x86/include/asm/string.h:5,
                    from include/linux/string.h:20,
                    from include/linux/uuid.h:12,
                    from include/linux/mod_devicetable.h:13,
                    from include/linux/pci.h:27,
                    from drivers/iommu/dmar.c:19:
   drivers/iommu/dmar.c: In function 'dmar_parse_one_andd':
>> include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:306:16: note: in expansion of macro 'KERN_WARNING'
     306 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/iommu/dmar.c:444:17: note: in expansion of macro 'pr_warn'
     444 |                 pr_warn(FW_BUG
         |                 ^~~~~~~
   drivers/iommu/dmar.c: In function 'warn_invalid_dmar':
>> include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:356:24: note: in definition of macro 'printk_once'
     356 |                 printk(fmt, ##__VA_ARGS__);                     \
         |                        ^~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:387:21: note: in expansion of macro 'KERN_WARNING'
     387 |         printk_once(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~~~~~
   drivers/iommu/dmar.c:832:9: note: in expansion of macro 'pr_warn_once'
     832 |         pr_warn_once(FW_BUG
         |         ^~~~~~~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
