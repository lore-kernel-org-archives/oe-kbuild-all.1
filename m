Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21496367B93
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782974256; cv=none; b=iQY7aEXcniNowLId5FIONXvs4xnGQTnVOg6+fStTuXxLmwhajEBc20uyzHmpwsmg/Da0cMvbjKbhhqxyI8bIXu8mZtuhc2yWYipPDgNVj4q0nPXC8m7qvsGt/+1QPs56ac+/qkI4ik8FXtvr2IAKT4a5SWXYllgmow897vSZr14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782974256; c=relaxed/simple;
	bh=TQ8FN4WHlyOMPWyQEapW1a3x8HtKn83Z7KW69SMx21U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LyZ0nqxeTByZySJIR5VLG3345mrMD4KjlIh2oHo1w3wZzYGCm5qQX5OXsoCucDCMmLuOPMYA2jcLAeh9r++MHY37W5W3AmghHbQpILbGoOzSIxMR8un6B6CrUPCca2KdajIo6bgFMHQVP76GHx4UZvuY9nLTZHeg6QoGx1Ke3bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYUpnHic; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYUpnHic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782974255; x=1814510255;
  h=date:from:to:cc:subject:message-id;
  bh=TQ8FN4WHlyOMPWyQEapW1a3x8HtKn83Z7KW69SMx21U=;
  b=NYUpnHicfTXY5LzRWiWmWi5kA09ToqNq8nuaJlnPkwzxbjphaWSBAlqR
   gi97P2dYXVBqm33MqxrvIvwAyZAj+OUwsy87XfKT/4J4ULlFV5pgdfzJj
   A3m6Swg8+K0bdHn+pl/iVEjr/1dtxT8w0ESCgWN/knTiWKBJHNPf0SO57
   xQFOjL6hNiLO9VTOhjnYuTwCkNrV4M5+u8H8MI2jF2zRiaY1rbRBJhmtx
   usDd69O3RGDWhi4ZsBieYX9pwsiyobu5+AOEOrlSFpIDQAmqsSRTYtwKD
   mA/vwkaAAff8MN5gUFOR2KXqQOXjq7eLFIYRh3aO/7slscqxnGABE+uvf
   A==;
X-CSE-ConnectionGUID: y5ht2MmOSFqIViCulPdMEw==
X-CSE-MsgGUID: 2Y7Sdb4/R7OR0+Pgypvrjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87630347"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87630347"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:37:34 -0700
X-CSE-ConnectionGUID: XCLHzO62QzukQwsK+aepgQ==
X-CSE-MsgGUID: EMhE4pJERvi8MvNyqrU6vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="246421999"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jul 2026 23:37:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfB3C-00000000A6F-3hSo;
	Thu, 02 Jul 2026 06:37:30 +0000
Date: Thu, 02 Jul 2026 14:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 0/1]
 kernel/sched/core.c:198:35-53: opportunity for
 str_enabled_disabled(sched_proxy_exec ( ))
Message-ID: <202607021459.1aY0qhXh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   1820d6db23bfd13e77fd48752705da1ea203d091
commit: ab57c5d354dad6e7eebcb10a7c831f4d36d658a8 [0/1] ANDROID: sched/core: Improve boottime output so we can detect if proxy-exec is enabled or not
config: i386-randconfig-052-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021459.1aY0qhXh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021459.1aY0qhXh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:198:35-53: opportunity for str_enabled_disabled(sched_proxy_exec ( ))

vim +198 kernel/sched/core.c

   193	
   194	static int __init setup_proxy_exec_toggle(void)
   195	{
   196		int retval;
   197	
 > 198		pr_info("sched_proxy_exec: %s\n", sched_proxy_exec() ? "enabled" : "disabled");
   199		sched_proxy_exec_kobj = kobject_create_and_add("sched_proxy_exec", kernel_kobj);
   200		if (!sched_proxy_exec_kobj)
   201			return -ENOMEM;
   202		retval = sysfs_create_group(sched_proxy_exec_kobj, &attr_group);
   203		if (retval)
   204			kobject_put(sched_proxy_exec_kobj);
   205		return 0;
   206	}
   207	late_initcall(setup_proxy_exec_toggle);
   208	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
