Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A149B76054
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563519; cv=none; b=YXL+PZw3UcUBHGCKxJuR3POU3Mc686rwCZ1pSSiHZkOgAVrrrVd2PcD4WnhK3qj03/OmWxoLrmDsDB+cS+T/0IHLaPscvSQ6dQ4sU3J7FWZkCoCcPgSegGYUspTRTsQKnS0eKmM8rZnHhydtJpgVjewC0GKOHhsGtWQjpqW+LmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563519; c=relaxed/simple;
	bh=yQZblZoiNoNI/cVLLFEYvDEmAAXtzw4Q4VmbnVk9CT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YChWco/fPD1Lcz/GkdP3zUdZ6gxsKvHNz4Zq2oiZaKIyji6EAzuS5R3fetcT5verzS2qrhLJTADVr7KZ7wUIrmzHVLtGVyz/LPtrZLe5G/A4uqy0W3uXc+badRpKQxxfQf/jO4zzzW1CSSgN3xsJj8hX61pqSTUkrUUu2HRaUKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMF3/U02; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMF3/U02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706563518; x=1738099518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQZblZoiNoNI/cVLLFEYvDEmAAXtzw4Q4VmbnVk9CT4=;
  b=NMF3/U026k3axTFT4MH43kzUZtyFYm6IK7v+HU88tWpOKvUjzByF1I0g
   fL7X1xa+3nuJ3l6zhP8HzPCeyzf6h5tnKbvl+ST+hMXWpPUPjr3AXkgt5
   wWQ9hs23bXPdlli0hcNd7ZnThbseRyPqLPKQnbGpLDTwc/6E/DZQjqdH2
   3XK9+jkCAMLzGO+ZKsTM8rW24arxL+nL6Iryst4fOlq1XnTZFv/+snrqz
   WYZKL/etpd2GkyT2YbKTUyzp1gGB4WSQEsqWfCjimMTS3N6Cojlsz2MLV
   NSeQyD5i4aZpFH4M06ludVq9Q79/lVH584Qh+UhtI0Lsc686naWLzz5h4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10201404"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="10201404"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 13:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="878219877"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="878219877"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jan 2024 13:25:15 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUZ7x-0004dk-0d;
	Mon, 29 Jan 2024 21:25:13 +0000
Date: Tue, 30 Jan 2024 05:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2626/2805] core.c:undefined reference to
 `lockdep_is_cpus_held'
Message-ID: <202401300506.QWTWXFBL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   34a4a47388c7ce3c71c41c52d05326287f925789
commit: 63d5f97c7fadc85b3944b421ce9759f17f9c0264 [2626/2805] x86/resctrl: Separate arch and fs resctrl locks
config: x86_64-buildonly-randconfig-002-20240129 (https://download.01.org/0day-ci/archive/20240130/202401300506.QWTWXFBL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300506.QWTWXFBL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300506.QWTWXFBL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/resctrl/core.o: in function `get_domain_from_cpu':
>> core.c:(.text+0x13b7): undefined reference to `lockdep_is_cpus_held'
   ld: arch/x86/kernel/cpu/resctrl/core.o: in function `rdt_ctrl_update':
   core.c:(.text+0x148f): undefined reference to `lockdep_is_cpus_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
