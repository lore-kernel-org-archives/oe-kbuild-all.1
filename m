Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D5821A451
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698771; cv=none; b=D2IM+26r2GcUKeN7x17cFkFCDdoZrmmCGL3IXsytSt6/atSNlt5P0ecWXpOx5iy2YGOtuR0e1RhQAAfGBN6fsENr2WKnkb0urgpWicHjRjmfpKJzUwk8p1maezK8nPJAmNEqjaVce4y8VKWLOFYeT+xVjFTwEpFCGKhiJMYymJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698771; c=relaxed/simple;
	bh=WOypisEG37Y4da/zDtpcs+bIAu9C1Mk44DhipZwavQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JcXkZI9LSZyzBx22hKBpnKiMe/V7h4k8Jg3j7aOZU+xCsdm1nqkdSr53jgRHp19LtElJuzB98j5PIXAHE56th69+EqfEGRqbUSo91wO/qya21aKz5eEYzP3cqbt2SKdvvBWfHqf22YgTq+Jl8b9/s2SHPFMpnNzMV+gHiGH990E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvTFXfUb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvTFXfUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738698770; x=1770234770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WOypisEG37Y4da/zDtpcs+bIAu9C1Mk44DhipZwavQ8=;
  b=ZvTFXfUbazICQX6J94FvBFepcJ9f7Hiv6R6AaqbP34QzVi+d7A9i6LkY
   HNmoUMdRiQ7Y4zar7eOK1/B5iomZ8mboQ4dwc57+SG8mS1iV0KozwWyqU
   2RbtvOXQLOd6rCt7LSQKG2HjD3Aw0puiQQHOkdTcckOfFIEigFZN82R6u
   /HGOcscqU8N/Vk+bPBMx+jhf46nQzfG3M2f/fZLaZx8Odi0eSXcbnd4Q0
   WFXpRbqrSC/tEe0ttUOLYif4HIOkvtdmWFceIPrm7iZszBuGx9q3hPRRb
   KikIswVrclaNJG52cOK4nYYN6V2GEzstUeNtdh71Yd8jnBJ9FoInrilxH
   g==;
X-CSE-ConnectionGUID: XmM1mcEhRKGp/dn5KYUwSw==
X-CSE-MsgGUID: 02o24KPNS8CXB/GUTEhiBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56668874"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="56668874"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:52:49 -0800
X-CSE-ConnectionGUID: jKErIzf4TTWq3OfdAXHrhQ==
X-CSE-MsgGUID: IeBTmQzvQGmrgyRaxsvvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111558465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 11:52:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfOyU-000swN-0A;
	Tue, 04 Feb 2025 19:52:46 +0000
Date: Wed, 5 Feb 2025 03:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 9/32] include/linux/device.h:1190:47:
 warning: 'device_hotplug_capability' defined but not used
Message-ID: <202502050333.yzwexx3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   851ac9021aaff981d3e2a6e701cff809f38b22c3
commit: 20938ba5a67fab6489f0ac9c1794318447328717 [9/32] driver core: Annotate locking functions in <linux/device.h>
config: i386-buildonly-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502050333.yzwexx3c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050333.yzwexx3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050333.yzwexx3c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> include/linux/device.h:1190:47: warning: 'device_hotplug_capability' defined but not used [-Wunused-variable]
    1190 | static struct {} CAPABILITY("device_hotplug") device_hotplug_capability;
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> include/linux/device.h:1190:47: warning: 'device_hotplug_capability' defined but not used [-Wunused-variable]
    1190 | static struct {} CAPABILITY("device_hotplug") device_hotplug_capability;
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/device_hotplug_capability +1190 include/linux/device.h

  1189	
> 1190	static struct {} CAPABILITY("device_hotplug") device_hotplug_capability;
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
