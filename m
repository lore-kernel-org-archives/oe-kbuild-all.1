Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B9D198E92
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736322699; cv=none; b=AAydQ0RYC6vvAdG3wQ1Ds0YMok1dVhorlpTM6ss/OPfnVyn7xR4VxIi4CQ6h9c9OLzwv/eyps3shK/aMUFULjPpyGYGQh+BRyF7Q5EE0ElOtYJS5TocPBeMixAsc8KzshmxwmRPOGIQ0VOav7lGUudE3gFMhgeqMBzWmhF1JqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736322699; c=relaxed/simple;
	bh=XKcVd49/uvGb0OKmJJtY0h5H+0P4HfbGJQ3dWY12yfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rq9b1+f19CAWIsPRUjihIi3RQrlWGDgxLLSRStWzbuIgS7gOYl2RMd/1+61BkMFvDZIOPmPHpi/Qp0DLmc3fSliozKa/k8+xFlwRQbnjYSkyPMed6LSwK++PhgbFgc6zUck/FbWqJB6daL0IsISZu5C6uYncWIAUNHm4mq5YLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfIu/7Qt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfIu/7Qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736322698; x=1767858698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKcVd49/uvGb0OKmJJtY0h5H+0P4HfbGJQ3dWY12yfU=;
  b=TfIu/7QtkzGABIzNk3o8jWWzIVZIaZOuVyEm5PLmDwf8927rNLwEqzYl
   LU7UcbXm/T49cdEQCBl9taB/5tH2hXjT7r08zEVp1+bkLzGyFPErX/yIw
   brLrGryrA+aa68rFR3gDRUJwk0tQICxtgPg40pRldVUf1sJCailV9fCMR
   WyOtM2qGcaqmWvrP2lSlHS6zIXLRmtsjb9Csn7pzI6kn7aQnZpqTaMZGM
   aHx+0dTQ1uOW04C/7904nimU0MGC5hC2JUSjTDELXymA6zCNxHhuHsyz8
   x5zbbD3ioYSEPTm3le5tN3uB/TdRqC+IMsJHpZzaXkOao1GiuUC+ZvQb/
   g==;
X-CSE-ConnectionGUID: Cadd61JBQmeQC0+ztknpRg==
X-CSE-MsgGUID: FONUAOVuQ8GSLYg75YfKKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36418243"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="36418243"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 23:51:37 -0800
X-CSE-ConnectionGUID: nQ1ZyJLjSG65gXPewkbbKw==
X-CSE-MsgGUID: COghrSz7QzGzIQMi6ayEcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="103079738"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jan 2025 23:51:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVQqj-000Flu-2C;
	Wed, 08 Jan 2025 07:51:33 +0000
Date: Wed, 8 Jan 2025 15:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Vikas Gupta <vikas.gupta@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sheetal Tigadoli <sheetal.tigadoli@broadcom.com>
Subject: drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function
 parameter or struct member 'fw_shm_pool' not described in
 'tee_bnxt_fw_private'
Message-ID: <202501081535.XpNcCyyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
commit: 246880958ac93989c97c73ae1e60b78b4c4c88c5 firmware: broadcom: add OP-TEE based BNXT f/w manager
date:   5 years ago
config: mips-randconfig-r015-20230807 (https://download.01.org/0day-ci/archive/20250108/202501081535.XpNcCyyG-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081535.XpNcCyyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081535.XpNcCyyG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function parameter or struct member 'fw_shm_pool' not described in 'tee_bnxt_fw_private'


vim +62 drivers/firmware/broadcom/tee_bnxt_fw.c

    50	
    51	/**
    52	 * struct tee_bnxt_fw_private - OP-TEE bnxt private data
    53	 * @dev:		OP-TEE based bnxt device.
    54	 * @ctx:		OP-TEE context handler.
    55	 * @session_id:		TA session identifier.
    56	 */
    57	struct tee_bnxt_fw_private {
    58		struct device *dev;
    59		struct tee_context *ctx;
    60		u32 session_id;
    61		struct tee_shm *fw_shm_pool;
  > 62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
