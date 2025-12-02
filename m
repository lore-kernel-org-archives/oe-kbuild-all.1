Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B62C2340
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764705718; cv=none; b=MlGA3KgJC25Xr/DUzYJtKsiB8PHMfbKpDm4HChiNdhyZXKgSc2V2Rl8VG7jfu6cnIjSdo+kHjGRW0HcxqWI0B4/ZbeBS+ghw6+ftgPLz0YL8S/cfYxlADPExexlksnyMPxqwyPQkyzX9QRGub6MraH5fcXSXcK+1b7HWWvs/hOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764705718; c=relaxed/simple;
	bh=iMf3dGI9NKqK6hGADbvoO6fcasWH4iPdqFysDjILb9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XajvNH/hLoHais+9xekRGLjnz86W4Duqaj6CU1SwHeZP0bwAzJQX7Rb37aQzqVxj3qJf6jT0KUthSZU38vMg9ThEn27HoEo93kvA/gvGssL4CrF/hhqNo5uHsNkDBnLsmLwcDJPV8R5bg6sGiEPIsWKqDHTzdYEjguJ9LpqFhdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2cvj41M; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2cvj41M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764705717; x=1796241717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iMf3dGI9NKqK6hGADbvoO6fcasWH4iPdqFysDjILb9M=;
  b=J2cvj41M8AJGUebrI0Of4Hbj4xlBSvtdfCDerntqiFVCxaV8fwmxze7q
   rWrkjNX5IgKyfufiTMQlMAfxws+X0uUSH3Fm4xAKn9zU77G5FsdwZkcEF
   a4+tZn8O2NM0gLf6bQT+yQw/nHPWI+0zwa2F2tTkbgGCvn6HFxApe7phj
   JjydHl4MKc2zao7ArfNxgSd/36W6snwGvW0t53BYdjNCiRMoHon1U7RWN
   iZfnks/KEqrSLXgi32/bdWy4eSn/AQLcuxYm2jlRPkv+1nqmfDXKr5ngl
   zb/8uUvKHVkdNyHhHFLrv0PuPGo9nbgAWnGBiwJTFzePA7x24Ffb0zvKc
   Q==;
X-CSE-ConnectionGUID: K/+2yWnzRyyxeUqghpCU7g==
X-CSE-MsgGUID: YphJ4c7+Sl2f3s4rAUe3rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77373447"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="77373447"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 12:01:50 -0800
X-CSE-ConnectionGUID: OwFWQxdESMyWKE4ZPbYZJw==
X-CSE-MsgGUID: zbf3J3UrQuuCcGU0fjJCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199596931"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2025 12:01:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQWZG-00000000AA9-1YF5;
	Tue, 02 Dec 2025 20:01:46 +0000
Date: Wed, 3 Dec 2025 04:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>
Subject: [linux-next:master 12337/13055] drivers/vfio/pci/xe/main.c:555:9:
 error: implicit declaration of function 'INTEL_WCL_IDS'; did you mean
 'INTEL_ICL_IDS'?
Message-ID: <202512030331.I8CveRre-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: 2e38c50ae4929f0b954fee69d428db7121452867 [12337/13055] vfio/xe: Add device specific vfio_pci driver variant for Intel graphics
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512030331.I8CveRre-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030331.I8CveRre-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030331.I8CveRre-lkp@intel.com/

Note: the linux-next/master HEAD 47b7b5e32bb7264b51b89186043e1ada4090b558 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/xe/main.c:555:9: error: implicit declaration of function 'INTEL_WCL_IDS'; did you mean 'INTEL_ICL_IDS'? [-Wimplicit-function-declaration]
     555 |         INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
         |         ^~~~~~~~~~~~~
         |         INTEL_ICL_IDS
   drivers/vfio/pci/xe/main.c:555:23: error: 'INTEL_PCI_VFIO_DEVICE' undeclared here (not in a function)
     555 |         INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
         |                       ^~~~~~~~~~~~~~~~~~~~~


vim +555 drivers/vfio/pci/xe/main.c

   552	
   553	static const struct pci_device_id xe_vfio_pci_table[] = {
   554		INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
 > 555		INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
   556		INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
   557		{}
   558	};
   559	MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
