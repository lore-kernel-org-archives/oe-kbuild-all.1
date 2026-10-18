Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759363E1CE4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 23:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365521; cv=none; b=p7S/LnOa+bVTpLcttLWaBWb5eJA1MCT7UPwDI+FtkKdKXdy3NFPemr9ImkgK0zfhqpmsg0+aYaDdc4RQQzHW4sVUnqFiZcA8rRzBNIN04Jr3ZOiSlEMX3y8GZli7G4za7xTl1I5CJMWCvfQ+cBrWwUb3Sngw9/Y8zeb95FvVqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365521; c=relaxed/simple;
	bh=EA/dU5Kla1s0/GLw7ykyNxBrgEF62XsljfA/n4xvmJw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fn7W1p80tIOKFIWTavvoJpQ4QIgYmRpey2VDZGpdHdn1oVs78RNxbmyIiVla8zgQHiuY6svkIgBcz89jL6tW3ZqcSIEqaptdYgP7rGxF3MGe35PGhfNqH5uMtLAldM4ZijbhTIWfevmCcTpXiOoYMvx1oJnQ46dqUoMrZCIvh8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TINmEfj6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TINmEfj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792365520; x=1823901520;
  h=date:from:to:cc:subject:message-id;
  bh=EA/dU5Kla1s0/GLw7ykyNxBrgEF62XsljfA/n4xvmJw=;
  b=TINmEfj6FxFJdmvWZTAynCy0g5lacF6PpzPfn4caWGQTwx490f/FMlAb
   b3RlerpGPGofmvytQTDPY9CmZS5gmrQmKHIpsIW/tdvJN+gJebVtJ6fKX
   Kc8zqWHPor1IRB9ZcPN8oo+j27bu+aZxwhoXklfgBgDV7bXK4XUZIra13
   ouHYvBIzTAOdY+vEV4fz6NZvVr/PTk0CaWgll+yDqwCQ9nOX0xKMZBmKz
   fmfuNB9qE6UJvcTh6xlWbBdGQnn3KMGXr6LU0+ygId5vNGiCohk4P+0Nt
   Q0CHMzVjnRqN3GvajFFJMbrCs7HImFhAf3v9KuWAGA34J4nBiQMjDUolz
   A==;
X-CSE-ConnectionGUID: xCz5MM+eQBuaKYaFplX6fA==
X-CSE-MsgGUID: DNRTEjmHTuWN41e2d+ZlMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1057844"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1057844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 16:18:39 -0700
X-CSE-ConnectionGUID: F/wpNjZbSZeIFyF5RuHa1g==
X-CSE-MsgGUID: qfkUN8dVRDGPp4i/9BWGGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2859052"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2026 16:18:38 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIa9D-000000005LH-0u0B;
	Sun, 18 Oct 2026 23:18:35 +0000
Date: Mon, 19 Oct 2026 01:18:25 +0200
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:cca/topics/cca-da-gmem-backend 50/59]
 include/uapi/linux/kvm.h:16:10: fatal error: asm/kvm.h: No such file or
 directory
Message-ID: <202610190135.d0Nlyr4K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LuBaolu/intel-iommu.git cca/topics/cca-da-gmem-backend
head:   6bdc5a1448b75f784490ac2061dc32ee4bd3b5a4
commit: 97be44a4a870c923a373ab6ab955385daf5e949e [50/59] vfio: Dispatch guest_memfd provider operations through the filesystem
config: csky-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261019/202610190135.d0Nlyr4K-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190135.d0Nlyr4K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190135.d0Nlyr4K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_main.c:20:
>> include/uapi/linux/kvm.h:16:10: fatal error: asm/kvm.h: No such file or directory
      16 | #include <asm/kvm.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +16 include/uapi/linux/kvm.h

6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   4  
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   5  /*
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   7   *
dea8caee7b6971 include/linux/kvm.h      Rusty Russell          2007-07-17   8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   9   */
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  10  
fb1070d18edb37 include/uapi/linux/kvm.h Joe Richey             2021-05-21  11  #include <linux/const.h>
00bfddaf7f68a6 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15  12  #include <linux/types.h>
97646202bc3f19 include/linux/kvm.h      Christian Borntraeger  2008-03-12  13  #include <linux/compiler.h>
2619da73bb2f10 include/uapi/linux/kvm.h David Woodhouse        2026-03-05  14  #include <linux/stddef.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  15  #include <linux/ioctl.h>
f6a40e3bdf5fe0 include/linux/kvm.h      Jerone Young           2007-11-19 @16  #include <asm/kvm.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  17  

:::::: The code at line 16 was first introduced by commit
:::::: f6a40e3bdf5fe0a7d7d7f2dbc5b10158fbdad968 KVM: Portability: Move kvm_memory_alias to asm/kvm.h

:::::: TO: Jerone Young <jyoung5@us.ibm.com>
:::::: CC: Avi Kivity <avi@qumranet.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
