Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB354C3BC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706510292; cv=none; b=fMDAjteSYn+RO1BA/jUgd6CqQYJ3f2JZpVPgsP+aw8AevcH+3uAV174gyto9hSM8FzdSnpVLOXh5K6Icsvs5q0iX5X1hlppx52K1wERdym3SM9KzcdCn9iWEgAcA1fTUGvzr85XK0Z9uZ0V7yutMjU5wXCTkqdgu4USfGi4NAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706510292; c=relaxed/simple;
	bh=FjgDgkipwh+6+idha6/GFchctvi5KqWQu6nh+6tfe0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFECsC69W14OxPB5S8l3NTLHeapOhFUMvukbjKu9CV2uJJc2PGH0qdA95Cca6a0bLvDsvmwNquaH/E0MVXdTI+qNXw0j/5ydyINkBiAwmeMCq57C2m1vr7vuMoyAPhjq53hn2XKyV39TP8n2+SlKlKIofPoWQ5WsZFlBRSjLfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZnp9zqA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZnp9zqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706510290; x=1738046290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FjgDgkipwh+6+idha6/GFchctvi5KqWQu6nh+6tfe0M=;
  b=OZnp9zqAiyr3ge9LD+UKdaJLBC9a9Kbi14kEiF8qTD0RNLWlqRhJzgOd
   jT2Dr6XjI61c5b0SX6yrnVQFG7Gp90sA/Ewt7ygyUsHb41rOfgWD/JW1L
   pD85ol/CJnWruiCjRieiASf0tExbEIY+ILnI7kbFQiLL75+kMuLCDjpMq
   dA2rGauSjIqzQ0E7RR1BOfS0T3M9I06oidJ2ucmfD0xIokkhC12KbZLe7
   VG334UAVjTjd4AlNb11FNr8mFKyP6GDf6fYhH8GjdbzeO/QOwv6tYS95y
   5DhTW9CGRYZk+3iBuUeHIt3cIs10tB/DZLyz0VieAR70mlw1Zzht2AIn9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9976108"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9976108"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 22:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="877966663"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="877966663"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2024 22:38:07 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rULHR-00046V-0x;
	Mon, 29 Jan 2024 06:38:05 +0000
Date: Mon, 29 Jan 2024 14:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1576/1892] s390-linux-ld:
 drivers/of/kexec.c:399:undefined reference to `crashk_res'
Message-ID: <202401291400.2iU26ixw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   596764183be8ebb13352b281a442a1f1151c9b06
commit: ad82e944d12ca472df041acb4c732bd630a81b90 [1576/1892] s390, crash: wrap crash dumping code into crash related ifdefs
config: s390-randconfig-r023-20230616 (https://download.01.org/0day-ci/archive/20240129/202401291400.2iU26ixw-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291400.2iU26ixw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291400.2iU26ixw-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
   arch/s390/kernel/machine_kexec.c:216:(.text+0x1c0): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: arch/s390/kernel/machine_kexec.c:217:(.text+0x1d8): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: arch/s390/kernel/machine_kexec.c:218:(.text+0x1ee): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: arch/s390/kernel/machine_kexec.c:219:(.text+0x206): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: arch/s390/kernel/machine_kexec.c:220:(.text+0x21e): undefined reference to `vmcoreinfo_append_str'
   s390-linux-ld: arch/s390/kernel/machine_kexec.o:arch/s390/kernel/machine_kexec.c:221: more undefined references to `vmcoreinfo_append_str' follow
   s390-linux-ld: arch/s390/kernel/machine_kexec.o: in function `arch_crash_save_vmcoreinfo':
   arch/s390/kernel/machine_kexec.c:223:(.text+0x254): undefined reference to `paddr_vmcoreinfo_note'
   s390-linux-ld: drivers/of/kexec.o: in function `of_kexec_alloc_and_setup_fdt':
   drivers/of/kexec.c:399:(.text+0x922): undefined reference to `crashk_res'
>> s390-linux-ld: drivers/of/kexec.c:399:(.text+0x944): undefined reference to `crashk_res'
   s390-linux-ld: drivers/of/kexec.c:401:(.text+0x970): undefined reference to `crashk_res'
   s390-linux-ld: drivers/of/kexec.c:405:(.text+0x9aa): undefined reference to `crashk_low_res'
   s390-linux-ld: drivers/of/kexec.c:405:(.text+0x9d0): undefined reference to `crashk_low_res'
   s390-linux-ld: drivers/of/kexec.c:406:(.text+0x9fc): undefined reference to `crashk_low_res'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
