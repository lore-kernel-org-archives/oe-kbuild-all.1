Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDDE377ABF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709204; cv=none; b=ebELPSPsQjG5snJQjWMfaOeOE1+3I5W26cpWMD4XazTOBFZQ/EescFkElXLs43nPG7bGOyrusEyNHtOapMZZGAnjUExTw8SDFpcdVl4F1Ddi/m/91//mZP1DQjH9BwyDNOwv6EUrUzVFF8annKfAyB+pc2NENpa4z3RGU2KkbBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709204; c=relaxed/simple;
	bh=lMrCHMMgg6J15SXcG0CBUv4Ri4srVuuRuqijljkPCj8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MChjRJ1w8F6IMOL4cbVnTerz47XQ7VA2lVvAgg2Azs5q78AwKfrVPyjpjzI6IphQ03oTlvLoR+hrylVcYCp2QzUBcQEiQR5ffm0RGy3S75jrc+xO4+GSf2C6GwwXf+HdyKg1hKyMXpD0jdAYyJrRsDjuMS6jzZyHOOKxs4qpJ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InKw6kYy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InKw6kYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786709203; x=1818245203;
  h=date:from:to:cc:subject:message-id;
  bh=lMrCHMMgg6J15SXcG0CBUv4Ri4srVuuRuqijljkPCj8=;
  b=InKw6kYyjwQgvxhJJDpwlLZqgLmdQfr3VbWkSxpbLQ7VjYSsLp4juvsl
   ZT7eQTPmaeAJDLXe0O0hwCM9c+TQg52qo+wgrY0yYLd3Tamfb+dUofwOn
   FXR98AwVO1GggdqSqViaMgNYbYc7JiUtvaDDGctwuX1LLnHEvwYFjMDFJ
   ruMs4WXOSYLHTShQxi0gA6LbKdGK+U6i0dUzjLDO+HzKs1suM3ogXgrg2
   YJz9ht97aG9DbXRVANvXDMDWubfQm3KYe9AUIZwue3J7j+5H+8fYtUtPT
   1UxCUiHkpdJUYPLILpFWmKWsQVMuOvtvtUjcEEs3E8ABUP2CbjyKVPgl+
   Q==;
X-CSE-ConnectionGUID: ctUPByk4RdqAlbl7EtsUSA==
X-CSE-MsgGUID: D1473IKBRYue20i36lTnzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97632339"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="97632339"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:06:43 -0700
X-CSE-ConnectionGUID: RrWAl+xqSHa9oCvKwIHx/Q==
X-CSE-MsgGUID: 4sdwg+l/SxCsi0LaOB9ySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260938853"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 05:06:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuqgI-000000006F9-2Qz5;
	Fri, 14 Aug 2026 12:06:38 +0000
Date: Fri, 14 Aug 2026 14:06:38 +0200
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: drivers/usb/core/port.c:870:28: warning: unused variable
 'hdev'
Message-ID: <202608141427.Oj0XHzid-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/device-property-Add-fwnode_graph_get_port_by_id/20260810-180652
head:   20b35e3024ac4ade79a06edafe28ac1c11fbfa39
commit: 056bd785ec4c37b778ebd000fc1ead535aa7ed99 usb: hub: Associate port@ fwnode with USB port device
date:   4 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260814/202608141427.Oj0XHzid-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141427.Oj0XHzid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141427.Oj0XHzid-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/core/port.c: In function 'usb_hub_remove_port_device':
>> drivers/usb/core/port.c:870:28: warning: unused variable 'hdev' [-Wunused-variable]
     870 |         struct usb_device *hdev = hub->hdev;
         |                            ^~~~


vim +/hdev +870 drivers/usb/core/port.c

   867	
   868	void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
   869	{
 > 870		struct usb_device *hdev = hub->hdev;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
