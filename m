Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF96422F19
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 19:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710013360; cv=none; b=cyEI49PAryonFXyAYXqenoWzew5tZEfk6yw2K9eqRq9Yg/ewTmTDDdMm/SKj5kbgyabSFh53oCRfzhE0+GknveEmhtob/5X7nRlpekSAmn8u086JmTJq6QyOTMEsErYhSUIN6YPIZKfZLt26KadYtCM/J7OoMwViz2pjn2GsGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710013360; c=relaxed/simple;
	bh=v6dDPcJtfnSkYx/1v6JfT3s6gDrDq1SiaPONe2cN6hE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHM68condj+5VJPPemIIQjbF2Fx1AJSDT4XOtqyEJCR8h89aVaMqnAyfqjh81PIFNlNdw44L/g4hWwO6j9OUk+nGiH+duD3CefToQF6Lim0eEe1krgIMKgEd1HV0GxTREVstbZ06UT93sc6h72kQcm6Q8AcyaRnmfxcQ9kNJhfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNudmuuz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNudmuuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710013359; x=1741549359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6dDPcJtfnSkYx/1v6JfT3s6gDrDq1SiaPONe2cN6hE=;
  b=gNudmuuz7VQGgbsUla70C1Rfba+/9D0coVGcMKyTzuHfDyIVXM8pTF4V
   sUwutIGnoKMSx+HzvXDsFnAFeDrrcpO5tiwxK8DqriPShgzdjvYwIVh3n
   zxhAzhU+kKOj4kKx8cg918LdoMZCF/c7TZK0cqqBTi0riJ3YeaBMAGzvL
   rbdtrNZfT+HLJEatTHlNVCYjNUY377LPmm7iyx7q8/REAHRC/6rh1WM0I
   1mQSYVE9zf53btyLQDV1mHLxkC5w+zi5n/alRSoP5bOaVDq1PQ96Pj7/+
   X7PaSqCmT56fyFnsyFie+nivECCFYYxxLLD/9MpmUaazb4a2CDw3nomzV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4898481"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4898481"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 11:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="11177393"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2024 11:42:37 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj2aY-0007cB-0v;
	Sat, 09 Mar 2024 19:42:34 +0000
Date: Sun, 10 Mar 2024 03:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [hyperv:hyperv-next 3/4] arch/x86/kernel/cpu/mshyperv.c:353:5:
 warning: no previous prototype for 'hv_get_hypervisor_version'
Message-ID: <202403100302.ZXrhQTqa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   65530a174ea36a9d5eee3c62523f088ecdf2d874
commit: 1634df06ea125911c4a9afdcd1729d57fdd4f48e [3/4] mshyperv: Introduce hv_get_hypervisor_version function
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240310/202403100302.ZXrhQTqa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100302.ZXrhQTqa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100302.ZXrhQTqa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mshyperv.c:353:5: warning: no previous prototype for 'hv_get_hypervisor_version' [-Wmissing-prototypes]
     353 | int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hv_get_hypervisor_version +353 arch/x86/kernel/cpu/mshyperv.c

   352	
 > 353	int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
   354	{
   355		unsigned int hv_max_functions;
   356	
   357		hv_max_functions = cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS);
   358		if (hv_max_functions < HYPERV_CPUID_VERSION) {
   359			pr_err("%s: Could not detect Hyper-V version\n", __func__);
   360			return -ENODEV;
   361		}
   362	
   363		cpuid(HYPERV_CPUID_VERSION, &info->eax, &info->ebx, &info->ecx, &info->edx);
   364	
   365		return 0;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
