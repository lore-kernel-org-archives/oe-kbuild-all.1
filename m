Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6626984A52
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860989; cv=none; b=Ovc6tTg+Nlerjvg63PBD7KjboyT2WZ0zPCNrlrBDXJKgNQdpmOkzdO5h6Zc1DFAtK43NLZ/fnwprUrnMYCzOKnq6sH5ZBbE2G09Okxgb7St5BlpZyYpglSVEAEhoKCWwH4LxUqE+C6ZiQ/uX9JjyRVJcrAlbTnPc3qM97k8AvGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860989; c=relaxed/simple;
	bh=So0u+R9coiZoqEjCuMqLzQJYazHnsXQol97+1xWQZk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbLYjjUCo505B5y1MAOYS6VKLdEUAaKAu3KMx5qCps8CP7WTz4hJsWh3lTYpS+c8ST28zYcWSdSCEasOTJdTgdZM9ACTPfwtz9lXMIButBpyOKsysIqK8I8NJsHfQVh70osp0iqxs0Tz0lMqHZ1PGdBDC9CdadAxlOFNMnl6smo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZv95pIG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZv95pIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727860987; x=1759396987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=So0u+R9coiZoqEjCuMqLzQJYazHnsXQol97+1xWQZk8=;
  b=fZv95pIGVlKF1uXCHjthhmylzVihRXceqBti9dOvg2ytM75cgjea+RB0
   D0/J6LMwAOfJZ+M2eliZjA6w7qp+E83XlSDhuvaXbLKDB7vpuBmFwyKU2
   fNfc8ok1ZEhzabnaXunGJPzhGKqPeneazb6nFNsiK0u5Az3cukhQp3BM6
   KClggJv9giKemdZXbmtgSszn7E/Xuqcgp4BvCBOPZwRREVijL/YRRsABh
   43ieMfJ6GTPrUEHk2ved3/4pg+GmZA/lGQOgGL+AKLWislr9w9Q343ogM
   78/3h3TPZpHn9tm5JVHjVywIU6S9xb48Ozy9bz12hTDOLcGKtB026qqhl
   Q==;
X-CSE-ConnectionGUID: GPLvH9cAQD2Ga0fT6kdXSQ==
X-CSE-MsgGUID: Px1DTAI5ScqkGS0trqa8MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27151007"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="27151007"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:23:07 -0700
X-CSE-ConnectionGUID: 1+EP3+ycRv6dYeIQ2vdpZQ==
X-CSE-MsgGUID: 4L8Rdp7YS3e6l7WTh+UwsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="73544625"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2024 02:23:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svvZX-000RqR-34;
	Wed, 02 Oct 2024 09:23:03 +0000
Date: Wed, 2 Oct 2024 17:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 23/37] mapping.c:undefined reference to
 `iommu_dma_link_range'
Message-ID: <202410021731.YDfqGEL2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   c8e953c706efd3d98534690febad481e0f4900f3
commit: 78247ef44762361923b517ac8f4370d19a459372 [23/37] dma-mapping: implement link range API
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241002/202410021731.YDfqGEL2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021731.YDfqGEL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021731.YDfqGEL2-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: kernel/dma/mapping.o: in function `dma_link_range_attrs':
>> mapping.c:(.text+0xc28): undefined reference to `iommu_dma_link_range'
>> mapping.c:(.text+0xc28): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iommu_dma_link_range'
   or1k-linux-ld: kernel/dma/mapping.o: in function `dma_unlink_range_attrs':
>> mapping.c:(.text+0xc40): undefined reference to `iommu_dma_unlink_range'
>> mapping.c:(.text+0xc40): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iommu_dma_unlink_range'
   or1k-linux-ld: kernel/dma/mapping.o: in function `dma_end_range':
>> mapping.c:(.text+0xf14): undefined reference to `iommu_dma_end_range'
>> mapping.c:(.text+0xf14): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iommu_dma_end_range'
   or1k-linux-ld: kernel/dma/mapping.o: in function `dma_start_range':
>> mapping.c:(.text+0xf34): undefined reference to `iommu_dma_start_range'
>> mapping.c:(.text+0xf34): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iommu_dma_start_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
