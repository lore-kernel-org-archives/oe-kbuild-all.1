Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3527268C40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 23:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754003468; cv=none; b=FYG44uPOuEowvuT0U/SX80iFyVcrJhq3iE0untYBrLg5aUl0IvhfqW0adf0QI5N0JRjgkxrMaDQX3b6tnqfuKTbYpVUil6u6RwS9tko0Mlb2WCY5Unaws0clDgyv1RnAjuyU9/05dTSVzwMawkWiqd3ys/Q7z3XYvdM2GIOMoZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754003468; c=relaxed/simple;
	bh=ex8OF1W/sHlVAL/6Dw1NnE800LbvPQA3p4gLp0JZ3us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3ubFdYtJtAq8a1cxqDDl3PXein86GvMzrd6boQQWo5c47SRIUTBQq5EuqTvhUqiE4uTmhaJroI/m1VPdlh0Kuxo8LoIofEIgotl7GUxPDw4KP6tNWs6/vtRYiuYZmW1xn5pgbduEaIckEbwTRJCFL33nhugXihBwIOWA7Kh7sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d33gC982; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d33gC982"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754003466; x=1785539466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ex8OF1W/sHlVAL/6Dw1NnE800LbvPQA3p4gLp0JZ3us=;
  b=d33gC982zwRfonMDcutyTuY4yxrx6trAwDksUwDJLRTe37AQMCU2xko6
   Ar762wtcantO0xE/HFvVs3HVq0Yf9U8NioqX/GQVULhWWoIGr89oB6yvB
   MvATjLTG1T6L7V8VHkpz0MQT9aPZ243NdVq34sZQNTyttqjADStGT39Io
   8pcOpSKKxJ/rLta+6zbjUzlTo09q6i0FWbRyTazx/dJpayhCZjE+BqJvF
   fuCUgyMcucwUFvf+89aP0akHLVOFb6OuEqEQbhCV7spQpxTq4ZnkPV6R6
   7VMyVDqznHFrOuF7jdYdCc9lcBkFKx6NpIWNM2vYXlSThUkqb3lifRCkU
   g==;
X-CSE-ConnectionGUID: biPymMusTAaxoKGRIjnvOw==
X-CSE-MsgGUID: DDtbPKIvSZyY2SuMbYoJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67706058"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67706058"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 16:11:06 -0700
X-CSE-ConnectionGUID: 62ZlXhtDQsSD+qkyuJcqmw==
X-CSE-MsgGUID: P9aFdPQyTv+1Ne4n+utRAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163837845"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2025 16:11:05 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhcQR-00016t-1O;
	Thu, 31 Jul 2025 23:11:03 +0000
Date: Fri, 1 Aug 2025 01:10:58 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1] htmldocs:
 Warning: Documentation/trace/coresight/coresight-cpu-debug.rst references a
 file that doesn't exist:
 Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml
Message-ID: <202508010144.IPfLkClZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   6e920c19ef4a8f89209c5ac5530a793323f633b5
commit: 3e7fa063af285361ae434a82b5eabfef99d0e59b [0/1] coresight: docs: Fix a broken reference
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508010144.IPfLkClZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010144.IPfLkClZ-lkp@intel.com/

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
