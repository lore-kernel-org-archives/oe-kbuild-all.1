Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DFF1F5EA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749993963; cv=none; b=pDZ5OAGO0dwOYBTpOyZCz2YOxG7r521b7nagPNyJ/QiWu2W/ap9q0wQ+cbTQjABUTefy9aaJ6bSeK6Gnz946+fW/WeKM32kn0rZpdWS6j2x9Fza4KOoxqgj2Gx8no7s+ZsqgORqTzAWw1OnIbtV/UBmgzdDAaxD864980/MONAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749993963; c=relaxed/simple;
	bh=7Zz7Dqn+54oMPdCNVSMUyQEOg+fOv6f2ERWBCcwPl9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akO1Vb8H1CFkcdNQXqA2G4w/Hecb0cGITpfjLOcsXitJgfi5I4Cb0mxVYdHaUlhk4XYiv4pm3F35M/r1ibsUYaXe2/T4d30ThhJ7VTh0QDAbZ9sIlXWGC7z7TmYwwuLR8+SlJlpp2sh9kZ5LcQHZpCkjl3M/MByx+SUfm4Gnt/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+FWZBsL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+FWZBsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749993962; x=1781529962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Zz7Dqn+54oMPdCNVSMUyQEOg+fOv6f2ERWBCcwPl9o=;
  b=l+FWZBsLovKaV8rzAufdMlx/AHjk/jSRHfzwuaw4hZEcFjvqjqz5klYZ
   hmRu7Y/ahnwhjndlexjTUfbc9cyqTA3l1jpQHxTHXKC/EUChDN3/tiqm2
   4QEMDr80rNYZP4kNAsiRMo/bApagTb/ne3NdHVXNUUXyKmc/l2KZbB3Sn
   MYvdxFpdASAv7y8yL5N/disTUUqBiN/va1GeG3UszwV6LRewWhaIiFHRn
   monWk3kdff3HbLUV7Wy8Gj3ZtqLHVdo7pYiqUUBhmqE+lHEcOElwdfFsh
   igMmhMsmmXFqonek6llO1zapwzMs1YS/aXhi7jkdvRltwV+gKzXoTG3Vj
   g==;
X-CSE-ConnectionGUID: vSPguTVQQZGQYfgXQm1eHg==
X-CSE-MsgGUID: UD+7nD3jSa+OuYRiFxZsog==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52240022"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="52240022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 06:26:02 -0700
X-CSE-ConnectionGUID: BQyJvKStR0+XbErSxfJQhQ==
X-CSE-MsgGUID: 6bL0rOCNSPOTe57x7B5D7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="148621452"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jun 2025 06:26:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQnN0-000ELU-0Y;
	Sun, 15 Jun 2025 13:25:58 +0000
Date: Sun, 15 Jun 2025 21:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-rsslro 31/61] kismet: WARNING: unmet
 direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
Message-ID: <202506152119.oO4hqvkD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-rsslro
head:   b17cf8cf3f5c81caacf7ef16812b79e57c99078b
commit: f0ce78d2e4b38db43728486f89ba62749d9488c8 [31/61] net: pcs: airoha: add PCS driver for Airoha SoC
config: alpha-kismet-CONFIG_FWNODE_PCS-CONFIG_PCS_AIROHA-0-0 (https://download.01.org/0day-ci/archive/20250615/202506152119.oO4hqvkD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250615/202506152119.oO4hqvkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506152119.oO4hqvkD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FWNODE_PCS when selected by PCS_AIROHA
   WARNING: unmet direct dependencies detected for FWNODE_PCS
     Depends on [n]: NETDEVICES [=y] && (ACPI || OF [=y]) && PHYLINK [=n]
     Selected by [y]:
     - PCS_AIROHA [=y] && NETDEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
