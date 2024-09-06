Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF151A41
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725594966; cv=none; b=LYSroRq852/eA3ZTKUieX3FZmTieYRVLL5quxy14LF03u9p+0bTAYaBfkbGydN0l7fNFJRBzt0FtOw35u98tnc11auLMr5oaqmR8hWFUfzSgeXG1Iivuh/8ZwrFUBN3rKhP67aDnL/xiImhhvafHnwgWUzwVJRLvLa5n3nabdXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725594966; c=relaxed/simple;
	bh=vvOGSK+n/FVC6o/BP9nC5puDVhmeYZOmXb8F64A5Jv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7NAV9/TwfFmWz6774I+E2WY+BTb9ZWpg12Qm4U2/dyeTB1svHUTYFJwOM5ZkfwTwv0OfjZGd2RI5KNuFw3/QFJUNXSuIgBDgF9YfyW0ThLHkAxHLy59i/tLlJMSlWNH7fQQRDVvd0iOenzBXNswh8StVuX2hZifHcNGTjk4OJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvBcMVUL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvBcMVUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725594964; x=1757130964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvOGSK+n/FVC6o/BP9nC5puDVhmeYZOmXb8F64A5Jv4=;
  b=YvBcMVULpGL+pCT2fqnN9fKqb+jmLdKytylOJ7MYWGPudze8RCFg+PmO
   hZP+3x3+jzLhehRQoMkSxSLceXFZ8mAOw2mgV8OVALeT1uiscS/Y5OP62
   vevkaOuMX55vvs10JC9IK8stnrZA+TRUWAMiRo9w6nCoGq/tFhn1AaZW9
   rg0EISmpHHkEZ9aJjnsed5rYo079BfD1Z0OoEAEjwcI/N26LTZUGXcZXw
   h+cxyvOjOnR2LBm2lBXWn2v4TUqb5rjZK4cBYo3QxAXt9U1WCxkghKkhS
   3nOiv/hEQqjmF27E8ZhUZZ9wktSszjEK0v/BIByXklDh4ZJ/oU5VP2V5A
   w==;
X-CSE-ConnectionGUID: b2FVfp4gTkWja4Sts39o8A==
X-CSE-MsgGUID: XzgJuP1gTJiNngbt+0/9/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23849511"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="23849511"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 20:56:03 -0700
X-CSE-ConnectionGUID: tWK8maozQkmZmSh7+p6ZcQ==
X-CSE-MsgGUID: eoC1lzR5RHGznZ1poDiqwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="96548779"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Sep 2024 20:56:02 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smQ4l-000Aag-2a;
	Fri, 06 Sep 2024 03:55:59 +0000
Date: Fri, 6 Sep 2024 11:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13863/13878] drivers/base/platform-msi.c:237:
 warning: Function parameter or member 'write_msi_msg' not described in
 'platform_msi_domain_alloc_range_irqs'
Message-ID: <202409061150.PH2ggN81-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ad51fadf8895f81201ef22e91984b57ed9b2f9af
commit: ed007ade0cef81fb47328683b8a7eec5edfa8494 [13863/13878] virtcca feature: secure smmu init
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240906/202409061150.PH2ggN81-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061150.PH2ggN81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061150.PH2ggN81-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/platform-msi.c:237: warning: Function parameter or member 'write_msi_msg' not described in 'platform_msi_domain_alloc_range_irqs'


vim +237 drivers/base/platform-msi.c

   223	
   224	#ifdef CONFIG_HISI_VIRTCCA_HOST
   225	/**
   226	 * platform_msi_domain_alloc_range_irqs - Allocate specific scope MSI interrupts for @dev
   227	 * @dev:	The device for which to allocate interrupts
   228	 * @start:	The start index of msi
   229	 * @end:	The end index of msi
   230	 *
   231	 * %0 if alloc irqs success
   232	 * %error_code if alloc irqs failed
   233	 * %-EINVAL if platform_data is null
   234	 */
   235	int platform_msi_domain_alloc_range_irqs(struct device *dev, unsigned int start,
   236						unsigned int end, irq_write_msi_msg_t write_msi_msg)
 > 237	{
   238		int err;
   239	
   240		if (!dev->msi.data->platform_data)
   241			return -EINVAL;
   242	
   243		dev->msi.data->platform_data->write_msg = write_msi_msg;
   244		err = msi_domain_alloc_irqs_range(dev, MSI_DEFAULT_DOMAIN, start, end);
   245		if (err)
   246			platform_msi_free_priv_data(dev);
   247	
   248		return err;
   249	}
   250	EXPORT_SYMBOL_GPL(platform_msi_domain_alloc_range_irqs);
   251	#endif
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
