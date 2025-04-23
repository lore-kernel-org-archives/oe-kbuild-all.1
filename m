Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5911426C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745390755; cv=none; b=mnNFa0d8liWJut6jdfhyJ2YLRGP+/u8chlSCCVyn4ipI+3VTB/mvGRBkBJKpAZmlT1YHk4YIDu5BhlFKrUMisnulEedSnIOt6Jl7OzBoxkgePopQFOqyi1dwIv8aIoYKDdgn+LG0hMVe2mf56abkI0NaVvL7Ft74zBEUwXqlGNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745390755; c=relaxed/simple;
	bh=fjOikilrHTm1wsGtbPMvPAi3YahxARnoRm0YKogGRPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FN9CWg/2XtOyRI+w8TDwl8185eGi0cEAEwNWVesxVD9cHFHuw+LNE+YNc/0e6LCvyMLNN6dzymNE7lXaCzmo7kWFvn8RssehgpZDddCPXhimHMs/jGF82lbj6/A8vsQEtHS8QS8RwzUZdPt0BHx+xNdhv5nX/HWguvhKGACDkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmU98YzD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmU98YzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745390754; x=1776926754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjOikilrHTm1wsGtbPMvPAi3YahxARnoRm0YKogGRPU=;
  b=lmU98YzDMl770Fmi5IuPlmU6wAjksbehGnwyHnLOVbpbeCUAYMTtsZjG
   /wA9RKa4kB65th9AtYI5CqHs7uVE4pU9RrFI2xizNE5vactpuJyXSvLEZ
   phzAIQm/EI9/O5IsBRYEyA2HwXMrvnYJ+D0pCPvyJ9ga3h1/wtasWRFOm
   9Hh2C0oK+JRnde5/BXo9PznbyBfXAYbOY/NDKFETincVOxMJPoWpkb6y9
   k/jO6ruuyDeZ5alPP+wQ9S2Wa3W2F0WW6Z8bCQKM+N/6YBI856IfYv14z
   QlIaC1/VL0BEsMj5k4YWFaSwTEIX1xRXeAf58befAAx1o/XRmaAIjqxM3
   w==;
X-CSE-ConnectionGUID: 7W5C8E4aQ/CCghdBdgfn3Q==
X-CSE-MsgGUID: 4z62GOHrRp6Y27Y3c3kvMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46846189"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46846189"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 23:45:53 -0700
X-CSE-ConnectionGUID: ZR49LEdBT+2B9r+qNC3aVw==
X-CSE-MsgGUID: 7t0NkAFoSWeYvQK6eaX+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132759530"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Apr 2025 23:45:52 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7Trh-0001f9-2l;
	Wed, 23 Apr 2025 06:45:49 +0000
Date: Wed, 23 Apr 2025 14:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1] ld:
 drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to
 `usb_debug_root'
Message-ID: <202504231409.8OXb4BQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stanley,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   a82122465ce4d62df5e03929565369e22880a0d5
commit: 3dadac8ba6d606ac003fb282b9da6c9c7448bf03 [0/1] FROMGIT: phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY
config: i386-randconfig-054-20250423 (https://download.01.org/0day-ci/archive/20250423/202504231409.8OXb4BQv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231409.8OXb4BQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231409.8OXb4BQv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/phy/realtek/phy-rtk-usb2.o: in function `create_phy_debug_root':
   drivers/phy/realtek/phy-rtk-usb2.c:715: undefined reference to `usb_debug_root'
>> ld: drivers/phy/realtek/phy-rtk-usb2.c:717: undefined reference to `usb_debug_root'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
