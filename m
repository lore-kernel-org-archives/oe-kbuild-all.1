Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AF82AF1D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jun 2025 06:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749364349; cv=none; b=poo4Js8HDsJvNuxBhi+yxe/i6PYG7wOVebVktsk5p+ub/V942mo3SjYSkXzpHjvoC46Krcbp9nJJp7onZiD+btl3/Yy7nN2NHr5zOfU/yBcxNM1biNQqizGsgE3inoE6C3T8xIpKgNJA1rKCA2pFa4FWnL/p8+Z69ZrAgJuoFVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749364349; c=relaxed/simple;
	bh=miyqNz92tQljIbD04QoJni0WZz2OGNlvRzuc+43eigY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dgm/D1s1sCH1rin8G8PIMQrtfzfEOHoWkjzv6zPjzbXxVApGHznpwEyXNfydN5q6OkD1KRfOBLWP26U9cggtecR8f7OoebQVNiJpuIlSeTpJkJD7Nn6TmnoNkc2ly4E7lyw8XpT5/prq0DgjLv+aLorNlWGTYkf61PR49oNBDZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHbOH2CT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHbOH2CT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749364347; x=1780900347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=miyqNz92tQljIbD04QoJni0WZz2OGNlvRzuc+43eigY=;
  b=cHbOH2CTdX2uwndnhcbq2O1jtQvrzj5GiDJ2dMTrH1OHD+NUleQl91oI
   5Zc+KYHzmBeCC2cze0S69JBJutuoIQ08tkumYs+DJI5TjXi4Ucj8UP41N
   F/ma+9Psn6pdMoJy6dRb+rvvD10OyhwNmujYRVK3hMxtRYMqrI09bxiP4
   4YCyiiG2OKtG9bGX+oQkzHavCjOJ0LBYgrB/iZvz8DMDTa6rgi33yG82K
   cJoOpznkfnAfepjX8PwlzpSDzYPkUSiwT846gsDjNc2ZaG7ZZHKXf7Nv2
   L0MoTyHsOrmcqZ68P6E+sKDIIkMhBzsbuNtT/JbNd2utpMoN5vlWNoeoV
   A==;
X-CSE-ConnectionGUID: 1SPv4kqJSDe1PQ0QGITMbA==
X-CSE-MsgGUID: Scoxd2SSRLScKEUXgzR2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="55269652"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="55269652"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 23:32:26 -0700
X-CSE-ConnectionGUID: xgG/exivSvyMGD2wGtJrdw==
X-CSE-MsgGUID: Uw7VnS2tSVaynxS4IE3bpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146799533"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2025 23:32:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO9Zv-0006EJ-29;
	Sun, 08 Jun 2025 06:32:23 +0000
Date: Sun, 8 Jun 2025 14:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 6/21] ERROR: modpost:
 "xen_read_pmc" [arch/x86/events/amd/amd-uncore.ko] undefined!
Message-ID: <202506081407.2BWQrHGi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   c51b6cfbe618f75b4ccf351866386968eefcf9dc
commit: 5071977ec92a3d460b183af866f50cdb3f12dea1 [6/21] x86/msr: Utilize the alternatives mechanism to read PMC
config: x86_64-randconfig-076-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081407.2BWQrHGi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081407.2BWQrHGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506081407.2BWQrHGi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xen_read_pmc" [arch/x86/events/amd/amd-uncore.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
