Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01227443F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710437081; cv=none; b=RMnkcO6hKR1jB8ZQMscnnSmYqA4J6ukU7oKSbYlpHSrHoINcE4b+bF9xxiXZMjID16osR8D2WIoIAOw9AiIdgSxPg8QGg8JS5cFYpwOA+NaSXZjpQYeUv6kUaBKrNxTgeHdDHH2gSOnw/7yI/rUNWgdffAX8kT2AtUmi8CRt6/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710437081; c=relaxed/simple;
	bh=+4Qho6fRT6kufNtYFrHuWeTs2XLbqDKZi81hbuhDWUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iifYW8TiP+QnmvCtbfvdDcQhlweWouCFG34i7DQXxavmybCkDMg5S+a4Irg4DZKZUzseK+K+eSlTuWoQciptj7Mbaewx1O6GYeXjJhjlnuNaGf7ORshmsO5iDr5zJRWoi4OQbEXFd+Rnuxt0yt/vXKkl6OLYwqVyeUacx0PloVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9G9ZtTS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9G9ZtTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710437079; x=1741973079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4Qho6fRT6kufNtYFrHuWeTs2XLbqDKZi81hbuhDWUc=;
  b=J9G9ZtTSPE64/UDDkq8BQ2YaGfwY6+Daxk30d7VXXlw5MpTdRtBXACei
   3x5j9RtdChS8TZ8bK9KsEpZKjVD/DK/cRSO7MRkZb95otL/GdpBXc9/P0
   83ZGdLP6inVonOTKYHW4KZURP/qaXLkOJ4VriqD/g/ykQwMyr8Djum2qC
   YyDLy8TX5jkbj2AfGRrxkVyRe0czQ1YtMSa3w4LiIxuofqU/Fyq+8IFt8
   4G9+ckBPr7dF9lAf4uAhfrPOLZbJzb34j78SJ2Uf+9bqVCYPEf3Tf/xQu
   YW6yi5XTYlkpBCmSlwuJy74+31juOzf06SsDnJk3g37L9BhBMRRLyZcGZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="8212951"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="8212951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 10:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="43280604"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Mar 2024 10:24:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkool-000Dej-1d;
	Thu, 14 Mar 2024 17:24:35 +0000
Date: Fri, 15 Mar 2024 01:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9280/9323]
 drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member
 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202403150150.1hlKchWk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ae44d91f8f9407421a928bbbe95ae74059c4c2db
commit: f5a5187f7ea13f11dee77d4bd6ab2d4e367cd153 [9280/9323] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240315/202403150150.1hlKchWk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150150.1hlKchWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150150.1hlKchWk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member 'intr_num' not described in 'xhci_sideband_create_interrupter'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]


vim +282 drivers/usb/host/xhci-sideband.c

fb897bf907b803 Wesley Cheng  2024-02-01  263  
1415683defb2a1 Mathias Nyman 2023-02-06  264  /**
1415683defb2a1 Mathias Nyman 2023-02-06  265   * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
1415683defb2a1 Mathias Nyman 2023-02-06  266   * @sb: sideband instance for this usb device
1415683defb2a1 Mathias Nyman 2023-02-06  267   * @num_seg: number of event ring segments to allocate
1415683defb2a1 Mathias Nyman 2023-02-06  268   * @ip_autoclear: IP autoclearing support such as MSI implemented
1415683defb2a1 Mathias Nyman 2023-02-06  269   *
1415683defb2a1 Mathias Nyman 2023-02-06  270   * Sets up a xhci interrupter that can be used for this sideband accessed usb
1415683defb2a1 Mathias Nyman 2023-02-06  271   * device. Transfer events for this device can be routed to this interrupters
1415683defb2a1 Mathias Nyman 2023-02-06  272   * event ring by setting the 'Interrupter Target' field correctly when queueing
1415683defb2a1 Mathias Nyman 2023-02-06  273   * the transfer TRBs.
1415683defb2a1 Mathias Nyman 2023-02-06  274   * Once this interrupter is created the interrupter target ID can be obtained
1415683defb2a1 Mathias Nyman 2023-02-06  275   * by calling xhci_sideband_interrupter_id()
1415683defb2a1 Mathias Nyman 2023-02-06  276   *
1415683defb2a1 Mathias Nyman 2023-02-06  277   * Returns 0 on success, negative error otherwise
1415683defb2a1 Mathias Nyman 2023-02-06  278   */
1415683defb2a1 Mathias Nyman 2023-02-06  279  int
1415683defb2a1 Mathias Nyman 2023-02-06  280  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
f5a5187f7ea13f Wesley Cheng  2023-05-09  281  				 int intr_num, bool ip_autoclear)
1415683defb2a1 Mathias Nyman 2023-02-06 @282  {
1415683defb2a1 Mathias Nyman 2023-02-06  283  	int ret = 0;
1415683defb2a1 Mathias Nyman 2023-02-06  284  
1415683defb2a1 Mathias Nyman 2023-02-06  285  	if (!sb)
1415683defb2a1 Mathias Nyman 2023-02-06  286  		return -ENODEV;
1415683defb2a1 Mathias Nyman 2023-02-06  287  
1415683defb2a1 Mathias Nyman 2023-02-06  288  	mutex_lock(&sb->mutex);
1415683defb2a1 Mathias Nyman 2023-02-06  289  	if (sb->ir) {
1415683defb2a1 Mathias Nyman 2023-02-06  290  		ret = -EBUSY;
1415683defb2a1 Mathias Nyman 2023-02-06  291  		goto out;
1415683defb2a1 Mathias Nyman 2023-02-06  292  	}
1415683defb2a1 Mathias Nyman 2023-02-06  293  
1415683defb2a1 Mathias Nyman 2023-02-06  294  	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
f5a5187f7ea13f Wesley Cheng  2023-05-09  295  			num_seg, intr_num);
1415683defb2a1 Mathias Nyman 2023-02-06  296  	if (!sb->ir) {
1415683defb2a1 Mathias Nyman 2023-02-06  297  		ret = -ENOMEM;
1415683defb2a1 Mathias Nyman 2023-02-06  298  		goto out;
1415683defb2a1 Mathias Nyman 2023-02-06  299  	}
1415683defb2a1 Mathias Nyman 2023-02-06  300  
1415683defb2a1 Mathias Nyman 2023-02-06  301  	sb->ir->ip_autoclear = ip_autoclear;
fb897bf907b803 Wesley Cheng  2024-02-01  302  	/* skip events for secondary interrupters by default */
fb897bf907b803 Wesley Cheng  2024-02-01  303  	sb->ir->skip_events = true;
1415683defb2a1 Mathias Nyman 2023-02-06  304  
1415683defb2a1 Mathias Nyman 2023-02-06  305  out:
1415683defb2a1 Mathias Nyman 2023-02-06  306  	mutex_unlock(&sb->mutex);
1415683defb2a1 Mathias Nyman 2023-02-06  307  
1415683defb2a1 Mathias Nyman 2023-02-06  308  	return ret;
1415683defb2a1 Mathias Nyman 2023-02-06  309  }
1415683defb2a1 Mathias Nyman 2023-02-06  310  EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
1415683defb2a1 Mathias Nyman 2023-02-06  311  

:::::: The code at line 282 was first introduced by commit
:::::: 1415683defb2a1f23ea70f1038bf6f4ddc715018 FROMLIST: xhci: sideband: add initial api to register a sideband entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
