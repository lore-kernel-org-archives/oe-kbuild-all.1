Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE3417E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 01:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723254862; cv=none; b=EdVp/h85Qxy54hCmFf6ArolblOyuADeOCWaLIhR+O7IQpudIMDyzRideMjJ5GZYLpsuwGC89X+4Fg8zJ+B5CMX6ShLQdECYoyjsVLf9QV1/hPdJJVu5BSWCh1KYgU8DXuf9bQC3F7JtXZ2pJStQWBG8TzPrqNzqLAwjpXJ9U9FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723254862; c=relaxed/simple;
	bh=bZB2evPxf6Fw2NvQUdMytY/NgE7svgEyx2cnVzds9qU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uHG4TJfVuTOSXFu0Ocvpq3wfUPvSQvHm7m8ZihdwHvUtBU93AFPuWkGMwdSYrKsxxE1jUV7P/byNQmrJHwkBLTy+OA3qAyougzyQE2R6ZrPf9MnQVhIywsY+8KH+TsBLDpQTwsPxKeDJItaCY/z7bcIrDw12rPYW+tylGsaMTtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvVp14FI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvVp14FI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723254860; x=1754790860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZB2evPxf6Fw2NvQUdMytY/NgE7svgEyx2cnVzds9qU=;
  b=mvVp14FIFoAKhbwDzY+1CiUCrPEr943971Ibuva++dM7Ymq1GGvtuYY7
   nxClm02zY90nIIqYk0ZjMXS8QirUmCvt5IeYi+wdKcyGAM8ND51yJssOC
   BiEcgjY6ba8W8u1pWW7O/wj40mKWYQmG9hpFX2p2Vs0tlx3yvns+aT1YP
   EuiLN/tvHjWuAstD8sePEiozgTfdEngIIGS5WiARLMup9KSSlC4eNEgGR
   9bYTcuCw6r0CuTYzsDjL2TItl1d56sL3LGoL9JgbgzlZG58bG565y8Qeu
   TYE1iahGPTkhmOCJWGf+wlrYd6iwQK67uWNMTiIfsW8s7vlNKvDKFSnuq
   A==;
X-CSE-ConnectionGUID: 1GdEKfuLTseeWfNZJSWSxg==
X-CSE-MsgGUID: 7+bF0cT6R0KuovTiQiqVQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21582894"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="21582894"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 18:54:20 -0700
X-CSE-ConnectionGUID: CqnxjNFzRwWsuNcn9wsJ7w==
X-CSE-MsgGUID: Q3fx17tpSHmY8luklC0yUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="95250212"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Aug 2024 18:54:19 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scbJA-0009Ul-0U;
	Sat, 10 Aug 2024 01:54:16 +0000
Date: Sat, 10 Aug 2024 09:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [rppt:numa/memblks/v4 24/26] WARNING: modpost: vmlinux: section
 mismatch in reference: numa_add_cpu+0x28 (section: .text.unlikely) ->
 early_cpu_to_node (section: .init.text)
Message-ID: <202408100921.3EjVdsSh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v4
head:   ef03edaf2e412eac8110fbcae013817872936845
commit: b83ff87c13a2608d31e49560ae41220fb8416903 [24/26] arch_numa: switch over to numa_memblks
config: arm64-randconfig-r122-20240809 (https://download.01.org/0day-ci/archive/20240810/202408100921.3EjVdsSh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240810/202408100921.3EjVdsSh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100921.3EjVdsSh-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: numa_add_cpu+0x28 (section: .text.unlikely) -> early_cpu_to_node (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
