Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32A148314
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358363; cv=none; b=A9rjqCK96Xcgdna0PUK0Slqm86qZOJ2K7sWS6kpA3X9k+HLIQ891eC2s9s6/03y53bOZK9viyTzxhojMyhlL/bdvQEEaF/3LdjjPi6ambvkOJuWAJmxRHldr12RkdNfGOfpjAzW4jRUAp2+D6f3HTxJX+AAvzUXURBvq8hwEzMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358363; c=relaxed/simple;
	bh=9v6hKgPnRLsOnlL2242IEQo4g1F5/OPIK6uAUwZ7R0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EIGob1VYstnJ878dc3DZwAQaYMFSgae2fJeQXIxUYSoN0o3tRZdOd16UWjU+Q89iA/HJs6sltaAK0gbMQRLYzaPywI89R8NfWOvXspx7ODH0RJ2kXNpPrsO21JHBWFMTqbkhZ6xUmaKdr+a9DJ768KLdrFM3yB/z2g7lG5UgULY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlzMkznm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlzMkznm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730358361; x=1761894361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9v6hKgPnRLsOnlL2242IEQo4g1F5/OPIK6uAUwZ7R0U=;
  b=WlzMkznmJwx8FIzYj8kWTYxtTO0xRAj2xfBIHclozbngvowKLuIU3aHI
   qD9FknRhtRCl08oUJxyQTX2GON0aFmeBbuHKdDMia5Iebxctnoc7tCiQR
   iHgwck6SUppgK/FnapR03Z5RF1Op9wZc2uNdQDDrwoEOogrNzFvFJVrV7
   q+zg2w5J347ZP3GpGYo4Omx1y1RxH6oOmlM1dEmcGmJhvsrVS2X+tROjo
   4KS55uin3qP3uLqRD7ufg734BHbyrl8yjsOqGzpBzeobmClc+9O9gWONt
   AcCeYJShgXQNOvZ5M2brogfjAbOPJUAz8fl0DFOJEBH5vkKGQH5QP5a6u
   w==;
X-CSE-ConnectionGUID: tWN+SrotSDOsuptwCdi0Yg==
X-CSE-MsgGUID: iOco2stgTxGyPQvVYFL/Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47558263"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="47558263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 00:06:00 -0700
X-CSE-ConnectionGUID: cmva6FhUSXa/1SDZHDXabg==
X-CSE-MsgGUID: 0SJspJJ6SrSieuGJQbXCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113338314"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Oct 2024 00:05:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6PFk-000fmi-2W;
	Thu, 31 Oct 2024 07:05:56 +0000
Date: Thu, 31 Oct 2024 15:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15243/23920]
 arch/arm64/kernel/mpam/mpam_device.c:99:24: warning: no previous prototype
 for 'mpam_component_get'
Message-ID: <202410311541.Ld1wpJ0T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c6de47cf1f63ecc3ed337601e06ab8dc1c707563
commit: 73d5cd426ed0b4aed565a11aa8eb86d90b444d94 [15243/23920] arm64/mpam: Add mpam driver discovery phase and kbuild boiler plate
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241031/202410311541.Ld1wpJ0T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311541.Ld1wpJ0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410311541.Ld1wpJ0T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/mpam/mpam_device.c:99:24: warning: no previous prototype for 'mpam_component_get' [-Wmissing-prototypes]
      99 | struct mpam_component *mpam_component_get(struct mpam_class *class, int id,
         |                        ^~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:190:1: warning: no previous prototype for '__mpam_device_create' [-Wmissing-prototypes]
     190 | __mpam_device_create(u8 level_idx, enum mpam_class_types type,
         | ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:248:12: warning: no previous prototype for 'mpam_discovery_start' [-Wmissing-prototypes]
     248 | int __init mpam_discovery_start(void)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:256:12: warning: no previous prototype for 'mpam_discovery_complete' [-Wmissing-prototypes]
     256 | int __init mpam_discovery_complete(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:261:13: warning: no previous prototype for 'mpam_discovery_failed' [-Wmissing-prototypes]
     261 | void __init mpam_discovery_failed(void)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/mpam_component_get +99 arch/arm64/kernel/mpam/mpam_device.c

    98	
  > 99	struct mpam_component *mpam_component_get(struct mpam_class *class, int id,
   100							bool alloc)
   101	{
   102		struct mpam_component *comp;
   103	
   104		list_for_each_entry(comp, &class->components, class_list) {
   105			if (comp->comp_id == id)
   106				return comp;
   107		}
   108	
   109		if (!alloc)
   110			return ERR_PTR(-ENOENT);
   111	
   112		comp = mpam_component_alloc(id);
   113		if (IS_ERR(comp))
   114			return comp;
   115	
   116		list_add(&comp->class_list, &class->components);
   117	
   118		return comp;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
