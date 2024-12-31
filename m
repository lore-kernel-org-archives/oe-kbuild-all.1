Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB910F1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735635023; cv=none; b=ULoau97W8AKx1OOcqAMfAMt4F4QLuNPEz8bf4wDnARVOW3p4Jj4wYIxev3DLSOU1m+NMGGzwhjCGiCqK1fl2Qx3niM4nC4wml7s8biOdqxzVfA5tpegFVFbV9EZEvWO9C7cxIDj4dLWmdK7jXKM4cmPBuEcgu1wUk7+Gnncmhy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735635023; c=relaxed/simple;
	bh=H0dQbx6GynaRX+ycUO+pMhGCj8gEU1nOHnHKEzuErLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXQCQrTtaIlk7qz/4BlRRqdjht8bmwgtQL0Et0CkVaq04qqXUEp2pYbCmcIB96v4t8SYHVRPWT6bIWeEEzhmGjCdr3j1PK6rQiAkzhQur0zOD1lDD88CtnGKDO8qzSdHBnF6y8YV2lauTkGmqVvSqw9xEZOMMDavroPB4wdOcoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3Y7GjnC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3Y7GjnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735635022; x=1767171022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H0dQbx6GynaRX+ycUO+pMhGCj8gEU1nOHnHKEzuErLU=;
  b=k3Y7GjnCtQgN1ZqXvhh8exTOuCTK119qi1pQTIozu5hBtBEuCaaNx5Ty
   LwLzNzna1qtpStwvFgL0PjJ3vhdfVPuEo5AZWF39FXMaTo/Tek40a5PYe
   iDYyGQMOw7TUn1IBscOgoqqeDHNcSWrCv8o4Oa/k8h6W9VyUv2WJpziKY
   seL6XKZpLicdNvUlZLkzIkQcVlOI7JPslnepzDqGERF3nomC2Dr6gt0LW
   HFsdvLwiW05Nd2QFc7ZzOeP8PMo5lBxdWfffJhXuQhe0jkE2xmITrIGcC
   GWg/H+eht124dmqcCnXGmHqsRMR18iLuHhdArEjH7QDa+cDsWt1W5LikV
   A==;
X-CSE-ConnectionGUID: YPNd8x7RRbKzgwbuTdQJfw==
X-CSE-MsgGUID: P2oLro+1T3632iTuVRuluA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46504137"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="46504137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 00:50:21 -0800
X-CSE-ConnectionGUID: 3H4KxoUYQpCm0UwUHqqPOQ==
X-CSE-MsgGUID: 5DdH3kvjSSuBotHIndLbsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="100838541"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Dec 2024 00:50:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSXxB-0006zz-01;
	Tue, 31 Dec 2024 08:50:17 +0000
Date: Tue, 31 Dec 2024 16:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 483/5236]
 drivers/accel/amdxdna/aie2_pci.c:549:39: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202412311655.YBvq2wJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: 850d71f6bf4c2010efae845f9ff841cce902f22c [483/5236] accel/amdxdna: Add query functions
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311655.YBvq2wJb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311655.YBvq2wJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311655.YBvq2wJb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/accel/amdxdna/aie2_pci.c:27:5: sparse: sparse: symbol 'aie2_max_col' was not declared. Should it be static?
   drivers/accel/amdxdna/aie2_pci.c:311:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/accel/amdxdna/aie2_pci.c:313:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/accel/amdxdna/aie2_pci.c:549:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char *buf @@     got void [noderef] __user * @@
   drivers/accel/amdxdna/aie2_pci.c:549:39: sparse:     expected char *buf
   drivers/accel/amdxdna/aie2_pci.c:549:39: sparse:     got void [noderef] __user *

vim +549 drivers/accel/amdxdna/aie2_pci.c

   528	
   529	static int aie2_get_aie_status(struct amdxdna_client *client,
   530				       struct amdxdna_drm_get_info *args)
   531	{
   532		struct amdxdna_drm_query_aie_status status;
   533		struct amdxdna_dev *xdna = client->xdna;
   534		struct amdxdna_dev_hdl *ndev;
   535		int ret;
   536	
   537		ndev = xdna->dev_handle;
   538		if (copy_from_user(&status, u64_to_user_ptr(args->buffer), sizeof(status))) {
   539			XDNA_ERR(xdna, "Failed to copy AIE request into kernel");
   540			return -EFAULT;
   541		}
   542	
   543		if (ndev->metadata.cols * ndev->metadata.size < status.buffer_size) {
   544			XDNA_ERR(xdna, "Invalid buffer size. Given Size: %u. Need Size: %u.",
   545				 status.buffer_size, ndev->metadata.cols * ndev->metadata.size);
   546			return -EINVAL;
   547		}
   548	
 > 549		ret = aie2_query_status(ndev, u64_to_user_ptr(status.buffer),
   550					status.buffer_size, &status.cols_filled);
   551		if (ret) {
   552			XDNA_ERR(xdna, "Failed to get AIE status info. Ret: %d", ret);
   553			return ret;
   554		}
   555	
   556		if (copy_to_user(u64_to_user_ptr(args->buffer), &status, sizeof(status))) {
   557			XDNA_ERR(xdna, "Failed to copy AIE request info to user space");
   558			return -EFAULT;
   559		}
   560	
   561		return 0;
   562	}
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
