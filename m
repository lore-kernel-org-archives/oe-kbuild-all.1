Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126FB1EB2F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727540185; cv=none; b=GrA7zzYA5xNXh2jxDtHdL+vFZs4qvB86CdsD7yPNogYRyUwMLKiEKezqlxU6PDtaankFR611LloCvHU6tHFO381qEUyWFVxUa/rV7v1CChAwBwe4rP4zuUr5jjbXgshaLuadx+8MXKCnr/1DdhJoyCKkoSg/YROLLWLv4f7sPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727540185; c=relaxed/simple;
	bh=P0VS4n3CNAatnu2VmizwZbJ2zh4e+/pjpKJxB1gSixs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLNCJz9AhJcY3nFqy4bhfyohgh85bZrsMyJwLMzrH2+ot3aHWvBRAB/8c3nqNSPRqwkA/KFnZ2utuhPIP9D3jUyoKkk0gJzFoMF3KE4kyYVWw0EGCdjeVW/FG9k8b8yZXVjdU6QqC2YBLcFEGzoOuvg8TTpbclCNqbgELFIqGUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePZ8Jh41; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePZ8Jh41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727540184; x=1759076184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P0VS4n3CNAatnu2VmizwZbJ2zh4e+/pjpKJxB1gSixs=;
  b=ePZ8Jh41t92BFdQmVSuCvzAOwUEw7ujpmSpzqrICzRgxNAWYcVxDE9us
   4wgeTkda8z35K6GeaJxoV535mlqmjZlsGteOyK5+Aa/iMBAPmig/e+GlG
   jfIwLTHGpwlfivh31L5rabhQX4Efu6FFfNYyQBDRN2P6sbw2vt0SMQToz
   wyn38hv9BqdcsA5SY10j7dbDQt1bG1Vbx67N8K8ecis2giCr5B3aavZSL
   p3YB38VQd71moVxP/lpf1hxWRhG4Tp9XCs/AlRGbgEt2bTtMvWRnNgvps
   Th6HSMA7uqsboatDAsNXZBXr7v/ugGQb+wLI/ofCKRISAMiHY3qcMOcBL
   w==;
X-CSE-ConnectionGUID: 6DL6mfVhRbe3vWnclBvSdA==
X-CSE-MsgGUID: VJ5ETd0XQUuDQoYLTrYirQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26544201"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26544201"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:16:24 -0700
X-CSE-ConnectionGUID: HMn3u7JBSrO9CBv0b2NCfQ==
X-CSE-MsgGUID: 4iJBEtVZS+OynAJTk7Gg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73158226"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 09:16:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sua7I-000NQB-0z;
	Sat, 28 Sep 2024 16:16:20 +0000
Date: Sun, 29 Sep 2024 00:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Malloy Liu <liuqi1610@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/23799]
 drivers/spi/spi-phytium-plat.c:192:36: warning: 'phytium_spi_acpi_match'
 defined but not used
Message-ID: <202409290023.FihgEvFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Malloy,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/23799] spi: add phytium spi support
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290023.FihgEvFc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290023.FihgEvFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290023.FihgEvFc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:192:36: warning: 'phytium_spi_acpi_match' defined but not used [-Wunused-const-variable=]
     192 | static const struct acpi_device_id phytium_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_spi_acpi_match +192 drivers/spi/spi-phytium-plat.c

   191	
 > 192	static const struct acpi_device_id phytium_spi_acpi_match[] = {
   193		{"PHYT000E", 0},
   194		{}
   195	};
   196	MODULE_DEVICE_TABLE(acpi, phytium_spi_acpi_match);
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
