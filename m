Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0151DF26A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 06:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671614; cv=none; b=KXvpNvXT+A8+s7kszzuzeZzcWvyWVzDvrvZYujN1wgopOAwHpSratKicJ/X9XmxGwYbrnADOLYXu0wOwHAT6sXBlveKxsGKJ6d9OSO4manB3eAzqt5tLcAi0/oMO2/xqqazTQK8o81FjN6O5F0qdRdK4cD+11LfhQpVQl5T3MvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671614; c=relaxed/simple;
	bh=uA0UjmNx0kbYw5NYMjUU+v29EC3x6PKGFE63TybS2+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPqZgsf929GAWnSYOwVoNcu4Y4VzOjIPjNy2ejwnYH59ZDlVtJ1Pn3NHxlRXuNzFAiw/WjfShl5HLi1hdwG0HlfqayP7ZyE1iJ1XvF4rWeNYU7FOHo6wYOempPAnhF+Nv7VQRTGqiw+0QaXobnRJ3edV9yAep5+VxaS5U/2fQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHYrSP57; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHYrSP57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755671612; x=1787207612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uA0UjmNx0kbYw5NYMjUU+v29EC3x6PKGFE63TybS2+Q=;
  b=RHYrSP577A4WBMt0T78visD8oedELme32WATQGcWecn89Aa0+Rp7XnSM
   PRYoWoo+Ai1iPP414Opel9uuxKoh/S6DUbvUEfev3FdMhlPhVuUxrmncz
   pPqgcNmjZQwiQ26h2c+d5LEG2wi8k4L0FdRWRTGzXQWHQjRPSTDQgQhZV
   1iSWudm7lxU+IKsQc+ZsGHGec12nn6vM83bhvVshSc+esNfJEtT1LOS5G
   SEU8BySMaQAO033wD9o0Grb+3u+MZ0EifRLLcjnKZtZHHtnItpum1b6gH
   VD9W+KZOYwXqPrzgkNDHKgc+XlZ98JT/LamFPfxigYp+umdpA4jeMo06O
   A==;
X-CSE-ConnectionGUID: 4hr+1+FfQaytKD0eXTjLgQ==
X-CSE-MsgGUID: 09NOASayREWKQVBgGBcC3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="83354500"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="83354500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 23:33:32 -0700
X-CSE-ConnectionGUID: 2tfBd9kqSqeT2yEJVt8q0A==
X-CSE-MsgGUID: sXOGxt+oRsy0onNmpuv57w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167549499"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2025 23:33:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uocO0-000IHx-1h;
	Wed, 20 Aug 2025 06:33:28 +0000
Date: Wed, 20 Aug 2025 14:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [tnguy-next-queue:dev-queue 87/89] ERROR: modpost:
 "libie_fwlog_init" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
Message-ID: <202508201414.zlbWHBW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   e4c70369624f069154c2d91173f9862318b807f8
commit: 19d6fe03db7e99f56f4898bec0208a1a036096ca [87/89] ixgbe: fwlog support for e610
config: um-randconfig-r051-20250820 (https://download.01.org/0day-ci/archive/20250820/202508201414.zlbWHBW2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508201414.zlbWHBW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508201414.zlbWHBW2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "libie_fwlog_init" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
>> ERROR: modpost: "libie_get_fwlog_data" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
>> ERROR: modpost: "libie_fwlog_deinit" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] undefined!
ERROR: modpost: "libie_aq_str" [drivers/net/ethernet/intel/i40e/i40e.ko] undefined!
ERROR: modpost: "libie_aq_str" [drivers/net/ethernet/intel/iavf/iavf.ko] undefined!
ERROR: modpost: "libie_aq_str" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "libie_fwlog_init" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "libie_get_fwlog_data" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "libie_fwlog_deinit" [drivers/net/ethernet/intel/ice/ice.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
