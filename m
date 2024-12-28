Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E42AE84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 18:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735410512; cv=none; b=Gy/VvG2KIDrqqmGeumm243vvKrQVLp4BGVVr29Ko2oMLKlsYPX9toEtFYkDGkAjEgzS7B4jHLxdwMPZ0UaaLx0vkySGsO6ywjbtGXOhHnfceVvZcqWmFj/INT8G1R6wLfER0wN6JLsmYfGAZgdJLR8s+9D7IHaAwHOHZf1qiJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735410512; c=relaxed/simple;
	bh=mPedGx/mh26DuGtrUMHBj0onlQxX3qKsmTZ2RjIbhL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onj8r/7kDhv80JBwiqtfumVGdh0z7loxXTygyeTuqXqUz4R8R9MwwH6E60UoygpagfYzjLZfgcAivk/eiy52HpEwA6kKtm8L5YMLQZNVkyfn8ycUuK0INGcLuVdKWTWQzePu2fvSovIKEdMRdGdMNiwP1fDENu1ovT0vzYC6WDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKR/WiSe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKR/WiSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735410510; x=1766946510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPedGx/mh26DuGtrUMHBj0onlQxX3qKsmTZ2RjIbhL4=;
  b=cKR/WiSeadthy/yoq1ZPiKOqWxhcB/K0rHMtx3pMzf5Gb3SzMZnlsNYy
   f6IDueAZNzu4Rtbj+DcQ6kcRiwT9CMsj02JRxFmZNSdUWMlqZTjlSwj+P
   ez0dILBSI1jq6hM53wS7kg3LKgGKBOBjoig8gPuy+kxTMmH9Xny8V7aTz
   VaYxmVkSyWs8vFVfyYPvWanM8nVD2jgkZlfpTuJZNY6/QtDvDapK/UO0P
   kwx9dfjZD4wSToyYa/mJC5TkKttZ4iz2yxg7Mz8bNL3w1rOtgBNuzrrug
   hbf3FopMxcO+qp/+wqPzlvYWynXgOggeViDQZQ+OGMcvAxq8oD8DQ+0TU
   Q==;
X-CSE-ConnectionGUID: nOMYSyGRR/Cm5vtV3zjEog==
X-CSE-MsgGUID: LgCgX5NdRsaElsB1ifLJpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="39541155"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="39541155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 10:28:29 -0800
X-CSE-ConnectionGUID: 4wHpiVdTTv6cgK719AXRDw==
X-CSE-MsgGUID: Ob/QRtbOQ5ijIxRXSDS3pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137752318"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2024 10:28:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRbY1-0004FE-1j;
	Sat, 28 Dec 2024 18:28:25 +0000
Date: Sun, 29 Dec 2024 02:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] net/sched/sch_qfq.o: warning:
 objtool: qfq_graft_class()+0xbd: unreachable instruction
Message-ID: <202412290220.89K1KTZx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4848f81edc2027721953fee5ded81f909a833e26
commit: 387687bb20f419c9cfb021a4e2c2a14935dd5c64 [2589/2589] net: sched: sch_qfq: Use non-work-conserving warning handler
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241229/202412290220.89K1KTZx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290220.89K1KTZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290220.89K1KTZx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sched/sch_qfq.o: warning: objtool: qfq_graft_class()+0xbd: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
