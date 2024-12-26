Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A6653
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 01:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735175449; cv=none; b=RYA1lgGx694rR/ITVk5yc0oCtKguDdKMriXEWEx4WaxByVjrYv9Tndstv3Mm5C9LG7eMuVfVl+JyGvZfNANhl+ZaD29HfvNz0vB5oZP0d14eOb+1j63vgSETWYWdosygrep1li75URJOlLc3IR5lJ2dAVUARF/LnJaD1JJZV+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735175449; c=relaxed/simple;
	bh=+Apw7aU03tAZukcA32OEnzzXSJ4hrENBYVvXzvYuXXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MlmmiaNQmIN12ysr/Qx9L+RZnINe7q5vSoTDfQa0qhjNelXsRbMB/CiZhuybUX5kA/b7BKA+KMWTB0GW3mQfDHZztPv+7d3VmEmhLAak8U+GJE2fbj+br+cXVqH3P7FwkAFYW4tLXFGM41KoXpOvMVnWwhLjFnUoFQnt4ZZeJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0bj0kaX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0bj0kaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735175448; x=1766711448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Apw7aU03tAZukcA32OEnzzXSJ4hrENBYVvXzvYuXXU=;
  b=a0bj0kaX+UjUMHgKUOppc617y1HHBaUgdXgJpTumcDOsmvgEqwx91Eqm
   EHfLRXzlYkQaPq6X0bsvOW40Ev8XvQJaxVXMiQ0a0h/OEzfh7hz6UaOT9
   zAlp2YLk3VOOQAeSyBjiqDKUWEe8+EUqfV4OPXtoV0pylDZVDxfv7P/qw
   z0RI2BTbmG1p8ItPiAxOYuMn6dXMAVmuUL2kdlxs/6Hyo+Oa6aYNqJgts
   vTJUM/DqyIMzDn3TtRD5oEjdt+XmjOmIGqJvw6QgBxj+XDCMNsI4KUM/y
   iCtgVNi0ega/rh0rTXm+BXM4MLbOhGuPs+4y2r4LgjG/j6uxTUXUwULt0
   w==;
X-CSE-ConnectionGUID: gp3qj58OSI68mTnPH6wroA==
X-CSE-MsgGUID: wVFh3/inTqGhxQB0BuWPrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="53131224"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="53131224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 17:10:47 -0800
X-CSE-ConnectionGUID: gYpTt0KnQP6pjHpBl8VO2Q==
X-CSE-MsgGUID: 6PeXCsFcQcijo2tj99J8bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="99555093"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2024 17:10:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQcOi-0002G2-0D;
	Thu, 26 Dec 2024 01:10:44 +0000
Date: Thu, 26 Dec 2024 09:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1662/1662]
 arch/loongarch/kernel/legacy_boot.c:55:26: sparse: sparse: symbol
 'pchlpc_default' was not declared. Should it be static?
Message-ID: <202412260917.psyTzlga-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   17d734cf11b0235f16580f53a6cb52660a38c77d
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [1662/1662] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r131-20241226 (https://download.01.org/0day-ci/archive/20241226/202412260917.psyTzlga-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241226/202412260917.psyTzlga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260917.psyTzlga-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/loongarch/kernel/legacy_boot.c:39:19: sparse: sparse: symbol 'liointc_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:40:19: sparse: sparse: symbol 'pch_lpc_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:41:19: sparse: sparse: symbol 'pch_msi_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:42:19: sparse: sparse: symbol 'pch_pic_domain' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:45:5: sparse: sparse: symbol 'nr_io_pics' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:48:26: sparse: sparse: symbol 'liointc_default' was not declared. Should it be static?
>> arch/loongarch/kernel/legacy_boot.c:55:26: sparse: sparse: symbol 'pchlpc_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:61:26: sparse: sparse: symbol 'eiointc_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:62:26: sparse: sparse: symbol 'pchmsi_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:63:26: sparse: sparse: symbol 'pchpic_default' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:94:6: sparse: sparse: symbol 'register_default_pic' was not declared. Should it be static?
   arch/loongarch/kernel/legacy_boot.c:341:14: sparse: sparse: symbol 'bpi_init' was not declared. Should it be static?

vim +/pchlpc_default +55 arch/loongarch/kernel/legacy_boot.c

    54	
  > 55	struct acpi_madt_lpc_pic pchlpc_default = {
    56		.address = LS7A_LPC_REG_BASE,
    57		.size = SZ_4K,
    58		.cascade = 19,
    59	};
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
