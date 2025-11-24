Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EA2BE5E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763972282; cv=none; b=AE3RUsFwrbw8UqHQttBJXx9hTEPFFegtkVSH+gsI7Q0ycNKMInYqsXA5Pld4Pjzu+kg/TqvAT/fDpf6XdXyRXo2sNj5o5DKHhdFYuD4laXWFtbYI2UkkGdcTmRwhdnPsHT9NNUsh7Ib6cqIDjDRHiRs3DbTgqxEECAbpxSbQaqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763972282; c=relaxed/simple;
	bh=o9ooNP1/9nZU32gUJhldbmZo59TyskIN8tPRe5NmiIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MYuvIDq7g+RGUu+ykVTZM2yToQBO/EjRMtM/8EE45w9DohpCLO5vNaDYJaEcJordsD50Jc9N9IN75wQfrm9mvJ6tgtHfdcQcVymX8zST08RnHPb+reMlFVglicSoFP+NYDG8DYO9Gh0gOZGpao5SJI3W3eykP+bsUKuGUN1o2pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VR7cwpfy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VR7cwpfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763972281; x=1795508281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o9ooNP1/9nZU32gUJhldbmZo59TyskIN8tPRe5NmiIs=;
  b=VR7cwpfyfr88VU8dtjp1ApnAsicgQ8nhWqACt1Ir3f7u5YemvCuijqUJ
   z8W8mVlNMq6zpeSDyBIBr2f7iFwIt4uc0d9ewA/y+8mcm914KlmCvf/Eu
   VR+ShRKttAgQ3UXCzYHL5Ucu8Jy1fMlmpfBNoDLqoroOeWlc7GvedGSp1
   Q499v7lqGM3uF+6z+JuwB19qqEwChrXJ5kFH7qRURZ7uXgmdjdBFz/2Wv
   D1WHPNXYotxIRz1UT2J9h7rbxcGW9cogzMNQtEjwAZbI99lH1pRujwGdk
   O6Kw4iTX16btvCydl8irMx6RJUCFSIrOGLxOIxBh2rfNCTV5IU185GDS1
   A==;
X-CSE-ConnectionGUID: z4vjnivIRiOO9+byMk0uaQ==
X-CSE-MsgGUID: YqYYw4LAQs2cR48VbT0/QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77439765"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="77439765"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:17:55 -0800
X-CSE-ConnectionGUID: HYD5MaSvTRW9SeEZ5GeKgw==
X-CSE-MsgGUID: jxLKsgnHSPenWqCNYDWtuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192732494"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2025 00:17:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNRlf-000000000W5-18G9;
	Mon, 24 Nov 2025 08:17:51 +0000
Date: Mon, 24 Nov 2025 16:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>
Subject: [chanwoo-extcon:extcon-testing 9/9]
 drivers/extcon/extcon-s2m.c:15:10: fatal error: linux/mfd/samsung/s2mu005.h:
 No such file or directory
Message-ID: <202511241625.H8NSpB2S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-testing
head:   925e04713b380ad2b73ffcf2ece5ee1bfaa2689f
commit: 925e04713b380ad2b73ffcf2ece5ee1bfaa2689f [9/9] extcon: add support for Samsung S2M series PMIC extcon devices
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20251124/202511241625.H8NSpB2S-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241625.H8NSpB2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241625.H8NSpB2S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/extcon/extcon-s2m.c:15:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory
      15 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 drivers/extcon/extcon-s2m.c

  > 15	#include <linux/mfd/samsung/s2mu005.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/power_supply.h>
    19	#include <linux/regmap.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
