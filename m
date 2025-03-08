Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B54185920
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741418588; cv=none; b=Cj+YedP6wbl/Az+pOAGzE68k42yVwDgGiNaNrpUDzWNuCUZUpvqUXd/8OO8DLGpVeLvd+XbxBabpy0+niKG6AvAbeHNZ+GFMpdSwQwIfkm3xS6X9URgV1zFCKHyrelIjO8a4serwYgAcbCsL25mrxOBNmnc7UIXuPh0/kRiuDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741418588; c=relaxed/simple;
	bh=dxxo1U9rQrt+yi36jBQycc8P2mMIfLgxMIWZV9KJjKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajKhZ+FwDWVwRr+FsKCGqYFhcL5WrykRfoIElLyOxHklC+bkuPlztM0yWLG3dhSmLWShFxQNMtaFcDv6T2rv4661Sb0Q1lrwHGxgopYs7PqWYDOgJS95mY781xKbsCJFrElPdOZo4S/7M18bhw8nHsdTxpXWdE46/vzrGW0lmPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3EsX3j1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3EsX3j1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741418586; x=1772954586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxxo1U9rQrt+yi36jBQycc8P2mMIfLgxMIWZV9KJjKY=;
  b=b3EsX3j1DApFgfiS3tCudJSaKyBPdRynWP7I8s3y/9Zg/lTBeZpwmWCc
   dIgRl6ehBySSZs4E0NarUBP+BzwEzqKOo/Mv7yaSeruRUDHXp9STpBYlK
   eWjEvOI4FNnaj4EhChvhtPzXfNwxMMKiyPamcS1/RunjdaF63LxD8tMZL
   KIk+2Nq/wGTIhonRZPvzcexMSvd9yh3VJ7ttiZWfHdL8XFeHNeQoCi5Jd
   x29PlPzshlCPeErlx2GR6EJANLXfm4AYKm0p7WYz5/VDgNh6/v/BOctEy
   ItZU92l2fQ0x0ajHb896TWsYv59agBHTnfkYlTv1xCxG35fMff0k1ldZq
   w==;
X-CSE-ConnectionGUID: kuZO8KWJRRaPQZcMQi8qlw==
X-CSE-MsgGUID: fjLKMjwcTLO4Vt37d8B5sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="60025832"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="60025832"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 23:23:03 -0800
X-CSE-ConnectionGUID: fco07inqQdq9hNXb4Wx1aA==
X-CSE-MsgGUID: U5jiuFKVTNqoOLBd0jqLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123696357"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 07 Mar 2025 23:23:03 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqoWS-0001eA-3A;
	Sat, 08 Mar 2025 07:23:00 +0000
Date: Sat, 8 Mar 2025 15:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 84/411]
 drivers/gpu/drm/nouveau/nvkm/core/client.c:80:1: sparse: sparse: symbol
 'nvkm_client_impl' was not declared. Should it be static?
Message-ID: <202503081524.Quf1lkcX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 751ad4ffb2f843a2f22d35beae408ee4bfc9d888 [84/411] drm/nouveau/nvif: rework "new driver" api
config: arc-randconfig-r131-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081524.Quf1lkcX-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503081524.Quf1lkcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081524.Quf1lkcX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/core/client.c:80:1: sparse: sparse: symbol 'nvkm_client_impl' was not declared. Should it be static?

vim +/nvkm_client_impl +80 drivers/gpu/drm/nouveau/nvkm/core/client.c

    78	
    79	const struct nvif_client_impl
  > 80	nvkm_client_impl = {
    81		.del = nvkm_client_del,
    82	};
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
