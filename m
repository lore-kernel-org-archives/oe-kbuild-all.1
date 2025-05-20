Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06881A2396
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725305; cv=none; b=ZAg/T0EXY4IWLZh1ZfFA8kebQwBSmbajROlBaXSb4XwxLMhKjFOmx35iHGYtjDEj598OTe7zCh2vchV101+t4mbxB2yLYwvhOEtplUkf673ZCW0U7WTO0hkrOQaMn6/SFM6qeU5WNR1xNCNgrSUpy2NG+IsNsovWJedHuRsXm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725305; c=relaxed/simple;
	bh=Vgyza4M9Pp5MUF66mwC7cuxxtJWLVhI2lEFL5ESCXnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7T+Oaf01LntpLuMY5S8wmyUJ9hH4Dl035aZmlFxFgAytX9ZMqrdu0KnX0xLzbeERR36HjMbKwkpXTk3HC/jxzF+R8kMZwP6nxfp5YnK+yKksXaXp5531GxbysRnne0dEN5Tel6bt5OOrAXHeO5gyUP07tSn87jDMubQ9L88K9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muKQ6pWT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muKQ6pWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747725303; x=1779261303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vgyza4M9Pp5MUF66mwC7cuxxtJWLVhI2lEFL5ESCXnA=;
  b=muKQ6pWTC2NYAmowxKaKqJwrxq/7yy9/Zux7IAIQ2YoPjR6vcZ0j5BDo
   kWwEf2wPlDnuS0cBbhUKXO8S31B6ZEEn/zgnmSMfy9qrczA5FRpQxY/1h
   7kPRGligjW/p840Y47Qfi+7ya8V3L9Ak/baQGAKt7v3Y/loZ/IY+rjp0g
   nWs3Q/0iQx6LnxENGL0wu/pYo/Jz/hzLCOvIqqkiRVtyYmJD7tUAQI2zt
   pvn+e1Qe/Q2ynoBFzT7ZgnI1gkHh4N5FExDv4IBxMtcS5zUvEwYtmcvVx
   6a/EImtVKrlJkXUIvMHhzZbx0LhminrsqbMFwG6J2bulqaEbv3bBqiER9
   w==;
X-CSE-ConnectionGUID: rCWbJCsFSJ+Q1RRA5Cbd/w==
X-CSE-MsgGUID: UAJwDHx5SIGvtNEH3obH0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53446245"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53446245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 00:15:03 -0700
X-CSE-ConnectionGUID: gfdvMNKGSHaXLdNZMaTkDA==
X-CSE-MsgGUID: evh95+eqSb2CqNV+gh5bog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139445952"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2025 00:15:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHHBj-000MGo-2K;
	Tue, 20 May 2025 07:14:59 +0000
Date: Tue, 20 May 2025 15:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2257/2257] htmldocs: Warning:
 drivers/arm/mm_monitor/spe-decoder/arm-spe-decoder.c references a file that
 doesn't exist: Documentation/arm64/memory.rst
Message-ID: <202505201519.o4k4rCxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   289de29f4f837038aa79e765e64ddc1d410fe5fd
commit: b8a759002c48f227d03084fb6b6213a3beaa44e3 [2257/2257] mm_monitor/mm_spe: Introduce standalone SPE profiling framework
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201519.o4k4rCxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201519.o4k4rCxn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
>> Warning: drivers/arm/mm_monitor/spe-decoder/arm-spe-decoder.c references a file that doesn't exist: Documentation/arm64/memory.rst
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
