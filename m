Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6AF749A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728162871; cv=none; b=YWRa6NjC6zsfi9Zt5WElx3Tx9LJ4+ZK4LkhXCsNFXNYR0MtpUX8gy8vnCjxGX9mmfUy6/QFoySM/yL316A8Sor9KqJJPW69JVZvQ8e4+kAZG3VRrtNeI6q7q1KOOiZD2yghtmOyb1/X3h71kd7btIGh3uPxvzW6W1q+IJ954nH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728162871; c=relaxed/simple;
	bh=8ZjFwZrJxBD8PtQCoJ9Th1ndHDuF56dCS4CFRaQ/QuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyOJmMaUIQEhwV0+1nHf8Jqs2rkQd1KwWE0afWxwtzMFHIDFAqFfPo5skWxeEC/A3t2Psnh8UGxYzyWqY7Lb3a9Zk98dH2H5r0vkRCRS7mb8HT85Zna/DGM4NxPNfdfj9h5uMIE5N08btsp2iaZKrK7OJ2PTrUnk8VEzBpE8jPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDfWqk+2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDfWqk+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728162870; x=1759698870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ZjFwZrJxBD8PtQCoJ9Th1ndHDuF56dCS4CFRaQ/QuY=;
  b=fDfWqk+2ZnEFLDiesVrWoXIxsahfz86p8Fyqks7/MBpR4giRKGcUkqGC
   hF32nJlFFFyGrfy4y4VpHOw7fGgAti+ZDwiV0te3cDFv5TwQxqeRNYGkT
   4+2G/JXfWSJMEw+tJ3dfouK2M66FtEtnUxqB90qv4z0wzT7eweKNL8mL/
   t8sRv/7Qx7ZuHQqmQfB5rtilInRl3lv2jeqFBH+i4M0RvVhVFYIGAedZu
   T9X8XxlZhJBaUEUBljKH+FWb4cxqAP3ROint1Ct1ZLkqQOCVax2fsHW+n
   wq/8HoDUaDradadvRwf6bsvbXpH0AZCL1rSBTgtA8FG4to0AGOhB1gjOc
   g==;
X-CSE-ConnectionGUID: nn+JzX2bQcWni4Ht36kjKA==
X-CSE-MsgGUID: 1ADCC7cUQZe6pjDd2UuL1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27299396"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27299396"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 14:14:29 -0700
X-CSE-ConnectionGUID: lIJDIsGpRwukYvj3ToNWMA==
X-CSE-MsgGUID: oyffb+XkTVmQ+QczSuk+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="112526735"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 14:14:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxC6b-0003MM-0K;
	Sat, 05 Oct 2024 21:14:25 +0000
Date: Sun, 6 Oct 2024 05:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 607/1001]
 drivers/fpga/zynq-afi.c:27: warning: expecting prototype for struct
 afi_fpga. Prototype was for struct zynq_afi_fpga instead
Message-ID: <202410060500.ihzgE0QJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 286e6a59b858bd3acaa9565a3674c2453cec46f4 [607/1001] fpga: zynq: Add AFI config driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410060500.ihzgE0QJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060500.ihzgE0QJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060500.ihzgE0QJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/zynq-afi.c:27: warning: expecting prototype for struct afi_fpga. Prototype was for struct zynq_afi_fpga instead


vim +27 drivers/fpga/zynq-afi.c

    18	
    19	/**
    20	 * struct afi_fpga - AFI register description
    21	 * @membase:	pointer to register struct
    22	 * @afi_width:	AFI bus width to be written
    23	 */
    24	struct zynq_afi_fpga {
    25		void __iomem	*membase;
    26		u32		afi_width;
  > 27	};
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
