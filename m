Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00A207A09
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 12:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082238; cv=none; b=igEfUYxLPLq5k8Ze64/jkStHdfP5WdukP6uBkni1byYbsSowiRce06yLk+dd2VHl+vniI6zQlIUnJEB/jBuNPHVbY91exr/SQx+EK5ij4diJ3cYAuZN+/yqZcLLt2dKLPZZIC5IGJXfyq77m+QVmOXSP8MeH1Y7OVtRly1YLyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082238; c=relaxed/simple;
	bh=fddIJo/zyCaDHu7EXTv2dnvP4efPGx+Zn8xARp6utNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o03N6hcEh1HXmCsg8idAH/xAWtqEQdp3VXVUU38oVp5YgTSLeJ5Iykxh2oJIft9VQHqKQ8Du/fvrTCVfwyjtRXUVr4CKCoYXamdBiWJPSLYx4VxYELOQi9Lh0WpxdyoUWPcvpPVMwnHw9mP/ojc+NNPgPMyb5E8SEg9BgTGL//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VY/flANG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VY/flANG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729082237; x=1760618237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fddIJo/zyCaDHu7EXTv2dnvP4efPGx+Zn8xARp6utNc=;
  b=VY/flANGXi8SZ6HF8GPaGGnD/KRy/Kqb6GLlXQZ8BynVNPMdwmeJdP7Q
   asPs3pRP1hRQauRh8pEYGasnMDiXsaE796qF/62IV+cJGI6RZ1DQajAtj
   I/dlcrjNqfEH5kujQ3JpvE2koPInDCA+2BCEP7qSR9FjDXniXgTWQWcId
   AlMZCbeUUCL8fRYXzBBtbJl7XyYeGfXAnDBuQfonVpD8hyufeX1mdUtn8
   XJtN6/q1I3fRLJHIFo65VwXFZvAVa7OW7GxfvxS81cD+flZNOT7mHEqXx
   2gF5FkVMJPAdhJIn/zmBeLWprcJXR/4er/lm3QzLVpBoQNpLiKORBvWYr
   g==;
X-CSE-ConnectionGUID: 5KPBkZ0uQaW6ZKhtVrBGMQ==
X-CSE-MsgGUID: rNjg1EHySDKzsU9Ki0Nkig==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39895454"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="39895454"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:37:16 -0700
X-CSE-ConnectionGUID: DpR/6q5ISSuEewVHj4uPKA==
X-CSE-MsgGUID: qtVVCPgBQ6ip8CYGEb8fRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="115649703"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2024 05:37:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t13H6-000Ktp-2A;
	Wed, 16 Oct 2024 12:37:12 +0000
Date: Wed, 16 Oct 2024 20:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241015 28/31] ERROR: modpost:
 "pci_pasid_ctrl_status" [drivers/iommu/iommufd/iommufd.ko] undefined!
Message-ID: <202410162056.cqnoBgJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241015
head:   ae72d800637663411a51ca0d1484213fb8b523bd
commit: c18667ab4daea9372e2be06e1d3f61533d9e29fd [28/31] iommufd: Extend IOMMU_GET_HW_INFO to report PASID capability
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241016/202410162056.cqnoBgJb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410162056.cqnoBgJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410162056.cqnoBgJb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pci_pasid_ctrl_status" [drivers/iommu/iommufd/iommufd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
