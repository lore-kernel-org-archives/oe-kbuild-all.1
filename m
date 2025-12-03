Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA52DC776
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753572; cv=none; b=uCFQRELYk/kVEr+spEFygPFoZioB2X5fG8ovdKh71Cs2xaRaTjot77zIWs4S3Nlh7tplpcxbDSYk0s6PIX4O7DowWb+5RleTJ/uLL16kj+eY+L4A/6JJ4Jh7XQEkbj04+jrYpSV5DMIOnYypGJ23wvSEQGLg8tsVd1oZxavDeG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753572; c=relaxed/simple;
	bh=7WM7ztVlQNEF46nSGOjpEqXDeTH4SNIENIwJzNaDyrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/OYwJI4nDMkO2wluPYIVmPdHlBHndBd91BTYavJuXCp1zPab+vgWAHIfjw2eR46iVPV0XUnUNV6gTLlnScIpHWqZZ9nzlRVCYfHLXMRTvwwcfML+wKk0kedLznycWITzXBmn/LKVJFY/5rFpsI/6Eh/QSCnLwjRO00gHjKyvTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgTfHEQI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgTfHEQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764753570; x=1796289570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WM7ztVlQNEF46nSGOjpEqXDeTH4SNIENIwJzNaDyrI=;
  b=bgTfHEQI2GxtQhxz2tyhUcJ37s3NuHEDNs7d9a7SDEtmx2CVjb8jm42N
   MOn3dHaqMh8fjVyOeXe3azOrIVs6dzhFz5N1CGq5VLT8WQXxMYuqb2YsV
   +5jFEMuvSexigTn0l1fJCzlW/5sbm4Y5HQWYT9HEpM6yiPXHwBtK8YSlM
   T4Wk/h6duDUqzXAYm+ym7d8IFR7IJXkiebqBQR6dGGkLaQcE9Qz9VCoH0
   VWNnrmucSq1kcoHImD4fuxAhBiin8HoQqk4yG03z0vsgilqubVIsKb8qq
   La0e0LD9RsW038wUz1emfzxCj1BPEeZfnz3F5N7amoKpD6MWk6wIRM0kc
   g==;
X-CSE-ConnectionGUID: mLPD8BBYQjSLZqsdgyY/bQ==
X-CSE-MsgGUID: SAigvhOyQbaXKMWItEvbqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66815876"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66815876"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:19:29 -0800
X-CSE-ConnectionGUID: uIs71rMeR+eWkTQVmKfh5g==
X-CSE-MsgGUID: Qf9fAHNiQV21OX1er79eEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="193906299"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Dec 2025 01:19:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQj1B-00000000Aof-2klH;
	Wed, 03 Dec 2025 09:19:25 +0000
Date: Wed, 3 Dec 2025 17:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3415/3415]
 drivers/iommu/hisilicon/flush.c:170:13: warning: stack frame size (2240)
 exceeds limit (2048) in 'ummu_tlbi_range'
Message-ID: <202512031727.TzoJZqMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6a67952a484c93a1fcde2126e6a9b553b8022b03
commit: f12801f364f23453a32fe7b4e66ca080156bc58a [3415/3415] iommu/ummu: Add UMMU cache flush interfaces
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512031727.TzoJZqMA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031727.TzoJZqMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031727.TzoJZqMA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/hisilicon/flush.c:170:13: warning: stack frame size (2240) exceeds limit (2048) in 'ummu_tlbi_range' [-Wframe-larger-than]
     170 | static void ummu_tlbi_range(struct ummu_tlb_range *range, bool leaf,
         |             ^
   1 warning generated.


vim +/ummu_tlbi_range +170 drivers/iommu/hisilicon/flush.c

   169	
 > 170	static void ummu_tlbi_range(struct ummu_tlb_range *range, bool leaf,
   171				    struct ummu_domain *domain)
   172	{
   173		struct ummu_mcmdq_ent cmd = {0};
   174		int err;
   175	
   176		err = ummu_domain_tlbi_cmd(domain, UMMU_TLBI_SCOPE_RNG, UMMU_TLBI_SCENE_DMA, &cmd);
   177		if (err)
   178			return;
   179	
   180		cmd.tlbi.leaf = leaf;
   181		__ummu_tlbi_range(&cmd, range, domain);
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
