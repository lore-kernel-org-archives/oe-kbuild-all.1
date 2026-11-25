Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649060;
	b=Mdpm9kGrMQlZOm+28oIHx0oUJdo7FA6RJg3jEXkTse4AcMW1jDVcWE+ZJKhgHBrPqjPt
	 iroCaTvkIBAYgWcgbMTbe18CV+Ci8eosRmap6Zg+AAQqCm/WhtvxutDYe6ZJSXJ82h2Yu
	 eS4eOZlPYWktWZGBc5pHxCzHa/e+/8pown5mWvDZSzCQzMQzsBK6c7oFwsxJWd78DTsO9
	 vERfmLnJKfQutvuyPBtkHx221pExh3igcbWxy8UaTS/+VDgNr6E59SgsMkftW7tNHesJ1
	 HjtzmyKOHw/y63mBjusFITGGcDwHcK9fz1YyhWJoYNzHvy8qqy3hmG8MF7UfGrRg65g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3VK/njDmtXMrmvY0eLdr38g22qurVWnzSvLaSSXkrKY=;
	b=ePhjxhPOJvpcAICq20m3qE3umnSImLtTxi/+nj33ZyJacDS93EKkBpjdDgbPTHcOVu1e
	 ZOQVtFm27DPxQFZ9+gBCK+eWMl1jAxW0lMdSAK8qwIWndJws90oGLzp5iym2f0GrWmZLN
	 rWfreUanNnzZKgaG4InqsqF02/0bC49p6rLOWWoxKpOYteyr2+bFiF1O5/Md2wN8/6WbE
	 lpgK/v/QPuwZMjE4hWeEWjf6kwgzsrSWS9dmkI4mHep6akfVXVaiyG+F+MbBmycq/0Rdc
	 LOPPjEa1vCc+YNmMU8+SF6ksb+7rPyrYnWcnsZfLTEZI0QtDWGwyC7C071noMKj8qHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=birvXl96;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B7E606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 23:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=birvXl96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795649060; x=1827185060;
  h=date:from:to:cc:subject:message-id;
  bh=MtmTHV7B9hKGlwwtlThbC7fqY5Vb0EQTRnFGXpVBeW4=;
  b=birvXl96wg/jz1jYxhXanTfFL4yqF2M454GcopPUULxXnipOpANxanh0
   +lXa4vZq1rv8ZY4gVt3TX9sIwRp2KOvvU/Cjmz64ebxlH/iex5Zituyph
   A0abA4lNXfCqz5ePtvlnPDPu7RcKWkwQvhDSHIFqWTk9w9PskS2FF/79v
   KcYH7KUdfN6BLYq0B25aXbmW5Hgz/q6hxjEUdw/aZ/6b0vz2XnrMb5XWM
   D4yF+0RJ2bO+Y3CEwlJbBDloCrt75dE5QFrr7jHwpez7zW3TN7BhJOaen
   ninHPx6K7ishMs4DsDbn+rMMR9yOadtFPh+MfqW2k5RXLL89JjXJsSYL4
   Q==;
X-CSE-ConnectionGUID: uWKZBLAHQqC1ojtahGhKjw==
X-CSE-MsgGUID: Y68vtLwLSKC5OyzKu25MAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4628819"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4628819"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:24:19 -0800
X-CSE-ConnectionGUID: C5bsti7USSKKVCIqDDdfyg==
X-CSE-MsgGUID: kzsksN8uRJm+3OFfK8M0yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12244650"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 15:24:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWMLX-00000001SsA-0OYj;
	Wed, 25 Nov 2026 23:24:15 +0000
Date: Thu, 26 Nov 2026 07:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 51/104]
 drivers/iommu/riscv/iommu.c:1363:30: error: implicit declaration of function
 'virt_to_pfn'; did you mean 'virt_to_phys'?
Message-ID: <20261126071205.a5FHx1US-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   d77c0270e18de0b01434fec8027d8a61ae1f7c00
commit: be5d2309758668a467fd2d50931ae6a12b44552f [51/104] iommu/riscv: Prepare MSI table updates for interrupt remapping
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261126/20261126071205.a5FHx1US-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126071205.a5FHx1US-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126071205.a5FHx1US-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/riscv/iommu.c: In function 'riscv_iommu_msi_table_set_dc':
>> drivers/iommu/riscv/iommu.c:1363:30: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
    1363 |                 dc->msiptp = virt_to_pfn(msi_table->root) |
         |                              ^~~~~~~~~~~
         |                              virt_to_phys


vim +1363 drivers/iommu/riscv/iommu.c

  1358	
  1359	static void riscv_iommu_msi_table_set_dc(struct riscv_iommu_msi_table *msi_table,
  1360						 struct riscv_iommu_dc *dc, bool activate)
  1361	{
  1362		if (activate) {
> 1363			dc->msiptp = virt_to_pfn(msi_table->root) |
  1364				     FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
  1365						RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
  1366			dc->msi_addr_mask = msi_table->msi_addr_mask;
  1367			dc->msi_addr_pattern = msi_table->msi_addr_pattern;
  1368		} else {
  1369			dc->msiptp = 0;
  1370			dc->msi_addr_mask = 0;
  1371			dc->msi_addr_pattern = 0;
  1372		}
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
