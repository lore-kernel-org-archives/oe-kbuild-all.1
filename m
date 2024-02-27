Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83966FC6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709006835; cv=none; b=hQ63mNAd2BVKQOHeF0j7vNlJxSFS/JJyn+g2nWuRf9FSzXVwpqdikTfnGH//8u8DXBErIaL/2tA/k8TTMQuInUpuArboIl4ieJwLPJ/5OYlOwC6NakcSnGcAvisIAu3mUF+Ge03d5VvUop8OgNtAjGe/TUd0nkFqrf/rzKaX5PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709006835; c=relaxed/simple;
	bh=PX67wtWhns/JTgxCenq7wJ4iLwPgoWbtkjG6mmUFrsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b1L7QtkVFyPrxtIj4go7VI4yRZsoNnq/zGrh7fJkK8BUfq38rkJC5k65cXdwYiO3V8pkfOPdHEFKpSEHMMiibEfZMws4sfdG9mcsIi4t2bg0dyEj+piSqnPKmQHIQ33Zv1Jl97bKW6h+4UibDiHqUV/HdK4lepPzpAWnHEhinog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ba27Vkno; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ba27Vkno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709006834; x=1740542834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PX67wtWhns/JTgxCenq7wJ4iLwPgoWbtkjG6mmUFrsI=;
  b=Ba27Vkno9+jBmAVF/w1ezePB+pRGLhdhn/jYNFin4eSDkO6CsqjLzo1t
   BxFdvYwJDpfESoice1DegFwNlyIlaX/eGB78QYnBBiA4DEkyp0dTr5nw4
   meLFz9ijMMqwqSDl7V0jMNtoZGhVEnORzSC2sMPv5lFInydHMilwNREqe
   +gzQrus7QF7rU6t6JvVsdSxvSmGHcAOfiulfwqyRCV7X/ejx0NTRCgqtG
   /men9HRmbRWwamHZOwyhTVc15AKHmAtFgZ3mMkVuvSJcqmwSqMh77eWxw
   iQ5Vp6yc/E5L6G2YzFrywCjTTselViEQJDP2WNefwkNx+8gH8gKCQ8K1m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3884443"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3884443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 20:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11519628"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2024 20:07:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reokH-000AvP-0a;
	Tue, 27 Feb 2024 04:07:09 +0000
Date: Tue, 27 Feb 2024 12:07:02 +0800
From: kernel test robot <lkp@intel.com>
To: Szilard Fabian <szfabian@bluemarch.art>
Cc: oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo 40/50]
 drivers/platform/x86/fujitsu-laptop.c:275: undefined reference to
 `battery_hook_unregister'
Message-ID: <202402271126.3bEzgRFo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo
head:   cd4525993e49f1449e9380bd28fa1179b05c911d
commit: 611d56d76dee8fb4a362cda7eec787cec70dac75 [40/50] platform/x86/fujitsu-laptop: Add battery charge control support
config: i386-randconfig-006-20240227 (https://download.01.org/0day-ci/archive/20240227/202402271126.3bEzgRFo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271126.3bEzgRFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271126.3bEzgRFo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/platform/x86/fujitsu-laptop.o: in function `fujitsu_battery_charge_control_remove':
>> drivers/platform/x86/fujitsu-laptop.c:275: undefined reference to `battery_hook_unregister'
   ld: drivers/platform/x86/fujitsu-laptop.o: in function `fujitsu_battery_charge_control_add':
>> drivers/platform/x86/fujitsu-laptop.c:265: undefined reference to `battery_hook_register'


vim +275 drivers/platform/x86/fujitsu-laptop.c

   242	
   243	/*
   244	 * These functions are intended to be called from acpi_fujitsu_laptop_add and
   245	 * acpi_fujitsu_laptop_remove.
   246	 */
   247	static int fujitsu_battery_charge_control_add(struct acpi_device *device)
   248	{
   249		struct fujitsu_laptop *priv = acpi_driver_data(device);
   250		int s006_cc_return;
   251	
   252		priv->charge_control_supported = false;
   253		/*
   254		 * Check if the S006 0x21 method exists by trying to get the current
   255		 * battery charge limit.
   256		 */
   257		s006_cc_return = call_fext_func(fext, FUNC_S006_METHOD,
   258						CHARGE_CONTROL_RW, 0x21, 0x0);
   259		if (s006_cc_return < 0)
   260			return s006_cc_return;
   261		if (s006_cc_return == UNSUPPORTED_CMD)
   262			return -ENODEV;
   263	
   264		priv->charge_control_supported = true;
 > 265		battery_hook_register(&battery_hook);
   266	
   267		return 0;
   268	}
   269	
   270	static void fujitsu_battery_charge_control_remove(struct acpi_device *device)
   271	{
   272		struct fujitsu_laptop *priv = acpi_driver_data(device);
   273	
   274		if (priv->charge_control_supported)
 > 275			battery_hook_unregister(&battery_hook);
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
