Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1CC51C4F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707601903; cv=none; b=Ia7uCIOSMbzeb6Gfblfauj45u9ertpQZX9sfn/h9XMdt0iB8wAoGBf75SU3IQUzaMk4lySuhLte7CBd6XuWZsbjQlm2k/1Xksh1GlKgUx6IfYCvnZRXnjGy49HmgBZ7MZTNBVtHAbkNfOjyYqvK30Cscp3q7jCnY1mvnN90Fqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707601903; c=relaxed/simple;
	bh=a30MdxJTdRhpCcZwSrSqEESqEHKKODn7K7RtPaN+46E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ckhXUTV+lXYlYG22oSk2DGdlBDVAmqWat2U8WdIp+qKIUtBFcjPHPywFx6eXdb4mdtY0zmBstFCzjLP7pbZwOcnmG6W4GKZaSZtLqjQdJ3rOgbvECtvUy4aavjkeetvJT6Nxp0zKsvuwH5Co6QxDploD0DnrPyqzkiWPTb4c+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz7+yP7E; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz7+yP7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707601900; x=1739137900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a30MdxJTdRhpCcZwSrSqEESqEHKKODn7K7RtPaN+46E=;
  b=Cz7+yP7Eq9qltj4SR/OUFvzn2Ma/thOqFBSsC17GGbPKp2zLg8C6EP85
   rpLjNuCDEFPkvBZROfRsE39ir2E7g0354uruufdxGaSl6bvl6qzbe8Bmu
   iSYRCAO4fK1OJ4fxpCcGOAHLypHf0O3rjkQFnBqsdGy/pM3t0LDdJzaqV
   9rPkHjFTyJS1fLo9wPY0OtzlUyAIloGgF8Kl/Hm/ZSdKWJkxB85oqGLH2
   WfGSyUVGBdx89+I69lTV8TY6yWGaQxE4eBDPKBsdmYxrnAagzM2h/ddrE
   xvbjLzKDAtmSkqeAiEuTuZL24h5ZYVGVi19TBPkk6iP7JuLTaMGv7hNMu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="436732122"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="436732122"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 13:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="934728491"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="934728491"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2024 13:51:39 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYvG5-000674-0R;
	Sat, 10 Feb 2024 21:51:37 +0000
Date: Sun, 11 Feb 2024 05:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.8-dango 5266/5296]
 drivers/nvmem/layouts/adtran.c:113:27: error: assignment to 'int (*)(struct
 nvmem_layout *)' from incompatible pointer type 'int (*)(struct device *,
 struct nvmem_device *)'
Message-ID: <202402110522.CxYHpi1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.8-dango
head:   28d064b272e5ddac5987b689fefe36d6c7f524b3
commit: 06790a84c9d33ab94a5ef622a661b05ca75e259f [5266/5296] nvmem: add layout for Adtran devices
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240211/202402110522.CxYHpi1x-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110522.CxYHpi1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110522.CxYHpi1x-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/layouts/adtran.c: In function 'adtran_probe':
>> drivers/nvmem/layouts/adtran.c:113:27: error: assignment to 'int (*)(struct nvmem_layout *)' from incompatible pointer type 'int (*)(struct device *, struct nvmem_device *)' [-Werror=incompatible-pointer-types]
     113 |         layout->add_cells = adtran_add_cells;
         |                           ^
   drivers/nvmem/layouts/adtran.c: In function 'adtran_add_cells':
   drivers/nvmem/layouts/adtran.c:109:1: warning: the frame size of 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     109 | }
         | ^
   cc1: some warnings being treated as errors


vim +113 drivers/nvmem/layouts/adtran.c

   110	
   111	static int adtran_probe(struct nvmem_layout *layout)
   112	{
 > 113		layout->add_cells = adtran_add_cells;
   114	
   115		return nvmem_layout_register(layout);
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
