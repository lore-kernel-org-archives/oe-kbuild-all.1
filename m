Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2700E155A4D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 04:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754541716; cv=none; b=GShA5jBDYBP9Sk060DHheerynWmFeZJ85sVFAjY/DsCbeKyN+oO3UJkKgSqTT8mNv7FrWmGqZnIMhHs3PQgIPMN26e7j2mfehknDu8tcbCpwYOJS9qROGHE95ZsmkHZNHjnFbNB0rnUnr9pGAoguzJhe0wTu4D6g9NYP1tbhyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754541716; c=relaxed/simple;
	bh=DvZ+0trppQ+ClPnGVADEZDarK5YOZhOXUgpPKPtjiEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsvTo4q0rlKN9284vxnjDdtDNRvj8cGpDpUM6Xp/HSvJ+CVDzmei+2//OQzgeAlFtf+Ui9sNaXmG8WtbD+Q1qAJAmnUn0TWfyx1tEKGeONkDQ5ifIjFSoV+ZAAJ3Ku1Cilb3Bp1M+49s4+ObAGoUDjwEnUAvj67gHUcgT0P/Djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzUi/pKF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzUi/pKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754541715; x=1786077715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DvZ+0trppQ+ClPnGVADEZDarK5YOZhOXUgpPKPtjiEg=;
  b=ZzUi/pKFq+Cmtwl7ovzleZifSHy68lXsucEOxdBqby3QU2d1yGB26fZd
   xlu3bC+9AtUBGAhd2+IR7jvM+6BZseLX5lsdeJ91nLf9jYGJQYjk+JKXr
   Adk49wgb7YSpzSt9OXM9JURk8kHMOkIg60r15FgxpsgxcFf+Ig2iJPCMu
   qbtX9jpofaR/sHS+pVTuJ7wCUfFa76AhdggWDtn51PFqEB3hC1KUIrQPL
   qOnf2e4a28BWq6zPlaMwGCVmFR5h6VI0aQcyR0VodMhqbxG7ScMa5TELG
   z8YB7DK7a0zOlez4nlOo0NshotLDeTNUsku+HjCGsJT2TEFRA4A7I6woi
   g==;
X-CSE-ConnectionGUID: 4oSlkfA6SwmFOIWz+8r9mA==
X-CSE-MsgGUID: Ytn2uT/yQCKZ41tRg7Iy4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60677668"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60677668"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:41:54 -0700
X-CSE-ConnectionGUID: M8PldJCzRXy9pfFq0aNlPQ==
X-CSE-MsgGUID: mKCdRgHMR6Ch78olXeV0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164479713"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 21:41:53 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsRr-0002KT-02;
	Thu, 07 Aug 2025 04:41:51 +0000
Date: Thu, 7 Aug 2025 06:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor):
 Unevaluated properties are not allowed ('vcc-supply' was unexpected)
Message-ID: <202508070641.tkKUY4Wt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   886d2f37b79982531259490548bc83b9216ca685
commit: 4fd50f6980e2a491ab9b21b42db5f474e85badfa [1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
config: arm64-randconfig-2051-20250806 (https://download.01.org/0day-ci/archive/20250807/202508070641.tkKUY4Wt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070641.tkKUY4Wt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070641.tkKUY4Wt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
