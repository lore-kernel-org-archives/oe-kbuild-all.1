Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316046AB6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717260354; cv=none; b=GCDGxVLA6abcNChLcfW8dqqR/6lM/l241vWuRl9Ka0KmEzRHFqMRf+9PZ66Qonv4h7y8rCtGlrypCVYDYaj1OzCHgmQ/rFbmonb/hyF9qoCot1N3nhpilf9jg5fh7Kp7ZRm3lUGHe9E1+wCnnjPWMVZymi6yWqJ7dMSq/SbZc58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717260354; c=relaxed/simple;
	bh=QsRVKC5X0Fy1ZdgY1ujnQdVJ8ArUkDnTg/4MIkA28kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lm82pRgDoaVtGVYl/5BSLjUoj5dsmN04QPWpEUKgQVk+dleF3iZjxer8F2hMmCyMVqkn9Xdl/kNAvBRF24a9inWuTb29p0uwvCFtirmUfsTfkSgM43iNMzGcjPSuUL8TNtRcT3njehuwSbaqWz6EgKwAEBtVpXxoIkCnPnuCMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgqXHu1O; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgqXHu1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717260352; x=1748796352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QsRVKC5X0Fy1ZdgY1ujnQdVJ8ArUkDnTg/4MIkA28kY=;
  b=WgqXHu1Oxt9y04yV5N3PMuBdRu2LKe9k9SH0AW72R52vKeCirLmCsh5j
   C3gg6jy9XGChYOkbGLjEAe/w0bG+jc7R8mdNnIqjjizZOgzhnZyzeHPgM
   Fe8zBmYi80UBSiG49jTnIt1lzA9eLYV7EG5QAGq9xmxFLtdO9ijzaV0Au
   kAz6HQ/xouBlGwLWDv2bXn87xKq6533Vd5rm/nSHdc5tNMFcf/leg176Q
   Un8zhSiZDHNnYl+BkFdzvkrxNsBETsdhM3NJRsjIMGVwnyy1LicWe5AWf
   4k927ODTL6rdE0WMg5r0fxsOOEkKIvNx5hes/b+X3NsO25kLpNjeccTCC
   g==;
X-CSE-ConnectionGUID: D3gV+iKWQ6KwStE19kod8w==
X-CSE-MsgGUID: ToTcydSxSAWBGErc9AxQPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="14020421"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="14020421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 09:45:51 -0700
X-CSE-ConnectionGUID: t+peFic6T9O1huCTi/zuPg==
X-CSE-MsgGUID: t5A02n+ySlWAkphnI5PZ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36902441"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Jun 2024 09:45:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDRrW-000J8B-2v;
	Sat, 01 Jun 2024 16:45:46 +0000
Date: Sun, 2 Jun 2024 00:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 9/9] pci: pcie: portdrv: aer: Switch to auxiliary_bus
Message-ID: <202406020045.vBgvv8Tw-lkp@intel.com>
References: <20240529164103.31671-10-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529164103.31671-10-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus cxl/next linus/master v6.10-rc1 next-20240531]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/pci-pcie-Drop-priv_data-from-struct-pcie_device-and-use-dev_get-set_drvdata-instead/20240530-004705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240529164103.31671-10-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH 9/9] pci: pcie: portdrv: aer: Switch to auxiliary_bus
config: x86_64-randconfig-122-20240601 (https://download.01.org/0day-ci/archive/20240602/202406020045.vBgvv8Tw-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406020045.vBgvv8Tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406020045.vBgvv8Tw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/pcie/portdrv.c:210:1: sparse: sparse: symbol 'pcie_portdrv_aer_ida' was not declared. Should it be static?
   drivers/pci/pcie/portdrv.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +/pcie_portdrv_aer_ida +210 drivers/pci/pcie/portdrv.c

   209	
 > 210	DEFINE_IDA(pcie_portdrv_aer_ida);
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
