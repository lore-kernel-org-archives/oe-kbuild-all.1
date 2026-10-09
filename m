Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861FA45FFC8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553154; cv=none; b=CvwX250XC3LfS6uZmyt1646p/r0/ih5QMPdYWUqGdOpyreHiKIHGnUod/0RmgHgl3GlZJkfCiC3OB+MAOxaiR03Pxk5yPt7j9rr4yt7un5awALvkLrN0XatYmF2LDyvdZwTONCS7GX3SZpx/vWTGbM1aogxoBLGXvDML2EdFCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553154; c=relaxed/simple;
	bh=mVZc4z7/+lIq677psUNXI8493UPGgXsXeZPNnjGdTts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BBDBPr3C4lFztH0RWJTogjcenrYDyKfA1hh6WAKVup47CC1XrEJdeNYHKf7UPStDzccVT5SeJbJS2vmeTPh3Fst8TBvJmtJDvJZ/p4Cf435JvOdpgI/hSDmRDDA/FQluoT1MlO+nSQgwV7JtKI1bhfoJmwOirbVPROEsU7Dsq2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIBqhqTd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIBqhqTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791553153; x=1823089153;
  h=date:from:to:cc:subject:message-id;
  bh=mVZc4z7/+lIq677psUNXI8493UPGgXsXeZPNnjGdTts=;
  b=mIBqhqTd7sR6qxn7ljlszw67tnnrv0q1Kfd99RKvZuneX504kAoi1tUz
   aIIXzdiMynOYa7NRxb4czZVv2bhm5++37WnfycBoqUrLJZ6pdxKQEqea2
   EoEiR3fzVVuLBxHJKx3VbMlrIXPmYlf8kmJyY3nfIUQWCtY13N4gclIOT
   vFRFwsvY8qnd6XEoRlVpcdPrtdVpGvaEa1KXItx27knycJWDhHbNmW/ts
   8nMNa49VJWenuLKBx35X6qE6xEdwrWJtthgiZhm5QpBKcmsSi3tEVX+BL
   Sq5OA/67GGwxp1U7902sSliOICZLJeJYNWX9uSNPyZEx5teRknscO/Y0u
   w==;
X-CSE-ConnectionGUID: g8WAP7GRTd6TQwSEaQnQ7w==
X-CSE-MsgGUID: qaJ3tnSoS3+gy1oJYobDxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="448271"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="448271"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 06:39:12 -0700
X-CSE-ConnectionGUID: hEdQcsnbRdGGZ0LsR15haA==
X-CSE-MsgGUID: pFgAupYrQEiN5C537SoUnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="634483"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2026 06:39:11 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFAoW-0000000075l-1Y45;
	Fri, 09 Oct 2026 13:39:08 +0000
Date: Fri, 09 Oct 2026 15:39:02 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] kismet: WARNING: unmet
 direct dependencies detected for IMS_MSI_ARRAY when selected by
 VFIO_MDEV_IDXD
Message-ID: <202610091511.VB17GnNC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6b7e53dfabebf2217f7ba34cf4bc9869454c8371
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [13/13] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20261009/202610091511.VB17GnNC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261009/202610091511.VB17GnNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091511.VB17GnNC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
