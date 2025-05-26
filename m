Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7B2CCDB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 09:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250587; cv=none; b=hmzGv/UcFfLetCj842sFvFHRowmzFnzSOCUmoAE0aVSGw3s9XdxpkAj1c2rxmEUt3Seq+ctlP/bS9nFXhW73/7dQr0/Mogu8H+n5A4/BSuuh4QQSofAwkzWtK8FMpeh31e+HcYXp5UGlIJawhG6AFVS2qnmXBX21DMjhCveAtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250587; c=relaxed/simple;
	bh=B2jzbg8ozYcegvQNP10oNzo4KEtYWvrkSKDoSjqp/YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tea3It9L4zGdOFVHrlt7WV778cWlvUUDFM3bDyqJr6BLXnTJGrAl16M4BKa5ChtxAdyB7hJbOhfek1KERjFw2k+Cwrs/aad6S2h1Z6bVt0bsSTuD36qur8gItsDHPvMXeuK7WM7shl1uGup7JPI8657xMxojN2HNi0fyQFdujik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gng6WGeF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gng6WGeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748250585; x=1779786585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2jzbg8ozYcegvQNP10oNzo4KEtYWvrkSKDoSjqp/YE=;
  b=Gng6WGeFmE9yA3vjyG69BrLArUHezmu+UjrRgqveWaL3U4fNyHM6a/Nh
   n7b2qdK6H318fipG8Zg+r4HjktV3ngJeFHDz6wDEotWUp2ULOlwGwnDuw
   SFG5wjJi4HZEM/YNrjEU4Bi5pTnEL6nr54XSYvZL5PkVwf6ZNuB8SKjoo
   z7si1LHYxANlPuKHVK8Ox8D6oidfEVe/5gHO2X+VnfXidKYJpbgBy+PCH
   G9EGacmN7tk/JFqRZfStRc1ZrdgkgSxMiqiNYwTUH4PCW8sO3q0dDaDB4
   67Zg4rgHzogS8cYQQ3z7cpnzbVOrjTBP4hWzrp18BP+PDI8MNQJjS4AhG
   g==;
X-CSE-ConnectionGUID: UZ/hs240QfqE8eGFLJ3WBQ==
X-CSE-MsgGUID: BAs8LJSbST6Tz+QG0e1Ulg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="72746560"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="72746560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 02:08:26 -0700
X-CSE-ConnectionGUID: KwGWx5kpQQKAp8FxPEBR6Q==
X-CSE-MsgGUID: 0sFFfQwWQcOPvN7uYbya1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="146185360"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 May 2025 02:08:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJToi-000SG0-1z;
	Mon, 26 May 2025 09:08:20 +0000
Date: Mon, 26 May 2025 17:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 13/13] kismet: WARNING: unmet direct
 dependencies detected for NET_DEVLINK when selected by MLX5_CORE
Message-ID: <202505261718.thN7MF3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   a6117e3e8c160a2b7ce2a26ff23645a2a3072001
commit: a6117e3e8c160a2b7ce2a26ff23645a2a3072001 [13/13] drivers/lib: Move mlx5_core to dedicated place
config: arc-kismet-CONFIG_NET_DEVLINK-CONFIG_MLX5_CORE-0-0 (https://download.01.org/0day-ci/archive/20250526/202505261718.thN7MF3K-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250526/202505261718.thN7MF3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505261718.thN7MF3K-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_DEVLINK when selected by MLX5_CORE
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - MLX5_CORE [=y] && DRIVERS_LIB [=y] && PCI [=y] && (VXLAN [=n] || !VXLAN [=n]) && (MLXFW [=n] || !MLXFW [=n]) && PTP_1588_CLOCK_OPTIONAL [=y] && (PCI_HYPERV_INTERFACE [=n] || !PCI_HYPERV_INTERFACE [=n]) && (HWMON [=y] || !HWMON [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
