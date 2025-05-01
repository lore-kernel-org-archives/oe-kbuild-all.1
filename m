Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3014AD2D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746137098; cv=none; b=CZpBrbKZqfMEdC1Wg2rsEF6qVMtYJT3/a0f7/DpBjiLGnDo14ZJTK3KSfCPtyRbtWwKryobBa2uJe2PdpuhW/phf1HwZvnhgZ6bzgpvr4scbYufuPptAlgCR9ajBweplWAIIm7dj6nntvWlEVpb9mmROfndu1fwJF07adp0KwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746137098; c=relaxed/simple;
	bh=1aMknTIk8cY6dfHF78Gj2aVBsZSfK5H+nkxw2hDPEwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=km8BNlr4TOufOD23O7mBHmR5b+nBbYcsfN8XIubHVOzraslwR6/ypWRm5Df/wZdIBQjg8B7AiZA0CNL7yZtze1ZbxxzXh397/WMjtZmcTZGqzu2PZ7Rp24UJIoUtKGKDXYODUc/VDlARZep8H0fKLh+blSVtqw1niKP91jjF45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOkIiCjW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOkIiCjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746137096; x=1777673096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aMknTIk8cY6dfHF78Gj2aVBsZSfK5H+nkxw2hDPEwM=;
  b=mOkIiCjWmv1VU6YpymarA68QH/A9+C/no8/SXiwXGHsgo+F2HLnA4+8t
   AIGrP728KyiPS3Lw/UKHVTVfExugrlr9pEddkuO98Kr9WBIOnI6ipo+ON
   rmzhykrr8ztSOP90MAW6zTUwJ+odqWuCjd17Pd6bYfViavR3J//+FBIKP
   K70o4zdmRqaju3uTlXAbaysT0SfyeDadboIkZ/pV4Tk7p+9Z0i7IwPAD+
   53lAPwQu+Ddfy/jqr4q71LUz7LEzO31tTVTvr3h0WVPFYzmj51wqz5IrT
   pDtNBzrdV+9OZiM0XzHfwL4AdShu81+JD1cS5HZNwktygO+lAEUzgIY/K
   Q==;
X-CSE-ConnectionGUID: 4tHw/775TAOOA/eOJ7/1sg==
X-CSE-MsgGUID: T3OR7RtOTu+xbW4l1qCF5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47732995"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47732995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:04:56 -0700
X-CSE-ConnectionGUID: ezhgFz0ASfWdcpp49CuNsA==
X-CSE-MsgGUID: 0u6rz0mjQE+RGhyrK9ETDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134404688"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 May 2025 15:04:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAc1U-0004Pd-34;
	Thu, 01 May 2025 22:04:52 +0000
Date: Fri, 2 May 2025 06:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.coredump.socket 5/6] arm-linux-gnueabi-ld:
 fs/coredump.c:870:undefined reference to `__sys_connect_file'
Message-ID: <202505020613.cM3DxNFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.coredump.socket
head:   8413dd9a8cbb52fc022c3749a8db1efd0853cf11
commit: 0f4f9626b03ce4d39ab09f0aadddc1a6898807f6 [5/6] coredump: support AF_UNIX sockets
config: arm-s3c6400_defconfig (https://download.01.org/0day-ci/archive/20250502/202505020613.cM3DxNFk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020613.cM3DxNFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020613.cM3DxNFk-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/coredump.o: in function `do_coredump':
   fs/coredump.c:851:(.text+0x1674): undefined reference to `__sys_socket_file'
>> arm-linux-gnueabi-ld: fs/coredump.c:870:(.text+0x1690): undefined reference to `__sys_connect_file'
>> arm-linux-gnueabi-ld: fs/coredump.c:875:(.text+0x16a0): undefined reference to `sock_from_file'
>> arm-linux-gnueabi-ld: fs/coredump.c:875:(.text+0x16a8): undefined reference to `__sys_shutdown_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
