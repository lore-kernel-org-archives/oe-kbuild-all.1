Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793522604;
	b=wHBB7s1+9/JT86VqkonNpJ1PYrbw1XzF+sWI6Zd/dI/0F4yByySDcaUfh1RXBDYTDFh3
	 4298pofjAp9i2NOrkc2xf++RGTGd7B4GVy3CbfFygTId+nQbYKL/ltBd6jNE7Q9exIjN6
	 LDQp4Kdi+7XYwSXSV97iDEcv+ovGu67dDvoA2YprtUL9NVrE8axBLoKL9bA0yvhN13hli
	 fnjOby6uHbskrfmSBDu9yWhBHExp/Ykk+Oyx49VC/W3olXJzX6Ky/uKxXBdD6Lp4WDjl3
	 7Boo385gihJiqzW+bxdH5ZjT2biztK5J8s5oLwy7G0VDo0NpzZwRdyqCGQmZIiekBQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522604;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/Q71XgtKU0kJTxzt2JLYw/02X8B2Sjr9l+sJ+U1eICw=;
	b=Blvog9X5pppHVzTp3ZdUIRDRyxe1QFgpdIBEZT2lZ+hiCnr1YXQM/VgdfbKlLsazRiG1
	 WnuIl0xN8hqmfBx1hXrfbwzQEN2mUibkPTdVlS8Ga6+udSrX6RN5vmM7v5h5gvuoz9BqI
	 30N0Tn/MapSgNo3XmI1E12TH+dGJzpq7QZGgKpSlh4jNYVwqFmaCUwOxlM3sQVevc55Mh
	 RgodUFUenSxb4yFlmbDMdFAZo6zTHTAcTGdelZOXDA+eXKyNYfr+gLiecQm9lpFQXFagf
	 /KKKVXO0f+MNl6YkDEchIG2mX2CicmWBf5waJycngmEzVH7VvuqfDrkHR6zyVM1JDyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tb+z1YDW;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56588606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 08:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56588606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tb+z1YDW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793522602; x=1825058602;
  h=date:from:to:cc:subject:message-id;
  bh=wKhuUn2c3l6CXF5ASG50kiUDT1R8Cug9whiSfxxyxE4=;
  b=Tb+z1YDWrvr3ms9fXx4AIvzhZit8o6QTme9Ut12UtlgFpPcpBacjrq2g
   V1CEWs/kdc09IGt67elRpNmXscEdkXqxW01KvBZ6jjSSMVQFo27oxCqFj
   RywYAWm23JtxlIxhCtW9QJRp4q1L1G/Lk22vexGRJBmNoHh4LBOEyABNw
   t7H8DbZzyidKaCiNMfaeKXtoMWBAYp7eelcFCVgiTXsJu6oDFzbMCO9U4
   bP1g1i+2tV+HsXrMH9PbSk1etEYm28X/3Pr/Kk2byIstAog+2FDKbaR5M
   v/wf/HtvmvgYmUTTZ4pcNvWTn4qDLAda8ZiKO/Z91FTm7n71o1VsgapHS
   Q==;
X-CSE-ConnectionGUID: GockDSeYSDGjcYrXabTn+A==
X-CSE-MsgGUID: OffxmoccT6u2gaCdxw9cQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2223776"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2223776"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 01:43:22 -0700
X-CSE-ConnectionGUID: HhNpmJ/ITCeOQrgG5bOITA==
X-CSE-MsgGUID: IHK+ZIuIRUmxmI9RrR83Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="5812713"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2026 01:43:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNR9q-000000006Pb-0HQa;
	Sun, 01 Nov 2026 08:43:18 +0000
Date: Sun, 01 Nov 2026 09:42:43 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] kismet: WARNING:
 unmet direct dependencies detected for VFIO_DEVICE_CDEV when selected by
 VFIO_PCI_LIVEUPDATE
Message-ID: <202611010921.Kcgc7xpT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   72211702f642336d084c9cb7a986b6c351449c6f
commit: b22e2aa1153bf380cf38c1b0026e7e0a5beac1c8 [842/842] anolis: vfio/pci: Select VFIO_DEVICE_CDEV for vfio pci liveupdate
config: x86_64-kismet-CONFIG_VFIO_DEVICE_CDEV-CONFIG_VFIO_PCI_LIVEUPDATE-0-0 (https://download.01.org/0day-ci/archive/20261101/202611010921.Kcgc7xpT-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611010921.Kcgc7xpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010921.Kcgc7xpT-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_DEVICE_CDEV when selected by VFIO_PCI_LIVEUPDATE
   WARNING: unmet direct dependencies detected for VFIO_DEVICE_CDEV
     Depends on [n]: VFIO [=y] && IOMMUFD [=n] && !SPAPR_TCE_IOMMU [=n]
     Selected by [y]:
     - VFIO_PCI_LIVEUPDATE [=y] && VFIO [=y] && PCI [=y] && MMU [=y] && VFIO_PCI [=y] && PCI_LIVEUPDATE [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
