Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84329A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 07:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735628771; cv=none; b=V0+Rz2Ozf94I/ozi2Oxqd3BSpIchA5SmSS76IgTKO/evOu6y47ZFgD2pTfEujl8x/wDBl4dyy1rn/rCtN0QugmD1gs1QGAY4DKQcFJsahGlhJb3c2n0qwFCNQ4yGvwurqTS9b2eH1YNxORUgUG8158TeDe7/iouWbQBTN0HE9eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735628771; c=relaxed/simple;
	bh=xO5gH8IctpHFNP9sGGvOfFG29YeLxzEx5QV6bNSS3CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbBFSPFjByytQ6d1T2R5V5UDMvtro+yN5zg4xiP/tS+WkUbxwr6c/8fT+362Ci9UVFu/ZSXpXN7+hf+sGr3UMuBazxD9SA8eOHGJkCkfh6JO9QUvLNO/mNMpPV2yqqJptnxqLjUG3JPGT5BXPh1fKljXKfa/dXGmPoUm5hjB3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHpxwOIw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHpxwOIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735628768; x=1767164768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xO5gH8IctpHFNP9sGGvOfFG29YeLxzEx5QV6bNSS3CQ=;
  b=lHpxwOIwngHiCPFWlk/TibTZwGb+i4UwL0FpYiWC21I2KAH8k9AVjmsm
   1vFysyOTwWRtPydg+if1maQ2oaDgs7AmGPKNyNPRPQdpZQp5qshO8ju3I
   +hcnFWdk5nFQlspSY4Iui5PwRAOoZhXIYNXB4Qzu2Mz0bUEmW1wIQFUHj
   s1ovIiuaqG8qikh67v6tJiiAEwUnrLbsyG+G1zGvix922aTkP4m1Mqn+8
   H2nEaWOjQVy2S8w6ykiuzuXv4E9Q6bdXVnP3XzPmKO5Ax11uQFOG+60HJ
   ON4ukovPxnY6IsG4h9RfXSPyBSOLh+t3h+Eo6b+9sCfLw/y1f6i9IodNS
   w==;
X-CSE-ConnectionGUID: GANYkTfYSrecFIjcir0gWA==
X-CSE-MsgGUID: d/qKzDsgR3CrXbhlIoRWjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36051395"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="36051395"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 23:06:07 -0800
X-CSE-ConnectionGUID: DZD33ugNShO/Aw6nDvDqIg==
X-CSE-MsgGUID: w+lS3RK7TLGQpxr+OpxY/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106051200"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2024 23:06:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSWKI-0006tH-2g;
	Tue, 31 Dec 2024 07:06:02 +0000
Date: Tue, 31 Dec 2024 15:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 480/5236] drivers/accel/amdxdna/aie2_ctx.c:24:6:
 sparse: sparse: symbol 'force_cmdlist' was not declared. Should it be
 static?
Message-ID: <202412311448.GKQj7uPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: aac243092b707bb3018e951d470cc1a9bcbaba6c [480/5236] accel/amdxdna: Add command execution
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311448.GKQj7uPZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311448.GKQj7uPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311448.GKQj7uPZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_ctx.c:24:6: sparse: sparse: symbol 'force_cmdlist' was not declared. Should it be static?

vim +/force_cmdlist +24 drivers/accel/amdxdna/aie2_ctx.c

    23	
  > 24	bool force_cmdlist;
    25	module_param(force_cmdlist, bool, 0600);
    26	MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
