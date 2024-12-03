Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11492198A0E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215395; cv=none; b=CP0zxpr+Bs6b9NHVI37DhygsQx/TADgKlheDAN1JftjwZHVxLJ3zQsEYpLygUBDHvmz/j5yB2swx1jYGYAIJ3jtFbzJB3Sgb1cqJfr+ON577SgMYX+aU4khf1dkBsKUBvMP1YdfkzxSEjAAMhOaarPhPabkNGbtHm3zJtY6gyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215395; c=relaxed/simple;
	bh=hfLK2/DcSxYLCyqBn0xx2TTUK0YW1Z0m192Fs400nmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kgJr//z95PIZ7ygznP0wNsRhmZmM00bWLU0BQoX2LwSjYg7jUePl9oNoRdkgNI2wVggPl7m93Wnrh+SCqjKxz8O3aqGDO6/+WA3yjAvm5QUY2xk9TNc2p0XDIinkVn6ZYVlgRZscghRnwxfSRUYuOFS97w1iuIdcNdOjqJkPsuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jtud4UVm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jtud4UVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733215392; x=1764751392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hfLK2/DcSxYLCyqBn0xx2TTUK0YW1Z0m192Fs400nmI=;
  b=Jtud4UVm4KgPGHNF8xdaNTP4RF+jlGL6WUzN4ds/XsYin/s7WBZFkaKN
   uBYZeA3T+pWmZJyQD+WoZa1uLt9tRGasnHQjyKO3L6hk1IUTPqLVomZkm
   vWDxUT++Mjak6w5hmh+o6XFFkseoNcfcmV0HkLYsE3SeLaip/PTbMmrzB
   zw512At4ssPGwmr9RiXUryPfSGHDFQaafjuCPyEq4gaW1jHS134Ez+tjh
   64i3skcPJWTxw3WoFqYPkcA6jtVfBtBOIQHa7uuUBOnGHI7K7OKaSrjkr
   Yl2Q5b/sHAHo6Mf0ubDrss8pkEKbPr7Cr8O7q2RrNjCegOL8BMJ3gAyzI
   A==;
X-CSE-ConnectionGUID: byz6gzLhQp+MGLqncOGA0Q==
X-CSE-MsgGUID: uBLHoUdyRiaPqbn1QmE7Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33291642"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33291642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:43:11 -0800
X-CSE-ConnectionGUID: Dx2OZUwtSFm4dnrd40EDZg==
X-CSE-MsgGUID: +pKKCQLAT3K4+Us78VhBkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93188455"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Dec 2024 00:43:10 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIOUu-0000Pf-0R;
	Tue, 03 Dec 2024 08:43:08 +0000
Date: Tue, 3 Dec 2024 16:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Ma <peng.ma@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: drivers/rtc/rtc-fsl-ftm-alarm.c:310:36: warning: 'ftm_imx_acpi_ids'
 defined but not used
Message-ID: <202412031620.1tzCLuCU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 929a3270488956316214d70cd4e2ba3fa56ffe31 rtc: fsl-ftm-alarm: enable acpi support
date:   4 years, 8 months ago
config: arm-randconfig-004-20240106 (https://download.01.org/0day-ci/archive/20241203/202412031620.1tzCLuCU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031620.1tzCLuCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031620.1tzCLuCU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-fsl-ftm-alarm.c:310:36: warning: 'ftm_imx_acpi_ids' defined but not used [-Wunused-const-variable=]
     310 | static const struct acpi_device_id ftm_imx_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~


vim +/ftm_imx_acpi_ids +310 drivers/rtc/rtc-fsl-ftm-alarm.c

   309	
 > 310	static const struct acpi_device_id ftm_imx_acpi_ids[] = {
   311		{"NXP0011",},
   312		{ }
   313	};
   314	MODULE_DEVICE_TABLE(acpi, ftm_imx_acpi_ids);
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
