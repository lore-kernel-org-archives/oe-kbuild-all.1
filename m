Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D577315D46
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764932387; cv=none; b=ETCsXunEs82mzH5Ka65/XaxP9BztPQaSK7PbdS5DKuW/aecnncZEQrDAc8nAU5MixazbstRKydJNNGUAcXrQ6ECO+kGhK42f6YTnHe7uAEs9/kG3/PBzM+pkY8/r8ebq22LsZebebmwhDqEjx/SxrF5KLfEWe4sNC5QNbgaWen8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764932387; c=relaxed/simple;
	bh=TjfSfyyPqiGY5fvc4rJRUqcQlUY0H+aiRlX0M76+H7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2HK6jKEdaYYyZurF5etq2mSiZzBNyYfobUnNDD2u29FVNcs/5irSCzvf9gLhuaLPg7TpXHZuLf2f89SDoMmeXpf0W/tasmka2ewiDqrjhVopBvBKhFasQM7ULRXyjtCVE+lQ9Em5/9gWF+zTkTGqIvoEu53n773fx6mPulWHUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9JPnMuP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9JPnMuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764932383; x=1796468383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TjfSfyyPqiGY5fvc4rJRUqcQlUY0H+aiRlX0M76+H7M=;
  b=W9JPnMuPR0K4oNnclNn12xZQUDh4GqcYBw4PIuJ4Ga3NNHdKGa/1xyS6
   gR0oBgbG0GTxQ9TEq9VJIC7Jx+Z6dmprMj2ZvTjCzenwsuIUm2jmcuiFT
   zI9iy6bcptg+ZkmnDBWRtY85xH/CV+0OSZS3cfo/ncZ3BpmzgMQX4nY+O
   nVS+rr8ElDVAx+2lt/BFiD3WAlKu5kxPW5tWOlA30vxeYRrHYYmr1XbIw
   wxVmpTTZ0ECQ0CC1ufYNPz+QKNgTKR5LaL1EhVHSK2e2fOilTkanlMhmj
   IuHCxok47Izutjvsg1/tce3IdO1c80wuJIrJOqIpj+pxlYWSQmrpELKqy
   g==;
X-CSE-ConnectionGUID: OEavQ0/GT5iseG+oOHkudQ==
X-CSE-MsgGUID: FottH2R7RiWoRsMHkfqv8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78429154"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="78429154"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 02:59:43 -0800
X-CSE-ConnectionGUID: JMPMpqjXTOW1x+xBJA2E0A==
X-CSE-MsgGUID: B7OsfEjkQsGO6g7+bp+syw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="194916220"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 02:59:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRTXH-00000000Eu9-09Pp;
	Fri, 05 Dec 2025 10:59:39 +0000
Date: Fri, 5 Dec 2025 18:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13333/13363] drivers/ufs/core/ufs-rpmb.c:253:1:
 sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains
 embedded NUL byte"
Message-ID: <202512051859.NIJGJam3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6987d58a9cbc5bd57c983baa514474a86c945d56
commit: 0d61d633fa4a23d2873e4770d6badae216d26e90 [13333/13363] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git
config: i386-randconfig-061-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051859.NIJGJam3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051859.NIJGJam3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051859.NIJGJam3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ufs/core/ufs-rpmb.c:253:1: sparse: sparse: bad integer constant expression
>> drivers/ufs/core/ufs-rpmb.c:253:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/ufs/core/ufs-rpmb.c:253:1: sparse: sparse: bad integer constant expression
   drivers/ufs/core/ufs-rpmb.c:253:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/ufs/core/ufs-rpmb.c:254:1: sparse: sparse: bad integer constant expression
   drivers/ufs/core/ufs-rpmb.c:254:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +253 drivers/ufs/core/ufs-rpmb.c

b06b8c421485e0 Bean Huo 2025-11-08  252  
b06b8c421485e0 Bean Huo 2025-11-08 @253  MODULE_LICENSE("GPL v2");

:::::: The code at line 253 was first introduced by commit
:::::: b06b8c421485e0e96d7fd6aa614fb0b6f2778a03 scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices

:::::: TO: Bean Huo <beanhuo@micron.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
