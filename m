Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F1DDDCB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709591310; cv=none; b=cnISDLSqj+bNjpQygAJNTsMlyHaobcu6+uZ0XGc9lo5vHHw1s/W+0auVtZ669qL/xeKu1CePr76p9Wd1kr6LEAxKIO6ORdo5RpCSFF00xFBPMTo1g8KbBxGBtrWzU9JxK3ItXUX4zTpy3V5hcdRbQ28+IaIWiEWfXxkPjNJrFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709591310; c=relaxed/simple;
	bh=mPkb0/EtU8C2zllsYd8X1hliZl7sdEzKELNQCGwZAK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDqqWrJ9R8f8HVxboNG6iAEVJ/rEPu83SdwGbqlEBCTGN1caymGQ6oMG3MGvMJ+LYfOHKVvWIH6wJc1Zcgj8l2zmEYHpslZO8zfasvToo4Csw44E4qoNEenFDecMvSRNxCZeRkikO9sX3DxA3eRQij4S5imdV2yAecJIXXdDCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGdPISSj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGdPISSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709591309; x=1741127309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPkb0/EtU8C2zllsYd8X1hliZl7sdEzKELNQCGwZAK4=;
  b=ZGdPISSjlW3f8DW9HfU8WNwIYqo25C8+Dky7o50zIsgGoxlNC5FCdXtN
   BFzP7Zt0SKbm9z9HG5Jjj9VzjQrNlmxyvtRx7MuLQN3Pg7TjkIhOW9Ixg
   C4IRfxkhzEGdzCnj7Fwbdjobyzk0eUIRuZOxL6JBs7ARFUuKlmTZWE8U1
   R4KrFh+eDxj8KKcntGQS6kvhaLdSJuQiNzne5NWij3iQKWJnUwy1K3Dh7
   C5U0l2fVCK0/bydxlD+GH4OdCcDDTClFzaZIVLVu4qafonNOKVyfrxShZ
   eOYyZAmvtQhJB7yFb7GXIoSPpUSxOuqnYGE8YUbUMxiE9XVERr+1ouymJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15541991"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15541991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 14:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9091593"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 14:28:24 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhGnF-0002o9-2r;
	Mon, 04 Mar 2024 22:28:21 +0000
Date: Tue, 5 Mar 2024 06:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1241] htmldocs:
 Warning: drivers/acpi/pfru/Kconfig references a file that doesn't exist:
 file:Documentation/x86/pfru_update.rst
Message-ID: <202403050624.I4tJpDZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: bbdf79552e7158d86b068d3701d4f945fc63ff88 [1/1241] drivers/acpi: Introduce Platform Firmware Runtime Update device driver
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403050624.I4tJpDZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050624.I4tJpDZO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
   Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
>> Warning: drivers/acpi/pfru/Kconfig references a file that doesn't exist: file:Documentation/x86/pfru_update.rst
   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
   Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
