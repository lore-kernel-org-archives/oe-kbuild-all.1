Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6228517B02B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720555325; cv=none; b=erZzQWZ+5tp45E6l08QoHjMHufwV3Zxn5Ok+9HfDXUgiI7Kpi7h0R9nWkqXjfTx4IX+WsYH2Pf5Cxn1/Dhi/DV+xyRw3FPyDkIThlmYPGfQPOjd2obxIIAuratu66hkkzd0INFTbG5qjhMixAT8KnGT95X97lrkMHJeJ0CcKTbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720555325; c=relaxed/simple;
	bh=o3KjcLX32up719YzVSRsvx+vVVMKz7dqfpPOfBVp50Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1Q+tohHIMddDdQ7DSZzxfUf06XA2vjIMvvO9HsNPXQzpAzE7v44tpKrbXYQl7taKkOuThvNVL3GzITcZPp/8cfxPrp4BL4zFYOOMDgyQw1v/djiZoE2NeK+khxrqjr1VhXtuLmhsrryax4ptyhspSPAB4qcWg/RqIDQlyh3E00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABVEgRs/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABVEgRs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720555323; x=1752091323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o3KjcLX32up719YzVSRsvx+vVVMKz7dqfpPOfBVp50Q=;
  b=ABVEgRs/osDISjlopPLGEeRwGEwsf5P0+tdk0JzA/3ENzRiOItp2VAC1
   R4bFDND3PBqL06oB4zx8V1JABRSEAKcaBKcmIE/pQ0gY6Hm1axIB2s/gi
   yBlvGe/AuXT9/59N+PqENRR7s5ElFsJHrLZ6mx2q9oMu56AMI3rvZ714l
   nGPl1WpNbHbUJy4LUDaiW3WUC5BvrYFSToTHEGuheNcMc0Kyi4hSRShZy
   ETeWoOdbR9AqRMVJMWRsAXNp/giSxIsZJe5M/QGq24kHiDrGvuhHm5YO+
   ji7X2XKfPKjDXgrx4zhOnXGr2EEGGgyxQf9r4gTlfZ0E9QLqNsPUN77pS
   A==;
X-CSE-ConnectionGUID: zlyQ8D65TG6nRWQkKAGoXw==
X-CSE-MsgGUID: tZmdm1bMTDW04yR9Ow1C2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21656305"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="21656305"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 13:02:02 -0700
X-CSE-ConnectionGUID: GAW/U3CTTduBH3SU2KDoTw==
X-CSE-MsgGUID: dOWIhtJtRhmQCEDl23egvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="47843175"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jul 2024 13:02:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRH2D-000X3S-2w;
	Tue, 09 Jul 2024 20:01:57 +0000
Date: Wed, 10 Jul 2024 04:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/cleanups 2/5] ERROR: modpost: "__node_data"
 [drivers/scsi/mpt3sas/mpt3sas.ko] undefined!
Message-ID: <202407100334.q1WFCuIU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/cleanups
head:   9463f6b30914c8bd173bd9e12392cc9b1ea94bf4
commit: a10949fe781dc9ab0bd4ce9e87d67e70f59cdd3e [2/5] MIPS: sgi-ip27: make NODE_DATA() the same as on all other architectures
config: mips-ip27_defconfig (https://download.01.org/0day-ci/archive/20240710/202407100334.q1WFCuIU-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100334.q1WFCuIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407100334.q1WFCuIU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/mfd-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ali1563.o
>> ERROR: modpost: "__node_data" [drivers/scsi/mpt3sas/mpt3sas.ko] undefined!
>> ERROR: modpost: "__node_data" [drivers/net/ethernet/sfc/sfc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
