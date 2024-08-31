Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4BCB658
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 18:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725127638; cv=none; b=hsF1LJozFM6mhB0NaSs+eEzeaxPnlFRJVETot2a9loxxryIPrsyxbvLlLCe3Y1n5GoluL8FRQsH7HzL3FVFhqV/B/e8qvSMROr14AKr2wWX/wHJ1hKEByQWh82532KrSKdahl5Ndyk8BF8pKCXBi5F17dw/49LiDyT8nheu0gmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725127638; c=relaxed/simple;
	bh=4EBfLjPPIDOWG1h9bYtgcpIEPUP2glrds3FNfS0b0TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLn+qVuMOpiExYaYjVHEnuU0IDcRHCNcgVt/2YW5/2Zf+34btvwrfVApUwAyPT+9e/5d+V/MbQhmRRhbgICpcPdhwiqJKiqU2ce0m3QbskRw7AMV67cS7n0FSjU8rzEF6mIrQl2dQeGqbnpyiyTiOSenwU+O1JQ83+OQjtsHJNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N80F6emc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N80F6emc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725127637; x=1756663637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4EBfLjPPIDOWG1h9bYtgcpIEPUP2glrds3FNfS0b0TY=;
  b=N80F6emcTskVTAMAaUYfuV8dm8QBLRcUD4QvnPI6nkTsL6DP+zGKX2xT
   jpOtV691s7mrM1KtMrsTgIKGHrDwVAl9CbuR/1HUP60pwDYpUilnzlre4
   bsW+qvjGZwinRCmhnk1AeEUohSMTm+Z7gdUgvtD49fs/FpYR/edrDUbiG
   WqvLEbZSwKDpYR6DXcd2DhsD0Zupk7khj/g2iAAdZYVMbyoB0QppDCGnj
   9To9lbTA+Meu7g1/ZayINsalzbpOpwJap3RFCxcnUr8CvS2KHNpvDGnop
   jF1tdR10mg4s8aFb7wIeKhZHjWDyAIYdg0RhX4P7VMCIGN+emEAtRDSmc
   w==;
X-CSE-ConnectionGUID: kwuG16zHSrK6rvzog5evuw==
X-CSE-MsgGUID: +GGQzKATTDmJnNP6dntd5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35122297"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="35122297"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 11:07:16 -0700
X-CSE-ConnectionGUID: UWhmMYzfQeSGXNWy/qHJLg==
X-CSE-MsgGUID: mAI00D2oTFK0yuGOxFM2Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64203822"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2024 11:07:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skSVE-0002zK-2F;
	Sat, 31 Aug 2024 18:07:12 +0000
Date: Sun, 1 Sep 2024 02:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.f_version 21/25] fs/ubifs/dir.c:1763:10: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202409010126.Jgx5qvsS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.f_version
head:   d72dc08ce60a47a989d21ef59e54f19875a02bc0
commit: 948b229fe9449c0661cb13fb634cbe34e91ce366 [21/25] ubifs: store cookie in file->private_data
config: arm64-randconfig-r112-20240831 (https://download.01.org/0day-ci/archive/20240901/202409010126.Jgx5qvsS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240901/202409010126.Jgx5qvsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010126.Jgx5qvsS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ubifs/dir.c:1763:10: sparse: sparse: Initializer entry defined twice
   fs/ubifs/dir.c:1765:10: sparse:   also defined here

vim +1763 fs/ubifs/dir.c

  1760	
  1761	const struct file_operations ubifs_dir_operations = {
  1762		.open		= ubifs_dir_open,
> 1763		.release	= ubifs_dir_release,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
