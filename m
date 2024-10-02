Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA919882C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862190; cv=none; b=ciJGAXWPHXTuuJHszsE+k/Rfg+9gFUBXHcnvtATRs5NyHo0i1zxttDyOA9X5vQf5FqlqcqHPE2GGMSpBfHYRPiByv4mmWr41+HCMCs/8IN8C+MgOgHK9ZMlTWq0YbWhDPFdfB8nmv/lLlVFWJEGOHPgbVSbg21uZlDWRNeRXFPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862190; c=relaxed/simple;
	bh=g0tb/2xMnKhgX6w8vUGUnQOm1KyrESdIOHsglrz//yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ap4AXvfkqmoa0GlcFGRf3DSqhKiiawYZ9s+EbkTHmOpLcHREmA6TdjZNRlOTauX0Yw0xBNjS4PQWQ3kop2b14HRXD1afqAQYfhEiYbfJekIkIaXwk6XhcKjdxE/Q0ScSj/X9VDniGiDE4QJZSWVqKb066CVKqAVJ2CvTHRQQPKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjbSI+ce; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjbSI+ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727862189; x=1759398189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0tb/2xMnKhgX6w8vUGUnQOm1KyrESdIOHsglrz//yU=;
  b=NjbSI+ceNCu2pj0/3GHD3IsmukjlxbvZf48cTS3Q2QirGTsWeFt5QiRp
   YEWp7kPMI1GtqM3W1KkW96J6l9uG9xyZWT1Dh0vu+NpZc5BNTBFSGbOb5
   P2XFa4G6DjpEiQ+8EbxGarKCzL8RN5AlSFPRCkttxB83IbxZYXWmUhIXM
   RVjwbBvCSzWfmo0kcD11dXzaFbHEn/Hi6ZB76rNHENfpWVYDwOBOBuky+
   b/LOYbmSdDYE/KJvAhADRrZTRSHnCKqQWpgm09yGR3KyprfXKi1xJLQur
   c+91pznbcK5P7TEm1EL2b7ODYC00vd1uxqoowjHdPYEd7G7GE8Bxu6WSG
   g==;
X-CSE-ConnectionGUID: UzQo3XUHQUydQNx+VEJRSA==
X-CSE-MsgGUID: l1tWuO3NTnOVbyWwqkyRjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="52425645"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="52425645"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:43:08 -0700
X-CSE-ConnectionGUID: bzVlgygDShurHdf822BqWA==
X-CSE-MsgGUID: GGLTkEcpQX6of17/+MvKqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="73934535"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Oct 2024 02:43:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svvsv-000RsQ-1y;
	Wed, 02 Oct 2024 09:43:05 +0000
Date: Wed, 2 Oct 2024 17:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 23/37] csky-linux-ld: mapping.c:undefined
 reference to `iommu_dma_unlink_range'
Message-ID: <202410021749.XGT3V35F-lkp@intel.com>
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
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20241002/202410021749.XGT3V35F-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021749.XGT3V35F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021749.XGT3V35F-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/dma/mapping.o: in function `dma_link_range_attrs':
   mapping.c:(.text+0x6da): undefined reference to `iommu_dma_link_range'
   csky-linux-ld: kernel/dma/mapping.o: in function `dma_unlink_range_attrs':
   mapping.c:(.text+0x6ee): undefined reference to `iommu_dma_unlink_range'
   csky-linux-ld: kernel/dma/mapping.o: in function `dma_addressing_limited':
   mapping.c:(.text+0x78c): undefined reference to `iommu_dma_link_range'
>> csky-linux-ld: mapping.c:(.text+0x790): undefined reference to `iommu_dma_unlink_range'
   csky-linux-ld: kernel/dma/mapping.o: in function `dma_end_range':
   mapping.c:(.text+0x7d4): undefined reference to `iommu_dma_end_range'
   csky-linux-ld: kernel/dma/mapping.o: in function `dma_start_range':
   mapping.c:(.text+0x7ee): undefined reference to `iommu_dma_start_range'
   csky-linux-ld: kernel/dma/mapping.o: in function `dma_opt_mapping_size':
   mapping.c:(.text+0x800): undefined reference to `iommu_dma_end_range'
>> csky-linux-ld: mapping.c:(.text+0x804): undefined reference to `iommu_dma_start_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
