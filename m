Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5A152166
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727166983; cv=none; b=FvEJKDLnEzpfHldKHWaBfWyzpwadTrXUfrlr6KoU3gcmmuaaumphGig6xtTWKPpHPXXgY/bZPvoVc8+bBOBxQfYD7WgYZZlQzFFgGtOxgRDxY3XTr+XAbKPk5IAH5r+R0Vl8xk8O49LMtsbh+ZIKIUNdHWXdYZhVWicASomVqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727166983; c=relaxed/simple;
	bh=9+3hVNbGZalHcbg5gTpEsC1XZSoBq4ID9845NoW4T90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VaPh8SGRGNjU235BnQVoRdADZUpFqxuu7Kisj0kdv21LfoG9t4zhJokz6tH8+sT4WRGyUz9K/Z1RmwboZS6pclMqTz/1u0TyFEmEVZSa2RESx1ED86xUP/csMyUCPv8FUYBYYauLaZQZWgr+AF53bDj3odlKwtm7acOlEde2pZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJjwW8rW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJjwW8rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727166982; x=1758702982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9+3hVNbGZalHcbg5gTpEsC1XZSoBq4ID9845NoW4T90=;
  b=oJjwW8rWZdS7YSWV2jPFkdZbtKlofnNY0xMO3+8g/dl8S4B7nq37mimK
   QsZ9Swda4rxlWSaW0jeCFJXn4p//1Loe6YE0YKkAn+lE1qnjsi15jZ1gB
   0mVgS/eq8iwbB31gYanPMwjlL/y+EhfzzC1OGsltYmi0OXwh6k/ZuVMUK
   0Olg6Zu0webfs5vQZgWAj57nyyCo1AtKxU+myKLergCHOBKrbCeceuM4a
   41Ha/SIhzOKHthixRLIUmFdavmoSxGMp15sneSR7sTD1PNOzEnrbX53ms
   nb3/w0EB2mflJJ69UnZ1j6eYemjOIMw6ofD0TGuikFkZEwU6e4XY1zRaK
   w==;
X-CSE-ConnectionGUID: tH1UeyC/TH27/2EjJ/cflA==
X-CSE-MsgGUID: g7FO93rcSaeFvFjWSHNXoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26265849"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26265849"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 01:36:12 -0700
X-CSE-ConnectionGUID: Lo8ovE9jQuygUEJgj9ubyg==
X-CSE-MsgGUID: Mbb3H2vNQKasZoZEljZ3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="76114020"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2024 01:36:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st11i-000I7R-1k;
	Tue, 24 Sep 2024 08:36:06 +0000
Date: Tue, 24 Sep 2024 16:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Hai <wanghai38@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29872/30000] ld.lld: error: duplicate symbol:
 lld_dev_hold
Message-ID: <202409241604.35w0b2j4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   686352476cd29ec854b93e09a49d57c25a18a32f
commit: 33116132568edcf6565cfd65cfa433f440d90494 [29872/30000] drm/qxl: Add check for drm_cvt_mode
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240924/202409241604.35w0b2j4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241604.35w0b2j4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241604.35w0b2j4-lkp@intel.com/

Note: the openeuler/OLK-5.10 HEAD 686352476cd29ec854b93e09a49d57c25a18a32f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: lld_dev_hold
   >>> defined at hifc_lld.c
   >>>            scsi/huawei/hifc/hifc_lld.o:(lld_dev_hold) in archive drivers/built-in.a
   >>> defined at sss_adapter_mgmt.c
   >>>            net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.o:(.text+0x20) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: lld_dev_put
   >>> defined at hifc_lld.c
   >>>            scsi/huawei/hifc/hifc_lld.o:(lld_dev_put) in archive drivers/built-in.a
   >>> defined at sss_adapter_mgmt.c
   >>>            net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.o:(.text+0x80) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: g_uld_mutex
   >>> defined at sss_pci_global.c
   >>>            net/ethernet/3snic/sssnic/hw/sss_pci_global.o:(g_uld_mutex) in archive drivers/built-in.a
   >>> defined at hinic3_lld.c
   >>>            net/ethernet/huawei/hinic3/hw/hinic3_lld.o:(.bss+0x340) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: lld_dev_hold
   >>> defined at hifc_lld.c
   >>>            scsi/huawei/hifc/hifc_lld.o:(lld_dev_hold) in archive drivers/built-in.a
   >>> defined at hinic3_dev_mgmt.c
   >>>            net/ethernet/huawei/hinic3/hw/hinic3_dev_mgmt.o:(.text+0x120) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: lld_dev_put
   >>> defined at hifc_lld.c
   >>>            scsi/huawei/hifc/hifc_lld.o:(lld_dev_put) in archive drivers/built-in.a
   >>> defined at hinic3_dev_mgmt.c
   >>>            net/ethernet/huawei/hinic3/hw/hinic3_dev_mgmt.o:(.text+0x180) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: nic_ioctl
   >>> defined at hinic_nictool.c
   >>>            net/ethernet/huawei/hinic/hinic_nictool.o:(nic_ioctl) in archive drivers/built-in.a
   >>> defined at hinic3_dbg.c
   >>>            net/ethernet/huawei/hinic3/hinic3_dbg.o:(.text+0x0) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: set_slave_host_enable
   >>> defined at hinic_multi_host_mgmt.c
   >>>            net/ethernet/huawei/hinic/hinic_multi_host_mgmt.o:(set_slave_host_enable) in archive drivers/built-in.a
   >>> defined at hinic3_hwdev.c
   >>>            net/ethernet/huawei/hinic3/hw/hinic3_hwdev.o:(.text+0x0) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: set_func_host_mode
   >>> defined at hinic_multi_host_mgmt.c
   >>>            net/ethernet/huawei/hinic/hinic_multi_host_mgmt.o:(set_func_host_mode) in archive drivers/built-in.a
   >>> defined at hinic3_hwdev.c
   >>>            net/ethernet/huawei/hinic3/hw/hinic3_hwdev.o:(.text+0x2C0) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
