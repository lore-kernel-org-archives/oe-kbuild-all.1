Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF71AAE0B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 17:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739034036; cv=none; b=hcnsejM4mwR8lGYypAGDPyS7EsHNYk70QpIB10NwhIwb059CumMOJttQM1gj/aYI3c3E/VvAHjPHkzMPtTVyRGsBVGhQKRDv+EM0vVvDbl42yY9siAB1tsOSxOgqqsaMhk5JXcht+X5GTyvp+CkcBY42aJ/8HpOhJw8dv67X8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739034036; c=relaxed/simple;
	bh=Cb9PZphzSH/B22TwxVM6SVWfYuX9/z0ybOSfNxlV2ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAMCQ73dKhcplWBTNJhbgCmEJmma/u096XdZZi2QuJhV0eyazFLb8zLvn9+ntndusrGfwpfaUXELWKCHQk/fuqQd2lEqhNa7kQREAT0fPJP0O//mJjPomI2husctst0VLWBwA+Uv/5bsuH6MA8yZM1vM1mBrDy7CxS4m08H4I9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biMbmmjZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biMbmmjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739034035; x=1770570035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cb9PZphzSH/B22TwxVM6SVWfYuX9/z0ybOSfNxlV2ZI=;
  b=biMbmmjZUFI2DsG96pF5bjUPX+FluITFE5liuxia+26WB3+lbWU50wnY
   L31VM3L0xTGH8/VuEtN6V6Xh5z7fMhr/RBjE90F1TzlziyeO5hsTYuAUx
   vcOi6fC86K85B8jvAslFp0/+5IAYEVqB0cENWjmcUd/WWYfQ2FKG1sC43
   RzoVoehPIwJ5/c47rL1uq4CX6L7VdGtWOMGRDnEEVv2D+5xp6j6+mLG24
   VXWRNy0lntMsScuV4KFHwBVg2mPsCiom/NgFNwQDWrVFAc6tmt7Y4DCe2
   FXOKNuh/unSqyZYulGOZEVKybZkQWdH+wuMMXifAB6VCpZsdpvTzSvbNm
   w==;
X-CSE-ConnectionGUID: t/BdSukORY+wQjiOliI/zA==
X-CSE-MsgGUID: gRmVIoKMT6OaynZDXCB1rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39775623"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39775623"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 09:00:32 -0800
X-CSE-ConnectionGUID: hsVxPZkxRkmlyj9xhmlF7Q==
X-CSE-MsgGUID: qq8rbslQSM2YnHrwxWaa1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116403743"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 09:00:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgoBv-0010OH-2p;
	Sat, 08 Feb 2025 17:00:27 +0000
Date: Sun, 9 Feb 2025 00:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:745: warning: Excess function
 parameter 'data' description in 'mpi3mr_set_trigger_data_in_all_hdb'
Message-ID: <202502090051.wC6ZLMrq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ranjan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6629c004b193d23612641c3607e785819e97ab
commit: d8d08d1638ce1c237ce9c3f14649a3a4cf1b1749 scsi: mpi3mr: Trigger support
date:   8 months ago
config: x86_64-randconfig-a013-20211029 (https://download.01.org/0day-ci/archive/20250209/202502090051.wC6ZLMrq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090051.wC6ZLMrq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090051.wC6ZLMrq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpi3mr/mpi3mr_app.c:718: warning: Excess function parameter 'data' description in 'mpi3mr_set_trigger_data_in_hdb'
>> drivers/scsi/mpi3mr/mpi3mr_app.c:745: warning: Excess function parameter 'data' description in 'mpi3mr_set_trigger_data_in_all_hdb'


vim +745 drivers/scsi/mpi3mr/mpi3mr_app.c

   700	
   701	/**
   702	 * mpi3mr_set_trigger_data_in_hdb - Updates HDB trigger type and
   703	 * trigger data
   704	 *
   705	 * @hdb: HDB pointer
   706	 * @type: Trigger type
   707	 * @data: Trigger data
   708	 * @force: Trigger overwrite flag
   709	 * @trigger_data: Pointer to trigger data information
   710	 *
   711	 * Updates trigger type and trigger data based on parameter
   712	 * passed to this function
   713	 *
   714	 * Return: Nothing
   715	 */
   716	void mpi3mr_set_trigger_data_in_hdb(struct diag_buffer_desc *hdb,
   717		u8 type, union mpi3mr_trigger_data *trigger_data, bool force)
 > 718	{
   719		if ((!force) && (hdb->trigger_type != MPI3MR_HDB_TRIGGER_TYPE_UNKNOWN))
   720			return;
   721		hdb->trigger_type = type;
   722		if (!trigger_data)
   723			memset(&hdb->trigger_data, 0, sizeof(*trigger_data));
   724		else
   725			memcpy(&hdb->trigger_data, trigger_data, sizeof(*trigger_data));
   726	}
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
