Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09097F46C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 21:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716325417; cv=none; b=R8f1zblbRZqjtNY/yUIIl0nHuGdJIGQcs+vvhtElGKmTqN0A7v/VFqz8bZgT8jTA4mXiOMtB1ovjiEH+ti6JbRWhuCfOT9sgvVvkFxEEG9fH9gYHgM/DmuM1KQJZbnUf+Cpeu1tO9K9pMvOjCQAvElS5qWRLo4YWMcj7sBdiNOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716325417; c=relaxed/simple;
	bh=Osac2Y/xQLmwUl4uCY8cPvjdSnmn4YZ9MfHUn/jzADU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLUoIzrz3uz+PtqvHrIWfWvK7ufzvMzX/mQJ9gHIsb1xxy/OG6vnvo2oa/OqsZyilPB6sN+rvhrvd3cVRNFJXOhtsu6RFuly0EKDyXUyj0HNHzgckD28nIF8vjCuFTjYxSIRJNP/MzrAuEO5fuaOCDFCS8IWy+w9s0REsIrmU98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApU20E/2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApU20E/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716325416; x=1747861416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Osac2Y/xQLmwUl4uCY8cPvjdSnmn4YZ9MfHUn/jzADU=;
  b=ApU20E/2Vy76uFyLO7gQasxsQQa8+cntR3WwG/XjK6HQIW+qXZ7PotDP
   Va83TcfoTD/1TtndafCmFtFm6xqra5NFzgBmR3xbaXmcq5Y774c1oQewH
   ogZONa6ACShrqPzgugTyQqGr7HjNU4zN+yEy/ZgR9BWMB1CPHqHezTrjV
   lc9iH9Wex+nmF819uy22QIqOgyLRTLG7oPF1l28cG4hsQo0jI7etipjRa
   MdJ4HebJvbUD1AxyoAqOV5h6jJN/NnyVrAFwJHsYTVfe2pxfScWOJaSUk
   bV1pUq9b4HyKPbus/XkbZXEqGNRhPi7OUbtcaUZ8DG4aq8YY00dsGQXaF
   A==;
X-CSE-ConnectionGUID: KQjk82daTkWi/ZrVN63jyQ==
X-CSE-MsgGUID: rs5TL0LdRI2KFHyyuFN+Vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23216046"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="23216046"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 14:03:27 -0700
X-CSE-ConnectionGUID: o8NTwtRsQBennfC74Q712A==
X-CSE-MsgGUID: 0azRG7tCRdu4YvbYtsgIzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="64286156"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2024 14:03:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Wde-0000kN-2I;
	Tue, 21 May 2024 21:03:18 +0000
Date: Wed, 22 May 2024 05:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9639/9681] iommu.c:undefined reference to
 `iova_reserve_domain_addr'
Message-ID: <202405220526.7luJhPRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f3f9407325616af0ea4e2399d86d31f8571fa55f
commit: 40c9fc02b0564bbcbc3fc6e14f3aea3639f0afa6 [9639/9681] iommu/vt-d: Add support for detecting ACPI namespace device in RMRR
config: x86_64-buildonly-randconfig-006-20240521 (https://download.01.org/0day-ci/archive/20240522/202405220526.7luJhPRs-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220526.7luJhPRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220526.7luJhPRs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `iommu_create_device_direct_mappings':
>> iommu.c:(.text+0x668a92): undefined reference to `iova_reserve_domain_addr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
