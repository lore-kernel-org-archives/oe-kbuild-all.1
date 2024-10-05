Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E267E57D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 01:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728091433; cv=none; b=ukwn6aJyeFsXEXXZvuPsNRoMFrQLgFGsG/yyckoKZR4xFUcj/q0zO4HWUMVO9loeGFitk02Epn3rwdNdLzVvN/F8HoH8nBCPKLTtN14qI99xVCIAMZOopl9HRLcL+qXzMV+MFT9OcMqa/ely4XGUrwX4YSLXX0k8Wer5dSQWovA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728091433; c=relaxed/simple;
	bh=7RUF8alDdS++zj7yy1lPiXez2FmT90tI5MsXdH4ynsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m8PPudGDfv4wVtXeA0r1xwzhE9VUdF93lOVpPeYPagqq0KWYSc8BAZNVbGoMwHuuhmPxqMsb0dcC1RYyKwMCTbR3dAeRsAmbNwWZ0Ro/JG0quA1nQ/tOKRETl15YmKtFKWDyk5xGOJQrnNdZBGeiqCyjX95xg4P1ofEsqa/rR1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hj8S4eHu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hj8S4eHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728091432; x=1759627432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7RUF8alDdS++zj7yy1lPiXez2FmT90tI5MsXdH4ynsk=;
  b=hj8S4eHuu85/budeoUtvk6oiMgx6GX7G1cbySA7fjc4kXvAM+hLdCoEA
   P/XytltQ70ANU2/T9CzugG2d70xQiSkG4q/OJhIajlw3WkKWNUZCzWkKF
   qv+ZsBhy6lpVW7wcPpqxuy8qAikp7tighw6IE+6sG2fRMe7KxI01D+IgH
   X1q9eBQAiwdIACVRwgXhg+OCy5sI6P+ooKJ8KtJEVvF1iCOHihajLCg4N
   F3tlZwOLx7VrXL5dEd/xXjdh99SUV3p/NloGNGxx+RSJZIrzdHMBwAs/n
   QL90+tu9YPISZqzIhjTMyMM2HEqKwCQLfONHLk5nhzNjr4ZhVj5ulid5l
   g==;
X-CSE-ConnectionGUID: HMXABGlLSTe3LNCJ3JuS6w==
X-CSE-MsgGUID: y8FrNN2eTV+gglMj7rUCBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31028300"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31028300"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 18:23:52 -0700
X-CSE-ConnectionGUID: S9jqs6UoQxOPE2yqKwI9Xw==
X-CSE-MsgGUID: /tn0OJc7R4Gz4KKv7dQ6Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79644556"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2024 18:23:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swtWM-0002PQ-0b;
	Sat, 05 Oct 2024 01:23:46 +0000
Date: Sat, 5 Oct 2024 09:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7777/12031] drivers/iommu/amd/iommu.c:69:30:
 sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be
 static?
Message-ID: <202410050954.511CF75P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: 48b9cbca2d0ec8d9fc4f05fca1243995f8cbc4b4 [7777/12031] iommu/amd: Access/Dirty bit support in IOPTEs
config: x86_64-randconfig-122-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050954.511CF75P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050954.511CF75P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050954.511CF75P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/amd/iommu.c:69:30: sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be static?
   drivers/iommu/amd/iommu.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/amd_dirty_ops +69 drivers/iommu/amd/iommu.c

    67	
    68	const struct iommu_ops amd_iommu_ops;
  > 69	const struct iommu_dirty_ops amd_dirty_ops;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
