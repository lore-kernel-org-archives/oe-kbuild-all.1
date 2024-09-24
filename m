Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C171B85D0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 03:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727149024; cv=none; b=FId24iuyVumNtMqf8VU3I1+A0A5b9bdthtDmN9qG5LYGK/gkF8bMgGU85x58mho+gmgGa2tvbaxOPXCclcMSWzIC1vW1EcPqkGPZwuijl0TEZJhjLu6KYjpufpU6I4rJQ+f4xk+j61gcpFAQ1WiPNd9K3g1Ktpcq6ef/EgBKiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727149024; c=relaxed/simple;
	bh=dZ8z8uhkrmHqP+ssBqLl0I3+csQMX7XIvscFajAsvzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFwriyp5OY++G9JnXHHadFJx5U/a7La12iPMBFRred8VfHYR2yL+8SZFdMAS8K2xXOZOe7pBSc1a9/YpYfqP/CNKuKVJTNIHZvL9iwL/IVjcD98/aDjcIfczWfJT6B970Rh6pnNLqZ3H9qB7vrPGsGkT/ThH/5X+LH2zYi1WFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKY7y/bl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKY7y/bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727149022; x=1758685022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZ8z8uhkrmHqP+ssBqLl0I3+csQMX7XIvscFajAsvzU=;
  b=GKY7y/bl56c/qKM9Y512bqkJyhc9pWNxQHbdIaceWmAZVzVWzRsG6/9o
   O6987/DwY2lNcoc/EIA8MwY5J9XO0zgCBXvGjYvAWvBT1SdWKfneSKdPr
   pybAaxJEgZCc4mVZioCTIIh+cQjtrba66XDI/n2IvZVBTn8g4vBciV8pv
   qOAXD/qny4OuSHKIoI6XuRBIPmy9KuLnsbvwnPMvKAz5Kt59GepWFCqra
   GB4dAyIzHlVw2/3rPOafxszzgyTTVEyKNXZR8gGzGmytP4nltd6RixVy9
   uualD2I0xiFEMtNPXnbIK7AtExwwJwf+N8zlaAdTPuHutLSU30peiHpJ7
   Q==;
X-CSE-ConnectionGUID: y7Yam/f3SeCC+4QIZBx8FA==
X-CSE-MsgGUID: mX8LaOK5SEWe852uqWXMMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26273452"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26273452"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 20:37:02 -0700
X-CSE-ConnectionGUID: qcFXI50YT0+bcC2qpns59g==
X-CSE-MsgGUID: 9KoyqNLlQaCT5HQIdPQdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76199992"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 20:36:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sswMB-000HsM-37;
	Tue, 24 Sep 2024 03:36:55 +0000
Date: Tue, 24 Sep 2024 11:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 249/2441]
 drivers/iommu/amd_iommu.c:442:27: warning: variable 'iommu' set but not used
Message-ID: <202409241137.oR3ifFb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 36c7a040b76bfbfc5555b3a062ecf9d740a6c5e6 [249/2441] iommu/amd: Convert to probe/release_device() call-backs
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240924/202409241137.oR3ifFb4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241137.oR3ifFb4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241137.oR3ifFb4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/amd_iommu.c: In function 'amd_iommu_uninit_device':
>> drivers/iommu/amd_iommu.c:442:27: warning: variable 'iommu' set but not used [-Wunused-but-set-variable]
     442 |         struct amd_iommu *iommu;
         |                           ^~~~~
   drivers/iommu/amd_iommu.c: In function 'amd_iommu_probe_finalize':
   drivers/iommu/amd_iommu.c:2281:17: error: 'dev_data' undeclared (first use in this function); did you mean '_edata'?
    2281 |                 dev_data->passthrough = true;
         |                 ^~~~~~~~
         |                 _edata
   drivers/iommu/amd_iommu.c:2281:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/iommu +442 drivers/iommu/amd_iommu.c

26018874e3584f arch/x86/kernel/amd_iommu.c Joerg Roedel    2011-06-06  438  
36c7a040b76bfb drivers/iommu/amd_iommu.c   Chen Zhuo       2021-11-18  439  static void amd_iommu_uninit_device(struct device *dev)
657cbb6b6cba0f arch/x86/kernel/amd_iommu.c Joerg Roedel    2009-11-23  440  {
7aba6cb9ee9db7 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  441  	struct iommu_dev_data *dev_data;
39ab9555c24110 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01 @442  	struct amd_iommu *iommu;
39ab9555c24110 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01  443  	int devid;
c1931090a22b96 drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  444  
7aba6cb9ee9db7 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  445  	devid = get_device_id(dev);
9ee35e4c6f42e7 drivers/iommu/amd_iommu.c   Joerg Roedel    2016-04-21  446  	if (devid < 0)
7aba6cb9ee9db7 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  447  		return;
c1931090a22b96 drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  448  
39ab9555c24110 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01  449  	iommu = amd_iommu_rlookup_table[devid];
39ab9555c24110 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01  450  
7aba6cb9ee9db7 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  451  	dev_data = search_dev_data(devid);
c1931090a22b96 drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  452  	if (!dev_data)
c1931090a22b96 drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  453  		return;
c1931090a22b96 drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  454  
b6809ee573cc2f drivers/iommu/amd_iommu.c   Joerg Roedel    2016-02-26  455  	if (dev_data->domain)
b6809ee573cc2f drivers/iommu/amd_iommu.c   Joerg Roedel    2016-02-26  456  		detach_device(dev);
b6809ee573cc2f drivers/iommu/amd_iommu.c   Joerg Roedel    2016-02-26  457  
8fa5f802abf3cd arch/x86/kernel/amd_iommu.c Joerg Roedel    2011-06-09  458  	/*
c1931090a22b96 drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  459  	 * We keep dev_data around for unplugged devices and reuse it when the
c1931090a22b96 drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  460  	 * device is re-plugged - not doing so would introduce a ton of races.
8fa5f802abf3cd arch/x86/kernel/amd_iommu.c Joerg Roedel    2011-06-09  461  	 */
657cbb6b6cba0f arch/x86/kernel/amd_iommu.c Joerg Roedel    2009-11-23  462  }
b7cc9554bc7364 arch/x86/kernel/amd_iommu.c Joerg Roedel    2009-12-10  463  

:::::: The code at line 442 was first introduced by commit
:::::: 39ab9555c24110671f8dc671311a26e5c985b592 iommu: Add sysfs bindings for struct iommu_device

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
