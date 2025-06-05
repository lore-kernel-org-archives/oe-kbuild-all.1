Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB392B9A8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094090; cv=none; b=jGl2uafcvJeeujEVLO64qH4oYC05h04KDOW/myIjQk3YQDcOGNoKEt/UVI2mpblzCGCTBj3XX4zoniQLj3lYoM9r8NGNrVDYyCEmxHUhsVKBWY7EaeppNZiICZMogq+yDEywNIe+p4cRtZ0yarB+vTszB4Pb740PH4qU++t5pkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094090; c=relaxed/simple;
	bh=cXbKcWDLnuWWIVZgT537g9BggY7cOyLmwXcFfnqiUwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dEjVQENAb3uDETwtz3ISZb/NKx+F3fOmhWmt48VriGk/r0CT2VBUbj+z7XjiASMMrWICQpUSWrJLXnkmYeMow27+oa3R4XpZhbkIJNcOI53d64XcMKIOOmtJtt0ypukqism4Pv88UUrkvKEuilAPwjGtdyeQkLI4JXEOztE4v9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVZHolJD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVZHolJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749094088; x=1780630088;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXbKcWDLnuWWIVZgT537g9BggY7cOyLmwXcFfnqiUwM=;
  b=YVZHolJDPRZasn3hZJov/QJMEUiuU3rNezDnPquKcBLP6+ZplRofl+Xb
   bDvrUF9q1s1qrQXm0Bu2mESpg4wp9QLnIcvYwjZ7i5eOBoMRW5wuyYbvz
   iGpDCQFNK7MoJDGpTGOAnsFCxyzhtxSWFpGItjlNdSmhWF7SlhAhefYTs
   7w/1czqB3SUYX1KcGRf8djjSD5Q86NDDVn47TtFB2dm12v2MANd2r2H8K
   N/vkrdyf6ZjlMPn70cUG1mBcHiDwUYrj6LxQi2gokfhwFFm9xZRw96k4M
   mvmlAQ6mV4v+3zgskmEV4exp4cLulJAqJzD2o1lz4jnu0qI+EqFy85r1i
   A==;
X-CSE-ConnectionGUID: g7xYvrTzT3WR9m6gEGwX/A==
X-CSE-MsgGUID: DswbxAbSRT+omQUVwH/0Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68635079"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="68635079"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 20:28:08 -0700
X-CSE-ConnectionGUID: GTMbvlWWRrykREiYnxmg8w==
X-CSE-MsgGUID: TgEVOwYYThSseT6AVt7UJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="182583760"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Jun 2025 20:28:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN1Gu-0003gB-1T;
	Thu, 05 Jun 2025 03:28:04 +0000
Date: Thu, 5 Jun 2025 11:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2357/2357] mm/mem_sampling.c:38:33: sparse:
 sparse: symbol 'mem_sampling_saved_state' was not declared. Should it be
 static?
Message-ID: <202506051116.A1nDI3LD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3160da23afe10e66040ac00ed17174cb467c79b3
commit: 02f32cc0235e33f7fc3e4910a80d386bc600935c [2357/2357] mm/mem_sampling:: Add proc and cmdline interface to control sampling enable
config: arm64-randconfig-r123-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051116.A1nDI3LD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051116.A1nDI3LD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051116.A1nDI3LD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_sampling.c:38:33: sparse: sparse: symbol 'mem_sampling_saved_state' was not declared. Should it be static?
   mm/mem_sampling.c:51:1: sparse: sparse: symbol 'mem_sampling_record_cb_list' was not declared. Should it be static?
   mm/mem_sampling.c:53:6: sparse: sparse: symbol 'mem_sampling_record_cb_register' was not declared. Should it be static?
   mm/mem_sampling.c:70:6: sparse: sparse: symbol 'mem_sampling_record_cb_unregister' was not declared. Should it be static?
   mm/mem_sampling.c:83:1: sparse: sparse: symbol 'mem_sampling_access_hints' was not declared. Should it be static?

vim +/mem_sampling_saved_state +38 mm/mem_sampling.c

    32	
    33	enum mem_sampling_saved_state_e {
    34		MEM_SAMPLING_STATE_ENABLE,
    35		MEM_SAMPLING_STATE_DISABLE,
    36		MEM_SAMPLING_STATE_EMPTY,
    37	};
  > 38	enum mem_sampling_saved_state_e mem_sampling_saved_state = MEM_SAMPLING_STATE_EMPTY;
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
