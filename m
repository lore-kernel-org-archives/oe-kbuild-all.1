Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CBD26FDBE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740753853; cv=none; b=qh3ogLzqkUHQM1nTxcQOufJ/kzsT5IIPae/LqTcKf85Lc+eO3jcd4yi+0dIuYC7nvN5RBa2dWT1W6fw813zqbeKQRfB99pY9H0ph6256C5sFVQt+F5UpJ47H+OF0TmDI+xSSEXORmjtz2Rthl8yHtUAUD4lcyvMNFV5gwSugJyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740753853; c=relaxed/simple;
	bh=pyVfHMbpvtY+LBCpRHZa3uDtg5xfCoatZEAv16hITfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QY4ASEXvd6jc4kTEctp8Ch1lE2eW9lef/BnYuYzDD372zc+/A1rzlPhV+S8Ss7u+lVnufwdne1ogm/7mQQKh3eLkxMEQUJUUvJmXiiraySOmdvaNv3NAK6akkPJaRL46a1tGWEK/5MsynEiQVHGxRa9LOib2YXXMBKse9NP8he0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/koay32; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/koay32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740753852; x=1772289852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pyVfHMbpvtY+LBCpRHZa3uDtg5xfCoatZEAv16hITfw=;
  b=h/koay32bMVWuMpyj44ljK43Rnd/t3NP/dIzbwog6h8H/ZL6TyLXh4qz
   4F44+0s0P3KdDqUO0eXA/wTQPIUGx/jdUj17/y0zPA8GoWJnkyeIOoadP
   eq02HuhNWHB11t5Hgrhd2Z1yEIOtM3JkZJNxPlwTPlmjblOtnGm10M6ED
   wRlgRdda6tF0HVeyqys6rqO+1m+LFCrBe2+Vhq4Yhsk6AFPzMNNSPLkwq
   nOPkezwJJrus4f/q2dgNj9Vpu07XehQaT7m4CJcFSvEd0T+RLJeBkX0pe
   jJRUYlT7uR95ugX/em4Sf9hExLs9F8XSjPaf9yGp7PlelZ44EvG8B+sCG
   A==;
X-CSE-ConnectionGUID: zIH1fcEQQW6oSDtTgqj2Kg==
X-CSE-MsgGUID: C+JH+0QRSnKUfANccjGXAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41708860"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="41708860"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 06:44:11 -0800
X-CSE-ConnectionGUID: Uh4tNEhbSxmpNFqabNcMTA==
X-CSE-MsgGUID: NSpOiSJpRL+y4aQ/LUsp4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="140575297"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Feb 2025 06:44:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to1ax-000F38-2e;
	Fri, 28 Feb 2025 14:44:07 +0000
Date: Fri, 28 Feb 2025 22:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] htmldocs: Warning:
 Documentation/trace/coresight/coresight-cpu-debug.rst references a file that
 doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202502282217.aM3rA3TB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   33e283448f335063aab245460a2d3b85ac627b9d
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [0/1] coresight: docs: Fix a broken reference
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502282217.aM3rA3TB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282217.aM3rA3TB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
>> Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
