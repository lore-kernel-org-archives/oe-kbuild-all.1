Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C21D38385
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479951; cv=none; b=PF5WmikThtpAjMG7pnffS+OfTqxGT1GqpRolg7KsiVAtXLA6e2E9rWxkswCXUcurkZ4Y4uyin7izoN+kijaZTERDShuYD2gHkokRzRkxY12PKU9gMCzqptgNE0cJXofATqNKi2riUXVo0YN3HSAy1ff4Br1zOCkan/U+e2WYl2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479951; c=relaxed/simple;
	bh=TneGJYqmY8FmS3YPtSLdND3MJHjFKPahx/jOBsJeTzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIpT1l+MrU//KYUraN9N0Ju0tF6lYotkXKBXoLjMEmuQFTfyQt7kHcve5tYBPjxU9zLti0FcPSf6xv+3M9x6RQVt70K4SFwmHNRE/+4sDOhklnsjgONjaRRWjpPITbmlefDwWPHcrwy4poJ7o5/dhgPKj0JMzTm1hqmJS9+iPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhQtFvf1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhQtFvf1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749479950; x=1781015950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TneGJYqmY8FmS3YPtSLdND3MJHjFKPahx/jOBsJeTzQ=;
  b=BhQtFvf16iAyUrPvbkCUTFpt1CewEUITku3qyBnKUoiVtHJcwUicQgXN
   RVHbjLfGssK2XrJOR1ARqCzNFdFL2rkntu9cgKYyqFytnNM0QPCkMRWKe
   xeKi1F5bCdB9GsMstiZ5oBnjdZgXSeKva6iLtDPcEsVkHG/iiX0bTNbaM
   ucSRc1Q0jGm+gZfv/GL3ErEeEa5q68Sw7wE5ZAJDb79cmO2EGR65SkDMr
   ci9l45UW9XwaggaY9dFz+9RBMVf2hZemzIYxwl9TpJ5gEJJpzUZldwwdW
   LG5QP1J3HUMdS5maHILl3GTWdmaBw/5nf7C4qutvtDZNv61itqInyB3Bs
   Q==;
X-CSE-ConnectionGUID: IpeB7DyAQ/6WD8yy5Di41w==
X-CSE-MsgGUID: 8xidC1BxRJWgGFlszKzUdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="54192009"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="54192009"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:39:09 -0700
X-CSE-ConnectionGUID: Wk7tMHBxS467ntmUU4UovA==
X-CSE-MsgGUID: Fo8Te9xhR5KojemxDczsFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147112965"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2025 07:39:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOdeT-00075f-2g;
	Mon, 09 Jun 2025 14:39:05 +0000
Date: Mon, 9 Jun 2025 22:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: ld.lld: error: relocation refers to a symbol in a discarded section:
 xe_configfs_exit
Message-ID: <202506092221.1FmUQmI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
commit: 16280ded45fba1216d1d4c6acfc20c2d5b45ef50 drm/xe: Add configfs to enable survivability mode
date:   9 weeks ago
config: arm-randconfig-r062-20250609 (https://download.01.org/0day-ci/archive/20250609/202506092221.1FmUQmI8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506092221.1FmUQmI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506092221.1FmUQmI8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation refers to a symbol in a discarded section: xe_configfs_exit
   >>> defined in vmlinux.a(drivers/gpu/drm/xe/xe_configfs.o)
   >>> referenced by xe_module.c
   >>>               drivers/gpu/drm/xe/xe_module.o:(init_funcs) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
