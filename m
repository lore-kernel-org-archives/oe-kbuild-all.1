Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76C422FE0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924952; cv=none; b=XNCzTtX/6uQUxL88ZhV2j6i3Js19bBd4erXFSl/oVGmM6IUQv+NX+n4OZUXUaoH92DtXxP3IgDT39sLPsznx612B7TSORe1c7m+UAd9T7BnqduOX/uG03Rz3vJ5iBTtwrFXwCBSsEeOuPg1NWrgB4daJXbug+l+wdfWXb0LDu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924952; c=relaxed/simple;
	bh=douVHUbq7njgFRUKJpXcoetJA9VO0jZh09ikoWS1iLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcMxQV8E4LsTnqGmS5GxwSbyfT28YvZVaQf/uQeHp17nDvXu0UZKRxePCxoKJcTLxNYovWYEZjnsc0UqzAHa1Q/nmSx5qReOpTugXGbLvi98Dy6OsbYgNays4N5xdjNCQfhwpdcO6rjdbJNrTRAU6Nt+hqM1nYKUAzNX7mP1BFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiJz85fE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiJz85fE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736924948; x=1768460948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=douVHUbq7njgFRUKJpXcoetJA9VO0jZh09ikoWS1iLE=;
  b=FiJz85fEENQgC9oXbChjip0ymH9163MmHMjCiVJwsdSHn98CIAL/pkDR
   quKFH5TRE8RiKrSvyJYbW+6NAOOYrWWE77uRN/cPoxnlPi/qPkwvVeldI
   Yljma7vUX5JPYLBLCFMDY9uo8CIOO2qlsvltYX3kPgYo9uLOKC7VxhPBj
   ZCHxV2ptc+8K7wm5m68h3oxRHS+HobiW22sE39Diac045aP0k8X3Yf4+S
   XL4vb92eaSfl3pXb2dzXyy8khTHSE9bCo4IR873NovTK/ZdDp+4JYloft
   l+w8vlEzcwwQEFs2dO+g1KPVFbs6ZT1K9IiY460PsSmGUz2mNCqygzpxy
   Q==;
X-CSE-ConnectionGUID: eb9uVjC7QIidV26F5nxodg==
X-CSE-MsgGUID: Ebeu0gYPR4mqzY0NRAbwdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="41010300"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="41010300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 23:09:07 -0800
X-CSE-ConnectionGUID: hnhmxcXjQhqZggAJcTM+qg==
X-CSE-MsgGUID: DbBZUiOPT+mnnGC117Yp2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105529679"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2025 23:09:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXxWR-000PbT-37;
	Wed, 15 Jan 2025 07:09:03 +0000
Date: Wed, 15 Jan 2025 15:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 258/258] drivers/memory/mtk-smi.c:856:41:
 warning: unused variable 'mtk_smi_common_mt8196'
Message-ID: <202501151551.QiNdsm3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   68c161ca42a79e2be7efa175b36a54f66c647862
commit: fb50c7382cab5ae14ad2a9f6aa465230af1b252c [258/258] CHROMIUM: memory: mtk-smi: Add mt8196 support
config: i386-buildonly-randconfig-001-20250115 (https://download.01.org/0day-ci/archive/20250115/202501151551.QiNdsm3e-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501151551.QiNdsm3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151551.QiNdsm3e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/mtk-smi.c:856:41: warning: unused variable 'mtk_smi_common_mt8196' [-Wunused-const-variable]
     856 | static const struct mtk_smi_common_plat mtk_smi_common_mt8196 = {
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/mtk_smi_common_mt8196 +856 drivers/memory/mtk-smi.c

   855	
 > 856	static const struct mtk_smi_common_plat mtk_smi_common_mt8196 = {
   857		.type     = MTK_SMI_GEN2,
   858	};
   859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
