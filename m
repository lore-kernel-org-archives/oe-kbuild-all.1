Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50211158D96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950469; cv=none; b=pucn8+c5QM8VeoeSykW1jG6gNQehibVMgMbq4sND1jAvTNj+vBH6GSpRVXdBMh2ryxqFAozI3zOPScM6zKg1Mc8qmb79IDArEjy7VsrNyyQ8D8M/jZwQEfgFlVCmxKHeay2575gjYqyVOMNl0MaGI9R7UyzaGv7q3GOa2sRWa4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950469; c=relaxed/simple;
	bh=yfOXzl2dctOOmP334LDOyOn2UkbVRcgyzqgUntdaH+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L6ylpY26WJcu7r+1ATfgJXHz88Ux6jMaH5eNmbumfUnZ4rh9xj0WfXXP81UwpHVFO3IxaYeRJSTAf+W+GjA5+I5X4RGAnx64ZtZm1Krppr7mlXUXpieRRe8+m3UmH7npj3rKuQb8SlRqL+uNgJEAU3DhVIYpZieREdUR/aPka64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ScsoBr+D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ScsoBr+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713950469; x=1745486469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yfOXzl2dctOOmP334LDOyOn2UkbVRcgyzqgUntdaH+E=;
  b=ScsoBr+DbFjuK/2nGfm//UucXhceyvMRWN1BMYt2W/X3ZwnekOZFtGF6
   ASYcc/FbSwfAZ1sUshC8u6LSh/WYzBk7gA8J2+FR21S9B55zY3ArkGAfe
   QsgTM6rvqCNVtNSGTLYbBzh8HgRmXn1vvxKRomSs6pagWXazUrYSCefFI
   MDbc2KyvLJM6X5HdvwxBmGrq1d65lkoQCNy5Lobyy3IO7FiFh8L4rILRA
   hqlaJT8fcPFU3GJlCvbTNm+eNhDBtUHguobLwfiFPgyk/nOBmM3KGa6Lp
   wn5rBYJgIHJdnnQrmUUCi3yR6mHxLmzboiLZHCPE5BfakMenW9PHECcqT
   w==;
X-CSE-ConnectionGUID: lAiqS/rNTpaAttwmIj+Cig==
X-CSE-MsgGUID: mTzpNTqgRfCpgHvl8l30rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20120673"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20120673"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 02:21:08 -0700
X-CSE-ConnectionGUID: C+P1PTzEQyGj6sHyx54TNg==
X-CSE-MsgGUID: PAUn74VuTmmRVoOvKDzSrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="62121334"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Apr 2024 02:21:07 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzYoK-00014e-2Z;
	Wed, 24 Apr 2024 09:21:04 +0000
Date: Wed, 24 Apr 2024 17:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mediatek:v6.9-next/soc 17/17]
 drivers/regulator/mtk-dvfsrc-regulator.c:9:10: fatal error: linux/of_.h: No
 such file or directory
Message-ID: <202404241705.Z2K1nETe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.9-next/soc
head:   9c2aa575f0f0dfc9163e54727e527c9e0566502d
commit: 9c2aa575f0f0dfc9163e54727e527c9e0566502d [17/17] soc: mediatek: Add MediaTek DVFS Resource Collector (DVFSRC) driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404241705.Z2K1nETe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241705.Z2K1nETe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241705.Z2K1nETe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/mtk-dvfsrc-regulator.c:9:10: fatal error: linux/of_.h: No such file or directory
       9 | #include <linux/of_.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +9 drivers/regulator/mtk-dvfsrc-regulator.c

a0db6b0aa670ba henryc.chen 2020-12-24   4  
a0db6b0aa670ba henryc.chen 2020-12-24   5  #include <linux/err.h>
a0db6b0aa670ba henryc.chen 2020-12-24   6  #include <linux/init.h>
a0db6b0aa670ba henryc.chen 2020-12-24   7  #include <linux/module.h>
a0db6b0aa670ba henryc.chen 2020-12-24   8  #include <linux/platform_device.h>
045a44d4c9b325 Rob Herring 2023-07-14  @9  #include <linux/of_.h>
a0db6b0aa670ba henryc.chen 2020-12-24  10  #include <linux/regulator/driver.h>
a0db6b0aa670ba henryc.chen 2020-12-24  11  #include <linux/regulator/of_regulator.h>
a0db6b0aa670ba henryc.chen 2020-12-24  12  #include <linux/soc/mediatek/mtk_dvfsrc.h>
a0db6b0aa670ba henryc.chen 2020-12-24  13  

:::::: The code at line 9 was first introduced by commit
:::::: 045a44d4c9b32578aacf0811063e5bb741c7c32c regulator: Explicitly include correct DT includes

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
