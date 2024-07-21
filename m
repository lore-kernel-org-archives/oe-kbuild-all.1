Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72AD10E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721520900; cv=none; b=MSG32I/T0cSMZC5RC/h2Jw+2ivYC/VIFMJTIN+oFpDNvfhb4t8NRdUlByi03cIdUZPmQVgf52G09C9xLBgANmBkdrgtHzS8N29tsGFuTJrRxLPMI9fsREEM7T5m+EFdGe8eYXLKRVd8JJgq8nPkDbW7SfJ0vQh2DX/YlTQtbXSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721520900; c=relaxed/simple;
	bh=2ajdl0b6vqCuRPehpYwbmGkuvf7nGY1IINb1hl7j5qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGvUzSzk8u/92pv7RV9TfZvHDWgd4J8KCR9xo+L1K7EGOXmU9HULTiLoFwTnW6vdXr2aZAj6iwzMJZYsHMp1/HfxtJZhDmugxzfnCLoaeJpIw0ZbvAYtbZmSRnDCP3DDxuy3D3Vyl5okSd7mWXkzFGEYzgAQdFso4A3TwP7XtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUkg7iAG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUkg7iAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721520898; x=1753056898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ajdl0b6vqCuRPehpYwbmGkuvf7nGY1IINb1hl7j5qw=;
  b=OUkg7iAGHMO/g3Zgsz7LsLRWvDKP+9Ac6Kp1gIXVfJlhm2KEfteTwSKN
   GwuPLFwamKVxvVfR156Y38WFBite0DCenkhVNbXulUH9G2JP8A4uU1LJ1
   gz2qTYXZRH3ATvwj87Vfpult+bCABbgKQ+fttrtuSx/Gey/F78+ohA+Bv
   zRTHYuBD9C06S4Y/3HQOtz6rdW0Gn4YjSbm5aqMbA2dy11qBDq75Kn2Q7
   RQTFz9GCb8w+bgder88pyIkU4xyJDjROa1/G+rJo4NFAC/SF1BgBeoA6O
   6DKkWQgo4eGbkW6zE0tkSrtZtni/pW2KsT7fZUPwHF/vtlrJUqQUkOnYh
   g==;
X-CSE-ConnectionGUID: 18msl4K9QsiIMufJ3XEPig==
X-CSE-MsgGUID: Dv166ynDRj6bfxajc8Za4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="30503604"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="30503604"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 17:14:57 -0700
X-CSE-ConnectionGUID: jpK5CwxnSn6LjfSHuRVxVA==
X-CSE-MsgGUID: vIacSqwkTiam4E+hMRx0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="52104563"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jul 2024 17:14:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVKE2-000jjW-0B;
	Sun, 21 Jul 2024 00:14:54 +0000
Date: Sun, 21 Jul 2024 08:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 22326/22327]
 drivers/ufs/host/ufs-qcom.c:1382:25: error: 'struct ufs_clk_scaling' has no
 member named 'suspend_on_no_request'
Message-ID: <202407210850.UHcuvt5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6d6afa9d3f8fada34bfa4725d5b3079bccf4cf0b
commit: f858f0ff4e470be1c9ae06900f7d23f155f0ce4a [22326/22327] FROMGIT: scsi: ufs: qcom: Enable suspending clk scaling on no request
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240721/202407210850.UHcuvt5r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407210850.UHcuvt5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407210850.UHcuvt5r-lkp@intel.com/

Note: the android-common/android14-6.1 HEAD 6d6afa9d3f8fada34bfa4725d5b3079bccf4cf0b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-qcom.c: In function 'ufs_qcom_config_scaling_param':
>> drivers/ufs/host/ufs-qcom.c:1382:25: error: 'struct ufs_clk_scaling' has no member named 'suspend_on_no_request'
    1382 |         hba->clk_scaling.suspend_on_no_request = true;
         |                         ^


vim +1382 drivers/ufs/host/ufs-qcom.c

  1372	
  1373	#if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
  1374	static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
  1375						struct devfreq_dev_profile *p,
  1376						struct devfreq_simple_ondemand_data *d)
  1377	{
  1378		p->polling_ms = 60;
  1379		d->upthreshold = 70;
  1380		d->downdifferential = 5;
  1381	
> 1382		hba->clk_scaling.suspend_on_no_request = true;
  1383	}
  1384	#else
  1385	static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
  1386			struct devfreq_dev_profile *p,
  1387			struct devfreq_simple_ondemand_data *data)
  1388	{
  1389	}
  1390	#endif
  1391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
