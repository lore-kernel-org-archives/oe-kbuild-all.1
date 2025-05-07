Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7841D432D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600204; cv=none; b=m4s+WdqDYGGosipjBE0MPGjFncBPiT6gZ/2hwCh9AxQYMhoy+4WLG1S2V5w4GTvpWpu+oPv7vgE8n6f3Izgx7HRpjo14pu4GMiYKxHdaVAFpzEmn+N0Omy0Mzg2NDUGC49Cczls6ZVfV6aV605Sm0nUzALZC3KqxZ0itB3loCUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600204; c=relaxed/simple;
	bh=lXjVAYkJhIMzdURpmhqEPOlvydzDRRnHv1Dn9zTe3Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R6KgAztMpyyxMA7HS3sy4Fc7RXV9W1Vl22I2pz0yyl+DxICB58o4uPpNDzEWMGeitCMupi/kPnpMumbHd+JZjzQ2pTMaGmaNjc13WR3JCZys5mC3gU463B+2Z+2enuqNkIwXhU2zyoyH1RfWMh+x+6pIZVbQPmN1DUyhuB+qDdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObUMnTb8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObUMnTb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746600204; x=1778136204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lXjVAYkJhIMzdURpmhqEPOlvydzDRRnHv1Dn9zTe3Xk=;
  b=ObUMnTb8+ayg5csm5fwvseRUWDQM1YaLj8HGv8uib9XM/8GaNTkh5gL+
   216wt4gl1yj8MDj6q2gm/9mf8x5w2KwKxe4t7fGjaTMIgrr1wXGZN2ZOX
   ATaaGCT6mHE0bqps11OZeKI3lXb/7R1Mi4cdo2AsLdPRVed7EOObOj73Z
   gGnC18XroNu1mX7lvfB/kxjgezmAvRohzmfT4Viyh+Qr03Vb9dndzbjjv
   KW3pdOosbaroy+6Aymi7EzCWLcmPpKcr4TbRAeKkRo/c34xaAeTY8Z07h
   xikwZPspwzXkwQ+esaPR1EqSgPutWIQFODxwyKrKb+0cmGDsVv7hMtECf
   Q==;
X-CSE-ConnectionGUID: mhK60uybSliiphj406aIAA==
X-CSE-MsgGUID: 9Wt5g3mCSQCZxavSJVuHgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48458740"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48458740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:43:17 -0700
X-CSE-ConnectionGUID: +Z5b0KS5QRSDyvMsSZhckQ==
X-CSE-MsgGUID: +cIdOOtlSP+Qsy/HrCaXbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136380767"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2025 23:43:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYUq-0007Dr-0l;
	Wed, 07 May 2025 06:43:12 +0000
Date: Wed, 7 May 2025 14:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulf-hansson-pm:psci_s2idle_deep_v3 3/9]
 drivers/firmware/psci/psci.c:84:13: warning: 's2idle_deep_enter' defined but
 not used
Message-ID: <202505071413.IG2aO4VR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linaro.org/people/ulf.hansson/linux-pm.git psci_s2idle_deep_v3
head:   dece57a7457f9f17a347fe697fb32b613e6c0c1c
commit: 4aa4d00e19ea23ea87b524a423885e3bbee1a6d4 [3/9] firmware: psci: Add debugfs for deep s2idle
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505071413.IG2aO4VR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071413.IG2aO4VR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071413.IG2aO4VR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/psci/psci.c:84:13: warning: 's2idle_deep_enter' defined but not used [-Wunused-variable]
      84 | static bool s2idle_deep_enter;
         |             ^~~~~~~~~~~~~~~~~
   drivers/firmware/psci/psci.c:83:13: warning: 's2idle_deep' defined but not used [-Wunused-variable]
      83 | static bool s2idle_deep;
         |             ^~~~~~~~~~~


vim +/s2idle_deep_enter +84 drivers/firmware/psci/psci.c

    69	
    70	#define PSCI_0_2_POWER_STATE_MASK		\
    71					(PSCI_0_2_POWER_STATE_ID_MASK | \
    72					PSCI_0_2_POWER_STATE_TYPE_MASK | \
    73					PSCI_0_2_POWER_STATE_AFFL_MASK)
    74	
    75	#define PSCI_1_0_EXT_POWER_STATE_MASK		\
    76					(PSCI_1_0_EXT_POWER_STATE_ID_MASK | \
    77					PSCI_1_0_EXT_POWER_STATE_TYPE_MASK)
    78	
    79	static u32 psci_cpu_suspend_feature;
    80	static bool psci_system_reset2_supported;
    81	static bool psci_system_off2_hibernate_supported;
    82	static bool psci_system_suspend_supported;
    83	static bool s2idle_deep;
  > 84	static bool s2idle_deep_enter;
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
