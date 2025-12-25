Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294626CE23
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766681887; cv=none; b=TUm9IzHVA7BFACErHQk3lBxAG3MZAXaVPm1hHOqErGkILiOpDrxiEH3VfwXrshnH90r32duI4Hiyv2ZWYHI4AXXbaP9OxazgZtP0gMM2nljexh7nhhP7D5T7RP5t0ejix34H2il1GWhzMtqZvhpvvwpY8+At2YU6VCpiJSBaifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766681887; c=relaxed/simple;
	bh=pWVc2O/+i/XjtzrwI03vet/6fFMcHXljTYatWHrImr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hH8JG9ITxiINSVOKsSiyv6FjmAAfy83RST0EQgqHTe9fmhbgNO1wJ9ldMKwVxvKhkmPHVOqyoVx/7wd67wi/H44OrpXlxaF6Gg2EUf2EFt4i6fLDTZG4jO5A3986LbRoIyLbKOnagLWwjWjUO5PHfiqc9c0KDIG6k9I80asDkAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qlhcjp0q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qlhcjp0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766681885; x=1798217885;
  h=date:from:to:cc:subject:message-id;
  bh=pWVc2O/+i/XjtzrwI03vet/6fFMcHXljTYatWHrImr8=;
  b=Qlhcjp0qaRmQHDCV3wtJbF5lQmqaxeRPHtqWny/GejhhLP/ePu2SnJk2
   kvaoLZ+tr0P95uRe9zrh66Lkwxki7xCVgCqheBXoZYrA8B852RJrnCV/t
   BBeR073AcW9juAtUJE4cM5v8f4PQl+HEjQR+3gHCmProI9IUMaEmDDac5
   POQwPVEKz3xskoJ/KzHIabHH7vRpOlBlSfc4b/wuNyd1aP4muZjg+oTrr
   Eb6P699110TwV7F+fEHo+BTTcRQ2vJJCQRrbLIzkl5Fv/NebcEhldaHgE
   YVPjg9hp8kt6yy04k2AAsQy9sQKAORiwjZJycId62sAi0jytG+jvvYchZ
   A==;
X-CSE-ConnectionGUID: IuLv6QPeTpScpzCw1lfrkw==
X-CSE-MsgGUID: VV5vbmpTQbqfX3rc3YCEqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68361434"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68361434"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 08:58:04 -0800
X-CSE-ConnectionGUID: vlx5+qRkSnmNw8ACivvESA==
X-CSE-MsgGUID: ZQSpIwAORlCuVcopPm3KqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="205291155"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Dec 2025 08:58:03 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYof3-000000004IX-0eXh;
	Thu, 25 Dec 2025 16:58:01 +0000
Date: Fri, 26 Dec 2025 00:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13] drivers/ptp/ptp_hisi.c:731:36:
 warning: 'hisi_ptp_acpi_match' defined but not used
Message-ID: <202512260055.uMNjurGb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Yonglong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: e6aa0ecf50a8a0da6b742aacd9cbd47463275a30 [13/13] net: hns3: add support for Hisilicon ptp sync device
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260055.uMNjurGb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260055.uMNjurGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260055.uMNjurGb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_hisi.c:731:36: warning: 'hisi_ptp_acpi_match' defined but not used [-Wunused-const-variable=]
     731 | static const struct acpi_device_id hisi_ptp_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/hisi_ptp_acpi_match +731 drivers/ptp/ptp_hisi.c

   730	
 > 731	static const struct acpi_device_id hisi_ptp_acpi_match[] = {
   732		{ "HISI0411", 0 },
   733		{ }
   734	};
   735	MODULE_DEVICE_TABLE(acpi, hisi_ptp_acpi_match);
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
