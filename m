Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FD116F265
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 13:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725197327; cv=none; b=JXFTCp56zYtwcbhxHkDL4Co+ERagQArdyd2BaxRNqAONx9eTPVKokRtte6pYxmFordxxBT+h1st1hZJfSluFIdpxCYozLt2L+2+1ffZSiTIiCuDLau3hdjuV5kR/uytvESoZtWgz/z5F6ISl7gTjki/85L4rnGzPldZ40jrnZus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725197327; c=relaxed/simple;
	bh=1b3S6oyli4/5MBn2RtpDlIaH26Pgx8FMNOVhj4whEeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxOZPwNbQbF7Kn0IG2RadfaOyAZCTNKEJXQEVs23npESr8zrjKzwmG0g2sTEN9pzsp2eeLkdfGJSTEM3685gRloRYccuc3egQduV5EOvR/bGXsebtyn8BLWvBM2zk6vTXkuE9Pb+oyA3lLRq9GOxPcoK2AoBAEnjByf8L9bt+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itJYbOv0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itJYbOv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725197326; x=1756733326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1b3S6oyli4/5MBn2RtpDlIaH26Pgx8FMNOVhj4whEeQ=;
  b=itJYbOv0QFsTl4CV0gCAbm6xNrlDEsSyvgKMjrJQn0TgOss2b91MXtpj
   XriSlgdS3mrfxOW+Hvbbg3m/AeK72VTNpcPEtyuRNEAcQy4OnUDZ0y401
   eUPZSuuXifMmY6zUhi98pfGWgGclu6A29XscYiLjnJtU3lhlpbZu5Gv/h
   MX8e+X/me1iQ8pe2yjkTZTaoncIpTozBX847LYQdsd25t4eoBR3qAOBqs
   wVqY22wbGsqlODHn0P7zVZOlY/FW8m8zFNzWS2IQbexB2rn0bFmMmoKnv
   rKVjVroGS81Rv8K8Bx1n8yf+LbjeolW/joaGpW122NYn6HG4Mt2AD7Prk
   A==;
X-CSE-ConnectionGUID: Qbh7PJdRTiay4lmhl5vEDw==
X-CSE-MsgGUID: mFynrdyhRwCL8YkLcy33YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34446827"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="34446827"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 06:28:45 -0700
X-CSE-ConnectionGUID: +S2kzOS8RR+g1Iqbq19S2A==
X-CSE-MsgGUID: TvPdIHokQhifcxQKgcc2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64388334"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2024 06:28:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skkdG-0003gc-2C;
	Sun, 01 Sep 2024 13:28:42 +0000
Date: Sun, 1 Sep 2024 21:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sachin Parekh <sachinparekh@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] driver core: platform: Call iommu_release_device in
 dma_cleanup
Message-ID: <202409012112.6WITFrsU-lkp@intel.com>
References: <20240829120504.2976612-1-sachinparekh@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829120504.2976612-1-sachinparekh@google.com>

Hi Sachin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sachin-Parekh/driver-core-platform-Call-iommu_release_device-in-dma_cleanup/20240829-200729
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240829120504.2976612-1-sachinparekh%40google.com
patch subject: [RFC PATCH] driver core: platform: Call iommu_release_device in dma_cleanup
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240901/202409012112.6WITFrsU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012112.6WITFrsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409012112.6WITFrsU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/platform.c: In function 'platform_dma_cleanup':
>> drivers/base/platform.c:1472:17: error: implicit declaration of function 'iommu_release_device'; did you mean 'iommu_detach_device'? [-Wimplicit-function-declaration]
    1472 |                 iommu_release_device(dev);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 iommu_detach_device


vim +1472 drivers/base/platform.c

  1463	
  1464	static void platform_dma_cleanup(struct device *dev)
  1465	{
  1466		struct platform_driver *drv = to_platform_driver(dev->driver);
  1467	
  1468		if (!drv->driver_managed_dma)
  1469			iommu_device_unuse_default_domain(dev);
  1470	
  1471		if (dev_of_node(dev))
> 1472			iommu_release_device(dev);
  1473	}
  1474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
