Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA781B4C49
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946630; cv=none; b=VF6BDmjsbvO6lVjaXA1glBqkZevE2k9ksw+QkQgqbtJpL9mD6jbwo8lbHBZBg2CJ+ewMMPx+QUUYrY8bKiEe4MwjieDebSuEXjijq6CV1baSpNXvzPoOJzkCGW+ug2pKo5z3bA15qlWHP9/6JAGfRk9Imru9rAZA3rtuc2/sYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946630; c=relaxed/simple;
	bh=/s/KO+q4JlGGw8pRnv/PEgW3D9dQg6t1hVACiqoRoz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZqDm3afRHZ2i/vUFyQRa//6p+5yRo6o7PlaHsT6GCsihIDTxgFJa/WEfnFn3JFW44wRNJOW3WQhvDLH++dXN9FgXVkIme5m3UQUFEnydQJ8VEommCY8bNj/ElUkMLZG5yn4fJzjON+5qPUKHyUAftuCibNE3jdTRGI5Qip+SUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXV0Xd+M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXV0Xd+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724946629; x=1756482629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/s/KO+q4JlGGw8pRnv/PEgW3D9dQg6t1hVACiqoRoz4=;
  b=KXV0Xd+Mxb1ok2QYsd3zXSlMRFlQHauPSAdrYLO+rIQDjQKmeFMiMhcj
   uQfKPQFQ/aDNp+ml74iiTGvU/g0lRPROASWt4Gw1mFhjJSt9q0xHI09Dk
   UMfUUlzr4hh9iCRr9LXUuHEsVUt7mFYAk5/nz3s0O22H1kqz7v6Tx6du2
   x2F3IK0jWzU9xI0rAzSTSKXAeeSaUu+XzarHk4zHXDAisOT/p7mweNauO
   WyAHyHK+SxxIx65K6ALe9/Tfs1RBGEmle88y1Y3Y67I480NdbcCWwgW0k
   /2P61u4zFXEIpc2lO2dBg8+b4k79UT8R08WywV+FCzS54xaMsNK78LDBx
   w==;
X-CSE-ConnectionGUID: SNxTpnc2Q52Jk9M36p10eg==
X-CSE-MsgGUID: 6OgTrRwgSqe+tOxK4py0cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23505181"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="23505181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 08:50:28 -0700
X-CSE-ConnectionGUID: zxa1tHM2Tr6sScL/xddZqA==
X-CSE-MsgGUID: MLkEo7V/RIiteO5bSJ/6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="63943999"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Aug 2024 08:50:27 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjhPl-0000Q0-0O;
	Thu, 29 Aug 2024 15:50:25 +0000
Date: Thu, 29 Aug 2024 23:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/dts-qcom-label 4/18] Error:
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi:28.1-13 Label or path
 CPU_SLEEP_0 not found
Message-ID: <202408292315.5n6XfHHn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/krzk/linux b4/dts-qcom-label
head:   ecbcc475c6e01d49c17cb807cdd927983e9cf8c5
commit: 641feca3519b276c346b898b6cadcb39890d3355 [4/18] arm64: dts: qcom: msm: change labels to lower-case
config: arm-randconfig-003-20240829 (https://download.01.org/0day-ci/archive/20240829/202408292315.5n6XfHHn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408292315.5n6XfHHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408292315.5n6XfHHn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi:28.1-13 Label or path CPU_SLEEP_0 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
