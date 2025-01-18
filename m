Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E65818B460
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737200827; cv=none; b=sWXfwqGiSRZ+4Bby5jpvnAvXOi+61tiaF+KSxLiTZCENPWm+veH6Q+Tgdoq0WxkJgblKfsk9LGDmERmpEOW+IB8v91PPo0p8qrUQlPExqAeXK1/G8QQccgv+XnlbiPuAMcZEKScfsWdV/dg+v8v0WX9at/npdWM7YSEcJrt2ptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737200827; c=relaxed/simple;
	bh=asTMKOdUViXdHz/dV2HpjrPBWeTGQ7fDZPewUmvujGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYazx5LO/h10Jcsuw8LAAgL6AawRvx5Ef/rFP1HvdWU9Ud+oOmpbg8SF35LMH4jEfSL+Pf0sF3FDrNjx850mpUUlD42VMbb5dDQiehi37aveKKRuR88TrmaqCyxKIl7J3D1FxTTFoctDnXdzOI0Js+Hgmyufy2x242drsWqtpQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0OEKJyo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0OEKJyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737200826; x=1768736826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=asTMKOdUViXdHz/dV2HpjrPBWeTGQ7fDZPewUmvujGQ=;
  b=H0OEKJyoMafOz3OZ7fVMjdjKGwVwJzX5gn/+8tasAQkf/wA/Gs00WTKU
   cFPJbqGwvWVzRTb361UtFwWY7D5hE7Bse1IFLC44TNbVwKqjFhbt783eO
   H1zSN+zcdEFJqH41VIhdOi8T/0aIWucEWTM0L0xYtgwwX/hJWuovG4Uv+
   K2Tj4+Tk1xso7Jpo4WnPNIqhmMCNsN1TZsf45CJ6OE45GELohzkM+cL4H
   jY+pycaHC1cK1B551ddmQr+pG2O02KuNzBy9vYpKGusEasKWuh6XeLXPr
   QUbz7h06ULXVs6JVtn0UaqDRqA2iZqoNrNCmureQ3YlqJ8GX7l2kUYMDH
   Q==;
X-CSE-ConnectionGUID: FZq/MKJ/TP+Cvqj1HY0MaA==
X-CSE-MsgGUID: QitQFKzxRwyXfTbUtkbhQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37788597"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="37788597"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 03:47:03 -0800
X-CSE-ConnectionGUID: b3sIQfZsTSSfYMqDu+yKjA==
X-CSE-MsgGUID: cmie8LA7QJKMz4IL0R687Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106940577"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jan 2025 03:47:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ7I3-000UMH-11;
	Sat, 18 Jan 2025 11:46:59 +0000
Date: Sat, 18 Jan 2025 19:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:461: warning: Excess function
 parameter 'data' description in 'mpi3mr_set_trigger_data_in_hdb'
Message-ID: <202501181924.hvKEeXDf-lkp@intel.com>
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
commit: fc4444941140c80088102b39eb130d2a7a048e58 scsi: mpi3mr: HDB allocation and posting for hardware and firmware buffers
date:   7 months ago
config: arc-randconfig-r004-20221209 (https://download.01.org/0day-ci/archive/20250118/202501181924.hvKEeXDf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181924.hvKEeXDf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181924.hvKEeXDf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpi3mr/mpi3mr_app.c:461: warning: Excess function parameter 'data' description in 'mpi3mr_set_trigger_data_in_hdb'


vim +461 drivers/scsi/mpi3mr/mpi3mr_app.c

   443	
   444	/**
   445	 * mpi3mr_set_trigger_data_in_hdb - Updates HDB trigger type and
   446	 * trigger data
   447	 *
   448	 * @hdb: HDB pointer
   449	 * @type: Trigger type
   450	 * @data: Trigger data
   451	 * @force: Trigger overwrite flag
   452	 * @trigger_data: pointer to trigger data information
   453	 *
   454	 * Updates trigger type and trigger data based on parameter
   455	 * passed to this function
   456	 *
   457	 * Return: Nothing
   458	 */
   459	void mpi3mr_set_trigger_data_in_hdb(struct diag_buffer_desc *hdb,
   460		u8 type, union mpi3mr_trigger_data *trigger_data, bool force)
 > 461	{
   462		if ((!force) && (hdb->trigger_type != MPI3MR_HDB_TRIGGER_TYPE_UNKNOWN))
   463			return;
   464		hdb->trigger_type = type;
   465		if (!trigger_data)
   466			memset(&hdb->trigger_data, 0, sizeof(*trigger_data));
   467		else
   468			memcpy(&hdb->trigger_data, trigger_data, sizeof(*trigger_data));
   469	}
   470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
