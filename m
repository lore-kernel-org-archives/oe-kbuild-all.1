Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209973F9A1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138481; cv=none; b=gs1o2e0U+XWKm5iJbdch8sJe2EmHQs/WvxfSUmYLICk+cIcNbOftAnWyV+IuvCa38EDzcfLrPX5JN0dkKrQqTaApG9lYPCxmlhnNMyV9xgiOsEJQx9bN+2oBLKWJY4Za3lx6Ds4oDrFRZsGcHTmfkm3vBE2XuFlNxQQ3M843/VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138481; c=relaxed/simple;
	bh=GqPQHrp443aolGBFxizplFTVT+xhyGGhieP4NghNHqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hpDP29oPdPG7VqSNXvb4vcH1+XzSDlMTlDafuMHXe+z4GpZmzlWw8q8m54gL2V7tLEpmW7S4DxAUTdvpcJE9tdNP6ZJ4X8R+kbOQRjPcvnHqhNnF87/R2ayY0ILAY1qtIZGvZITRt5g5pLx+D+QymrSsca9KjPY6T1A89lSuRSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYBbkq+l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYBbkq+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792138475; x=1823674475;
  h=date:from:to:cc:subject:message-id;
  bh=GqPQHrp443aolGBFxizplFTVT+xhyGGhieP4NghNHqk=;
  b=TYBbkq+l9fTLZeZNvE6sdIHjaKMwzLVkO19WsuovArkYxHES/G/5OwiK
   euJWA5UAyfN4CZFIXnUX4Cp3LKkXvYQQqSX82eLJSyOdmIdmcxO6otbU8
   FtY/qJqLL8fuI7LDiZv//JdcaRgS3jzIyEjfkIs3r3foR4UcuPMtS1OX5
   nvScmvVjYYJqxofwa/cKvwWX6A7JVrLhDtWvSfuBcryba155WPy02X4/1
   oC/kbFgMsd6Fq3/i4ucr0H5tu2vEyQoAyAb+xPgU9PpB2HEtvspsYmMaw
   JNiXx2fhUJQxO37OuUg+X2g/1i/43NvwlkpLBtfJTbBZu40nHWP+EJirG
   Q==;
X-CSE-ConnectionGUID: +2A+sBA7SES7fx87ovOwdQ==
X-CSE-MsgGUID: MUJ2/B6pS0qzg79iYNXwsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="822303"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="822303"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 01:14:34 -0700
X-CSE-ConnectionGUID: mMGwE85zRWmjOESYS09QEw==
X-CSE-MsgGUID: Ru1caOWxQNKseS2ZPNEpig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2312488"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2026 01:14:32 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHd5B-00000000C8J-32C8;
	Fri, 16 Oct 2026 08:14:29 +0000
Date: Fri, 16 Oct 2026 10:13:43 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/19] Warning:
 drivers/pmdomain/core.c:975 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202610161036.XpliPijI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hector,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   d6636aea14e70b5b997df5681ff9d254d9e75209
commit: 03b2661310696159c42fc15ba51830ec343b604b [7/19] PM: domains: Add a flag to defer power-off until all consumers probe
config: arm-randconfig-2001-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161036.XpliPijI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161036.XpliPijI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161036.XpliPijI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:975 function parameter 'one_dev_probing' not described in 'genpd_power_off'
>> Warning: drivers/pmdomain/core.c:975 function parameter 'one_dev_probing' not described in 'genpd_power_off'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
