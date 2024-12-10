Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3091DC986
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828991; cv=none; b=rL38Gl9Wy9LuXxtGv2Priiua0ed4ygE6B4yv1DURYXnTtABzEZhfIAgiWkyBtpZhvNgb+DeTC2BVU0pTfgqFW/V5nk1W3uQD8gsSXD5GTplpy+9H0ntHCoJGeKwWQSaBHZG/qr3nlmbw4t12MpFp6xeQHTcu8wFo+Jk0v5mOKpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828991; c=relaxed/simple;
	bh=LhXHrP3Wfa5LeREoJlp7tZdy78eBUHwyRoZ18e8a09Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kqjApnFHPs2yoeOsOD52eCt6+/kb47stsxdLtFnc60a5HN5CH6i/IsBzARjVLw1kwS1Ku4zgEQKts7mBQ3PHtuWOTrZcXOrg/yHrBJjvOXPuX4p9OBCCtTQcX/AKgaFsidUENhrHJCjhunW8NOeZwaQn8Tj0+0YxogK3RGx5ao0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRDS+Tar; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRDS+Tar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733828990; x=1765364990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhXHrP3Wfa5LeREoJlp7tZdy78eBUHwyRoZ18e8a09Y=;
  b=TRDS+TaryLgL+cHGss9xluCR6qeffMttFDNxybKVKHfn4dOIZujaOZZl
   J4kjl6Z3wdScE1Pi4GVPpC9bZq9V3s0bAX3zIX9DMV6kU/8uAqFCh+NMB
   /n/ZM4AYCCrpuxCLFuhjTsNmrU59E1uUK6izPm+wTq7O0b7H7doKzNieR
   NfeKTfART8cukwDR/6buIz5TUZlellLa2tjARI05T0sgeAUTJtArwFCZO
   WKD/v7w+Ohhknl8CJiTtKZ7v4zwC0sgqTNzhq8pLbDSEvQJ5oGhzEnu23
   a8ixnnwgF3dxtqT0wvbJ4djF+LcC8lgbeULDfBICrCbWb6wHlkt2TC40J
   A==;
X-CSE-ConnectionGUID: RBbV3+dvQp22LEh9VPkbQA==
X-CSE-MsgGUID: RkYUj5KWTZG5zsJrXTCaNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="21751977"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="21751977"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:09:49 -0800
X-CSE-ConnectionGUID: 4SuXaMQcQt+shg6J9JgllQ==
X-CSE-MsgGUID: 6Hwq/VpuQIeTR+FIBVK6qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95828184"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2024 03:09:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKy7b-0005SJ-13;
	Tue, 10 Dec 2024 11:09:43 +0000
Date: Tue, 10 Dec 2024 19:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/of/irq.c:625: warning: Function parameter or member 'id' not
 described in 'of_msi_map_get_device_domain'
Message-ID: <202412101847.AmlQnnB6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 627e79b2e098611d7a535c7b9ee7a740443a2490 [1/1] of/irq: make of_msi_map_get_device_domain() bus agnostic
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241210/202412101847.AmlQnnB6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101847.AmlQnnB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101847.AmlQnnB6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/irq.c:625: warning: Function parameter or member 'id' not described in 'of_msi_map_get_device_domain'
>> drivers/of/irq.c:625: warning: Excess function parameter 'rid' description in 'of_msi_map_get_device_domain'


vim +625 drivers/of/irq.c

a251b263346e38b Marc Zyngier  2015-10-01  611  
82b9b4243c6d99d Marc Zyngier  2015-10-02  612  /**
82b9b4243c6d99d Marc Zyngier  2015-10-02  613   * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
82b9b4243c6d99d Marc Zyngier  2015-10-02  614   * @dev: device for which the mapping is to be done.
82b9b4243c6d99d Marc Zyngier  2015-10-02  615   * @rid: Requester ID for the device.
627e79b2e098611 Diana Craciun 2020-06-19  616   * @bus_token: Bus token
82b9b4243c6d99d Marc Zyngier  2015-10-02  617   *
82b9b4243c6d99d Marc Zyngier  2015-10-02  618   * Walk up the device hierarchy looking for devices with a "msi-map"
82b9b4243c6d99d Marc Zyngier  2015-10-02  619   * property.
82b9b4243c6d99d Marc Zyngier  2015-10-02  620   *
82b9b4243c6d99d Marc Zyngier  2015-10-02  621   * Returns: the MSI domain for this device (or NULL on failure)
82b9b4243c6d99d Marc Zyngier  2015-10-02  622   */
627e79b2e098611 Diana Craciun 2020-06-19  623  struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
627e79b2e098611 Diana Craciun 2020-06-19  624  						u32 bus_token)
82b9b4243c6d99d Marc Zyngier  2015-10-02 @625  {
82b9b4243c6d99d Marc Zyngier  2015-10-02  626  	struct device_node *np = NULL;
82b9b4243c6d99d Marc Zyngier  2015-10-02  627  
627e79b2e098611 Diana Craciun 2020-06-19  628  	__of_msi_map_rid(dev, &np, id);
627e79b2e098611 Diana Craciun 2020-06-19  629  	return irq_find_matching_host(np, bus_token);
82b9b4243c6d99d Marc Zyngier  2015-10-02  630  }
82b9b4243c6d99d Marc Zyngier  2015-10-02  631  

:::::: The code at line 625 was first introduced by commit
:::::: 82b9b4243c6d99d9e38087fa89183aa7479185e9 of/irq: Use the msi-map property to provide device-specific MSI domain

:::::: TO: Marc Zyngier <marc.zyngier@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
