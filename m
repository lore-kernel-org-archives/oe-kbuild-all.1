Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2311208D7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082242; cv=none; b=MkOtRIcoC4E+MG/XvybR8TMoCoHTtgWXPaJTQ11m7HhwBS9UUU3pCj64HlZ2cseW46kw18VIeUNYc23mvenl3MO1dT4e5hufvBct6EUdWs3w1QWhbql8OneMabwcpZhygSy69Kkyyf9PZTijnjhJ85n17eDDxbfqhT391nfatiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082242; c=relaxed/simple;
	bh=f4/FLoFwPiLhqCpB8MPvd2FnVLMDXxFpd9ayNIyV1mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcZZvg/WEdLMZW7CB9reQtKm30N+wHfm3ZDNkY5jjCaItgdUgB1ddUxzRx3bbJmJ2z+3oH/PpV1cm1nhG+Tks3acDN79rFvCaTQkqoC0jI3RWpnBXBPy4dnEIZzmyZnWkSdljYzqwBQ4QDOYFdqmVw8AN5a2YDzOznjtr70EsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLFvOjUJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLFvOjUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729082241; x=1760618241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f4/FLoFwPiLhqCpB8MPvd2FnVLMDXxFpd9ayNIyV1mo=;
  b=TLFvOjUJaqCkDHkPrcsR2UVq2l9O7AFrVQsVcyW4HKwDgJQ6yKZ82x6O
   vhlYishjHjuoYFkGKcifkMzOBXtY5vWfi853nh40vuFnCI2Bh9Q8AWu85
   ++mk4IzTR/+/aGTvDKFxqL0rIYGTSY4iu+FJ37WjVimomVkWxrsCSgU8i
   fSP/GJwkLVSIPFV1LADgG7fIulAuJOwkb2GCT0y7rzyy5eUxwvaQ79IMQ
   6Ft5uhKoCOJyhLivv9TcAt8y16mTp3Bzakh7zXU2TECnX++8/H1GzWDee
   LvDW0lkVJ/1JyVr5teBWDUE2e6EhKICh29BKcdFTUh8wqLPTTbEiuBWQM
   Q==;
X-CSE-ConnectionGUID: mi8G1KJMRgaWSAvQAQgiCg==
X-CSE-MsgGUID: GNX1d0DyQ2C3HtEyOOwxIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39915442"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="39915442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 05:37:17 -0700
X-CSE-ConnectionGUID: IqQWJyZcSGCCk7Y0xghm7w==
X-CSE-MsgGUID: ozfm8H7UQx2KxJ09/5lAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78270984"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2024 05:37:15 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t13H6-000Ktn-24;
	Wed, 16 Oct 2024 12:37:12 +0000
Date: Wed, 16 Oct 2024 20:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3104/30000]
 drivers/scsi/ufs/ufs-qcom.c:252: warning: Function parameter or member 'hba'
 not described in 'ufs_qcom_host_reset'
Message-ID: <202410162022.hqHRmLwj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   425419e5b2a8c88096b8bbc61d8865600d1a91c0
commit: 5b3f757aa44c55e4a4551cb41f38b0bb28ee738f [3104/30000] UPSTREAM: scsi: ufs-qcom: Add reset control support for host controller
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410162022.hqHRmLwj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410162022.hqHRmLwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410162022.hqHRmLwj-lkp@intel.com/

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
