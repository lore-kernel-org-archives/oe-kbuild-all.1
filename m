Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5134A4206B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715590338; cv=none; b=mYBbalyVGYZToFO/Wn14VmVTlEexeEkg6oDGSOUYvwUABFQHRDYiTPqImG1qM86aP9r/4s4FtsRjim8NC/9QSoC8Y7WtkyPGcAurrot+MY7aIlWMiavBnnuSZ5sjJEH1zoxiaF/QvnNMPWpUVhKXse2V2Nb91k8iaNgaZ1GWBe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715590338; c=relaxed/simple;
	bh=1hVa2f84aE3Yj9e543++WbKQAwUbxZEUkdSFB3mU3L8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r3xER1VM86txKCDHRZm2cq1G5RoGQ+ZObUjGzGlV31kfBWskv8h6QeMxSyabCmRJH9KXpQf7sxe4rq0QD1/I/6yrBMjvvhkR7ePL9dUJWOTLqQfnSWywWjWRqnvnbwfukXsScHh4K8NLzKZfa0uNBKCnD3WwvLkv6jpmUAVOMdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XB6HHxFt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XB6HHxFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715590336; x=1747126336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1hVa2f84aE3Yj9e543++WbKQAwUbxZEUkdSFB3mU3L8=;
  b=XB6HHxFtrI/1ZNioFl4Vel5/D6iIDZps0hGDv/+174pYZmbkIlIjS2H6
   xGosI0a9UV8xnBejXW3DT1VNubx8Z/Tt0m2jXJVAx0kL7hVG737xuFXQf
   TnlYKguEL9mCm4CPBy0Gw81JNyQ0zXr+sHUj/XJFmU4LXcUPHhIwFGuOR
   qcvgk0V57eXxlTW4UpwHpbBN/arQ8cpZ5NKjqNRNg6ogjie+/LJN0On2w
   RYEieHJ/wyekYBiDwQki/5blU6npjhTwqPMmYj+Nxbc2o3hQKZ0CMHkMx
   YzZkvwFwVuhFb+vcAegb6eE3zWzuyB35JqeeAtaQ+7XFKAJPh+SYXz70U
   A==;
X-CSE-ConnectionGUID: HunVb19JQfSVTuqbU4zHCg==
X-CSE-MsgGUID: Tx8Gg45MT1WdfHiBQZH43Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11366874"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11366874"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:52:16 -0700
X-CSE-ConnectionGUID: 3Vqu9p+PQpyM/F82yNmEIg==
X-CSE-MsgGUID: aEASVC3HSlO/du4wdT6GYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30389675"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2024 01:52:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6RPo-0009oR-0j;
	Mon, 13 May 2024 08:52:12 +0000
Date: Mon, 13 May 2024 16:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5421/22422]
 drivers/infiniband/ulp/iser/iser_initiator.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202405131614.cwAhXvTF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a54e5de9c3b87415db1fe656918e1c6d50706b5f
commit: 71e217e85c3dff8a9151707ed3afc7b4b054a2d4 [5421/22422] selinux: use kernel linux/socket.h for genheaders and mdp
config: x86_64-buildonly-randconfig-006-20240513 (https://download.01.org/0day-ci/archive/20240513/202405131614.cwAhXvTF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405131614.cwAhXvTF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405131614.cwAhXvTF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/ulp/iser/iser_initiator.c: In function 'iser_alloc_rx_descriptors':
   drivers/infiniband/ulp/iser/iser_initiator.c:277:25: warning: taking address of packed member of 'struct iser_rx_desc' may result in an unaligned pointer value [-Waddress-of-packed-member]
     277 |                 rx_sg = &rx_desc->rx_sg;
         |                         ^~~~~~~~~~~~~~~
   drivers/infiniband/ulp/iser/iser_initiator.c: In function 'iser_task_rsp':
   drivers/infiniband/ulp/iser/iser_initiator.c:661:15: warning: taking address of packed member of 'struct iser_rx_desc' may result in an unaligned pointer value [-Waddress-of-packed-member]
     661 |         hdr = &desc->iscsi_header;
         |               ^~~~~~~~~~~~~~~~~~~
   drivers/infiniband/ulp/iser/iser_initiator.c:364: warning: Function parameter or member 'conn' not described in 'iser_send_command'
   drivers/infiniband/ulp/iser/iser_initiator.c:364: warning: Function parameter or member 'task' not described in 'iser_send_command'
   drivers/infiniband/ulp/iser/iser_initiator.c:436: warning: Function parameter or member 'conn' not described in 'iser_send_data_out'
   drivers/infiniband/ulp/iser/iser_initiator.c:436: warning: Function parameter or member 'task' not described in 'iser_send_data_out'
   drivers/infiniband/ulp/iser/iser_initiator.c:436: warning: Function parameter or member 'hdr' not described in 'iser_send_data_out'
>> drivers/infiniband/ulp/iser/iser_initiator.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
