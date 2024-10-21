Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089BC194AF6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535150; cv=none; b=I+STV3GdwWPq1OP/yk4BSl9LxXrFFv6bwPgWeCO4RlMraGXUpbFpr1WOHWnJafqikzPp0FB6K8uxfaCY6ltRkikQT+Bcp6sQEce4y53Mf9MCsi15JeybvaNpadaPAkrUW6EKzPe9V9/cCwhVl5CufhoDFxRmajvv0YA4GGaLdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535150; c=relaxed/simple;
	bh=+mEo7hyccA8//AgO7MNOoY+r4YcdOlMiJoOJ2pdWCXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njice25FVCuZf9otquE1ZDzyzid4YFN11+A8wy3xDRIzpOElIwGNz+zj4+i21W78TNRZxtgOVDKDT1s4N8xcUk2lpEWp6IWABWtKSxIFMJPbacth8qRGO7KQkePBBc+3qukWWlNAZw9ykgtkPLOxm9MahGKoLucptvLdK9WBmrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImY8CZ1j; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImY8CZ1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729535148; x=1761071148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+mEo7hyccA8//AgO7MNOoY+r4YcdOlMiJoOJ2pdWCXU=;
  b=ImY8CZ1jf8NnbD/0MgS9XzXDH4mFXmS9BjYGkpi8Pn8CdzjsDff5ifJ1
   O50WBlYJllEVlvK1kw4RckK9pPVekeSJN7BAJ4y0XGkZV5al8zg0vk2Ng
   N0ko2AN7gtT13Uv1UbGo8r4XL4otjYbZcKV6n8NDb+C/ssZOHBF7kVN0z
   BcDoqArqPYUBhrEsgpt6gnDqLmIX+H8Os6GdhvO/W1CRXgz6RIP4PFQhp
   Kw+wPvV2EdGhUT0Q9NfDHlhS7RBuoiIfELP7RRmb79QrCBSyARdj6Kkjy
   rzs0XxAzNcAaf0BEx2DZSPouLXj9PViE/mqff5dvhMfI8iLB9NRh5YaLg
   g==;
X-CSE-ConnectionGUID: qnNgEeXkTLKes8efGyDOrg==
X-CSE-MsgGUID: Mq7u40F9SFOt7vNsaTREjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40425842"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="40425842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 11:25:46 -0700
X-CSE-ConnectionGUID: D2egPrH9TSquHdQi/wlEOQ==
X-CSE-MsgGUID: 2AXve8VmTfKr6c5dHJHpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79690343"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 11:25:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2x63-000SVo-2L;
	Mon, 21 Oct 2024 18:25:39 +0000
Date: Tue, 22 Oct 2024 02:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 249/2444]
 drivers/iommu/amd_iommu.c:442:27: warning: variable 'iommu' set but not used
Message-ID: <202410220239.aE1u48Z6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 36c7a040b76bfbfc5555b3a062ecf9d740a6c5e6 [249/2444] iommu/amd: Convert to probe/release_device() call-backs
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241022/202410220239.aE1u48Z6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220239.aE1u48Z6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220239.aE1u48Z6-lkp@intel.com/

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

26018874e3584f1 arch/x86/kernel/amd_iommu.c Joerg Roedel    2011-06-06  438  
36c7a040b76bfbf drivers/iommu/amd_iommu.c   Chen Zhuo       2021-11-18  439  static void amd_iommu_uninit_device(struct device *dev)
657cbb6b6cba0f9 arch/x86/kernel/amd_iommu.c Joerg Roedel    2009-11-23  440  {
7aba6cb9ee9db78 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  441  	struct iommu_dev_data *dev_data;
39ab9555c241106 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01 @442  	struct amd_iommu *iommu;
39ab9555c241106 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01  443  	int devid;
c1931090a22b96b drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  444  
7aba6cb9ee9db78 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  445  	devid = get_device_id(dev);
9ee35e4c6f42e79 drivers/iommu/amd_iommu.c   Joerg Roedel    2016-04-21  446  	if (devid < 0)
7aba6cb9ee9db78 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  447  		return;
c1931090a22b96b drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  448  
39ab9555c241106 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01  449  	iommu = amd_iommu_rlookup_table[devid];
39ab9555c241106 drivers/iommu/amd_iommu.c   Joerg Roedel    2017-02-01  450  
7aba6cb9ee9db78 drivers/iommu/amd_iommu.c   Wan Zongshun    2016-04-01  451  	dev_data = search_dev_data(devid);
c1931090a22b96b drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  452  	if (!dev_data)
c1931090a22b96b drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  453  		return;
c1931090a22b96b drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  454  
b6809ee573cc2f8 drivers/iommu/amd_iommu.c   Joerg Roedel    2016-02-26  455  	if (dev_data->domain)
b6809ee573cc2f8 drivers/iommu/amd_iommu.c   Joerg Roedel    2016-02-26  456  		detach_device(dev);
b6809ee573cc2f8 drivers/iommu/amd_iommu.c   Joerg Roedel    2016-02-26  457  
8fa5f802abf3cd3 arch/x86/kernel/amd_iommu.c Joerg Roedel    2011-06-09  458  	/*
c1931090a22b96b drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  459  	 * We keep dev_data around for unplugged devices and reuse it when the
c1931090a22b96b drivers/iommu/amd_iommu.c   Alex Williamson 2014-07-03  460  	 * device is re-plugged - not doing so would introduce a ton of races.
8fa5f802abf3cd3 arch/x86/kernel/amd_iommu.c Joerg Roedel    2011-06-09  461  	 */
657cbb6b6cba0f9 arch/x86/kernel/amd_iommu.c Joerg Roedel    2009-11-23  462  }
b7cc9554bc73641 arch/x86/kernel/amd_iommu.c Joerg Roedel    2009-12-10  463  

:::::: The code at line 442 was first introduced by commit
:::::: 39ab9555c24110671f8dc671311a26e5c985b592 iommu: Add sysfs bindings for struct iommu_device

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
