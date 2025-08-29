Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF632135CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480242; cv=none; b=peob9Ke+LYxjQs4vYTl3KDZV6/W/OseDDdRqTOIGQLkgJCMER/ztcg1T1dV1CTFSkwi9/YJ4i+5xC9Ru/1Ye5nOsHpTjSgFZR+RRLzkk4nWxPa84tqMWmKDrlIm35pTHlp4VLNjzUT5I7N0V++UWhbaLSeXHMTm0oMY0OPEDiAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480242; c=relaxed/simple;
	bh=+i+eVUBQntDDqInnC2L7qSbsssvIWh33gRnw8Qt+RKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWDRcxa3Q9RReUTgF6Tvm5uEFw0BaVGI+OhMgHZC1xTxRaQOFSAKUfoYrMQAJxamTFoCCNL+06Cro7SPMiMP9UMc/X5mInBnPbDgpHgZ+/yxsOifmi9nsVcdk9L3gRy9+JAkENIvicHVMehEVAlqcG+Lkbah9sI+isY8TfjcFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMiW+Z9h; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMiW+Z9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756480239; x=1788016239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+i+eVUBQntDDqInnC2L7qSbsssvIWh33gRnw8Qt+RKE=;
  b=SMiW+Z9hXvGtKFEQvRTIMvGn8dGoG4JPjhpsNMd/Is5tHf6Bu4tdMyaU
   53f7XrMadf2JwpfiJ3YXuJ5kXSA6NjY+ikIjnnoXXauFhLEK1nFeuvFTk
   ZcTxX9vNBxlG9vsFcmZzzJPneiXrbkU73DkialROHsGdUnuNP8weWXomu
   T/xvjmkn/cQ0lB9eS/CZ23nQURbNTljfogRugmLOIhMYBTM34MUMySOqV
   dZdEyXWscT8uSkDIixk2w6iZSj0mG4e79pxAM7jaAIYp556mT4d4cBdzk
   sB1bxMF3X0jQuUu+jrMyP1jwsxXg8x2I2+r/BdZfd6FMOIXjiAIFCHFP8
   A==;
X-CSE-ConnectionGUID: tbykaL6LQ42tzUiEkZDaKQ==
X-CSE-MsgGUID: JVkOiJRpRKSZmpZsYouBIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58697869"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58697869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 08:10:39 -0700
X-CSE-ConnectionGUID: brcN0PD8S1uW7x9KU8KNvg==
X-CSE-MsgGUID: jHAMwL0TQwGeWdJmJRTzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169931128"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Aug 2025 08:10:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us0kN-000Ui1-2s;
	Fri, 29 Aug 2025 15:10:35 +0000
Date: Fri, 29 Aug 2025 23:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2790/2790] mm/madvise.c:297:6: warning: no
 previous prototype for 'force_swapin_vma'
Message-ID: <202508292223.h9TBg6O5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   18ca24a6500a925830b6e87fc4279a7456b57a4b
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [2790/2790] memcg: introduce per-memcg swapin interface
config: arm64-randconfig-004-20250829 (https://download.01.org/0day-ci/archive/20250829/202508292223.h9TBg6O5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508292223.h9TBg6O5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508292223.h9TBg6O5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.c:297:6: warning: no previous prototype for 'force_swapin_vma' [-Wmissing-prototypes]
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^~~~~~~~~~~~~~~~


vim +/force_swapin_vma +297 mm/madvise.c

   280	
   281	#ifdef CONFIG_MEMCG_SWAP_QOS
   282	void force_swapin_vma(struct vm_area_struct *vma)
   283	{
   284		struct file *file = vma->vm_file;
   285	
   286		if (!can_madv_lru_vma(vma))
   287			return;
   288	
   289		if (!file) {
   290			walk_page_vma(vma, &swapin_walk_ops, vma);
   291			lru_add_drain();
   292		} else if (shmem_mapping(file->f_mapping))
   293			shmem_swapin_range(vma, vma->vm_start,
   294				vma->vm_end, file->f_mapping);
   295	}
   296	#else
 > 297	void force_swapin_vma(struct vm_area_struct *vma)
   298	{
   299	}
   300	#endif
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
