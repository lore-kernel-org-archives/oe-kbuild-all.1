Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F9735200F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 17:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568402; cv=none; b=KisoIlCKHIUN5KXAPwvzgePKXRUCr+qLhNhy2KYtj9zLvxCcQBIsHO3HeMGOs1OyxiT2WcA813CO6uk4htdxdX+cpJVaR5kLE27iET89Xu1AV/W737Gm7wkPetpJv6kpp84C0VhPoKShykIvqOcN0SKl+oZ7M/ioz5Qfd7pDo9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568402; c=relaxed/simple;
	bh=xlsc99enQRlhDoNtVNHsiy0u1CutqmnskUbMyGFXuWc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RLqDQWkv/wdeeUVvg/BzvSiiNBNQixrq6yOJvl8pz7qtPNua7DaEV5XiySXZYnfQ1N8KqEdxygOxmutAOaPPMf9Jvp83mfEwABNe0x7j19l6bt+D4Ql6lx0HlhvZhcKWU0qchbwyQU2wr17vOkKmw71ZLWAJ9f7XBjNzvCO5Wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0lB3f6c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0lB3f6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791568392; x=1823104392;
  h=date:from:to:cc:subject:message-id;
  bh=xlsc99enQRlhDoNtVNHsiy0u1CutqmnskUbMyGFXuWc=;
  b=H0lB3f6c65TW9ItGBTwKeLwv47MVXkPEoGo727mf8MGaAqYYE+EewK68
   ByaHJYiMzjd/np4Sv9/lOcPahro0p5BCVam6j8IP/mpUz8yqR7Re2inj5
   Q04+Y0jha3RuTrQG/F+9aY6l0oFbRvHD3SeB1p0vcMb2MXXPzt1F/ec8w
   qWdGjSjsYz+GsooIalpz8R2DIJI4xlfX8bPR6np4e0U/Xce5gdMjJL2V5
   rQqK66G+s6x6fms8cu5K9MAKgmoxIXrZZWVwXt2VGpu8CPBYN6C5Cd0u1
   5BNixZUwMzoTXKB5M+M/OMjtVvtY9s6wgakeXRGRpIhxQYrPRbhzuGg/y
   g==;
X-CSE-ConnectionGUID: bFz4lBAETm+z+TCOkaodAA==
X-CSE-MsgGUID: xNLwJuC1TQKdpldiHoxTXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="366510"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="366510"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 10:53:11 -0700
X-CSE-ConnectionGUID: o1BjpmrfTf+oGUPHtKuw8Q==
X-CSE-MsgGUID: zUJJxDPoTCi9L05Tc3OJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="308235"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2026 10:53:10 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFEmK-000000007CR-0rnv;
	Fri, 09 Oct 2026 17:53:08 +0000
Date: Fri, 09 Oct 2026 19:52:58 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] kismet: WARNING: unmet
 direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202610091909.7Hc5Uwxk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6b7e53dfabebf2217f7ba34cf4bc9869454c8371
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [13/13] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20261009/202610091909.7Hc5Uwxk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261009/202610091909.7Hc5Uwxk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091909.7Hc5Uwxk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
