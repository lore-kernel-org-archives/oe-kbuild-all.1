Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495002309AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731540174; cv=none; b=GmcpltcloSF3wtjIM7xWpqhh39V56Ok3Z+QrHhRTSEDMpAXq68v/dXVr1QNNMB7XOsAH8rh5fQDtYj/CxCaUrbj+sDw222NZj5qaZnotbGt37NRbsT6zpZsSvNOV5q1rooHkAfNX2Ya/wY6VPjw34YjFc6RdvdQjVUXMAueST9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731540174; c=relaxed/simple;
	bh=TC+7akd6VoaFR4hbr7H+1SOfxpfo6wIlzws8Ql9tf7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YxjfSjxP8ObmgSIo78aUcPi/ZYOx92NeAIOqncp1QJD8sYsYyONCf8dhhvcPcw2V22xA9/+s3dGZ2jm2dNxbQ0fa0aNVBvvmSWmIzlZg62XC+SPDYuJzEi4jDMIGtLQBcFcGmep8W+H2e593Bic6iVZM5GDumIZ7gms0YZOyJiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jo5VTsM8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jo5VTsM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731540173; x=1763076173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TC+7akd6VoaFR4hbr7H+1SOfxpfo6wIlzws8Ql9tf7E=;
  b=jo5VTsM8qsFY6Nbvlg4y9Dh8mFecI9jk4NUUXybh61t0+zst7OSIYrP9
   CUtgDMH+21FIzQp4hJISY21/EtExVeNxiNbkDfCBloAF2RAUcn11lko9p
   Xhi3Sy849bVIlQ2XwpZCGzLigaerqt5gw7ls6DglgxHrKXo6spnZWIFic
   /7jqxi/R8IpWKU61BWTBLBbnMsZ4Q6plrUNj+fawAcnma9JvF6h/c3WzF
   A6560SWbrGWqc1sZcCcpPo/3P2MGXWuGwIlaYYsnjrMvDBIIFHfuU4Ckn
   iHu7Hk2Q2QUmVqVINBrjredbeOuiTd6muCabooiwPVi7ELznqgYqv1t2q
   Q==;
X-CSE-ConnectionGUID: s5MHOB0lRQCroJ06ueM32w==
X-CSE-MsgGUID: u5IXtnIRSK+sOgb6vAT3PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31614523"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31614523"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 15:22:50 -0800
X-CSE-ConnectionGUID: S2vcAo1rTs6tEgygNTEpQw==
X-CSE-MsgGUID: aKVTZSLlRoCjssU6qrhC6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="118955823"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2024 15:22:48 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBMhC-0000qX-0e;
	Wed, 13 Nov 2024 23:22:46 +0000
Date: Thu, 14 Nov 2024 07:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466] binfmt_elf32.c:undefined reference to
 `arch_elf_adjust_prot'
Message-ID: <202411140707.rcVJtgbT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   19640fb08a2ccfb131121859517dfdbc6a04ccb6
commit: 7de3ab4c3dd938fae3626a6344830b018eb7ba4f [1466/1466] arm64: introduce binfmt_elf32.c
config: arm64-randconfig-004-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140707.rcVJtgbT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140707.rcVJtgbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140707.rcVJtgbT-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_interp':
>> binfmt_elf32.c:(.text+0xb58): undefined reference to `arch_elf_adjust_prot'
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_binary':
   binfmt_elf32.c:(.text+0x2044): undefined reference to `arch_elf_adjust_prot'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
