Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FA82481
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884061; cv=none; b=rVJcJf9ZeLw7nDz0CpRP5O9St36Tn3SD68jtdUsLs8/PFddq1dbAUO+Yd5kE3OE0oN7GAx3mFrBnfleeOZ9tsrdOWBO7odCpDHYgHyxW4ixjBzhtLDAyu5w7WfPMp8qzdcAx15bCkOojiP89B5WW08LFwfwU18LWgUSAILTrug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884061; c=relaxed/simple;
	bh=dTVEs2LxMnvBCkN5OTt0tO/voEOZ/PfGFutqnEEriAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bxxQfxl7ZyBM+gkvSDmSvRTYdzKXajPPpQxKFamxuk7KXQWuBNm6BZWb/wGiU6xGLOzD87jUsEklsfBjj3hqsZ7jCyUjg0pV3870p2N7MQlaJZr2sfKfAjzGM2z0ZBjRwDdzXCqOtokoxeIklgEE1Tvgk6NcOLoZxYdZkStbwTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSG3MFBT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSG3MFBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725884059; x=1757420059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTVEs2LxMnvBCkN5OTt0tO/voEOZ/PfGFutqnEEriAw=;
  b=DSG3MFBTQN1jkqkUAUwfVlMGVBWLSeIbpgEZQAFjhZWbl4ewtPtdvhwV
   f5YfFNNQH91zONlNS+Hh8ZuhFQbe7K/YQAgA+yVoOD6xQdylBE+9VgmR9
   VNoeV+nGMbwQlPhoPJahGRJsW5pD981QBYmQ3n/cqd2F/gdHNbK4LV3ne
   B225vCRzgfrvSXuYv5BpebL6JzV/41cEaJwEBeFgAH4l/xgbXpfj1d4Ty
   1lrZHK5ooowU6gDZ07wfODGZg4XFD+X1B+0Q5+Yq7ZMwJY6Kov5QPjL1h
   hMcKJ2dhSzRbYzS7OlvCm1vw3+IDTIbEu57Cr9oAA18m9SKtdwRmRY/of
   A==;
X-CSE-ConnectionGUID: isF4bQH9Sfe/8BpM0RbOcg==
X-CSE-MsgGUID: 0S3zUgk0STyAUZvUgPgkVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35168288"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35168288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 05:14:18 -0700
X-CSE-ConnectionGUID: 06ZeEZKFSviUElJA8+9OYw==
X-CSE-MsgGUID: D1iL7HlySrC7iIUxPrT/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71435917"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Sep 2024 05:14:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sndHW-000Ege-14;
	Mon, 09 Sep 2024 12:14:10 +0000
Date: Mon, 9 Sep 2024 20:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7777/10951] drivers/iommu/amd/iommu.c:69:30:
 sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be
 static?
Message-ID: <202409092049.ixi8uuu1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95e99651a23c1ccc103007c3b0532ff97d7c357d
commit: 48b9cbca2d0ec8d9fc4f05fca1243995f8cbc4b4 [7777/10951] iommu/amd: Access/Dirty bit support in IOPTEs
config: x86_64-randconfig-123-20240909 (https://download.01.org/0day-ci/archive/20240909/202409092049.ixi8uuu1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409092049.ixi8uuu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409092049.ixi8uuu1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/amd/iommu.c:69:30: sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be static?
   drivers/iommu/amd/iommu.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:241:46: sparse: sparse: self-comparison always evaluates to false

vim +/amd_dirty_ops +69 drivers/iommu/amd/iommu.c

    67	
    68	const struct iommu_ops amd_iommu_ops;
  > 69	const struct iommu_dirty_ops amd_dirty_ops;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
