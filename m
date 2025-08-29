Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090F4207A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756503528; cv=none; b=R8AB2lAL38MSbxSOswW/Urloi4CTmQjvlTeDVlIbA2uNtaZPjOysHKD9HGYxmAQ/pyxrp2UkgPAOEXglTSrYfJFgZLw4GYfhNJki1OlSu32UX2tTBO8SRJy+kI9T358h82WOnLVyC9JHp7pIVYIj09eDyhSc8m6oJPwZNmn0jfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756503528; c=relaxed/simple;
	bh=wnooBNALWXL2Le0V+3NQG1rf7d6Hh5/yT8qzXsSPRfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzXlRm/xrtyEpGOH9pAPRW16t6bltZDyouXdaIjvo5C3BxuWWPwKjVUU8Oe0K7PhB6nJl9yy8zWVtJJVsbHpVW9ezoswBBJc5k3sOe2Mt2cnB/9ZxwKNoLE48UFgbgPbnOaaDBUJwZZ1lbDsn/auud+nD0/YsRwohwO+TUHSYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dX2Ei1W6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dX2Ei1W6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756503526; x=1788039526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wnooBNALWXL2Le0V+3NQG1rf7d6Hh5/yT8qzXsSPRfw=;
  b=dX2Ei1W6agXFQf1Thxod1Gzppzv5qgut/G/VHl+ebHXQ1GNKPeD+KLoA
   9CylUSMY7EndtFhVjvJu4zlaAybYuPGp97snGebdeFXKVYyiTW4MFDD78
   zAZcKCyUswW+RaLFNR42ilGajDqaYLAkM5IgyA562KxY0ASgKZ4lUHX37
   YAJ8wO4hoz2THi2vV8G1sXdaMWcXhiGruaHJIQQMfonZuWUnnCwCL9imS
   IuN6zvNmwSEgIpIlz8Hp6v2fu+ROJsJYOBM2iJcXdvQ+3sghPzYK4qMrZ
   0wrB1aFDj0tNKKDVxnLEeDi+vuodVXqicSPtfyM5lQ1cZElPZ64uqQoUF
   Q==;
X-CSE-ConnectionGUID: Jw4+HNYbRP2VPlkIam83FQ==
X-CSE-MsgGUID: 4QvvLkgZSWi0fN1JfvDq+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62633025"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62633025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 14:38:46 -0700
X-CSE-ConnectionGUID: 1mEB/XOpQNqqF4LEnlu9jA==
X-CSE-MsgGUID: i940bKgxREulrQ5dRBg2zg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Aug 2025 14:38:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us6ny-000Uzf-1C;
	Fri, 29 Aug 2025 21:38:42 +0000
Date: Sat, 30 Aug 2025 05:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Huisong Li <lihuisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [linux-next:master 3555/5283] include/acpi/processor.h:451:13:
 warning: 'acpi_processor_unregister_idle_driver' defined but not used
Message-ID: <202508300519.tZQHY6HA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cace99d63192a7250461b058279a42d91075d0c
commit: 165e98b379d88fa95bf703989c1eb64732c39bad [3555/5283] ACPI: processor: idle: Optimize ACPI idle driver registration
config: arm64-randconfig-001-20250830 (https://download.01.org/0day-ci/archive/20250830/202508300519.tZQHY6HA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300519.tZQHY6HA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300519.tZQHY6HA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/acpi.c:33:
>> include/acpi/processor.h:451:13: warning: 'acpi_processor_unregister_idle_driver' defined but not used [-Wunused-function]
     451 | static void acpi_processor_unregister_idle_driver(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/acpi/processor.h:448:13: warning: 'acpi_processor_register_idle_driver' defined but not used [-Wunused-function]
     448 | static void acpi_processor_register_idle_driver(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/acpi_processor_unregister_idle_driver +451 include/acpi/processor.h

   443	
   444	static inline int acpi_processor_hotplug(struct acpi_processor *pr)
   445	{
   446		return -ENODEV;
   447	}
 > 448	static void acpi_processor_register_idle_driver(void)
   449	{
   450	}
 > 451	static void acpi_processor_unregister_idle_driver(void)
   452	{
   453	}
   454	#endif /* CONFIG_ACPI_PROCESSOR_IDLE */
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
