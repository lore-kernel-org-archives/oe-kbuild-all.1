Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905ABE4D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 03:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710472018; cv=none; b=gsP2nzkhrIs9zYa7NpZ/9QCQnwXQihKSxBBBQ1zMyUuQ2fELYmDyj4HCam5h4luobPYzcSgwc2s0WEQni9ASNz34MF050WY0tDG/2G/S6fy5oPPKOA9DcXbPpzeDizUGVGCNNlpS59RUSL55m2VxTn8+5XNJsWwJJXiltYlPbpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710472018; c=relaxed/simple;
	bh=SVeAtdw4O6eXFVjzvwIgySbInPRc3OeD9HrRiQJXIxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOnrDqxLvA6bN1erGiGWqsNfKfaFHYd5wob60ynjMY5RZat+nAVlC/GUaevt15rDlJhQEBCG1DFpmrMl6aONJuKaIvXJGEnfBaFrGQtaAJD5x9JyQK442775TxKia6bknYJl6fUi6M4lv88verydVd0/vtZm4TjASC47W8DhbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYBHhef9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYBHhef9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710472016; x=1742008016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVeAtdw4O6eXFVjzvwIgySbInPRc3OeD9HrRiQJXIxE=;
  b=AYBHhef9X5Os0Ymj44Naytd1TW2c854lUUPQmSXQlHLnvaZ5um+3CDRr
   x1kXxtTMTLOyKiVIvgzLgKQB2jOsGgGHBAwAdYzhZ0LoAhn5EsKy7tktV
   McE75Ds5VYNRn0QI51kaHlFh1/zmrSREG/vHbA5XRLXfjtXESI/mvGFjF
   4DUrfa74TcqtpxqQx6LHvzellvWpD20g+fRQ7hiHymsB73GFC2F8krkBe
   SqlwyLsn3Hg+MRmKAgV7JW4QxA/Jwx97O326a6IqoRWVc4bu7pqFAPeag
   yO3wEOGVRU9rqkZSRV0Aqzk4pJqTOhwWyXnh3wnp45BuQtn86+MNLu88A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5183733"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5183733"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 20:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="17187651"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Mar 2024 20:06:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkxuF-000E1t-1s;
	Fri, 15 Mar 2024 03:06:51 +0000
Date: Fri, 15 Mar 2024 11:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20704/21864] kernel/sched/grid/stat.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202403151019.N7rNMI69-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c41e48598c428d3e38e9ce985a698070deb979b
commit: ce35ded5d5774f055f6850b15032066ff4936414 [20704/21864] sched: smart grid: init sched_grid_qos structure on QOS purpose
config: x86_64-buildonly-randconfig-001-20240314 (https://download.01.org/0day-ci/archive/20240315/202403151019.N7rNMI69-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151019.N7rNMI69-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151019.N7rNMI69-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/grid/stat.c:19:
   include/linux/sched/grid_qos.h:78:48: warning: declaration of 'struct mempolicy' will not be visible outside of this function [-Wvisibility]
      78 | int sched_grid_preferred_interleave_nid(struct mempolicy *policy);
         |                                                ^
   1 warning generated.
>> kernel/sched/grid/stat.o: warning: objtool: missing symbol for section .text
--
   In file included from kernel/sched/grid/power.c:19:
   include/linux/sched/grid_qos.h:78:48: warning: declaration of 'struct mempolicy' will not be visible outside of this function [-Wvisibility]
      78 | int sched_grid_preferred_interleave_nid(struct mempolicy *policy);
         |                                                ^
   1 warning generated.
>> kernel/sched/grid/power.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
