Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAC4221FA0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 02:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592032; cv=none; b=e4ba7CFansde8Apr5H1pnpbdbly7atSuBOffw6RBYCkf2bZ3rOIiDWSwgy6f6dVqymOCm2XRx1vN/HuPdQhBgZLoEg2Z5RyJL/zP2j7ArBZGO6TPTL6SIIg7x8GnMnC4lU/GsGGocc86IEgjOrfuldm/i5g1/fEAkogXESfsUI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592032; c=relaxed/simple;
	bh=mzyRdeH2zQfd8zVow/fs4OSMEIBIPmWz+lOanolG17s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NEWYTKePG6IRNS1NhFyqPj+oup/JtP27OwGQhgGlPfhV761cSo0B+axYgywK1YLhCXyHOhpdMsoHB9xtxCqWMMCO2BTxF2lI8Jzfaa193AqQfZtkOL3FjlIRGuAxyqawNPlkPTUmzmXUESa051mbl0fPh/DrSc3VNGcNy2U4cL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qy+u7jQS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qy+u7jQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765592031; x=1797128031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzyRdeH2zQfd8zVow/fs4OSMEIBIPmWz+lOanolG17s=;
  b=Qy+u7jQSXezCF0592y1JJdmpLA/rScZ0bZWZgBoXj/YsB1FjPs3wyooV
   K4bzrYu49HDI4BjoDjD102HNA5IW4maASgom8R6hgGlRvdTzqoouga5LG
   QtZhRySzHh87YtasIkLG+oIFVG/oCd+o3teXDXiZN4l3oxpu89p4Ce3aB
   xxc062uFY3zJrSi6dp/sKkYOrcOhCGS+WA/quDhG2FCH1VH/5bIEBl/Hj
   eMvgUgiktflwT1IVI211s9Uc9sLeulW8mgCA8tLqTEDKWwcEvOOg4OKR9
   5k6l9rS3aZA0AiPHANlprS6PzX+DfXMWPiUFUL9i3YbBdcmjunrAJbDFe
   Q==;
X-CSE-ConnectionGUID: iDmGByj1QlSAL4+ZKSyhlg==
X-CSE-MsgGUID: 1xV0pA6+TK24Iyv9ZA+MHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67634314"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67634314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:13:50 -0800
X-CSE-ConnectionGUID: 4mIQkvsxRlKuB2kWnNy3NQ==
X-CSE-MsgGUID: E2ddqCnIRZy3AoNouR1kVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="234632416"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 18:13:49 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUF8k-000000006uv-1X2t;
	Sat, 13 Dec 2025 02:13:46 +0000
Date: Sat, 13 Dec 2025 10:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/2]
 drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member
 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202512131008.jY8JQLUP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wesley,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: f5a5187f7ea13f11dee77d4bd6ab2d4e367cd153 [0/2] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: i386-randconfig-011-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131008.jY8JQLUP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131008.jY8JQLUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131008.jY8JQLUP-lkp@intel.com/

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
