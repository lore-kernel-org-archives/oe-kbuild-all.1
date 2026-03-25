Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F62FFFB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774419044; cv=none; b=KKn4zlt9NIHXl7OlvqxHurkD38AK8HDtUgAjQ98AbcXmB5urYomdurTnXqChGJX5HeDMiGMh8vY+HAYtNxEr4IVUIM1xr4lYIEglSzumDN2ZlSta0hU40nxu7h/ni0K20wd6tcxt8raT25zd1JdThVgS772GuHMy8nFaSMX39Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774419044; c=relaxed/simple;
	bh=vlLRe3GCIrOtR9psl2LtKpUHx9J489hp+C1ceh7OOGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G3bKTlgLnWiJ07v/jzz0OqbOaiYr81KEJy0GUQzlDZMKldP2rVdwBRKmAKBGRA282cvFPa1oBjsQKIhW5S01AqPlKHRlhaE4sTQyjNiFxpdQiaytJXepmdHeLrnI6Xz1Ww/3QLUF17s8UyIJqVASsPC6WAZTdcVyNe21JgNL+uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDkarjrT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDkarjrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774419042; x=1805955042;
  h=date:from:to:cc:subject:message-id;
  bh=vlLRe3GCIrOtR9psl2LtKpUHx9J489hp+C1ceh7OOGk=;
  b=fDkarjrTyNVNQ2Wd+D48qvWlYshNAxeSQx2VW42qqSpwlAj4T0wNK3fL
   fLWndeEh67ydIH1TI6vL6sA4dYicpVoTp85kI1EwS+0Xpwwlk5lVCSzwy
   LAzQ0bpND60HK7xBzRJ1rOTek1U75m9q4e0vU58eK5zC8mmk7Ar0h/Yxw
   SjhYb8xyVn1JV2qVNdUGNqkS+4XktmGXCns4BtO9Y7WXTt0bgXFszxrMY
   sUw90MK3pd+uQVsvOhpxYisiuv7JBbRyPWXlA/hUg63sidK6y9w9ZNINX
   v+gCJ9ia4nVLWhMBwKwNfNGYu3SSUtfKczTHmverVTc4FUwGddVA/nrGq
   g==;
X-CSE-ConnectionGUID: tQ9mk1TsSHukUAyP/N4fKg==
X-CSE-MsgGUID: FKLA0b/sQ7OB7kNciEBHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100897021"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="100897021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:10:41 -0700
X-CSE-ConnectionGUID: SZToVi8EQWGZlKJTuPtMJA==
X-CSE-MsgGUID: udRqIpDESAaPiqxmGXUaSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="218000590"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Mar 2026 23:10:40 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5HRt-000000006HR-2EkB;
	Wed, 25 Mar 2026 06:10:37 +0000
Date: Wed, 25 Mar 2026 14:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member
 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202603251451.xkgyyME1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wesley,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: f5a5187f7ea13f11dee77d4bd6ab2d4e367cd153 [1/1] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: i386-randconfig-015-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251451.xkgyyME1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251451.xkgyyME1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251451.xkgyyME1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member 'intr_num' not described in 'xhci_sideband_create_interrupter'


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
