Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7512F46
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 01:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719991; cv=none; b=qK5UK4iSbhmLUK4f1EhuNPBzyOcpTqGyG59PwFYKAwTkuUwqi1pmLtk2RxDJggIw5W/yn0ubA6wRvCaaWGqHC6xlqK6Nj4Rp2/9wzzehRRT9kfXrCSmnO9q9w8zKXbjdzcd3bkHxpPcdxdAbW/1eeWDsML7ZdhwMuHP+QSUzYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719991; c=relaxed/simple;
	bh=DpiBFt9Gta0T5G3FoBIGNmbfrCdaU2p8eY7LUQ8l/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CX20AaMOdcTd+5Hp/3GT9VxLvVGV9YS7guYh5ypblSHkELpyrPW7G7Q3MEMs57btqofpRkcELI8gb/WkbmfjGbcLIxUEj/GS4fgAr+jHL6j6y4NG5t+A81wwAOxfNlN+6UQxxF9eg0nQIXuZ6qMQZt3VQOCmjp5RDaaHIt+aZXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2CVSJSt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2CVSJSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738719989; x=1770255989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DpiBFt9Gta0T5G3FoBIGNmbfrCdaU2p8eY7LUQ8l/W8=;
  b=m2CVSJStpT7RG5WJgbukyTVHVyTsEBmddZATRAteSjbjEGIIYHQvJ/Ki
   /+hFiSuovZ3u6lBALcuhGLvzbJ9ESeT3ydjrJgaYcCVzf0PmxmKToPAND
   /NZIVCffC8SXgHR2l659fdcox889cQSHnBt5ObaYipeCm26TQmv4PyzRw
   oW0e50HnBRL9CkenNFPeerL4SFgRBiKjnt8yE8ZZbBbKbQBKGbm17eHa1
   y6R0kT0T6Ha6a49qMO5RBy/Ensk/kVaqPEf1G6lRoAhxMQ/0wBw29Suuo
   ObwnJTVaEPvtk2UYjs2ZEXRKQrH22zA5UzLkvSO7WeX2Mb4OBzf2DPG8+
   Q==;
X-CSE-ConnectionGUID: PxzXnv5hTralLvkjYzNcFg==
X-CSE-MsgGUID: EhkBToMeQAq0wn84x1hsog==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56806489"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="56806489"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 17:46:29 -0800
X-CSE-ConnectionGUID: +dZzwIllSF2UVRqLhpFhDA==
X-CSE-MsgGUID: xc4X/5PDSAan+Z7eK77lHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="115799430"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Feb 2025 17:46:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfUUj-000tJ3-1i;
	Wed, 05 Feb 2025 01:46:25 +0000
Date: Wed, 5 Feb 2025 09:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 2/13] WARNING: modpost: vmlinux: section mismatch in
 reference: memblock_reserve_kern+0x1a (section: .text.unlikely) ->
 __memblock_reserve (section: .init.text)
Message-ID: <202502050904.BLutht7h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: e415f4e35ee852667f3f2c392b73a7d4469b9d1a [2/13] memblock: add MEMBLOCK_RSRV_KERN flag
config: um-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502050904.BLutht7h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050904.BLutht7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050904.BLutht7h-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: memblock_reserve_kern+0x1a (section: .text.unlikely) -> __memblock_reserve (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
