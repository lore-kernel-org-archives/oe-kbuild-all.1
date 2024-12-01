Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B9AD5A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 10:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733048038; cv=none; b=ZTUrASEjLlMM8b0v8Q+JE2C7MnI5wr+066zywRjPdXRoGzASUQzOR0Vcr1P78lkQqJbUqsUsEw/AlLomBpwe3xEFKjhZ8cdqylfi5CZMgtu70FYMUDFQseNv4kJc8k7WLpmksNAPiLjfvZbPiLApxWCpMEka0m11YVC0Vdy9zms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733048038; c=relaxed/simple;
	bh=xJc5+mKDxgIM4Bd+Ir1XeiRS7XrhH6J47zQvPG+J90U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQL07Z0gblfeOZ3mFxPQ9CBpDSj5bhaMzc6IriE99jNqctC37n8MHUGIPcyZCjaqo70Ke1AqG5Lq5uyUIe9V8jW7EjhQvjQacwgGSYbcLCHav091gAnbe4/WbITasztHEr40s+80Wwymzn36KAiyJHCdhP26HfMg4oPep+FMm4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpEZ1QcS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpEZ1QcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733048036; x=1764584036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJc5+mKDxgIM4Bd+Ir1XeiRS7XrhH6J47zQvPG+J90U=;
  b=OpEZ1QcSGLwGJIR+kLbSvc5i9WHSEYyYNrRhlGr1t3X3dy1tA7CtPGnR
   1aaVjUUB/Mgpp8P6pFo7WxiN0JjxrqnEsAcgwj+SMOF/omYCbOdt8NTu3
   s5zzgEJC2HE0Hew9bHoqUfpVBqxuBRxyhaa0x994JJTVAIDZQm1nl9YE/
   Fi/mFQnnpGKxT7i4x3CTXYVKoXAQ762FGufk/ihsug2sbhzEhjvw+zsqX
   PvsNmKHxr2uddb+AqKGN3rjp278LpksaZm2EJVAI3YWLGJBfODV8dVDrN
   Bv5aBNTGkviYH69xNZPzlkXt3K1l+Nxr+SVZ9hBzTGWw8P57hXEcTgKCW
   A==;
X-CSE-ConnectionGUID: WDFtMcNiSmK6eZa++gfL4w==
X-CSE-MsgGUID: h73KNYBySj62QEgGekzaIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33276753"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33276753"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 02:13:55 -0800
X-CSE-ConnectionGUID: h3KvFx3hTVOzIdQ2JPQlRg==
X-CSE-MsgGUID: uQ84V96zQye/NZnc5F3vVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="93307365"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2024 02:13:54 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHgxR-0001SJ-2F;
	Sun, 01 Dec 2024 10:13:47 +0000
Date: Sun, 1 Dec 2024 18:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1312/1312]
 drivers/scsi/huawei/hifc/.tmp_hifc_lld.o: warning: objtool: missing symbol
 for section .init.text
Message-ID: <202412011830.EPRXYtU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chenguangli,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [1312/1312] scsi/hifc: add hifc driver FC service module
config: x86_64-buildonly-randconfig-003-20241128 (https://download.01.org/0day-ci/archive/20241201/202412011830.EPRXYtU4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011830.EPRXYtU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011830.EPRXYtU4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/huawei/hifc/hifc_lld.c:333:7: warning: no previous prototype for 'hifc_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
     333 | void *hifc_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_lld.c:362:6: warning: no previous prototype for 'hifc_event_process' [-Wmissing-prototypes]
     362 | void hifc_event_process(void *adapter, struct hifc_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/scsi/huawei/hifc/.tmp_hifc_lld.o: warning: objtool: missing symbol for section .init.text

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_BACKLIGHT
   Depends on [n]: HAS_IOMEM [=y] && FB [=n]
   Selected by [m]:
   - DRM_NOUVEAU [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && DRM_NOUVEAU_BACKLIGHT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
