Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B2378D9A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607219; cv=none; b=l6MAeXtMZzfBFrmtvRlkSlBrSgWKr6yvDsJbZx92fZtT27bTtAW0awOp451OZdPY0rhYT2y1jatWQIBjVa2m1UU58ermD0u4kP6xCk6takmcH1OEK560mVhU/1zybO2F1qDdpngh2PPZv99cV0yZiKavn0UBgqpDsdGmm+dntUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607219; c=relaxed/simple;
	bh=FRKfbIEV/k+9oceVFy9Fmc2n5RjSj1nrb6HDCjcwyKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pnw25oUr9m3626iqeGP/+klNlps8Mn6HCmgKPNt136PROyIKQWfgC2ggq84c+tIun59YNnR1UJwE+mNmhAuejOsqUOO615UfeONAeCSmUk7zTWahHD/PMVHGOosI2XPmU7NrnMXMja/wanqnTqnxD7PwetSDuHw/vaGRXGv8120=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrD0ElkA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrD0ElkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786607217; x=1818143217;
  h=date:from:to:cc:subject:message-id;
  bh=FRKfbIEV/k+9oceVFy9Fmc2n5RjSj1nrb6HDCjcwyKc=;
  b=IrD0ElkADj0GSMQ+ArRYvXc2zq/ze1s9CW3klspYHUe871+L+x8klJo+
   fYeCblZJlUm1+h7gvlHrt0DxSKtTvaxTtPgkV26XKhJoZCss4Cbv11SNX
   uB7JhAmCELhc28Hxwl596gnrKNm41XFMB8V5UnMIlZWvkZ7CZpGm2Zdat
   L+iO1E+k6oUnX0bdGyLEcpvaX0jmcE+CI+VeIxCHR0Lhmy+VAdeOAx99q
   DElOF6xxcjN6Dul8Fn/Vd8SHqFuHt2Fdbff377HXYvwQWFhEs25UtA9ct
   kBJEc/bKWnaZCuaZlQhZufcB6EbvMmyxsKTyyWVShhSWyULeXuOj0ARHo
   A==;
X-CSE-ConnectionGUID: FTocf71STSik54ko1NfO5g==
X-CSE-MsgGUID: gsCplf5sTkiGKsFuUTJCyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89694624"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="89694624"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 00:46:56 -0700
X-CSE-ConnectionGUID: 8myqaI8iTa+/42pveZgg5A==
X-CSE-MsgGUID: OU4UJInkSXqeMuvD+SUJ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260584020"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Aug 2026 00:46:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuQ9M-00000000TGu-2Eo0;
	Thu, 13 Aug 2026 07:46:52 +0000
Date: Thu, 13 Aug 2026 15:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: sofus <sofus.c@icloud.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 55/71]
 drivers/media/platform/apple/avd/avd-drv.c:692:12: warning:
 'avd_runtime_suspend' defined but not used
Message-ID: <202608131522.q7eTEdiB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi sofus,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   adec89957b4232b3d33188245114b9e640f72de6
commit: 9d77b27426e338bbf4f4df0676c1e064e046527e [55/71] media: apple: add avd driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260813/202608131522.q7eTEdiB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131522.q7eTEdiB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131522.q7eTEdiB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/avd/avd-drv.c:692:12: warning: 'avd_runtime_suspend' defined but not used [-Wunused-function]
     692 | static int avd_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/apple/avd/avd-drv.c:681:12: warning: 'avd_runtime_resume' defined but not used [-Wunused-function]
     681 | static int avd_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/avd_runtime_suspend +692 drivers/media/platform/apple/avd/avd-drv.c

   680	
 > 681	static int avd_runtime_resume(struct device *dev)
   682	{
   683		int ret;
   684		struct avd_dev *avd = platform_get_drvdata(to_platform_device(dev));
   685	
   686		ret = avd_boot(avd);
   687		if (ret)
   688			dev_err(dev, "failed to boot");
   689		return ret;
   690	}
   691	
 > 692	static int avd_runtime_suspend(struct device *dev)
   693	{
   694		struct avd_dev *avd = platform_get_drvdata(to_platform_device(dev));
   695	
   696		avd_shutdown(avd);
   697		return 0;
   698	}
   699	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
