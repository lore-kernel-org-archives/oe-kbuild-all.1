Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3271F95E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709650191; cv=none; b=itPp8IS1RbgZVGiYOC5OvM2EI9xExE35e6bPzfj5Dt5G3Z1KlugmxcEo/zzqKZ9flI7YGomMzb6QndRlEITlApVG4pVJRydvY4yd4A9BUl7fnj6TvzTV8dQfwWVozgIHU0UZpTcktAztRRAla0Ppvb3Mic2EIdtUBuOuDrOzwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709650191; c=relaxed/simple;
	bh=q6PxMzsms+RNqq5wefCzHJS+NgwotqhcrWkCnzNbrsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B4AunEj5XCh7ADUlPwVsD7P0f9XT+LL6ehjepzs3da/YrrgsynHF/Wh4vV8+xbo3hyjx+YmkQRJpmxy/Dx26uVqBEeZsPwbV4Xq//r2QoTU1BB45y0MQwuMCQjQcXS0Zs23Z/WmvW6q8kkzueqNhAzSxxjIf/2P2GWSD8VZljL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRhWxJ+Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRhWxJ+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709650189; x=1741186189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6PxMzsms+RNqq5wefCzHJS+NgwotqhcrWkCnzNbrsg=;
  b=eRhWxJ+YXmIZBjvk6gcFtF9w6CWPwXbkcSMfb+W1Ejp169eYS4URG2Rw
   /a5dRr0UMK5qdRQfEDNMsZ+R2auLWqIgxR94l1COHX4oWYavzvbpoTe+k
   9/gDhHbAUa+qH7p5aOF878NMNpl+/kIfN82/Pa1AbWaK2LX4R5HDmMoVj
   YclbifVEjKMObn0L/FB9xbyy7U10CMRT0y9YImovgO+qWMKFYVTayNNSy
   YaIy3vG6WUrC7bpTujln2JHHCgboR2OxwlCkc/pPOzpHgDu4Vbn9/HDiM
   pOutSuC+IEK/nrWT2XzTpmM7giFKQApHOEqBganl4kpZjfq2fuxpP0btq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21663741"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21663741"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13966682"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2024 06:49:46 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhW6x-0003Nn-1h;
	Tue, 05 Mar 2024 14:49:43 +0000
Date: Tue, 5 Mar 2024 22:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/acpi/prmt.c:53:1: sparse: sparse: symbol 'prm_module_list'
 was not declared. Should it be static?
Message-ID: <202403052238.PNESjOFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: ad03ca994ff0746ea484384b7ed5e1391a715a62 ACPI: PRM: implement OperationRegion handler for the PlatformRtMechanism subtype
date:   9 months ago
config: x86_64-randconfig-r132-20240305 (https://download.01.org/0day-ci/archive/20240305/202403052238.PNESjOFx-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052238.PNESjOFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052238.PNESjOFx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/prmt.c:53:1: sparse: sparse: symbol 'prm_module_list' was not declared. Should it be static?

vim +/prm_module_list +53 drivers/acpi/prmt.c

    51	
    52	
  > 53	LIST_HEAD(prm_module_list);
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
