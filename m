Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34D92E7BA2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635678; cv=none; b=IqdswOYRDVms7sOsP2j3ApMtIAGfDfw0zX/Tk9CixlqmYYZ1CLNPWKUeao450V0AxIpo9g5EgnxWPez6+C09aIv+lhln4noBQDvcECmvLb9/tx4wtTKfkIpCUgwp2GkY3WC8PP2L2sPYQ4LtCnhfxrWP5dQPKJDYycOpv8fKECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635678; c=relaxed/simple;
	bh=0qoYUtMXPB0slkC9srEVJpStQSqkf2TV+6fkzzHAgWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TH/+/YRMQTBI2OS8Ih4vvsnF9u2UZ3cvLJWmtWnV/A3G/5do4BQBjlhs3tZk4gCweqGsblzXiH9Krz+x+YHRGy1ToKaGTzJD7LrpD8/NMMOipnY2h3oqgetE1QXe+s0944gk5aUtTvovlhx+hh91ydw1RA72ZJspI93E/MeQCmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLCB5S8M; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLCB5S8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763635676; x=1795171676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qoYUtMXPB0slkC9srEVJpStQSqkf2TV+6fkzzHAgWI=;
  b=FLCB5S8MjLYoe35nCGuy1NMYvmnOjNCywYlPEO1tov43o+WHi3iEIwJ8
   QXvDa0FM4bfvkbsj9dDzTVtlHaSzbzIb+5C4Zw7eGAL5MssA2NYmtTm2s
   YCI2te4a7h8dWkqOQICsXbYbqSZx9+v9gKgNqW9vmTlslEtyhHr22E6fD
   6uaiSrTdNqnvOfJmtR0cwNofrDN9R8lMT2eNxlnLd+8FGJIQXHefEVLXY
   jW83Phgu0HhkXHOcuJ75Fzz9eWNXvBeBpq4X30FwWt4Br07eg/EEi2eoq
   w5G5+fsYa6eA/pAvS4CmvmIhS+O49VSj/PB0LFO0GAkmsP8iJR62Yj2kF
   A==;
X-CSE-ConnectionGUID: KYisnu6cQumcmktA3AsDzQ==
X-CSE-MsgGUID: AFfk46WFSh26lHIF2xP5Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65402360"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65402360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:47:56 -0800
X-CSE-ConnectionGUID: KOcZwRI9Swub6KqZnjd+MA==
X-CSE-MsgGUID: FH79Z8w2Sx6rD2qh9QVo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191459819"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Nov 2025 02:47:56 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM2Cf-0003rp-0q;
	Thu, 20 Nov 2025 10:47:53 +0000
Date: Thu, 20 Nov 2025 18:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-borah 2/2] ERROR: modpost:
 "pt_iommu_amdv1_mock_reflush" [drivers/iommu/iommufd/iommufd.ko] undefined!
Message-ID: <202511201839.MNrrctPc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-borah
head:   10635ad3ff26a0e94b4ab147ac32c63f9b7c42ff
commit: 10635ad3ff26a0e94b4ab147ac32c63f9b7c42ff [2/2] DEBUGGING: Force flush the whole cpu cache for the page table on every map operation
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20251120/202511201839.MNrrctPc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201839.MNrrctPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201839.MNrrctPc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pt_iommu_amdv1_mock_reflush" [drivers/iommu/iommufd/iommufd.ko] undefined!
>> ERROR: modpost: "pt_iommu_amdv1_reflush" [drivers/iommu/iommufd/iommufd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
