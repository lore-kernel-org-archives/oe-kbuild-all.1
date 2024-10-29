Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D5E187FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730196236; cv=none; b=bwu0MJ8g0C4QrJrgntLP4S5jz1jTrmv70BhtvsYZdZUjHEh8YX3rCgeM+ILGNCjq1WcjzonPNQb1re+jhcNC0rmHlhWoCchWPW13WhqL2KF43JBRM62eMQM8N6dE+kcAHsn2OBw1+PCOfLkwhoAKYVy5W7RoTY1sNfXaaeb32Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730196236; c=relaxed/simple;
	bh=VSs/gQdGrsXayoXHEvStMHk21IRYrIHOXl/ALZ1+Vzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQPHM+DflprZ2nzqHTzxniOWsoT++Wx+rm768hhaQthF1vjEBcqg0srMXLVDM9l/4ujdQV678vwwwQEDaexjmNadnoRSb6hHS1JE26FRS7hNCXK851MfTA/7Ju169CKFl7RagFIe70IrHlJP6NobAcylgipHlGr2rIEyTkFqFA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgrkzFyo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgrkzFyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730196234; x=1761732234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSs/gQdGrsXayoXHEvStMHk21IRYrIHOXl/ALZ1+Vzw=;
  b=QgrkzFyoinYh9tDC8Msygwk1lyFbNhUyHZPs0Z/f0DNOVuqgojNOT7Xz
   t2nPHs6pPHzRsMXtqRrpfm9YiG91aj4a6q1kYwbEwnBoTvGqxTEPRhaTz
   57ftaz8JQXJ3yOdz5d+a9Qm7YZQjMKf7WSwFsGvPMAlmTRLtvW7139cSz
   DotsyycXLMscUMbwBMSt4VwmFCBzkUdrOF0Uck9HXgGRYdLkbASmCsBtg
   K2tXo0nHzCRdR3VrjnByNeK85HY8b+l/fE3kNMo+z6WGFx6Oyc8uTOrHl
   knlCGYbba03NzbB/PMKq0j8A9xLGsFQ+/9IBkJZCAmBz5P83ETZZNM4QZ
   Q==;
X-CSE-ConnectionGUID: iNYMo/BOQ62sl+PeFMABOg==
X-CSE-MsgGUID: 1ilzoz29RsWPjtkEsKc4/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33622356"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33622356"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 03:03:53 -0700
X-CSE-ConnectionGUID: pgsidvivTuKMPk3MLbRl9Q==
X-CSE-MsgGUID: IQLe4JXaSiaIFVUUceaY/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81838590"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2024 03:03:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5j4o-000dVe-1E;
	Tue, 29 Oct 2024 10:03:50 +0000
Date: Tue, 29 Oct 2024 18:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2978/30000]
 drivers/scsi/ufs/ufs-qcom.c:252: warning: Function parameter or member 'hba'
 not described in 'ufs_qcom_host_reset'
Message-ID: <202410291748.bakzPuFS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Can,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   ca48ea8b94307a011f58fdc6efa124ff7f5508f8
commit: 5b3f757aa44c55e4a4551cb41f38b0bb28ee738f [2978/30000] UPSTREAM: scsi: ufs-qcom: Add reset control support for host controller
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241029/202410291748.bakzPuFS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291748.bakzPuFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291748.bakzPuFS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufs-qcom.c:252: warning: Function parameter or member 'hba' not described in 'ufs_qcom_host_reset'
   drivers/scsi/ufs/ufs-qcom.c:382: warning: Function parameter or member 'hba' not described in 'ufs_qcom_cfg_timers'
   drivers/scsi/ufs/ufs-qcom.c:382: warning: Function parameter or member 'gear' not described in 'ufs_qcom_cfg_timers'
   drivers/scsi/ufs/ufs-qcom.c:382: warning: Function parameter or member 'hs' not described in 'ufs_qcom_cfg_timers'
   drivers/scsi/ufs/ufs-qcom.c:382: warning: Function parameter or member 'rate' not described in 'ufs_qcom_cfg_timers'
   drivers/scsi/ufs/ufs-qcom.c:382: warning: Function parameter or member 'update_link_startup_timer' not described in 'ufs_qcom_cfg_timers'
   drivers/scsi/ufs/ufs-qcom.c:1732: error: Cannot parse struct or union!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_RPMHPD
   Depends on [n]: QCOM_RPMH [=n] && QCOM_COMMAND_DB [=y]
   Selected by [y]:
   - GKI_QCOM_CLKS_CONFIGS [=y] && ARCH_QCOM [=y]


vim +252 drivers/scsi/ufs/ufs-qcom.c

   247	
   248	/**
   249	 * ufs_qcom_host_reset - reset host controller and PHY
   250	 */
   251	static int ufs_qcom_host_reset(struct ufs_hba *hba)
 > 252	{
   253		int ret = 0;
   254		struct ufs_qcom_host *host = ufshcd_get_variant(hba);
   255	
   256		if (!host->core_reset) {
   257			dev_warn(hba->dev, "%s: reset control not set\n", __func__);
   258			goto out;
   259		}
   260	
   261		ret = reset_control_assert(host->core_reset);
   262		if (ret) {
   263			dev_err(hba->dev, "%s: core_reset assert failed, err = %d\n",
   264					 __func__, ret);
   265			goto out;
   266		}
   267	
   268		/*
   269		 * The hardware requirement for delay between assert/deassert
   270		 * is at least 3-4 sleep clock (32.7KHz) cycles, which comes to
   271		 * ~125us (4/32768). To be on the safe side add 200us delay.
   272		 */
   273		usleep_range(200, 210);
   274	
   275		ret = reset_control_deassert(host->core_reset);
   276		if (ret)
   277			dev_err(hba->dev, "%s: core_reset deassert failed, err = %d\n",
   278					 __func__, ret);
   279	
   280		usleep_range(1000, 1100);
   281	
   282	out:
   283		return ret;
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
