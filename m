Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55C2F6165
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766318042; cv=none; b=AkzWbBUt7iZxqb8JX561fv8v/YlFy2SDuEE5PgmpehxAHbHHLA4T7bM4Ml8DINA56FSfZgEWdYmx3KOP8IdMnxoUs5y/8grsIhOY6z50SCBmtYX5/BzuJYOEWy5ymegTaaeliI/XOM72bOYDFAtRtg+p2eo2BdzmiXnMS/XW4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766318042; c=relaxed/simple;
	bh=hp3YBd7gwejKN+Xdw+Pw36X8gJ6jAsxjQupt5PPPd4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZDBy0V/xy5ce5BM308d6i7x2CUqTK4MgjBQldVljznDKZ5/Nn5meCU29Yb+4slQz4JWw+UZ+FrvTcGvDGVv2IN66STaiLTwtiGxvO4TesMnDZO8jIfZybr5kEte4UFrbxdUu7KLiC+a/KPTXl4Yryu8Vi/CThWmwh+kwP76TxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFtpKlQ1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFtpKlQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766318040; x=1797854040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hp3YBd7gwejKN+Xdw+Pw36X8gJ6jAsxjQupt5PPPd4k=;
  b=ZFtpKlQ1dg4grQhTazr0gR5iVesK4lv3O4B/NyzY4WjOiOCPEJbpf77w
   pzoX4QxX/uiBDL2lhslGqeD/1ehJZrmoXp54Uq2XdYSc651klBdiWZf7P
   TP4Rks9cZVDZkqCt/WMjLBpXOZr6yanJt+wEHsdWLihB58aViRc6jba5F
   Hf/X6tQlOA8aQkHTECVGy4h56NFmrHUUEzJnStj+dtte4HLxn7jlbMoLs
   /0alwbpmKqtUz8/+yQr8FOM1+oEden5hoHMnQ2w570PSDYv/4Ua56YoYZ
   xFcnnuwMAPBPD34oOhFWylyS0ofrscZonhyfxgQtnu0Lf0uNqs7MXQL5F
   Q==;
X-CSE-ConnectionGUID: SKjmV8fgQlOpUmqWjqB3KA==
X-CSE-MsgGUID: ATzqgxySRsaczFn9X8kIUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68142438"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68142438"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 03:54:00 -0800
X-CSE-ConnectionGUID: +UwJkLqPRqCEIWT4hgGPjQ==
X-CSE-MsgGUID: MfnduaFGT46eZKNjQgT67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199313563"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 03:53:59 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXI0a-0000000051k-2MPH;
	Sun, 21 Dec 2025 11:53:56 +0000
Date: Sun, 21 Dec 2025 12:53:02 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for INT340X_THERMAL when selected by
 INTEL_SOC_DTS_THERMAL
Message-ID: <202512211233.iYEi9EJH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 3d6a1eaf80dc19835f298123ca8c1042012d0856 [12/12] FROMLIST: ACPI: DPTF: Ignore SoC DTS thermal while scanning
config: x86_64-kismet-CONFIG_INT340X_THERMAL-CONFIG_INTEL_SOC_DTS_THERMAL-0-0 (https://download.01.org/0day-ci/archive/20251221/202512211233.iYEi9EJH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211233.iYEi9EJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211233.iYEi9EJH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INT340X_THERMAL when selected by INTEL_SOC_DTS_THERMAL
   WARNING: unmet direct dependencies detected for INT340X_THERMAL
     Depends on [n]: THERMAL [=y] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86_64 [=y] && ACPI [=y] && PCI [=y] && NET [=n]
     Selected by [y]:
     - INTEL_SOC_DTS_THERMAL [=y] && THERMAL [=y] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86_64 [=y] && PCI [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
