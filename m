Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3135239E62
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662407; cv=none; b=rHtHXLJZ1AmRo29OkF1VP+Pkx/zVXfSeG/p7rVwiUwtPudRLtYxBRLLrlnlqU19Ij2g5FQi5p77hwYHfRNWKGRjG2LkCEu9mua4Xyr/p6m6IjDzFE3w3cHkn/J/VgANIHiglMJ7K4InJHHeAwQ7OWg06UjC6EaMo/vmZ5fopcAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662407; c=relaxed/simple;
	bh=YPDK2c/m+bw5UqzmUwoyus2pmADMnTL/9TBb2a/Syeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sW8Ih70uAAZV+pSkfQVP7HxG3vscG4T0gKytsshJMphSv3g3kEz3YBDp11lf24ZgrcYp7sIXCU/KBE8mo8e6L+LlBULyXYL5Rso+N2eP08RfoBS9xldb4c0zXX/xwfZ1+a0SYrGuC+W4c7PbncZbnO56wUr/5jTlN5Mf9dag0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apN4dJsj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apN4dJsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752662406; x=1784198406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YPDK2c/m+bw5UqzmUwoyus2pmADMnTL/9TBb2a/Syeg=;
  b=apN4dJsjuxQXuaaDMgx/DqkjmJA32weDvo7QDizhXBbJ2jfbUFWnM4I2
   7wNkAcxNe6fiL19+sJhzxcfyUdHrAlwIKr8rNEu/N9kJ8ohja9E0P+xK+
   jzdPApl1L73slX2a+ygc1KJ16baPcOfseqSR/W6LAjOMJ3U/eVVOP7lfP
   WdokFoT5yFtlsQZGzGLmLQkGHcZ9gbOgjZjS3P09JNbcGCTd4aUVGOL9L
   2yhBE8GwcEvx2P7Krh0UHAhmKB7LmfRwo/uy9ZFv3jqnpMTBRKze+yb1/
   kRk8pnt7Nf8lPpBNmu8BOscwJPYeoMfUu9ipNMpeJBiysLFjSfFsx7ACd
   g==;
X-CSE-ConnectionGUID: wlirut63QNmel1sXwgjE5g==
X-CSE-MsgGUID: c4YqPKTtQCOo70ndWMHNGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72352931"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="72352931"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 03:40:06 -0700
X-CSE-ConnectionGUID: mYe15IlCSe2rvZ7w4tZMHQ==
X-CSE-MsgGUID: GywiLIEJQ2GBXpGPWsFgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; 
   d="scan'208";a="157563979"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jul 2025 03:40:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubzYP-000CFD-2z;
	Wed, 16 Jul 2025 10:40:01 +0000
Date: Wed, 16 Jul 2025 18:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8617/9935]
 arch/arm64/boot/dts/nvidia/tegra264.dtsi:3:10: fatal error:
 dt-bindings/clock/nvidia,tegra264.h: No such file or directory
Message-ID: <202507161859.qKPDbuJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2b1f6a9f382564b1d4cf16c45e73ccccb917f1f
commit: d01e4f1e7aa8833f549ac61a0bbcdc395533269b [8617/9935] arm64: tegra: Add p3971-0089+p3834-0008 support
config: arm64-randconfig-051-20250716 (https://download.01.org/0day-ci/archive/20250716/202507161859.qKPDbuJq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507161859.qKPDbuJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507161859.qKPDbuJq-lkp@intel.com/

Note: the linux-next/master HEAD f2b1f6a9f382564b1d4cf16c45e73ccccb917f1f builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi:3,
                    from arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi:3,
                    from arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts:5:
>> arch/arm64/boot/dts/nvidia/tegra264.dtsi:3:10: fatal error: dt-bindings/clock/nvidia,tegra264.h: No such file or directory
       3 | #include <dt-bindings/clock/nvidia,tegra264.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi:3,
>>                  from arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi:3,
>>                  from arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts:5:
   arch/arm64/boot/dts/nvidia/tegra264.dtsi:3:10: fatal error: dt-bindings/clock/nvidia,tegra264.h: No such file or directory
       3 | #include <dt-bindings/clock/nvidia,tegra264.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

vim +3 arch/arm64/boot/dts/nvidia/tegra264.dtsi

65ef237e4810f6 Thierry Reding 2025-07-10  2  
65ef237e4810f6 Thierry Reding 2025-07-10 @3  #include <dt-bindings/clock/nvidia,tegra264.h>
65ef237e4810f6 Thierry Reding 2025-07-10  4  #include <dt-bindings/interrupt-controller/arm-gic.h>
65ef237e4810f6 Thierry Reding 2025-07-10  5  #include <dt-bindings/mailbox/tegra186-hsp.h>
b7117911e13cf5 Thierry Reding 2025-07-10  6  #include <dt-bindings/memory/nvidia,tegra264.h>
65ef237e4810f6 Thierry Reding 2025-07-10  7  #include <dt-bindings/reset/nvidia,tegra264.h>
65ef237e4810f6 Thierry Reding 2025-07-10  8  

:::::: The code at line 3 was first introduced by commit
:::::: 65ef237e4810f6bb0f44b250d963b48790dec369 arm64: tegra: Add Tegra264 support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
