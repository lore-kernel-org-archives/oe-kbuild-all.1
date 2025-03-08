Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F2DDAD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 04:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741408431; cv=none; b=jRnQwWgXrQ6P/sJNZmCOOXbI0Y5RXWNvxTxuyOlHukozpthrc5xiUMLgvQOSaOCCCaqawL8ENNgq4zy+p27wYOeJ8Tpeh339gN3NhB3f7BN3llrZTn5VlSBU+uX/EtV0BC0Zy8R+26RBHIs0XjeM+4PH9PmfmiOi9BSHNyO5Plw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741408431; c=relaxed/simple;
	bh=zAZdzR2LumZ/wr4vZeLNuBu04RDoGOZxh2h2gD72GDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4ljIjRMzlvR5+8v5yZzvzgdS+06u2+5Mfy6IRSztoUxCq5SrrqwEOEpshGV5bAfZR2cZgpoVYADAi4Bh/NDQixVHXXrA/wkSViZ2haE//7uyMycgftfMPSOuQilGRi7QpMYtplt9ioP/sA8MmuHMs8tZ1K19rZ8r+yjHunVDEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbnhlVGF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbnhlVGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741408430; x=1772944430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zAZdzR2LumZ/wr4vZeLNuBu04RDoGOZxh2h2gD72GDg=;
  b=NbnhlVGF1czSJnHRcDelH8JGELv607AQ36JQvKYGzGjiErG/P9LyJCMh
   yxevCLx/rRRltv8S8RzymgkJItxNP/38vgwa+7GBgKbHuW8wzgcIaEq4D
   gK/YtNvwYB3FLtZc0xrnNwASz4MkqWXrAWaxfueT4P5fUf6XbZWWIToPG
   B2/ltdGxCn06EPn0I/B7iaZp7EvulXekTqytXBhV1fmXGrv7ZoirK3QjM
   Wk2+BWgRDV8dbbwIByYUU880MCvHZZU/4NuNRkb5fP0jmZ0Yp1KOdw3t9
   9mE0ct4rg94TR47rQkAbIR3L3kKgUbQsQeBfbU/2PiRQAwyd5g3TTB7Em
   Q==;
X-CSE-ConnectionGUID: vtUd19YsQOu/nXkr11oQEg==
X-CSE-MsgGUID: gc5o/HOdTXOB5Ez1wGN5jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42664116"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42664116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:33:49 -0800
X-CSE-ConnectionGUID: 8Ci2wInlQj2RTMzl8Q2RtQ==
X-CSE-MsgGUID: RDQXTwO3TtiG0it/PCLZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="142724688"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Mar 2025 20:33:48 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqlsc-0001Ua-0A;
	Sat, 08 Mar 2025 04:33:42 +0000
Date: Sat, 8 Mar 2025 12:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/vfio/mdev/idxd/vdev.c:1058:6: warning: no previous prototype for
 'vidxd_free_ims_entries'
Message-ID: <202503081202.BBujIyUf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: 4f35c1745a635e3bb8eee3ebd769d7e5b262d01e [1/1] vfio/mdev: idxd: add basic mdev registration and helper functions
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250308/202503081202.BBujIyUf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081202.BBujIyUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081202.BBujIyUf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/mdev/idxd/vdev.c:1058:6: warning: no previous prototype for 'vidxd_free_ims_entries' [-Wmissing-prototypes]
    1058 | void vidxd_free_ims_entries(struct vdcm_idxd *vidxd)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/vidxd_free_ims_entries +1058 drivers/vfio/mdev/idxd/vdev.c

  1057	
> 1058	void vidxd_free_ims_entries(struct vdcm_idxd *vidxd)
  1059	{
  1060		struct mdev_device *mdev = vidxd->ivdev.mdev;
  1061		struct device *dev = mdev_dev(mdev);
  1062	
  1063		msi_domain_free_irqs(dev_get_msi_domain(dev), dev);
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
