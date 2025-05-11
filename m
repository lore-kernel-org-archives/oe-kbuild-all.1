Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387FB134BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746944837; cv=none; b=Y1t3LMVRweE3RBiB30tcPHhYPig7LACypy9I6DmoMlwoJyeKMkWoH8VoQ7K772SfBZ8hCWQ0cfk2pNGoeB/XG37k/Qixo8z9eF0e0VivELNE4HxFs8G3mzZgXRMnM6FWBF3KkT2ixzoozh4gmq5yCfmmSsrSlEOqGbdK+Kj3aZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746944837; c=relaxed/simple;
	bh=WgOQ/6HrCKzQ9epn+Cv57Ls1KxL5mQL/2Za2TX3Eo/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cbRNzZUFTVBRUKTQOvQtUEkiXb1/VioQ4wzeBvuW4IUJ3LddbDBHSGKb6cjwTkr8+m0eH/aR0T4wNqQKiAwpEnN1qkCL9rknNzZWb49nTOgBQDWz87bzp5R8YJBB1139fVTaxCcFRCMEm+INqLDq8w459TTfZ44GYetrywpOWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHkAjs1m; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHkAjs1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746944835; x=1778480835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WgOQ/6HrCKzQ9epn+Cv57Ls1KxL5mQL/2Za2TX3Eo/Y=;
  b=LHkAjs1mf02+VT+tmKkS3Z0iJjxlOlKkLr+7ydENQWYoQUmJEGVXFyXG
   GbuA1Q3DyjSpRhUoda3Zabwyogor2XJUgKysCIgK/Ze/G3BIN3ggkLgxz
   kva1tx6bLbdOgnnD5NoXRl6I4pFIozcxjwclJ7uzkoe6yZCOxfAxc0BZ+
   5YfnOyu6UQ5qLxUEbwnmLO7A90X4IgBTA2fCRMvjwR68etE4gM+LBIzFr
   5DrndWtQjjXtbe316c+TQ3Zbim+Poko/8vLhOHpC1sy3XG3gYY//lrbIq
   fxZ/uJ25MQl0qhveYcjWNRBRUxHjGcJWd0a0nhfz07grtM55+I/8tNp4S
   A==;
X-CSE-ConnectionGUID: y8CvAXMhSWeAl48/FKe+fw==
X-CSE-MsgGUID: mYs/5JqvRmmzCCtl8sqZ1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="51406354"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="51406354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 23:27:14 -0700
X-CSE-ConnectionGUID: azAp4vePRJ6pwPv5DuKDEQ==
X-CSE-MsgGUID: Ga+J2jk7Qje+CRHb1183GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="136752222"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2025 23:27:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE09W-000Dd1-2P;
	Sun, 11 May 2025 06:27:10 +0000
Date: Sun, 11 May 2025 14:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 7095/10031]
 include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in
 return expression (different address spaces)
Message-ID: <202505111404.SJjDYdm3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 61de83fd8256e185588670d3cf0bccc3e913819c [7095/10031] mux: mmio: Do not use syscon helper to build regmap
config: um-randconfig-r122-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111404.SJjDYdm3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111404.SJjDYdm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111404.SJjDYdm3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/mux/mmio.c: note: in included file:
>> include/linux/platform_device.h:91:23: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   include/linux/platform_device.h:91:23: sparse:     expected void [noderef] __iomem *
   include/linux/platform_device.h:91:23: sparse:     got void *

vim +91 include/linux/platform_device.h

a0c74f6c9ea9ce Mark Brown 2023-07-18  85  
a0c74f6c9ea9ce Mark Brown 2023-07-18  86  
a0c74f6c9ea9ce Mark Brown 2023-07-18  87  static inline void __iomem *
a0c74f6c9ea9ce Mark Brown 2023-07-18  88  devm_platform_ioremap_resource(struct platform_device *pdev,
a0c74f6c9ea9ce Mark Brown 2023-07-18  89  			       unsigned int index)
a0c74f6c9ea9ce Mark Brown 2023-07-18  90  {
a0c74f6c9ea9ce Mark Brown 2023-07-18 @91  	return ERR_PTR(-EINVAL);
a0c74f6c9ea9ce Mark Brown 2023-07-18  92  }
a0c74f6c9ea9ce Mark Brown 2023-07-18  93  

:::::: The code at line 91 was first introduced by commit
:::::: a0c74f6c9ea9cebd7a8f38142bf87e7c12c2905d platform: Provide stubs for !HAS_IOMEM builds

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
