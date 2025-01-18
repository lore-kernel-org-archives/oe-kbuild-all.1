Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F18191F60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737217238; cv=none; b=WG/fFcS/2Bep/R4knMmfkhLccBEsAYKUkDV307LxwqFitc3LCoQJy5QvUUf6HLkLNfFbMq7lyO2k7clljz/BhrFq98fsbawU14R4kjkzU9gTPYM1YBq/On4yHjE8re9QEpqx9l/FkKT9Cjz2VSvcsZeDD4mmn8IEIgS3IkbZ5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737217238; c=relaxed/simple;
	bh=rJbXtaLSMfJ0V8q+jehToPRKJlcRdCDkbZJHleKx1Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rrtzr7IzJ8VS4c4K/Jj9LB9Jjitfv0jpeLyD0dXiviHnhQQzo62uuAkNnxOwN+m16XdURgDQCz+z1JTMHUCRCMfosdFdKhKdkYMI52xK2jue7gS4NWtWbQPW5fKttQei4IOau7t71KONrsvY5cQwgCDJy4eE+nvxMlW7vsOW1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccc4+t5h; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccc4+t5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737217236; x=1768753236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rJbXtaLSMfJ0V8q+jehToPRKJlcRdCDkbZJHleKx1Yo=;
  b=ccc4+t5h4oA5g8sxFta1aEwbzr1FLuPG0wvszE+Z66QLktkioP+4iwa+
   VI2989h+6WxmjZ2HnWkyzvK4sZGiYES6uA2n3YRxu+mcap+LhWNTWIKm6
   qm7zLZwj1pPtwlLYzNd6oVtXqFKy0UYvSHQJU4Gcs6hPD+xFQ82CxN94w
   rZIQCu7F88pkdXW8iNP+6HCPhLFUvAaOl6HctgrcD5gufpvv7QDuuN8oE
   CLceG/127MY/PiO9rYckh1NRsSxjTMWSixOR8T8ofBl9XcfMA4WnQo9IV
   geBOs3UyBO749XO3qt7KosAkVSxNPuaWrodggawBRFvkVfOr8JXyTtfpw
   A==;
X-CSE-ConnectionGUID: 7YpHGXsyToK8qQ/IBkSufw==
X-CSE-MsgGUID: s794zzhkThqP84pnGiYXyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="55190267"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="55190267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 08:20:35 -0800
X-CSE-ConnectionGUID: 8EPQpFBRStOgzMiEMNFdpw==
X-CSE-MsgGUID: pNP5jyUERxm7bsY5Jrbacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136985742"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2025 08:20:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZBYl-000Ubo-2a;
	Sat, 18 Jan 2025 16:20:31 +0000
Date: Sun, 19 Jan 2025 00:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:745: warning: Excess function
 parameter 'data' description in 'mpi3mr_set_trigger_data_in_all_hdb'
Message-ID: <202501190051.Q3spiTYh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: d8d08d1638ce1c237ce9c3f14649a3a4cf1b1749 scsi: mpi3mr: Trigger support
date:   7 months ago
config: arc-randconfig-r004-20221209 (https://download.01.org/0day-ci/archive/20250119/202501190051.Q3spiTYh-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190051.Q3spiTYh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190051.Q3spiTYh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_app.c:718: warning: Excess function parameter 'data' description in 'mpi3mr_set_trigger_data_in_hdb'
>> drivers/scsi/mpi3mr/mpi3mr_app.c:745: warning: Excess function parameter 'data' description in 'mpi3mr_set_trigger_data_in_all_hdb'


vim +745 drivers/scsi/mpi3mr/mpi3mr_app.c

   727	
   728	/**
   729	 * mpi3mr_set_trigger_data_in_all_hdb - Updates HDB trigger type
   730	 * and trigger data for all HDB
   731	 *
   732	 * @mrioc: Adapter instance reference
   733	 * @type: Trigger type
   734	 * @data: Trigger data
   735	 * @force: Trigger overwrite flag
   736	 * @trigger_data: Pointer to trigger data information
   737	 *
   738	 * Updates trigger type and trigger data based on parameter
   739	 * passed to this function
   740	 *
   741	 * Return: Nothing
   742	 */
   743	void mpi3mr_set_trigger_data_in_all_hdb(struct mpi3mr_ioc *mrioc,
   744		u8 type, union mpi3mr_trigger_data *trigger_data, bool force)
 > 745	{
   746		struct diag_buffer_desc *hdb = NULL;
   747	
   748		hdb = mpi3mr_diag_buffer_for_type(mrioc, MPI3_DIAG_BUFFER_TYPE_TRACE);
   749		if (hdb)
   750			mpi3mr_set_trigger_data_in_hdb(hdb, type, trigger_data, force);
   751		hdb = mpi3mr_diag_buffer_for_type(mrioc, MPI3_DIAG_BUFFER_TYPE_FW);
   752		if (hdb)
   753			mpi3mr_set_trigger_data_in_hdb(hdb, type, trigger_data, force);
   754	}
   755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
