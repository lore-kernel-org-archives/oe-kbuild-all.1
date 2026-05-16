Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A620405C38
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778928156; cv=none; b=Rv5lNwdZ0tc2EBdD3NkIYU+NXZ8Fiy2GF0RT+nHUAq6lV2wplluT6Xz4s1iJetmU7D1EJc9K355EObJjpsjYiPtgYpERobC1Rup0M/XGniLTCl26wsRupHTDYbx4o5OQYshFqKj4had0+urzElWtK5OCtC/e16Jl3tMNvjhifX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778928156; c=relaxed/simple;
	bh=jzZmKhT709G6fUR8GrZ+4PQ9HUze3bJ4b8B7rxOIRNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pxF6SRLtYtNUeaz41lRG2y/YGD+JRnbLvJwWX59ydbCrcH/5UIfJENPOWF7UnCWQ8sERzkTll4oGraJU+U4EdjeifZpzcp/8+6+qK9oqPGf9ltV6wWmQmxUXcYA0Q/Gijan8SklB1aR4skkhzO/x0Zs2wz8Bhnhyy7LuXckMKMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw3dh0gN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw3dh0gN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778928155; x=1810464155;
  h=date:from:to:cc:subject:message-id;
  bh=jzZmKhT709G6fUR8GrZ+4PQ9HUze3bJ4b8B7rxOIRNg=;
  b=Xw3dh0gNRe1bCJl3+AG+cE+JCBc2zG4INbFQoMJGZQ6gOjiD1T3OQzOo
   ERVwdpG02AxOtk+sg6h3QUyoq+/vmIWvhZu7rFb4ZmPkP95DxyAnTFVOv
   jEstYRVfrjWKDHoyKE/07YocGyUPIOBbWV8DbmrlA9mc2DPdCd6kkBqK9
   NZo+G3N2Q/6d/fh94Pw0PpcGFatIPUn7tjfKc1+l2TiDNTRNSRetVhSdZ
   AlzNYvuS/U32BIfrwLGUA733VeGIC2OC2NJlVzXSeUGYKDZm5CvKOmn+A
   mBlgvKpd36WeVv0mBqAlHh7d5RnjW4HWNcS2T9a7RdCLW1HdyTYA8T1FD
   A==;
X-CSE-ConnectionGUID: edSkXf1nRky6ATLP3hlzeA==
X-CSE-MsgGUID: pEBrOvj4QeGRvM6WiIOH3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90443316"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90443316"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 03:42:34 -0700
X-CSE-ConnectionGUID: vAhFlXjWSjiXo0t2zw/3Ng==
X-CSE-MsgGUID: mB5Jri7rT6CWII/amB5kqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="239192264"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 May 2026 03:42:33 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOCTW-000000000jh-2Q2X;
	Sat, 16 May 2026 10:42:30 +0000
Date: Sat, 16 May 2026 18:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 12/19] Warning:
 drivers/hid/hid-magicmouse.c:600 expecting prototype for struct vendor.
 Prototype was for struct tp_header instead
Message-ID: <202605161829.YYdkc8rc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   4a7734273fefe8146bc62984df580ebdb26da586
commit: a498e13b2aec5e4038b41b71bf2965030d43b6f5 [12/19] HID: magicmouse: Add MTP multi-touch device support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605161829.YYdkc8rc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161829.YYdkc8rc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161829.YYdkc8rc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-magicmouse.c:600 expecting prototype for struct vendor. Prototype was for struct tp_header instead
--
>> Warning: drivers/hid/hid-magicmouse.c:615 expecting prototype for struct standard. Prototype was for struct tp_mouse_report instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
