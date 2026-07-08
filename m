Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE773B8D41
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540284; cv=none; b=K/srZOnDILOms/fQ1RqWhU0wwiaO+V6dkghd31jUWdcpsIXaq44z+bgwMAt1XMypbSW7h0MU7IJ+mQLZH/6lC7Ajx8Xda+YmIeTrM+OrLJDPKFtrVd+tNiVjMWiJMhkGU6kysaJFRHf6i1A2ffCByhTDHWOzTb4ra8c7MXxub1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540284; c=relaxed/simple;
	bh=sOn5wa94AgBwNB0vZrJUvVDvvahI1IheX7eQTbwyQxM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cAUPyWtzvAyTS5VJQHpJ9eWjSutdMkgB37zia6YMsZPad4qdPmXwUjyPRMEp4zFRFl7EMhrKOLu9O+YZ3KYXDUUpWVtb6JWPDzpbws35KsoHjANyQIk7PMmwzLL8ElI540tlwWi8CQz8v0MRHvnuaP/eJWQKGVBkCcaNQUAZEmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X81tuyZC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X81tuyZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783540282; x=1815076282;
  h=date:from:to:cc:subject:message-id;
  bh=sOn5wa94AgBwNB0vZrJUvVDvvahI1IheX7eQTbwyQxM=;
  b=X81tuyZCHy/k2+08mD0S2+AmC+rwOUhLxxpbkJbmd4FndYlVMxTSjBkm
   KIQGvYR9Z/mL0pVn9sx4JfLvP6DCWUKla57JAhnSRkhAXx/omRVah3yZL
   Y/h9bYGOWnsuMOOZa8CnNKjForV/7/8DhUB7QBZAOcNFDUXf6+l1K7JXg
   M/U7ENP6LsePdzmf13hKv9UZO481yQTR9tgX7MClBMtBC0v8pAtGJBvw9
   WMFUXIk+Khxd3heVZ2Lc6MTH3zR11yo7AlKP6V7raAVdCWd3s54SfY9Yn
   xR9YeuWrVPoslaaIEkE2e4VHS4amImS95fyHZhaC6FaRActKjFZMsYoCw
   w==;
X-CSE-ConnectionGUID: 7vlAGrLZRreQrO7AOgu11A==
X-CSE-MsgGUID: JX8MdJL3Qe+uJP2nU6GJrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94823203"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94823203"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:51:22 -0700
X-CSE-ConnectionGUID: TKmn9tUgRvKYgtteiusVfQ==
X-CSE-MsgGUID: QqGxCw1vTSip4abSGKaDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277603925"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2026 12:51:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whYIf-00000000Gnp-2n1o;
	Wed, 08 Jul 2026 19:51:17 +0000
Date: Thu, 09 Jul 2026 03:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202607090352.d0Mdrdsp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mathias,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6417b973d924236b080ef26fbfee42586a7b3704
commit: 7b946a32948f90b198e3e51c824576458ceda3a4 [1/1] FROMLIST: xhci: sideband: add initial api to register a secondary interrupter entity
config: x86_64-buildonly-randconfig-002-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090352.d0Mdrdsp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090352.d0Mdrdsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090352.d0Mdrdsp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:345: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'


vim +263 drivers/usb/host/xhci-sideband.c

   244	
   245	/**
   246	 * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
   247	 * @sb: sideband instance for this usb device
   248	 * @num_seg: number of event ring segments to allocate
   249	 * @ip_autoclear: IP autoclearing support such as MSI implemented
   250	 *
   251	 * Sets up a xhci interrupter that can be used for this sideband accessed usb
   252	 * device. Transfer events for this device can be routed to this interrupters
   253	 * event ring by setting the 'Interrupter Target' field correctly when queueing
   254	 * the transfer TRBs.
   255	 * Once this interrupter is created the interrupter target ID can be obtained
   256	 * by calling xhci_sideband_interrupter_id()
   257	 *
   258	 * Returns 0 on success, negative error otherwise
   259	 */
   260	int
   261	xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
   262					 bool ip_autoclear, u32 imod_interval)
 > 263	{
   264		int ret = 0;
   265	
   266		if (!sb || !sb->xhci)
   267			return -ENODEV;
   268	
   269		mutex_lock(&sb->mutex);
   270		if (sb->ir) {
   271			ret = -EBUSY;
   272			goto out;
   273		}
   274	
   275		sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
   276							   num_seg, imod_interval);
   277		if (!sb->ir) {
   278			ret = -ENOMEM;
   279			goto out;
   280		}
   281	
   282		sb->ir->ip_autoclear = ip_autoclear;
   283	
   284	out:
   285		mutex_unlock(&sb->mutex);
   286	
   287		return ret;
   288	}
   289	EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
   290	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
