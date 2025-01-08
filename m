Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01321FCCEB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344525; cv=none; b=jjRvs6Ho5YbPu64ylMl5CAKzTUXYcRS//7AXmu8AISh1E4oTx/n0gJCAoXCw/mx/Df5uiiuhxisVUOmjZZhTsAcFppdIw4Cwrh+w8PxnB5YmYCQnleHTggrEgEK8g8IN4BSltzVzn7tVPxN/Ps9H9QEtTJY7P35Ixo8WY2xhkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344525; c=relaxed/simple;
	bh=IQDthmsPwOx1lJSS4ihmaLpvDHmHQroONCHhnwdMLJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeKYE4HrT6IFoanHZEwdnnjiMk6dRBbTxbprA27uzQzdrAz/GvEma0myxhwcXJP3nTzLuqrKcoRoEc9nnCNxhyesZ7T2pl0IMCFBmAsN65yYPo7R8tTO5wRugXKlYkE6t4Bs8jKdmUf3pqH86HgOwNPLDWZF7aFGH392JtN9EWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4iLz3e3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4iLz3e3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736344524; x=1767880524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IQDthmsPwOx1lJSS4ihmaLpvDHmHQroONCHhnwdMLJw=;
  b=F4iLz3e3zlfuTM7wp5FXWbTwl6T0XBoC6UNOcsckhWYULyRTLECsIBSy
   Ac9+3yMHGCPn4+8QTKy9gQgSnxN2jIQ6MUGmz8aWjgML2i8rJbi8lD0us
   +SCobwObLRMp60K9W8UzyDUTeyiprJHGhLUYJ+OIqfdSYOJyWvRaMa8E3
   uroMG0Ew1U6zi1mIl2M9W1wbIV63IX23eXoqYc59YlfSw0mPNaZDPJoqc
   zK4Wz9nLocy27/OVaTlCQGwwyarCUp4/VcirE6A5/cLZohzTY93NWwbEv
   vgBhzAwHMlrHLhk6L3QuX/FkOvjjHWX8HS4fRGXD/Ah5tkjZsgcaq6G4b
   g==;
X-CSE-ConnectionGUID: t6gZOvyDTSGianWKOB2E5A==
X-CSE-MsgGUID: a8FT0cCnQaGjXTsHtfAB7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36731934"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36731934"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:55:22 -0800
X-CSE-ConnectionGUID: IlZZiy2VR8ClfXgnGCyTYw==
X-CSE-MsgGUID: Sa63BheYQgWBk2SGNL5NWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103595049"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2025 05:55:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVWWj-000G9n-2A;
	Wed, 08 Jan 2025 13:55:17 +0000
Date: Wed, 8 Jan 2025 21:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yushan Wang <wangyushan12@huawei.com>, xuwei5@hisilicon.com,
	yangyicong@hisilicon.com, Jonathan.Cameron@huawei.com,
	wangjie125@huawei.com, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, prime.zeng@hisilicon.com,
	fanghao11@huawei.com, wangyushan12@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH 1/2] soc cache: Add framework driver for HiSilicon SoC
 cache
Message-ID: <202501082116.RY64zFEz-lkp@intel.com>
References: <20250107132907.3521574-2-wangyushan12@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107132907.3521574-2-wangyushan12@huawei.com>

Hi Yushan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yushan-Wang/soc-cache-Add-framework-driver-for-HiSilicon-SoC-cache/20250107-213022
base:   linus/master
patch link:    https://lore.kernel.org/r/20250107132907.3521574-2-wangyushan12%40huawei.com
patch subject: [PATCH 1/2] soc cache: Add framework driver for HiSilicon SoC cache
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250108/202501082116.RY64zFEz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501082116.RY64zFEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082116.RY64zFEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/hisilicon/hisi_soc_cache_framework.c: In function 'hisi_soc_cache_vm_close':
>> drivers/soc/hisilicon/hisi_soc_cache_framework.c:331:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     331 |         int ret;
         |             ^~~


vim +/ret +331 drivers/soc/hisilicon/hisi_soc_cache_framework.c

   327	
   328	static void hisi_soc_cache_vm_close(struct vm_area_struct *vma)
   329	{
   330		struct hisi_soc_cache_lock_region *clr = vma->vm_private_data;
 > 331		int ret;
   332	
   333		/*
   334		 * Only perform cache unlock when the vma passed in is created
   335		 * in hisi_soc_cache_mmap.
   336		 */
   337		if (clr->vm_start != vma->vm_start || clr->vm_end != vma->vm_end)
   338			return;
   339	
   340		ret = hisi_soc_cache_unlock(clr->cpu, clr->addr);
   341	
   342		hisi_soc_cache_aligned_free(clr);
   343		kfree(clr);
   344		vma->vm_private_data = NULL;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
