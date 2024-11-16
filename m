Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6217597
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768573; cv=none; b=TbNt6Qr7JULE1DkJ5ns1afqzBTQFqHKz/15QXF7eIMCNyVTEPRw6NYNlSGuvAaWIpH1xl9Ly1V2JJ4lGtFXUzE0Ijk2tUKXhSKnwFtVUeoocvUu+gZNNaX4Dzq/s6CXOZHNkgf49J+T+8o8qWpu3V2Z0Vpvq7MgyiWB9q940Hys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768573; c=relaxed/simple;
	bh=EWbmRfdcmM6VQ46Ma/tCFUmQZL2z4fYKViAYpvC10rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bis7P1SOlBHh3YIp46e1Xz5VLqlO29pvDACKA8HMoul87rAmy9Ti24S/OOCwjlWvcITaj95iznCxzcTrDdVYcBDD0OM5Ba6DIoVQesbwqUTXNJTjkK/O0z/on9t72dZQalgPaOavP9tR7iOE/MyrtqNIb08jZuSzpoQfXGZDn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+fECvZE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+fECvZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768571; x=1763304571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EWbmRfdcmM6VQ46Ma/tCFUmQZL2z4fYKViAYpvC10rw=;
  b=G+fECvZEbp5Rt6+mNASSmMMrIujXM3x4gaAc/T8CusLsLPaKEZfBKY5M
   frecsh+l6TaJKLRUKyuVCDUINcNN+DruXrZJnVXqTEnkL8vcsv7pFo8m1
   o+lM9kmjvG04/HUfMEumfp/5fK8Ga2yxBPPuLUnPi4rzlFpqA4+YxrlB1
   TulKSTxFbC8WLWyUxTuxKmry79SPWg/HF2OIez1Z4qe/Ad4bm5JdCmZPZ
   eAEfUBfYLk6wQcgzko0v+M6nBmg4ppbsjM8wOWgYK/0znoxr6M4W360OC
   v5learodSDcaAVmxPKFijgleKj53pTaHLAe33saikLGu08iwLVTc7cOAq
   A==;
X-CSE-ConnectionGUID: Bi3iF484T/+HN3DxJkvAMg==
X-CSE-MsgGUID: 1qgN7pC0TuSGHIe1Qegk0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42294837"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42294837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:49:31 -0800
X-CSE-ConnectionGUID: 7zyS+7gGSPqoUAE+ALWnyA==
X-CSE-MsgGUID: pTyQlXdDTVCMgFgxQNN43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89209806"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2024 06:49:30 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK76-0000gv-0X;
	Sat, 16 Nov 2024 14:49:28 +0000
Date: Sat, 16 Nov 2024 22:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 18/28] drivers/fwctl/cxl/cxl.c:47:16: error:
 implicit declaration of function 'kzalloc'; did you mean 'key_alloc'?
Message-ID: <202411161217.NVBdpbaA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   350392d25327a67c7299583a05481dfe524c7257
commit: 84e1063d463c904ba70516b5ef125e3e4be2b090 [18/28] fwctl/cxl: Add support for get driver information
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20241116/202411161217.NVBdpbaA-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161217.NVBdpbaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411161217.NVBdpbaA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/fwctl/cxl/cxl.c: In function 'cxlctl_info':
>> drivers/fwctl/cxl/cxl.c:47:16: error: implicit declaration of function 'kzalloc'; did you mean 'key_alloc'? [-Werror=implicit-function-declaration]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^~~~~~~
         |                key_alloc
>> drivers/fwctl/cxl/cxl.c:47:14: warning: assignment to 'struct fwctl_info_cxl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +47 drivers/fwctl/cxl/cxl.c

    40	
    41	static void *cxlctl_info(struct fwctl_uctx *uctx, size_t *length)
    42	{
    43		struct cxlctl_uctx *cxlctl_uctx =
    44			container_of(uctx, struct cxlctl_uctx, uctx);
    45		struct fwctl_info_cxl *info;
    46	
  > 47		info = kzalloc(sizeof(*info), GFP_KERNEL);
    48		if (!info)
    49			return ERR_PTR(-ENOMEM);
    50	
    51		info->nr_commands = cxlctl_uctx->nr_commands;
    52	
    53		return info;
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
