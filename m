Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C5E10A1F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709367607; cv=none; b=hwxZ7VN92acAbHS4E+b1y/Wbc3v4JBX+Hi6Qg6Eke3d6NVNAeQhHM5Ko9SKeRp8r+xNGvY4d54M+YRl7tMlz8aJHUTAMerxX4s3KqQkHA7usm8Itqpu02vApN0MCFkeaPiMDnedsuuSCL18SJBSBZykaMqP9EpUTAGTcmnikM74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709367607; c=relaxed/simple;
	bh=h1Mig9LcHQuMM29YmwBschmo5BIaCsvhFyTfAzlk8nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUjJFCqOu3Was0KIwAA8FsF6xIMamXazohLKx0DAoAFcPG+t+i7QKt20qlx3MGwxcdEHASyJxBPSK1mSoAZ/JjcRtlBFhAzCgCPpY/1Yi6TjQO2oQz3O8/0tJLhZsTht9jV1evFEfPZ6rMsD6nrdLXYrAMOaiE/xbIhzwkC7j/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQDdb9f7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQDdb9f7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709367606; x=1740903606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1Mig9LcHQuMM29YmwBschmo5BIaCsvhFyTfAzlk8nY=;
  b=GQDdb9f7JxIV+mA90EBrfPgdbariTqOqP50y7/pH2sWJOTSZFjFS8KyT
   E0z2nHa1Slltn0tNEDlsxbUQuJ5Qf1Dj0GW3vxXp0AxwoIKJTqEhy0DMv
   lJV0M8FsMQGa4ccj1ZC9ehsma03RsxR7iKAkq768+0/aQehFwyeIvp88M
   vpDHvpJb+I4fQxv0B5QPIIZTcmSsX0pTVn6sFysGcrneUOyMU0sYPhJEv
   6IDWK/mNN5NZXqikdHpqbIEjJ3SeYkD3S3ozCSbOn6yFtX7MXSJ/ZGwgh
   JE90W1ruyt+WT2IejoLx8/PG3t/+Djbw+4/+71CGDrUHK9P/rhoJDBelW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4087856"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="4087856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 00:20:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="13099786"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Mar 2024 00:20:04 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgKbB-000ESZ-1b;
	Sat, 02 Mar 2024 08:20:01 +0000
Date: Sat, 2 Mar 2024 16:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2676/3767] rdtgroup.c:undefined reference to
 `lockdep_is_cpus_held'
Message-ID: <202403021655.4zz3RhBO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   236cb940335e3542c9d5ac16b5d8546a0cbbdfc1
commit: c054efea286659a6504fdeafc0a611c6a3b124cc [2676/3767] x86/resctrl: Claim get_domain_from_cpu() for resctrl
config: x86_64-buildonly-randconfig-004-20240301 (https://download.01.org/0day-ci/archive/20240302/202403021655.4zz3RhBO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021655.4zz3RhBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021655.4zz3RhBO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/resctrl/core.o: in function `rdt_ctrl_update':
   core.c:(.text+0x2561): undefined reference to `lockdep_is_cpus_held'
   ld: arch/x86/kernel/cpu/resctrl/rdtgroup.o: in function `resctrl_offline_cpu':
>> rdtgroup.c:(.text+0x12301): undefined reference to `lockdep_is_cpus_held'
   ld: arch/x86/kernel/cpu/resctrl/monitor.o: in function `update_mba_bw':
   monitor.c:(.text+0x31e): undefined reference to `lockdep_is_cpus_held'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
