Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713BF20DF4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735151992; cv=none; b=BHk2txaKTaiPmxiQoxBPoSEGbyZpJpYnnG4xyLmZx95clH8Je9SjuIFG5b/pZKZqUUTUHXjklkS2PxeZIdOg1yUcclL7JGaTSaJWFg4Y7mhxeNNdBQ39n6UHJtyyYl3Y8Yh86y6qDo/ZDOKsKutY70wAfeRD1Hm5hR8jOishjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735151992; c=relaxed/simple;
	bh=SJcnEau+fcQ48jOLMGk0SFS8DhWwpAuLpb3nhBgd+9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atCpN1vDZXnpERdM1qsALtan2O99OtHvaGl8pIamJ1iUHRkPYzH6VvRyvRKkEUB15db+/NsROzvjM3CXV0WNcSHCMk+uouw8/RIgkNlA3wPOmwaqIpxA1tzIlgEMXX+62YuIhui9JbVEgSjaZamhsiSTvdJeXZU4OCuJno/7dTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftX2BwhJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftX2BwhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735151991; x=1766687991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJcnEau+fcQ48jOLMGk0SFS8DhWwpAuLpb3nhBgd+9U=;
  b=ftX2BwhJwMF/fHwHo8HOgjfm/DLdX89DYlILAHsxBW8zd5FdR1fpWo0O
   12DfYryCYK/3M3Qds4+cK1SFd7hlNwA6MFi1IQ/t7L1ttpHa4ORpK9U8w
   LLEOW5Ta4s8OhsBoSzDkJZfdUxLEzfnZzSkQFEEgTwpudGGxycrNtz3Qj
   Y89yZg1QAzJ85rXPl7H+z3aTocL8btS/4vaGDg5NmdD2dj6SbbZ/l76B0
   XBfn/Qqn1wg/BdZeLL9uCxOEsKOodKYC+IYBcY7gwWUExZGzdRfp7hWvI
   q8MRZhKOurZlbwd4yG68XS2VzpvaLosnS1tCIXIy5Lax8fWvsdfQNPufk
   g==;
X-CSE-ConnectionGUID: CkVXI9RfQXW3n5xcNkx5pQ==
X-CSE-MsgGUID: pyxCl2jiQ2amL0341xS2bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="53121145"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="53121145"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 10:39:50 -0800
X-CSE-ConnectionGUID: eiMu0qzPT6WDtwadxK7osw==
X-CSE-MsgGUID: fm+eKuk4Q9inx/904RUhBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="99968154"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Dec 2024 10:39:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQWIM-00025C-2g;
	Wed, 25 Dec 2024 18:39:46 +0000
Date: Thu, 26 Dec 2024 02:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2597/2597] kernel/watchdog_hld.c:502:12: sparse:
 sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it
 be static?
Message-ID: <202412260250.01PLQH8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f5a62ec85c94fa9a6db1aa3393876184382841fb
commit: 364de98eacea8dbfe4f926f62085aebf8534f403 [2597/2597] watchdog: Fix sleeping function called from atomic context
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260250.01PLQH8B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260250.01PLQH8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260250.01PLQH8B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/watchdog_hld.c:502:12: sparse: sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it be static?

vim +/__hardlockup_detector_perf_init +502 kernel/watchdog_hld.c

   501	
 > 502	int __init __hardlockup_detector_perf_init(void *not_used)
   503	{
   504		int ret = hardlockup_detector_event_create();
   505	
   506		if (ret) {
   507			pr_info("Perf NMI watchdog permanently disabled\n");
   508		} else {
   509			perf_event_release_kernel(this_cpu_read(watchdog_ev));
   510			this_cpu_write(watchdog_ev, NULL);
   511		}
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
